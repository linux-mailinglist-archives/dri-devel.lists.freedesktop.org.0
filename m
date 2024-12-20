Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1577A9F88E7
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 01:18:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E93410E36A;
	Fri, 20 Dec 2024 00:18:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="b5fS708F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6719210E36A
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2024 00:18:29 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-5401bd6ccadso1267319e87.2
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2024 16:18:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734653908; x=1735258708; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=JdEM25avAV3Wk0/A8V/RskskKqNdHIG3q8iPcW7Zhuw=;
 b=b5fS708F0atxjM3YzQEwdy/5qxcIvFtfC1/dfqT/W2MFOLKLx6oe9hNX6Aam7T7Dt2
 7EKccgGqXMrCpd9cXToq0BuTCltyPq2IEK+EqWjVJXsxyHXY72KlIbPkJgSA0A+SIt0o
 RGyxeh8ZuHB5diNoMi+FNaeXh4I2rD1YUYWQBUPEwhmnQGLDje9QlVvCmu8/XWPZprb8
 /Q06fUc/pj4bedGelL+hLXFasnz1VSpLJydf5t0kYP3tPnrMotHlAqkmbuVO/Nr0M2r7
 CQhtb1WdPndcCQgI2QREAgHfG3/uSAG+q9z8ToXr24TfWTpNTsDhgXNuwILiaC9rDQpy
 NpJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734653908; x=1735258708;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JdEM25avAV3Wk0/A8V/RskskKqNdHIG3q8iPcW7Zhuw=;
 b=w9GRHvD0tiQVq4Zr30KHtGo4Rm2mLpsip0lCCiZTv5sai7RkAZnCo0h6XgQI62/2Y2
 +DGT7uE5rianOLsLIVSMeziEs4w+qeWTgQZ+6lswFnNR9AFHQGNEA9NQHAU7oEhId0kX
 j5oD53SAPld0FxmvZybPsYIHsMlFzYxgIE/zLTCcxgfClRzLrhbipYPETuxu4zwiiB2R
 cDDdFi8rmHwPT+IgvD/TzGBfE2zAJDMAq4VZN4bMNxwhIGQJ0FHe724w56TR4zwPwlLj
 G7o1ktRXgVlZmh6Rd0WZj6mfO0vZU/H/IgwaNPx7pxVaKeXphmXhOGkNabrO/BdPRnWo
 4bFw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU0NiW/1DlMftKjPrkt59JVDvGy8rlhnz3J1IsoVtPUYD0U4jBlig9ZcnXYHNYahabBH5VuaSrzNmE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwjWUp5w31JDY/ipobtZvBzdcN/olw4Dl58lirT36SHv7G7JYdu
 vp17wdHUwpqhZrd0iZmiDkAfzd/kqLenLgo3IdIPbKe6RPuf4i+ncgRVOm5obgc=
X-Gm-Gg: ASbGncusu9Wc5cfYA98k6IxOjHYxOmRl31ZbWFmue+rvBDkgnjcVZyqIwDl0PJ/BGkM
 R/cmT3y/r1Q9POEqtc5VtCdr4+C1Kcpnk8fuudp2Of06HqPOLVLVDo9GZdFuhoi+NfwqPIAoRZS
 OZsZtX0MeBAbbIZWOJDZrg7sMGEtZL74GAeh6grkt9FIlSYiCwSo3SseJ65Z2SgyjS8aCT7LIUS
 Gj2FRriqKhG4fjl8FhhRRYQpKTC5Pmi6UkU/Cm25FNlmfTYyY/SS5Z1/+CmPU9jT4D3sJoN04XT
 jT4uYVmJLTQIsUcSIIX0JyhK0szfgr7dJ/vF
X-Google-Smtp-Source: AGHT+IHaBhOQ2F/tQJgKM89Gv/3h/pUJDiIxhbwnt6itHhtFdLYkVHk0tzYt/YbigfNxUGxwQcqftw==
X-Received: by 2002:a05:6512:3d16:b0:540:1b2d:8ee1 with SMTP id
 2adb3069b0e04-54229522508mr159038e87.11.1734653907712; 
 Thu, 19 Dec 2024 16:18:27 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-542238135basm315388e87.130.2024.12.19.16.18.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Dec 2024 16:18:26 -0800 (PST)
Date: Fri, 20 Dec 2024 02:18:24 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, rfoss@kernel.org, vkoul@kernel.org, 
 sebastian.reichel@collabora.com, cristian.ciocaltea@collabora.com,
 l.stach@pengutronix.de, 
 andy.yan@rock-chips.com, hjc@rock-chips.com, algea.cao@rock-chips.com, 
 kever.yang@rock-chips.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH v3 10/15] dt-bindings: display: rockchip: analogix-dp:
 Add support to get panel from the DP AUX bus
Message-ID: <bjkcue3dfgaf5i66cqbiczifo7r3xngupghklxgevwqpwfeeix@i2jfd477igri>
References: <20241219080604.1423600-1-damon.ding@rock-chips.com>
 <20241219080604.1423600-11-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241219080604.1423600-11-damon.ding@rock-chips.com>
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

On Thu, Dec 19, 2024 at 04:05:59PM +0800, Damon Ding wrote:
> According to Documentation/devicetree/bindings/display/dp-aux-bus.yaml,
> it is a good way to get panel through the DP AUX bus.
> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> ---
>  .../bindings/display/rockchip/rockchip,analogix-dp.yaml        | 3 +++
>  1 file changed, 3 insertions(+)

Business before pleasure.^W^W^W Bindings before the driver.

> 
> diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml
> index 4f84e8849876..c45d92a2d901 100644
> --- a/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml
> +++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml
> @@ -49,6 +49,9 @@ properties:
>      description:
>        This SoC makes use of GRF regs.
>  
> +  aux-bus:
> +    $ref: /schemas/display/dp-aux-bus.yaml#
> +
>  required:
>    - compatible
>    - clocks
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
