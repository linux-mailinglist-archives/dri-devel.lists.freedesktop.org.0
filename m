Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 885E733721A
	for <lists+dri-devel@lfdr.de>; Thu, 11 Mar 2021 13:10:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 228BF6EC1F;
	Thu, 11 Mar 2021 12:10:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47CC36EC1F
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Mar 2021 12:10:55 +0000 (UTC)
Date: Thu, 11 Mar 2021 12:10:42 +0000
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v2 5/5] drm/ingenic: Add option to alloc cached GEM buffers
To: Hillf Danton <hdanton@sina.com>
Message-Id: <UH0TPQ.KCO6Y7W3SH323@crapouillou.net>
In-Reply-To: <20210311022743.2542-1-hdanton@sina.com>
References: <20210307202835.253907-1-paul@crapouillou.net>
 <20210307202835.253907-6-paul@crapouillou.net>
 <20210308034727.1951-1-hdanton@sina.com>
 <PTORPQ.3IZFI0X29JNH1@crapouillou.net>
 <20210311022743.2542-1-hdanton@sina.com>
MIME-Version: 1.0
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
Cc: dri-devel@lists.freedesktop.org, Christoph Hellwig <hch@lst.de>,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Le jeu. 11 mars 2021 =E0 10:27, Hillf Danton <hdanton@sina.com> a =E9crit =

:
> On Wed, 10 Mar 2021 19:01:01 +0000 Paul Cercueil wrote:
>> Le lun. 8 mars 2021  11:47, Hillf Danton <hdanton@sina.com> a crit :
>>>  On Sun,  7 Mar 2021 20:28:35 +0000  Paul Cercueil wrote:
>>>>   With the module parameter ingenic-drm.cached_gem_buffers, it is
>>>>  possible
>>>>   to specify that we want GEM buffers backed by non-coherent =

>>>> memory.
>>>> =

>>>>   This dramatically speeds up software rendering on Ingenic SoCs,
>>>>  even for
>>>>   tasks where write-combine memory should in theory be faster (e.g.
>>>>  simple
>>>>   blits).
>>> =

>>>  Wondering if it is due to the tricks at [1].
>>> =

>>>  If so, is dma_alloc_noncoherent() necessary in this patchset?
>> =

>> You confuse non-contiguous with non-coherent, which are two different
>> things.
> =

> You misunderstood me. From [1] we know coherent caching is arch thing,
> so your proposal is not mandatory on ARM IMHO - what baffles me is
> noncoherent back memory can speed up device, coherent ot not, =

> regardless
> of arch. Can you point me to the reasons behind your speedup?

Well, I did write in the cover letter that it would help *some* SoCs, =

so it is not meant to be a default setting. As you can see in the last =

patch, it is opt-in. Ingenic SoCs are MIPS SoCs, btw.

One thing I should add is that this speeds up *software* rendering (vs. =

write-combine). It makes perfect sense that it speeds up things like =

alpha-blending, but I can't explain why it speeds up standard blits. My =

guess is that cache line invalidation is just extremely fast on this =

SoC.

-Paul

>> =

>> Cheers,
>> -Paul
>> =

>>>  Christoph can you give us a concise lesson on noncoherency covering
>>>  at least
>>>  noncoherent device, noncoherent memory(used in this work), no =

>>> coherent
>>>  caching(in [1]), their links to speedup, and the thumb rule to =

>>> handle
>>>  noncoherency in workdays. It feels toe curling every time I see
>>>  noncoherence
>>>  going downtown with speedup hand in hand.
>>> =

>>>  [1] Subject: [PATCH 6/6] media: uvcvideo: Use =

>>> dma_alloc_noncontiguos
>>>  API
>>>  https://lore.kernel.org/lkml/20210301085236.947011-7-hch@lst.de/#t
>>> =

>>>> =

>>>>   Leave it disabled by default, since it is specific to one =

>>>> use-case
>>>>   (software rendering).
>>>> =

>>>>   v2: Rework code to work with new DRM APIs regarding plane states
>>>> =

>>>>   Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>>>>   ---
>>>>    drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 49
>>>>  ++++++++++++++++++++++-
>>>>    drivers/gpu/drm/ingenic/ingenic-drm.h     |  4 ++
>>>>    drivers/gpu/drm/ingenic/ingenic-ipu.c     | 14 ++++++-
>>>>    3 files changed, 63 insertions(+), 4 deletions(-)
>>>> =

>>>>   diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
>>>>  b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
>>>>   index d60e1eefc9d1..ba1ac0fcda74 100644
>>>>   --- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
>>>>   +++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
>>>>   @@ -9,6 +9,7 @@
>>>>    #include <linux/component.h>
>>>>    #include <linux/clk.h>
>>>>    #include <linux/dma-mapping.h>
>>>>   +#include <linux/io.h>
>>>>    #include <linux/module.h>
>>>>    #include <linux/mutex.h>
>>>>    #include <linux/of_device.h>
>>>>   @@ -23,6 +24,7 @@
>>>>    #include <drm/drm_color_mgmt.h>
>>>>    #include <drm/drm_crtc.h>
>>>>    #include <drm/drm_crtc_helper.h>
>>>>   +#include <drm/drm_damage_helper.h>
>>>>    #include <drm/drm_drv.h>
>>>>    #include <drm/drm_gem_cma_helper.h>
>>>>    #include <drm/drm_fb_cma_helper.h>
>>>>   @@ -99,6 +101,11 @@ struct ingenic_drm {
>>>>    	struct notifier_block clock_nb;
>>>>    };
>>>> =

>>>>   +static bool ingenic_drm_cached_gem_buf;
>>>>   +module_param_named(cached_gem_buffers, =

>>>> ingenic_drm_cached_gem_buf,
>>>>  bool, 0400);
>>>>   +MODULE_PARM_DESC(cached_gem_buffers,
>>>>   +		 "Enable fully cached GEM buffers [default=3Dfalse]");
>>>>   +
>>>>    static bool ingenic_drm_writeable_reg(struct device *dev, =

>>>> unsigned
>>>>  int reg)
>>>>    {
>>>>    	switch (reg) {
>>>>   @@ -410,6 +417,8 @@ static int
>>>>  ingenic_drm_plane_atomic_check(struct drm_plane *plane,
>>>>    	     old_plane_state->fb->format->format !=3D
>>>>  new_plane_state->fb->format->format))
>>>>    		crtc_state->mode_changed =3D true;
>>>> =

>>>>   +	drm_atomic_helper_check_plane_damage(state, new_plane_state);
>>>>   +
>>>>    	return 0;
>>>>    }
>>>> =

>>>>   @@ -541,10 +550,20 @@ static void =

>>>> ingenic_drm_update_palette(struct
>>>>  ingenic_drm *priv,
>>>>    	}
>>>>    }
>>>> =

>>>>   +void ingenic_drm_sync_data(struct device *dev,
>>>>   +			   struct drm_plane_state *old_state,
>>>>   +			   struct drm_plane_state *state)
>>>>   +{
>>>>   +	if (ingenic_drm_cached_gem_buf)
>>>>   +		drm_gem_cma_sync_data(dev, old_state, state);
>>>>   +}
>>>>   +
>>>>    static void ingenic_drm_plane_atomic_update(struct drm_plane
>>>>  *plane,
>>>>    					    struct drm_atomic_state *state)
>>>>    {
>>>>    	struct ingenic_drm *priv =3D drm_device_get_priv(plane->dev);
>>>>   +	struct drm_plane_state *oldstate =3D
>>>>  drm_atomic_get_old_plane_state(state,
>>>>   +									  plane);
>>>>    	struct drm_plane_state *newstate =3D
>>>>  drm_atomic_get_new_plane_state(state,
>>>>    									  plane);
>>>>    	struct drm_crtc_state *crtc_state;
>>>>   @@ -554,6 +573,8 @@ static void
>>>>  ingenic_drm_plane_atomic_update(struct drm_plane *plane,
>>>>    	u32 fourcc;
>>>> =

>>>>    	if (newstate && newstate->fb) {
>>>>   +		ingenic_drm_sync_data(priv->dev, oldstate, newstate);
>>>>   +
>>>>    		crtc_state =3D newstate->crtc->state;
>>>> =

>>>>    		addr =3D drm_fb_cma_get_gem_addr(newstate->fb, newstate, 0);
>>>>   @@ -743,6 +764,26 @@ static void =

>>>> ingenic_drm_disable_vblank(struct
>>>>  drm_crtc *crtc)
>>>>    	regmap_update_bits(priv->map, JZ_REG_LCD_CTRL,
>>>>  JZ_LCD_CTRL_EOF_IRQ, 0);
>>>>    }
>>>> =

>>>>   +static struct drm_framebuffer *
>>>>   +ingenic_drm_gem_fb_create(struct drm_device *dev, struct =

>>>> drm_file
>>>>  *file,
>>>>   +			  const struct drm_mode_fb_cmd2 *mode_cmd)
>>>>   +{
>>>>   +	if (ingenic_drm_cached_gem_buf)
>>>>   +		return drm_gem_fb_create_with_dirty(dev, file, mode_cmd);
>>>>   +
>>>>   +	return drm_gem_fb_create(dev, file, mode_cmd);
>>>>   +}
>>>>   +
>>>>   +static int ingenic_drm_gem_cma_dumb_create(struct drm_file
>>>>  *file_priv,
>>>>   +					   struct drm_device *drm,
>>>>   +					   struct drm_mode_create_dumb *args)
>>>>   +{
>>>>   +	if (ingenic_drm_cached_gem_buf)
>>>>   +		return drm_gem_cma_dumb_create_noncoherent(file_priv, drm, =

>>>> args);
>>>>   +
>>>>   +	return drm_gem_cma_dumb_create(file_priv, drm, args);
>>>>   +}
>>>>   +
>>>>    DEFINE_DRM_GEM_CMA_FOPS(ingenic_drm_fops);
>>>> =

>>>>    static const struct drm_driver ingenic_drm_driver_data =3D {
>>>>   @@ -755,7 +796,7 @@ static const struct drm_driver
>>>>  ingenic_drm_driver_data =3D {
>>>>    	.patchlevel		=3D 0,
>>>> =

>>>>    	.fops			=3D &ingenic_drm_fops,
>>>>   -	DRM_GEM_CMA_DRIVER_OPS,
>>>> =

>>>>  =

>>>> +	DRM_GEM_CMA_DRIVER_OPS_WITH_DUMB_CREATE(ingenic_drm_gem_cma_dumb_cre=
ate),
>>>> =

>>>>    	.irq_handler		=3D ingenic_drm_irq_handler,
>>>>    };
>>>>   @@ -805,7 +846,7 @@ static const struct drm_encoder_helper_funcs
>>>>  ingenic_drm_encoder_helper_funcs =3D
>>>>    };
>>>> =

>>>>    static const struct drm_mode_config_funcs
>>>>  ingenic_drm_mode_config_funcs =3D {
>>>>   -	.fb_create		=3D drm_gem_fb_create,
>>>>   +	.fb_create		=3D ingenic_drm_gem_fb_create,
>>>>    	.output_poll_changed	=3D drm_fb_helper_output_poll_changed,
>>>>    	.atomic_check		=3D drm_atomic_helper_check,
>>>>    	.atomic_commit		=3D drm_atomic_helper_commit,
>>>>   @@ -962,6 +1003,8 @@ static int ingenic_drm_bind(struct device
>>>>  *dev, bool has_components)
>>>>    		return ret;
>>>>    	}
>>>> =

>>>>   +	drm_plane_enable_fb_damage_clips(&priv->f1);
>>>>   +
>>>>    	drm_crtc_helper_add(&priv->crtc, =

>>>> &ingenic_drm_crtc_helper_funcs);
>>>> =

>>>>    	ret =3D drm_crtc_init_with_planes(drm, &priv->crtc, primary,
>>>>   @@ -990,6 +1033,8 @@ static int ingenic_drm_bind(struct device
>>>>  *dev, bool has_components)
>>>>    			return ret;
>>>>    		}
>>>> =

>>>>   +		drm_plane_enable_fb_damage_clips(&priv->f0);
>>>>   +
>>>>    		if (IS_ENABLED(CONFIG_DRM_INGENIC_IPU) && has_components) {
>>>>    			ret =3D component_bind_all(dev, drm);
>>>>    			if (ret) {
>>>>   diff --git a/drivers/gpu/drm/ingenic/ingenic-drm.h
>>>>  b/drivers/gpu/drm/ingenic/ingenic-drm.h
>>>>   index 1b4347f7f084..b6bca356e024 100644
>>>>   --- a/drivers/gpu/drm/ingenic/ingenic-drm.h
>>>>   +++ b/drivers/gpu/drm/ingenic/ingenic-drm.h
>>>>   @@ -185,6 +185,10 @@ void ingenic_drm_plane_config(struct device
>>>>  *dev,
>>>>    			      struct drm_plane *plane, u32 fourcc);
>>>>    void ingenic_drm_plane_disable(struct device *dev, struct
>>>>  drm_plane *plane);
>>>> =

>>>>   +void ingenic_drm_sync_data(struct device *dev,
>>>>   +			   struct drm_plane_state *old_state,
>>>>   +			   struct drm_plane_state *state);
>>>>   +
>>>>    extern struct platform_driver *ingenic_ipu_driver_ptr;
>>>> =

>>>>    #endif /* DRIVERS_GPU_DRM_INGENIC_INGENIC_DRM_H */
>>>>   diff --git a/drivers/gpu/drm/ingenic/ingenic-ipu.c
>>>>  b/drivers/gpu/drm/ingenic/ingenic-ipu.c
>>>>   index 5ae6adab8306..7826eab044ba 100644
>>>>   --- a/drivers/gpu/drm/ingenic/ingenic-ipu.c
>>>>   +++ b/drivers/gpu/drm/ingenic/ingenic-ipu.c
>>>>   @@ -20,6 +20,7 @@
>>>> =

>>>>    #include <drm/drm_atomic.h>
>>>>    #include <drm/drm_atomic_helper.h>
>>>>   +#include <drm/drm_damage_helper.h>
>>>>    #include <drm/drm_drv.h>
>>>>    #include <drm/drm_fb_cma_helper.h>
>>>>    #include <drm/drm_fourcc.h>
>>>>   @@ -285,6 +286,8 @@ static void
>>>>  ingenic_ipu_plane_atomic_update(struct drm_plane *plane,
>>>>    					    struct drm_atomic_state *state)
>>>>    {
>>>>    	struct ingenic_ipu *ipu =3D plane_to_ingenic_ipu(plane);
>>>>   +	struct drm_plane_state *oldstate =3D
>>>>  drm_atomic_get_old_plane_state(state,
>>>>   +									  plane);
>>>>    	struct drm_plane_state *newstate =3D
>>>>  drm_atomic_get_new_plane_state(state,
>>>>    									  plane);
>>>>    	const struct drm_format_info *finfo;
>>>>   @@ -317,6 +320,8 @@ static void
>>>>  ingenic_ipu_plane_atomic_update(struct drm_plane *plane,
>>>>    				JZ_IPU_CTRL_CHIP_EN | JZ_IPU_CTRL_LCDC_SEL);
>>>>    	}
>>>> =

>>>>   +	ingenic_drm_sync_data(ipu->master, oldstate, newstate);
>>>>   +
>>>>    	/* New addresses will be committed in vblank handler... */
>>>>    	ipu->addr_y =3D drm_fb_cma_get_gem_addr(newstate->fb, newstate, =

>>>> 0);
>>>>    	if (finfo->num_planes > 1)
>>>>   @@ -541,7 +546,7 @@ static int
>>>>  ingenic_ipu_plane_atomic_check(struct drm_plane *plane,
>>>> =

>>>>    	if (!new_plane_state->crtc ||
>>>>    	    !crtc_state->mode.hdisplay || !crtc_state->mode.vdisplay)
>>>>   -		return 0;
>>>>   +		goto out_check_damage;
>>>> =

>>>>    	/* Plane must be fully visible */
>>>>    	if (new_plane_state->crtc_x < 0 || new_plane_state->crtc_y < 0 =

>>>> ||
>>>>   @@ -558,7 +563,7 @@ static int
>>>>  ingenic_ipu_plane_atomic_check(struct drm_plane *plane,
>>>>    		return -EINVAL;
>>>> =

>>>>    	if (!osd_changed(new_plane_state, old_plane_state))
>>>>   -		return 0;
>>>>   +		goto out_check_damage;
>>>> =

>>>>    	crtc_state->mode_changed =3D true;
>>>> =

>>>>   @@ -592,6 +597,9 @@ static int
>>>>  ingenic_ipu_plane_atomic_check(struct drm_plane *plane,
>>>>    	ipu->denom_w =3D denom_w;
>>>>    	ipu->denom_h =3D denom_h;
>>>> =

>>>>   +out_check_damage:
>>>>   +	drm_atomic_helper_check_plane_damage(state, new_plane_state);
>>>>   +
>>>>    	return 0;
>>>>    }
>>>> =

>>>>   @@ -773,6 +781,8 @@ static int ingenic_ipu_bind(struct device =

>>>> *dev,
>>>>  struct device *master, void *d)
>>>>    		return err;
>>>>    	}
>>>> =

>>>>   +	drm_plane_enable_fb_damage_clips(plane);
>>>>   +
>>>>    	/*
>>>>    	 * Sharpness settings range is [0,32]
>>>>    	 * 0       : nearest-neighbor
>>>>   --
>>>>   2.30.1


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
