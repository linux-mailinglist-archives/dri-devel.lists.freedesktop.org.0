Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C36E9FC5E3
	for <lists+dri-devel@lfdr.de>; Wed, 25 Dec 2024 16:33:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E1CE10E2C4;
	Wed, 25 Dec 2024 15:33:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ZNkYjVBa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BB3310E2C4
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Dec 2024 15:33:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 7BFA5A406C1
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Dec 2024 15:31:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACA11C4CEE3
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Dec 2024 15:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1735140824;
 bh=DEXHDPtwZYHuJkECKOVcbJ+WOxuKvQWBJq6RZjtHArY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ZNkYjVBahTcR/Ots3eNyWI+0z6xXcF3IyQSIc6EKOHLVULoClbnQO6b+q34GHZphf
 ok59spwujDQhxXO/msb40QprJiJf5hbNpN2sxWG2VI4inh1NjSa6dZX7twNnWX/LUo
 B7s5eYu7uRe3KeMVhGOyrTfX/YUxy8Vg0rLBXdSx740T5sJorm3abTXt520Mwh1oX0
 h6QF0NbOld75c1qe92HpdkzT50ES/XO4PEfBIyi/oiiZQd+Zacz/H/iPT1gJb1tzdG
 cH2MLRhQMiYKqQyv072jW7XnGxWNkRL7mglg6a7wu13u5b2AdikxijsQPL7T3T++pm
 rnOpyM60Fcnkw==
Received: by mail-pj1-f49.google.com with SMTP id
 98e67ed59e1d1-2ef87d24c2dso5509638a91.1
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Dec 2024 07:33:44 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUq2jAhk4wvbauOX/q5eGBEu5Q5+GxC/d5GH4zdwNhJeokgij/sEpTcrJVUxE8j8VJ6AwqLvmVQPec=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwJOfn49kcWT7i/BhjAwe1ApBv6Eo9v+hcaCpa8d6LlljpPmSsA
 BDk/ElmW7SSHIzhb6fSelneek4HgnXX6hhSN5SK0NaSRajIYVDAB3JNmu7pcul8lmBZEQi2EMRJ
 bR4VN+eH9pwUouFlnMnqC32/aBQ==
X-Google-Smtp-Source: AGHT+IFoWBbZz3onm4QqacyQR1qPHQxceMqC+47Tx4zhMS3hI6YrNtpJxB80R0rLXs8DfHCpZeRdsx34+8s2PsQp/PM=
X-Received: by 2002:a17:90b:2e4b:b0:2ea:a9ac:eee1 with SMTP id
 98e67ed59e1d1-2f452e1e268mr30653100a91.10.1735140824167; Wed, 25 Dec 2024
 07:33:44 -0800 (PST)
MIME-Version: 1.0
References: <20241218085837.2670434-1-arnd@kernel.org>
In-Reply-To: <20241218085837.2670434-1-arnd@kernel.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 25 Dec 2024 23:34:15 +0800
X-Gmail-Original-Message-ID: <CAAOTY_89yotLq5BuU+EhEQJ9GBv_+jKMZ-kcTw2HxLGNPYWq+A@mail.gmail.com>
Message-ID: <CAAOTY_89yotLq5BuU+EhEQJ9GBv_+jKMZ-kcTw2HxLGNPYWq+A@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: stop selecting foreign drivers
To: Arnd Bergmann <arnd@kernel.org>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 CK Hu <ck.hu@mediatek.com>, 
 Arnd Bergmann <arnd@arndb.de>, Maxime Ripard <mripard@kernel.org>,
 Jani Nikula <jani.nikula@intel.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Chen-Yu Tsai <wenst@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, 
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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

Hi, Arnd:

Arnd Bergmann <arnd@kernel.org> =E6=96=BC 2024=E5=B9=B412=E6=9C=8818=E6=97=
=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=884:58=E5=AF=AB=E9=81=93=EF=BC=9A
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> The PHY portion of the mediatek hdmi driver was originally part of
> the driver it self and later split out into drivers/phy, which a
> 'select' to keep the prior behavior.
>
> However, this leads to build failures when the PHY driver cannot
> be built:
>
> WARNING: unmet direct dependencies detected for PHY_MTK_HDMI
>   Depends on [n]: (ARCH_MEDIATEK || COMPILE_TEST [=3Dy]) && COMMON_CLK [=
=3Dy] && OF [=3Dy] && REGULATOR [=3Dn]
>   Selected by [m]:
>   - DRM_MEDIATEK_HDMI [=3Dm] && HAS_IOMEM [=3Dy] && DRM [=3Dm] && DRM_MED=
IATEK [=3Dm]
> ERROR: modpost: "devm_regulator_register" [drivers/phy/mediatek/phy-mtk-h=
dmi-drv.ko] undefined!
> ERROR: modpost: "rdev_get_drvdata" [drivers/phy/mediatek/phy-mtk-hdmi-drv=
.ko] undefined!
>
> The best option here is to just not select the phy driver and leave that
> up to the defconfig. Do the same for the other PHY and memory drivers
> selected here as well for consistency.

Applied to mediatek-drm-fixes [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-fixes

Regards,
Chun-Kuang.

>
> Fixes: a481bf2f0ca4 ("drm/mediatek: Separate mtk_hdmi_phy to an independe=
nt module")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/gpu/drm/mediatek/Kconfig | 5 -----
>  1 file changed, 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/Kconfig b/drivers/gpu/drm/mediatek/=
Kconfig
> index 1c2f56b75716..1d4f20a4f265 100644
> --- a/drivers/gpu/drm/mediatek/Kconfig
> +++ b/drivers/gpu/drm/mediatek/Kconfig
> @@ -15,9 +15,6 @@ config DRM_MEDIATEK
>         select DRM_BRIDGE_CONNECTOR
>         select DRM_MIPI_DSI
>         select DRM_PANEL
> -       select MEMORY
> -       select MTK_SMI
> -       select PHY_MTK_MIPI_DSI
>         select VIDEOMODE_HELPERS
>         help
>           Choose this option if you have a Mediatek SoCs.
> @@ -28,7 +25,6 @@ config DRM_MEDIATEK
>  config DRM_MEDIATEK_DP
>         tristate "DRM DPTX Support for MediaTek SoCs"
>         depends on DRM_MEDIATEK
> -       select PHY_MTK_DP
>         select DRM_DISPLAY_HELPER
>         select DRM_DISPLAY_DP_HELPER
>         select DRM_DISPLAY_DP_AUX_BUS
> @@ -39,6 +35,5 @@ config DRM_MEDIATEK_HDMI
>         tristate "DRM HDMI Support for Mediatek SoCs"
>         depends on DRM_MEDIATEK
>         select SND_SOC_HDMI_CODEC if SND_SOC
> -       select PHY_MTK_HDMI
>         help
>           DRM/KMS HDMI driver for Mediatek SoCs
> --
> 2.39.5
>
