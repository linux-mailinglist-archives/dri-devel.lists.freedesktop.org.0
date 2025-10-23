Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2536AC0245E
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 17:59:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D91B10E91D;
	Thu, 23 Oct 2025 15:59:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Iqm9YOj1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 571D710E91D
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 15:59:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 74AF4640E0
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 15:59:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22B9AC16AAE
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 15:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761235170;
 bh=HNETIspV1pbV0Y7043vMBsmXaAMmB/3oT01AgEruh5o=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Iqm9YOj1nwjHauObiKeCKcztOyM7IDzlzvu7DqnfXoWrCbXW8LFQnOaNQwQXRS/vD
 G93NwnP0QcDAlRnItO34nCtCUky9f5sS8uIW06ELuZh/XCOzOm/HDb1MBsqjFSD1aj
 tUZsK+U0FhYJA2963vqqMBLycJQx6Y+A1Y7m8Cofj4McSrdU2ytBtGI7MC1J4jK3Hd
 mzx3D0bfz4oapjweIXnuUQKhb+BuvvR15B9uAYCoh6UoLCFVSpT8LzYnGRU9LK32iA
 J29QaMXqAP0qOIIA3RnPHS0tkvekxr7aTAvoWDw3Tmz2gp6M+QxSYKuCqRcd71pATw
 TSezQ+JvIMjNw==
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-290dc63fabbso10549605ad.0
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 08:59:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVcoxS3z4+tG4+CHNGVo9Gha2j5+QPzN5fTD8kroFoH+FMkk4CBwtFFJVCaZASUABirihe1p1UGMwA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzk3o6oxwI6i8FWJBWUTt8WQN9cxx8QdhnWe7zNXKEx4mhLZm/n
 Aeg1NeKxzdKrt0UHXvxQ59hP6r/YxKtS1VYzRz0t2Cs9Ud8qF8Uhayl+/ODOjPj431UchtUPfLE
 K/7a5ToUUPeFZemW0PYYg433eHoazfw==
X-Google-Smtp-Source: AGHT+IECkDSLnMI58q2z6cfhGJynJyGmcN+cdUTnJb3cy4ZottyIHIlB5uHCXuVcpJ10ENJOaHc75BD0rCg14pUbOyU=
X-Received: by 2002:a17:902:d48b:b0:269:a2bc:799f with SMTP id
 d9443c01a7336-2946e0ebfe2mr35532765ad.29.1761235169689; Thu, 23 Oct 2025
 08:59:29 -0700 (PDT)
MIME-Version: 1.0
References: <20251023-mediatek-drm-hdmi-v2-v11-0-7873ec4a1edf@collabora.com>
 <20251023-mediatek-drm-hdmi-v2-v11-5-7873ec4a1edf@collabora.com>
In-Reply-To: <20251023-mediatek-drm-hdmi-v2-v11-5-7873ec4a1edf@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 23 Oct 2025 15:59:17 +0000
X-Gmail-Original-Message-ID: <CAAOTY_8y6C5=jSjzBVVJ2vJq1L+Nf9U0tZvxzVX-e-3g91xEeQ@mail.gmail.com>
X-Gm-Features: AS18NWBPNnpQTLl2v2M-LiIiRpHYJ2lBBGYEU56O8zLVvGRR7Usps46KfOInouI
Message-ID: <CAAOTY_8y6C5=jSjzBVVJ2vJq1L+Nf9U0tZvxzVX-e-3g91xEeQ@mail.gmail.com>
Subject: Re: [PATCH v11 05/11] drm/mediatek: mtk_hdmi_common: Make CEC support
 optional
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
=B410=E6=9C=8823=E6=97=A5
=E9=80=B1=E5=9B=9B =E4=B8=8A=E5=8D=8810:32=E5=AF=AB=E9=81=93=EF=BC=9A
>
> From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com=
>
>
> In preparation for adding a new driver for HDMIv2, for which CEC
> is not strictly required, change the of_get_compatible_child()
> failure error to -ENOTSUPP to be able to differentiate between
> error conditions in mtk_hdmi_dt_parse_pdata().
>
> In that case, if -ENOTSUPP is returned, this driver will print
> an informative message saying that CEC support is unavailable,
> as the devicetree node for that was not found, but after that,
> function mtk_hdmi_dt_parse_pdata() will not return error to
> the caller.
>
> This will not change functionality of the mtk_hdmi (v1) driver
> as that is still checking whether CEC is present and, if not,
> will fail probing with an error saying that CEC is required
> by HDMIv1.
>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_hdmi_common.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_common.c b/drivers/gpu/drm=
/mediatek/mtk_hdmi_common.c
> index f28e63716d7c2e2c6bdf5b28d24789bc926d2beb..989479fdfe40952762a1b6379=
7bf602b520dcac5 100644
> --- a/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
> @@ -253,12 +253,11 @@ static int mtk_hdmi_get_cec_dev(struct mtk_hdmi *hd=
mi, struct device *dev, struc
>         /* The CEC module handles HDMI hotplug detection */
>         cec_np =3D of_get_compatible_child(np->parent, "mediatek,mt8173-c=
ec");
>         if (!cec_np)
> -               return dev_err_probe(dev, -EINVAL, "Failed to find CEC no=
de\n");
> +               return dev_err_probe(dev, -ENOTSUPP, "Failed to find CEC =
node\n");

The checkpatch show the warning:

WARNING: ENOTSUPP is not a SUSV4 error code, prefer EOPNOTSUPP
#40: FILE: drivers/gpu/drm/mediatek/mtk_hdmi_common.c:256:
+        return dev_err_probe(dev, -ENOTSUPP, "Failed to find CEC node\n");

I find many driver use ENOTSUPP, so I'm not sure which one is better.
I really don't understand the description about these two error code [1].
If you choose ENOTSUPP, please give me some explain.

[1] https://man7.org/linux/man-pages/man3/errno.3.html

Regards,
Chun-Kuang.

>
>         cec_pdev =3D of_find_device_by_node(cec_np);
>         if (!cec_pdev) {
> -               dev_err(hdmi->dev, "Waiting for CEC device %pOF\n",
> -                       cec_np);
> +               dev_err(hdmi->dev, "Waiting for CEC device %pOF\n", cec_n=
p);
>                 of_node_put(cec_np);
>                 return -EPROBE_DEFER;
>         }
> @@ -319,7 +318,9 @@ static int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *h=
dmi, struct platform_device
>                 return dev_err_probe(dev, -EINVAL, "Failed to get ddc i2c=
 adapter by node\n");
>
>         ret =3D mtk_hdmi_get_cec_dev(hdmi, dev, np);
> -       if (ret)
> +       if (ret =3D=3D -ENOTSUPP)
> +               dev_info(dev, "CEC support unavailable: node not found\n"=
);
> +       else if (ret)
>                 return ret;
>
>         return 0;
>
> --
> 2.51.0
>
