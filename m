Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E5E79E8FE4
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2024 11:15:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EE9A10E6BB;
	Mon,  9 Dec 2024 10:15:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="DigJLciC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com
 [209.85.219.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CEDA10E6BB
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2024 10:15:36 +0000 (UTC)
Received: by mail-yb1-f181.google.com with SMTP id
 3f1490d57ef6-e3a26de697fso1157044276.3
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Dec 2024 02:15:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733739335; x=1734344135; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=l8vI+mafQJICnkT4ByBE+HuAejFrqMpigPXyZ+V3gfk=;
 b=DigJLciCxCbg7nJaCjzDjd36iCDI0RHJOlA+rmMlrPbdgLhGdGNRqBm7lhXJo1sj6W
 1tUcb8mwOVHrleYusD69yR27f5C8PdqVl1bmpF5qPCvNQ4MQyNVPckk+l8LYD8Pi2KEd
 u/COvj01KiuFrMlX0amNKawev2b/M2JIVh62cZLYzXrhTKCaeKdrAVrP7vlLyzNJ+dZb
 jIj3LwNbD3xco4910bnpws8GkT8Snku2oYSyRZsvPCX5ynA9owmfeM0YV6e5ilmWdLl0
 9gS95cSx96i1U15dVh3w9FPJVUeb0JfMR8nhhkYAwBmTa8HozYLMxvQNomzffkscQ6WM
 PiWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733739335; x=1734344135;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=l8vI+mafQJICnkT4ByBE+HuAejFrqMpigPXyZ+V3gfk=;
 b=mkpVhet/ViuvTz9kfQBEaMs8AfYQAoQ4tlIEi8g4BBhlbj5twkdVu/vfyerAmYjzPz
 DiD+24dODaZH0AU8iYLc+8t0tcTCXXuSJqeYlFPYewt0cGmZ1sInwAfss5s2Bgz7ykCb
 quc7BjmUJqGddMuwqNUZSNfvEEir3Ot7ufO32+S4kIFvnY5PYrA/dgQDDieW9j9pEkKH
 uuE3URsESPCZmYGGxmuiItZIWyMCNE65hB+XIoT/XQj/YGRvfs2qPTir434AoDigbtsR
 utvewKnMabl0NZSR0RJWOPYcHLoh6IZBkXwnYdBiCh+D3Xx9TU3uBQNE3VEGnkj9HXbq
 XRJg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUaQKzqScs6tJRgXRdC1b1Q37OTwyTeNlKZpor54841NOMYxt024SFhXjIjQRBMpq2AdHKrWppppqA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx0ojI+iBvJRPTKzqu5dI9YKmKKbZ1rQ+qCgDhbYPrLeesG94he
 mWglSkYxqcjE+6G7ThxvXXilvkuDKLJrHfS4i1vnRCApitbclaQuacQvQRQ9p4AQCOPFdkErXzm
 7r0xuZRRsegbw8AeH6b6iIL+MeI0n6VWgRWAzFQ==
X-Gm-Gg: ASbGnct0Oa/zWsvOe2BBE2LpmWrA86qjKK9MmwZ7bGLTZ84Ks3OQHOXc/UhTGBuIQ89
 2QKlXbt5QWKG34UlUTeMLLd5fZMBtBbY=
X-Google-Smtp-Source: AGHT+IEYOHT/dGfysgHNg+sIyk39rFclVXASjoPiptGYgkI+v6pr5kBeW++F6mbWR9LBKnALmvDk24OJ2+AqS/tovSY=
X-Received: by 2002:a05:6902:727:b0:e3a:4f3f:af41 with SMTP id
 3f1490d57ef6-e3a4f3fb32fmr656889276.17.1733739335239; Mon, 09 Dec 2024
 02:15:35 -0800 (PST)
MIME-Version: 1.0
References: <cover.1732627815.git.Sandor.yu@nxp.com>
 <4ef8252825d7a962b440519fb17fdcd5dd817672.1732627815.git.Sandor.yu@nxp.com>
 <slkpvbemsrz5jv4cafp7k4pdj3smpl575w2dtmjoheoqqrh32j@2wi5564jzawg>
 <PAXPR04MB94488CEFA54F8AA193DC2BBDF43C2@PAXPR04MB9448.eurprd04.prod.outlook.com>
In-Reply-To: <PAXPR04MB94488CEFA54F8AA193DC2BBDF43C2@PAXPR04MB9448.eurprd04.prod.outlook.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 9 Dec 2024 12:15:26 +0200
Message-ID: <CAA8EJpoKkOj2pBxi4QcVAVOwzaW=yVAyomOFv7-oAxPYamfa-A@mail.gmail.com>
Subject: Re: [PATCH v19 6/8] phy: freescale: Add DisplayPort/HDMI Combo-PHY
 driver for i.MX8MQ
To: Sandor Yu <sandor.yu@nxp.com>
Cc: "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>, 
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 "jonas@kwiboo.se" <jonas@kwiboo.se>, 
 "jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>,
 "airlied@gmail.com" <airlied@gmail.com>, 
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>, 
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, 
 "festevam@gmail.com" <festevam@gmail.com>,
 "vkoul@kernel.org" <vkoul@kernel.org>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
 "mripard@kernel.org" <mripard@kernel.org>, 
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 dl-linux-imx <linux-imx@nxp.com>, Oliver Brown <oliver.brown@nxp.com>, 
 "alexander.stein@ew.tq-group.com" <alexander.stein@ew.tq-group.com>,
 "sam@ravnborg.org" <sam@ravnborg.org>
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

On Mon, 9 Dec 2024 at 10:38, Sandor Yu <sandor.yu@nxp.com> wrote:
>
>
>
> > -----Original Message-----
> > From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Sent: 2024=E5=B9=B411=E6=9C=8826=E6=97=A5 22:43
> > To: Sandor Yu <sandor.yu@nxp.com>
> > Cc: andrzej.hajda@intel.com; neil.armstrong@linaro.org; Laurent Pinchar=
t
> > <laurent.pinchart@ideasonboard.com>; jonas@kwiboo.se;
> > jernej.skrabec@gmail.com; airlied@gmail.com; daniel@ffwll.ch;
> > robh+dt@kernel.org; krzysztof.kozlowski+dt@linaro.org;
> > shawnguo@kernel.org; s.hauer@pengutronix.de; festevam@gmail.com;
> > vkoul@kernel.org; dri-devel@lists.freedesktop.org;
> > devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
> > linux-kernel@vger.kernel.org; linux-phy@lists.infradead.org;
> > mripard@kernel.org; kernel@pengutronix.de; dl-linux-imx
> > <linux-imx@nxp.com>; Oliver Brown <oliver.brown@nxp.com>;
> > alexander.stein@ew.tq-group.com; sam@ravnborg.org
> > Subject: [EXT] Re: [PATCH v19 6/8] phy: freescale: Add DisplayPort/HDMI
> > Combo-PHY driver for i.MX8MQ
> >
> > Caution: This is an external email. Please take care when clicking link=
s or
> > opening attachments. When in doubt, report the message using the 'Repor=
t
> > this email' button
> >
> >
> > On Tue, Nov 26, 2024 at 10:11:51PM +0800, Sandor Yu wrote:
> > > Add Cadence HDP-TX DisplayPort and HDMI PHY driver for i.MX8MQ.
> > >
> > > Cadence HDP-TX PHY could be put in either DP mode or
> > > HDMI mode base on the configuration chosen.
> > > DisplayPort or HDMI PHY mode is configured in the driver.
> > >
> > > Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
> > > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > > ---
> > > v18->v19:
> > > - Simplify the PLL tables by removing unused and constant data
> > > - Remove PHY power management, controller driver will handle them.
> > > - Remove enum dp_link_rate
> > > - Introduce read_pll_timeout.
> > > - Update clock management as devm_clk_get_enabled() introduced.
> > > - Remove cdns_hdptx_phy_init() and cdns_hdptx_phy_remove().
> > >
> > > v17->v18:
> > > - fix build error as code rebase to latest kernel version.
> > >
> > >  drivers/phy/freescale/Kconfig                |   10 +
> > >  drivers/phy/freescale/Makefile               |    1 +
> > >  drivers/phy/freescale/phy-fsl-imx8mq-hdptx.c | 1237
> > ++++++++++++++++++
> > >  3 files changed, 1248 insertions(+)
> > >  create mode 100644 drivers/phy/freescale/phy-fsl-imx8mq-hdptx.c
> > >
> > > diff --git a/drivers/phy/freescale/Kconfig b/drivers/phy/freescale/Kc=
onfig
> > > index dcd9acff6d01a..bbd17e9556cc3 100644
> > > --- a/drivers/phy/freescale/Kconfig
> > > +++ b/drivers/phy/freescale/Kconfig
> > > @@ -35,6 +35,16 @@ config PHY_FSL_IMX8M_PCIE
> > >         Enable this to add support for the PCIE PHY as found on
> > >         i.MX8M family of SOCs.
> > >
> > > +config PHY_FSL_IMX8MQ_HDPTX
> > > +     tristate "Freescale i.MX8MQ DP/HDMI PHY support"
> > > +     depends on OF && HAS_IOMEM
> > > +     depends on COMMON_CLK
> > > +     depends on CDNS_MHDP_HELPER
> >
> > You should not be depending on the symbol that can not be selected by
> > the user.
>
> OK.
>
> >
> > > +     select GENERIC_PHY
> > > +     help
> > > +       Enable this to support the Cadence HDPTX DP/HDMI PHY driver
> > > +       on i.MX8MQ SOC.
> > > +
> > >  config PHY_FSL_IMX8QM_HSIO
> > >       tristate "Freescale i.MX8QM HSIO PHY"
> > >       depends on OF && HAS_IOMEM
> > > diff --git a/drivers/phy/freescale/Makefile b/drivers/phy/freescale/M=
akefile
> > > index 658eac7d0a622..a946b87905498 100644
> > > --- a/drivers/phy/freescale/Makefile
> > > +++ b/drivers/phy/freescale/Makefile
> > > @@ -1,4 +1,5 @@
> > >  # SPDX-License-Identifier: GPL-2.0-only
> > > +obj-$(CONFIG_PHY_FSL_IMX8MQ_HDPTX)   +=3D phy-fsl-imx8mq-hdptx.o
> > >  obj-$(CONFIG_PHY_FSL_IMX8MQ_USB)     +=3D phy-fsl-imx8mq-usb.o
> > >  obj-$(CONFIG_PHY_MIXEL_LVDS_PHY)     +=3D
> > phy-fsl-imx8qm-lvds-phy.o
> > >  obj-$(CONFIG_PHY_MIXEL_MIPI_DPHY)    +=3D phy-fsl-imx8-mipi-dphy.o
> > > diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-hdptx.c
> > b/drivers/phy/freescale/phy-fsl-imx8mq-hdptx.c
> > > new file mode 100644
> > > index 0000000000000..e99487622d43c
> > > --- /dev/null
> > > +++ b/drivers/phy/freescale/phy-fsl-imx8mq-hdptx.c
> > > @@ -0,0 +1,1237 @@
> > > +// SPDX-License-Identifier: GPL-2.0-only
> > > +/*
> > > + * Cadence DP/HDMI PHY driver
> > > + *
> > > + * Copyright (C) 2022-2024 NXP Semiconductor, Inc.
> > > + */
> > > +#include <drm/bridge/cdns-mhdp-helper.h>
> >
> > Still, I'd ask for drivers/soc instead.
>
> If put it in drivers/soc, should I create a new directory called drivers/=
soc/cadence or put it in drivers/soc/imx?
>
> The mhdp helpers will share code between cdns-mhdp8501 and cdns-mhdp8546.
> I prefer creating a new directory, drivers/soc/cadence, but the problem i=
s that cadence not a real SoC.

I think drivers/soc/cadence is fine. Please explain your decision in
the cover letter and in the commit message, this will help other
maintainers to understand you.

--=20
With best wishes
Dmitry
