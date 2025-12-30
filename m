Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D95ACEA167
	for <lists+dri-devel@lfdr.de>; Tue, 30 Dec 2025 16:41:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FBE210E915;
	Tue, 30 Dec 2025 15:41:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="PhXvNZOC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61F8D10E915
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 15:41:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 642BD60051
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 15:41:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16E7FC2BCB0
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 15:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767109277;
 bh=gyHQKb3z1nk+UnpTmdOwQ9Nw5LQ39V8OUPvQxvyOONo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=PhXvNZOCnwhyuQl/sJpP93msu9Bz2T1BSHWyMFhgu1rnkvjje2kXUP3mTYoyo/YBa
 A8041AbNjQMhqHBamlugNvHPO+5bCDoZt6ZInP8Qm/SimipO6Ffjex3mCMUZvJW/Lp
 DUWlRZz+BHD+9wVyWaQzpSKD2xsxHeDFY4cJsxhYqIKi7EaOepRspvDlrkwZEKti5Z
 pwp6TTIYdcOV32pOtC/hmbSvML1tYP2xrzRE13sHlIRV7HAbuoyEPXWaVrNJ1DQDmL
 aKZ100NRT/ZeY2YZv/xqjiWrG5OFE7UrscBpPhiwpx0hCtRfIzahaw6cedrNB5J2pg
 fKFDeOSrmv1Gw==
Received: by mail-dl1-f42.google.com with SMTP id
 a92af1059eb24-11beb0a7bd6so14670020c88.1
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 07:41:17 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXvVAnFtnBWdr4IAfdt4kYl5iSpBhUuDHJ52zBcQ4SRLrGK0i/wWjqjh7RXusKEJ4gGBqiryhMJc1o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwzsJioOwMNDJfwMHPPDUWilD37VpmJ1PZEUop65jV8vRG6LVa3
 yx4lBcoaFAXRFj064ta6M1n2oVdFkUI3LGTUj8EWnCofcgmIo7oMThSYxy1voNzt1ObbDP3U8YS
 nT8DO5DRdDOQ4e8WYjWf+6d34H/RebA==
X-Google-Smtp-Source: AGHT+IEh2n2zLpLnAWsSiBjd90/ps/z4xq2CFX5rKvlH82VgvcbIbEKrpQVoNU8JRj6mongRc2KFddek2E8g0FG2WcA=
X-Received: by 2002:a05:7022:e88e:b0:119:e569:f851 with SMTP id
 a92af1059eb24-1206193963cmr33079705c88.8.1767109276351; Tue, 30 Dec 2025
 07:41:16 -0800 (PST)
MIME-Version: 1.0
References: <aSW0p5sqnJVJsqDO@stanley.mountain>
In-Reply-To: <aSW0p5sqnJVJsqDO@stanley.mountain>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 30 Dec 2025 15:41:04 +0000
X-Gmail-Original-Message-ID: <CAAOTY__nif43taCWWdxfFqmtC=KibgJZ2AuUohiS1EdhXdDbow@mail.gmail.com>
X-Gm-Features: AQt7F2o-8OY-770n-RCRfh2pqvzP9k8Fyvdsrmq_wWlXdIFfmVOWee9EjRaS2wo
Message-ID: <CAAOTY__nif43taCWWdxfFqmtC=KibgJZ2AuUohiS1EdhXdDbow@mail.gmail.com>
Subject: Re: [PATCH next] drm/mediatek: Fix platform_get_irq() error checking
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Matthias Brugger <matthias.bgg@gmail.com>, CK Hu <ck.hu@mediatek.com>, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
 dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, kernel-janitors@vger.kernel.org
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

Hi, Dan:

Dan Carpenter <dan.carpenter@linaro.org> =E6=96=BC 2025=E5=B9=B411=E6=9C=88=
25=E6=97=A5=E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=881:52=E5=AF=AB=E9=81=93=EF=
=BC=9A
>
> The platform_get_irq() function returns negative error codes on failure
> and positive non-zero IRQ numbers on success.  It never returns NULL. Fix
> the error checking to look for negatives, and change "hdmi->irq" from
> unsigned int to just int.

Applied to mediatek-drm-fixes [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-fixes

Regards,
Chun-Kuang.

>
> Fixes: 8d0f79886273 ("drm/mediatek: Introduce HDMI/DDC v2 for MT8195/MT81=
88")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/gpu/drm/mediatek/mtk_hdmi_common.c | 2 +-
>  drivers/gpu/drm/mediatek/mtk_hdmi_common.h | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_common.c b/drivers/gpu/drm=
/mediatek/mtk_hdmi_common.c
> index e78eb0876f16..bd7f8c56ec9c 100644
> --- a/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
> @@ -303,7 +303,7 @@ static int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *h=
dmi, struct platform_device
>                 return dev_err_probe(dev, ret, "Failed to get clocks\n");
>
>         hdmi->irq =3D platform_get_irq(pdev, 0);
> -       if (!hdmi->irq)
> +       if (hdmi->irq < 0)
>                 return hdmi->irq;
>
>         hdmi->regs =3D device_node_to_regmap(dev->of_node);
> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_common.h b/drivers/gpu/drm=
/mediatek/mtk_hdmi_common.h
> index de5e064585f8..7a644bbf5843 100644
> --- a/drivers/gpu/drm/mediatek/mtk_hdmi_common.h
> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi_common.h
> @@ -168,7 +168,7 @@ struct mtk_hdmi {
>         bool audio_enable;
>         bool powered;
>         bool enabled;
> -       unsigned int irq;
> +       int irq;
>         enum hdmi_hpd_state hpd;
>         hdmi_codec_plugged_cb plugged_cb;
>         struct device *codec_dev;
> --
> 2.51.0
>
