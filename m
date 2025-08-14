Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFEB0B268B2
	for <lists+dri-devel@lfdr.de>; Thu, 14 Aug 2025 16:11:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18C9E10E2D3;
	Thu, 14 Aug 2025 14:11:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="FQP9lgRb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B86210E2D3
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 14:11:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 02F0645B3A
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 14:11:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3740C4CEEF
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 14:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755180680;
 bh=EtreIo4RmDvEX0MIutMMZJFN4Qc14MzIRQ/PqGEOA/E=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=FQP9lgRbJpaU/omrvPEuTR4GtID0tGpr5hPgbP/9Ucp7gJA9Aro/wW2YHWZqgu5Vc
 wsD+2GRbUwtIAN6PV8J4qDdcfgLyvLZnhsN66UKNdehPNe6wGBr9AlHFwIrxkHhndR
 BnXc28vFwXJR9AfpRnv++NudL556N7g7Wx66/Ro026kXM+fwGwifhAtDo/j+Vl64m2
 emnVjOKqdGlQP8/EXg6auJrR1duahyqT1PJXKhGqrli1naUed1nTQ3uYz+7ztaFhPN
 gk4F5kb5Vx8w/UlHP8joFWuRO7W3rSebNLZYmCda1MGSLvjsEw28Ic5UpFUu/iYcQl
 XVNYH6CmaNOhw==
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-2445826fd9dso10358655ad.3
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 07:11:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXwg4FcsxEAEGmN7nUAHeRLkePurR4GXb1X9kbA1S7fcR1tvHbttzc9T39c6RZc+APfJoNp1rrWMn0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy/MdYV+UR9RaFpfaXpgS02+Oub7RRY3txqche0o8+IySYdWl3L
 tteNgWeqyXcwgSd6/tUzwsOm4oIzB3pKoon0tpoou/DVo414mz18o+xaBgbmMJGEvJXOLoWJvsv
 o1uZlFJcFqYYIZObVmYI0aJXyLjmYrg==
X-Google-Smtp-Source: AGHT+IEv9bl0mTCA5QeP2B9Sxyl/+418cvcY/Da5c3dtb2moz6zUZWAO3T1U7DLbuoeYmCLdV4cIQSoAiWVpGPO+VXs=
X-Received: by 2002:a17:902:d2c1:b0:240:a430:91d with SMTP id
 d9443c01a7336-244584ed485mr48360715ad.10.1755180680384; Thu, 14 Aug 2025
 07:11:20 -0700 (PDT)
MIME-Version: 1.0
References: <20250701-mediatek-drm-fix-dsi-panel-init-v1-1-7af4adb9fdeb@collabora.com>
In-Reply-To: <20250701-mediatek-drm-fix-dsi-panel-init-v1-1-7af4adb9fdeb@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 14 Aug 2025 22:12:28 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9u2R3k5BORM2pwJnE9XOVfFBE_5gDfs8-PD9fBgTtmgQ@mail.gmail.com>
X-Gm-Features: Ac12FXz7hoERrgUkkr3SijSA29p_W0qoePN2uF4iKzdoy_Nb5WblBq2K-Bi3CRU
Message-ID: <CAAOTY_9u2R3k5BORM2pwJnE9XOVfFBE_5gDfs8-PD9fBgTtmgQ@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: dsi: Fix DSI host and panel bridge
 pre-enable order
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Aradhya Bhatia <a-bhatia1@ti.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Dmitry Baryshkov <lumag@kernel.org>, 
 Maxime Ripard <mripard@kernel.org>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
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

Hi, Louis:

Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com> =E6=96=BC 2025=E5=B9=
=B47=E6=9C=881=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=883:31=E5=AF=AB=
=E9=81=93=EF=BC=9A
>
> Since commit c9b1150a68d9 ("drm/atomic-helper: Re-order bridge chain
> pre-enable and post-disable"), the bridge pre_enable callbacks are now
> called before crtc enable, and the bridge post_disable callbacks after
> the crtc disable.
> In the mediatek-drm driver, this change leads to transfer errors on
> mtk_dsi_host_transfer callback processing during the panel bridge
> pre-enable sequence because the DSI host bridge pre_enable and CRTC
> enable sequences, that are enabling the required clocks and PHY using
> mtk_dsi_poweron function, are called after.
>
> So, in order to fix this call order issue, request the DSI host bridge
> be pre-enabled before panel bridge by setting pre_enable_prev_first
> flag on DSI device bridge in the mtk_dsi_host_attach function.

Applied to mediatek-drm-fixes [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-fixes

Regards,
Chun-Kuang.

>
> Fixes: c9b1150a68d9 ("drm/atomic-helper: Re-order bridge chain pre-enable=
 and post-disable")
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
> ---
> This patch fixes an issue that can be observed on boards such as
> MediatekGenio 1200-EVK or 350-EVK with a kernel based on linux-next
> (tag: next-20250635) since commit c9b1150a68d9 ("drm/atomic-helper:
> Re-order bridge chain pre-enable and post-disable").
> In boot logs, there are multiples errors such as IRQ timeouts and
> panel init errors, leading the DSI panel not being enabled:
>
> Example on Genio 1200-EVK:
> ```
> [drm] Wait DSI IRQ(0x00000002) Timeout
> panel-himax-hx8279 1c008000.dsi.0: sending generic data b0 05 failed:
>   -62
> [drm] Wait DSI IRQ(0x00000008) Timeout
> [drm:mtk_dsi_host_transfer [mediatek_drm]] *ERROR* failed to switch cmd
>  mode
> panel-himax-hx8279 1c008000.dsi.0: sending DCS SET_DISPLAY_ON failed:
>   -62
> ```
> ---
>  drivers/gpu/drm/mediatek/mtk_dsi.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediate=
k/mtk_dsi.c
> index d7726091819c4762698b41060b3d4d8d27940238..0e2bcd5f67b767d92f2697a5b=
8183f67ee178a38 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -1002,6 +1002,12 @@ static int mtk_dsi_host_attach(struct mipi_dsi_hos=
t *host,
>                         return PTR_ERR(dsi->next_bridge);
>         }
>
> +       /*
> +        * set flag to request the DSI host bridge be pre-enabled before =
device bridge
> +        * in the chain, so the DSI host is ready when the device bridge =
is pre-enabled
> +        */
> +       dsi->next_bridge->pre_enable_prev_first =3D true;
> +
>         drm_bridge_add(&dsi->bridge);
>
>         ret =3D component_add(host->dev, &mtk_dsi_component_ops);
>
> ---
> base-commit: c6a68d8f7b81a6ce8962885408cc2d0c1f8b9470
> change-id: 20250630-mediatek-drm-fix-dsi-panel-init-1a4b534c40a6
>
> Best regards,
> --
> Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
>
