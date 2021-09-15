Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 174CE40CA16
	for <lists+dri-devel@lfdr.de>; Wed, 15 Sep 2021 18:29:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D19F56E975;
	Wed, 15 Sep 2021 16:29:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 182566E975
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Sep 2021 16:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date;
 bh=8cOoZXq32EGVhIOy9gPTRHEDNTuYLOgRocpTKkaQC0o=; 
 b=lcpc0xrbC0ameTQ3x1psHjkTe603vWcmbY9594AZkBzk9Ou0SDMDEA6BAQ6vXiXuAOGNgKGZ0haOzohjd3WLcybKGmPC15SDWFmu+OlWvxXUsos4KT5yAvqAcBsBZeUPxix8R2kgf2lU88FLTsKxVRRk4o91DSO6X6isFN7qPLnqIb0GOPzNOo6WzviaOnViF7QeDGcGAYW8d41In4fQD0CGTkHO5E002KGi76ffMO8B2u99Ru+CvtPmXHBO+QXqhMtxkvpBXLDbOShspBBNc8elJMIyGhhNV2qp/v65D3gijlLgJfgVFt2spVlt5ijhT+JT3DOn5EzqCgacTW0zOw==;
Received: from a95-92-181-29.cpe.netcabo.pt ([95.92.181.29]
 helo=mail.igalia.com) by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1mQXn1-0000Wz-LG; Wed, 15 Sep 2021 18:29:39 +0200
Date: Wed, 15 Sep 2021 17:28:55 +0100
From: Melissa Wen <mwen@igalia.com>
To: Iago Toral <itoral@igalia.com>
Cc: dri-devel@lists.freedesktop.org, Emma Anholt <emma@anholt.net>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Maxime Ripard <maxime@cerno.tech>,
 Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH 2/3] drm/v3d: add generic ioctl extension
Message-ID: <20210915162855.flblzgphxcf6f24h@mail.igalia.com>
References: <cover.1629307160.git.mwen@igalia.com>
 <d5647f22567a71e5ecd3f86f0110aa14f8c6006d.1629307160.git.mwen@igalia.com>
 <633623ded6ffc8c6021648452f171f9da38a02ab.camel@igalia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="uqw2dnk3smrci7cl"
Content-Disposition: inline
In-Reply-To: <633623ded6ffc8c6021648452f171f9da38a02ab.camel@igalia.com>
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


--uqw2dnk3smrci7cl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 09/15, Iago Toral wrote:
> On Wed, 2021-08-18 at 18:56 +0100, Melissa Wen wrote:
> > Add support to attach generic extensions on job submission.
> > This patch is a second prep work to enable multiple syncobjs on job
> > submission. With this work, when the job submission interface needs
> > to be extended to accomodate a new feature, we will use a generic
> > extension struct where an id determines the data type to be pointed.
> > The first application is to enable multiples in/out syncobj (next
> > patch), but the base is already done for future features.
> >=20
> > Signed-off-by: Melissa Wen <mwen@igalia.com>
> > ---
> >  drivers/gpu/drm/v3d/v3d_drv.c |  4 +-
> >  drivers/gpu/drm/v3d/v3d_gem.c | 80 ++++++++++++++++++++++++++++++++-
> > --
> >  include/uapi/drm/v3d_drm.h    | 38 ++++++++++++++++-
> >  3 files changed, 113 insertions(+), 9 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/v3d/v3d_drv.c
> > b/drivers/gpu/drm/v3d/v3d_drv.c
> > index 9403c3b36aca..6a0516160bb2 100644
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
> > @@ -222,7 +221,6 @@ static int v3d_platform_drm_probe(struct
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
> > index 593ed2206d74..e254919b6c5e 100644
> > --- a/drivers/gpu/drm/v3d/v3d_gem.c
> > +++ b/drivers/gpu/drm/v3d/v3d_gem.c
> > @@ -521,6 +521,38 @@ v3d_attach_fences_and_unlock_reservation(struct
> > drm_file *file_priv,
> >  	}
> >  }
> > =20
> > +static int
> > +v3d_get_extensions(struct drm_file *file_priv,
> > +		   u32 ext_count, u64 ext_handles)
> > +{
> > +	int i;
> > +	struct drm_v3d_extension __user *handles;
> > +
> > +	if (!ext_count)
> > +		return 0;
> > +
> > +	handles	=3D u64_to_user_ptr(ext_handles);
> > +	for (i =3D 0; i < ext_count; i++) {
> > +		struct drm_v3d_extension ext;
> > +
> > +		if (copy_from_user(&ext, handles, sizeof(ext))) {
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
> > +		handles =3D u64_to_user_ptr(ext.next);
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> >  /**
> >   * v3d_submit_cl_ioctl() - Submits a job (frame) to the V3D.
> >   * @dev: DRM device
> > @@ -549,15 +581,23 @@ v3d_submit_cl_ioctl(struct drm_device *dev,
> > void *data,
> > =20
> >  	trace_v3d_submit_cl_ioctl(&v3d->drm, args->rcl_start, args-
> > >rcl_end);
> > =20
> > -	if (args->pad !=3D 0)
> > -		return -EINVAL;
> > -
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
> > +		ret =3D v3d_get_extensions(file_priv,
> > +					 args->extension_count,
> > +					 args->extensions);
> > +		if (ret) {
> > +			DRM_DEBUG("Failed to get extensions.\n");
> > +			return ret;
> > +		}
> > +	}
> > +
> >  	render =3D kcalloc(1, sizeof(*render), GFP_KERNEL);
> >  	if (!render)
> >  		return -ENOMEM;
> > @@ -711,6 +751,21 @@ v3d_submit_tfu_ioctl(struct drm_device *dev,
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
> > +		ret =3D v3d_get_extensions(file_priv,
> > +					 args->extension_count,
> > +					 args->extensions);
> > +		if (ret) {
> > +			DRM_DEBUG("Failed to get extensions.\n");
> > +			return ret;
> > +		}
> > +	}
> > +
> >  	job =3D kcalloc(1, sizeof(*job), GFP_KERNEL);
> >  	if (!job)
> >  		return -ENOMEM;
> > @@ -806,6 +861,21 @@ v3d_submit_csd_ioctl(struct drm_device *dev,
> > void *data,
> >  		return -EINVAL;
> >  	}
> > =20
> > +	if (args->flags && !(args->flags & DRM_V3D_SUBMIT_EXTENSION)) {
> > +		DRM_DEBUG("Invalid flags: %d\n", args->flags);
> > +		return -EINVAL;
> > +	}
> > +
> > +	if (args->flags & DRM_V3D_SUBMIT_EXTENSION) {
> > +		ret =3D v3d_get_extensions(file_priv,
> > +					 args->extension_count,
> > +					 args->extensions);
> > +		if (ret) {
> > +			DRM_DEBUG("Failed to get extensions.\n");
> > +			return ret;
> > +		}
> > +	}
> > +
> >  	job =3D kcalloc(1, sizeof(*job), GFP_KERNEL);
> >  	if (!job)
> >  		return -ENOMEM;
> > diff --git a/include/uapi/drm/v3d_drm.h b/include/uapi/drm/v3d_drm.h
> > index 4104f22fb3d3..1f4706010eb5 100644
> > --- a/include/uapi/drm/v3d_drm.h
> > +++ b/include/uapi/drm/v3d_drm.h
> > @@ -58,6 +58,19 @@ extern "C" {
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
> > +	__u64 ext_data;
> > +	__u32 id;
> > +};
> > =20
> >  /**
> >   * struct drm_v3d_submit_cl - ioctl argument for submitting commands
> > to the 3D
> > @@ -135,12 +148,17 @@ struct drm_v3d_submit_cl {
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
> > -	__u32 pad;
> > +	/* Number of extensions*/
> > +	__u32 extension_count;
> > +
> > +	/* Pointer to a list of ioctl extensions*/
> > +	__u64 extensions;
> >  };
> > =20
> >  /**
> > @@ -248,6 +266,15 @@ struct drm_v3d_submit_tfu {
> >  	__u32 in_sync;
> >  	/* Sync object to signal when the TFU job is done. */
> >  	__u32 out_sync;
> > +
> > +	/* Number of extensions*/
> > +	__u32 extension_count;
> > +
> > +	/* Pointer to an array of ioctl extensions*/
> > +	__u64 extensions;
> > +
> > +	/* DRM_V3D_SUBMIT_* properties */
> > +	__u32 flags;
>=20
> A silly nit: maybe put flags before the extension fields above for
> consistency with the CSD and CL submission commands.

hmm.. I arranged it that way for alignment reasons (afaiu), but I can
(or should) include a _u32 pad right after out_sync to set these in the
same sequence.

>=20
> >  };
> > =20
> >  /* Submits a compute shader for dispatch.  This job will block on
> > any
> > @@ -276,6 +303,15 @@ struct drm_v3d_submit_csd {
> > =20
> >  	/* ID of the perfmon to attach to this job. 0 means no perfmon.
> > */
> >  	__u32 perfmon_id;
> > +
> > +	/* DRM_V3D_SUBMIT_* properties */
> > +	__u32 flags;
> > +
> > +	/* Number of extensions*/
> > +	__u32 extension_count;
> > +
> > +	/* Pointer to a list of ioctl extensions*/
> > +	__u64 extensions;
> >  };
> > =20
> >  enum {
>=20

--uqw2dnk3smrci7cl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmFCH0IACgkQwqF3j0dL
ehxy2Q//dqUuPhXkXG5ebJotmdEQhVhYGUggPmVddC+OHbMaFlftHy7dF55d1j67
lSuFQS4/I9klJbKJdCOHKeOcei0EA7sKmHS+LjxAU2ux3/m7HwLcBNjKtGFXhQMb
GA84VhJIPG/ju2gfj05kmfGqGaLu3fZK3fC2qtNgnc2kk8pBbBrLoGIvqgSyVviO
Si6p5yWnpRcl0shZPxf5dKB+1WTlSVpr8vt7mV4jkgvAuksOavARsE5X8yfU5KRO
QV69HaGqur2uHV9O2F5jmXsFogq8qDfLWKeTRmB9nIN9km8GvNS8Hyk/CUo02XBc
SDFhYWcy4JjItB7LggMzPshBijBB4S/vob/SlgnXSfzBrehWUIZ9THnNXXRuvI0r
VDEjS0kV9wKiU7kb/7gbpFtZBnfyaHusE68JT5psbKJirO98yvS4JwB0SUthbizd
16Ux4L6FlcJF90o8R2H2MLq8N0iA2Ujsebe96mS06OuzBzfCAnrMmAkGM0mAu/m7
7PF9mieZX0O+nLqb8N6vFC3iCErH8bEQ7q4xb/AtgqmLq5LjYuICgLsvnpnW5bL8
0XQiKIUa6S+gKXJedyCjALxbM8EDt/5M4DpWenwq7m5biwSP0V0N9BioCgZM90m7
zcFWqfkO1vSANNRvQesF9qKWAKxRkewU02n7XWQiVaUSJJR9e/Y=
=0v/C
-----END PGP SIGNATURE-----

--uqw2dnk3smrci7cl--
