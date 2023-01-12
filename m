Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A898667275
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jan 2023 13:43:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D99010E0FC;
	Thu, 12 Jan 2023 12:43:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A5BF10E8DF;
 Thu, 12 Jan 2023 12:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673527431; x=1705063431;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=565LqgHJwdtdjfNIuRn4sNTe1GUbFexFOA2HzuIlTKY=;
 b=IqwQxPVMN5lAabNcwcaq0KcCQg0XBTahGUYPPc1hF/5OGpFKeBhsSAft
 5ULQDgR4Pwo2HVoG82zrfzvleZ31Sg2AKNfNKDaR2EgJJXN4rKPGu/UOR
 zj0KKuW8axtyLsXA5bs1Z2oMtpK/FszpkPig9EioKYJUdc0ghSGsQ47HM
 RQdL2e1posA87SxUg6uG8UcBP6Yz28N+tsx5Okrqjs3Uc6Oso7j7buDFi
 1kjeBeF5OFNGVtXvZ3L+CTTZYXZ7n4l33KXWTZdrup56WhXFp4g+HWUWs
 fx47xfwZ/Hgog9nxce2pI6r7unJ9U5o71u1Js0UrssmWqC4c9WAdcZgKz w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10587"; a="307216366"
X-IronPort-AV: E=Sophos;i="5.97,319,1669104000"; d="scan'208";a="307216366"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2023 04:43:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10587"; a="746541278"
X-IronPort-AV: E=Sophos;i="5.97,319,1669104000"; d="scan'208";a="746541278"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.55])
 by FMSMGA003.fm.intel.com with SMTP; 12 Jan 2023 04:43:34 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 12 Jan 2023 14:43:33 +0200
Date: Thu, 12 Jan 2023 14:43:33 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>
Subject: Re: [PATCH 3/5] drm/i915: Remove redundant framebuffer format check
Message-ID: <Y8AAdW2y7zN7DCUZ@intel.com>
References: <20230109105807.18172-1-mcanal@igalia.com>
 <20230109105807.18172-4-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230109105807.18172-4-mcanal@igalia.com>
X-Patchwork-Hint: comment
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
Cc: dri-devel@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, intel-gfx@lists.freedesktop.org,
 Melissa Wen <mwen@igalia.com>,
 VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 09, 2023 at 07:58:06AM -0300, Maíra Canal wrote:
> Now that framebuffer_check() verifies that the format is properly
> supported, there is no need to check it again on i915's inside
> helpers.
> 
> Therefore, remove the redundant framebuffer format check from the
> intel_framebuffer_init() function, letting framebuffer_check()
> perform the framebuffer validation.
> 
> Signed-off-by: Maíra Canal <mcanal@igalia.com>
> ---
>  drivers/gpu/drm/i915/display/intel_fb.c | 9 ---------
>  1 file changed, 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_fb.c b/drivers/gpu/drm/i915/display/intel_fb.c
> index 63137ae5ab21..230b729e42d6 100644
> --- a/drivers/gpu/drm/i915/display/intel_fb.c
> +++ b/drivers/gpu/drm/i915/display/intel_fb.c
> @@ -1914,15 +1914,6 @@ int intel_framebuffer_init(struct intel_framebuffer *intel_fb,
>  		}
>  	}
>  
> -	if (!drm_any_plane_has_format(&dev_priv->drm,
> -				      mode_cmd->pixel_format,
> -				      mode_cmd->modifier[0])) {
> -		drm_dbg_kms(&dev_priv->drm,
> -			    "unsupported pixel format %p4cc / modifier 0x%llx\n",
> -			    &mode_cmd->pixel_format, mode_cmd->modifier[0]);
> -		goto err;
> -	}
> -

This doesn't work for the legacy tiling->modifier path.

>  	/*
>  	 * gen2/3 display engine uses the fence if present,
>  	 * so the tiling mode must match the fb modifier exactly.
> -- 
> 2.39.0

-- 
Ville Syrjälä
Intel
