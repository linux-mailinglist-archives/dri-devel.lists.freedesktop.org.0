Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 55835382740
	for <lists+dri-devel@lfdr.de>; Mon, 17 May 2021 10:42:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3972A6E8F6;
	Mon, 17 May 2021 08:42:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 337B96E8F6
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 08:42:42 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 h3-20020a05600c3503b0290176f13c7715so1450358wmq.5
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 01:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zXxaT8nwWGbSA3y71Sv2dFK7xUB5sHLPcIFAVGVS5/o=;
 b=xKt2I5INi0ltOoKuJqoyxEaSp+X9Itm/nppkVkA2uNvGcJa98/ZsMPQOTzXP5a6xkX
 sDR5uJyjuz4zrQOplIHLLKDvMlBMuLeKCJBY3xwwRiW1G1tp3NRY9T8l+yVvWZLp+nAp
 hQaZhGEQmfOyHbztaPk+bf/zWzu2tEt/gZwVl1UeOEjcKg+z/rLbugGdcrvFMj5srlXu
 cfgXToN4KCjFtiWgHamsSc0oVVmQ/ualErnm2+xuwiJLq9MM73zYtmxpJnUi7CW1NU0S
 t6m1ESXgfDzjx/VS3YurE6B8Q5kWMIsd9CufeAhKcn4OQnt7CcQD7nJzv4xggGCHDm+h
 yZjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=zXxaT8nwWGbSA3y71Sv2dFK7xUB5sHLPcIFAVGVS5/o=;
 b=lnhR42ADphl9JIvLSuiuqOy243UUZmrJjdrV6e/J16I5wG+Z0EQUP7sLFei8+zQbYy
 L9AfxLYG/hm7V0+KFsqgmrWQE9QWqmhn775v8d6k1fr7zQjR6LQOis5QJ8uHfGNOp3ps
 JKbiWtaqvjN4mFhxFX0LkKrsFQHUIGHt8u7XTCvP5jKFr7Eguc/EX0CMbiFnGqtq3LTn
 jPPqOp6IVUm1T1UpLay3HprA0MDIpKqa12yHtiZhCi7qEa2bmH98WdjkLLx9755+zq7k
 aFei331gtjrtbJPxid3J1R7q/lkF/YR25mUsIV9KGRqHKvPfbqEHrqtQ1+95NQCHkiQM
 y6KQ==
X-Gm-Message-State: AOAM531NP8Cr2QWxCPVQNRJZtVqD4L9az8ysL4X40BvWvIhnrytsP8e+
 Bvk/yN9focwZsb5wCLKsoNwCNw==
X-Google-Smtp-Source: ABdhPJxnfbUUFBq8SHWIEOb1yzYUGtz36OYX9EnYlPiOSVu236fyQ9xAjk6p3KB12c/i/XwvElJEXA==
X-Received: by 2002:a05:600c:35d2:: with SMTP id
 r18mr22409712wmq.133.1621240960771; 
 Mon, 17 May 2021 01:42:40 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:90c:e290:3044:ffc:eaa9:6a70?
 ([2a01:e0a:90c:e290:3044:ffc:eaa9:6a70])
 by smtp.gmail.com with ESMTPSA id 6sm15759027wry.60.2021.05.17.01.42.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 May 2021 01:42:40 -0700 (PDT)
Subject: Re: [PATCH 1/2] drm: bridge: it66121: fix an error code in
 it66121_probe()
To: Dan Carpenter <dan.carpenter@oracle.com>, Phong LE <ple@baylibre.com>
References: <YJ+ZX3BdKPAN0pUZ@mwanda>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <638a3344-3222-87a1-d500-0d49960088a1@baylibre.com>
Date: Mon, 17 May 2021 10:42:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YJ+ZX3BdKPAN0pUZ@mwanda>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Robert Foss <robert.foss@linaro.org>, dri-devel@lists.freedesktop.org,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 15/05/2021 11:50, Dan Carpenter wrote:
> This code is passing the wrong variable to PTR_ERR() so it doesn't
> return the correct error code.
> 
> Fixes: 988156dc2fc9 ("drm: bridge: add it66121 driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/gpu/drm/bridge/ite-it66121.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ite-it66121.c b/drivers/gpu/drm/bridge/ite-it66121.c
> index d8a60691fd32..6980c9801d0d 100644
> --- a/drivers/gpu/drm/bridge/ite-it66121.c
> +++ b/drivers/gpu/drm/bridge/ite-it66121.c
> @@ -943,7 +943,7 @@ static int it66121_probe(struct i2c_client *client,
>  	ctx->regmap = devm_regmap_init_i2c(client, &it66121_regmap_config);
>  	if (IS_ERR(ctx->regmap)) {
>  		ite66121_power_off(ctx);
> -		return PTR_ERR(ctx);
> +		return PTR_ERR(ctx->regmap);
>  	}
>  
>  	regmap_read(ctx->regmap, IT66121_VENDOR_ID0_REG, &vendor_ids[0]);
> 

Thanks !

Acked-by: Neil Armstrong <narmstrong@baylibre.com>

Applying to drm-misc-fixes
