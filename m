Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E17D67ACBAD
	for <lists+dri-devel@lfdr.de>; Sun, 24 Sep 2023 21:47:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 175A510E157;
	Sun, 24 Sep 2023 19:47:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C16A10E157
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Sep 2023 19:47:25 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-32320381a07so973380f8f.0
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Sep 2023 12:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695584844; x=1696189644; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=X0UiLgnPTra5qLP9o6AOXP+MP5rQqIbxexMkPfbpuaE=;
 b=eo5Z6Y9p59eLlV8q6Ne6QrajWjqlgrz8iy7McUCJPWZq6p/8ZAUC/2jg5GdP9kNpAg
 gcxFcvxuQxvIT632SstEAdh3lnAO8VsnSexAf32R894Eo0j4Q8ZFI93LQNYtucp/xhuu
 whwOZtLQVEtHRqtQiLngR8u+w1VaER2UIv8cDsbEej/XZBj52kcZHw0bCX/wjfojFOG1
 P8kwQmQIJcm5BZb92yXwgZdY96ScfncI+yx8Y2rZMgqG9i6w0p7p8WpSI2whCtsokIOs
 E5dXTIkxLrz35h8cjrHVK5sr1FjkMLhhn2MLiZ10Fw0BXNV+kzphYr6X5W64LjRrJJRW
 yx7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695584844; x=1696189644;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=X0UiLgnPTra5qLP9o6AOXP+MP5rQqIbxexMkPfbpuaE=;
 b=izY78jyXCzDMcj/jwLL2jtAJjWJQBIUd2dIw7vyR0mBvqSma7otfqcjwtsjF7h30uQ
 jqoZovWYyBsF3Jx4Z9QbcqmppeqSZBip9nilkuOlSg9HqoeWfgz6GOnKnp0hcA2pg1q6
 Pxg5d7Lkzne2NxD9cw/ZiiWOPlAhI3oFs+MLTWVFURcX8zaZ7nChesnXOE12uonttSDS
 5/mio2oOzALOkYFS8ad5GxOhQ6LmcuQHy7fcEBuC0aSWHnmBO5eozLxa/4ghG55iRoKH
 WjXmMSoBOdTOM9PeGLFPAPjoqrIfEhvezreIWFSK2rwTBjOvAyMaT5Hh0QVh5FJKBT6+
 tN/A==
X-Gm-Message-State: AOJu0YzSRUIP170uLAfG5ocCxIiBqxUA1X0ybSpn1gYI4gK9lyGS4Tyr
 cKlUdpOrs1c302d92G3d5Ao=
X-Google-Smtp-Source: AGHT+IGDoDkjcAsXY5BDoD37D7SSWWRRbHvSuc/IWVrkcNbbcS4m6aLfl01i4du0XtIIfHFrGLoGGQ==
X-Received: by 2002:adf:ebcc:0:b0:319:85e2:6972 with SMTP id
 v12-20020adfebcc000000b0031985e26972mr4084047wrn.42.1695584844170; 
 Sun, 24 Sep 2023 12:47:24 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-12-148.dynamic.telemach.net.
 [82.149.12.148]) by smtp.gmail.com with ESMTPSA id
 sd6-20020a170906ce2600b00997e99a662bsm5315866ejb.20.2023.09.24.12.47.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Sep 2023 12:47:23 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: airlied@gmail.com, liuhaoran <liuhaoran14@163.com>
Subject: Re: [PATCH] drm/sun4i: Add error handling in sun4i_layer_init_one()
Date: Sun, 24 Sep 2023 21:47:22 +0200
Message-ID: <2156768.irdbgypaU6@jernej-laptop>
In-Reply-To: <20230924074216.17390-1-liuhaoran14@163.com>
References: <20230924074216.17390-1-liuhaoran14@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
Cc: liuhaoran <liuhaoran14@163.com>, samuel@sholland.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi!

Dne nedelja, 24. september 2023 ob 09:42:16 CEST je liuhaoran napisal(a):
> This patch adds error-handling for the drm_plane_create_alpha_property()
> and drm_plane_create_zpos_property() inside the dw_hdmi_imx_probe().

dw_hdmi_imx_probe() is not from this driver.

Best regards,
Jernej

> 
> Signed-off-by: liuhaoran <liuhaoran14@163.com>
> ---
>  drivers/gpu/drm/sun4i/sun4i_layer.c | 19 ++++++++++++++++---
>  1 file changed, 16 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/sun4i/sun4i_layer.c b/drivers/gpu/drm/sun4i/sun4i_layer.c
> index 98f3176366c0..a3343afb7935 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_layer.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_layer.c
> @@ -224,9 +224,22 @@ static struct sun4i_layer *sun4i_layer_init_one(struct drm_device *drm,
>  	drm_plane_helper_add(&layer->plane,
>  			     &sun4i_backend_layer_helper_funcs);
>  
> -	drm_plane_create_alpha_property(&layer->plane);
> -	drm_plane_create_zpos_property(&layer->plane, layer->id,
> -				       0, SUN4I_BACKEND_NUM_LAYERS - 1);
> +	ret = drm_plane_create_alpha_property(&layer->plane);
> +
> +	if (ret) {
> +		dev_err(drm->dev, "Failed to install alpha property,
> +			rc = %d\n", ret);
> +		return ERR_PTR(ret);
> +	}
> +
> +	ret = drm_plane_create_zpos_property(&layer->plane, layer->id, 0,
> +					     SUN4I_BACKEND_NUM_LAYERS - 1);
> +
> +	if (ret) {
> +		dev_err(drm->dev, "Failed to install zpos property,
> +			rc = %d\n", ret);
> +		return ERR_PTR(ret);
> +	}
>  
>  	return layer;
>  }
> 




