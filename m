Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5375690BD87
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 00:28:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54C0010E1C7;
	Mon, 17 Jun 2024 22:28:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="pntEBBn0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C15310E1C7
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 22:28:14 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-52b7ffd9f6eso4757612e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 15:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718663292; x=1719268092; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=J0iER+AoYp/pYl5IC7iX81NqnRqAb0NqRg5uJ+M7o3M=;
 b=pntEBBn0gNGbybPdmHSEjrAjIkEWQC5cIQEi62DeO03buNnvDu8OxEMxvhKX141k22
 ehm4F9B0ckaPYW2Y41XcusVfiZerRKG35lHj19+TBj6Cc1QWFqJi1v9CMJEYM+3IFhhp
 wr4pnrvwk3h0Clu4OEYuia88VcdEMKspvq2DJweZykf8GLYQRqrgKN1M38L1aA/QLDQq
 vlDMqngEW+EutpRIeoV9O/HGAysJS4ppUjRvfNvYulYP97UgttTW4I3WmjQ2QTkK6v5v
 PH9btHmQ+UPmJJ5cLpSRa7XtHnbipBewUZWficI5pYojym7moPZl7szsBDrXLDq2AAFI
 WmSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718663292; x=1719268092;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=J0iER+AoYp/pYl5IC7iX81NqnRqAb0NqRg5uJ+M7o3M=;
 b=J3Ig5gLkuwFiMecWLZc8zD97FOSpJD9CDQAk3zynKuI5bHJruOgCtsmiC6hdQEmyAx
 L9FpV6XMUxfzkCEjyjAAJTaVY20UCgarvmIR6RYs9WAd30/3Rn2TdXpsuEppvSwa1tzo
 dgVERpffbgmmbq+C8FtFiyO5IndZJO0+CqRzrw+GLPwkg4/SGotdBvEMTBv+aK1eSnre
 7bS8CPpx7C3tPh33PH2ebspf1KPysjKoO70VK07ACcvLzLAdQaDVlUMqkZpGs0LQeQTZ
 Q+G6Z2cB4qROk6+YW0m56a0XpF+pgFtWFBdxl1iEmMfkStOEOqHbRpHkNXvNPdmim3UH
 V2fA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZifPV1LBwrsQFTDQlSFJrWABnCaKVsdjQ6u7Z8eurHwa8y97no1ZJBa09ZE3sLJ4hnpj4NTwLoR+tIjT15pk7ZDi5OrR5usP704zDL70h
X-Gm-Message-State: AOJu0Yx3GhbQJCDAKkasyQu3L7k3+0wzyeTiOTWoJodGJuv/6WDgH95P
 H4x3F6cFFfpzIcQS7EWSnnepBYKPCEvjTlgF4b7l45KWZTroAku2ihoQ7IPDKlE=
X-Google-Smtp-Source: AGHT+IExoeqK+FXtO8sD+xh9qR9LnDH2/EwcCxojSWh3ywjle5iOXhHXGJHAM0pgnstW0qMzXBZhIA==
X-Received: by 2002:a19:6a02:0:b0:52c:81fc:eba2 with SMTP id
 2adb3069b0e04-52ca6e91456mr6586273e87.44.1718663292293; 
 Mon, 17 Jun 2024 15:28:12 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52ca2884064sm1402377e87.242.2024.06.17.15.28.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jun 2024 15:28:11 -0700 (PDT)
Date: Tue, 18 Jun 2024 01:28:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Marc Gonzalez <mgonzalez@freebox.fr>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 Arnaud Vrac <avrac@freebox.fr>, Pierre-Hugues Husson <phhusson@freebox.fr>
Subject: Re: [PATCH 3/4] drm: bridge: simple-bridge: use only devm* in probe
Message-ID: <deirqqoap7ta3iwmmvg6uxzalfe22yirjp6et2a74ffh5ybi64@vekr6l7sl22c>
References: <20240617-tdp158-v1-0-df98ef7dec6d@freebox.fr>
 <20240617-tdp158-v1-3-df98ef7dec6d@freebox.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240617-tdp158-v1-3-df98ef7dec6d@freebox.fr>
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

On Mon, Jun 17, 2024 at 06:03:01PM GMT, Marc Gonzalez wrote:
> Once probe uses only devm functions, remove() becomes unnecessary.

Breves vibrantesque sententiae

With the hope of getting an expanded commit message:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


> 
> Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
> ---
>  drivers/gpu/drm/bridge/simple-bridge.c | 12 +-----------
>  1 file changed, 1 insertion(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/simple-bridge.c b/drivers/gpu/drm/bridge/simple-bridge.c
> index d672e34970e18..f1e458a15882f 100644
> --- a/drivers/gpu/drm/bridge/simple-bridge.c
> +++ b/drivers/gpu/drm/bridge/simple-bridge.c
> @@ -214,16 +214,7 @@ static int simple_bridge_probe(struct platform_device *pdev)
>  	sbridge->bridge.of_node = dev->of_node;
>  	sbridge->bridge.timings = sbridge->info->timings;
>  
> -	drm_bridge_add(&sbridge->bridge);
> -
> -	return 0;
> -}
> -
> -static void simple_bridge_remove(struct platform_device *pdev)
> -{
> -	struct simple_bridge *sbridge = platform_get_drvdata(pdev);
> -
> -	drm_bridge_remove(&sbridge->bridge);
> +	return devm_drm_bridge_add(dev, &sbridge->bridge);
>  }
>  
>  /*
> @@ -300,7 +291,6 @@ MODULE_DEVICE_TABLE(of, simple_bridge_match);
>  
>  static struct platform_driver simple_bridge_driver = {
>  	.probe	= simple_bridge_probe,
> -	.remove_new = simple_bridge_remove,
>  	.driver		= {
>  		.name		= "simple-bridge",
>  		.of_match_table	= simple_bridge_match,
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
