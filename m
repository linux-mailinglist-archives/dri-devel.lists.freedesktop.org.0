Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD263DF5C5
	for <lists+dri-devel@lfdr.de>; Tue,  3 Aug 2021 21:35:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB7E189F38;
	Tue,  3 Aug 2021 19:35:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C638C89F38
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Aug 2021 19:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date;
 bh=/bspmheC6SMFE4pCpQ4CVBigOoa62QFBYqC6DmvmADM=; 
 b=YZnar2C3m72PZ7FTKTkw68sK+GvnHehRTdbBImbooQL+WeJoY+tZvCHm2oxko8RvgPjnpoq4sQHGE0PSmph5MCNNAZezbA+j4uEVJ0jH4lxR30jfp2ITbzBFrHOHz+A3kTFYzEygGrj5AsK1QfAnYV4dDXymr9HWv5Y2Fq8JEpcp1jrec10QIsQvkvL2imwsPZ5sY8hJjk9UEKaStDwUasg+bVFV0IVlx4nYWBgRc4ByQIz5jamkZD/yR8mS3qWBC6Pc/t60ehuXGIhN0e59TrI7/C0na1yUvuPuZdmG7Hgg0RM6/6Z2iHCnQyb1sBekXBwZXsOimmcU1eMZqIvjUQ==;
Received: from a95-92-181-29.cpe.netcabo.pt ([95.92.181.29]
 helo=mail.igalia.com) by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1mB0CM-0006Bv-Sd; Tue, 03 Aug 2021 21:35:35 +0200
Date: Tue, 3 Aug 2021 20:35:11 +0100
From: Melissa Wen <mwen@igalia.com>
To: Sumera Priyadarsini <sylphrenadin@gmail.com>
Cc: melissa.srw@gmail.com, rodrigosiqueiramelo@gmail.com,
 hamohammed.sa@gmail.com, daniel@ffwll.ch, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V5 2/2] drm/vkms: Add support for virtual hardware mode
Message-ID: <20210803193511.dfelweisefgahw7b@mail.igalia.com>
References: <cover.1627831087.git.sylphrenadin@gmail.com>
 <8881e29603540485e464d46f2ef1d15f8c4969cf.1627831087.git.sylphrenadin@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ur5bcld65xun6s5f"
Content-Disposition: inline
In-Reply-To: <8881e29603540485e464d46f2ef1d15f8c4969cf.1627831087.git.sylphrenadin@gmail.com>
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


--ur5bcld65xun6s5f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 08/01, Sumera Priyadarsini wrote:
> Add a virtual hardware or vblank-less mode as a module
> to enable VKMS to emulate virtual hardware drivers. This means
> no vertical blanking events occur and pageflips are completed
> arbitrarily and when required for updating the frame.
>=20
> Add a new drm_crtc_helper_funcs struct,
> vkms_virtual_crtc_helper_funcs() which holds the atomic helpers
> for virtual hardware mode. Rename the existing
> vkms_crtc_helper_funcs struct to vkms_vblank_crtc_helper_funcs
> which holds atomic helpers for the vblank mode.
> This makes the code flow clearer and testing
> virtual hardware mode.
>=20
Hi Sumera,

Thanks for working to enable it.

> Add a function vkms_crtc_composer() which calls the helper function,
> vkms_composer_common() for plane composition in vblank-less mode.
> vkms_crtc_composer() is directly called in the atomic hook in
> vkms_crtc_atomic_begin().
>=20
> However, some crc captures still use vblanks which causes the crc-based
> igt tests to crash. Currently, I am unsure about how to approach the
> one-shot implementation of crc reads so I am still working on that.
>
We've briefly discussed on irc that we could go ahead without covering
crc-based tests. However, we should not introduce errors in the driver
when trying to set crc source.=20
For this, we need to avoid that vblank_get/put calls in
vkms_set_crc_source (vkms_composer.c) Can you check it, please?

> This patchset has been tested with the igt tests- kms_writeback, kms_atom=
ic
> , kms_lease, kms_flip, kms_pipe_get_crc and preserves results except for
> subtests related to crc reads and skips tests that rely on vertical
> blanking.
>=20
> The patch is based on Rodrigo Siqueira's
> patch(https://patchwork.freedesktop.org/patch/316851/?series=3D48469&rev=
=3D3)
> and the ensuing review.
>=20
> Signed-off-by: Sumera Priyadarsini <sylphrenadin@gmail.com>
> ---
> Changes in V5:
> - Move vkms_crtc_composer() to this patch(Melissa)
> - Add more clarification for "vblank-less" mode(Pekka)
> - Replace kzalloc() with kvmalloc() in compose_active_planes()
> to fix memory allocation error for output frame
> - Fix checkpatch warnings (Melissa)
> Changes in V3:
> - Refactor patchset(Melissa)
> Changes in V2:
> - Add atomic helper functions in a separate struct for virtual hardware
> mode (Daniel)
> - Remove spinlock across 'vkms_output->lock' in vkms_crtc.c(Daniel)
> - Add vkms_composer_common() (Daniel)
> ---
>  drivers/gpu/drm/vkms/vkms_composer.c | 21 ++++++++++--
>  drivers/gpu/drm/vkms/vkms_crtc.c     | 51 ++++++++++++++++++++--------
>  drivers/gpu/drm/vkms/vkms_drv.c      | 16 ++++++---
>  drivers/gpu/drm/vkms/vkms_drv.h      |  2 ++
>  4 files changed, 69 insertions(+), 21 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/=
vkms_composer.c
> index bf3d576db225..2988d5b49eb6 100644
> --- a/drivers/gpu/drm/vkms/vkms_composer.c
> +++ b/drivers/gpu/drm/vkms/vkms_composer.c
> @@ -176,11 +176,12 @@ static int compose_active_planes(void **vaddr_out,
>  {
>  	struct drm_framebuffer *fb =3D &primary_composer->fb;
>  	struct drm_gem_object *gem_obj =3D drm_gem_fb_get_obj(fb, 0);
> +
>  	const void *vaddr;
>  	int i;
> =20
>  	if (!*vaddr_out) {
> -		*vaddr_out =3D kzalloc(gem_obj->size, GFP_KERNEL);
> +		*vaddr_out =3D kvmalloc(gem_obj->size, GFP_KERNEL);

Is this change necessary to enable vblank-less mode? Or is it treating
another problem?

>  		if (!*vaddr_out) {
>  			DRM_ERROR("Cannot allocate memory for output frame.");
>  			return -ENOMEM;
> @@ -229,7 +230,7 @@ int vkms_composer_common(struct vkms_crtc_state *crtc=
_state,
> =20
>  	if (ret) {
>  		if ((ret =3D=3D -EINVAL || ret =3D=3D -ENOMEM) && !wb_pending)
> -			kfree(vaddr_out);
> +			kvfree(vaddr_out);
>  		return ret;
>  	}
> =20
> @@ -241,7 +242,7 @@ int vkms_composer_common(struct vkms_crtc_state *crtc=
_state,
>  		crtc_state->wb_pending =3D false;
>  		spin_unlock_irq(&out->composer_lock);
>  	} else {
> -		kfree(vaddr_out);
> +		kvfree(vaddr_out);
>  	}
> =20
>  	return 0;
> @@ -295,6 +296,20 @@ void vkms_composer_worker(struct work_struct *work)
>  		drm_crtc_add_crc_entry(crtc, true, frame_start++, &crc32);
>  }
> =20
> +void vkms_crtc_composer(struct vkms_crtc_state *crtc_state)
> +{
> +	struct drm_crtc *crtc =3D crtc_state->base.crtc;
> +	struct vkms_output *out =3D drm_crtc_to_vkms_output(crtc);
> +	u32 crc32 =3D 0;
> +	int ret;
> +
> +	ret =3D vkms_composer_common(crtc_state, out, crtc_state->wb_pending, &=
crc32);
> +	if (ret =3D=3D -EINVAL)
> +		return;
> +
> +	drm_crtc_add_crc_entry(crtc, true, 0, &crc32);
> +}
> +
>  static const char * const pipe_crc_sources[] =3D {"auto"};
> =20
>  const char *const *vkms_get_crc_sources(struct drm_crtc *crtc,
> diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms=
_crtc.c
> index 57bbd32e9beb..8477b33c4d09 100644
> --- a/drivers/gpu/drm/vkms/vkms_crtc.c
> +++ b/drivers/gpu/drm/vkms/vkms_crtc.c
> @@ -222,20 +222,20 @@ static int vkms_crtc_atomic_check(struct drm_crtc *=
crtc,
>  	return 0;
>  }
> =20
> -static void vkms_crtc_atomic_enable(struct drm_crtc *crtc,
> -				    struct drm_atomic_state *state)
> +static void vkms_vblank_crtc_atomic_enable(struct drm_crtc *crtc,
> +					   struct drm_atomic_state *state)
>  {
>  	drm_crtc_vblank_on(crtc);
>  }
> =20
> -static void vkms_crtc_atomic_disable(struct drm_crtc *crtc,
> -				     struct drm_atomic_state *state)
> +static void vkms_vblank_crtc_atomic_disable(struct drm_crtc *crtc,
> +					    struct drm_atomic_state *state)
>  {
>  	drm_crtc_vblank_off(crtc);
>  }
> =20
> -static void vkms_crtc_atomic_begin(struct drm_crtc *crtc,
> -				   struct drm_atomic_state *state)
> +static void vkms_vblank_crtc_atomic_begin(struct drm_crtc *crtc,
> +					  struct drm_atomic_state *state)
>  {
>  	struct vkms_output *vkms_output =3D drm_crtc_to_vkms_output(crtc);
> =20
> @@ -245,8 +245,8 @@ static void vkms_crtc_atomic_begin(struct drm_crtc *c=
rtc,
>  	spin_lock_irq(&vkms_output->lock);
>  }
> =20
> -static void vkms_crtc_atomic_flush(struct drm_crtc *crtc,
> -				   struct drm_atomic_state *state)
> +static void vkms_vblank_crtc_atomic_flush(struct drm_crtc *crtc,
> +					  struct drm_atomic_state *state)
>  {
>  	struct vkms_output *vkms_output =3D drm_crtc_to_vkms_output(crtc);
> =20
> @@ -268,18 +268,38 @@ static void vkms_crtc_atomic_flush(struct drm_crtc =
*crtc,
>  	spin_unlock_irq(&vkms_output->lock);
>  }
> =20
> -static const struct drm_crtc_helper_funcs vkms_crtc_helper_funcs =3D {
> +/*
> + * Crtc functions for virtual hardware/vblankless mode
> + */
> +static void vkms_virtual_crtc_atomic_flush(struct drm_crtc *crtc,
> +					   struct drm_atomic_state *state)
> +{
> +	struct vkms_output *vkms_output =3D drm_crtc_to_vkms_output(crtc);
> +	struct vkms_crtc_state *vkms_state =3D to_vkms_crtc_state(crtc->state);
> +
> +	vkms_crtc_composer(vkms_state);
> +
> +	vkms_output->composer_state =3D to_vkms_crtc_state(crtc->state);
> +}
> +
> +static const struct drm_crtc_helper_funcs vkms_vblank_crtc_helper_funcs =
=3D {
>  	.atomic_check	=3D vkms_crtc_atomic_check,
> -	.atomic_begin	=3D vkms_crtc_atomic_begin,
> -	.atomic_flush	=3D vkms_crtc_atomic_flush,
> -	.atomic_enable	=3D vkms_crtc_atomic_enable,
> -	.atomic_disable	=3D vkms_crtc_atomic_disable,
> +	.atomic_begin	=3D vkms_vblank_crtc_atomic_begin,
> +	.atomic_flush	=3D vkms_vblank_crtc_atomic_flush,
> +	.atomic_enable	=3D vkms_vblank_crtc_atomic_enable,
> +	.atomic_disable	=3D vkms_vblank_crtc_atomic_disable,
> +};
> +
> +static const struct drm_crtc_helper_funcs vkms_virtual_crtc_helper_funcs=
 =3D {
> +	.atomic_check	=3D vkms_crtc_atomic_check,
> +	.atomic_flush	=3D vkms_virtual_crtc_atomic_flush,
>  };
> =20
>  int vkms_crtc_init(struct drm_device *dev, struct drm_crtc *crtc,
>  		   struct drm_plane *primary, struct drm_plane *cursor)
>  {
>  	struct vkms_output *vkms_out =3D drm_crtc_to_vkms_output(crtc);
> +	struct vkms_device *vkmsdev =3D drm_device_to_vkms_device(dev);
>  	int ret;
> =20
>  	ret =3D drm_crtc_init_with_planes(dev, crtc, primary, cursor,
> @@ -289,7 +309,10 @@ int vkms_crtc_init(struct drm_device *dev, struct dr=
m_crtc *crtc,
>  		return ret;
>  	}
> =20
> -	drm_crtc_helper_add(crtc, &vkms_crtc_helper_funcs);
> +	if (vkmsdev->config->virtual_hw)
> +		drm_crtc_helper_add(crtc, &vkms_virtual_crtc_helper_funcs);
> +	else
> +		drm_crtc_helper_add(crtc, &vkms_vblank_crtc_helper_funcs);
> =20
>  	spin_lock_init(&vkms_out->lock);
>  	spin_lock_init(&vkms_out->composer_lock);
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_=
drv.c
> index 0ffe5f0e33f7..ee78f5eef653 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.c
> +++ b/drivers/gpu/drm/vkms/vkms_drv.c
> @@ -51,6 +51,10 @@ static bool enable_overlay;
>  module_param_named(enable_overlay, enable_overlay, bool, 0444);
>  MODULE_PARM_DESC(enable_overlay, "Enable/Disable overlay support");
> =20
> +static bool enable_virtual_hw;
> +module_param_named(enable_virtual_hw, enable_virtual_hw, bool, 0444);
> +MODULE_PARM_DESC(enable_virtual_hw, "Enable/Disable virtual hardware mod=
e(vblank-less mode)");
> +
>  DEFINE_DRM_GEM_FOPS(vkms_driver_fops);
> =20
>  static void vkms_release(struct drm_device *dev)
> @@ -98,6 +102,7 @@ static int vkms_config_show(struct seq_file *m, void *=
data)
>  	seq_printf(m, "writeback=3D%d\n", vkmsdev->config->writeback);
>  	seq_printf(m, "cursor=3D%d\n", vkmsdev->config->cursor);
>  	seq_printf(m, "overlay=3D%d\n", vkmsdev->config->overlay);
> +	seq_printf(m, "virtual_hw=3D%d\n", vkmsdev->config->virtual_hw);
> =20
>  	return 0;
>  }
> @@ -191,10 +196,12 @@ static int vkms_create(struct vkms_config *config)
>  		goto out_devres;
>  	}
> =20
> -	ret =3D drm_vblank_init(&vkms_device->drm, 1);
> -	if (ret) {
> -		DRM_ERROR("Failed to vblank\n");
> -		goto out_devres;
> +	if (!vkms_device->config->virtual_hw) {
> +		ret =3D drm_vblank_init(&vkms_device->drm, 1);
> +		if (ret) {
> +			DRM_ERROR("Failed to vblank\n");
> +			goto out_devres;
> +		}
>  	}
> =20
>  	ret =3D vkms_modeset_init(vkms_device);
> @@ -229,6 +236,7 @@ static int __init vkms_init(void)
>  	config->cursor =3D enable_cursor;
>  	config->writeback =3D enable_writeback;
>  	config->overlay =3D enable_overlay;
> +	config->virtual_hw =3D enable_virtual_hw;
> =20
>  	return vkms_create(config);
>  }
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_=
drv.h
> index 01beba424f18..770594e07f0e 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.h
> +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> @@ -92,6 +92,7 @@ struct vkms_config {
>  	bool writeback;
>  	bool cursor;
>  	bool overlay;
> +	bool virtual_hw;
>  	/* only set when instantiated */
>  	struct vkms_device *dev;
>  };
> @@ -136,6 +137,7 @@ int vkms_composer_common(struct vkms_crtc_state *crtc=
_state, struct vkms_output
>  			 bool wb_pending, uint32_t *crcs);
>  void vkms_composer_worker(struct work_struct *work);
>  void vkms_set_composer(struct vkms_output *out, bool enabled);
> +void vkms_crtc_composer(struct vkms_crtc_state *crtc_state);
> =20
>  /* Writeback */
>  int vkms_enable_writeback_connector(struct vkms_device *vkmsdev);
> --=20
> 2.31.1
>=20

--ur5bcld65xun6s5f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmEJmmoACgkQwqF3j0dL
ehyBVxAAwCP1WQwndHrnNXRsQYDzxfbvCdr52HojgLFhk2pKo1Q+DmTDP9aGTDY+
JbjCNd92qBcGTxaXiw55HnXbJzDz2LXJzf5UDntjP3zvte53MBWxmejOdQKVtHr2
Xa6Jssh3PuO6f41QrI8SdDnZpDHE+wYl90fVxXX5qZGrtCa18pHkAOX2fE1x8J4h
dg0W0PsJASQ70Xg2BIxyP4lPUuSI12QEIx9fe6xJC73B8rB1+rdSoKRYfWpDV6A9
EBkjoJ1fGpj6eavySm6SSsZaGmkyTOiZ0OrhsjFsW6DTLxcSgyETvSfLeVMVtXVO
hfLJubotUAYc8TTZDP+v3OoE1MUkAZ5PP0P8U+mzAw6XObY2nx4OkYu5SoLLHe/T
vDkdeNJX1NNpjgcMG400PFK8mfb/gZB7o+0QFwevTmUoDal97xhxYvjHEWFeqIXf
OG6um3wHD3zSqkIklhQfXsXIsRNCpCp+nKC7DcIAEl+wxpjRBmc9ClJX+MBGx1zF
J555B6zAzZW5kJOkjVFj4K/3WgIN3sSKTUwME8oc1qnWlj4awLRzV02TIk1Xlt57
5PlZOAsdEmsOa4sKPzDTIr6P3lgSlZ/j2sQMx3OkphBh2nHrCQdAidOfnWWyFXnP
Z/wjBDql2i0vY0swA+1s9OwRjNiQX6gAYujHmyDGDbxanSSDeEM=
=WXRw
-----END PGP SIGNATURE-----

--ur5bcld65xun6s5f--
