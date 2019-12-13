Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AF3511ECF4
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2019 22:36:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22C126EDD6;
	Fri, 13 Dec 2019 21:36:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BD096EDD5;
 Fri, 13 Dec 2019 21:36:07 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Dec 2019 13:36:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,311,1571727600"; d="scan'208";a="220998946"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga001.fm.intel.com with SMTP; 13 Dec 2019 13:36:03 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 13 Dec 2019 23:36:03 +0200
Date: Fri, 13 Dec 2019 23:36:03 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Juston Li <juston.li@intel.com>
Subject: Re: [RESEND PATCH v2] drm: Add getfb2 ioctl
Message-ID: <20191213213603.GK1208@intel.com>
References: <20191003183125.4520-1-juston.li@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191003183125.4520-1-juston.li@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: intel-gfx@lists.freedesktop.org, Daniel Stone <daniels@collabora.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 03, 2019 at 11:31:25AM -0700, Juston Li wrote:
> From: Daniel Stone <daniels@collabora.com>
> =

> getfb2 allows us to pass multiple planes and modifiers, just like addfb2
> over addfb.
> =

> Changes since v1:
>  - unused modifiers set to 0 instead of DRM_FORMAT_MOD_INVALID
>  - update ioctl number
> =

> Signed-off-by: Daniel Stone <daniels@collabora.com>
> Signed-off-by: Juston Li <juston.li@intel.com>
> ---
>  drivers/gpu/drm/drm_crtc_internal.h |   2 +
>  drivers/gpu/drm/drm_framebuffer.c   | 110 ++++++++++++++++++++++++++++
>  drivers/gpu/drm/drm_ioctl.c         |   1 +
>  include/uapi/drm/drm.h              |   2 +
>  4 files changed, 115 insertions(+)
> =

> diff --git a/drivers/gpu/drm/drm_crtc_internal.h b/drivers/gpu/drm/drm_cr=
tc_internal.h
> index c7d5e4c21423..16f2413403aa 100644
> --- a/drivers/gpu/drm/drm_crtc_internal.h
> +++ b/drivers/gpu/drm/drm_crtc_internal.h
> @@ -216,6 +216,8 @@ int drm_mode_rmfb_ioctl(struct drm_device *dev,
>  			void *data, struct drm_file *file_priv);
>  int drm_mode_getfb(struct drm_device *dev,
>  		   void *data, struct drm_file *file_priv);
> +int drm_mode_getfb2_ioctl(struct drm_device *dev,
> +			  void *data, struct drm_file *file_priv);
>  int drm_mode_dirtyfb_ioctl(struct drm_device *dev,
>  			   void *data, struct drm_file *file_priv);
>  =

> diff --git a/drivers/gpu/drm/drm_framebuffer.c b/drivers/gpu/drm/drm_fram=
ebuffer.c
> index 57564318ceea..6db54f177443 100644
> --- a/drivers/gpu/drm/drm_framebuffer.c
> +++ b/drivers/gpu/drm/drm_framebuffer.c
> @@ -31,6 +31,7 @@
>  #include <drm/drm_file.h>
>  #include <drm/drm_fourcc.h>
>  #include <drm/drm_framebuffer.h>
> +#include <drm/drm_gem.h>
>  #include <drm/drm_print.h>
>  #include <drm/drm_util.h>
>  =

> @@ -548,7 +549,116 @@ int drm_mode_getfb(struct drm_device *dev,
>  =

>  out:
>  	drm_framebuffer_put(fb);
> +	return ret;
> +}
> +
> +/**
> + * drm_mode_getfb2 - get extended FB info
> + * @dev: drm device for the ioctl
> + * @data: data pointer for the ioctl
> + * @file_priv: drm file for the ioctl call
> + *
> + * Lookup the FB given its ID and return info about it.
> + *
> + * Called by the user via ioctl.
> + *
> + * Returns:
> + * Zero on success, negative errno on failure.
> + */
> +int drm_mode_getfb2_ioctl(struct drm_device *dev,
> +			  void *data, struct drm_file *file_priv)
> +{
> +	struct drm_mode_fb_cmd2 *r =3D data;
> +	struct drm_framebuffer *fb;
> +	unsigned int i;
> +	int ret;
> +
> +	if (!drm_core_check_feature(dev, DRIVER_MODESET))
> +		return -EINVAL;
> +
> +	fb =3D drm_framebuffer_lookup(dev, file_priv, r->fb_id);
> +	if (!fb)
> +		return -ENOENT;
> +
> +	/* For multi-plane framebuffers, we require the driver to place the
> +	 * GEM objects directly in the drm_framebuffer. For single-plane
> +	 * framebuffers, we can fall back to create_handle.
> +	 */
> +	if (!fb->obj[0] &&
> +	    (fb->format->num_planes > 1 || !fb->funcs->create_handle)) {
> +		ret =3D -ENODEV;
> +		goto out;
> +	}
> +
> +	r->height =3D fb->height;
> +	r->width =3D fb->width;
> +	r->pixel_format =3D fb->format->format;
> +
> +	r->flags =3D 0;
> +	if (dev->mode_config.allow_fb_modifiers)
> +		r->flags |=3D DRM_MODE_FB_MODIFIERS;
> +
> +	for (i =3D 0; i < ARRAY_SIZE(r->handles); i++) {
> +		r->handles[i] =3D 0;
> +		r->pitches[i] =3D 0;
> +		r->offsets[i] =3D 0;
> +		r->modifier[i] =3D 0;
> +	}
>  =

> +	for (i =3D 0; i < fb->format->num_planes; i++) {
> +		int j;
> +
> +		r->pitches[i] =3D fb->pitches[i];
> +		r->offsets[i] =3D fb->offsets[i];
> +		if (dev->mode_config.allow_fb_modifiers)
> +			r->modifier[i] =3D fb->modifier;
> +
> +		/* If we reuse the same object for multiple planes, also
> +		 * return the same handle.
> +		 */
> +		for (j =3D 0; j < i; j++) {
> +			if (fb->obj[i] =3D=3D fb->obj[j]) {
> +				r->handles[i] =3D r->handles[j];
> +				break;
> +			}
> +		}
> +
> +		if (r->handles[i])
> +			continue;
> +
> +		if (fb->obj[i]) {
> +			ret =3D drm_gem_handle_create(file_priv, fb->obj[i],
> +						    &r->handles[i]);
> +		} else {
> +			WARN_ON(i > 0);
> +			ret =3D fb->funcs->create_handle(fb, file_priv,
> +						       &r->handles[i]);
> +		}

getfb1 doesn't allow non-master/root to see the handles. Here we don't
seem to have that same protection?

> +
> +		if (ret !=3D 0)
> +			goto out;

Could be just 'break;' and then we wouldn't even need the label.

Rest lgtm.

> +	}
> +
> +out:
> +	if (ret !=3D 0) {
> +		/* Delete any previously-created handles on failure. */
> +		for (i =3D 0; i < ARRAY_SIZE(r->handles); i++) {
> +			int j;
> +
> +			if (r->handles[i])
> +				drm_gem_handle_delete(file_priv, r->handles[i]);
> +
> +			/* Zero out any handles identical to the one we just
> +			 * deleted.
> +			 */
> +			for (j =3D i + 1; j < ARRAY_SIZE(r->handles); j++) {
> +				if (r->handles[j] =3D=3D r->handles[i])
> +					r->handles[j] =3D 0;
> +			}
> +		}
> +	}
> +
> +	drm_framebuffer_put(fb);
>  	return ret;
>  }
>  =

> diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
> index fcd728d7cf72..b1fafce3ad8c 100644
> --- a/drivers/gpu/drm/drm_ioctl.c
> +++ b/drivers/gpu/drm/drm_ioctl.c
> @@ -671,6 +671,7 @@ static const struct drm_ioctl_desc drm_ioctls[] =3D {
>  	DRM_IOCTL_DEF(DRM_IOCTL_MODE_SETPROPERTY, drm_connector_property_set_io=
ctl, DRM_MASTER),
>  	DRM_IOCTL_DEF(DRM_IOCTL_MODE_GETPROPBLOB, drm_mode_getblob_ioctl, 0),
>  	DRM_IOCTL_DEF(DRM_IOCTL_MODE_GETFB, drm_mode_getfb, 0),
> +	DRM_IOCTL_DEF(DRM_IOCTL_MODE_GETFB2, drm_mode_getfb2_ioctl, 0),
>  	DRM_IOCTL_DEF(DRM_IOCTL_MODE_ADDFB, drm_mode_addfb_ioctl, 0),
>  	DRM_IOCTL_DEF(DRM_IOCTL_MODE_ADDFB2, drm_mode_addfb2_ioctl, 0),
>  	DRM_IOCTL_DEF(DRM_IOCTL_MODE_RMFB, drm_mode_rmfb_ioctl, 0),
> diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
> index 8a5b2f8f8eb9..021f33675ba2 100644
> --- a/include/uapi/drm/drm.h
> +++ b/include/uapi/drm/drm.h
> @@ -947,6 +947,8 @@ extern "C" {
>  #define DRM_IOCTL_SYNCOBJ_TRANSFER	DRM_IOWR(0xCC, struct drm_syncobj_tra=
nsfer)
>  #define DRM_IOCTL_SYNCOBJ_TIMELINE_SIGNAL	DRM_IOWR(0xCD, struct drm_sync=
obj_timeline_array)
>  =

> +#define DRM_IOCTL_MODE_GETFB2		DRM_IOWR(0xCE, struct drm_mode_fb_cmd2)
> +
>  /**
>   * Device specific ioctls should only be in their respective headers
>   * The device specific ioctl range is from 0x40 to 0x9f.
> -- =

> 2.21.0

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
