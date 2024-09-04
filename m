Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DAB596B5DF
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2024 11:04:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A45A210E702;
	Wed,  4 Sep 2024 09:04:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="JC29RkmC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F9E289E3F
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2024 09:04:01 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-533461323cdso7914405e87.2
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Sep 2024 02:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725440639; x=1726045439; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=VmQy5zQDwB4nsVKI8DoKvh2uGkGTF3leB8WANPPmgZI=;
 b=JC29RkmCkmtApmz6qujvi8tLPxDsUTiF081rMmYMKNxVYt99xCHWFiEATQC1KZQoGq
 I8bP0dB60bMKehBE+ArFmtfvOjk/mHXzQn3BqtlCuRRwEDsmtnz5gWr3XIX0j5ntxOmu
 Gkvk5QXjRDyWMRRf3gow7tscdvOzpIyaAmksCqfcHn0TaJqBIapuDv0c00qBIBZNkptO
 tgLsBrKnpKYctC7V1oMFeEvBOAAlL2GiuHrAM3EgBN53EF1OfZa2QkRKUJ3wVFr+3odI
 2m96hEkcinrYILBG5qpkjnGznje3T+ggj78C/ORC4vgdZVqdIKB7ndhnfdt5KQanhNoz
 qqYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725440639; x=1726045439;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VmQy5zQDwB4nsVKI8DoKvh2uGkGTF3leB8WANPPmgZI=;
 b=kqvzQwmkbf3JPFXVXT6Kego+FDK44dSBJ6zLWltJChlbCGpRGGFC92VrVOkLGbEnt8
 8uoW6cnhPQNiLGNq7rY7DCgvqKzKPXwYosMSbsCaxTjRrwLWEw/e8q40e8O8h6LX/rkE
 3RgOxa9O/jtoIjgoSRxQyFoZgWTNA2zrAfVq3xM7ahmJInv0rb8BD07xKHDR/JMNAGxB
 ShQlKLrpphJxw1OnWHFWNOMsm6a5TElYEsrf6dazrQY8ndlq6eoK9ipnGCJJl3ed23tN
 JDUsxy5s+/71qt7g3a+zo4YZG2x3cqQgeCs15lyZyPpw3odf1VHzmD2cjBuPF5AkhrzH
 LHKQ==
X-Gm-Message-State: AOJu0YzKrze12UizS/CwtUAIHgL5tWfzBaTgWgvTUPn0ic/Y97MusUdv
 KBYZpf0JAGIeo3sUGVTPtrudqm7yn7CZ3zafWxvpV1jrl9k9lH+SFbqwew8w9Zw=
X-Google-Smtp-Source: AGHT+IGFEmqMH4a8JPotkpD4OzB0Q8n8rx9dVQxX5Tum8Vve+8vCNcg+62zXAKb/eb8y0qfcb4YGkg==
X-Received: by 2002:a05:6512:12c8:b0:52c:e0fb:92c0 with SMTP id
 2adb3069b0e04-53546b3fde1mr11266599e87.34.1725440638031; 
 Wed, 04 Sep 2024 02:03:58 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53568923404sm98138e87.297.2024.09.04.02.03.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2024 02:03:57 -0700 (PDT)
Date: Wed, 4 Sep 2024 12:03:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jani Nikula <jani.nikula@intel.com>
Cc: dri-devel@lists.freedesktop.org, Marc Gonzalez <mgonzalez@freebox.fr>, 
 Robert Foss <rfoss@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: Re: [PATCH] drm/bridge/tdp158: fix build failure
Message-ID: <qc2tixiicn26oqimypl4zxgtgkncil22hvo2nsrmim7yhmzoq4@jjp2gz6jmosg>
References: <20240904085206.3331553-1-jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240904085206.3331553-1-jani.nikula@intel.com>
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

On Wed, Sep 04, 2024 at 11:52:06AM GMT, Jani Nikula wrote:
> ARCH=arm build fails with:
> 
>   CC [M]  drivers/gpu/drm/bridge/ti-tdp158.o
> ../drivers/gpu/drm/bridge/ti-tdp158.c: In function ‘tdp158_enable’:
> ../drivers/gpu/drm/bridge/ti-tdp158.c:31:9: error: implicit declaration of function ‘gpiod_set_value_cansleep’ [-Werror=implicit-function-declaration]
>    31 |         gpiod_set_value_cansleep(tdp158->enable, 1);
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~
> ../drivers/gpu/drm/bridge/ti-tdp158.c: In function ‘tdp158_probe’:
> ../drivers/gpu/drm/bridge/ti-tdp158.c:80:26: error: implicit declaration of function ‘devm_gpiod_get_optional’; did you mean ‘devm_regulator_get_optional’? [-Werror=implicit-function-declaration]
>    80 |         tdp158->enable = devm_gpiod_get_optional(dev, "enable", GPIOD_OUT_LOW);
>       |                          ^~~~~~~~~~~~~~~~~~~~~~~
>       |                          devm_regulator_get_optional
> ../drivers/gpu/drm/bridge/ti-tdp158.c:80:65: error: ‘GPIOD_OUT_LOW’ undeclared (first use in this function)
>    80 |         tdp158->enable = devm_gpiod_get_optional(dev, "enable", GPIOD_OUT_LOW);
>       |                                                                 ^~~~~~~~~~~~~
> ../drivers/gpu/drm/bridge/ti-tdp158.c:80:65: note: each undeclared identifier is reported only once for each function it appears in
> 
> Add the proper gpio consumer #include to fix this, and juggle the
> include order to be a bit more pleasant on the eye while at it.
> 
> Fixes: a15710027afb ("drm/bridge: add support for TI TDP158")
> Cc: Marc Gonzalez <mgonzalez@freebox.fr>
> Cc: Robert Foss <rfoss@kernel.org>
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/bridge/ti-tdp158.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
