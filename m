Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B5F449DC05
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 08:57:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAEE010E42E;
	Thu, 27 Jan 2022 07:57:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4575C10E42E;
 Thu, 27 Jan 2022 07:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643270252; x=1674806252;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Ki0ykdkhJOf88ha9tOTvyUSb4E9LXGSO+yXsB3UEYNs=;
 b=RCdNhvfrhD9oUxL6rnus3/bwVvzY9kjQ4Uz5HvP1Ae6DOvbBAO7ahRqR
 3Cl2BDxiSEkkJmnyahyRIUahOPOnJjDMcGCtYyN2l0RUvKyy0W26KJ1Ye
 BW1xSSHLqhTVVu3TLSH3gZlcj1sgrQ0EQuWgGbz3jB8ze1p4d9rO4BmkY
 lbzCeVb7Hb4yphBbwp5oF3uN+O6cwBU/0daYq7X/tp8lB5vm3CfBNE/7U
 eaWnA8IZJNjFs/nZ4rne8GvqKJ4Hq+K0Ylea+XSPlzCn+wu5RKKUx1Cij
 iOTrv9ijg4DFZ4SkKtonXeI3nnj36UdpMDpG1QiJ9ZS+M8sme/pahqTKo Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10239"; a="226753882"
X-IronPort-AV: E=Sophos;i="5.88,320,1635231600"; d="scan'208";a="226753882"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 23:57:31 -0800
X-IronPort-AV: E=Sophos;i="5.88,320,1635231600"; d="scan'208";a="625131808"
Received: from anithaha-mobl.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.212.224.126])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 23:57:28 -0800
Date: Wed, 26 Jan 2022 23:57:28 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Subject: Re: [PATCH 02/19] dma-buf-map: Add helper to initialize second map
Message-ID: <20220127075728.ygwgorhnrwaocdqv@ldmartin-desk2>
X-Patchwork-Hint: comment
References: <20220126203702.1784589-1-lucas.demarchi@intel.com>
 <20220126203702.1784589-3-lucas.demarchi@intel.com>
 <f0dbdcc0-13b5-c484-0bf3-a1f8c3e48954@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f0dbdcc0-13b5-c484-0bf3-a1f8c3e48954@amd.com>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: linaro-mm-sig@lists.linaro.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 27, 2022 at 08:27:11AM +0100, Christian König wrote:
>Am 26.01.22 um 21:36 schrieb Lucas De Marchi:
>>When dma_buf_map struct is passed around, it's useful to be able to
>>initialize a second map that takes care of reading/writing to an offset
>>of the original map.
>>
>>Add a helper that copies the struct and add the offset to the proper
>>address.
>
>Well what you propose here can lead to all kind of problems and is 
>rather bad design as far as I can see.
>
>The struct dma_buf_map is only to be filled in by the exporter and 
>should not be modified in this way by the importer.

humn... not sure if I was  clear. There is no importer and exporter here.
There is a role delegation on filling out and reading a buffer when
that buffer represents a struct layout.

struct bla {
	int a;
	int b;
	int c;
	struct foo foo;
	struct bar bar;
	int d;
}


This implementation allows you to have:

	fill_foo(struct dma_buf_map *bla_map) { ... }
	fill_bar(struct dma_buf_map *bla_map) { ... }

and the first thing these do is to make sure the map it's pointing to
is relative to the struct it's supposed to write/read. Otherwise you're
suggesting everything to be relative to struct bla, or to do the same
I'm doing it, but IMO more prone to error:

	struct dma_buf_map map = *bla_map;
	dma_buf_map_incr(map, offsetof(...));

IMO this construct is worse because at a point in time in the function
the map was pointing to the wrong thing the function was supposed to
read/write.

It's also useful when the function has double duty, updating a global
part of the struct and a table inside it (see example in patch 6)

thanks
Lucas De Marchi
