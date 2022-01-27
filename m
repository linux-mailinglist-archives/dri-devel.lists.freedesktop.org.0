Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D71749DC66
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 09:18:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB4E510E527;
	Thu, 27 Jan 2022 08:18:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B20A10E319;
 Thu, 27 Jan 2022 08:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643271501; x=1674807501;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=eXBkGgw60bdFoIyLSIRLyrUbjMrn4EVCKvo0GitUMPk=;
 b=UEuqe+qCJt/6GADEvM2cdIOTBQuLGVvQxz7tYs4NrZe+ET6ZBgWIpywZ
 GcbxW9TDrv6YMoZNjI1ufqjsSZoiIMTQYteycd3q/D5qvFuvamXH1yd0D
 UYzt9UMDeCsEQjeZ9Lur/0AIDSlCjuMX69cYWdK30S4HI952NTWosHapD
 +KDe/W7a4/O2ucJPc2DDiCg7wZiTO95A8x6hKwkV1YzeWYnPZwmCAJaww
 aR3iVLMw2J16o0eU5dMf7ZeEqojHStB9HTVApRwIMZKQ1GkV+I7MwBe4L
 kliDD3yGTpuYWoqalqyIfd/WI+1PdpT3dKEjNwdWG+pfMgxY4iYsO1stL Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10239"; a="226758640"
X-IronPort-AV: E=Sophos;i="5.88,320,1635231600"; d="scan'208";a="226758640"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2022 00:18:11 -0800
X-IronPort-AV: E=Sophos;i="5.88,320,1635231600"; d="scan'208";a="521125802"
Received: from anithaha-mobl.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.212.224.126])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2022 00:18:10 -0800
Date: Thu, 27 Jan 2022 00:18:10 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Subject: Re: [Intel-gfx] [PATCH 02/19] dma-buf-map: Add helper to initialize
 second map
Message-ID: <20220127081810.6zt6cyib4s7kpa6f@ldmartin-desk2>
X-Patchwork-Hint: comment
References: <20220126203702.1784589-1-lucas.demarchi@intel.com>
 <20220126203702.1784589-3-lucas.demarchi@intel.com>
 <f0dbdcc0-13b5-c484-0bf3-a1f8c3e48954@amd.com>
 <20220127075728.ygwgorhnrwaocdqv@ldmartin-desk2>
 <3066c6a7-fc73-d34d-d209-a3ff6818dfb6@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3066c6a7-fc73-d34d-d209-a3ff6818dfb6@amd.com>
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

On Thu, Jan 27, 2022 at 09:02:54AM +0100, Christian König wrote:
>Am 27.01.22 um 08:57 schrieb Lucas De Marchi:
>>On Thu, Jan 27, 2022 at 08:27:11AM +0100, Christian König wrote:
>>>Am 26.01.22 um 21:36 schrieb Lucas De Marchi:
>>>>When dma_buf_map struct is passed around, it's useful to be able to
>>>>initialize a second map that takes care of reading/writing to an offset
>>>>of the original map.
>>>>
>>>>Add a helper that copies the struct and add the offset to the proper
>>>>address.
>>>
>>>Well what you propose here can lead to all kind of problems and is 
>>>rather bad design as far as I can see.
>>>
>>>The struct dma_buf_map is only to be filled in by the exporter and 
>>>should not be modified in this way by the importer.
>>
>>humn... not sure if I was  clear. There is no importer and exporter here.
>
>Yeah, and exactly that's what I'm pointing out as problem here.
>
>You are using the inter driver framework for something internal to the 
>driver. That is an absolutely clear NAK!
>
>We could discuss that, but you guys are just sending around patches to 
>do this without any consensus that this is a good idea.

s/you guys/you/ if you have to blame anyone - I'm the only s-o-b in
these patches. I'm sending these to _build consensus_ on what may be a good
use for it showing a real problem it's helping to fix.

 From its documentation:

  * The type :c:type:`struct dma_buf_map <dma_buf_map>` and its helpers are
  * actually independent from the dma-buf infrastructure. When sharing buffers
  * among devices, drivers have to know the location of the memory to access
  * the buffers in a safe way. :c:type:`struct dma_buf_map <dma_buf_map>`
  * solves this problem for dma-buf and its users. If other drivers or
  * sub-systems require similar functionality, the type could be generalized
  * and moved to a more prominent header file.

if there is no consensus and a better alternative, I'm perfectly fine in
throwing it out and using the better approach.

Lucas De Marchi
