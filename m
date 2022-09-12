Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A535B6152
	for <lists+dri-devel@lfdr.de>; Mon, 12 Sep 2022 20:54:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7D9A10E163;
	Mon, 12 Sep 2022 18:53:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48B1B10E163;
 Mon, 12 Sep 2022 18:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663008831; x=1694544831;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=50QRgPLOf/CrVyFJ0cfHri8jZtBrmT3+XtGh/TYDKI8=;
 b=LSlLetVlc4NOdsk3R/ZPfOpg4q3Ho23Kx/57crxkHnE0E7Ydh9FHSSST
 z9Iw5ZUtMOe+APC97iXQSSfh0beKny292Bf6Sl1xwt1pIGK7LoEPS9Fl0
 jFpGseccrdOWPUSfj8R2e9Tj3Xem7L1DkMxEr7WrLlGyrakVRL8ioF6cf
 m8LmHT/1OAXtp73L5zprLbsdmzyeTjn+i0/4rDPSXrQ6GxR4uRtkwhpXe
 bGp3/iU/VWwq2DBn/kiIBBrMYmbbpGXhMuxjOmp7XCTw6LdozSpHF2LSi
 T5XRkTf9BXZdcaKVottO54P6GBNAkUbzXYol89GfPunMk+3LD6wrfuMLL A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10468"; a="280960928"
X-IronPort-AV: E=Sophos;i="5.93,310,1654585200"; d="scan'208";a="280960928"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2022 11:53:50 -0700
X-IronPort-AV: E=Sophos;i="5.93,310,1654585200"; d="scan'208";a="678221435"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.213.24.87])
 ([10.213.24.87])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2022 11:53:49 -0700
Message-ID: <268b4c7e-4713-5975-3430-94cc5ebcb004@intel.com>
Date: Mon, 12 Sep 2022 20:53:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.2.2
Subject: Re: [Intel-gfx] [PATCH v1 1/1] drm/i915: Skip applying copy engine
 fuses
Content-Language: en-US
To: Lucas De Marchi <lucas.demarchi@intel.com>, intel-gfx@lists.freedesktop.org
References: <20220912-copy-engine-v1-0-ef92fd81758d@intel.com>
 <20220912-copy-engine-v1-1-ef92fd81758d@intel.com>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20220912-copy-engine-v1-1-ef92fd81758d@intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12.09.2022 18:19, Lucas De Marchi wrote:
> Support for reading the fuses to check what are the Link Copy engines
> was added in commit ad5f74f34201 ("drm/i915/pvc: read fuses for link
> copy engines"). However they were added unconditionally because the
> FUSE3 register is present since graphics version 10.
> 
> However the bitfield with meml3 fuses only exists since graphics version
> 12. Moreover, Link Copy engines are currently only available in PVC.
> Tying additional copy engines to the meml3 fuses is not correct for
> other platforms.
> 
> Make sure there is a check for  `12.60 <= ver < 12.70`. Later platforms
> may extend this function later if it's needed to fuse off copy engines.
> 
> Currently it's harmless as the Link Copy engines are still not exported:
> info->engine_mask only has BCS0 set and the register is only read for
> platforms that do have it.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> index 814f83b5fe59..1f7188129cd1 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> @@ -764,6 +764,10 @@ static void engine_mask_apply_copy_fuses(struct intel_gt *gt)
>   	unsigned long meml3_mask;
>   	unsigned long quad;
>   
> +	if (!(GRAPHICS_VER_FULL(i915) >= IP_VER(12, 60) &&
> +	      GRAPHICS_VER_FULL(i915) < IP_VER(12, 70)))
> +		return;
> +
>   	meml3_mask = intel_uncore_read(gt->uncore, GEN10_MIRROR_FUSE3);
>   	meml3_mask = REG_FIELD_GET(GEN12_MEML3_EN_MASK, meml3_mask);
>   
> 

