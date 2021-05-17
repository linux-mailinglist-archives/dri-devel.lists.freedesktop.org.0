Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E90382745
	for <lists+dri-devel@lfdr.de>; Mon, 17 May 2021 10:43:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D7676E7DC;
	Mon, 17 May 2021 08:43:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E9C789FF9
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 08:43:24 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 u5-20020a7bc0450000b02901480e40338bso4845518wmc.1
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 01:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HsGrTTXSqy1R5BsWlfd1YsU0RFI4WeeaWkJklgir48U=;
 b=0hE5O+GscDy8Nn4rYBiNbO80WVKdf2MQMu1/ZGp+wCPqj71c1zOsJkxvhm92HFfh9D
 A5Xpa4k+L15JPEr7KVv/BlG5uTR41DCDIzsz3ZA4bk+oFWtSIxLox9X9ioQIuLtX96K1
 6X5pWg5MWQCpHll9ELZSrPLOyVFmu9nFR1IAk5M+GHtXP+8NW/bQ+SC3xSl9XmRR306s
 SfYHuPTBAVgOaJUDACDY4MyyxQvxucaRM75v4ue//VMt1IHOlpuXwu9EnXsE8tisjjmN
 vwhzQCMmlREj1E+EmxAtnfvj7TP13MV8Q/UpVpQnHFgeJvEHOhipIwPbGZNwM49i0mgE
 7m8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=HsGrTTXSqy1R5BsWlfd1YsU0RFI4WeeaWkJklgir48U=;
 b=Pys6uzisPcKHf1LMoIhfj+IqbAmIxdk4QfG0t9TaKXG6pKLczC9yBAS7uGhoFuRcS/
 P9+n3EQEktfnh8ZC520QU75KGAZwemKLYQ2XCeSi5XwpK0gMoso9J5I1tLHrEMMKt6Sh
 fG1dUV/YcE+dbjuuxUyz8ycZw2/Lt1XbOoKcBDrFk7jvoh6+1a82nChqK1KoG0cjSRMI
 Y8JNkHQu3ybr7PQV+LzQbyuSC5CICWj8mv9o/STJX651JqF7FOwGKn2SOjaGaknv9Whn
 RtDHTUk9iURpnwb5Rfev4c+xPzGxlGNLt3Ev1yrSNpixTAUAR63lSG6MOytIU7TWrBCp
 C/Wg==
X-Gm-Message-State: AOAM532wiQw3rqO5a2yt9Ud8UskodSbzvwq2aLQIw5Hw4NNXX+jDTiUQ
 Qz8jWwsMqsjcLCSEBX9+g9OKtg==
X-Google-Smtp-Source: ABdhPJx2rtb2czAZLf2iwucJaJ228xdmBB8ZpCH4PIXiaefI7VBHYklQgRZAQYZ4EVToF5rVF1PYNw==
X-Received: by 2002:a7b:c841:: with SMTP id c1mr62673858wml.123.1621241002792; 
 Mon, 17 May 2021 01:43:22 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:90c:e290:3044:ffc:eaa9:6a70?
 ([2a01:e0a:90c:e290:3044:ffc:eaa9:6a70])
 by smtp.gmail.com with ESMTPSA id q186sm588870wme.20.2021.05.17.01.43.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 May 2021 01:43:22 -0700 (PDT)
Subject: Re: [PATCH 2/2] drm: bridge: it66121: fix a resource leak in probe
To: Dan Carpenter <dan.carpenter@oracle.com>, Phong LE <ple@baylibre.com>
References: <YJ+ZgXTFa6voZuJG@mwanda>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <873d476b-d8b2-8757-47ba-4588231ceac3@baylibre.com>
Date: Mon, 17 May 2021 10:43:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YJ+ZgXTFa6voZuJG@mwanda>
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
 kernel-janitors@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 15/05/2021 11:50, Dan Carpenter wrote:
> In the original code if the "ctx = devm_kzalloc()" allocation failed
> then we should have called of_node_put(ep); before returning.  It's
> actually a bit easier to do the allocation first before assigning
> ep = of_graph_get_endpoint_by_regs().
> 
> Fixes: 988156dc2fc9 ("drm: bridge: add it66121 driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/gpu/drm/bridge/ite-it66121.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ite-it66121.c b/drivers/gpu/drm/bridge/ite-it66121.c
> index 6980c9801d0d..7149ed40af83 100644
> --- a/drivers/gpu/drm/bridge/ite-it66121.c
> +++ b/drivers/gpu/drm/bridge/ite-it66121.c
> @@ -898,14 +898,14 @@ static int it66121_probe(struct i2c_client *client,
>  		return -ENXIO;
>  	}
>  
> -	ep = of_graph_get_endpoint_by_regs(dev->of_node, 0, 0);
> -	if (!ep)
> -		return -EINVAL;
> -
>  	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
>  	if (!ctx)
>  		return -ENOMEM;
>  
> +	ep = of_graph_get_endpoint_by_regs(dev->of_node, 0, 0);
> +	if (!ep)
> +		return -EINVAL;
> +
>  	ctx->dev = dev;
>  	ctx->client = client;
>  
> 

Thanks !

Acked-by: Neil Armstrong <narmstrong@baylibre.com>

Applying to drm-misc-fixes
