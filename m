Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5FE5B7D1CF
	for <lists+dri-devel@lfdr.de>; Wed, 17 Sep 2025 14:19:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0745510E069;
	Wed, 17 Sep 2025 05:12:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="fMvtmaDl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6B91D10E069
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Sep 2025 05:12:33 +0000 (UTC)
Received: by linux.microsoft.com (Postfix, from userid 1188)
 id BC64A2018E60; Tue, 16 Sep 2025 22:12:32 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com BC64A2018E60
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1758085952;
 bh=zKn800h16nl+4qy2pNwXvBFYZq+ddwqd978lKR97Has=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fMvtmaDlemyFwBAEDZbOBkpv6N9WKQcpaGtkBRMJwuy+ZeD8Lh0U9u6fccdC8B26V
 UoGSjxKiPADHKqKv/VM4+huKn1CRRpcOTPnWXrGpZVZ6OwlbP8IQt9Za1f7WAFrg7b
 2fJ2X2ltXQAdnxuYAJSnWe17WUaAZZ8HOQnMMl4g=
Date: Tue, 16 Sep 2025 22:12:32 -0700
From: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, louis.chauvet@bootlin.com,
 drawat.floss@gmail.com, hamohammed.sa@gmail.com,
 melissa.srw@gmail.com, mhklinux@outlook.com,
 ptsm@linux.microsoft.com, simona@ffwll.ch, airlied@gmail.com,
 maarten.lankhorst@linux.intel.com, ville.syrjala@linux.intel.com,
 lyude@redhat.com, javierm@redhat.com
Cc: dri-devel@lists.freedesktop.org, linux-hyperv@vger.kernel.org
Subject: Re: [PATCH v4 4/4] drm/hypervdrm: Use vblank timer
Message-ID: <20250917051232.GA20950@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
References: <20250916083816.30275-1-tzimmermann@suse.de>
 <20250916083816.30275-5-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250916083816.30275-5-tzimmermann@suse.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 16, 2025 at 10:36:22AM +0200, Thomas Zimmermann wrote:
> HyperV's virtual hardware does not provide vblank interrupts. Use a
> vblank timer to simulate the interrupt. Rate-limits the display's
> update frequency to the display-mode settings. Avoids excessive CPU
> overhead with compositors that do not rate-limit their output.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> Tested-by: Michael Kelley <mhklinux@outlook.com>
> ---
>  drivers/gpu/drm/hyperv/hyperv_drm_modeset.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/gpu/drm/hyperv/hyperv_drm_modeset.c b/drivers/gpu/drm/hyperv/hyperv_drm_modeset.c
> index 945b9482bcb3..6e6eb1c12a68 100644
> --- a/drivers/gpu/drm/hyperv/hyperv_drm_modeset.c
> +++ b/drivers/gpu/drm/hyperv/hyperv_drm_modeset.c
> @@ -19,6 +19,8 @@
>  #include <drm/drm_probe_helper.h>
>  #include <drm/drm_panic.h>
>  #include <drm/drm_plane.h>
> +#include <drm/drm_vblank.h>
> +#include <drm/drm_vblank_helper.h>
>  
>  #include "hyperv_drm.h"
>  
> @@ -111,11 +113,15 @@ static void hyperv_crtc_helper_atomic_enable(struct drm_crtc *crtc,
>  				crtc_state->mode.hdisplay,
>  				crtc_state->mode.vdisplay,
>  				plane_state->fb->pitches[0]);
> +
> +	drm_crtc_vblank_on(crtc);
>  }
>  
>  static const struct drm_crtc_helper_funcs hyperv_crtc_helper_funcs = {
>  	.atomic_check = drm_crtc_helper_atomic_check,
> +	.atomic_flush = drm_crtc_vblank_atomic_flush,
>  	.atomic_enable = hyperv_crtc_helper_atomic_enable,
> +	.atomic_disable = drm_crtc_vblank_atomic_disable,
>  };
>  
>  static const struct drm_crtc_funcs hyperv_crtc_funcs = {
> @@ -125,6 +131,7 @@ static const struct drm_crtc_funcs hyperv_crtc_funcs = {
>  	.page_flip = drm_atomic_helper_page_flip,
>  	.atomic_duplicate_state = drm_atomic_helper_crtc_duplicate_state,
>  	.atomic_destroy_state = drm_atomic_helper_crtc_destroy_state,
> +	DRM_CRTC_VBLANK_TIMER_FUNCS,
>  };
>  
>  static int hyperv_plane_atomic_check(struct drm_plane *plane,
> @@ -321,6 +328,10 @@ int hyperv_mode_config_init(struct hyperv_drm_device *hv)
>  		return ret;
>  	}
>  
> +	ret = drm_vblank_init(dev, 1);
> +	if (ret)
> +		return ret;
> +
>  	drm_mode_config_reset(dev);
>  
>  	return 0;
> 
> -- 
> 2.51.0
> 

Tested this series.

On a Hyper-V VM running Ubuntu,

with this patch

$ time find /
real	0m13.911s
user	0m0.965s
sys	0m3.815s


without this patch

$ time find /
real	0m14.254s
user	0m0.954s
sys	0m3.863s

Tested-by: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
