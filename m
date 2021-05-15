Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DE75381AEB
	for <lists+dri-devel@lfdr.de>; Sat, 15 May 2021 22:08:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F4D16E439;
	Sat, 15 May 2021 20:08:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23F6E6E439
 for <dri-devel@lists.freedesktop.org>; Sat, 15 May 2021 20:08:27 +0000 (UTC)
Date: Sat, 15 May 2021 21:08:14 +0100
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v4 3/3] drm/ingenic: Add option to alloc cached GEM buffers
To: Thomas Zimmermann <tzimmermann@suse.de>
Message-Id: <QXZ5TQ.6UOSSUCWI08C2@crapouillou.net>
In-Reply-To: <4aae6b75-4f7e-2b6e-d8e7-b2599fdfd49d@suse.de>
References: <20210515145359.64802-1-paul@crapouillou.net>
 <20210515145359.64802-4-paul@crapouillou.net>
 <4aae6b75-4f7e-2b6e-d8e7-b2599fdfd49d@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, Christoph Hellwig <hch@infradead.org>,
 dri-devel@lists.freedesktop.org, list@opendingux.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,


Le sam., mai 15 2021 at 21:42:40 +0200, Thomas Zimmermann=20
<tzimmermann@suse.de> a =E9crit :
> Hi
>=20
> Am 15.05.21 um 16:53 schrieb Paul Cercueil:
>> Alloc GEM buffers backed by noncoherent memory on SoCs where it is
>> actually faster than write-combine.
>>=20
>> This dramatically speeds up software rendering on these SoCs, even=20
>> for
>> tasks where write-combine memory should in theory be faster (e.g.=20
>> simple
>> blits).
>>=20
>> v3: The option is now selected per-SoC instead of being a module
>>      parameter.
>>=20
>> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>> ---
>>   drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 56=20
>> ++++++++++++++++++++++-
>>   drivers/gpu/drm/ingenic/ingenic-ipu.c     | 18 ++++++--
>>   2 files changed, 68 insertions(+), 6 deletions(-)
>>=20
>> diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c=20
>> b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
>> index 09225b770bb8..5f64e8583eec 100644
>> --- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
>> +++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
>> @@ -9,6 +9,7 @@
>>   #include <linux/component.h>
>>   #include <linux/clk.h>
>>   #include <linux/dma-mapping.h>
>> +#include <linux/io.h>
>>   #include <linux/module.h>
>>   #include <linux/mutex.h>
>>   #include <linux/of_device.h>
>> @@ -23,6 +24,7 @@
>>   #include <drm/drm_color_mgmt.h>
>>   #include <drm/drm_crtc.h>
>>   #include <drm/drm_crtc_helper.h>
>> +#include <drm/drm_damage_helper.h>
>>   #include <drm/drm_drv.h>
>>   #include <drm/drm_encoder.h>
>>   #include <drm/drm_gem_cma_helper.h>
>> @@ -57,6 +59,7 @@ struct ingenic_dma_hwdescs {
>>   struct jz_soc_info {
>>   	bool needs_dev_clk;
>>   	bool has_osd;
>> +	bool map_noncoherent;
>>   	unsigned int max_width, max_height;
>>   	const u32 *formats_f0, *formats_f1;
>>   	unsigned int num_formats_f0, num_formats_f1;
>> @@ -410,6 +413,8 @@ static int ingenic_drm_plane_atomic_check(struct=20
>> drm_plane *plane,
>>   	     old_plane_state->fb->format->format !=3D=20
>> new_plane_state->fb->format->format))
>>   		crtc_state->mode_changed =3D true;
>>   =7F+	drm_atomic_helper_check_plane_damage(state, new_plane_state);
>> +
>>   	return 0;
>>   }
>>   =7F@@ -544,8 +549,8 @@ static void=20
>> ingenic_drm_plane_atomic_update(struct drm_plane *plane,
>>   					    struct drm_atomic_state *state)
>>   {
>>   	struct ingenic_drm *priv =3D drm_device_get_priv(plane->dev);
>> -	struct drm_plane_state *newstate =3D=20
>> drm_atomic_get_new_plane_state(state,
>> -									  plane);
>> +	struct drm_plane_state *newstate =3D=20
>> drm_atomic_get_new_plane_state(state, plane);
>> +	struct drm_plane_state *oldstate =3D=20
>> drm_atomic_get_old_plane_state(state, plane);
>>   	struct drm_crtc_state *crtc_state;
>>   	struct ingenic_dma_hwdesc *hwdesc;
>>   	unsigned int width, height, cpp, offset;
>> @@ -553,6 +558,8 @@ static void=20
>> ingenic_drm_plane_atomic_update(struct drm_plane *plane,
>>   	u32 fourcc;
>>   =7F  	if (newstate && newstate->fb) {
>> +		drm_gem_cma_sync_data(&priv->drm, oldstate, newstate);
>> +
>>   		crtc_state =3D newstate->crtc->state;
>>   =7F  		addr =3D drm_fb_cma_get_gem_addr(newstate->fb, newstate, 0);
>> @@ -742,6 +749,43 @@ static void ingenic_drm_disable_vblank(struct=20
>> drm_crtc *crtc)
>>   	regmap_update_bits(priv->map, JZ_REG_LCD_CTRL,=20
>> JZ_LCD_CTRL_EOF_IRQ, 0);
>>   }
>>   =7F+static int ingenic_drm_atomic_helper_dirtyfb(struct=20
>> drm_framebuffer *fb,
>> +					     struct drm_file *file_priv,
>> +					     unsigned int flags,
>> +					     unsigned int color,
>> +					     struct drm_clip_rect *clips,
>> +					     unsigned int num_clips)
>> +{
>> +	struct ingenic_drm *priv =3D drm_device_get_priv(fb->dev);
>> +
>> +	if (!priv->soc_info->map_noncoherent)
>> +		return 0;
>=20
> I'm not sure you can get away without calling=20
> drm_atomic_helper_dirtyfb(). The function does some things with the=20
> plane's damage-clips property. If you don't call it here, the plane=20
> might pile up unhandled clipping areas. It's better to call it and=20
> rely on the test in drm_gem_cma_sync_data(). See below on how to=20
> optimize this.

I guess that would work if I don't enable fb damage clips if=20
!map_noncoherent, but I'm missing that.

>> +
>> +	return drm_atomic_helper_dirtyfb(fb, file_priv, flags,
>> +					 color, clips, num_clips);
>> +}
>> +
>> +static const struct drm_framebuffer_funcs ingenic_drm_gem_fb_funcs=20
>> =3D {
>> +	.destroy	=3D drm_gem_fb_destroy,
>> +	.create_handle	=3D drm_gem_fb_create_handle,
>> +	.dirty          =3D ingenic_drm_atomic_helper_dirtyfb,
>> +};
>=20
> You don't seem to be using this anywhere. You have to implement a=20
> custom fb_create for drm_mode_config_funcs. [1]

You are totally right, my v2 had a ingenic_drm_gem_fb_create() and it=20
got dropped somehow.

> BUT: I think the overall approach should be to only use this on SoCs=20
> with non-coherency setting. Use drm_gem_fb_create() on systems=20
> without non-coherency and use drm_gem_fb_create_with_dirty() on=20
> systems with non-coherency (i.e., have two instances of=20
> drm_mode_config_funcs). Only call drm_plane_enable_fb_damage_clips()=20
> on systems with non-coherency.

Yes, that was the idea - enable this according to=20
(priv->soc_info->map_noncoherent) which is set only on the SoCs where=20
it makes sense.

>> +
>> +static struct drm_gem_object *
>> +ingenic_drm_gem_create_object(struct drm_device *drm, size_t size)
>> +{
>> +	struct ingenic_drm *priv =3D drm_device_get_priv(drm);
>> +	struct drm_gem_cma_object *obj;
>> +
>> +	obj =3D kzalloc(sizeof(*obj), GFP_KERNEL);
>> +	if (!obj)
>> +		return ERR_PTR(-ENOMEM);
>> +
>> +	obj->map_noncoherent =3D priv->soc_info->map_noncoherent;
>> +
>> +	return &obj->base;
>> +}
>> +
>>   DEFINE_DRM_GEM_CMA_FOPS(ingenic_drm_fops);
>>   =7F  static const struct drm_driver ingenic_drm_driver_data =3D {
>> @@ -754,6 +798,7 @@ static const struct drm_driver=20
>> ingenic_drm_driver_data =3D {
>>   	.patchlevel		=3D 0,
>>   =7F  	.fops			=3D &ingenic_drm_fops,
>> +	.gem_create_object	=3D ingenic_drm_gem_create_object,
>>   	DRM_GEM_CMA_DRIVER_OPS,
>>   =7F  	.irq_handler		=3D ingenic_drm_irq_handler,
>> @@ -961,6 +1006,8 @@ static int ingenic_drm_bind(struct device *dev,=20
>> bool has_components)
>>   		return ret;
>>   	}
>>   =7F+	drm_plane_enable_fb_damage_clips(&priv->f1);
>> +
>>   	drm_crtc_helper_add(&priv->crtc, &ingenic_drm_crtc_helper_funcs);
>>   =7F  	ret =3D drm_crtc_init_with_planes(drm, &priv->crtc, primary,
>> @@ -989,6 +1036,8 @@ static int ingenic_drm_bind(struct device *dev,=20
>> bool has_components)
>>   			return ret;
>>   		}
>>   =7F+		drm_plane_enable_fb_damage_clips(&priv->f0);
>> +
>>   		if (IS_ENABLED(CONFIG_DRM_INGENIC_IPU) && has_components) {
>>   			ret =3D component_bind_all(dev, drm);
>>   			if (ret) {
>> @@ -1245,6 +1294,7 @@ static const u32 jz4770_formats_f0[] =3D {
>>   static const struct jz_soc_info jz4740_soc_info =3D {
>>   	.needs_dev_clk =3D true,
>>   	.has_osd =3D false,
>> +	.map_noncoherent =3D false,
>>   	.max_width =3D 800,
>>   	.max_height =3D 600,
>>   	.formats_f1 =3D jz4740_formats,
>> @@ -1255,6 +1305,7 @@ static const struct jz_soc_info=20
>> jz4740_soc_info =3D {
>>   static const struct jz_soc_info jz4725b_soc_info =3D {
>>   	.needs_dev_clk =3D false,
>>   	.has_osd =3D true,
>> +	.map_noncoherent =3D false,
>>   	.max_width =3D 800,
>>   	.max_height =3D 600,
>>   	.formats_f1 =3D jz4725b_formats_f1,
>> @@ -1266,6 +1317,7 @@ static const struct jz_soc_info=20
>> jz4725b_soc_info =3D {
>>   static const struct jz_soc_info jz4770_soc_info =3D {
>>   	.needs_dev_clk =3D false,
>>   	.has_osd =3D true,
>> +	.map_noncoherent =3D true,
>>   	.max_width =3D 1280,
>>   	.max_height =3D 720,
>>   	.formats_f1 =3D jz4770_formats_f1,
>> diff --git a/drivers/gpu/drm/ingenic/ingenic-ipu.c=20
>> b/drivers/gpu/drm/ingenic/ingenic-ipu.c
>> index 3b1091e7c0cd..a4d1b500c3ad 100644
>> --- a/drivers/gpu/drm/ingenic/ingenic-ipu.c
>> +++ b/drivers/gpu/drm/ingenic/ingenic-ipu.c
>> @@ -20,10 +20,13 @@
>>   =7F  #include <drm/drm_atomic.h>
>>   #include <drm/drm_atomic_helper.h>
>> +#include <drm/drm_damage_helper.h>
>>   #include <drm/drm_drv.h>
>>   #include <drm/drm_fb_cma_helper.h>
>>   #include <drm/drm_fourcc.h>
>>   #include <drm/drm_gem_atomic_helper.h>
>> +#include <drm/drm_gem_cma_helper.h>
>> +#include <drm/drm_gem_framebuffer_helper.h>
>>   #include <drm/drm_plane.h>
>>   #include <drm/drm_plane_helper.h>
>>   #include <drm/drm_property.h>
>> @@ -285,8 +288,8 @@ static void=20
>> ingenic_ipu_plane_atomic_update(struct drm_plane *plane,
>>   					    struct drm_atomic_state *state)
>>   {
>>   	struct ingenic_ipu *ipu =3D plane_to_ingenic_ipu(plane);
>> -	struct drm_plane_state *newstate =3D=20
>> drm_atomic_get_new_plane_state(state,
>> -									  plane);
>> +	struct drm_plane_state *newstate =3D=20
>> drm_atomic_get_new_plane_state(state, plane);
>> +	struct drm_plane_state *oldstate =3D=20
>> drm_atomic_get_new_plane_state(state, plane);
>=20
> get_old_state ?
>=20
>>   	const struct drm_format_info *finfo;
>>   	u32 ctrl, stride =3D 0, coef_index =3D 0, format =3D 0;
>>   	bool needs_modeset, upscaling_w, upscaling_h;
>> @@ -317,6 +320,8 @@ static void=20
>> ingenic_ipu_plane_atomic_update(struct drm_plane *plane,
>>   				JZ_IPU_CTRL_CHIP_EN | JZ_IPU_CTRL_LCDC_SEL);
>>   	}
>>   =7F+	drm_gem_cma_sync_data(ipu->drm, oldstate, newstate);
>> +
>=20
> If you want to optimize, maybe put this line behind
>=20
>   if (priv->soc_info->map_noncoherent)
>=20
>>   	/* New addresses will be committed in vblank handler... */
>>   	ipu->addr_y =3D drm_fb_cma_get_gem_addr(newstate->fb, newstate, 0);
>>   	if (finfo->num_planes > 1)
>> @@ -541,7 +546,7 @@ static int ingenic_ipu_plane_atomic_check(struct=20
>> drm_plane *plane,
>>   =7F  	if (!new_plane_state->crtc ||
>>   	    !crtc_state->mode.hdisplay || !crtc_state->mode.vdisplay)
>> -		return 0;
>> +		goto out_check_damage;
>>   =7F  	/* Plane must be fully visible */
>>   	if (new_plane_state->crtc_x < 0 || new_plane_state->crtc_y < 0 ||
>> @@ -558,7 +563,7 @@ static int ingenic_ipu_plane_atomic_check(struct=20
>> drm_plane *plane,
>>   		return -EINVAL;
>>   =7F  	if (!osd_changed(new_plane_state, old_plane_state))
>> -		return 0;
>> +		goto out_check_damage;
>>   =7F  	crtc_state->mode_changed =3D true;
>>   =7F@@ -592,6 +597,9 @@ static int=20
>> ingenic_ipu_plane_atomic_check(struct drm_plane *plane,
>>   	ipu->denom_w =3D denom_w;
>>   	ipu->denom_h =3D denom_h;
>>   =7F+out_check_damage:
>> +	drm_atomic_helper_check_plane_damage(state, new_plane_state);
>> +
>=20
> If you implement my suggestion above, this line could also be behind
>=20
>   if (priv->soc_info->map_noncoherent)

Noted, thanks.

Cheers,
-Paul

> Best regards
>=20
> Thomas
>=20
>=20
>=20
> [1]=20
> https://elixir.bootlin.com/linux/v5.13-rc1/source/drivers/gpu/drm/ingenic=
/ingenic-drm-drv.c#L808
>=20
>=20
>=20
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 N=FCrnberg, Germany
> (HRB 36809, AG N=FCrnberg)
> Gesch=E4ftsf=FChrer: Felix Imend=F6rffer
>=20


