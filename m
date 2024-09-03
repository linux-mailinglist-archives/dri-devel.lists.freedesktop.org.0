Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA0B96A378
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 17:59:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D649910E5E0;
	Tue,  3 Sep 2024 15:59:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=detlev.casanova@collabora.com header.b="Ac12rxJA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 799A710E5E0
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2024 15:59:50 +0000 (UTC)
Delivered-To: kernel@collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1725379180; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=j7W+b6AKvTMiIp6zna4Phg0s4BvUKBWwdAFzlwD3yxdkmVUkgV226jpfwFtqSnDngKmtHC+J7XRYl8JW2CIzT+6R75rfSvJcjxQWa1Wq6r4Y072X5au/IhhR2Ns+1JfYil09hrhbCUwbjSryQHWoitBwp9GhbbmGfjbi1rRjXpo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1725379180;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=Y/bWoW06nAsYTfJtM+dT/HctpDxY0caM4f/6npCsav4=; 
 b=DcW7jXgOcrFG/T624VWQk524Qc6OWhcUZEOuq3jWESy+mGhMRYwyU7e1HN8UpN3SCobwVQfoDwm4wzZjDixTbMdVhXzlT9CIHinwkBQ++b3/CyFL3ixd6ss1EkX4Eg206IxLCgU3rPE4ZtZ0b6sTb12nF+TWspPK08mxkCjwoe0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=detlev.casanova@collabora.com;
 dmarc=pass header.from=<detlev.casanova@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1725379180; 
 s=zohomail; d=collabora.com; i=detlev.casanova@collabora.com; 
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
 bh=Y/bWoW06nAsYTfJtM+dT/HctpDxY0caM4f/6npCsav4=;
 b=Ac12rxJAuHEgPBTE7VP5gB/POfoA00l1p6G5Zru/RUnCEnF0JMRTpamew0P3lFkd
 Kmp0V2A6Pr3m+MYabAm8YPJ2kp/8Df8UEX9lknMggWnKDWx5PMLTQ0U7/hKfn9+c9JH
 EfnVDwwoeFI4x+D5sUdaCgyo0qwqF8W/rMY+FWR0=
Received: by mx.zohomail.com with SMTPS id 1725379178937833.0492919077691;
 Tue, 3 Sep 2024 08:59:38 -0700 (PDT)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Mark Brown <broonie@kernel.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>, Chris Morgan <macromorgan@hotmail.com>,
 Jonas Karlman <jonas@kwiboo.se>, Tim Lunn <tim@feathertop.org>,
 Andy Yan <andyshrk@163.com>, Muhammed Efe Cetin <efectn@protonmail.com>,
 Jagan Teki <jagan@edgeble.ai>, Dragan Simic <dsimic@manjaro.org>,
 Ondrej Jirman <megi@xff.cz>, Michael Riesch <michael.riesch@wolfvision.net>,
 Jimmy Hon <honyuenkwun@gmail.com>, Elon Zhang <zhangzj@rock-chips.com>,
 Alexey Charkov <alchark@gmail.com>, Elaine Zhang <zhangqing@rock-chips.com>,
 Yifeng Zhao <yifeng.zhao@rock-chips.com>,
 Finley Xiao <finley.xiao@rock-chips.com>, Liang Chen <cl@rock-chips.com>,
 Jamie Iles <jamie@jamieiles.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-i2c@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-watchdog@vger.kernel.org, kernel@collabora.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v4 3/9] dt-bindings: i2c: i2c-rk3x: Add rk3576 compatible
Date: Tue, 03 Sep 2024 11:59:34 -0400
Message-ID: <12506188.O9o76ZdvQC@bootstrap>
In-Reply-To: <bnpwnuhikwkqyf3jos67qwywhfge3vm6tfmlfitypd5k62jzdn@fri4swkl2zbq>
References: <20240903152308.13565-1-detlev.casanova@collabora.com>
 <20240903152308.13565-4-detlev.casanova@collabora.com>
 <bnpwnuhikwkqyf3jos67qwywhfge3vm6tfmlfitypd5k62jzdn@fri4swkl2zbq>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-ZohoMailClient: External
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

Hello,

On Tuesday, 3 September 2024 11:46:00 EDT Andi Shyti wrote:
> Hi,
> 
> On Tue, Sep 03, 2024 at 11:22:33AM GMT, Detlev Casanova wrote:
> > Just like RK356x and RK3588, RK3576 is compatible to the existing
> > rk3399 binding.
> > 
> > Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> > Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > Acked-by: Heiko Stuebner <heiko@sntech.de>
> 
> I will apply this after 1 and 2 have been merged.

Sure, although it is not really dependent on 1 and 2.

> BTW, who is maintaining rockchip.yaml?

Heiko Stuebner is the maintainer of Rockchip SoC support.

> Thanks,
> Andi
> 
> > ---
> > 
> >  Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml
> > b/Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml index
> > 82b9d6682297..a9dae5b52f28 100644
> > --- a/Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml
> > +++ b/Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml
> > 
> > @@ -38,6 +38,7 @@ properties:
> >                - rockchip,rk3308-i2c
> >                - rockchip,rk3328-i2c
> >                - rockchip,rk3568-i2c
> > 
> > +              - rockchip,rk3576-i2c
> > 
> >                - rockchip,rk3588-i2c
> >                - rockchip,rv1126-i2c
> >            
> >            - const: rockchip,rk3399-i2c




