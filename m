Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C427A91A93E
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2024 16:31:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B62B210EAC6;
	Thu, 27 Jun 2024 14:31:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="gf8T+SCH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A59FF10EAC5
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2024 14:31:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id EAC3461ECA
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2024 14:31:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43852C4AF0B
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2024 14:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1719498709;
 bh=je/gF3c5IjwDHUi3yQuh6iBacgL+GUzWMlTEUFbmCos=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=gf8T+SCHxjuVdwuzAwoq818CHZlsMx63I1NkNIeSMFrAhnI3pdbg0n5v8L4bobAit
 RecOip5hCy0mZgOo8ukiqQRERRQKu2SELiU2GlD4IQevFvu9rutFwqtcWvPYCSQQtq
 ARuCV4hCsDcYx+4oCBs7kPE9mVnPtqz8lSWEqgh7Hp1j4Ef9AhxDcgOarImhlNGXGV
 IuRO4hwoL4dhppvRgA5I3b++obw9IejkqvkG0cgpK5l7uXP+5+20yu3sFaN3+QJrQ/
 HyMAHxx8FXa0yQOkr2EOyYBmZIzEXqjG99z94tcSy2iHM0xz0t+iPniaSEWOGnO3XW
 isAZl/n9J0jcA==
Received: by mail-pf1-f171.google.com with SMTP id
 d2e1a72fcca58-706627ff48dso4369769b3a.1
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2024 07:31:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCV0ShGguTaRywrnrdvpdgKITeIpDXfAVykTEfJkNfjIAvXdPXji7U1z7CXGk9+B55fdeSrR0zq2o+PXkJ/O2Ow4eKDoSRan6g3RHPYEa7V1
X-Gm-Message-State: AOJu0YxqdJ2eL6UneNECO580dB6vEiQ2LoAkUB5kmnEIFriNZ6YOnCLI
 yIGFuwTlg6aN5iFW8nchfjhVkHcUjpKXesau5bQtRE9x7Kk1rsAYBvNDdD6Qj3DllxEvQOVR6eZ
 j5HhrAN/+rUu1By7UVOaaI/5tqg==
X-Google-Smtp-Source: AGHT+IG1LSbB2re1qaPNE2onF1geh2vffld0C/9Blwt0TFmZDtnZln8OhUpXrzl1P1UTbercZENutaEyhnCFpRLApUc=
X-Received: by 2002:a05:6a20:b20:b0:1be:c33e:1357 with SMTP id
 adf61e73a8af0-1bec33e1573mr3624391637.34.1719498708836; Thu, 27 Jun 2024
 07:31:48 -0700 (PDT)
MIME-Version: 1.0
References: <20231023-display-support-v4-0-ed82eb168fb1@baylibre.com>
 <20231023-display-support-v4-11-ed82eb168fb1@baylibre.com>
In-Reply-To: <20231023-display-support-v4-11-ed82eb168fb1@baylibre.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 27 Jun 2024 22:31:55 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-8XzHg_pYkj_u3q_Jgzg29wiJbz5qMkySVRxL=5P69qQ@mail.gmail.com>
Message-ID: <CAAOTY_-8XzHg_pYkj_u3q_Jgzg29wiJbz5qMkySVRxL=5P69qQ@mail.gmail.com>
Subject: Re: [PATCH v4 11/15] drm/mediatek: dsi: Improves the DSI lane setup
 robustness
To: Alexandre Mergnat <amergnat@baylibre.com>,
 Shuijing Li <shuijing.li@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jitao Shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
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

Hi, Shuijing:

Please help to review this patch.

Regards,
Chun-Kuang.

Alexandre Mergnat <amergnat@baylibre.com> =E6=96=BC 2024=E5=B9=B45=E6=9C=88=
23=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=888:49=E5=AF=AB=E9=81=93=EF=
=BC=9A
>
> Currently, mtk_dsi_lane_ready (which setup the DSI lane) is triggered
> before mtk_dsi_poweron. lanes_ready flag toggle to true during
> mtk_dsi_lane_ready function, and the DSI module is set up during
> mtk_dsi_poweron.
>
> Later, during panel driver init, mtk_dsi_lane_ready is triggered but does
> nothing because lanes are considered ready. Unfortunately, when the panel
> driver try to communicate, the DSI returns a timeout.
>
> The solution found here is to put lanes_ready flag to false after the DSI
> module setup into mtk_dsi_poweron to init the DSI lanes after the power /
> setup of the DSI module.
>
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dsi.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediate=
k/mtk_dsi.c
> index e036d9394c23..cb546a9e9419 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -643,6 +643,8 @@ static int mtk_dsi_poweron(struct mtk_dsi *dsi)
>         mtk_dsi_config_vdo_timing(dsi);
>         mtk_dsi_set_interrupt_enable(dsi);
>
> +       dsi->lanes_ready =3D false;
> +
>         return 0;
>  err_disable_engine_clk:
>         clk_disable_unprepare(dsi->engine_clk);
>
> --
> 2.25.1
>
