Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 848DA95DF0A
	for <lists+dri-devel@lfdr.de>; Sat, 24 Aug 2024 18:44:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4039897C8;
	Sat, 24 Aug 2024 16:44:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="C7sjQa+a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7288897C8
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Aug 2024 16:44:32 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-202146e93f6so30626775ad.3
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Aug 2024 09:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724517872; x=1725122672; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
 :reply-to; bh=rMJqxsXbKdshmWc6Vt4OVDWOFw/ne4JO6chf1aTJxRg=;
 b=C7sjQa+a3RKb4hjxg1kNADvPjzCDjTdl3+Uf7nKuv0IkHUSyMXuS+UQ+cKwxXsa36L
 9RgvL20YsGHRN+3u2GBPqHEsfpuo2jiY9wi8QpwyrKr2lDNHPYvLG8Hr9pvvsXPFXbhg
 0Tda6atB3f4lX05t6EwsfnJ13jmeEwL+KDZuvrd40X0Q8o8+xVXFarrzliUA1nP/wI4w
 CDHhZX2IcTm86nfNExzYpPt+gOSwtv7aZ+vB0lavgQvU34RAGPTZgamF7Yut3Aqw9Vjm
 3nksQUbit4YqmB68FH1OZzdvvnS0gnSdRerhpVFH0jOFF6OPX6BwOdA4lS7h7EDx15w2
 f2eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724517872; x=1725122672;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rMJqxsXbKdshmWc6Vt4OVDWOFw/ne4JO6chf1aTJxRg=;
 b=XC55kiVnh3Bkp3KtGrAKbbzBaVJx7HrCcaxCa/GZAtAx19A64yPKCq+HiUFy8QgRB7
 /O2OCOiMT5e188dYCBMguCTt8/dS1VZedexHk+aHpvHy8izFez5R7MjYjHtUEAC8aoTI
 xfRyYE5nyFeqbr6IqeigpRNeePJxNHbmD87SAQd6RL2lY/C94oN8JVlE3I20iyIGDUfa
 g+Ti5yta+pW5dYtEqT3s61s2KnaUsK055qLcNdUWi0uzslXRoTmDFLwNWDTsVwNHJzX8
 imiy3e6CxXIrB2EVEEB90rckUpOc5yrOaF4wDYS02EWMpvE0KHzJKmzToDR3thN+SL2Q
 Fyrw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWJTEEWfU0jsqWHaUzhIzovfWfwHT7hRT2iil4vGNSKb2LA5tt+EutOWUq/h3mUb8Vis5uuAf6UxfY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yys44rQscA7nnQDNMPWZ//IRcUf/fGCJcSus8USg/6QVQFivBAg
 yBei/PxSWnsO22NbFLHJrAwDaLjZiHuAND1atKCOiEwM40ySQEJw
X-Google-Smtp-Source: AGHT+IHcYVQoDXdmHH2kSyn3hjnKQGyb2SXXwv2a+G7g13SX+ywaROxz6n48bYMEHtMXrfqxmEat4A==
X-Received: by 2002:a17:902:e750:b0:202:401f:ec6c with SMTP id
 d9443c01a7336-2039e4f1d23mr66486985ad.48.1724517872012; 
 Sat, 24 Aug 2024 09:44:32 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-20385bdc5e0sm44114565ad.271.2024.08.24.09.44.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Aug 2024 09:44:31 -0700 (PDT)
Date: Sat, 24 Aug 2024 09:44:29 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Detlev Casanova <detlev.casanova@collabora.com>
Cc: linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Andi Shyti <andi.shyti@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Lee Jones <lee@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Mark Brown <broonie@kernel.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Chris Morgan <macromorgan@hotmail.com>,
 Jonas Karlman <jonas@kwiboo.se>, Tim Lunn <tim@feathertop.org>,
 Chukun Pan <amadeus@jmu.edu.cn>, Andy Yan <andyshrk@163.com>,
 Muhammed Efe Cetin <efectn@protonmail.com>,
 Jagan Teki <jagan@edgeble.ai>, Dragan Simic <dsimic@manjaro.org>,
 Ondrej Jirman <megi@xff.cz>,
 Michael Riesch <michael.riesch@wolfvision.net>,
 Jimmy Hon <honyuenkwun@gmail.com>, Alexey Charkov <alchark@gmail.com>,
 Elon Zhang <zhangzj@rock-chips.com>,
 Elaine Zhang <zhangqing@rock-chips.com>,
 Yifeng Zhao <yifeng.zhao@rock-chips.com>,
 Finley Xiao <finley.xiao@rock-chips.com>,
 Liang Chen <cl@rock-chips.com>, Jisheng Zhang <jszhang@kernel.org>,
 Jamie Iles <jamie@jamieiles.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-i2c@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-watchdog@vger.kernel.org,
 kernel@collabora.com
Subject: Re: [PATCH v2 09/12] dt-bindings: watchdog: Add rockchip,rk3576-wdt
 compatible
Message-ID: <612a447c-8a74-48c1-8470-280dddca8d19@roeck-us.net>
References: <20240823150057.56141-1-detlev.casanova@collabora.com>
 <20240823150057.56141-10-detlev.casanova@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240823150057.56141-10-detlev.casanova@collabora.com>
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

On Fri, Aug 23, 2024 at 10:52:36AM -0400, Detlev Casanova wrote:
> It is compatible with the other rockchip SoCs.
> 
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>

Acked-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml b/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml
> index c7aab0418a320..b5a3dc3770706 100644
> --- a/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml
> @@ -29,6 +29,7 @@ properties:
>                - rockchip,rk3368-wdt
>                - rockchip,rk3399-wdt
>                - rockchip,rk3568-wdt
> +              - rockchip,rk3576-wdt
>                - rockchip,rk3588-wdt
>                - rockchip,rv1108-wdt
>            - const: snps,dw-wdt
> -- 
> 2.46.0
> 
