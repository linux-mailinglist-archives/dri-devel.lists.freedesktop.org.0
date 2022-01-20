Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA743495478
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jan 2022 19:54:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0345810E949;
	Thu, 20 Jan 2022 18:54:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1F8E10E937;
 Thu, 20 Jan 2022 18:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642704855; x=1674240855;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=55+paD8Tv9RuUKh9lkxO3ubVHL6p9DD9fkVOSVtjFkU=;
 b=K+cebBOMpjcxMdRvLBXcVIZIXSC7IWc5l+9l3Ux3+V9mvZWkD978f8RW
 qA/Nq7508libjuTVmABsQle6x7MQMxh47NMylTpx4jfaFx189Qm8hGQyR
 CUf+ZUEvLwH9szjr+4df85cJ9HTPAl2RgaP6zZ5urW/OdTDzUcfyaao1T
 DwYCql9zN79rm053kXUzdD5mnvDsBJS5sMr2FRYzI3JlwmWgUG7hjB+vK
 RxOfhGP/037iOlMy0J/j4Dqm2+S9BIVfkRNdH7+uTnPXRU4jrW+OLkJ2A
 HSy2i1NkwuWyge4T3WsvZSI+DvmDWAF174oT9lepwfT+rDaIX0pKpTS2j Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10233"; a="232796472"
X-IronPort-AV: E=Sophos;i="5.88,303,1635231600"; d="scan'208";a="232796472"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 10:54:14 -0800
X-IronPort-AV: E=Sophos;i="5.88,303,1635231600"; d="scan'208";a="475638233"
Received: from jons-linux-dev-box.fm.intel.com (HELO jons-linux-dev-box)
 ([10.1.27.20])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 10:54:13 -0800
Date: Thu, 20 Jan 2022 10:48:27 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
Subject: Re: [PATCH] drm/i915/wopcm: Handle pre-programmed WOPCM registers
Message-ID: <20220120184827.GA3259@jons-linux-dev-box>
References: <20220114193315.3271408-1-daniele.ceraolospurio@intel.com>
 <DM6PR11MB37860211234A897A2EA06F218A5A9@DM6PR11MB3786.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DM6PR11MB37860211234A897A2EA06F218A5A9@DM6PR11MB3786.namprd11.prod.outlook.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: "Summers, Stuart" <stuart.summers@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Harrison,
 John C" <john.c.harrison@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 20, 2022 at 06:13:47PM +0000, Teres Alexis, Alan Previn wrote:
> Just one nit below, (assuming that igt CI failure isnt related - kms flip not completing)
> Reviewed-by Alan Previn <alan.previn.teres.alexis@intel.com>
> 
> -----Original Message-----
> From: Ceraolo Spurio, Daniele <daniele.ceraolospurio@intel.com> 
> Sent: Friday, January 14, 2022 11:33 AM
> To: intel-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org; Ceraolo Spurio, Daniele <daniele.ceraolospurio@intel.com>; Summers, Stuart <stuart.summers@intel.com>; Harrison, John C <john.c.harrison@intel.com>; Teres Alexis, Alan Previn <alan.previn.teres.alexis@intel.com>
> Subject: [PATCH] drm/i915/wopcm: Handle pre-programmed WOPCM registers
> 
> Starting from DG2, some of the programming previously done by i915 and the GuC has been moved to the GSC and the relevant registers are no longer writable by either CPU or GuC. This is also referred to as GuC deprivilege.
> On the i915 side, this affects the WOPCM registers: these are no longer programmed by the driver and we do instead expect to find them already set. This can lead to verification failures because in i915 we cheat a bit with the WOPCM size defines, to keep the code common across platforms, by sometimes using a smaller WOPCM size that the actual HW support (which isn't a problem because the extra size is not needed if the FW fits in the smaller chunk), while the pre-programmed values can use the actual size.
> Given tha the new programming entity is trusted, relax the amount of the checks done on the pre-programmed values by not limiting the max programmed size. In the extremely unlikely scenario that the registers have been misprogrammed, we will still fail later at DMA time.
> 
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Stuart Summers <stuart.summers@intel.com>
> Cc: John Harrison <john.c.harrison@intel.com>
> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/uc/intel_guc_reg.h |  3 ++
>  drivers/gpu/drm/i915/i915_drv.h            |  3 ++
>  drivers/gpu/drm/i915/i915_pci.c            |  1 +
>  drivers/gpu/drm/i915/intel_device_info.c   |  8 +++++
>  drivers/gpu/drm/i915/intel_device_info.h   |  1 +
>  drivers/gpu/drm/i915/intel_wopcm.c         | 42 ++++++++++++++++++----
>  6 files changed, 51 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/intel_device_info.c b/drivers/gpu/drm/i915/intel_device_info.c
> index 93b251b25aba..88aad892a0fc 100644
> --- a/drivers/gpu/drm/i915/intel_device_info.c
> +++ b/drivers/gpu/drm/i915/intel_device_info.c
> @@ -394,6 +394,14 @@ void intel_device_info_runtime_init(struct drm_i915_private *dev_priv)
>  		memset(runtime->num_sprites, 0, sizeof(runtime->num_sprites));
>  		memset(runtime->num_scalers, 0, sizeof(runtime->num_scalers));
>  	}
> +
> +	/*
> +	 * Early DG2 steppings don't have the GuC depriv feature. We can't
> +	 * rely on the fuse on those platforms because the meaning of the fuse
> +	 * bit is inverted on platforms that do have the feature.
> +	 */
> +	if (IS_DG2_GRAPHICS_STEP(dev_priv, G10, STEP_A0, STEP_A1))
> +		info->has_guc_deprivilege = 0;
> 
> Nit: not sure if it matters if this stepping is not-public (although I am not 100% sure I am correct in my assumption this is not-public).

Agree with Alan.

Are we ever going to let A0 / A1 stepping for DG2 be publicly available?
If the answer is no, I think this can be removed.

Matt

>  }
