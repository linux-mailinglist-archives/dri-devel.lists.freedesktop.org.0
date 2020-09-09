Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 562E0263E7D
	for <lists+dri-devel@lfdr.de>; Thu, 10 Sep 2020 09:22:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C34F6E0AB;
	Thu, 10 Sep 2020 07:22:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0CBD6EA28
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Sep 2020 13:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1599658022; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T8lnoKhsCUY5CvSXbytb5xAOyRFedc3onw2Z1ZZ1SPc=;
 b=SyOv/PjepyWhbP/JwnQqHSaMVGCmaWeKb2UO2G0F8Ce3rgx+3tVPnUfEV2SqgW1eoaimK1
 htJzuC8vX2cDbF/mayd7tm9Osolvh2ZWeK36kJoo47VQNhc5D7XAKqCD9hhwEyBZPUStad
 G0Ly+P12ZqM1bRI9g1R6c8OWBZZfbgo=
Date: Wed, 09 Sep 2020 15:26:52 +0200
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v4] gpu/drm: ingenic: Add option to mmap GEM buffers cached
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Sam Ravnborg <sam@ravnborg.org>
Message-Id: <S08EGQ.NOF31L8HCYTS1@crapouillou.net>
In-Reply-To: <20200822164233.71583-1-paul@crapouillou.net>
References: <20200822164233.71583-1-paul@crapouillou.net>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 10 Sep 2020 07:22:25 +0000
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
Cc: od@zcrc.me, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Any love for my patch? I have more pending :)

Thanks,
-Paul


Le sam. 22 ao=FBt 2020 =E0 18:42, Paul Cercueil <paul@crapouillou.net> a =

=E9crit :
> Ingenic SoCs are most notably used in cheap chinese handheld gaming
> consoles. There, the games and applications generally render in =

> software
> directly into GEM buffers.
> =

> Traditionally, GEM buffers are mapped write-combine. Writes to the
> buffer are accelerated, and reads are slow. Application doing lots of
> alpha-blending paint inside shadow buffers, which is then memcpy'd =

> into
> the final GEM buffer.
> =

> On recent Ingenic SoCs however, it is much faster to have a fully =

> cached
> GEM buffer, in which applications paint directly, and whose data is
> invalidated before scanout, than having a write-combine GEM buffer, =

> even
> when alpha blending is not used.
> =

> Add an optional 'cached_gem_buffers' parameter to the ingenic-drm =

> driver
> to allow GEM buffers to be mapped fully-cached, in order to speed up
> software rendering.
> =

> v2: Use standard noncoherent DMA APIs
> =

> v3: Use damage clips instead of invalidating full frames
> =

> v4: Avoid dma_pgprot() which is not exported. Using vm_get_page_prot()
>     is enough in this case.
> =

> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 107 =

> +++++++++++++++++++++-
>  drivers/gpu/drm/ingenic/ingenic-drm.h     |   4 +
>  drivers/gpu/drm/ingenic/ingenic-ipu.c     |  12 ++-
>  3 files changed, 119 insertions(+), 4 deletions(-)
> =

> diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c =

> b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> index 5dab9c3d0a52..bf571411b73f 100644
> --- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> +++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> @@ -9,6 +9,8 @@
>  #include <linux/component.h>
>  #include <linux/clk.h>
>  #include <linux/dma-mapping.h>
> +#include <linux/dma-noncoherent.h>
> +#include <linux/io.h>
>  #include <linux/module.h>
>  #include <linux/of_device.h>
>  #include <linux/platform_device.h>
> @@ -19,6 +21,7 @@
>  #include <drm/drm_bridge.h>
>  #include <drm/drm_crtc.h>
>  #include <drm/drm_crtc_helper.h>
> +#include <drm/drm_damage_helper.h>
>  #include <drm/drm_drv.h>
>  #include <drm/drm_gem_cma_helper.h>
>  #include <drm/drm_fb_cma_helper.h>
> @@ -76,6 +79,11 @@ static const u32 ingenic_drm_primary_formats[] =3D {
>  	DRM_FORMAT_XRGB8888,
>  };
> =

> +static bool ingenic_drm_cached_gem_buf;
> +module_param_named(cached_gem_buffers, ingenic_drm_cached_gem_buf, =

> bool, 0400);
> +MODULE_PARM_DESC(cached_gem_buffers,
> +		 "Enable fully cached GEM buffers [default=3Dfalse]");
> +
>  static bool ingenic_drm_writeable_reg(struct device *dev, unsigned =

> int reg)
>  {
>  	switch (reg) {
> @@ -338,6 +346,8 @@ static int ingenic_drm_plane_atomic_check(struct =

> drm_plane *plane,
>  	     plane->state->fb->format->format !=3D state->fb->format->format))
>  		crtc_state->mode_changed =3D true;
> =

> +	drm_atomic_helper_check_plane_damage(state->state, state);
> +
>  	return 0;
>  }
> =

> @@ -440,6 +450,38 @@ void ingenic_drm_plane_config(struct device *dev,
>  	}
>  }
> =

> +void ingenic_drm_sync_data(struct device *dev,
> +			   struct drm_plane_state *old_state,
> +			   struct drm_plane_state *state)
> +{
> +	const struct drm_format_info *finfo =3D state->fb->format;
> +	struct ingenic_drm *priv =3D dev_get_drvdata(dev);
> +	struct drm_atomic_helper_damage_iter iter;
> +	unsigned int offset, i;
> +	struct drm_rect clip;
> +	dma_addr_t paddr;
> +	void *addr;
> +
> +	if (!ingenic_drm_cached_gem_buf)
> +		return;
> +
> +	drm_atomic_helper_damage_iter_init(&iter, old_state, state);
> +
> +	drm_atomic_for_each_plane_damage(&iter, &clip) {
> +		for (i =3D 0; i < finfo->num_planes; i++) {
> +			paddr =3D drm_fb_cma_get_gem_addr(state->fb, state, i);
> +			addr =3D phys_to_virt(paddr);
> +
> +			/* Ignore x1/x2 values, invalidate complete lines */
> +			offset =3D clip.y1 * state->fb->pitches[i];
> +
> +			dma_cache_sync(priv->dev, addr + offset,
> +				       (clip.y2 - clip.y1) * state->fb->pitches[i],
> +				       DMA_TO_DEVICE);
> +		}
> +	}
> +}
> +
>  static void ingenic_drm_plane_atomic_update(struct drm_plane *plane,
>  					    struct drm_plane_state *oldstate)
>  {
> @@ -450,6 +492,8 @@ static void =

> ingenic_drm_plane_atomic_update(struct drm_plane *plane,
>  	dma_addr_t addr;
> =

>  	if (state && state->fb) {
> +		ingenic_drm_sync_data(priv->dev, oldstate, state);
> +
>  		addr =3D drm_fb_cma_get_gem_addr(state->fb, state, 0);
>  		width =3D state->src_w >> 16;
>  		height =3D state->src_h >> 16;
> @@ -605,7 +649,62 @@ static void ingenic_drm_disable_vblank(struct =

> drm_crtc *crtc)
>  	regmap_update_bits(priv->map, JZ_REG_LCD_CTRL, JZ_LCD_CTRL_EOF_IRQ, =

> 0);
>  }
> =

> -DEFINE_DRM_GEM_CMA_FOPS(ingenic_drm_fops);
> +static struct drm_framebuffer *
> +ingenic_drm_gem_fb_create(struct drm_device *dev, struct drm_file =

> *file,
> +			  const struct drm_mode_fb_cmd2 *mode_cmd)
> +{
> +	if (ingenic_drm_cached_gem_buf)
> +		return drm_gem_fb_create_with_dirty(dev, file, mode_cmd);
> +
> +	return drm_gem_fb_create(dev, file, mode_cmd);
> +}
> +
> +static int ingenic_drm_gem_mmap(struct drm_gem_object *obj,
> +				struct vm_area_struct *vma)
> +{
> +	struct drm_gem_cma_object *cma_obj =3D to_drm_gem_cma_obj(obj);
> +	struct device *dev =3D cma_obj->base.dev->dev;
> +
> +	if (!ingenic_drm_cached_gem_buf)
> +		return drm_gem_cma_prime_mmap(obj, vma);
> +
> +	/*
> +	 * Clear the VM_PFNMAP flag that was set by drm_gem_mmap(), and set =

> the
> +	 * vm_pgoff (used as a fake buffer offset by DRM) to 0 as we want =

> to map
> +	 * the whole buffer.
> +	 */
> +	vma->vm_flags &=3D ~VM_PFNMAP;
> +	vma->vm_pgoff =3D 0;
> +	vma->vm_page_prot =3D vm_get_page_prot(vma->vm_flags);
> +
> +	return dma_mmap_attrs(dev, vma, cma_obj->vaddr, cma_obj->paddr,
> +			      vma->vm_end - vma->vm_start,
> +			      DMA_ATTR_NON_CONSISTENT);
> +}
> +
> +static int ingenic_drm_gem_cma_mmap(struct file *filp,
> +				    struct vm_area_struct *vma)
> +{
> +	int ret;
> +
> +	ret =3D drm_gem_mmap(filp, vma);
> +	if (ret)
> +		return ret;
> +
> +	return ingenic_drm_gem_mmap(vma->vm_private_data, vma);
> +}
> +
> +static const struct file_operations ingenic_drm_fops =3D {
> +	.owner		=3D THIS_MODULE,
> +	.open		=3D drm_open,
> +	.release	=3D drm_release,
> +	.unlocked_ioctl	=3D drm_ioctl,
> +	.compat_ioctl	=3D drm_compat_ioctl,
> +	.poll		=3D drm_poll,
> +	.read		=3D drm_read,
> +	.llseek		=3D noop_llseek,
> +	.mmap		=3D ingenic_drm_gem_cma_mmap,
> +};
> =

>  static struct drm_driver ingenic_drm_driver_data =3D {
>  	.driver_features	=3D DRIVER_MODESET | DRIVER_GEM | DRIVER_ATOMIC,
> @@ -669,7 +768,7 @@ static const struct drm_encoder_helper_funcs =

> ingenic_drm_encoder_helper_funcs =3D
>  };
> =

>  static const struct drm_mode_config_funcs =

> ingenic_drm_mode_config_funcs =3D {
> -	.fb_create		=3D drm_gem_fb_create,
> +	.fb_create		=3D ingenic_drm_gem_fb_create,
>  	.output_poll_changed	=3D drm_fb_helper_output_poll_changed,
>  	.atomic_check		=3D drm_atomic_helper_check,
>  	.atomic_commit		=3D drm_atomic_helper_commit,
> @@ -796,6 +895,8 @@ static int ingenic_drm_bind(struct device *dev)
>  		return ret;
>  	}
> =

> +	drm_plane_enable_fb_damage_clips(&priv->f1);
> +
>  	drm_crtc_helper_add(&priv->crtc, &ingenic_drm_crtc_helper_funcs);
> =

>  	ret =3D drm_crtc_init_with_planes(drm, &priv->crtc, &priv->f1,
> @@ -821,6 +922,8 @@ static int ingenic_drm_bind(struct device *dev)
>  			return ret;
>  		}
> =

> +		drm_plane_enable_fb_damage_clips(&priv->f0);
> +
>  		if (IS_ENABLED(CONFIG_DRM_INGENIC_IPU)) {
>  			ret =3D component_bind_all(dev, drm);
>  			if (ret) {
> diff --git a/drivers/gpu/drm/ingenic/ingenic-drm.h =

> b/drivers/gpu/drm/ingenic/ingenic-drm.h
> index 43f7d959cff7..df99f0f75d39 100644
> --- a/drivers/gpu/drm/ingenic/ingenic-drm.h
> +++ b/drivers/gpu/drm/ingenic/ingenic-drm.h
> @@ -168,6 +168,10 @@ void ingenic_drm_plane_config(struct device *dev,
>  			      struct drm_plane *plane, u32 fourcc);
>  void ingenic_drm_plane_disable(struct device *dev, struct drm_plane =

> *plane);
> =

> +void ingenic_drm_sync_data(struct device *dev,
> +			   struct drm_plane_state *old_state,
> +			   struct drm_plane_state *state);
> +
>  extern struct platform_driver *ingenic_ipu_driver_ptr;
> =

>  #endif /* DRIVERS_GPU_DRM_INGENIC_INGENIC_DRM_H */
> diff --git a/drivers/gpu/drm/ingenic/ingenic-ipu.c =

> b/drivers/gpu/drm/ingenic/ingenic-ipu.c
> index fc8c6e970ee3..38c83e8cc6a5 100644
> --- a/drivers/gpu/drm/ingenic/ingenic-ipu.c
> +++ b/drivers/gpu/drm/ingenic/ingenic-ipu.c
> @@ -20,6 +20,7 @@
> =

>  #include <drm/drm_atomic.h>
>  #include <drm/drm_atomic_helper.h>
> +#include <drm/drm_damage_helper.h>
>  #include <drm/drm_drv.h>
>  #include <drm/drm_fb_cma_helper.h>
>  #include <drm/drm_fourcc.h>
> @@ -316,6 +317,8 @@ static void =

> ingenic_ipu_plane_atomic_update(struct drm_plane *plane,
>  				JZ_IPU_CTRL_CHIP_EN | JZ_IPU_CTRL_LCDC_SEL);
>  	}
> =

> +	ingenic_drm_sync_data(ipu->master, oldstate, state);
> +
>  	/* New addresses will be committed in vblank handler... */
>  	ipu->addr_y =3D drm_fb_cma_get_gem_addr(state->fb, state, 0);
>  	if (finfo->num_planes > 1)
> @@ -534,7 +537,7 @@ static int ingenic_ipu_plane_atomic_check(struct =

> drm_plane *plane,
> =

>  	if (!state->crtc ||
>  	    !crtc_state->mode.hdisplay || !crtc_state->mode.vdisplay)
> -		return 0;
> +		goto out_check_damage;
> =

>  	/* Plane must be fully visible */
>  	if (state->crtc_x < 0 || state->crtc_y < 0 ||
> @@ -551,7 +554,7 @@ static int ingenic_ipu_plane_atomic_check(struct =

> drm_plane *plane,
>  		return -EINVAL;
> =

>  	if (!osd_changed(state, plane->state))
> -		return 0;
> +		goto out_check_damage;
> =

>  	crtc_state->mode_changed =3D true;
> =

> @@ -578,6 +581,9 @@ static int ingenic_ipu_plane_atomic_check(struct =

> drm_plane *plane,
>  	ipu->denom_w =3D denom_w;
>  	ipu->denom_h =3D denom_h;
> =

> +out_check_damage:
> +	drm_atomic_helper_check_plane_damage(state->state, state);
> +
>  	return 0;
>  }
> =

> @@ -759,6 +765,8 @@ static int ingenic_ipu_bind(struct device *dev, =

> struct device *master, void *d)
>  		return err;
>  	}
> =

> +	drm_plane_enable_fb_damage_clips(plane);
> +
>  	/*
>  	 * Sharpness settings range is [0,32]
>  	 * 0       : nearest-neighbor
> --
> 2.28.0
> =



_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
