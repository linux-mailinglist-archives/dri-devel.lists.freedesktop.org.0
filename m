Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA24044750E
	for <lists+dri-devel@lfdr.de>; Sun,  7 Nov 2021 20:02:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C5D289A44;
	Sun,  7 Nov 2021 19:01:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 280F689A44
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Nov 2021 19:01:55 +0000 (UTC)
Date: Sun, 07 Nov 2021 19:01:38 +0000
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v5 2/7] drm/ingenic: Add support for JZ4780 and HDMI output
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Message-Id: <Q6U72R.9HY4TXLC6RWV2@crapouillou.net>
In-Reply-To: <7CEBB741-2218-40A7-9800-B3A154895274@goldelico.com>
References: <cover.1633436959.git.hns@goldelico.com>
 <2c7d0aa7d3ef480ebb996d37c27cbaa6f722728b.1633436959.git.hns@goldelico.com>
 <FXTI0R.3FZIJZ7UYSNQ@crapouillou.net>
 <7CEBB741-2218-40A7-9800-B3A154895274@goldelico.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Paul Boddie <paul@boddie.org.uk>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-mips <linux-mips@vger.kernel.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Sam Ravnborg <sam@ravnborg.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS <devicetree@vger.kernel.org>,
 Kees Cook <keescook@chromium.org>, Jonas Karlman <jonas@kwiboo.se>,
 Mark Brown <broonie@kernel.org>, Maxime Ripard <maxime@cerno.tech>,
 Discussions about the Letux Kernel <letux-kernel@openphoenux.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Liam Girdwood <lgirdwood@gmail.com>, Robert Foss <robert.foss@linaro.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Nikolaus,

Le dim., nov. 7 2021 at 14:41:18 +0100, H. Nikolaus Schaller=20
<hns@goldelico.com> a =E9crit :
> Hi Paul,
> sorry for the delay in getting back to this, but I was distracted by=20
> more urgent topics.
>=20
>>  Am 05.10.2021 um 22:22 schrieb Paul Cercueil <paul@crapouillou.net>:
>>=20
>>  Hi Nikolaus,
>>=20
>>  Le mar., oct. 5 2021 at 14:29:14 +0200, H. Nikolaus Schaller=20
>> <hns@goldelico.com> a =E9crit :
>>>  From: Paul Boddie <paul@boddie.org.uk>
>>>  Add support for the LCD controller present on JZ4780 SoCs.
>>>  This SoC uses 8-byte descriptors which extend the current
>>>  4-byte descriptors used for other Ingenic SoCs.
>>>  Tested on MIPS Creator CI20 board.
>>>  Signed-off-by: Paul Boddie <paul@boddie.org.uk>
>>>  Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
>>>  Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
>>>  ---
>>>  drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 85=20
>>> +++++++++++++++++++++--
>>>  drivers/gpu/drm/ingenic/ingenic-drm.h     | 42 +++++++++++
>>>  2 files changed, 122 insertions(+), 5 deletions(-)
>>>  diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c=20
>>> b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
>>>  index f73522bdacaa..e2df4b085905 100644
>>>  --- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
>>>  +++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
>>>  @@ -6,6 +6,7 @@
>=20
>>>  			case DRM_FORMAT_XRGB8888:
>>>  +				hwdesc->cpos |=3D JZ_LCD_CPOS_BPP_18_24;
>>>  +				break;
>>>  +			}
>>>  +			hwdesc->cpos |=3D JZ_LCD_CPOS_PREMULTIPLY_LCD |
>>>  +					    (JZ_LCD_CPOS_COEFFICIENT_1_ALPHA1 <<
>>>  +					     JZ_LCD_CPOS_COEFFICIENT_OFFSET);
>>=20
>>  Knowing that OSD mode doesn't really work with this patch, I doubt=20
>> you need to configure per-plane alpha blending.
>=20
> Well, we can not omit setting some CPOS_COEFFICIENT different from 0.
>=20
> This would mean to multiply all values with 0, i.e. gives a black=20
> screen.
>=20
> So at least we have to apply JZ_LCD_CPOS_COEFFICIENT_1.
> JZ_LCD_CPOS_PREMULTIPLY_LCD is not relevant in the non-alpha case.

hwdesc->cpos =3D JZ_LCD_CPOS_COEFFICIENT_1 <<=20
JZ_LCD_CPOS_COEFFICIENT_OFFSET;

That's enough to get an image.

> But then, why not do it right from the beginning?

Because there's no way to test alpha blending without getting the=20
overlay plane to work first.

>>=20
>>>  +
>>>  +			hwdesc->dessize =3D
>>>  +				(0xff << JZ_LCD_DESSIZE_ALPHA_OFFSET) |
>>=20
>>  Same here.
>>=20
>>>  +				FIELD_PREP(JZ_LCD_DESSIZE_HEIGHT_MASK <<
>>>  +					   JZ_LCD_DESSIZE_HEIGHT_OFFSET, height - 1) |
>>>  +				FIELD_PREP(JZ_LCD_DESSIZE_WIDTH_MASK <<
>>>  +					   JZ_LCD_DESSIZE_WIDTH_OFFSET, width - 1);
>>=20
>>  Better pre-shift your *_MASK macros (and use GENMASK() in them) and=20
>> remove the *_OFFSET macros.
>=20
> Ok, I see. Nice. Makes code and definitions much cleaner.
> Changed for v6.
>=20
>>=20
>>>  +		}
>>>  +
>>>  		if (drm_atomic_crtc_needs_modeset(crtc_state)) {
>>>  			fourcc =3D newstate->fb->format->format;
>>>  @@ -694,6 +732,10 @@ static void=20
>>> ingenic_drm_encoder_atomic_mode_set(struct drm_encoder *encoder,
>>>  		    | JZ_LCD_CFG_SPL_DISABLE | JZ_LCD_CFG_REV_DISABLE;
>>>  	}
>>>  +	/* set use of the 8-word descriptor and OSD foreground usage. */
>>=20
>>  I think you can remove this comment - this code doesn't actually=20
>> set OSD mode, but it does enable the use of the extended hardware=20
>> descriptor format, and I think it is already self-explanatory.
>=20
> Agreed and removed.
>=20
>>=20
>>>  +	if (priv->soc_info->use_extended_hwdesc)
>>>  +		cfg |=3D JZ_LCD_CFG_DESCRIPTOR_8;
>>>  +
>>>  	if (mode->flags & DRM_MODE_FLAG_NHSYNC)
>>>  		cfg |=3D JZ_LCD_CFG_HSYNC_ACTIVE_LOW;
>>>  	if (mode->flags & DRM_MODE_FLAG_NVSYNC)
>>>  @@ -1010,6 +1052,7 @@ static int ingenic_drm_bind(struct device=20
>>> *dev, bool has_components)
>>>  	struct drm_encoder *encoder;
>>>  	struct ingenic_drm_bridge *ib;
>>>  	struct drm_device *drm;
>>>  +	struct regmap_config regmap_config;
>>>  	void __iomem *base;
>>>  	long parent_rate;
>>>  	unsigned int i, clone_mask =3D 0;
>>>  @@ -1063,8 +1106,10 @@ static int ingenic_drm_bind(struct device=20
>>> *dev, bool has_components)
>>>  		return PTR_ERR(base);
>>>  	}
>>>  +	regmap_config =3D ingenic_drm_regmap_config;
>>>  +	regmap_config.max_register =3D soc_info->max_reg;
>>>  	priv->map =3D devm_regmap_init_mmio(dev, base,
>>>  -					  &ingenic_drm_regmap_config);
>>>  +					  &regmap_config);
>>=20
>>  I remember saying to split this change into its own patch :)
>=20
> Yes, I remember as well, but it does not make sense to me.
>=20
> A first patch would introduce regmap_config. This needs=20
> soc_info->max_reg
> to be defined as a struct component.
>=20
> This requires all soc_info to be updated for all SoC (w/o=20
> jz4780_soc_info
> in this first patch because it has not been added yet) to a constant=20
> (!)
> JZ_REG_LCD_SIZE1.
>=20
> And the second patch would then add jz4780_soc_info and set its=20
> max_reg to
> a different value.

Correct, that's how it should be.

Note that you can do even better, set the .max_register field according=20
to the memory resource you get from DTS. Have a look at the pinctrl=20
driver which does exactly this.

> IMHO, such a separate first patch has no benefit independent from=20
> adding
> jz4780 support, as far as I can see.
>=20
> If your fear issues with bisectability:
> - code has been tested
> - if this fails, bisect will still point to this patch, where it is=20
> easy to locate

It's not about bisectability. One functional change per patch, and=20
patches should be as atomic as possible.

> So I leave it in v6 unsplitted.
>=20
>>=20
>>>  	if (IS_ERR(priv->map)) {
>>>  		dev_err(dev, "Failed to create regmap\n");
>>>  		return PTR_ERR(priv->map);
>>>  @@ -1274,7 +1319,7 @@ static int ingenic_drm_bind(struct device=20
>>> *dev, bool has_components)
>>>  	/* Enable OSD if available */
>>>  	if (soc_info->has_osd)
>>>  -		regmap_write(priv->map, JZ_REG_LCD_OSDC, JZ_LCD_OSDC_OSDEN);
>>>  +		regmap_set_bits(priv->map, JZ_REG_LCD_OSDC, JZ_LCD_OSDC_OSDEN);
>>=20
>>  This change is unrelated to this patch, and I'm not even sure it's=20
>> a valid change. The driver shouldn't rely on previous register=20
>> values.
>=20
> I think I already commented that I think the driver should also not=20
> reset
> previous register values to zero.

You did comment this, yes, but I don't agree. The driver *should* reset=20
the registers to zero. It should *not* have to rely on whatever was=20
configured before.

Even if I did agree, this is a functional change unrelated to JZ4780=20
support, so it would have to be splitted to its own patch.

> If I counted correctly this register has 18 bits which seem to include
> some interrupt masks (which could be initialized somewhere else) and=20
> we
> write a constant 0x1.
>=20
> Of course most other bits are clearly OSD related (alpha blending),
> i.e. they can have any value (incl. 0) if OSD is disabled. But here we
> enable it. I think there may be missing some setting for the other=20
> bits.
>=20
> So are you sure, that we can unconditionally reset *all* bits
> except JZ_LCD_OSDC_OSDEN for the jz4780?
>=20
> Well I have no experience with OSD being enabled at all. I.e. I have=20
> no
> test scenario.
>=20
> So we can leave it out in v6.
>=20
>>=20
>>>  	mutex_init(&priv->clk_mutex);
>>>  	priv->clock_nb.notifier_call =3D ingenic_drm_update_pixclk;
>>>  @@ -1444,6 +1489,7 @@ static const struct jz_soc_info=20
>>> jz4740_soc_info =3D {
>>>  	.formats_f1 =3D jz4740_formats,
>>>  	.num_formats_f1 =3D ARRAY_SIZE(jz4740_formats),
>>>  	/* JZ4740 has only one plane */
>>>  +	.max_reg =3D JZ_REG_LCD_SIZE1,
>>>  };
>>>  static const struct jz_soc_info jz4725b_soc_info =3D {
>>>  @@ -1456,6 +1502,7 @@ static const struct jz_soc_info=20
>>> jz4725b_soc_info =3D {
>>>  	.num_formats_f1 =3D ARRAY_SIZE(jz4725b_formats_f1),
>>>  	.formats_f0 =3D jz4725b_formats_f0,
>>>  	.num_formats_f0 =3D ARRAY_SIZE(jz4725b_formats_f0),
>>>  +	.max_reg =3D JZ_REG_LCD_SIZE1,
>>>  };
>>>  static const struct jz_soc_info jz4770_soc_info =3D {
>>>  @@ -1468,12 +1515,28 @@ static const struct jz_soc_info=20
>>> jz4770_soc_info =3D {
>>>  	.num_formats_f1 =3D ARRAY_SIZE(jz4770_formats_f1),
>>>  	.formats_f0 =3D jz4770_formats_f0,
>>>  	.num_formats_f0 =3D ARRAY_SIZE(jz4770_formats_f0),
>>>  +	.max_reg =3D JZ_REG_LCD_SIZE1,
>>>  +};
>>>  +
>>>  +static const struct jz_soc_info jz4780_soc_info =3D {
>>>  +	.needs_dev_clk =3D true,
>>>  +	.has_osd =3D true,
>>>  +	.use_extended_hwdesc =3D true,
>>>  +	.max_width =3D 4096,
>>>  +	.max_height =3D 2048,
>>>  +	/* REVISIT: do we support formats different from jz4770? */
>>=20
>>  From a quick look at the PMs, it doesn't seem so.
>=20
> Fine. I'll remove the comment in v6.
>=20
>>=20
>>>  +	.formats_f1 =3D jz4770_formats_f1,
>>>  +	.num_formats_f1 =3D ARRAY_SIZE(jz4770_formats_f1),
>>>  +	.formats_f0 =3D jz4770_formats_f0,
>>>  +	.num_formats_f0 =3D ARRAY_SIZE(jz4770_formats_f0),
>>>  +	.max_reg =3D JZ_REG_LCD_PCFG,
>>>  };
>>>  static const struct of_device_id ingenic_drm_of_match[] =3D {
>>>  	{ .compatible =3D "ingenic,jz4740-lcd", .data =3D &jz4740_soc_info },
>>>  	{ .compatible =3D "ingenic,jz4725b-lcd", .data =3D &jz4725b_soc_info=20
>>> },
>>>  	{ .compatible =3D "ingenic,jz4770-lcd", .data =3D &jz4770_soc_info },
>>>  +	{ .compatible =3D "ingenic,jz4780-lcd", .data =3D &jz4780_soc_info }=
,
>>>  	{ /* sentinel */ },
>>>  };
>>>  MODULE_DEVICE_TABLE(of, ingenic_drm_of_match);
>>>  @@ -1492,10 +1555,16 @@ static int ingenic_drm_init(void)
>>>  {
>>>  	int err;
>>>  +	if (IS_ENABLED(CONFIG_DRM_INGENIC_DW_HDMI)) {
>>>  +		err =3D platform_driver_register(ingenic_dw_hdmi_driver_ptr);
>>>  +		if (err)
>>>  +			return err;
>>>  +	}
>>=20
>>  As I said in your v4... You don't need to add this here. The=20
>> ingenic-dw-hdmi.c should take care of registering its driver.
>=20
> Well, I can not identify any difference in code structure to the IPU=20
> code.
>=20
> The Makefile (after our patch) looks like:
>=20
> obj-$(CONFIG_DRM_INGENIC) +=3D ingenic-drm.o
> ingenic-drm-y =3D ingenic-drm-drv.o
> ingenic-drm-$(CONFIG_DRM_INGENIC_IPU) +=3D ingenic-ipu.o
> ingenic-drm-$(CONFIG_DRM_INGENIC_DW_HDMI) +=3D ingenic-dw-hdmi.o
>=20
> which means that ingenic-dw-hdmi.o is also compiled into ingenic-drm,
> like ingenic-drm-drv.o and ingenic-ipu.o - if CONFIGured. If not,=20
> there
> are these IS_ENABLED() tests to guard against compiler errors.
>=20
> Is there any technical reason to request a driver structure and=20
> registration
> different from IPU here?

There is no reason to have ingenic-dw-hdmi built into the ingenic-drm=20
module. It should be a separate module.

> Why not having ingenic-ipu.c taking care of registering its driver as=20
> well?

IIRC ingenic-ipu.c was built into the ingenic-drm at the beginning=20
because of circular dependencies between the IPU and main DRM driver. I=20
think ingenic-ipu.c could be its own module now. That's something I=20
will test soon.

> As soon as this is clarified, I can post a v6.
>=20
>>=20
>>  As for the overall change... I am a bit annoyed that this only=20
>> supports the F1 plane at the screen's resolution. Anything else (F1=20
>> plane at specific coordinates, F0 plane alone, or F0+F1) does not=20
>> work.
>=20
> Yes, having two planes working would be interesting.
>=20
>>  I think at least the F1 plane's position should be easy to do (just=20
>> setting the cpos field in the hwdesc).
>>=20
>>  It is OK to leave the rest for later (I'm not asking you to do all=20
>> that). However it would be a good idea to add a check in=20
>> ingenic_drm_crtc_atomic_check(), which would return -EINVAL if=20
>> anything else than the working configuration is attempted.
>=20
> Hm. I am not familiar with how ingenic_drm_crtc_atomic_check()
> would be notified about planes. Which configuration parameters
> should be checked for?

You know that the &ingenic_drm->f0 plane cannot be used (right now), so=20
in ingenic_drm_plane_atomic_check() just:

if (plane =3D=3D &priv->f0 && crtc)
    return -EINVAL;

Cheers,
-Paul

>=20
>>=20
>>  Cheers,
>>  -Paul
>=20
> BR and thanks,
> Nikolaus
>=20


