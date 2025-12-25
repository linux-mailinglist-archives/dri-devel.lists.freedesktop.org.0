Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF99CDE106
	for <lists+dri-devel@lfdr.de>; Thu, 25 Dec 2025 20:34:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8EAA10E7D2;
	Thu, 25 Dec 2025 19:34:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="aWNbhBVB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 365DA10E7D2
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Dec 2025 19:34:19 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id
 4fb4d7f45d1cf-649e28dccadso11272922a12.3
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Dec 2025 11:34:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766691258; x=1767296058; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GCCQe+pRYbdqDLkAr1CoQ+p6IUmQ9Qx7N3/F7dp2OrI=;
 b=aWNbhBVBbv7TlsO/e35arYD90NOIRr/AwDmlIGrfGM8hvNuFEdaKkouYU8Oc4SeS3A
 XQbWZHreE4HQi2kZqwlGAyPildwr4oeuP+2KpgJhxEMBNisiypz8TTi9wug6T8h/mWGT
 QO3yNI7DBN+4Ds7Umvlw/+aeydh5XRY3tp1lqB+9zznh8N7/uke7+Wzcn6mMT7UAJCzK
 +VNNuQc0j4NJjw6X/4c//KHkhGBUMNK/68L+hc9wxTf04RSVh9lBUxC3znkP+D2k0TKx
 tVuVH18fChXdaopRLyJurgsp3pO/Rjfctql/MtfNvPSE/Fbj26jhss9P5uG5HP6BlQQc
 TD8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766691258; x=1767296058;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=GCCQe+pRYbdqDLkAr1CoQ+p6IUmQ9Qx7N3/F7dp2OrI=;
 b=TTUChO7Jgq12SPmiYITEMCYMzY86nDN5VXmRsWaJRl69N1/ycz5x0WmEJv6aVNUeWO
 HBsV+LBdIgUYMlHp7WuqT5Z6ZUq9F4bAMLACfd/lFnFobmizxXSt59t3c4X5bZIOCYa8
 CZ/Ovof4kZOOM9S1GiW6oPI7/KfWPfzuMzbtVKr0ZLvJSOuiXpqkrC8s9Q07f0nMnw88
 5V1yqklMaQukfXHKT5Mb8EGUyzxog63q02kMAuFHvW+5HawYVFg7pJ9lnFkRs7mhrsFS
 uhKgdop8IwvqQG50Q+oG7JV44ZChFVfLATZHypj4p0Vi9qhfgtDHceVEV5lOACoWLpED
 cDWQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXtCecqPSMoMfDvKK8HwoeNMJe4aP8DPelnAQE0ZcbJw3MJXkRkKKxz5bmu/nfd+qp3aUwIsl3BzGo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx0l0djWgbfUPr+RbLR17+wmPlJZyjpIqWFdJ65K1Ufai6PmqZt
 lXacXQ/WCIxFHSD/q/GYVRqkJugIJKHw0keDPTR9f83ok9fhAkeOfNL2mTOILM3a
X-Gm-Gg: AY/fxX7fCdhLVXAeTyRontC1yFHt8ALOrWS9yt437DF/ww0PncFMSrJVeX85tXSARkC
 9b8qyZQvLWGLIuBhmzB8n8PhMDqAQPEtOfV6QyGQUAlZbjn5NdMMfnCclfyXibNOY1n2hT1rWY4
 Kmezqkgu27Uaej/EujEH/S0YBwg7AW3UzY0o4nk5zMcB0dy0RMCg8eCQEKZjFP/kOVzviL/TAn3
 WDDz1XvddoPQilqEFEP0qG4/KvRIFGQbgD08RP1CNMm6Be7T5p61u2Gbbc3mhs4R8ZzB0eWvSzn
 94ippyN4n6S598Z/OgjuqdxRy2F0d3eZmyq695wUVT5cCz9r8p4WZfTOXoF4ZNKu198Ye1xT25U
 ntO5nd/O+cFRA1zgbGZGDNeZ3e1sauaAQeNE1SDtNrQdjmklioxjSHOS73MVJpSP64Mj/v8K93z
 XbFOYGTRuJUJIbJZ2WBAzVHNT3JuIoQdEx
X-Google-Smtp-Source: AGHT+IGvO3IMjEj5neK9YLe7p0o8Hu6EpqYO5l2iHCHivnyYHwPQvp96m6na5gEhouJ/SSYvvXULIw==
X-Received: by 2002:a05:6402:42c4:b0:63c:eb6:65e8 with SMTP id
 4fb4d7f45d1cf-64b8edb753bmr20691588a12.30.1766691257505; 
 Thu, 25 Dec 2025 11:34:17 -0800 (PST)
Received: from jernej-laptop.localnet ([188.159.248.16])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-64b912534f2sm20604568a12.15.2025.12.25.11.34.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Dec 2025 11:34:16 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: wens@kernel.org
Cc: samuel@sholland.org, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 mturquette@baylibre.com, sboyd@kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org
Subject: Re: [PATCH 5/7] drm/sun4i: Add planes driver
Date: Thu, 25 Dec 2025 20:34:14 +0100
Message-ID: <3333337.5fSG56mABF@jernej-laptop>
In-Reply-To: <CAGb2v64bp0BYYdCbaS+wg0H+MD27Bk-n5i8t9X5nVGTG3_hX_Q@mail.gmail.com>
References: <20251115141347.13087-1-jernej.skrabec@gmail.com>
 <2040104.PYKUYFuaPT@jernej-laptop>
 <CAGb2v64bp0BYYdCbaS+wg0H+MD27Bk-n5i8t9X5nVGTG3_hX_Q@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
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

Dne =C4=8Detrtek, 25. december 2025 ob 20:30:23 Srednjeevropski standardni =
=C4=8Das je Chen-Yu Tsai napisal(a):
> On Fri, Dec 26, 2025 at 3:17=E2=80=AFAM Jernej =C5=A0krabec <jernej.skrab=
ec@gmail.com> wrote:
> >
> > Dne =C4=8Detrtek, 25. december 2025 ob 10:37:06 Srednjeevropski standar=
dni =C4=8Das je Chen-Yu Tsai napisal(a):
> > > On Thu, Dec 25, 2025 at 5:29=E2=80=AFPM Chen-Yu Tsai <wens@kernel.org=
> wrote:
> > > >
> > > > On Sat, Nov 15, 2025 at 10:14=E2=80=AFPM Jernej Skrabec
> > > > <jernej.skrabec@gmail.com> wrote:
> > > > >
> > > > > This driver serves just as planes sharing manager, needed for Dis=
play
> > > > > Engine 3.3 and newer.
> > > > >
> > > > > Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> > > > > ---
> > > > >  drivers/gpu/drm/sun4i/Kconfig         |   8 +
> > > > >  drivers/gpu/drm/sun4i/Makefile        |   1 +
> > > > >  drivers/gpu/drm/sun4i/sun50i_planes.c | 205 ++++++++++++++++++++=
++++++
> > > > >  drivers/gpu/drm/sun4i/sun50i_planes.h |  43 ++++++
> > > > >  4 files changed, 257 insertions(+)
> > > > >  create mode 100644 drivers/gpu/drm/sun4i/sun50i_planes.c
> > > > >  create mode 100644 drivers/gpu/drm/sun4i/sun50i_planes.h
> > > > >
> > > > > diff --git a/drivers/gpu/drm/sun4i/Kconfig b/drivers/gpu/drm/sun4=
i/Kconfig
> > > > > index b56ba00aabca..946dd7606094 100644
> > > > > --- a/drivers/gpu/drm/sun4i/Kconfig
> > > > > +++ b/drivers/gpu/drm/sun4i/Kconfig
> > > > > @@ -85,4 +85,12 @@ config DRM_SUN8I_TCON_TOP
> > > > >           TCON TOP is responsible for configuring display pipelin=
e for
> > > > >           HDMI, TVE and LCD.
> > > > >
> > > > > +config DRM_SUN50I_PLANES
> > > > > +       tristate
> > > > > +       default DRM_SUN4I if DRM_SUN8I_MIXER!=3Dn
> > > > > +       help
> > > > > +         Chose this option if you have an Allwinner Soc with the
> > > > > +         Display Engine 3.3 or newer. Planes are shared resource
> > > > > +         between multiple mixers.
> > > > > +
> > > > >  endif
> > > > > diff --git a/drivers/gpu/drm/sun4i/Makefile b/drivers/gpu/drm/sun=
4i/Makefile
> > > > > index bad7497a0d11..03f002abef15 100644
> > > > > --- a/drivers/gpu/drm/sun4i/Makefile
> > > > > +++ b/drivers/gpu/drm/sun4i/Makefile
> > > > > @@ -38,3 +38,4 @@ obj-$(CONFIG_DRM_SUN6I_DSI)   +=3D sun6i_mipi_d=
si.o
> > > > >  obj-$(CONFIG_DRM_SUN8I_DW_HDMI)        +=3D sun8i-drm-hdmi.o
> > > > >  obj-$(CONFIG_DRM_SUN8I_MIXER)  +=3D sun8i-mixer.o
> > > > >  obj-$(CONFIG_DRM_SUN8I_TCON_TOP) +=3D sun8i_tcon_top.o
> > > > > +obj-$(CONFIG_DRM_SUN50I_PLANES)        +=3D sun50i_planes.o
> > > >
> > > > I don't think you can have this as a separate module:
> > > >
> > > > a. You are using sun8i_vi_layer_init_one() and sun8i_ui_layer_init_=
one()
> > > >    from the sun8i-mixer module, and neither of them are exported sy=
mbols.
> > > >
> > > > b. You export sun50i_planes_setup() for sun8i-mixer to call, which =
ends
> > > >    up becoming a circular dependency.
> > > >
> > > > The easiest solution would be to just fold this into the sun8i-mixe=
r module.
> >
> > I mimicked tcon-top module, but yeah, it's much less of a hassle to fol=
d it
> > into sun8i-mixer.
> >
> > > >
> > > >
> > > > > diff --git a/drivers/gpu/drm/sun4i/sun50i_planes.c b/drivers/gpu/=
drm/sun4i/sun50i_planes.c
> > > > > new file mode 100644
> > > > > index 000000000000..a99c01122990
> > > > > --- /dev/null
> > > > > +++ b/drivers/gpu/drm/sun4i/sun50i_planes.c
> > > > > @@ -0,0 +1,205 @@
> > > > > +// SPDX-License-Identifier: GPL-2.0+
> > > > > +/* Copyright (c) 2025 Jernej Skrabec <jernej.skrabec@gmail.com> =
*/
> > > > > +
> > > > > +#include <linux/device.h>
> > > > > +#include <linux/io.h>
> > > > > +#include <linux/mfd/syscon.h>
> > > > > +#include <linux/module.h>
> > > > > +#include <linux/of.h>
> > > > > +#include <linux/of_graph.h>
> > > > > +#include <linux/platform_device.h>
> > > > > +
> > > > > +#include "sun50i_planes.h"
> > > > > +#include "sun8i_ui_layer.h"
> > > > > +#include "sun8i_vi_layer.h"
> > > > > +
> > > > > +static bool sun50i_planes_node_is_planes(struct device_node *nod=
e)
> > > > > +{
> > > > > +       return !!of_match_node(sun50i_planes_of_table, node);
> > > > > +}
> > > > > +
> > > > > +struct drm_plane **
> > > > > +sun50i_planes_setup(struct device *dev, struct drm_device *drm,
> > > > > +                   unsigned int mixer)
> > > > > +{
> > > > > +       struct sun50i_planes *planes =3D dev_get_drvdata(dev);
> > > > > +       const struct sun50i_planes_quirks *quirks;
> > > > > +       struct drm_plane **drm_planes;
> > > > > +       const struct default_map *map;
> > > > > +       unsigned int i;
> > > > > +
> > > > > +       if (!sun50i_planes_node_is_planes(dev->of_node)) {
> > > > > +               dev_err(dev, "Device is not planes driver!\n");
> > > > > +               return NULL;
> > > > > +       }
> > > > > +
> > > > > +       if (!planes) {
> > > > > +               dev_err(dev, "Planes driver is not loaded yet!\n"=
);
> > > > > +               return NULL;
> > > > > +       }
> > > > > +
> > > > > +       if (mixer > 1) {
> > > > > +               dev_err(dev, "Mixer index is too high!\n");
> > > > > +               return NULL;
> > > > > +       }
> > > > > +
> > > > > +       quirks =3D planes->quirks;
> > > > > +       map =3D &quirks->def_map[mixer];
> > > > > +
> > > > > +       drm_planes =3D devm_kcalloc(drm->dev, map->num_ch + 1,
> > > >
> > > > Just a note: it seems we are missing the sentinel in sun8i_layers_i=
nit().
> >
> > Why do you think so? Current mainline code has mixer->cfg->vi_num +
> > mixer->cfg->ui_num + 1.
>=20
> I believe this was changed in your previous cleanups:
>=20
> https://lore.kernel.org/all/20251104180942.61538-16-jernej.skrabec@gmail.=
com/

Ah, true. I'll send fix for -rc soon.

Best regards,
Jernej



