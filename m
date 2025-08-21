Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2F33B2FA43
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 15:25:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3278910E999;
	Thu, 21 Aug 2025 13:25:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=icenowy.me header.i=uwu@icenowy.me header.b="nAX+d0s/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com
 [136.143.188.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B41D310E999
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 13:25:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1755782710; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=T2TzbzvMDyArxL2DAXeC0cYdzSORSabgguc89FcBob+GR87cg1ZrjYlDRZ2TY+uMselTA0Y5XPgcSOLaQQ3loF88faToRZgIVz021r8enH352dGBUtMQQxS5WinAt5mWcOVpo5O7naQKBitonpXloR+X7GtvJyWiiHdjRm6oFf0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1755782710;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=GEt57fSD/WKFqSKnZw0fkgTqvh32FVqesRSq6gNhmAQ=; 
 b=C6ddXNL91CpNDaJKha6KHRswyYb6LAl+sn9EHK2OSI/EnTdyKjl1jKZLcDh2wJ9+Rvd1DbaS+9FZ0vTgYHnkeoU878gVlreUbmckCIyK81DSOGoZ5BdRMBhpfB3NG8PS3dqJlJEZSF9pLkZ3x3u54n7GLyF2l1XKvOsIFu55h/U=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=icenowy.me;
 spf=pass  smtp.mailfrom=uwu@icenowy.me;
 dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1755782710; 
 s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
 h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
 bh=GEt57fSD/WKFqSKnZw0fkgTqvh32FVqesRSq6gNhmAQ=;
 b=nAX+d0s/lCVIOFsszrx59CInekRPkR+8fbkdGlL86nEDoBCsgk5mObRY1oVj4sFe
 lud4DnFwUa0AzPhUf4tYIE4Jx73C86YSVXcgwbK8EG/q+MgKEPaf8IW89VbMs3Xrx7c
 wHhCPTug1yUzt7oq5vhkmqdZhavCxm+40kv0/wBpCE7BtE8Ms+pI+3kHXiQcK/GWm7G
 q+dOYVAQF4cW5HN2cyNPluDqNV9AqYRxJ0JpJnpCyuO9PSzvgnQ7zO32RZMHzuCDgM3
 zZnRkKKVbCc5YA7+wYEdbpxUsPEbFh+ohkEJYocsErjpZBJ6LEg1IdX3rIMOG28FbrK
 aYZOqaCsPg==
Received: by mx.zohomail.com with SMTPS id 1755782708032399.82321534151504;
 Thu, 21 Aug 2025 06:25:08 -0700 (PDT)
Message-ID: <8271cdc7d62af9115b195ff3c0ad561be8952605.camel@icenowy.me>
Subject: Re: [RFC PATCH 5/8] drm/bridge: add a driver for T-Head TH1520 HDMI
 controller
From: Icenowy Zheng <uwu@icenowy.me>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Drew
 Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei
 <wefu@redhat.com>, Philipp Zabel <p.zabel@pengutronix.de>, Heiko Stuebner
 <heiko@sntech.de>, Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>,  Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Michal
 Wilczynski <m.wilczynski@samsung.com>, Han Gao <rabenda.cn@gmail.com>, Yao
 Zi <ziyao@disroot.org>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org
Date: Thu, 21 Aug 2025 21:24:48 +0800
In-Reply-To: <hkz5zdhy7i6tmmpntvqydck6fnpegpbletfwj6h7mtppkw3qub@bzfvf2vfcudj>
References: <20250814164048.2336043-1-uwu@icenowy.me>
 <20250814164048.2336043-6-uwu@icenowy.me>
 <sp2pdifimqych5zn3mt7pnba3vl25qflgiys76s7dwmyt3jd72@bmwkc7s6p6c4>
 <63b2ac72fe1d15d214e880f223bb3035e177a07b.camel@icenowy.me>
 <F2C43938B17FA1E1+aKLaKQfN1Ax8Blcx@LT-Guozexi>
 <7ad9a700dce9342d720740525626340237eb8d9f.camel@icenowy.me>
 <hkz5zdhy7i6tmmpntvqydck6fnpegpbletfwj6h7mtppkw3qub@bzfvf2vfcudj>
Organization: Anthon Open-Source Community
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 
MIME-Version: 1.0
X-ZohoMailClient: External
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

=E5=9C=A8 2025-08-21=E6=98=9F=E6=9C=9F=E5=9B=9B=E7=9A=84 14:38 +0300=EF=BC=
=8CDmitry Baryshkov=E5=86=99=E9=81=93=EF=BC=9A
> On Mon, Aug 18, 2025 at 03:47:28PM +0800, Icenowy Zheng wrote:
> > =E5=9C=A8 2025-08-18=E6=98=9F=E6=9C=9F=E4=B8=80=E7=9A=84 15:45 +0800=EF=
=BC=8CTroy Mitchell=E5=86=99=E9=81=93=EF=BC=9A
> > > On Sun, Aug 17, 2025 at 01:10:44AM +0800, Icenowy Zheng wrote:
> > > > =E5=9C=A8 2025-08-16=E6=98=9F=E6=9C=9F=E5=85=AD=E7=9A=84 19:24 +030=
0=EF=BC=8CDmitry Baryshkov=E5=86=99=E9=81=93=EF=BC=9A
> > > > > On Fri, Aug 15, 2025 at 12:40:45AM +0800, Icenowy Zheng
> > > > > wrote:
> > > > > > T-Head TH1520 SoC contains a Synopsys DesignWare HDMI
> > > > > > controller
> > > > > > (paired
> > > > > > with DesignWare HDMI TX PHY Gen2) that takes the "DP"
> > > > > > output
> > > > > > from
> > > > > > the
> > > > > > display controller.
> > > > > >=20
> > > > > > Add a driver for this controller utilizing the common
> > > > > > DesignWare
> > > > > > HDMI
> > > > > > code in the kernel.
> > > > > >=20
> > > > > > Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> > > > > > ---
> > > > > > =C2=A0MAINTAINERS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
> > > > > > =C2=A0drivers/gpu/drm/bridge/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 10 ++
> > > > > > =C2=A0drivers/gpu/drm/bridge/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
> > > > > > =C2=A0drivers/gpu/drm/bridge/th1520-dw-hdmi.c | 170
> > > > > > ++++++++++++++++++++++++
> > > > > > =C2=A04 files changed, 182 insertions(+)
> > > > > > =C2=A0create mode 100644 drivers/gpu/drm/bridge/th1520-dw-hdmi.=
c
> > > > > >=20
> > > > > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > > > > index fe168477caa45..eb84e36ded6d5 100644
> > > > > > --- a/MAINTAINERS
> > > > > > +++ b/MAINTAINERS
> > > > > > @@ -21728,6 +21728,7 @@
> > > > > > F:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Documentation/devicetree/=
bindings/reset/thead,th152
> > > > > > 0-
> > > > > > reset.yaml
> > > > > > =C2=A0F:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0arch/riscv/boot/dts/thead=
/
> > > > > > =C2=A0F:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0drivers/clk/thead/clk-th1=
520-ap.c
> > > > > > =C2=A0F:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0drivers/firmware/thead,th=
1520-aon.c
> > > > > > +F:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0drivers/gpu/drm/bridge/th1520-=
dw-hdmi.c
> > > > > > =C2=A0F:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0drivers/mailbox/mailbox-t=
h1520.c
> > > > > > =C2=A0F:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0drivers/net/ethernet/stmi=
cro/stmmac/dwmac-thead.c
> > > > > > =C2=A0F:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0drivers/pinctrl/pinctrl-t=
h1520.c
> > > > > > diff --git a/drivers/gpu/drm/bridge/Kconfig
> > > > > > b/drivers/gpu/drm/bridge/Kconfig
> > > > > > index b9e0ca85226a6..f75e6ad04179f 100644
> > > > > > --- a/drivers/gpu/drm/bridge/Kconfig
> > > > > > +++ b/drivers/gpu/drm/bridge/Kconfig
> > > > > > @@ -322,6 +322,16 @@ config DRM_THINE_THC63LVD1024
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0help
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Thine TH=
C63LVD1024 LVDS/parallel converter
> > > > > > driver.
> > > > > > =C2=A0
> > > > > > +config DRM_THEAD_TH1520_DW_HDMI
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0tristate "T-Head TH1=
520 DesignWare HDMI bridge"
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0depends on OF
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0depends on COMMON_CL=
K
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0depends on ARCH_THEA=
D || COMPILE_TEST
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0select DRM_DW_HDMI
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0help
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Choose this t=
o enable support for the internal
> > > > > > HDMI
> > > > > > bridge found
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 on the T-Head=
 TH1520 SoC.
> > > > > > +
> > > > > > =C2=A0config DRM_TOSHIBA_TC358762
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0tristate "TC358=
762 DSI/DPI bridge"
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0depends on OF
> > > > > > diff --git a/drivers/gpu/drm/bridge/Makefile
> > > > > > b/drivers/gpu/drm/bridge/Makefile
> > > > > > index 245e8a27e3fc5..421e445ff1cd9 100644
> > > > > > --- a/drivers/gpu/drm/bridge/Makefile
> > > > > > +++ b/drivers/gpu/drm/bridge/Makefile
> > > > > > @@ -27,6 +27,7 @@ obj-$(CONFIG_DRM_SIL_SII8620) +=3D sil-
> > > > > > sii8620.o
> > > > > > =C2=A0obj-$(CONFIG_DRM_SII902X) +=3D sii902x.o
> > > > > > =C2=A0obj-$(CONFIG_DRM_SII9234) +=3D sii9234.o
> > > > > > =C2=A0obj-$(CONFIG_DRM_SIMPLE_BRIDGE) +=3D simple-bridge.o
> > > > > > +obj-$(CONFIG_DRM_THEAD_TH1520_DW_HDMI) +=3D th1520-dw-hdmi.o
> > > > > > =C2=A0obj-$(CONFIG_DRM_THINE_THC63LVD1024) +=3D thc63lvd1024.o
> > > > > > =C2=A0obj-$(CONFIG_DRM_TOSHIBA_TC358762) +=3D tc358762.o
> > > > > > =C2=A0obj-$(CONFIG_DRM_TOSHIBA_TC358764) +=3D tc358764.o
> > > > > > diff --git a/drivers/gpu/drm/bridge/th1520-dw-hdmi.c
> > > > > > b/drivers/gpu/drm/bridge/th1520-dw-hdmi.c
> > > > > > new file mode 100644
> > > > > > index 0000000000000..f8dddf3cb0cca
> > > > > > --- /dev/null
> > > > > > +++ b/drivers/gpu/drm/bridge/th1520-dw-hdmi.c
> > > > > > @@ -0,0 +1,170 @@
> > > > > > +// SPDX-License-Identifier: GPL-2.0+
> > > > > > +/*
> > > > > > + * Copyright (C) 2025 Icenowy Zheng <uwu@icenowy.me>
> > > > > > + *
> > > > > > + * Based on rcar_dw_hdmi.c, which is:
> > > > > > + *=C2=A0=C2=A0 Copyright (C) 2016 Renesas Electronics Corporat=
ion
> > > > > > + * Based on imx8mp-hdmi-tx.c, which is:
> > > > > > + *=C2=A0=C2=A0 Copyright (C) 2022 Pengutronix, Lucas Stach
> > > > > > <kernel@pengutronix.de>
> > > > > > + */
> > > > > > +
> > > > > > +#include <linux/clk.h>
> > > > > > +#include <linux/mod_devicetable.h>
> > > > > > +#include <linux/module.h>
> > > > > > +#include <linux/platform_device.h>
> > > > > > +#include <linux/reset.h>
> > > > > > +
> > > > > > +#include <drm/bridge/dw_hdmi.h>
> > > > > > +#include <drm/drm_modes.h>
> > > > > > +
> > > > > > +#define TH1520_HDMI_PHY_OPMODE_PLLCFG=C2=A0=C2=A00x06=C2=A0=C2=
=A0=C2=A0=C2=A0/* Mode of
> > > > > > operation and PLL dividers */
> > > > > > +#define TH1520_HDMI_PHY_CKSYMTXCTRL=C2=A0=C2=A0=C2=A0=C2=A00x0=
9=C2=A0=C2=A0=C2=A0=C2=A0/* Clock
> > > > > > Symbol
> > > > > > and
> > > > > > Transmitter Control Register */
> > > > > > +#define TH1520_HDMI_PHY_VLEVCTRL=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A00x0e=C2=A0=C2=A0=C2=A0=C2=A0/* Voltage
> > > > > > Level
> > > > > > Control Register */
> > > > > > +#define TH1520_HDMI_PHY_PLLCURRGMPCTRL=C2=A00x10=C2=A0=C2=A0=
=C2=A0=C2=A0/* PLL
> > > > > > current
> > > > > > and
> > > > > > Gmp (conductance) */
> > > > > > +#define TH1520_HDMI_PHY_PLLDIVCTRL=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A00x11=C2=A0=C2=A0=C2=A0=C2=A0/* PLL
> > > > > > dividers
> > > > > > */
> > > > > > +#define TH1520_HDMI_PHY_TXTERM=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A00x19=C2=A0=C2=A0=C2=A0=C2=A0/*
> > > > > > Transmission
> > > > > > Termination Register */
> > > > > > +
> > > > > > +struct th1520_hdmi_phy_params {
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0unsigned long mpixel=
clock;
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0u16 opmode_pllcfg;
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0u16 pllcurrgmpctrl;
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0u16 plldivctrl;
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0u16 cksymtxctrl;
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0u16 vlevctrl;
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0u16 txterm;
> > > > > > +};
> > > > > > +
> > > > > > +static const struct th1520_hdmi_phy_params
> > > > > > th1520_hdmi_phy_params[] =3D {
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0{ 35500000,=C2=A0 0x=
0003, 0x0283, 0x0628, 0x8088,
> > > > > > 0x01a0,
> > > > > > 0x0007
> > > > > > },
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0{ 44900000,=C2=A0 0x=
0003, 0x0285, 0x0228, 0x8088,
> > > > > > 0x01a0,
> > > > > > 0x0007
> > > > > > },
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0{ 71000000,=C2=A0 0x=
0002, 0x1183, 0x0614, 0x8088,
> > > > > > 0x01a0,
> > > > > > 0x0007
> > > > > > },
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0{ 90000000,=C2=A0 0x=
0002, 0x1142, 0x0214, 0x8088,
> > > > > > 0x01a0,
> > > > > > 0x0007
> > > > > > },
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0{ 121750000, 0x0001,=
 0x20c0, 0x060a, 0x8088,
> > > > > > 0x01a0,
> > > > > > 0x0007
> > > > > > },
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0{ 165000000, 0x0001,=
 0x2080, 0x020a, 0x8088,
> > > > > > 0x01a0,
> > > > > > 0x0007
> > > > > > },
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0{ 198000000, 0x0000,=
 0x3040, 0x0605, 0x83c8,
> > > > > > 0x0120,
> > > > > > 0x0004
> > > > > > },
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0{ 297000000, 0x0000,=
 0x3041, 0x0205, 0x81dc,
> > > > > > 0x0200,
> > > > > > 0x0005
> > > > > > },
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0{ 371250000, 0x0640,=
 0x3041, 0x0205, 0x80f6,
> > > > > > 0x0140,
> > > > > > 0x0000
> > > > > > },
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0{ 495000000, 0x0640,=
 0x3080, 0x0005, 0x80f6,
> > > > > > 0x0140,
> > > > > > 0x0000
> > > > > > },
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0{ 594000000, 0x0640,=
 0x3080, 0x0005, 0x80fa,
> > > > > > 0x01e0,
> > > > > > 0x0004
> > > > > > },
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0{ ~0UL,=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 0x0000, 0x0000, 0x0000, 0x0000,
> > > > > > 0x0000,
> > > > > > 0x0000
> > > > > > }
> > > > > > +};
> > > > > > +
> > > > > > +struct th1520_hdmi {
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct dw_hdmi_plat_=
data plat_data;
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct dw_hdmi *dw_h=
dmi;
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct clk *pixclk;
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct reset_control=
 *mainrst, *prst;
> > > > > > +};
> > > > > > +
> > > > > > +static enum drm_mode_status
> > > > > > +th1520_hdmi_mode_valid(struct dw_hdmi *hdmi, void *data,
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const st=
ruct drm_display_info *info,
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const st=
ruct drm_display_mode *mode)
> > > > > > +{
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/*
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * The maximum suppo=
rted clock frequency is 594
> > > > > > MHz, as
> > > > > > shown in the PHY
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * parameters table.
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (mode->clock > 59=
4000)
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return MODE_CLOCK_HIGH;
> > > > >=20
> > > > > We should rewrite DW bridge into HDMI ops. It would help us
> > > > > to
> > > > > get
> > > > > rid
> > > > > of such functions. With it in place it will be handled by the
> > > > > generic
> > > > > TMDS clock rate check.
> > > >=20
> > > > Yes, but this mode_valid hook here is part of the private
> > > > interface
> > > > of
> > > > DW bridge, instead of implementing anything for other parts of
> > > > DRM
> > > > subsystem.
> > > >=20
> > > > Even if the TMDS clock rate check is utilized by the DW bridge,
> > > > the
> > > > bridge's interface should be modified to expose something to
> > > > set
> > > > the
> > > > maximum clock rate.
> > > >=20
> > > > >=20
> > > > > > +
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return MODE_OK;
> > > > > > +}
> > > > > > +
> > > > > > +static int th1520_hdmi_phy_configure(struct dw_hdmi *hdmi,
> > > > > > void
> > > > > > *data,
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 unsigned long
> > > > > > mpixelclock)
> > > > > > +{
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0const struct th1520_=
hdmi_phy_params *params =3D
> > > > > > th1520_hdmi_phy_params;
> > > > > > +
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0for (; params->mpixe=
lclock !=3D ~0UL; ++params) {
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (mpixelclock <=3D params->mpixelclock)
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0break;
> > > > >=20
> > > > > for (...) {
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (mpixelclock <=
=3D params->mpixelclock)
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return th1520_program_phy();
> > > >=20
> > > > There's no such a function here, and this check isn't used for
> > > > another
> > > > time, so having the matching code and programming code
> > > > extracted
> > > > out
> > > > can help nothing.
> > > I think Dmitry meant that the following code should be moved into
> > > a new function, th1520_program_phy().=C2=A0=20
> > >=20
> > > This makes the code cleaner and also avoids one extra if check.
> >=20
> > As there's no code reuse, it does not make code cleaner.
>=20
> It removes necessity for the extra ~0UL entry in the array and
> removes
> the post-loop check whether we found an entry or not.

We will need a way to end the loop for any possible reason, either with
~0UL or ARRAY_SIZE or any other way, and the post-loop check is just a
regular pattern.

In addition, creating such a function will break the sequence of code,
make it different from the control flow.

Maybe the register-writing code could be moved into the loop, but
creating such a function is just making the code more different to
read.

>=20

