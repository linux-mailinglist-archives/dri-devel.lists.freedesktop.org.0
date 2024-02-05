Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B523A84A1F5
	for <lists+dri-devel@lfdr.de>; Mon,  5 Feb 2024 19:18:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACB7810FBAE;
	Mon,  5 Feb 2024 18:18:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="DXXyIPzH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF63810FBB0
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Feb 2024 18:18:01 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-51137c8088dso4779718e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Feb 2024 10:18:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1707157079; x=1707761879;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ood9JeXOKG87bTqfPH5vVrFrWxV318p/Ke+LplXjoho=;
 b=DXXyIPzHlA0+eLkLmfZTybqpbHY3IqtQnYP2lO0OWyTfm93zeHulUvuruHleRAdqYj
 /pHbqZMQcmmPBdpe9N8YBjWsmcBkEo60cEVsgY2QKrNYOUT+2AsAaWcHERWtxonmaGgK
 2VH3vNxShtEGHrup/amptEXigbsrYNbl5xGNU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707157079; x=1707761879;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ood9JeXOKG87bTqfPH5vVrFrWxV318p/Ke+LplXjoho=;
 b=vKKzeeEuU01OYU0tMhMar4isQPRB14Q643k9W6/Uq4X5V8oEFpD4cnL3CjEm8pjoPc
 ZsK/PoS4DIYdhmzuXpxsr5ta34e4tsypoatu0akJxUdCtA5xq3L/D/qqpS6QhM98OO6T
 rhFx1/Des/lNN3GNOgCN0ED9N3/ncfHUpr3IKywcZwwlSXLZ2UIRtVayVp8WJPT1MqAc
 f/5rIwcUb7/orL1hgrPc+JaaSf3/G6dDXn3a3CBF7N3yqRHjtj0OUVSj9k7SphfQardl
 +lvo7ij3FGiC7ljZKOQNNGvAPoV+iCvDcN2z5bVHJEwJXw/RM/MCB9pa7JdDMeXKG3zb
 RUlQ==
X-Gm-Message-State: AOJu0YzvKjTOdruK0utEVdENohQPcLK1sWdD6vcCtjiDxO8HfLSLKmFJ
 u1ikdV4tfurc2OdZEXtTuqftIO85HrgXEetSuuEEW1m05DP72Tw2Ezb4dSpyyZEXfpLC1K4avbg
 zfmZr
X-Google-Smtp-Source: AGHT+IF4zdXh/z/RDSsvdgZ5EphnUPB184qO9+u5NSYUzpgPmOs5IIC0AdvC21YH+r69cnPc2K7ZoQ==
X-Received: by 2002:a19:2d1c:0:b0:511:2dad:d9a0 with SMTP id
 k28-20020a192d1c000000b005112dadd9a0mr256047lfj.19.1707157078953; 
 Mon, 05 Feb 2024 10:17:58 -0800 (PST)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com.
 [209.85.208.44]) by smtp.gmail.com with ESMTPSA id
 oz17-20020a170906cd1100b00a36a94ecf9dsm100073ejb.175.2024.02.05.10.17.58
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Feb 2024 10:17:58 -0800 (PST)
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-56012eeb755so2170a12.0
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Feb 2024 10:17:58 -0800 (PST)
X-Received: by 2002:a19:5f50:0:b0:511:4a7c:51aa with SMTP id
 a16-20020a195f50000000b005114a7c51aamr19188lfj.6.1707156683549; Mon, 05 Feb
 2024 10:11:23 -0800 (PST)
MIME-Version: 1.0
References: <b236236a-9953-4246-a697-19ed1b22d86a@web.de>
In-Reply-To: <b236236a-9953-4246-a697-19ed1b22d86a@web.de>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 5 Feb 2024 10:11:06 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Xsg3Fs8XQ0piBYKGSYOhuGXyKpoJ5dbtGPdP5HU+2RyQ@mail.gmail.com>
Message-ID: <CAD=FV=Xsg3Fs8XQ0piBYKGSYOhuGXyKpoJ5dbtGPdP5HU+2RyQ@mail.gmail.com>
Subject: Re: [PATCH] drm/hisilicon: Use
 devm_platform_get_and_ioremap_resource() in dsi_parse_dt()
To: Markus Elfring <Markus.Elfring@web.de>
Cc: dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 John Stultz <jstultz@google.com>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Sumit Semwal <sumit.semwal@linaro.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Tian Tao <tiantao6@hisilicon.com>, 
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Xinliang Liu <xinliang.liu@linaro.org>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>, 
 Yongqin Liu <yongqin.liu@linaro.org>, LKML <linux-kernel@vger.kernel.org>
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

Hi,

On Mon, Feb 5, 2024 at 12:13=E2=80=AFAM Markus Elfring <Markus.Elfring@web.=
de> wrote:
>
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Mon, 5 Feb 2024 08:58:21 +0100
>
> A wrapper function is available since the commit 890cc39a879906b63912482d=
fc41944579df2dc6
> ("drivers: provide devm_platform_get_and_ioremap_resource()").
> Thus reuse existing functionality instead of keeping duplicate source cod=
e.
>
> This issue was detected by using the Coccinelle software.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c b/drivers/gpu/d=
rm/hisilicon/kirin/dw_drm_dsi.c
> index 566de4658719..1edf429c49d7 100644
> --- a/drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c
> +++ b/drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c
> @@ -834,8 +834,7 @@ static int dsi_parse_dt(struct platform_device *pdev,=
 struct dw_dsi *dsi)
>                 return PTR_ERR(ctx->pclk);
>         }
>
> -       res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -       ctx->base =3D devm_ioremap_resource(&pdev->dev, res);
> +       ctx->base =3D devm_platform_get_and_ioremap_resource(pdev, 0, &re=
s);
>         if (IS_ERR(ctx->base)) {
>                 DRM_ERROR("failed to remap dsi io region\n");
>                 return PTR_ERR(ctx->base);

This function no longer needs the local variable "res". Remove it and
then change the function call to devm_platform_ioremap_resource().
With that:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
