Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA234A81CF4
	for <lists+dri-devel@lfdr.de>; Wed,  9 Apr 2025 08:19:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A122310E2E9;
	Wed,  9 Apr 2025 06:19:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="Ko7plulh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3796710E2E9
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Apr 2025 06:19:49 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-549967c72bcso7814253e87.3
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Apr 2025 23:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1744179586; x=1744784386;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xPFx8UgUAY0xlIDn/x5aIYb1lovd1B9jsWSk1FiXXns=;
 b=Ko7plulhquPy7CEZrgwYAPncJ059x31SKaaAnn2ERBOZHYwiVUf/arolDRsAmSRsCR
 sAqz2UjTO7nhQ7lmbTztjPu2kn2w5b0XIR+UmwvOroGC3A8mbhuWtuSepYFH2uvVy8fm
 ReoUI3PrsxI+11DLE2pg4zLnMRX0eYHPjYP10=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744179586; x=1744784386;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xPFx8UgUAY0xlIDn/x5aIYb1lovd1B9jsWSk1FiXXns=;
 b=TgmFW9af8J4BhcOqmub84jalX0VmLkcQouJSJKp471XY6V5K4WmweIFjaoESmnkFtY
 sF0dbpn4XSH5MbHKWELr/PEnXk7yyytkKWtjyLzNwxfX2TEr2Fc2LepnBqzbhZp1uXRW
 7+ohwVzzYXFAwSLL6c2xdA1tFHia2yoch3mihozIqNbA4WbAQh6yoj9wv418+EAX2ecp
 jybNkeklrnv2uOsAoCPzq55CbZuArRczaj9fF78wNv5NoJs8c9o14jdn/g1mUkt1GCtP
 ftm9t2SG9UwDQ1uKtR9TrKLdK0ecNuUuOB0/GHQjDbYsWxwlnVEGmYR4FJWLb+84/yNP
 Ayug==
X-Forwarded-Encrypted: i=1;
 AJvYcCWOqpYYv8+WceO8PS5C+a3Db38VwSErs49x59zqvuMdq7S2wPvz+pWfntgdbzHzR51ZUo3h9yUFNjY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy7SY3Hdc20KZMjvYuWOyu9OOYnCXcZdm+WR1mSw+0ZohuTLcyw
 K+3UII3P59Hr2BZWfgAZeO3lg7IYAw0yZpHoEGTw2sndL2RakkuuoyB/4Q9LM3afmQy5PsfnWWu
 ZOGb82ObgMzAGe30wJUYo4CKqwW1oa/A8GEGa
X-Gm-Gg: ASbGncvk0fZBUocTuCjDt0OnkYHe7zmkaKldGDjsSjtyV2WTZy4A3XgdlNC8NR+DHnJ
 a6MHvqiHcb2KKs75DnjxBg35nKmdy14qzSDiutz6fLdDNS4dPWqZc/hVV5GsBmXuIy6yFX2vVEa
 gI3F2iWIVfFimlqeRAeIvjqcNvbLIm2ge/BQzNVbwu50kvxucNbg==
X-Google-Smtp-Source: AGHT+IF6USYpAM9lg3k8+AOqxfZjq6iN1XgABgZ7lN+hrkpyKB/hsy6JujD3QodyEr1gyD8+wAk4r3Qa2Kqqw1r74QQ=
X-Received: by 2002:a05:6512:1103:b0:545:49d:5474 with SMTP id
 2adb3069b0e04-54c4370f307mr358171e87.20.1744179585702; Tue, 08 Apr 2025
 23:19:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250403110915.75322-1-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250403110915.75322-1-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 9 Apr 2025 14:19:34 +0800
X-Gm-Features: ATxdqUGA8j7J3cMwwhvKkgHKxtLogzcNaUx9TtG6kN-tP3TulVKQHf_ux6bE6j8
Message-ID: <CAGXv+5G8kUg87+JzuCW5sZKHTBA3-CnwSFdrucn_k1rgcpJHOg@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: mtk_dp: Fix hdmi codec and phy driver
 unregistration
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com, 
 simona@ffwll.ch, matthias.bgg@gmail.com, nancy.lin@mediatek.com, 
 ck.hu@mediatek.com, djkurtz@chromium.org, littlecvr@chromium.org, 
 bibby.hsieh@mediatek.com, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com
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

On Thu, Apr 3, 2025 at 7:09=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> During probe, this driver is registering two platform devices: one
> for the HDMI Codec driver and one for the DisplayPort PHY driver.
>
> In the probe function, none of the error cases are unregistering
> any of the two platform devices and this may cause registration
> of multiple instances of those in case this driver returns one or
> more probe deferral(s) in the "wrong" spots.
>
> In order to fix this, add devm actions to unregister those and
> remove the manual calls to platform_device_unregister in the
> mtk_dp_remove() function, as those would otherwise be redundant.
>
> Fixes: e71a8ebbe086 ("drm/mediatek: dp: Audio support for MT8195")
> Fixes: caf2ae486742 ("drm/mediatek: dp: Add support for embedded DisplayP=
ort aux-bus")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dp.c | 30 ++++++++++++++++++++++++++----
>  1 file changed, 26 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek=
/mtk_dp.c
> index 3d4648d2e15f..3eb685a46d99 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dp.c
> @@ -2648,6 +2648,13 @@ static const struct hdmi_codec_ops mtk_dp_audio_co=
dec_ops =3D {
>         .hook_plugged_cb =3D mtk_dp_audio_hook_plugged_cb,
>  };
>
> +static void mtk_dp_unregister_pdevs(void *data)
> +{
> +       struct platform_device *ext_pdev =3D data;
> +
> +       platform_device_unregister(ext_pdev);
> +}
> +
>  static int mtk_dp_register_audio_driver(struct device *dev)
>  {
>         struct mtk_dp *mtk_dp =3D dev_get_drvdata(dev);
> @@ -2658,18 +2665,29 @@ static int mtk_dp_register_audio_driver(struct de=
vice *dev)
>                 .data =3D mtk_dp,
>                 .no_capture_mute =3D 1,
>         };
> +       int ret;
>
>         mtk_dp->audio_pdev =3D platform_device_register_data(dev,
>                                                            HDMI_CODEC_DRV=
_NAME,
>                                                            PLATFORM_DEVID=
_AUTO,
>                                                            &codec_data,
>                                                            sizeof(codec_d=
ata));
> -       return PTR_ERR_OR_ZERO(mtk_dp->audio_pdev);
> +       if (IS_ERR(mtk_dp->audio_pdev))
> +               return PTR_ERR(mtk_dp->audio_pdev);
> +
> +       ret =3D devm_add_action_or_reset(dev, mtk_dp_unregister_pdevs, mt=
k_dp->phy_dev);

Wrong platform device given here. You want audio_pdev instead.


Having briefly looked at this driver, I think it needs more cleanup. :o


ChenYu

> +       if (ret) {
> +               platform_device_unregister(mtk_dp->audio_pdev);
> +               return dev_err_probe(dev, ret,
> +                                    "Failed to add codec unregister devm=
 action");
> +       }
> +       return 0;
>  }
>
>  static int mtk_dp_register_phy(struct mtk_dp *mtk_dp)
>  {
>         struct device *dev =3D mtk_dp->dev;
> +       int ret;
>
>         mtk_dp->phy_dev =3D platform_device_register_data(dev, "mediatek-=
dp-phy",
>                                                         PLATFORM_DEVID_AU=
TO,
> @@ -2679,6 +2697,13 @@ static int mtk_dp_register_phy(struct mtk_dp *mtk_=
dp)
>                 return dev_err_probe(dev, PTR_ERR(mtk_dp->phy_dev),
>                                      "Failed to create device mediatek-dp=
-phy\n");
>
> +       ret =3D devm_add_action_or_reset(dev, mtk_dp_unregister_pdevs, mt=
k_dp->phy_dev);
> +       if (ret) {
> +               platform_device_unregister(mtk_dp->phy_dev);
> +               return dev_err_probe(dev, ret,
> +                                    "Failed to add phy unregister devm a=
ction");
> +       }
> +
>         mtk_dp_get_calibration_data(mtk_dp);
>
>         mtk_dp->phy =3D devm_phy_get(&mtk_dp->phy_dev->dev, "dp");
> @@ -2848,9 +2873,6 @@ static void mtk_dp_remove(struct platform_device *p=
dev)
>         pm_runtime_disable(&pdev->dev);
>         if (mtk_dp->data->bridge_type !=3D DRM_MODE_CONNECTOR_eDP)
>                 del_timer_sync(&mtk_dp->debounce_timer);
> -       platform_device_unregister(mtk_dp->phy_dev);
> -       if (mtk_dp->audio_pdev)
> -               platform_device_unregister(mtk_dp->audio_pdev);
>  }
>
>  #ifdef CONFIG_PM_SLEEP
> --
> 2.48.1
>
