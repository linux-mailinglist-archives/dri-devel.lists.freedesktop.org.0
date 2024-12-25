Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D4FC9FC5DE
	for <lists+dri-devel@lfdr.de>; Wed, 25 Dec 2024 16:23:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1859410E1BD;
	Wed, 25 Dec 2024 15:23:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="oo2UjOR9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F56D10E1BD
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Dec 2024 15:23:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id C2227A40564
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Dec 2024 15:21:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F35ABC4CED7
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Dec 2024 15:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1735140184;
 bh=mhUhfD5xu9xUgTWuJ7EicNZyi3Rplf9WEPihxS1XkoQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=oo2UjOR9+b1rdymnlrbNg7g5QgmvsmNIx6lAaW8uC2UmBp6rXnydkipmhbKNqBdrI
 pJY5LQi2+uoKIASsqKqXyYDyob1ybAf0dYpub9RdQpTkN1GCtucPUKDXPV58R75WGe
 lztnWsqHf1+p468k+99n4AavsNMp1CETHbxuROem3keKvAOM3bcacIk6XrXtAA+B7V
 gMMzyxAwJ4VBEnKKj+SIMPk462orJ76PwHkl/SDSsH+Eqr5JJmVx8z6zjkoYS3ld5Z
 zpxHgG4wYLNkxLEMtALiQEXiBj+F5n/EVlxXbfvsb4tuYqTIg6x/z2YpRRcWqBWsna
 r7HA5/N9/4Sdw==
Received: by mail-pj1-f48.google.com with SMTP id
 98e67ed59e1d1-2efb17478adso6292624a91.1
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Dec 2024 07:23:03 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVGpC6Sf6XDYtq1N0aH9P8mfNM5eerhYc7tVJ+R22MxNHIWIWAi6EYBa3dXshgUcelR9GVq7OclJvI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzma2mNslmR4AS2g4JclYtriXtv4tuTwvpg9FkdPlWOtQCZbCNj
 vKWuEreXXqCrX1Y+Sh4EjiwmYDpsOMLdwhpldqhCD96eIRxK7TgIOlLSwzgjw/361lxYtfgXbLU
 GKyOzy8vR1LJ1bY7V9wrJEYWQcg==
X-Google-Smtp-Source: AGHT+IHCihUHcJ8qD4UtDOlUirJx2B7bhpCAamJSMHeC/NqpVjt2cMY/BxGA/o2GvMZiwrUAXoIblHFFblMMDR+/zeg=
X-Received: by 2002:a17:90a:e187:b0:2ee:8430:b847 with SMTP id
 98e67ed59e1d1-2f452dfcd26mr28628588a91.6.1735140183506; Wed, 25 Dec 2024
 07:23:03 -0800 (PST)
MIME-Version: 1.0
References: <c7fbd3c3e633c0b7dd6d1cd78ccbdded31e1ca0f.1734397800.git.daniel@makrotopia.org>
In-Reply-To: <c7fbd3c3e633c0b7dd6d1cd78ccbdded31e1ca0f.1734397800.git.daniel@makrotopia.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 25 Dec 2024 23:23:35 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9PcNYev_1cTc8Q63K-kTWAgNCMwLfcfZ0ah6_ZJGPKfQ@mail.gmail.com>
Message-ID: <CAAOTY_9PcNYev_1cTc8Q63K-kTWAgNCMwLfcfZ0ah6_ZJGPKfQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/mediatek: only touch DISP_REG_OVL_PITCH_MSB if
 AFBC is supported
To: Daniel Golle <daniel@makrotopia.org>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Justin Green <greenjustin@chromium.org>,
 Frank Wunderlich <frank-w@public-files.de>, 
 John Crispin <john@phrozen.org>, dri-devel@lists.freedesktop.org, 
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

Hi, Daniel:

Daniel Golle <daniel@makrotopia.org> =E6=96=BC 2024=E5=B9=B412=E6=9C=8817=
=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8A=E5=8D=889:18=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> Touching DISP_REG_OVL_PITCH_MSB leads to video overlay on MT2701, MT7623N
> and probably other older SoCs being broken.
>
> Move setting up AFBC layer configuration into a separate function only
> being called on hardware which actually supports AFBC which restores the
> behavior as it was before commit c410fa9b07c3 ("drm/mediatek: Add AFBC
> support to Mediatek DRM driver") on non-AFBC hardware.

Applied to mediatek-drm-fixes [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-fixes

Regards,
Chun-Kuang.

>
> Fixes: c410fa9b07c3 ("drm/mediatek: Add AFBC support to Mediatek DRM driv=
er")
> Cc: stable@vger.kernel.org
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
> v2: move AFBC layer config into a new function
>
>  drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 57 +++++++++++++------------
>  1 file changed, 29 insertions(+), 28 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/me=
diatek/mtk_disp_ovl.c
> index f731d4fbe8b6..e0e24f0a6edd 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> @@ -460,6 +460,29 @@ static unsigned int mtk_ovl_fmt_convert(struct mtk_d=
isp_ovl *ovl,
>         }
>  }
>
> +static void mtk_ovl_afbc_layer_config(struct mtk_disp_ovl *ovl,
> +                                     unsigned int idx,
> +                                     struct mtk_plane_pending_state *pen=
ding,
> +                                     struct cmdq_pkt *cmdq_pkt)
> +{
> +       unsigned int pitch_msb =3D pending->pitch >> 16;
> +       unsigned int hdr_pitch =3D pending->hdr_pitch;
> +       unsigned int hdr_addr =3D pending->hdr_addr;
> +
> +       if (pending->modifier !=3D DRM_FORMAT_MOD_LINEAR) {
> +               mtk_ddp_write_relaxed(cmdq_pkt, hdr_addr, &ovl->cmdq_reg,=
 ovl->regs,
> +                                     DISP_REG_OVL_HDR_ADDR(ovl, idx));
> +               mtk_ddp_write_relaxed(cmdq_pkt,
> +                                     OVL_PITCH_MSB_2ND_SUBBUF | pitch_ms=
b,
> +                                     &ovl->cmdq_reg, ovl->regs, DISP_REG=
_OVL_PITCH_MSB(idx));
> +               mtk_ddp_write_relaxed(cmdq_pkt, hdr_pitch, &ovl->cmdq_reg=
, ovl->regs,
> +                                     DISP_REG_OVL_HDR_PITCH(ovl, idx));
> +       } else {
> +               mtk_ddp_write_relaxed(cmdq_pkt, pitch_msb,
> +                                     &ovl->cmdq_reg, ovl->regs, DISP_REG=
_OVL_PITCH_MSB(idx));
> +       }
> +}
> +
>  void mtk_ovl_layer_config(struct device *dev, unsigned int idx,
>                           struct mtk_plane_state *state,
>                           struct cmdq_pkt *cmdq_pkt)
> @@ -467,25 +490,13 @@ void mtk_ovl_layer_config(struct device *dev, unsig=
ned int idx,
>         struct mtk_disp_ovl *ovl =3D dev_get_drvdata(dev);
>         struct mtk_plane_pending_state *pending =3D &state->pending;
>         unsigned int addr =3D pending->addr;
> -       unsigned int hdr_addr =3D pending->hdr_addr;
> -       unsigned int pitch =3D pending->pitch;
> -       unsigned int hdr_pitch =3D pending->hdr_pitch;
> +       unsigned int pitch_lsb =3D pending->pitch & GENMASK(15, 0);
>         unsigned int fmt =3D pending->format;
>         unsigned int offset =3D (pending->y << 16) | pending->x;
>         unsigned int src_size =3D (pending->height << 16) | pending->widt=
h;
>         unsigned int blend_mode =3D state->base.pixel_blend_mode;
>         unsigned int ignore_pixel_alpha =3D 0;
>         unsigned int con;
> -       bool is_afbc =3D pending->modifier !=3D DRM_FORMAT_MOD_LINEAR;
> -       union overlay_pitch {
> -               struct split_pitch {
> -                       u16 lsb;
> -                       u16 msb;
> -               } split_pitch;
> -               u32 pitch;
> -       } overlay_pitch;
> -
> -       overlay_pitch.pitch =3D pitch;
>
>         if (!pending->enable) {
>                 mtk_ovl_layer_off(dev, idx, cmdq_pkt);
> @@ -524,11 +535,12 @@ void mtk_ovl_layer_config(struct device *dev, unsig=
ned int idx,
>         }
>
>         if (ovl->data->supports_afbc)
> -               mtk_ovl_set_afbc(ovl, cmdq_pkt, idx, is_afbc);
> +               mtk_ovl_set_afbc(ovl, cmdq_pkt, idx,
> +                                pending->modifier !=3D DRM_FORMAT_MOD_LI=
NEAR);
>
>         mtk_ddp_write_relaxed(cmdq_pkt, con, &ovl->cmdq_reg, ovl->regs,
>                               DISP_REG_OVL_CON(idx));
> -       mtk_ddp_write_relaxed(cmdq_pkt, overlay_pitch.split_pitch.lsb | i=
gnore_pixel_alpha,
> +       mtk_ddp_write_relaxed(cmdq_pkt, pitch_lsb | ignore_pixel_alpha,
>                               &ovl->cmdq_reg, ovl->regs, DISP_REG_OVL_PIT=
CH(idx));
>         mtk_ddp_write_relaxed(cmdq_pkt, src_size, &ovl->cmdq_reg, ovl->re=
gs,
>                               DISP_REG_OVL_SRC_SIZE(idx));
> @@ -537,19 +549,8 @@ void mtk_ovl_layer_config(struct device *dev, unsign=
ed int idx,
>         mtk_ddp_write_relaxed(cmdq_pkt, addr, &ovl->cmdq_reg, ovl->regs,
>                               DISP_REG_OVL_ADDR(ovl, idx));
>
> -       if (is_afbc) {
> -               mtk_ddp_write_relaxed(cmdq_pkt, hdr_addr, &ovl->cmdq_reg,=
 ovl->regs,
> -                                     DISP_REG_OVL_HDR_ADDR(ovl, idx));
> -               mtk_ddp_write_relaxed(cmdq_pkt,
> -                                     OVL_PITCH_MSB_2ND_SUBBUF | overlay_=
pitch.split_pitch.msb,
> -                                     &ovl->cmdq_reg, ovl->regs, DISP_REG=
_OVL_PITCH_MSB(idx));
> -               mtk_ddp_write_relaxed(cmdq_pkt, hdr_pitch, &ovl->cmdq_reg=
, ovl->regs,
> -                                     DISP_REG_OVL_HDR_PITCH(ovl, idx));
> -       } else {
> -               mtk_ddp_write_relaxed(cmdq_pkt,
> -                                     overlay_pitch.split_pitch.msb,
> -                                     &ovl->cmdq_reg, ovl->regs, DISP_REG=
_OVL_PITCH_MSB(idx));
> -       }
> +       if (ovl->data->supports_afbc)
> +               mtk_ovl_afbc_layer_config(ovl, idx, pending, cmdq_pkt);
>
>         mtk_ovl_set_bit_depth(dev, idx, fmt, cmdq_pkt);
>         mtk_ovl_layer_on(dev, idx, cmdq_pkt);
> --
> 2.47.1
