Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A9DA3439F
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 15:54:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0F1410EAFA;
	Thu, 13 Feb 2025 14:54:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MeJjIHj3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4161D10EAF8
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 14:54:16 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-ab7d58aa674so149082966b.0
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 06:54:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739458454; x=1740063254; darn=lists.freedesktop.org;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aUwOmDEJF2wOs2nTiLIA+I47nkpCmb6VTNh/7P12ZFk=;
 b=MeJjIHj3TCGaNYGBF70GauDiKv2zYCCE5PF1QKAq1rT7XG7HSGm6bKzYxKN7dxRObp
 QQZJpX9AFpmjaq8+j/NGvjC4oCcTNsbta0LnB8gHe8yY3Anh8T6WaCPbjgaZlo1Modd9
 C6YymuTPG+T4i13Gsz3WVY7fws8oCsf7FazI8Pr8CtgMmlnTBZYwl3KoMT8maPPT1P0G
 JGVHuTn78DMJja/3XAZv/JaB7k7bmcBiRbRZOLdyL7gnAoscMN8DAeM/f3/BiwSZFZ/F
 75+Vr+qtlHUq7bqbJZJfXnxnYjr7fU5EnBHXhT4/YIXlcPEXEy8skE26yE2tZMDrMIn5
 a1ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739458454; x=1740063254;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aUwOmDEJF2wOs2nTiLIA+I47nkpCmb6VTNh/7P12ZFk=;
 b=drHFkeXdPImGJxAxIarRpChTRaVgqDXyaWFJW7oKtYM45mt0yihfWpQPpqRcdPa6ck
 h3o1/uI31MTohwNNM/F/3ETDh2uZyT0Igaqut9fUF94Wz2fMWVyoSZyOzK0tAP+jcK0m
 RjO7RHoQN6+V2kiQrwZrJ1T3oqyR6eVbKXJ9a2xSqjJ5P4lqGFFAGZ6+FGkRGGejmgfE
 4/UTuUUlATWweXUNZT7PVAPMyT6xzs+zi6oSnJM9vfkaPg0yzjfUz2oirni2FlIm4Dvp
 Xb/zgNUK239lp6w3iJW70DZo1btScmNHDY4DSDB2s69fhYld93gbQnpUSnq6glnDJR9n
 j0TQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUnjes7HmZd0y0IeHkc9PnJIBzslvMKS4Yh4AcOQRYhHpvDm4FCrRsh+tNt1ducysfcXR0gBaQOugk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxy9iGWXUwDfg27xoN60q9u1SxOxswu8XmUFc1eJti5bVXCxjto
 NyVxhOdU9nmcCu6lWZ8q+FaSrb6EWll9P4m2MURu1QzdiZdnxKk2
X-Gm-Gg: ASbGncuPKoW55wvh41fDXfD+PaCMudMOhm4xjuZIS4mORrKQKpKTbOE0WN9yMeXIqmS
 WoEN92rzNsTaXyT5yLaGNyRK3gonwb+VbJPDj8DYv1yOTHAfDWcP9rRoGotUHdfKnq+3xOE/5LP
 T8gRxQaWwLn1KyP/IbgNLhlF1iJb0fcdsMZwpLqwTTXPygKLwQtM95nQ1xYb/i63r9M9nC9gwNW
 ZV7ddUcYK3Jm+txO7e5f74YfYQv4B2oX9xDe00ecF44wzhSrhbiPvfbByvThNsV3zK/Mo/et3Mu
 nYCMXc46gg62zD2rysALqtCfef/GdDxdq9krTx6IHss1FVSyyM7XfG3XSASEbLBjzl9ZGVxK
X-Google-Smtp-Source: AGHT+IHRjDETV8MTnwCbNtSq+kIovSq5moe9v0r+//O++wk+ZnIkHd4F+W0Aw7g4U3jTuMaXq46XsQ==
X-Received: by 2002:a17:907:7207:b0:ab2:db7b:5db3 with SMTP id
 a640c23a62f3a-ab7f34e7515mr682372866b.54.1739458454075; 
 Thu, 13 Feb 2025 06:54:14 -0800 (PST)
Received: from smtpclient.apple (89-66-237-154.dynamic.chello.pl.
 [89.66.237.154]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aba532322c4sm146145866b.34.2025.02.13.06.54.11
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 13 Feb 2025 06:54:13 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.400.131.1.6\))
Subject: Re: [PATCH v6 00/14] Add eDP support for RK3588
From: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
In-Reply-To: <20250123100747.1841357-1-damon.ding@rock-chips.com>
Date: Thu, 13 Feb 2025 15:54:00 +0100
Cc: heiko@sntech.de, robh@kernel.org, conor+dt@kernel.org,
 algea.cao@rock-chips.com, rfoss@kernel.org, devicetree@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, sebastian.reichel@collabora.com,
 dri-devel@lists.freedesktop.org, hjc@rock-chips.com,
 kever.yang@rock-chips.com, dmitry.baryshkov@linaro.org, vkoul@kernel.org,
 andy.yan@rock-chips.com, krzk+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, l.stach@pengutronix.de
Content-Transfer-Encoding: quoted-printable
Message-Id: <5044FFCB-B325-40D0-BA82-03AF64EAF029@gmail.com>
References: <20250123100747.1841357-1-damon.ding@rock-chips.com>
To: Damon Ding <damon.ding@rock-chips.com>
X-Mailer: Apple Mail (2.3826.400.131.1.6)
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



> Wiadomo=C5=9B=C4=87 napisana przez Damon Ding =
<damon.ding@rock-chips.com> w dniu 23 sty 2025, o godz. 11:07:
>=20
> Picked from:
> =
https://patchwork.kernel.org/project/linux-rockchip/list/?series=3D923593
>=20
> These patchs have been tested with a 1536x2048p60 eDP panel on
> RK3588S EVB1 board, and HDMI 1080P/4K display also has been verified
> on RK3588 EVB1 board. Furthermore, the eDP display has been rechecked
> on RK3399 sapphire excavator board.
>=20
> Patch 1~4   are preparations for the RK3588 eDP support on both =
Analogix
>            side and Rockchip side.
> Patch 5~8  are to support to get panel from the DP AUX bus.
> Patch 9~11 are the RK3588 Analogix DP driver support.
> Patch 12    is to add the power sequencing delays for panel model
>            LP079QX1-SP0V.
> Patch 13    is the addition of RK3588 eDP0 node.
> Patch 14    is to enable the eDP0 display on RK3588S EVB1 board.
>=20
> Damon Ding (14):
>  drm/rockchip: analogix_dp: Replace DRM_...() functions with drm_...()
>  drm/rockchip: analogix_dp: Use formalized struct definition for grf
>    field
>  drm/rockchip: analogix_dp: Expand device data to support multiple edp
>    display
>  drm/bridge: analogix_dp: Add support for phy configuration.
>  dt-bindings: display: rockchip: analogix-dp: Add support to get panel
>    from the DP AUX bus
>  drm/bridge: analogix_dp: support to get &analogix_dp_device.plat_data
>    and &analogix_dp_device.aux
>  drm/bridge: analogix_dp: Add support to get panel from the DP AUX bus
>  drm/rockchip: analogix_dp: Add support to get panel from the DP AUX
>    bus
>  dt-bindings: display: rockchip: analogix-dp: Add support for RK3588
>  drm/bridge: analogix_dp: Add support for RK3588
>  drm/rockchip: analogix_dp: Add support for RK3588
>  drm/edp-panel: Add LG Display panel model LP079QX1-SP0V
>  arm64: dts: rockchip: Add eDP0 node for RK3588
>  arm64: dts: rockchip: Enable eDP0 display on RK3588S EVB1 board
>=20
> .../rockchip/rockchip,analogix-dp.yaml        |  25 +-
> arch/arm64/boot/dts/rockchip/rk3588-base.dtsi |  28 +++
> .../boot/dts/rockchip/rk3588s-evb1-v10.dts    |  54 ++++
> .../drm/bridge/analogix/analogix_dp_core.c    |  76 +++---
> .../drm/bridge/analogix/analogix_dp_core.h    |   1 +
> .../gpu/drm/bridge/analogix/analogix_dp_reg.c |  52 ++++
> drivers/gpu/drm/panel/panel-edp.c             |   8 +
> .../gpu/drm/rockchip/analogix_dp-rockchip.c   | 238 +++++++++++++-----
> include/drm/bridge/analogix_dp.h              |   8 +-
> 9 files changed, 401 insertions(+), 89 deletions(-)
>=20
> --=20
> 2.34.1
>=20

Damon,

I=E2=80=99m playing with hdmi0 port enablement on radxa rock5 itx board =
with 6.14 mainline.

rock5 itx has 2 hdmi ports: hdmi0 is wired to rk3588 typeC1/eDP1 eDP =
with ra620 eDP->HDMI converter and hdmi1 from hdmi/edp tx1
(see page3 & page29 at =
https://dl.radxa.com/rock5/5itx/v1110/radxa_rock_5itx_v1110_schematic.pdf)=


I=E2=80=99m on 6.14-rc2 with applied:=20
[1] Cristicc hdmi code =
(https://gitlab.collabora.com/cristicc/linux-next/-/commits/rk3588-hdmi-br=
idge)
[2] eDP support for RK3588 =
(https://patchwork.kernel.org/project/linux-rockchip/list/?series=3D927765=
)
[3] Add eDP mode support for Rockchip Samsung HDPTX PHY =
(https://patchwork.kernel.org/project/linux-rockchip/cover/20250205105157.=
580060-1-damon.ding@rock-chips.com/)

Is edp1 supported by yours [2] series?

If yes - may you pls hint me about required dts additions in =
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/arch=
/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts?h=3Dv6.14-rc2 ?

(for reference: rock5 itx bsp dts goes like this: =
https://github.com/radxa/kernel/blob/linux-6.1-stan-rkr1/arch/arm64/boot/d=
ts/rockchip/rk3588-rock-5-itx.dts)

in [2] i see dts adds for EVB1 - but i=E2=80=99m not sure will simple =
extrapolation of evb1 edp0 dts additions to edp1 in rock5 be enough=E2=80=A6=
.

thx in advance!

