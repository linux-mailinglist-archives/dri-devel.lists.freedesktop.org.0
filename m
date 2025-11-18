Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 779A9C69B49
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 14:50:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEF8210E057;
	Tue, 18 Nov 2025 13:50:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="YigVSk1P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BF6E10E057
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 13:50:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 88E314050A
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 13:50:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CC74C16AAE
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 13:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763473821;
 bh=rZN0IQenPgdJTxvH2ZMIbHtQc8Q8fpFwqgB1ZfTEqYk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=YigVSk1PucNXZQaqOmxEHcomc++750v1Ylo27FOmB9pTIpPkwH0Bk5DwmbRsx0+2t
 8GvUnt1m2TVDPUGhB8ZWOT8LhOKu4vf3igP2ZFZzqahSY8PBvz5Sqq57WvFylzBn1D
 eFQYpEXmJap5I5RFvFk0LkrrJC/av9ytQHB9lt3rZgQXydh5DZgXtX1xfwEb6Q0F3I
 PJIoc7G1O+F1jH7Ik0ymxY1/PlHRuZr58bdHpLG9A3DpSQgL07yLdjsuTUKxPJUyAk
 +SOh8IrpJp74ggyYz+4HSccnRBDkfc2nQf1iZitzp9/vZxWVvps0KXMioVKWuTcV4W
 EalTmxIvj8eMg==
Received: by mail-pf1-f178.google.com with SMTP id
 d2e1a72fcca58-7ba92341f83so1652863b3a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 05:50:21 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUyx6loa6zbg/yj6TloYIWI3bkznG+5WlygrHE/a7Gl0jwpSYT9D/Q/BoBLtVkjR+LyAbYHbz/jsiw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy4neUwdsA3r8w14quRF0Syih825eH43nc/U1QJyb2i5kTUxckA
 saa6QNW0oSd4ZrNFueOVG/O9FU4vRJs5Wr2v6ETCft+++9hNslaXojzvDlU5GhgwqgOh0CbEO5S
 p+7v9P0ZgvOiTiBM+TGmEsuTZbVm85A==
X-Google-Smtp-Source: AGHT+IE5Z2MpRyC9oab0WJaiNyBW3hN6XFa3Rzhz8UyPsuoc9Pa2UFnVnNAcowlT5BeYTRlFBG3gB1aTEHHdsdqc3w8=
X-Received: by 2002:a05:7022:3c0d:b0:11b:8278:9f3a with SMTP id
 a92af1059eb24-11b82789fd2mr4151535c88.8.1763473819071; Tue, 18 Nov 2025
 05:50:19 -0800 (PST)
MIME-Version: 1.0
References: <20250921055416.25588-1-jay.liu@mediatek.com>
 <20250921055416.25588-2-jay.liu@mediatek.com>
In-Reply-To: <20250921055416.25588-2-jay.liu@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 18 Nov 2025 13:50:05 +0000
X-Gmail-Original-Message-ID: <CAAOTY_8awo9B857BRdgNoh_350VHa8eTaxh0ALWbT287ZNstAw@mail.gmail.com>
X-Gm-Features: AWmQ_blmZtT5uXUtSPveVBwvv-qvjHpM1nxw_RCICsWDHLjgGSlWLYcocIHO-_w
Message-ID: <CAAOTY_8awo9B857BRdgNoh_350VHa8eTaxh0ALWbT287ZNstAw@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] drm/mediatek: fix CCORR mtk_ctm_s31_32_to_s1_n
 function issue
To: Jay Liu <jay.liu@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Yongqiang Niu <yongqiang.niu@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
 Hsin-Yi Wang <hsinyi@chromium.org>, dri-devel@lists.freedesktop.org, 
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

Hi, Jay:

Jay Liu <jay.liu@mediatek.com> =E6=96=BC 2025=E5=B9=B49=E6=9C=8821=E6=97=A5=
 =E9=80=B1=E6=97=A5 =E4=B8=8A=E5=8D=885:55=E5=AF=AB=E9=81=93=EF=BC=9A
>
> if matrixbit is 11,
> The range of color matrix is from 0 to (BIT(12) - 1).
> Values from 0 to (BIT(11) - 1) represent positive numbers,
> values from BIT(11) to (BIT(12) - 1) represent negative numbers.
> For example, -1 need converted to 8191.
> so convert S31.32 to HW Q2.11 format by drm_color_ctm_s31_32_to_qm_n,
> and set int_bits to 2.
>
> Fixes: 738ed4156fba ("drm/mediatek: Add matrix_bits private data for ccor=
r")
> Change-Id: Icb2aae1dee21d9ea34f263a54850fee26d97d455

With some fixed up, applied to mediatek-drm-next [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Signed-off-by: Jay Liu <jay.liu@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_disp_ccorr.c | 26 +++--------------------
>  1 file changed, 3 insertions(+), 23 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c b/drivers/gpu/drm/=
mediatek/mtk_disp_ccorr.c
> index 10d60d2c2a56..634b31346921 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
> @@ -80,28 +80,7 @@ void mtk_ccorr_stop(struct device *dev)
>         writel_relaxed(0x0, ccorr->regs + DISP_CCORR_EN);
>  }
>
> -/* Converts a DRM S31.32 value to the HW S1.n format. */
> -static u16 mtk_ctm_s31_32_to_s1_n(u64 in, u32 n)
> -{
> -       u16 r;
> -
> -       /* Sign bit. */
> -       r =3D in & BIT_ULL(63) ? BIT(n + 1) : 0;
> -
> -       if ((in & GENMASK_ULL(62, 33)) > 0) {
> -               /* identity value 0x100000000 -> 0x400(mt8183), */
> -               /* identity value 0x100000000 -> 0x800(mt8192), */
> -               /* if bigger this, set it to max 0x7ff. */
> -               r |=3D GENMASK(n, 0);
> -       } else {
> -               /* take the n+1 most important bits. */
> -               r |=3D (in >> (32 - n)) & GENMASK(n, 0);
> -       }
> -
> -       return r;
> -}
> -
> -void mtk_ccorr_ctm_set(struct device *dev, struct drm_crtc_state *state)
> +bool mtk_ccorr_ctm_set(struct device *dev, struct drm_crtc_state *state)
>  {
>         struct mtk_disp_ccorr *ccorr =3D dev_get_drvdata(dev);
>         struct drm_property_blob *blob =3D state->ctm;
> @@ -109,6 +88,7 @@ void mtk_ccorr_ctm_set(struct device *dev, struct drm_=
crtc_state *state)
>         const u64 *input;
>         uint16_t coeffs[9] =3D { 0 };
>         int i;
> +       int int_bits =3D 2;
>         struct cmdq_pkt *cmdq_pkt =3D NULL;
>         u32 matrix_bits =3D ccorr->data->matrix_bits;
>
> @@ -119,7 +99,7 @@ void mtk_ccorr_ctm_set(struct device *dev, struct drm_=
crtc_state *state)
>         input =3D ctm->matrix;
>
>         for (i =3D 0; i < ARRAY_SIZE(coeffs); i++)
> -               coeffs[i] =3D mtk_ctm_s31_32_to_s1_n(input[i], matrix_bit=
s);
> +               coeffs[i] =3D drm_color_ctm_s31_32_to_qm_n(input[i], int_=
bits, matrix_bits);
>
>         mtk_ddp_write(cmdq_pkt, coeffs[0] << 16 | coeffs[1],
>                       &ccorr->cmdq_reg, ccorr->regs, DISP_CCORR_COEF_0);
> --
> 2.46.0
>
