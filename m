Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BDE8F5122B3
	for <lists+dri-devel@lfdr.de>; Wed, 27 Apr 2022 21:27:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C35D10E2A7;
	Wed, 27 Apr 2022 19:27:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6EE910E29C;
 Wed, 27 Apr 2022 19:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651087668; x=1682623668;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=I8aMud4Vby6i3Qcdkhb0tzxo8SgYYzTiICYQctpKef0=;
 b=WA6zPfrCjQiXyFEz50ONX7ThS2teGS9YZnbkFswWtWDtcILqd5fvy6cm
 FdXUWcsEr0YCasj/X1A9ItWRcS5ZbC+UUl3FPj1ys/tg5SOp8f0FdYAEC
 1ZXBSXRwWJKQvMrjsUHP7KEhBsnykR9/bgxYwKG314hPSyenNmcgeIhey
 E7NHgLAdOWx0z5Yy5sJ73Kmy3CTRxeF1Jiw7ZSxxu8vIaq3qt0noKW99r
 T9030C6VegqlcU+lHf43I2MGs5Xg0x6eZ6nznPgSuTHVZF02GHTuPPrqL
 7bTT0lvX/S6YJkvCqCgIUCenbUBKBwHlTgV7DcjDvH5KeIviDmWJUUwaD w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10330"; a="328988118"
X-IronPort-AV: E=Sophos;i="5.90,294,1643702400"; d="scan'208";a="328988118"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2022 12:27:48 -0700
X-IronPort-AV: E=Sophos;i="5.90,294,1643702400"; d="scan'208";a="680965819"
Received: from konishi-mobl.gar.corp.intel.com (HELO [10.252.6.183])
 ([10.252.6.183])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2022 12:27:38 -0700
Message-ID: <db3b0347-6dd0-2639-7d73-05ee8a9e41d7@intel.com>
Date: Wed, 27 Apr 2022 20:27:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 1/4] drm/i915/gt: GEM_BUG_ON unexpected NULL at
 scatterlist walking
Content-Language: en-GB
To: Ramalingam C <ramalingam.c@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
References: <20220425162430.28844-1-ramalingam.c@intel.com>
 <20220425162430.28844-2-ramalingam.c@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20220425162430.28844-2-ramalingam.c@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: Hellstrom Thomas <thomas.hellstrom@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 25/04/2022 17:24, Ramalingam C wrote:
> While locating the start of ccs scatterlist in smem scatterlist, that has
> to be the size of lmem obj size + corresponding ccs data size. Report bug
> if scatterlist terminate before that length.
> 
> Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_migrate.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_migrate.c b/drivers/gpu/drm/i915/gt/intel_migrate.c
> index 9d552f30b627..29d761da02c4 100644
> --- a/drivers/gpu/drm/i915/gt/intel_migrate.c
> +++ b/drivers/gpu/drm/i915/gt/intel_migrate.c
> @@ -687,6 +687,12 @@ static void get_ccs_sg_sgt(struct sgt_dma *it, u32 bytes_to_cpy)
>   		bytes_to_cpy -= len;
>   
>   		it->sg = __sg_next(it->sg);
> +
> +		/*
> +		 * scatterlist supposed to be the size of
> +		 * bytes_to_cpy + GET_CCS_BYTES(bytes_to_copy).
> +		 */
> +		GEM_BUG_ON(!it->sg);

It will crash and burn anyway, with the below NULL deref. Not sure if 
BUG_ON() is really much better, but I guess with the additional comment,
Reviewed-by: Matthew Auld <matthew.auld@intel.com>

>   		it->dma = sg_dma_address(it->sg);
>   		it->max = it->dma + sg_dma_len(it->sg);
>   	} while (bytes_to_cpy);
