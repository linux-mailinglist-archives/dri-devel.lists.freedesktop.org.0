Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C83C3B7602
	for <lists+dri-devel@lfdr.de>; Tue, 29 Jun 2021 17:55:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1870B6E8BD;
	Tue, 29 Jun 2021 15:55:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D8776E8BD;
 Tue, 29 Jun 2021 15:55:35 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10030"; a="272030636"
X-IronPort-AV: E=Sophos;i="5.83,309,1616482800"; d="scan'208";a="272030636"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2021 08:55:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,309,1616482800"; d="scan'208";a="489297301"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by orsmga001.jf.intel.com with SMTP; 29 Jun 2021 08:55:28 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 29 Jun 2021 18:55:27 +0300
Date: Tue, 29 Jun 2021 18:55:27 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Hamza Mahfooz <someguy@effective-light.com>
Subject: Re: [PATCH v2] drm/i915/display: replace boilerplate code with
 helper macros
Message-ID: <YNtCbxjgIrwT1/gH@intel.com>
References: <20210626073230.41803-1-someguy@effective-light.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210626073230.41803-1-someguy@effective-light.com>
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
Cc: Karthik B S <karthik.b.s@intel.com>, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Manasi Navare <manasi.d.navare@intel.com>,
 =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Dave Airlie <airlied@redhat.com>,
 Sean Paul <sean@poorly.run>, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jun 26, 2021 at 03:32:27AM -0400, Hamza Mahfooz wrote:
> As per commit 22be87401289 ("drm: TODO: Add DRM_MODESET_LOCK_ALL*
> conversion to todo.rst"),
> drm_modeset_lock_all()/drm_modeset_unlock_all() and boilerplate code
> surrounding instances of drm_modeset_lock_all_ctx() with a local acquire
> context should be replaced with the relevant helper macros.
> 
> Signed-off-by: Hamza Mahfooz <someguy@effective-light.com>
> ---
>  drivers/gpu/drm/i915/display/intel_display.c | 20 +++++++-------------
>  1 file changed, 7 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
> index 64e9107d70f7..e8cb2881d2b4 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -40,6 +40,7 @@
>  #include <drm/drm_dp_helper.h>
>  #include <drm/drm_edid.h>
>  #include <drm/drm_fourcc.h>
> +#include "drm/drm_modeset_lock.h"
>  #include <drm/drm_plane_helper.h>
>  #include <drm/drm_probe_helper.h>
>  #include <drm/drm_rect.h>
> @@ -11836,6 +11837,7 @@ int intel_modeset_init_nogem(struct drm_i915_private *i915)
>  	struct drm_device *dev = &i915->drm;
>  	enum pipe pipe;
>  	struct intel_crtc *crtc;
> +	struct drm_modeset_acquire_ctx ctx;
>  	int ret;
>  
>  	intel_init_pm(i915);
> @@ -11884,9 +11886,9 @@ int intel_modeset_init_nogem(struct drm_i915_private *i915)
>  	intel_vga_disable(i915);
>  	intel_setup_outputs(i915);
>  
> -	drm_modeset_lock_all(dev);
> +	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
>  	intel_modeset_setup_hw_state(dev, dev->mode_config.acquire_ctx);
> -	drm_modeset_unlock_all(dev);
> +	DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);

That looks wrong. You're using a private ctx here, but still
passing dev->mode_config.acquire_ctx to the lower level stuff.

Also DRM_MODESET_LOCK_ALL_{BEGIN,END}() do not seem to be
equivalent to drm_modeset_{lock,unlock}_all() when it comes to 
mode_config.mutex. So would need a proper review whether we
actually need that lock or not.

-- 
Ville Syrjälä
Intel
