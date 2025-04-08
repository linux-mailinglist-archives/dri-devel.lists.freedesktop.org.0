Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D5AA7FC95
	for <lists+dri-devel@lfdr.de>; Tue,  8 Apr 2025 12:45:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 582D810E636;
	Tue,  8 Apr 2025 10:44:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="JY0mLk+/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AA3810E636
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Apr 2025 10:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1744109091;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PM/YiEe3zAtaQSIvKETzK4pYAXcdphl4Xj26DbxR/y4=;
 b=JY0mLk+/9dwV8vK5IeTaMXUO/D4UyWOot1AZbwrpR6n0OLZuGCFJH40NoMFKsO3C87iKMQ
 SEdrp1cW/+jdszEimJdfmYa2FfOyFRSb+WvQA9yn2zhsdejoAa9ez+SqjtQayYh2dAMpUv
 sy2EpNxoGlJtJtS154W9Drh3ADplDk0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-446-B8SSsl0KPZ-YBznMCdoleg-1; Tue, 08 Apr 2025 06:44:50 -0400
X-MC-Unique: B8SSsl0KPZ-YBznMCdoleg-1
X-Mimecast-MFC-AGG-ID: B8SSsl0KPZ-YBznMCdoleg_1744109089
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-43cfda30a3cso32156365e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Apr 2025 03:44:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744109089; x=1744713889;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NPR4B01GHk+3gXBlymQB8mC9iF4bz+2OuAoNO5eOTdU=;
 b=H+5oVGrI0GGsD3Z8ToGoe0IvuNyDrihBSwZYXbdK4wRq12Xgu49idD8nnN4Ir3mc26
 k1bEBe4hklT+584VM+5eDm7v1CJAApymvEh4Kk9uJXaE7tUzYT2ut/IkJoI4h9iUB8by
 MRQqN5WG9OqqcuMMvJ0C01fSksYOOOuUSzgdtFyZtypCqndgBEno/Ni04pm70+5PsZKC
 HMEtWHLnuuVVmBb3Eu0KLWIFkSjsjj4b/Or4/n7seokqWKPlpJDtCa8lzu12JXlCOJB0
 nYqWHudAY4X7K75QyElM7oMfoNoA8L9Xr3Aa/9EnAsPy4fOCK7nnPnU2Bv4Ybay5nsjE
 bQsw==
X-Gm-Message-State: AOJu0YxLDWmgS5BODVnkJPr1CoZU17fhUz0cmS8lD2EEyaGkBblJ5NF/
 xIc1gjc6gv/VIsYSWZ8UfUmn/w4bdhTHZx0zStm3v3VX88bBkzu9ioFlJD7Wd22g2NCa3HWn0JP
 dwdOUggRyrsByQVMVpGtekfDIR7vTeTn72baYkAMamUwH9X/JoGJ3NNPh+kJlz45Cqg==
X-Gm-Gg: ASbGncsoDdaSnJZMFgQKxbzCKppPz/ekb3D83n5Hg0ixz3BbuYYUXij16AE0pcHngLB
 3t9OtrWjJaGJebwlWVj+FzbQCgdbNT3y9u/72vLms4DwuUqQjfdKdc+GB6HmIhH/yKCXrdJeubr
 LGOuOS4VhivVAK53IIabi1xyNL3FzWT6LoaBFtHoWR7it77C8kZUg/l/uzEtHFatorefZjP2VDE
 I5mAFNpGu7hsPWgZ7mluT1qREVVbErTeTEDOeerDqczz7ge/L5Tb9Ei8UjHTsu0MB/JtMI6KtoV
 s1BjgELUn/VXrQoJBtjjM66/kQvPV31ArPqzNdOj+dhnFCKXDWwAhRjs/jiaJUWqqk04IkkFew=
 =
X-Received: by 2002:a05:600c:a14:b0:43d:b3:fb1 with SMTP id
 5b1f17b1804b1-43ecfa05fe1mr144170405e9.27.1744109088613; 
 Tue, 08 Apr 2025 03:44:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGc9FfIlYu+Yt1f+9swRriUmdFyQm4ADSt4IqeKBrSQR8D8o6h7L6PvtFH9310msgHZKvhBiw==
X-Received: by 2002:a05:600c:a14:b0:43d:b3:fb1 with SMTP id
 5b1f17b1804b1-43ecfa05fe1mr144170245e9.27.1744109088173; 
 Tue, 08 Apr 2025 03:44:48 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ec364cb9asm156401545e9.31.2025.04.08.03.44.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Apr 2025 03:44:47 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Marcus Folkesson <marcus.folkesson@gmail.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Marcus Folkesson
 <marcus.folkesson@gmail.com>, Thomas Zimmermann <tzimmrmann@suse.de>
Subject: Re: [PATCH v3 2/3] drm/st7571-i2c: add support for Sitronix ST7571
 LCD controller
In-Reply-To: <20250408-st7571-v3-2-200693efec57@gmail.com>
References: <20250408-st7571-v3-0-200693efec57@gmail.com>
 <20250408-st7571-v3-2-200693efec57@gmail.com>
Date: Tue, 08 Apr 2025 12:44:46 +0200
Message-ID: <87cydn9bkx.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: XL6_ba9YSXIp7UdSxdIzb27Ol7E0nmbD7P0rmbrOpD8_1744109089
X-Mimecast-Originator: redhat.com
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Marcus Folkesson <marcus.folkesson@gmail.com> writes:

Hello Marcus,

> Sitronix ST7571 is a 4bit gray scale dot matrix LCD controller.
> The controller has a SPI, I2C and 8bit parallel interface, this
> driver is for the I2C interface only.
>

I would structure the driver differently. For example, what was done
for the Solomon SSD130X display controllers, that also support these
three interfaces:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/dri=
vers/gpu/drm/solomon

Basically, it was split in a ssd130x.c module that's agnostic of the
transport interface and implements all the core logic for the driver.

And a set of different modules that have the interface specific bits:
ssd130x-i2c.c and ssd130x-spi.c.

That way, adding for example SPI support to your driver would be quite
trivial and won't require any refactoring. Specially since you already
are using regmap, which abstracts away the I2C interface bits.

> Reviewed-by: Thomas Zimmermann <tzimmrmann@suse.de>
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> ---
>  drivers/gpu/drm/tiny/Kconfig      |  11 +
>  drivers/gpu/drm/tiny/Makefile     |   1 +
>  drivers/gpu/drm/tiny/st7571-i2c.c | 721 ++++++++++++++++++++++++++++++++=
++++++

I personally think that the tiny sub-directory is slowly becoming a
dumping ground for small drivers. Instead, maybe we should create a
drivers/gpu/drm/sitronix/ sub-dir and put all Sitronix drivers there?

So far we have drivers in tiny for: ST7735R, ST7586 and ST7571 with
your driver. And also have a few more Sitronix drivers in the panel
sub-directory (although those likely should remain there).

I have a ST7565S and plan to write a driver for it. And I know someone
who is working on a ST7920 driver. That would be 5 Sitronix drivers and
the reason why I think that a dedicated sub-dir would be more organized.

Maybe there's even common code among these drivers and could be reused?

Just a thought though, it's OK to keep your driver as-is and we could do
refactor / move drivers around as follow-up if agreed that is desirable.

>  3 files changed, 733 insertions(+)
>
> diff --git a/drivers/gpu/drm/tiny/Kconfig b/drivers/gpu/drm/tiny/Kconfig
> index 94cbdb1337c07f1628a33599a7130369b9d59d98..33a69aea4232c5ca7a04b1fe1=
8bb424e0fded697 100644
> --- a/drivers/gpu/drm/tiny/Kconfig
> +++ b/drivers/gpu/drm/tiny/Kconfig
> @@ -232,6 +232,17 @@ config TINYDRM_ST7586
> =20
>  =09  If M is selected the module will be called st7586.
> =20
> +config DRM_ST7571_I2C
> +=09tristate "DRM support for Sitronix ST7571 display panels (I2C)"
> +=09depends on DRM && I2C
> +=09select DRM_GEM_SHMEM_HELPER

DRM_GEM_SHMEM_HELPER depends on MMU and your driver is selecting it,
so it should also depend on MMU, i.e: depends on DRM && MMU && I2C.



> +#define drm_to_st7571(_dev) container_of(_dev, struct st7571_device, dev=
)
> +

I usually prefer these to be static inline functions instead of a
macro. That way you get type checking and the end result should be
basically the same.

> +struct st7571_device {
> +=09struct drm_device dev;
> +
> +=09struct drm_plane primary_plane;
> +=09struct drm_crtc crtc;
> +=09struct drm_encoder encoder;
> +=09struct drm_connector connector;
> +
> +=09struct drm_display_mode mode;
> +
> +=09struct i2c_client *client;
> +=09struct regmap *regmap;
> +=09bool ignore_nak;
> +

I know you mentioned that the chip sometimes nacks some I2C messages but
maybe we want to better understand why that is the case before adding a
flag like this?

In particular, I see in the "6.4 MICROPROCESSOR INTERFACE" section of the
datasheet the following note:

"By connecting SDA_OUT to SDA_IN externally, the SDA line becomes fully
I2C interface compatible. Separating acknowledge-output from serial data
input is advantageous for chip-on-glass (COG) applications. In COG
applications, the ITO resistance and the pull-up resistor will form a
voltage  divider, which affects acknowledge-signal level. Larger ITO
resistance will raise the acknowledged-signal level and system cannot
recognize this level as a valid logic =E2=80=9C0=E2=80=9D level. By separat=
ing SDA_IN from
SDA_OUT, the IC can be used in a mode that ignores the acknowledge-bit.
For applications which check acknowledge-bit, it is necessary to minimize
the ITO resistance of the SDA_OUT trace to guarantee a valid low level."

...

> +static int st7571_set_pixel_format(struct st7571_device *st7571,
> +=09=09=09=09   u32 pixel_format)
> +{
> +=09switch (pixel_format) {
> +=09case DRM_FORMAT_C1:
> +=09=09return st7571_set_color_mode(st7571, ST7571_COLOR_MODE_BLACKWHITE)=
;
> +=09case DRM_FORMAT_C2:
> +=09=09return st7571_set_color_mode(st7571, ST7571_COLOR_MODE_GRAY);
> +=09default:
> +=09=09return -EINVAL;
> +=09}

These should be DRM_FORMAT_R1 and DRM_FORMAT_R2 and not C{1,2}. The former
is for displays have a single color (i.e: grey) while the latter is when a
pixel can have different color, whose values are defined by a CLUT table.

...

> +
> +static const uint32_t st7571_primary_plane_formats[] =3D {
> +=09DRM_FORMAT_C1,
> +=09DRM_FORMAT_C2,
> +};
> +

I would add a DRM_FORMAT_XRGB8888 format. This will allow your display to
be compatible with any user-space. Your st7571_fb_blit_rect() can then do
a pixel format conversion from XRGB8888 to the native pixel format.

...

> +static void st7571_primary_plane_helper_atomic_update(struct drm_plane *=
plane,
> +=09=09=09=09=09=09   struct drm_atomic_state *state)
> +{
> +=09struct drm_plane_state *old_plane_state =3D drm_atomic_get_old_plane_=
state(state, plane);
> +=09struct drm_plane_state *plane_state =3D drm_atomic_get_new_plane_stat=
e(state, plane);
> +=09struct drm_shadow_plane_state *shadow_plane_state =3D to_drm_shadow_p=
lane_state(plane_state);
> +=09struct drm_framebuffer *fb =3D plane_state->fb;
> +=09struct drm_atomic_helper_damage_iter iter;
> +=09struct drm_device *dev =3D plane->dev;
> +=09struct drm_rect damage;
> +=09struct st7571_device *st7571 =3D drm_to_st7571(plane->dev);
> +=09int ret, idx;
> +
> +=09if (!fb)
> +=09=09return; /* no framebuffer; plane is disabled */
> +
> +=09ret =3D drm_gem_fb_begin_cpu_access(fb, DMA_FROM_DEVICE);
> +=09if (ret)
> +=09=09return;
> +
> +=09if (!drm_dev_enter(dev, &idx))

Should do a drm_gem_fb_end_cpu_access() here before returning.

> +=09=09return;
> +
> +=09ret =3D st7571_set_pixel_format(st7571, fb->format->format);
> +=09if (ret) {
> +=09=09dev_err(dev->dev, "Failed to set pixel format: %d\n", ret);

And here I think you need to do both drm_gem_fb_end_cpu_access() and drm_de=
v_exit().

> +=09=09return;
> +=09}
> +
> +=09drm_atomic_helper_damage_iter_init(&iter, old_plane_state, plane_stat=
e);
> +=09drm_atomic_for_each_plane_damage(&iter, &damage) {
> +=09=09st7571_fb_blit_rect(fb, &shadow_plane_state->data[0], &damage);
> +=09}
> +
> +=09drm_dev_exit(idx);
> +=09drm_gem_fb_end_cpu_access(fb, DMA_FROM_DEVICE);
> +}
> +
> +static const struct drm_plane_helper_funcs st7571_primary_plane_helper_f=
uncs =3D {
> +=09DRM_GEM_SHADOW_PLANE_HELPER_FUNCS,
> +=09.atomic_check =3D st7571_primary_plane_helper_atomic_check,
> +=09.atomic_update =3D st7571_primary_plane_helper_atomic_update,
> +};

Maybe you want an .atomic_disable callback that clears your screen ?


> +
> +/*
> + * CRTC
> + */
> +
> +static const struct drm_crtc_helper_funcs st7571_crtc_helper_funcs =3D {
> +=09.atomic_check =3D drm_crtc_helper_atomic_check,

I think you could have an .mode_valid callback that just checks the fixed m=
ode.

> +/*
> + * Encoder
> + */
> +
> +static const struct drm_encoder_funcs st7571_encoder_funcs =3D {
> +=09.destroy =3D drm_encoder_cleanup,
> +};

I recommend to have an encoder .atomic_{en,dis}able callbacks to init and t=
urn=20
off your display respectively. That way, the driver can call st7571_lcd_ini=
t()
only when the display is going to be used instead of at probe time.

...

> +static enum drm_mode_status st7571_mode_config_mode_valid(struct drm_dev=
ice *dev,
> +=09=09=09=09=09=09       const struct drm_display_mode *mode)
> +{
> +=09struct st7571_device *st7571 =3D drm_to_st7571(dev);
> +
> +=09return drm_crtc_helper_mode_valid_fixed(&st7571->crtc, mode, &st7571-=
>mode);
> +}

The fact that you are calling a drm_crtc_helper here is an indication that =
probably
this should be done in a struct drm_crtc_helper_funcs .mode_valid callback =
instead,
as mentioned above.

> +
> +static const struct drm_mode_config_funcs st7571_mode_config_funcs =3D {
> +=09.fb_create =3D drm_gem_fb_create_with_dirty,
> +=09.mode_valid =3D st7571_mode_config_mode_valid,

And that way you could just drop this handler.

> +=09.atomic_check =3D drm_atomic_helper_check,
> +=09.atomic_commit =3D drm_atomic_helper_commit,
> +};
> +

...

> +static int st7571_probe(struct i2c_client *client)
> +{
> +=09struct st7571_device *st7571;
> +=09struct drm_device *dev;
> +=09int ret;
> +
> +=09st7571 =3D devm_drm_dev_alloc(&client->dev, &st7571_driver,
> +=09=09=09=09    struct st7571_device, dev);
> +=09if (IS_ERR(st7571))
> +=09=09return PTR_ERR(st7571);
> +
> +=09dev =3D &st7571->dev;
> +=09st7571->client =3D client;
> +=09i2c_set_clientdata(client, st7571);
> +
> +=09ret =3D st7571_parse_dt(st7571);
> +=09if (ret)
> +=09=09return ret;
> +
> +=09st7571->mode =3D st7571_mode(st7571);
> +
> +=09/*
> +=09 * The chip nacks some messages but still works as expected.
> +=09 * If the adapter does not support protocol mangling do
> +=09 * not set the I2C_M_IGNORE_NAK flag at the expense * of possible
> +=09 * cruft in the logs.
> +=09 */
> +=09if (i2c_check_functionality(client->adapter, I2C_FUNC_PROTOCOL_MANGLI=
NG))
> +=09=09st7571->ignore_nak =3D true;
> +
> +=09st7571->regmap =3D devm_regmap_init(&client->dev, &st7571_regmap_bus,
> +=09=09=09=09=09   client, &st7571_regmap_config);
> +=09if (IS_ERR(st7571->regmap)) {
> +=09=09dev_err(&client->dev, "Failed to initialize regmap\n");

If you use dev_err_probe(), you can give some indication to users about
what failed. It prints messages in the /sys/kernel/debug/devices_deferred
debugfs entry.

> +
> +static void st7571_remove(struct i2c_client *client)
> +{
> +=09struct st7571_device *st7571 =3D i2c_get_clientdata(client);
> +
> +=09drm_dev_unplug(&st7571->dev);

I think you are missing a drm_atomic_helper_shutdown() here.

And also a struct i2c_driver .shutdown callback to call to
drm_atomic_helper_shutdown() as well.

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

