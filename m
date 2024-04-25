Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F11F98B1BE8
	for <lists+dri-devel@lfdr.de>; Thu, 25 Apr 2024 09:30:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2080710E414;
	Thu, 25 Apr 2024 07:30:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kt5qVTHe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com
 [209.85.222.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4BC710E379
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Apr 2024 01:48:36 +0000 (UTC)
Received: by mail-ua1-f49.google.com with SMTP id
 a1e0cc1a2514c-7eb6e4ad857so150498241.0
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Apr 2024 18:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714009715; x=1714614515; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hG102H74pdxU5NBp7aAW3ezITZvy/2GYPGEaW3NCxpg=;
 b=kt5qVTHewoIX4MRQzYhk3qDjCwjbcwtoy8kfvRmFl3Sj28rD5cqWxusW8onoNVXMRo
 TWDoc8I+8VKOXGTNcP50YEfnd1hIrouJHvBsJUYlJ2aZZTr2eMhQchZc+dlbBmHb2kIi
 5qE4i8FCkIPF975nXVgujXAEQeW1haW+Liam1LuelUgCjgv1jnEtoMqAd8Vv+s+VLBlu
 1Ud6uOKmkSvxgDgn/jVTUbxMrLovkop+Ehd+RedCNCwfao4tAXdPT1urdps6emhRazsJ
 iWUMXYChq2PU9amzXJZYpBdWcfCEXywMy/AgBnO1rmVaPOjdUjmE7GvJPmab1bvl2PBv
 pxSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714009715; x=1714614515;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hG102H74pdxU5NBp7aAW3ezITZvy/2GYPGEaW3NCxpg=;
 b=QUYDfirGXouYeQDDuBUMPmKeErhOePxAgFQmB6CKbM4f0B+4+sUEd/o+7UGQf0O4aN
 sZRkH05QXi024Nc4wNf0kXso9wOCkohBwpDLvrYhzQmCyYFpDISxBBDPyW+aq0fqlYId
 858clMJHSbiSZkIUdctdtwXOB8G6KdCX0Btt3H3HQslQb12JwNEgnz9vBzcLKoHlIaXk
 9q+DfPfWJo3DtM13WT8/pxeOcW1EUqGjaqIH82Twr6dEFbavpV3oE6a0TSx+/2Ks4UN/
 CfNEcQg/8qridotaKKR2Mzd1e4QHx/TDviTptXDln25ukrqMlM5v5KqSx0rM0Rf0rW7X
 icig==
X-Forwarded-Encrypted: i=1;
 AJvYcCW75994e238qmYu6JcSnkQvzh9Vdrb3r7LGff35dCCh4Tb8FrBL8LPKNll4qnAKTw5YEtCS2U/LxuaRTSk0w0ummZuxNpi7/Fe6pZha+dSO
X-Gm-Message-State: AOJu0YxHxChojWKXNe7UZHVMGMR+M4XkQGhEDAIj/g8eZukSL+0HZkWG
 REN4eqXfV92CCf/xWO/s2ZykqSeth3Y8+jWLyLWZlU9YSemPd8Birc/Lk6JPgs8TmDQTbFAcRJy
 TRyObiXQ5hISNxUd6AdM63lyDwo8=
X-Google-Smtp-Source: AGHT+IEpi9vH+ceBAPGcE12M1F3pcELXnj+ShzjzIPt31fULK4uD1Y79SwhGryUErqd7wTbS/ZRIOqF3N7DMl1qnPuE=
X-Received: by 2002:a67:f10d:0:b0:47b:b820:e735 with SMTP id
 n13-20020a67f10d000000b0047bb820e735mr4726089vsk.32.1714009715581; Wed, 24
 Apr 2024 18:48:35 -0700 (PDT)
MIME-Version: 1.0
References: <20240415003958.721061-1-shivani07g@gmail.com>
In-Reply-To: <20240415003958.721061-1-shivani07g@gmail.com>
From: Inki Dae <daeinki@gmail.com>
Date: Thu, 25 Apr 2024 10:47:59 +0900
Message-ID: <CAAQKjZO0VhkpsM4L+C97QcCAjF_b99zp2W25n+swLP6K1OUpww@mail.gmail.com>
Subject: Re: [PATCH] gpu: drm: exynos: hdmi: eliminate uses of of_node_put()
To: Shivani Gupta <shivani07g@gmail.com>
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Julia Lawall <julia.lawall@inria.fr>, Shuah Khan <skhan@linuxfoundation.org>, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>,
 dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Thu, 25 Apr 2024 07:30:07 +0000
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

Good cleanup. Applied. :)

Thanks,
Inki Dae

2024=EB=85=84 4=EC=9B=94 15=EC=9D=BC (=EC=9B=94) =EC=98=A4=EC=A0=84 9:40, S=
hivani Gupta <shivani07g@gmail.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> Utilize the __free() cleanup handler within the hdmi_get_phy_io function
> to automatically release the device node when it is out of scope.
> This eliminates the manual invocation of of_node_put(), reducing the
> potential for memory leaks.
>
> The modification requires initializing the device node at the beginning
> of the function, ensuring that the automatic cleanup is safely executed.
>
> Consequently, this removes the need for error cleanup paths that utilize
> goto statements and the jump to out is no longer necessary.
>
> Suggested-by: Julia Lawall <julia.lawall@inria.fr>
> Signed-off-by: Shivani Gupta <shivani07g@gmail.com>
> ---
>  drivers/gpu/drm/exynos/exynos_hdmi.c | 15 +++++----------
>  1 file changed, 5 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exyno=
s/exynos_hdmi.c
> index b1d02dec3774..a741fd949482 100644
> --- a/drivers/gpu/drm/exynos/exynos_hdmi.c
> +++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
> @@ -1919,10 +1919,9 @@ static int hdmi_get_ddc_adapter(struct hdmi_contex=
t *hdata)
>  static int hdmi_get_phy_io(struct hdmi_context *hdata)
>  {
>         const char *compatible_str =3D "samsung,exynos4212-hdmiphy";
> -       struct device_node *np;
> -       int ret =3D 0;
> +       struct device_node *np __free(device_node) =3D
> +               of_find_compatible_node(NULL, NULL, compatible_str);
>
> -       np =3D of_find_compatible_node(NULL, NULL, compatible_str);
>         if (!np) {
>                 np =3D of_parse_phandle(hdata->dev->of_node, "phy", 0);
>                 if (!np) {
> @@ -1937,21 +1936,17 @@ static int hdmi_get_phy_io(struct hdmi_context *h=
data)
>                 if (!hdata->regs_hdmiphy) {
>                         DRM_DEV_ERROR(hdata->dev,
>                                       "failed to ioremap hdmi phy\n");
> -                       ret =3D -ENOMEM;
> -                       goto out;
> +                       return -ENOMEM;
>                 }
>         } else {
>                 hdata->hdmiphy_port =3D of_find_i2c_device_by_node(np);
>                 if (!hdata->hdmiphy_port) {
>                         DRM_INFO("Failed to get hdmi phy i2c client\n");
> -                       ret =3D -EPROBE_DEFER;
> -                       goto out;
> +                       return -EPROBE_DEFER;
>                 }
>         }
>
> -out:
> -       of_node_put(np);
> -       return ret;
> +       return 0;
>  }
>
>  static int hdmi_probe(struct platform_device *pdev)
> --
> 2.34.1
>
>
