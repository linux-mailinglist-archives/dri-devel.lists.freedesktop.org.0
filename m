Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50FA918A3CB
	for <lists+dri-devel@lfdr.de>; Wed, 18 Mar 2020 21:31:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BC0F6E961;
	Wed, 18 Mar 2020 20:31:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 488DA6E95E;
 Wed, 18 Mar 2020 20:31:08 +0000 (UTC)
IronPort-SDR: blZt+fNWla0xQBV+fms5HnDu595i/AKQqK4KTFJ0AUov0wtkeAItrhEBMjKE8/qaYruotaUZ5c
 j1qn3u+6CP2g==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2020 13:31:07 -0700
IronPort-SDR: yaS2PC+h8qYTir5ZH247mA3DSdpyX1/7/m0rhnh3BlsP/7R+gDX2dUDoVLUTv6VGFZagvFuUlB
 UzQtLP2KPoMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,568,1574150400"; d="scan'208";a="391568631"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.27.64])
 by orsmga004.jf.intel.com with ESMTP; 18 Mar 2020 13:31:07 -0700
Date: Wed, 18 Mar 2020 13:31:07 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH] drm: Reject dumb buffers when driver/device doesn't
 support modesetting
Message-ID: <20200318203107.GM2286538@mdroper-desk1.amr.corp.intel.com>
References: <20200318154959.9017-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200318154959.9017-1-ville.syrjala@linux.intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 18, 2020 at 05:49:59PM +0200, Ville Syrjala wrote:
> From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> =

> Currently a driver must not provide a .dumb_create() hook in the
> drm_driver structure if it wants to declare dumb buffers as not
> supported. So if the same driver wants to support both modeset
> and non-modeset devices it would require two distinct drm_driver
> structures in order to reject the dumb buffer operations on the
> non-modeset devices. That's rather tedious, so let's make life
> easier for such drivers by also checking for the DRIVER_MODESET
> flag before we declare dumb buffers as supported. Now all the
> driver has to do is clear the flag for any device that can't
> do modesetting.

Will this be a problem for vgem?  I thought it exposed dumb buffers
without modesetting support?


Matt

> =

> Signed-off-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> ---
>  drivers/gpu/drm/drm_client.c        |  2 +-
>  drivers/gpu/drm/drm_crtc_internal.h |  1 +
>  drivers/gpu/drm/drm_dumb_buffers.c  | 12 +++++++++---
>  drivers/gpu/drm/drm_ioctl.c         |  2 +-
>  4 files changed, 12 insertions(+), 5 deletions(-)
> =

> diff --git a/drivers/gpu/drm/drm_client.c b/drivers/gpu/drm/drm_client.c
> index 6b0c6ef8b9b3..cf61d87b434d 100644
> --- a/drivers/gpu/drm/drm_client.c
> +++ b/drivers/gpu/drm/drm_client.c
> @@ -80,7 +80,7 @@ int drm_client_init(struct drm_device *dev, struct drm_=
client_dev *client,
>  {
>  	int ret;
>  =

> -	if (!drm_core_check_feature(dev, DRIVER_MODESET) || !dev->driver->dumb_=
create)
> +	if (!drm_has_dumb_buffers(dev))
>  		return -EOPNOTSUPP;
>  =

>  	if (funcs && !try_module_get(funcs->owner))
> diff --git a/drivers/gpu/drm/drm_crtc_internal.h b/drivers/gpu/drm/drm_cr=
tc_internal.h
> index 16f2413403aa..c08ff0b7a509 100644
> --- a/drivers/gpu/drm/drm_crtc_internal.h
> +++ b/drivers/gpu/drm/drm_crtc_internal.h
> @@ -92,6 +92,7 @@ int drm_mode_getresources(struct drm_device *dev,
>  =

>  =

>  /* drm_dumb_buffers.c */
> +bool drm_has_dumb_buffers(struct drm_device *dev);
>  int drm_mode_create_dumb(struct drm_device *dev,
>  			 struct drm_mode_create_dumb *args,
>  			 struct drm_file *file_priv);
> diff --git a/drivers/gpu/drm/drm_dumb_buffers.c b/drivers/gpu/drm/drm_dum=
b_buffers.c
> index d18a740fe0f1..9859530362e2 100644
> --- a/drivers/gpu/drm/drm_dumb_buffers.c
> +++ b/drivers/gpu/drm/drm_dumb_buffers.c
> @@ -55,13 +55,19 @@
>   * a hardware-specific ioctl to allocate suitable buffer objects.
>   */
>  =

> +bool drm_has_dumb_buffers(struct drm_device *dev)
> +{
> +	return dev->driver->dumb_create &&
> +		drm_core_check_feature(dev, DRIVER_MODESET);
> +}
> +
>  int drm_mode_create_dumb(struct drm_device *dev,
>  			 struct drm_mode_create_dumb *args,
>  			 struct drm_file *file_priv)
>  {
>  	u32 cpp, stride, size;
>  =

> -	if (!dev->driver->dumb_create)
> +	if (!drm_has_dumb_buffers(dev))
>  		return -ENOSYS;
>  	if (!args->width || !args->height || !args->bpp)
>  		return -EINVAL;
> @@ -119,7 +125,7 @@ int drm_mode_mmap_dumb_ioctl(struct drm_device *dev,
>  {
>  	struct drm_mode_map_dumb *args =3D data;
>  =

> -	if (!dev->driver->dumb_create)
> +	if (!drm_has_dumb_buffers(dev))
>  		return -ENOSYS;
>  =

>  	if (dev->driver->dumb_map_offset)
> @@ -134,7 +140,7 @@ int drm_mode_mmap_dumb_ioctl(struct drm_device *dev,
>  int drm_mode_destroy_dumb(struct drm_device *dev, u32 handle,
>  			  struct drm_file *file_priv)
>  {
> -	if (!dev->driver->dumb_create)
> +	if (!drm_has_dumb_buffers(dev))
>  		return -ENOSYS;
>  =

>  	if (dev->driver->dumb_destroy)
> diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
> index 9e41972c4bbc..437f1bee6869 100644
> --- a/drivers/gpu/drm/drm_ioctl.c
> +++ b/drivers/gpu/drm/drm_ioctl.c
> @@ -262,7 +262,7 @@ static int drm_getcap(struct drm_device *dev, void *d=
ata, struct drm_file *file_
>  =

>  	switch (req->capability) {
>  	case DRM_CAP_DUMB_BUFFER:
> -		if (dev->driver->dumb_create)
> +		if (drm_has_dumb_buffers(dev))
>  			req->value =3D 1;
>  		break;
>  	case DRM_CAP_VBLANK_HIGH_CRTC:
> -- =

> 2.24.1
> =

> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- =

Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
(916) 356-2795
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
