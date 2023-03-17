Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 12B066BE5CA
	for <lists+dri-devel@lfdr.de>; Fri, 17 Mar 2023 10:40:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A1C010EEB3;
	Fri, 17 Mar 2023 09:40:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09F6410EEB3;
 Fri, 17 Mar 2023 09:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679046003; x=1710582003;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=YuldQFlPZIWFf2B+/Qj5QfElMzuBa1DnMG3STBUG9ew=;
 b=h7ht10JHqYrLX6u1k8EFkw0ggVH90r3eVQsOsIT1xwvvDayX+al5r9/8
 8Q6g30qv6QqqkOQkMoz7gdRZMmiX6sOyiKKKAX5EMl2G11xfTGCrXHGPN
 32iTBlyAinOV8rwvMn/B025k9URodmmQ3fgCUKeE3wDxWm39auEyq9sIX
 qFnZLgw0EZsL7ddr3vd9Hb9W0DsTGflmi7n4wFlnpq5Zf+OpJmgeyRflr
 tmR1hlAJovoJy2CE27WAAZ3uVOcH6J+E92GTEvTInDHFGyLOR8OobVeep
 ew4V3QbdMNt2/7MtvY3fO+S5PkHq6AXlHsudUv/Cm2WIGaVAiOcxotIjw A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="322072063"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; d="scan'208";a="322072063"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2023 02:40:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="710436920"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; d="scan'208";a="710436920"
Received: from shuchen-mobl.ccr.corp.intel.com (HELO localhost)
 ([10.252.60.191])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2023 02:39:59 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>, intel-gfx@lists.freedesktop.org
Subject: Re: [RFC PATCH 2/2] drm/i915/display: Implement fb_mmap callback
 function
In-Reply-To: <20230316172220.16068-2-nirmoy.das@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230316172220.16068-1-nirmoy.das@intel.com>
 <20230316172220.16068-2-nirmoy.das@intel.com>
Date: Fri, 17 Mar 2023 11:39:56 +0200
Message-ID: <87sfe3af83.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: dri-devel@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 16 Mar 2023, Nirmoy Das <nirmoy.das@intel.com> wrote:
> If stolen memory allocation fails for fbdev, the driver will
> fallback to system memory. Calculation of smem_start is wrong
> for such framebuffer objs if the platform comes with no gmadr or
> no aperture. Solve this by adding fb_mmap callback which will
> use GTT if aperture is available otherwise will use cpu to access
> the framebuffer.
>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Imre Deak <imre.deak@intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_fbdev.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm=
/i915/display/intel_fbdev.c
> index 673bcdfb7ff6..51d6fa034b00 100644
> --- a/drivers/gpu/drm/i915/display/intel_fbdev.c
> +++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
> @@ -40,8 +40,10 @@
>  #include <drm/drm_crtc.h>
>  #include <drm/drm_fb_helper.h>
>  #include <drm/drm_fourcc.h>
> +#include <drm/drm_gem_framebuffer_helper.h>
>=20=20
>  #include "gem/i915_gem_lmem.h"
> +#include "gem/i915_gem_mman.h"
>=20=20
>  #include "i915_drv.h"
>  #include "intel_display_types.h"
> @@ -120,6 +122,16 @@ static int intel_fbdev_pan_display(struct fb_var_scr=
eeninfo *var,
>  	return ret;
>  }
>=20=20
> +#define to_intel_fbdev(x) container_of(x, struct intel_fbdev, helper)

I'd add that as a function (rather than a macro) in a separate patch,
converting the existing users while at it.

BR,
Jani.


> +static int intel_fbdev_mmap(struct fb_info *info, struct vm_area_struct =
*vma)
> +{
> +	struct intel_fbdev *fbdev =3D to_intel_fbdev(info->par);
> +	struct drm_gem_object *bo =3D drm_gem_fb_get_obj(&fbdev->fb->base, 0);
> +	struct drm_i915_gem_object *obj =3D to_intel_bo(bo);
> +
> +	return i915_gem_fb_mmap(obj, vma);
> +}
> +
>  static const struct fb_ops intelfb_ops =3D {
>  	.owner =3D THIS_MODULE,
>  	DRM_FB_HELPER_DEFAULT_OPS,
> @@ -131,6 +143,7 @@ static const struct fb_ops intelfb_ops =3D {
>  	.fb_imageblit =3D drm_fb_helper_cfb_imageblit,
>  	.fb_pan_display =3D intel_fbdev_pan_display,
>  	.fb_blank =3D intel_fbdev_blank,
> +	.fb_mmap =3D intel_fbdev_mmap,
>  };
>=20=20
>  static int intelfb_alloc(struct drm_fb_helper *helper,

--=20
Jani Nikula, Intel Open Source Graphics Center
