Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D97C918174
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2024 14:55:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A42C10E89B;
	Wed, 26 Jun 2024 12:55:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ioztycnt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08D0810E894
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 12:55:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D181A6186A
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 12:55:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79F56C2BD10
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 12:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1719406534;
 bh=1tyIBZMR+ekYrAbTqKqsmrO9O2uYe8kEwjYxT1NNdOA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ioztycntPJNuQlSpXkgh+4hZqZ4nZFQJZHhjyKJhi0M2GGBR4fYhP1uv9LIqnJPOr
 QJDs+IUIwx8PWU53l26xnUX/wXDfuzIbnM0Szp5snDM3Ge31FgNup8BNld8N3RZG+T
 mq7o7WJ9eDANXHNBP71ye/aSkSBbCdvIxSEJHV0zmrEzFlzW1AgXqPvSmfnYiqdLpj
 vOvVndtGLdnYKTI3TuR1gHGhu2jcrdNSjmiPE8yXGFPYJwmZFyUGdwZeXzshHdFgnM
 wTG4EL1EcuGrhTVSHDZtN4R2kzvMBOzjeyPAXVQ36tUk7QkA8Q4sHNlNa/KCX+9+X+
 xH1mn5HS+4KBg==
Received: by mail-pj1-f43.google.com with SMTP id
 98e67ed59e1d1-2c7dff0f4e4so5268486a91.2
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 05:55:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWbZFQ8WJnGvrgfsPW8uRfQFgsHsYrE508xBayxA90eJSV6X8VTITv9/u3xoRI8nPaJHeLotBRqJ0yp+iaUbxesTVL/KoWbjG1IRxJoWdxp
X-Gm-Message-State: AOJu0Yy3dEKY4wGDk/dfTII58KHz3TkblBroUAWw4YpgZ6XUyiWSAIV2
 2VXeyZFjz+6+zC7L84iahJI4ITzxq4SEJWhDEUwFlvzwJomTbAhuf7cRsu7YDu60Tlid+iYNCRh
 +Fx4k1JgsHwZJ+vzuf+cwE5TRTw==
X-Google-Smtp-Source: AGHT+IGSRPxyvkKWw3XafvaCtJE8WDZSvpaH/yu3LA/G7Okq6X21Tx5BdLXWvFCNIIUmiLCnuVaO3D2wi3d0datudBg=
X-Received: by 2002:a17:90a:e2d5:b0:2c3:2da1:c8bc with SMTP id
 98e67ed59e1d1-2c8612a9b2amr8585314a91.15.1719406534020; Wed, 26 Jun 2024
 05:55:34 -0700 (PDT)
MIME-Version: 1.0
References: <20240624095726.18818-1-jason-jh.lin@mediatek.com>
In-Reply-To: <20240624095726.18818-1-jason-jh.lin@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 26 Jun 2024 20:55:40 +0800
X-Gmail-Original-Message-ID: <CAAOTY__POyCa=wgh30mdcMiF23Xnwba7wjdt-Zj1CfrTiwh=WA@mail.gmail.com>
Message-ID: <CAAOTY__POyCa=wgh30mdcMiF23Xnwba7wjdt-Zj1CfrTiwh=WA@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: Fix bit depth overwritten for mtk_ovl_set
 bit_depth()
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Jason-ch Chen <jason-ch.chen@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>
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

Hi, Jason:

Jason-JH.Lin <jason-jh.lin@mediatek.com> =E6=96=BC 2024=E5=B9=B46=E6=9C=882=
4=E6=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=885:57=E5=AF=AB=E9=81=93=EF=
=BC=9A
>
> Refine the value and mask define of bit depth for mtk_ovl_set bit_depth()=
.
> Use cmdq_pkt_write_mask() instead of cmdq_pkt_write() to avoid bit depth
> settings being overwritten.

Applied to mediatek-drm-next [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

>
> Fixes: fb36c5020c9c ("drm/mediatek: Add support for AR30 and BA30 overlay=
s")
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> ---
> Based on: https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/li=
nux.git/log/?h=3Dmediatek-drm-next
> ---
>  drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 21 ++++++++-------------
>  1 file changed, 8 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/me=
diatek/mtk_disp_ovl.c
> index 4b370bc0746d..d35f5b4b22c2 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> @@ -42,7 +42,11 @@
>  #define DISP_REG_OVL_RDMA_CTRL(n)              (0x00c0 + 0x20 * (n))
>  #define DISP_REG_OVL_RDMA_GMC(n)               (0x00c8 + 0x20 * (n))
>  #define DISP_REG_OVL_ADDR_MT2701               0x0040
> -#define DISP_REG_OVL_CLRFMT_EXT                        0x02D0
> +#define DISP_REG_OVL_CLRFMT_EXT                        0x02d0
> +#define OVL_CON_CLRFMT_BIT_DEPTH_MASK(n)               (GENMASK(1, 0) <<=
 (4 * (n)))
> +#define OVL_CON_CLRFMT_BIT_DEPTH(depth, n)             ((depth) << (4 * =
(n)))
> +#define OVL_CON_CLRFMT_8_BIT                           (0)
> +#define OVL_CON_CLRFMT_10_BIT                          (1)
>  #define DISP_REG_OVL_ADDR_MT8173               0x0f40
>  #define DISP_REG_OVL_ADDR(ovl, n)              ((ovl)->data->addr + 0x20=
 * (n))
>  #define DISP_REG_OVL_HDR_ADDR(ovl, n)          ((ovl)->data->addr + 0x20=
 * (n) + 0x04)
> @@ -65,10 +69,6 @@
>                                         0 : OVL_CON_CLRFMT_RGB)
>  #define OVL_CON_CLRFMT_RGB888(ovl)     ((ovl)->data->fmt_rgb565_is_0 ? \
>                                         OVL_CON_CLRFMT_RGB : 0)
> -#define OVL_CON_CLRFMT_BIT_DEPTH_MASK(ovl)     (0xFF << 4 * (ovl))
> -#define OVL_CON_CLRFMT_BIT_DEPTH(depth, ovl)   (depth << 4 * (ovl))
> -#define OVL_CON_CLRFMT_8_BIT                   0x00
> -#define OVL_CON_CLRFMT_10_BIT                  0x01
>  #define        OVL_CON_AEN             BIT(8)
>  #define        OVL_CON_ALPHA           0xff
>  #define        OVL_CON_VIRT_FLIP       BIT(9)
> @@ -273,22 +273,17 @@ static void mtk_ovl_set_bit_depth(struct device *de=
v, int idx, u32 format,
>                                   struct cmdq_pkt *cmdq_pkt)
>  {
>         struct mtk_disp_ovl *ovl =3D dev_get_drvdata(dev);
> -       unsigned int reg;
>         unsigned int bit_depth =3D OVL_CON_CLRFMT_8_BIT;
>
>         if (!ovl->data->supports_clrfmt_ext)
>                 return;
>
> -       reg =3D readl(ovl->regs + DISP_REG_OVL_CLRFMT_EXT);
> -       reg &=3D ~OVL_CON_CLRFMT_BIT_DEPTH_MASK(idx);
> -
>         if (is_10bit_rgb(format))
>                 bit_depth =3D OVL_CON_CLRFMT_10_BIT;
>
> -       reg |=3D OVL_CON_CLRFMT_BIT_DEPTH(bit_depth, idx);
> -
> -       mtk_ddp_write(cmdq_pkt, reg, &ovl->cmdq_reg,
> -                     ovl->regs, DISP_REG_OVL_CLRFMT_EXT);
> +       mtk_ddp_write_mask(cmdq_pkt, OVL_CON_CLRFMT_BIT_DEPTH(bit_depth, =
idx),
> +                          &ovl->cmdq_reg, ovl->regs, DISP_REG_OVL_CLRFMT=
_EXT,
> +                          OVL_CON_CLRFMT_BIT_DEPTH_MASK(idx));
>  }
>
>  void mtk_ovl_config(struct device *dev, unsigned int w,
> --
> 2.18.0
>
