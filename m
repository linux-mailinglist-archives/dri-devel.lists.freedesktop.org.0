Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7608FD3C3A3
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 10:34:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE33D10E179;
	Tue, 20 Jan 2026 09:34:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="nJCrlpc1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7652A10E179
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 09:34:13 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 17C514E421A6;
 Tue, 20 Jan 2026 09:34:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id DF445606AB;
 Tue, 20 Jan 2026 09:34:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 86C3810B6B326; Tue, 20 Jan 2026 10:34:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1768901650; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=qe+AEfahHk01ESKOwWCf+etHu+G8g7lg5aM33wBfgds=;
 b=nJCrlpc18FXIy+bDpEEMXn4qNKxag0+u++JGb4SDI3RuVG39aAkNNU014A4ynQFp4NRsDf
 kX75Q/+VlVjI4m/zOvIMtZqwCWx9n4BBH8qn/6ln+fj6pOprXI4gwCLzjHUvFy3ud0quK2
 wFy7eBluAreoBU1sVYYEgTFKaz7olwUKkpX1mGxaYzXor4Qn4ValPWD4tHk6t8De38TiZH
 onOHYWqxz3ZdapsM4WQBLXRclGdUqp+G+B+GWSDCUMmbKOLKU52ooqNBKZysaAO1vg4j3T
 c0gv1Qvy/afBIBf9ZTLXldGYglRe2EMGhRk7uFC65bwKR0HdArnsg+dDwNoCrg==
Message-ID: <fad35d7d-8cb1-468a-9867-ccbcf85db102@bootlin.com>
Date: Tue, 20 Jan 2026 10:34:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/bridge: synopsys: dw-dp: fix error paths of
 dw_dp_bind
To: Osama Abdelkader <osama.abdelkader@gmail.com>, luca.ceresoli@bootlin.com, 
 Andy Yan <andy.yan@rock-chips.com>
Cc: stable@vger.kernel.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260102155553.13243-1-osama.abdelkader@gmail.com>
From: Louis Chauvet <louis.chauvet@bootlin.com>
Content-Language: en-US
In-Reply-To: <20260102155553.13243-1-osama.abdelkader@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
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



On 1/2/26 16:55, Osama Abdelkader wrote:
> Fix several issues in dw_dp_bind() error handling:
> 
> 1. Missing return after drm_bridge_attach() failure - the function
>     continued execution instead of returning an error.
> 
> 2. Resource leak: drm_dp_aux_register() is not a devm function, so
>     drm_dp_aux_unregister() must be called on all error paths after
>     aux registration succeeds. This affects errors from:
>     - drm_bridge_attach()
>     - phy_init()
>     - devm_add_action_or_reset()
>     - platform_get_irq()
>     - devm_request_threaded_irq()
> 
> 3. Bug fix: platform_get_irq() returns the IRQ number or a negative
>     error code, but the error path was returning ERR_PTR(ret) instead
>     of ERR_PTR(dp->irq).
> 
> Use a goto label for cleanup to ensure consistent error handling.
> 
> Fixes: 86eecc3a9c2e ("drm/bridge: synopsys: Add DW DPTX Controller support library")
> Cc: stable@vger.kernel.org
> 
> Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>

> ---
> v3:
> - Add resource leak fixes for all error paths after drm_dp_aux_register()
> - Fix platform_get_irq() error handling bug
> - Use goto pattern for cleanup as suggested by reviewer
> 
> v2:
> - use concise error message
> - add Fixes and Cc tags
> ---
>   drivers/gpu/drm/bridge/synopsys/dw-dp.c | 20 ++++++++++++++------
>   1 file changed, 14 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-dp.c b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
> index 82aaf74e1bc0..432342452484 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
> @@ -2062,33 +2062,41 @@ struct dw_dp *dw_dp_bind(struct device *dev, struct drm_encoder *encoder,
>   	}
>   
>   	ret = drm_bridge_attach(encoder, bridge, NULL, DRM_BRIDGE_ATTACH_NO_CONNECTOR);
> -	if (ret)
> +	if (ret) {
>   		dev_err_probe(dev, ret, "Failed to attach bridge\n");
> +		goto unregister_aux;
> +	}
>   
>   	dw_dp_init_hw(dp);
>   
>   	ret = phy_init(dp->phy);
>   	if (ret) {
>   		dev_err_probe(dev, ret, "phy init failed\n");
> -		return ERR_PTR(ret);
> +		goto unregister_aux;
>   	}
>   
>   	ret = devm_add_action_or_reset(dev, dw_dp_phy_exit, dp);
>   	if (ret)
> -		return ERR_PTR(ret);
> +		goto unregister_aux;
>   
>   	dp->irq = platform_get_irq(pdev, 0);
> -	if (dp->irq < 0)
> -		return ERR_PTR(ret);
> +	if (dp->irq < 0) {
> +		ret = dp->irq;
> +		goto unregister_aux;
> +	}
>   
>   	ret = devm_request_threaded_irq(dev, dp->irq, NULL, dw_dp_irq,
>   					IRQF_ONESHOT, dev_name(dev), dp);
>   	if (ret) {
>   		dev_err_probe(dev, ret, "failed to request irq\n");
> -		return ERR_PTR(ret);
> +		goto unregister_aux;
>   	}
>   
>   	return dp;
> +
> +unregister_aux:
> +	drm_dp_aux_unregister(&dp->aux);
> +	return ERR_PTR(ret);
>   }
>   EXPORT_SYMBOL_GPL(dw_dp_bind);
>   

