Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 61C4E725AFE
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 11:46:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33C1A10E4A6;
	Wed,  7 Jun 2023 09:46:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 815DA10E4A6
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jun 2023 09:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1686131189;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K+JVWsvrdVX8wdErkW3HdLVdcuF44A70+ru4mrWO8kU=;
 b=heHvTkQ2KhJyt4+ejweblXOzLZXnk+mexY7Dfs84uv562HefMMHKPG6IOtRHBw5gbhRLvv
 kb6WNNnm+1RerASbK0OV+AHVOW6j+mQQKxKUP8iDYiwwckKZvnQAP7OKhJFKAM6W1/waxk
 vgLBm5v8I/lPsoUsg+kiNlgYsK3JFXM=
Message-ID: <845a483ed09728c712ad57b1fe9bc5c930a72d98.camel@crapouillou.net>
Subject: Re: [PATCH] drm/ingenic: Kconfig: select REGMAP and REGMAP_MMIO
From: Paul Cercueil <paul@crapouillou.net>
To: Sui Jingfeng <suijingfeng@loongson.cn>, David Airlie
 <airlied@gmail.com>,  Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 07 Jun 2023 11:46:27 +0200
In-Reply-To: <20230607072253.440613-1-suijingfeng@loongson.cn>
References: <20230607072253.440613-1-suijingfeng@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: linux-mips@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sui,

Le mercredi 07 juin 2023 =C3=A0 15:22 +0800, Sui Jingfeng a =C3=A9crit=C2=
=A0:
> Otherwise its failed to pass basic compile test on platform without
> REGMAP_MMIO selected by defconfig
>=20
> make -j$(nproc) ARCH=3Dmips CROSS_COMPILE=3Dmips64el-linux-gnuabi64-
>=20
> =C2=A0 SYNC=C2=A0=C2=A0=C2=A0 include/config/auto.conf.cmd
> =C2=A0 Checking missing-syscalls for N32
> =C2=A0 CALL=C2=A0=C2=A0=C2=A0 scripts/checksyscalls.sh
> =C2=A0 Checking missing-syscalls for O32
> =C2=A0 CALL=C2=A0=C2=A0=C2=A0 scripts/checksyscalls.sh
> =C2=A0 CALL=C2=A0=C2=A0=C2=A0 scripts/checksyscalls.sh
> =C2=A0 MODPOST Module.symvers
> ERROR: modpost: "__devm_regmap_init_mmio_clk"
> [drivers/gpu/drm/ingenic/ingenic-drm.ko] undefined!
> make[1]: *** [scripts/Makefile.modpost:136: Module.symvers] Error 1
> make: *** [Makefile:1978: modpost] Error 2
>=20
> Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
> ---
> =C2=A0drivers/gpu/drm/ingenic/Kconfig | 2 ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/ingenic/Kconfig
> b/drivers/gpu/drm/ingenic/Kconfig
> index a53f475d33df..7457c0b65034 100644
> --- a/drivers/gpu/drm/ingenic/Kconfig
> +++ b/drivers/gpu/drm/ingenic/Kconfig
> @@ -5,6 +5,8 @@ config DRM_INGENIC
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0depends on CMA
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0depends on OF
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0depends on COMMON_CLK
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0select REGMAP
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0select REGMAP_MMIO

nit: order alphabetically (move them after the DRM_* ones).

Cheers,
-Paul

> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0select DRM_BRIDGE
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0select DRM_PANEL_BRIDGE
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0select DRM_KMS_HELPER

