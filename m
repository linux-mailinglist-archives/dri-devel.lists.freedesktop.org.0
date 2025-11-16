Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F7BDC61655
	for <lists+dri-devel@lfdr.de>; Sun, 16 Nov 2025 14:55:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61A2210E2BC;
	Sun, 16 Nov 2025 13:55:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="tgtvz9P8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCCE610E2BC
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Nov 2025 13:55:32 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-47118259fd8so25039805e9.3
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Nov 2025 05:55:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1763301331; x=1763906131; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iqaGRJ1GY2x6l8dXoAfBLP7/ee6T2P1cW9IpZWUq/iA=;
 b=tgtvz9P8KPAAJaWRMTFAYeucA1AkaO8K8WDE2Mr1d5pmOU/FrBqketuu0X4JllCen7
 +V/pusrGMyTMrsOLF2RLjvgRuOLs8wKhlQ9agcEF2RquFbxk9XA9Ip+hGc1FVG6YtHLW
 IzJg24RH3AVAEyDxPWBZDRYweIwrF0unkynrEXrmYtO50NmpdLOPbAvNWGT+s6OgfksF
 ZL69cpdqL0yhcvZYrJN+OZPQaPJSt8wBYjSnIXwKCfUEYJJ648sEUHglxtm4f6fEmkR9
 g2eooOYeS948IhJW6uKHii5t+bNvO1FHVPHFx/sCXiXHbqn+XdvA6Ft5A2a9LVW0ybNk
 a0WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763301331; x=1763906131;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iqaGRJ1GY2x6l8dXoAfBLP7/ee6T2P1cW9IpZWUq/iA=;
 b=bbNHR/SmV70YRzNYdE568NNOtGCBppolBrpK3nXoxMmMGXwqn+ApGq7lDWGr/YpHtu
 /MSDqqfPSEK4XP33oSRY832hFlNatkjqqU7Qmw2CZXbcLUu4ZnDJIHca3LCIczh7GvgJ
 Pz1mXuZiBa9IzLsrR2jfyZd5UajN4NPrEMagXRklwzIVjejmu7d6SioPgpQizhVnE5rn
 wTbO0AZuWdpzjmfG5P+ZC0jkUCWBIyMeJvgvPrifIBy/VJdm0MXWR+iZltzJnLvXxE1X
 O4TDgBsV930YToBX0n5hxsrlmY7F0H150aBu501PD1Y1pNafohHQ1XZxP9uV2Utj5l0n
 tudg==
X-Gm-Message-State: AOJu0Ywb9+zpy5LSROGDIgMbcvCTZe9EQ18hGOqDZ8G4dWR2fO5fO+AY
 sT5EAHZ/9S9VhFcFhmZA3Ul6JJMNCkEXb0W+lENMRzJ1o80O1M00QTdVYGXq6grfbp0=
X-Gm-Gg: ASbGnctt4ZYuq9qyXMw2y6/wTG8dQ4+0pWATVn5+z8Q9p4k4nHDa9QrBBycPAyjmGs6
 gp92PfDwwX3AYHZP665Ej4unFn59Yd2h2H2gKbmj9t9gptpiaAPVx+cO7s1sRP3lnPHDq2F8BFj
 RUlATzbChiSbUdaCYITA/zeLipZWm58xdRZvGW4cbPbQU81jz5yGkZeo3P/mQ1eUIr62YGXhiAx
 XaUdLcPvcbTku2rYBKolwNAnXEj3vwq4KMQLnQSxvPKmWDJ6xC9y/L8qEHESdwbvCA42t++DqiW
 uY0OMi/4x0mXIcY3ZkkhXQo1HGVNcZ7V5SISfF8yRlGKd+/uD48cA2BW/5wu/ceeew8VHOohEJn
 HWHHWLD2obGKMIYwTmFN5ne+Gpjm4kNllNpb7sUxQT4pPf7dqwjxzeZ/rjSgICNo+XQfqzXCvpE
 xzT/ipGy305CLbzGdkMChDT4vp/AsLydFFaQnTF5dI8ABK
X-Google-Smtp-Source: AGHT+IEUk3DdqvvTuoPw2svj7P8n3jQB7qQ0jl0BLgq51a3AoZNXsza4PugKS3KBfdWLmwJrvek4kA==
X-Received: by 2002:a05:600c:c178:b0:458:a7fa:211d with SMTP id
 5b1f17b1804b1-4778feb2401mr84649915e9.29.1763301331148; 
 Sun, 16 Nov 2025 05:55:31 -0800 (PST)
Received: from [192.168.1.160] (p4fc3ddd7.dip0.t-ipconnect.de.
 [79.195.221.215]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47796a8a695sm94835955e9.13.2025.11.16.05.55.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 16 Nov 2025 05:55:30 -0800 (PST)
Message-ID: <9ef0e4f9-7594-4c26-ab45-38e62a7d0e37@linaro.org>
Date: Sun, 16 Nov 2025 14:55:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/12] dt-bindings: panel: Convert Samsung SOFEF00 DDIC
 into standalone yaml
To: david@ixit.cz, Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Thierry Reding
 <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 phone-devel@vger.kernel.org
References: <20251113-sofef00-rebuild-v2-0-e175053061ec@ixit.cz>
 <20251113-sofef00-rebuild-v2-1-e175053061ec@ixit.cz>
Content-Language: en-US, en-GB
From: Casey Connolly <casey.connolly@linaro.org>
In-Reply-To: <20251113-sofef00-rebuild-v2-1-e175053061ec@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi David,

I may not have added myself to MAINTAINERS when I submitted this driver, 
but a heads-up would have been appreciated before just taking it over!

On 11/13/25 18:57, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>

[...]> diff --git a/MAINTAINERS b/MAINTAINERS
> index 7e015dcbac732..a4b16812d5a0c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -8117,6 +8117,12 @@ S:	Maintained
>   F:	Documentation/devicetree/bindings/display/panel/samsung,s6e3ha8.yaml
>   F:	drivers/gpu/drm/panel/panel-samsung-s6e3ha8.c
>   
> +DRM DRIVER FOR SAMSUNG SOFEF00 DDIC
> +M:	David Heidelberg <david@ixit.cz>

M:	Casey Connolly <casey.connolly@linaro.org>

Please and thanks!
Casey (she/they)

> +S:	Maintained
> +F:	Documentation/devicetree/bindings/display/panel/samsung,sofef00.yaml
> +F:	drivers/gpu/drm/panel/panel-samsung-sofef00.c
> +
>   DRM DRIVER FOR SHARP MEMORY LCD
>   M:	Alex Lanzano <lanzano.alex@gmail.com>
>   S:	Maintained
> 

