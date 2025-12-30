Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB91CEA1D6
	for <lists+dri-devel@lfdr.de>; Tue, 30 Dec 2025 16:57:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 995A310E522;
	Tue, 30 Dec 2025 15:57:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="T0Vq5wXk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 199B010E522
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 15:57:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id D4CEF4448E
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 15:57:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB1ADC2BCAF
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 15:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767110260;
 bh=zh6mBgSOrt9tzEGqC0za+HqZ/ttkBYTg50tlq2YNmSA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=T0Vq5wXkGPdGuSO2YfwZMSOEwMv+qedU3ywXJgMIMsOopw6ZUiqB9Eug7tHBhvAVM
 gnoPwy0Go8jzVHUBmB1u6lwUJtZKkK+mORpDiK7Z6t02cs7ZQ+5iWYGD32C0umlrJb
 qlPc/3oLX77CkcHhIB+fcGGnkY0objYA7KydvhTbvFey6JzISvnGneNbpnJe3BxImh
 h25pDFCfv8b30yDY0WichIWn4T6MWj9y8lGfMnrd9ZmZ4ud5eOZG3jUIeA7VRfWPXL
 I/xlntV7sh7eBMw3iIa3+HCS9dfSrJdlHFNujOrO5KLT0EQRsOvY6IdwrYZW1ZGhVe
 MofI+G8hs8kOQ==
Received: by mail-pf1-f175.google.com with SMTP id
 d2e1a72fcca58-7baf61be569so10464239b3a.3
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 07:57:40 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUw8CRe/ZPBjbTcjGEts9FRnlPputhwIrUeMniIjtr1cFHc3r7YJ2Zf7ajaBSuRr2IR9NYNSSi/Qs4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywl329dLlqRxZ+u8LmNTj+jwoo34xjImmMYgpGhRuI0o+oUYRXu
 e37gdPP0tCFC+X8Dw5Ib2mJ5w2k7bvLm19IA6PeZb/XEvdhU46jflqEwRcpzxTW2jQjC71cAdPl
 13mmzewELXBiw7iC5HKucJ3MHcCNLeQ==
X-Google-Smtp-Source: AGHT+IGoOHPt7cDLeWjkImsE/YX0CuwqHg64AhqpqyyOP3mNUQdT/3C8tuv+frASMbSBZnov+wrWqGW7SZUPvqCnXCU=
X-Received: by 2002:a05:7023:a8a:b0:11b:9386:a3be with SMTP id
 a92af1059eb24-121722e9eb4mr36996810c88.41.1767110260180; Tue, 30 Dec 2025
 07:57:40 -0800 (PST)
MIME-Version: 1.0
References: <20251205-mtk-hdmi-ddc-v2-fixes-v1-0-260dd0d320f4@collabora.com>
 <20251205-mtk-hdmi-ddc-v2-fixes-v1-1-260dd0d320f4@collabora.com>
In-Reply-To: <20251205-mtk-hdmi-ddc-v2-fixes-v1-1-260dd0d320f4@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 30 Dec 2025 15:57:28 +0000
X-Gmail-Original-Message-ID: <CAAOTY_-vwFnSOS8gqVvyxJm_0vC8BPUkAhbnkenOxRgt=DBhjQ@mail.gmail.com>
X-Gm-Features: AQt7F2o_y1wIjXQ-QvVw0G4W9d6Zeoklqz0e5t81TSkz1ztRqUD1HZt7mqVQoZI
Message-ID: <CAAOTY_-vwFnSOS8gqVvyxJm_0vC8BPUkAhbnkenOxRgt=DBhjQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/mediatek: mtk_hdmi_ddc_v2: Add transfer abort on
 timeout cases
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 CK Hu <ck.hu@mediatek.com>, 
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
=B412=E6=9C=885=E6=97=A5=E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=882:22=E5=AF=AB=
=E9=81=93=EF=BC=9A
>
> During a read or write transfer, the mtk_hdmi_ddc_v2 driver polls the
> DDC_I2C_IN_PROG bit of HPD_DDC_STATUS register to check if the transfer
> completes but do no particular action if a timeout is reached. It could
> lead the next transfer attempts to fail because the faulty transfer was
> not aborted. So, add in both low level read and write functions a abort
> action by writing the DDC_CTRL register with the ABORT_XFER command
> value.

Applied to mediatek-drm-fixes [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-fixes

Regards,
Chun-Kuang.

>
> Fixes: 8d0f79886273 ("drm/mediatek: Introduce HDMI/DDC v2 for MT8195/MT81=
88")
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c b/drivers/gpu/drm=
/mediatek/mtk_hdmi_ddc_v2.c
> index b844e2c10f28060baef64bd36c5464758b08e162..6ae7cbba8cb6dacf46c2f7ab7=
4a2d7446d698b69 100644
> --- a/drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c
> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c
> @@ -96,6 +96,11 @@ static int mtk_ddc_wr_one(struct mtk_hdmi_ddc *ddc, u1=
6 addr_id,
>                                        !(val & DDC_I2C_IN_PROG), 500, 100=
0);
>         if (ret) {
>                 dev_err(ddc->dev, "DDC I2C write timeout\n");
> +
> +               /* Abort transfer if it is still in progress */
> +               regmap_update_bits(ddc->regs, DDC_CTRL, DDC_CTRL_CMD,
> +                                  FIELD_PREP(DDC_CTRL_CMD, DDC_CMD_ABORT=
_XFER));
> +
>                 return ret;
>         }
>
> @@ -179,6 +184,11 @@ static int mtk_ddcm_read_hdmi(struct mtk_hdmi_ddc *d=
dc, u16 uc_dev,
>                                                500 * (temp_length + 5));
>                 if (ret) {
>                         dev_err(ddc->dev, "Timeout waiting for DDC I2C\n"=
);
> +
> +                       /* Abort transfer if it is still in progress */
> +                       regmap_update_bits(ddc->regs, DDC_CTRL, DDC_CTRL_=
CMD,
> +                                          FIELD_PREP(DDC_CTRL_CMD, DDC_C=
MD_ABORT_XFER));
> +
>                         return ret;
>                 }
>
>
> --
> 2.52.0
>
