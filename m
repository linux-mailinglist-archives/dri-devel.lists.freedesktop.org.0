Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E43A07617
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 13:49:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CDC610EDB3;
	Thu,  9 Jan 2025 12:49:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="XmOxIdX4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D81C10EDB3
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2025 12:49:20 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-3022484d4e4so8528081fa.1
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Jan 2025 04:49:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736426898; x=1737031698; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=h8hd6QQPe6WsmCvGJJcJ/fM8HdXFIRmyRc/10BLVlxA=;
 b=XmOxIdX4mSa5XY3gwJ7Fv3DmA/cYtZ2WorgKcVRNxKMo/otcNTFGRbcJ5fd2ntTY2c
 5jqNbGD5MxtYJj3EQ8h7lCqXCZ+rXW5Q9S1K48ZttA5uDI5WidZnQbBECLMcqqkF5E4j
 jYt57h0yE41svKFuBuWDe3jrKhAaz3s6hMJZkvCTk8rf690zzsXUoGhL1zfoNZWaLCUO
 Xv6O6gFQsRELKiD/PgYGA2+U0vEzQTQRUb8gPy+zMRtqkYSJ+QesO7maVueBt5qF+uKZ
 HWgyRCC/f3EvfFqmsjS9ik0jVcFG62OSV8CrEjozPDLW9psI9qHiBcnM7nRlZHXG9b8q
 UV3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736426898; x=1737031698;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h8hd6QQPe6WsmCvGJJcJ/fM8HdXFIRmyRc/10BLVlxA=;
 b=CxnS7R+IcYYjZSFhihK1/o5/W1YhYIlZDpMxWRrDr/tkCMy+VrUxNR80IhKwcdwsIT
 VYVM0thpVqX8zA1vY9oUOiufucgJEo2k9K5nUEFH6fCsFpKS4nGyvaBio8x07Y+cyYCB
 9K+UW9JKg+78sq7VjPi9ivqsHrPHWGHd4Moxaqa/PmnscVKPcxBtli07QKoyiAF7QJsK
 6F3g6PniAZWzns8cbEjHdWYQAuHTwngEnJpRRAvy+/4/gp3yPOYKr3sl+IAxLAXPdwOy
 r486hh2YM2MrEO4BoBjY/1wdTdbQZIpi+yd1vDc8yeIKDWraxCFqdJLBpkf/LKMUD9+9
 /Rnw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV3OpQo3OJ1zezdILr981XP66m6isVMivaVZa2OR1QtDFLLRQ5KtqTYYb2znbt4+IOqhDq6oxqsR/U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz2tpPcUUL/ONzs1RcdRANUAHLo/HPvOfgc/Q9jjZzQIYkq0UJn
 fATKc/yqp9bnrLgpaZMUjQ8KKzRhLM37y87qNu0E/M6EBtNJQ4o+yW/lrt8OAig=
X-Gm-Gg: ASbGncvczYBPzxAYWIfFPcPWfaXUbEJ0hUCypEDhekQ6WrC8/Mz27IPhu5tg1CRk5wY
 OH6M4kT7XDR1xJsvhB+4oSjqqeSkGo/sRsBafCBAQkPy/cDR/gLQ7QvT/GCgIUBwCLl+tyOPgJg
 ZvAz7Umsf21loEMQRUzVdFgrW6cyrpiFZjYKwtYGLW6O5myiSZ+/l/yhmdJ7P6pEpIT0oNneHsm
 18upTxfZ94h1GVbns4RxUra9a+gCc8jNyvO9H2sI78AOXnthNLBdnjOTh71mmxPAhTB3z/TxAf7
 CsiHUWTl3xFypDF40U/0nATWJoO29jWNXh4V
X-Google-Smtp-Source: AGHT+IFxJ3zGC3CDmY37DlIYBY9oRzAVUXgzKckNzpAHdg+Ck4ZfBSulYaV0hud+81kqukRgXfjP1g==
X-Received: by 2002:a2e:a7ca:0:b0:302:1c90:58ee with SMTP id
 38308e7fff4ca-305f4571db2mr17630521fa.18.1736426898468; 
 Thu, 09 Jan 2025 04:48:18 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-305ff1ec1a0sm1889261fa.105.2025.01.09.04.48.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jan 2025 04:48:17 -0800 (PST)
Date: Thu, 9 Jan 2025 14:48:15 +0200
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
Subject: Re: [PATCH v5 12/20] drm/rockchip: analogix_dp: Add support to get
 panel from the DP AUX bus
Message-ID: <d7zpv6qt52mhny54dejw4yqlp2k2c437op7qmepqe27pufplqk@64xvohrz7h2q>
References: <20250109032725.1102465-1-damon.ding@rock-chips.com>
 <20250109032725.1102465-13-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250109032725.1102465-13-damon.ding@rock-chips.com>
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

On Thu, Jan 09, 2025 at 11:27:17AM +0800, Damon Ding wrote:
> Move drm_of_find_panel_or_bridge() a little later and combine it with
> component_add() into a new function rockchip_dp_link_panel(). The function
> will serve as done_probing() callback of devm_of_dp_aux_populate_bus(),
> aiding to support for obtaining the eDP panel via the DP AUX bus.
> 
> If failed to get the panel from the DP AUX bus, it will then try the other
> way to get panel information through the platform bus.
> 
> In addition, use dev_err() instead of drm_err() in rockchip_dp_poweron()
> , which will be called before rockchip_dp_bind().
> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> 
> ---
> 
> Changes in v4:
> - Use done_probing() to call drm_of_find_panel_or_bridge() and
>   component_add() when getting panel from the DP AUX bus
> 
> Changes in v5:
> - Use the functions exported by the Analogix side to get the pointers of
>   struct analogix_dp_plat_data and struct drm_dp_aux.
> - Use dev_err() instead of drm_err() in rockchip_dp_poweron().
> 
> ---
>  .../gpu/drm/rockchip/analogix_dp-rockchip.c   | 41 ++++++++++++++-----
>  1 file changed, 30 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
> index 0957d3c5d31d..3ae01b870f49 100644
> --- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
> +++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
> @@ -124,13 +124,13 @@ static int rockchip_dp_poweron(struct analogix_dp_plat_data *plat_data)
>  
>  	ret = clk_prepare_enable(dp->pclk);
>  	if (ret < 0) {
> -		drm_err(dp->drm_dev, "failed to enable pclk %d\n", ret);
> +		dev_err(dp->dev, "failed to enable pclk %d\n", ret);


why?

>  		return ret;
>  	}
>  
>  	ret = rockchip_dp_pre_init(dp);
>  	if (ret < 0) {
> -		drm_err(dp->drm_dev, "failed to dp pre init %d\n", ret);
> +		dev_err(dp->dev, "failed to dp pre init %d\n", ret);
>  		clk_disable_unprepare(dp->pclk);
>  		return ret;
>  	}

-- 
With best wishes
Dmitry
