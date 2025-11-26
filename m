Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1839C8AB0D
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 16:37:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03DFA10E663;
	Wed, 26 Nov 2025 15:37:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jflzTg0C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com
 [209.85.128.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2B5710E670
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 15:37:37 +0000 (UTC)
Received: by mail-yw1-f170.google.com with SMTP id
 00721157ae682-78802ac22abso75251567b3.3
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 07:37:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764171456; x=1764776256; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WHDPCwxv0SQBBSmUAXCLvcU1eX9cIYvAgH4jmfdmmRY=;
 b=jflzTg0CptwRhwavy/vhHvf76pDEG0PT/sJdBWUQeJKQNEWZJE0pM73igJowFa1IEP
 dtODcdJ8s916Ng/S6BfGTG8/vd99fOoQ1IpahaNSHh4K1xdzC52qRDMu9AOpzCcSQNdL
 pwpMbUB63BzXQjEm1Sx4ZWm4elgjyyTdYMkbJzgeydWZTxYrQy/DaxlDWX969ckQei+f
 GW4400mxjkkZw4KZCqWvlZOy4+Ip7xc+4g5a9bphe0nRSiD06a6TisrRaRlicOQDFVIj
 OmFJ5GWVcO0cFVyEi7PHpDm69gYE1HjgGH0jhbTIhxVPT4K+Iab95F1UHDbPrzQEgicn
 vqzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764171456; x=1764776256;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=WHDPCwxv0SQBBSmUAXCLvcU1eX9cIYvAgH4jmfdmmRY=;
 b=v1Uu+lETHMfNcwUPvvEvnOH22/nv5xav2ahZzkf9stsbDAfEvaC/9JD1jwgBpz/9aN
 uyTCHgUmUr2HAiVanjxchROEODPuMPTcL3nJk8bft+NDvWMwseDkXTov4Z3Y2bzIZxR1
 SEsfkgjX3eqo16BgqrMDPfaPpvUr2gxsDG6MuQrKkFK4dvEZL+OqPxYz+nh7eotEEqlh
 ViKYR0Qug1PQV5mr+yTZQ2yuPIzJ9sdtIbP5/3f558MqgWotOr3ta6zDGDXFsG3r8mZy
 RC99o5UjhA7fWEU6HehvJW3sdaRxCs/KZgrJVM6CduX2p9HEO2fPEU9tezv7r2YHCfw+
 29Gw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXGm6AnDn7p/IVj0KZPrn316ZAPL0PW4mnIcWyxo2a1mcbTzlDkfdU/CjusguEwZznmBjRWydE4zRU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzVfI+03dF2lsYDx6UjSFYBn/nUWDpQwWX7SXj50lb1hYzR6PkY
 kNYwXFfTmDWkjNl8m6oOlU5pAwXPbwEhL9qS6nIOVa9uB/qxHMjhIQSMcnY72fghDu03gvfMhfU
 MxJIOGjO3Vt3IIvybYd4BU9Ri0Miq+0Y=
X-Gm-Gg: ASbGncuMQGIDTX0sDFGPvvuGOSTo7b5peOH4Zn3KI1uPaKLrkBJ9v3NqSRmje5xKFJr
 QCD8iJQ8QGYmkVWK8Fw6UpPuMY8RYHrmf3D/gSQCng35ElZoiEFKaL15zc5O9My/mQQg+9ebpLu
 ldb11y6rbk3OAd8PTj3iZn4KfCmwgrA+D67//69jq0yahuu3p53V1zwew0PaX8OWPNgMd75mO1O
 Y/3ZJmOlCqcp8qetWaEqSDMPwmkeT1iuznJg0HP4YvNZdwDda/5X3Xx6FRD6YaOB7m0+gU=
X-Google-Smtp-Source: AGHT+IE57n3zZx3X1tBPU2cgzpzzXSpf60tCKJP9Fy10vwoAwNJLXV3IlLnaSAZG4w2wBiXVSoYCdVWNh2cUXTgRb24=
X-Received: by 2002:a05:690c:3349:b0:787:fbe3:fc6a with SMTP id
 00721157ae682-78ab6f6ec1fmr72744287b3.52.1764171456610; Wed, 26 Nov 2025
 07:37:36 -0800 (PST)
MIME-Version: 1.0
References: <20251031-st7920-v4-0-35291f8076b2@gmail.com>
 <20251031-st7920-v4-2-35291f8076b2@gmail.com>
 <50a4b4a9-afd4-42a3-9740-5e48de312f1d@kernel.org>
In-Reply-To: <50a4b4a9-afd4-42a3-9740-5e48de312f1d@kernel.org>
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Wed, 26 Nov 2025 16:37:24 +0100
X-Gm-Features: AWmQ_blVQHa4PiJ8hAKBeF36S0QXp1xd_fGzp-lJeY4oF5YsrsYNf8QrcaFoPio
Message-ID: <CABdCQ=MiuMqrf1LpLP=q0by3v9RZNagkrJnJoWOmwSCKGPVO+w@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] drm: Add driver for Sitronix ST7920 LCD displays
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

El lun, 17 nov 2025 a las 11:57, Krzysztof Kozlowski
(<krzk@kernel.org>) escribi=C3=B3:
>
> On 31/10/2025 10:05, Iker Pedrosa wrote:
> > +
> > +static void st7920_hw_reset(struct st7920_device *st7920)
> > +{
> > +     if (!st7920->reset_gpio)
> > +             return;
> > +
> > +     gpiod_set_value_cansleep(st7920->reset_gpio, 0);
> > +     usleep_range(15, 20);
> > +     gpiod_set_value_cansleep(st7920->reset_gpio, 1);
>
> This is odd. Why are you keeping device in reset state?
>
> I don't think you tested your driver with DTS.
>
> > +     msleep(40);
> > +}
> > +
>
> > +
> > +     regmap =3D devm_regmap_init_spi(spi, &st7920_spi_regmap_config);
> > +     if (IS_ERR(regmap))
> > +             return PTR_ERR(regmap);
> > +
> > +     st7920 =3D devm_drm_dev_alloc(dev, &st7920_drm_driver,
> > +                                 struct st7920_device, drm);
> > +     if (IS_ERR(st7920))
> > +             return PTR_ERR(st7920);
> > +
> > +     drm =3D &st7920->drm;
> > +
> > +     st7920->dev =3D dev;
> > +     st7920->regmap =3D regmap;
> > +     st7920->spi =3D spi;
> > +     st7920->device_info =3D device_get_match_data(dev);
> > +     st7920->width =3D st7920->device_info->default_width;
> > +     st7920->height =3D st7920->device_info->default_height;
> > +
> > +     st7920->reset_gpio =3D devm_gpiod_get_optional(dev, "reset", GPIO=
D_OUT_HIGH);
>
> So you keep device in reset state, then why do you toggle it in
> st7920_hw_reset()? Remember that this is the logical, not line level.

You are right. I was confused between the logical state and the
physical line level regarding gpiod.

I have fixed the logic in st7920_hw_reset() to correctly assert the
reset (logical 1) and then de-assert it (logical 0). Accordingly, I
have also changed the probe initialization to GPIOD_OUT_LOW to ensure
the device starts in a non-reset state.

I have also addressed the other comments. These fixes will be
available in the next version which I will submit shortly.

>
> > +     if (IS_ERR(st7920->reset_gpio)) {
> > +             ret =3D PTR_ERR(st7920->reset_gpio);
> > +             dev_err(dev, "Unable to retrieve reset GPIO: %d\n", ret);
>
> return dev_err_probe, didn't you get comment on that?
>
> > +             return ret;
> > +     }
> > +
> > +     spi_set_drvdata(spi, st7920);
> > +
> > +     ret =3D st7920_init_modeset(st7920);
> > +     if (ret)
> > +             return ret;
> > +
> > +     ret =3D drm_dev_register(drm, 0);
> > +     if (ret)
> > +             return dev_err_probe(dev, ret, "DRM device register faile=
d\n");
> > +
> > +     drm_client_setup(drm, NULL);
> > +
>
> Best regards,
> Krzysztof
