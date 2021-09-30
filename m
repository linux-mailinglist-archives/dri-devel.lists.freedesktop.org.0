Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5740441D633
	for <lists+dri-devel@lfdr.de>; Thu, 30 Sep 2021 11:22:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD7B06E39B;
	Thu, 30 Sep 2021 09:22:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DF686E39B
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Sep 2021 09:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date;
 bh=qNV0MuPFbK0qjKTNyCJRCsCkgsTxIuseWhLNPnlYODU=; 
 b=eIZg3f/16CASt8gNjwz2BczFNO9hc7yeFtdHjmElY2Ciit1wIwV7C0wrYx/dRO9Pcxd0gYuba5jJ+yWRfEVE4YQ+N299kYliP0mBGsYBATEfgMRPP4/Se1yH0UQf81yc+2eL0dYqzaGL1WI5EuROm6wdATHlxaevKHl7guwBoshsw1Rx0hdjUS4ZiUcwvkPxtJ/xzhFX63EUGbZr7RV5/hNnrSk7ShDnAKeTu7qr5AnX4J0aXlAT3zrlzG33wG0uNfmC2ccSOtee3gli2vsU/HBVLlxlj1RTakXYWDphj5p/XaYoC/h7IZWtva0YbjkuV98EIOOPPqV+cLstcUJWAw==;
Received: from a95-92-181-29.cpe.netcabo.pt ([95.92.181.29]
 helo=mail.igalia.com) by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1mVsHF-000210-2o; Thu, 30 Sep 2021 11:22:53 +0200
Date: Thu, 30 Sep 2021 10:22:41 +0100
From: Melissa Wen <mwen@igalia.com>
To: Iago Toral <itoral@igalia.com>
Cc: dri-devel@lists.freedesktop.org, Emma Anholt <emma@anholt.net>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Maxime Ripard <maxime@cerno.tech>,
 Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v2 3/4] drm/v3d: add generic ioctl extension
Message-ID: <20210930092241.hikxj2iseu2kzt5u@mail.igalia.com>
References: <cover.1632905676.git.mwen@igalia.com>
 <779e2cc57efd5fbc95f1267e7252de5f092045c5.1632905676.git.mwen@igalia.com>
 <d4d4762f1365f22b53677da2f77a5ac27e899a4c.camel@igalia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="vvb6tp4magjvdc4v"
Content-Disposition: inline
In-Reply-To: <d4d4762f1365f22b53677da2f77a5ac27e899a4c.camel@igalia.com>
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


--vvb6tp4magjvdc4v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

O 09/30, Iago Toral wrote:
> On Wed, 2021-09-29 at 10:44 +0100, Melissa Wen wrote:
> > Add support to attach generic extensions on job submission. This
> > patch
> > is third prep work to enable multiple syncobjs on job submission.
> > With
> > this work, when the job submission interface needs to be extended to
> > accomodate a new feature, we will use a generic extension struct
> > where
> > an id determines the data type to be pointed. The first application
> > is
> > to enable multiples in/out syncobj (next patch), but the base is
> > already done for future features. Therefore, to attach a new feature,
> > a specific extension struct should subclass drm_v3d_extension and
> > update the list of extensions in a job submission.
> >=20
> > v2:
> > - remove redundant elements to subclass struct (Daniel)
> >=20
> > Signed-off-by: Melissa Wen <mwen@igalia.com>
> > ---
> >  drivers/gpu/drm/v3d/v3d_drv.c |  4 +-
> >  drivers/gpu/drm/v3d/v3d_gem.c | 71
> > +++++++++++++++++++++++++++++++++--
> >  include/uapi/drm/v3d_drm.h    | 31 +++++++++++++++
> >  3 files changed, 100 insertions(+), 6 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/v3d/v3d_drv.c
> > b/drivers/gpu/drm/v3d/v3d_drv.c
> > index c1deab2cf38d..3d6b9bcce2f7 100644
> > --- a/drivers/gpu/drm/v3d/v3d_drv.c
> > +++ b/drivers/gpu/drm/v3d/v3d_drv.c
> > @@ -83,7 +83,6 @@ static int v3d_get_param_ioctl(struct drm_device
> > *dev, void *data,
> >  		return 0;
> >  	}
> > =20
> > -
> >  	switch (args->param) {
> >  	case DRM_V3D_PARAM_SUPPORTS_TFU:
> >  		args->value =3D 1;
> > @@ -147,7 +146,7 @@ v3d_postclose(struct drm_device *dev, struct
> > drm_file *file)
> >  DEFINE_DRM_GEM_FOPS(v3d_drm_fops);
> > =20
> >  /* DRM_AUTH is required on SUBMIT_CL for now, while we don't have
> > GMP
> > - * protection between clients.  Note that render nodes would be be
> > + * protection between clients.  Note that render nodes would be
> >   * able to submit CLs that could access BOs from clients
> > authenticated
> >   * with the master node.  The TFU doesn't use the GMP, so it would
> >   * need to stay DRM_AUTH until we do buffer size/offset validation.
> > @@ -219,7 +218,6 @@ static int v3d_platform_drm_probe(struct
> > platform_device *pdev)
> >  	u32 mmu_debug;
> >  	u32 ident1;
> > =20
> > -
> >  	v3d =3D devm_drm_dev_alloc(dev, &v3d_drm_driver, struct v3d_dev,
> > drm);
> >  	if (IS_ERR(v3d))
> >  		return PTR_ERR(v3d);
> > diff --git a/drivers/gpu/drm/v3d/v3d_gem.c
> > b/drivers/gpu/drm/v3d/v3d_gem.c
> > index 9cfa6f8d4357..b912419027f7 100644
> > --- a/drivers/gpu/drm/v3d/v3d_gem.c
> > +++ b/drivers/gpu/drm/v3d/v3d_gem.c
> > @@ -535,6 +535,33 @@ v3d_attach_fences_and_unlock_reservation(struct
> > drm_file *file_priv,
> >  	}
> >  }
> > =20
> > +static int
> > +v3d_get_extensions(struct drm_file *file_priv, u64 ext_handles)
> > +{
> > +	struct drm_v3d_extension __user *user_ext;
> > +
> > +	user_ext =3D u64_to_user_ptr(ext_handles);
> > +	while(user_ext) {
> > +		struct drm_v3d_extension ext;
> > +
> > +		if (copy_from_user(&ext, user_ext, sizeof(ext))) {
> > +			DRM_DEBUG("Failed to copy submit extension\n");
> > +			return -EFAULT;
> > +		}
> > +
> > +		switch (ext.id) {
> > +		case 0:
> > +		default:
> > +			DRM_DEBUG_DRIVER("Unknown extension id: %d\n",
> > ext.id);
> > +			return -EINVAL;
> > +		}
> > +
> > +		user_ext =3D u64_to_user_ptr(ext.next);
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> >  /**
> >   * v3d_submit_cl_ioctl() - Submits a job (frame) to the V3D.
> >   * @dev: DRM device
> > @@ -563,15 +590,24 @@ v3d_submit_cl_ioctl(struct drm_device *dev,
> > void *data,
> > =20
> >  	trace_v3d_submit_cl_ioctl(&v3d->drm, args->rcl_start, args-
> > >rcl_end);
> > =20
> > -	if (args->pad !=3D 0)
> > +	if (args->pad)
> >  		return -EINVAL;
> > =20
> > -	if (args->flags !=3D 0 &&
> > -	    args->flags !=3D DRM_V3D_SUBMIT_CL_FLUSH_CACHE) {
> > +	if (args->flags &&
> > +	    args->flags & ~(DRM_V3D_SUBMIT_CL_FLUSH_CACHE |
> > +			    DRM_V3D_SUBMIT_EXTENSION)) {
> >  		DRM_INFO("invalid flags: %d\n", args->flags);
> >  		return -EINVAL;
> >  	}
> > =20
> > +	if (args->flags & DRM_V3D_SUBMIT_EXTENSION) {
> > +		ret =3D v3d_get_extensions(file_priv, args->extensions);
> > +		if (ret) {
> > +			DRM_DEBUG("Failed to get extensions.\n");
> > +			return ret;
> > +		}
> > +	}
> > +
> >  	ret =3D v3d_job_init(v3d, file_priv, (void *)&render,
> > sizeof(*render),
> >  			   v3d_render_job_free, args->in_sync_bcl,
> > V3D_RENDER);
> >  	if (ret)
> > @@ -700,6 +736,19 @@ v3d_submit_tfu_ioctl(struct drm_device *dev,
> > void *data,
> > =20
> >  	trace_v3d_submit_tfu_ioctl(&v3d->drm, args->iia);
> > =20
> > +	if (args->flags && !(args->flags & DRM_V3D_SUBMIT_EXTENSION)) {
> > +		DRM_DEBUG("invalid flags: %d\n", args->flags);
> > +		return -EINVAL;
> > +	}
> > +
> > +	if (args->flags & DRM_V3D_SUBMIT_EXTENSION) {
> > +		ret =3D v3d_get_extensions(file_priv, args->extensions);
> > +		if (ret) {
> > +			DRM_DEBUG("Failed to get extensions.\n");
> > +			return ret;
> > +		}
> > +	}
> > +
> >  	ret =3D v3d_job_init(v3d, file_priv, (void *)&job, sizeof(*job),
> >  			   v3d_job_free, args->in_sync, V3D_TFU);
> >  	if (ret)
> > @@ -784,11 +833,27 @@ v3d_submit_csd_ioctl(struct drm_device *dev,
> > void *data,
> > =20
> >  	trace_v3d_submit_csd_ioctl(&v3d->drm, args->cfg[5], args-
> > >cfg[6]);
> > =20
> > +	if (args->pad)
> > +		return -EINVAL;
> > +
> >  	if (!v3d_has_csd(v3d)) {
> >  		DRM_DEBUG("Attempting CSD submit on non-CSD
> > hardware\n");
> >  		return -EINVAL;
> >  	}
> > =20
> > +	if (args->flags && !(args->flags & DRM_V3D_SUBMIT_EXTENSION)) {
> > +		DRM_INFO("invalid flags: %d\n", args->flags);
> > +		return -EINVAL;
> > +	}
> > +
> > +	if (args->flags & DRM_V3D_SUBMIT_EXTENSION) {
> > +		ret =3D v3d_get_extensions(file_priv, args->extensions);
> > +		if (ret) {
> > +			DRM_DEBUG("Failed to get extensions.\n");
> > +			return ret;
> > +		}
> > +	}
> > +
> >  	ret =3D v3d_job_init(v3d, file_priv, (void *)&job, sizeof(*job),
> >  			   v3d_job_free, args->in_sync, V3D_CSD);
> >  	if (ret)
> > diff --git a/include/uapi/drm/v3d_drm.h b/include/uapi/drm/v3d_drm.h
> > index 4104f22fb3d3..55b443ca6c0b 100644
> > --- a/include/uapi/drm/v3d_drm.h
> > +++ b/include/uapi/drm/v3d_drm.h
> > @@ -58,6 +58,20 @@ extern "C" {
> >  						   struct
> > drm_v3d_perfmon_get_values)
> > =20
> >  #define DRM_V3D_SUBMIT_CL_FLUSH_CACHE             0x01
> > +#define DRM_V3D_SUBMIT_EXTENSION		  0x02
> > +
> > +/* struct drm_v3d_extension - ioctl extensions
> > + *
> > + * Linked-list of generic extensions where the id identify which
> > struct is
> > + * pointed by ext_data. Therefore, DRM_V3D_EXT_ID_* is used on id to
> > identify
> > + * the extension type.
> > + */
> > +struct drm_v3d_extension {
> > +	__u64 next;
> > +	__u32 id;
> > +#define DRM_V3D_EXT_ID_MULTI_SYNC		0x01
> > +	__u32 flags; /* mbz */
> > +};
> > =20
> >  /**
> >   * struct drm_v3d_submit_cl - ioctl argument for submitting commands
> > to the 3D
> > @@ -135,12 +149,16 @@ struct drm_v3d_submit_cl {
> >  	/* Number of BO handles passed in (size is that times 4). */
> >  	__u32 bo_handle_count;
> > =20
> > +	/* DRM_V3D_SUBMIT_* properties */
> >  	__u32 flags;
> > =20
> >  	/* ID of the perfmon to attach to this job. 0 means no perfmon.
> > */
> >  	__u32 perfmon_id;
> > =20
> >  	__u32 pad;
> > +
> > +	/* Pointer to an array of ioctl extensions*/
> > +	__u64 extensions;
> >  };
> > =20
> >  /**
> > @@ -248,6 +266,12 @@ struct drm_v3d_submit_tfu {
> >  	__u32 in_sync;
> >  	/* Sync object to signal when the TFU job is done. */
> >  	__u32 out_sync;
> > +
> > +	__u32 flags;
> > +
> > +	/* Pointer to an array of ioctl extensions*/
> > +	__u64 extensions;
>=20
> We want __u64 fields aligned to 64-bit so we should swap the positions
> of flags and extensions.

hmm.. not sure. before two arrays of 4 x _u32 elements, we have seven
_u32 elements... this is why I counted a odd number of _u32 and put _u32
flags before _u64 extensions... or is it working different for array
types?

For the same reason, I think there is an unalignment issue on
submit_csd that would need to change the current interface to solve
(afaiu)...=20

>=20
> > +
> >  };
> > =20
> >  /* Submits a compute shader for dispatch.  This job will block on
> > any
> > @@ -276,6 +300,13 @@ struct drm_v3d_submit_csd {
> > =20
> >  	/* ID of the perfmon to attach to this job. 0 means no perfmon.
> > */
> >  	__u32 perfmon_id;
> > +
> > +	/* Pointer to an array of ioctl extensions*/
> > +	__u64 extensions;
> > +
> > +	__u32 flags;
> > +
> > +	__u32 pad;
> >  };
> > =20
> >  enum {
>=20

--vvb6tp4magjvdc4v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmFVgeAACgkQwqF3j0dL
ehy8ORAAx/3+t/zJdS+1KzP7jNOue7VwOtri56WXTH4tR5FseN9wn9P193Q7DcEJ
2XgOHQOnTsovyC6+X8/PCsfkcRri8SLqNWlnq9bUyW/oHK4OcLnS+6HKXnOv0Rgv
5DR4Uh5vlxYlGIeiSHF9bhqVHKpbub3M0CNVj47wtZWRYwHCwXR5LujZ/UcnKD0N
e/KKtqKB3RyGOfhGlL8B0mJ0GWsPgHy8nIsQk2ZF/rRtOiMkZjd1XwpM2D/ZSsib
uHOd83wOcO/qIAjZiFn9s+OUxQknGuAnEU14zEaqynGeq7ztOrnDQMTWx9hqhxuX
LbRuzF8ITYQLDyejQp1MMhyyHGjIxZGL/GfbYcdbMsLlWy8jWab/AWh6jthBiDo4
X1B+xq6eFmuaa4hbXHZ5tE60maduTTN4lrLsH/uaK/dfDUp9Ds3GENXMlAW0Qyfr
B5CzkoSPtJqtHqPh94Ts9eg4A7GYg/aeOVYDR140fK+nxvFP3muN4vAx4HZCgpMo
znRbpyohYmXj5Q3g6w5OUzX2/xj3+b4iLt9u5r3O2LcFrHOq1TIQ6lUotdnnqDv5
BmLLLr5AB//QpOjaPgti2td1k/+KWiCv0aod15M28cuPKUoUFzgebqpv4yu/7mzG
+BWYyk+oZV3rLZ6SILvpAnS3B6SWwP+t9RizqCTtJSku/lWNw/0=
=8MNj
-----END PGP SIGNATURE-----

--vvb6tp4magjvdc4v--
