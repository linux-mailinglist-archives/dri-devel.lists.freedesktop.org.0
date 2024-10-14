Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DF2499C1C7
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2024 09:44:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C662710E3A8;
	Mon, 14 Oct 2024 07:44:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="nnXDgqL8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A42A10E3A8
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 07:44:36 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-539f0f9ee49so922840e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 00:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728891874; x=1729496674; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=712c5FyvCZ48tk6arDhkoFcc2zKpp/plaCLZzk2XSM8=;
 b=nnXDgqL8VTih15P2Lw/3GUQ37sFY7TAn2rY8qDDsP/l+G75NMVzeCAOk83W8um5eaE
 9tCxPbz0DhsFX+3YUufpNveJQjpiwUFwgB2nQi9YaDV2kPZKDDRpuAgarZqN4JUeu7qC
 OQVfvuTRH1MLDGmq/vnXQ296q2maFPwHUNPvLrzZdiDkPDGs4OEmDxDTA3Sqo0zbpT3x
 6tf8d/gyfBVs9hDnc2ElPoVMH33/YG0ccUKKAvuAYWxZOS4otXoYxIhOv6Tltbauj7mD
 zKHkYZTvLZ8kQ8hMCIBZCs4vo8CopUP+YnjhgF9cMSjg1kGQd6EJiyEI12e8yU/VckV3
 kKWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728891874; x=1729496674;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=712c5FyvCZ48tk6arDhkoFcc2zKpp/plaCLZzk2XSM8=;
 b=XKtgAerlmd3aGwESHT+4JC6hMeVkru+QPat3Qivo4EupPhw6W+paxicdb1CMZ0mXch
 CMznK/SJOU+JrDc9EFF/wjkUY2WcOZylSjDlwcZdzSnHRzuuNMqqViuzyQfeAHojhoEz
 Hcg9mk5JmuDhWcV7CQQxjjuP8aw3RD0mHsWOTp2jsrOmXH2jQfWkUtAWUm19dd7iiKHj
 5RgXo3ZXURuWObe95y0CJLHFHCU/l4UywaKQxf2+rOpY0ouwGHFldsUEZoTXCLGzpLrh
 bZpIC/G4dH5Sovx+SdiB2lhbFw0SJ7eP51t7oGQcfisCjYf6DCZwD3TkmWASPFsuItwY
 bLoQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX7cz+BMMIjD6idf393qPTSVoNE5e1Y2AYAcmR8eJxaj4LUZDFeCLSbhvNH4SvG0wA8ZbMsyEzAZic=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw1TPHQieayRATPphIzQcbbOpl74qfyq1LnWjT0uj84+SpbwTQW
 oNEEzFC/y3tbVtAJON7GR4Zo9Md7O2skHqa/pWaTleuUdfd+rBiIBCYi1rJiswc=
X-Google-Smtp-Source: AGHT+IFT9rp0tyhuFf/cf5YGInYm93VZLRSOjyCVDuwPz3bf8zP9LLRqvJPW3F7vW5Lxz1yopbTLyw==
X-Received: by 2002:a05:6512:2255:b0:539:968a:9196 with SMTP id
 2adb3069b0e04-539da56b4b5mr4281084e87.48.1728891874449; 
 Mon, 14 Oct 2024 00:44:34 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-539db3612c7sm1181418e87.131.2024.10.14.00.44.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Oct 2024 00:44:34 -0700 (PDT)
Date: Mon, 14 Oct 2024 10:44:32 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Wadim Egorov <w.egorov@phytec.de>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, 
 simona@ffwll.ch, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, bbrezillon@kernel.org, conor+dt@kernel.org,
 krzk+dt@kernel.org, robh@kernel.org, upstream@lists.phytec.de
Subject: Re: [PATCH v2 2/2] drm/bridge: sii902x: Set input bus format based
 on bus-width
Message-ID: <yhn2467hxdsfootza7rdgi3ixqzbyadfd2zeijzqddzevxkwdq@ylk63q4biwqk>
References: <20241007085213.2918982-1-w.egorov@phytec.de>
 <20241007085213.2918982-3-w.egorov@phytec.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241007085213.2918982-3-w.egorov@phytec.de>
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

On Mon, Oct 07, 2024 at 10:52:13AM +0200, Wadim Egorov wrote:
> Introduce a bus-width property to define the number of parallel RGB
> input pins connected to the transmitter. The input bus formats are updated
> accordingly. If the property is not specified, default to 24-bit bus-width.
> 
> Signed-off-by: Wadim Egorov <w.egorov@phytec.de>
> ---
> v2:
>   - Use bus-width instead of data-lines as suggested by Krzysztof
>   - Handle default case separately as an error case
> ---
>  drivers/gpu/drm/bridge/sii902x.c | 28 +++++++++++++++++++++++++++-
>  1 file changed, 27 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bridge/sii902x.c b/drivers/gpu/drm/bridge/sii902x.c
> index 7f91b0db161e..3b9e4e1dec45 100644
> --- a/drivers/gpu/drm/bridge/sii902x.c
> +++ b/drivers/gpu/drm/bridge/sii902x.c
> @@ -180,6 +180,8 @@ struct sii902x {
>  	struct gpio_desc *reset_gpio;
>  	struct i2c_mux_core *i2cmux;
>  	bool sink_is_hdmi;
> +	u32 bus_width;
> +
>  	/*
>  	 * Mutex protects audio and video functions from interfering
>  	 * each other, by keeping their i2c command sequences atomic.
> @@ -477,6 +479,8 @@ static u32 *sii902x_bridge_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
>  						     u32 output_fmt,
>  						     unsigned int *num_input_fmts)
>  {
> +
> +	struct sii902x *sii902x = bridge_to_sii902x(bridge);
>  	u32 *input_fmts;
>  
>  	*num_input_fmts = 0;
> @@ -485,7 +489,20 @@ static u32 *sii902x_bridge_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
>  	if (!input_fmts)
>  		return NULL;
>  
> -	input_fmts[0] = MEDIA_BUS_FMT_RGB888_1X24;
> +	switch (sii902x->bus_width) {
> +	case 16:
> +		input_fmts[0] = MEDIA_BUS_FMT_RGB565_1X16;
> +		break;
> +	case 18:
> +		input_fmts[0] = MEDIA_BUS_FMT_RGB666_1X18;
> +		break;
> +	case 24:
> +		input_fmts[0] = MEDIA_BUS_FMT_RGB888_1X24;
> +		break;
> +	default:
> +		return NULL;
> +	}
> +
>  	*num_input_fmts = 1;
>  
>  	return input_fmts;
> @@ -1167,6 +1184,15 @@ static int sii902x_probe(struct i2c_client *client)
>  		return PTR_ERR(sii902x->reset_gpio);
>  	}
>  
> +	endpoint = of_graph_get_endpoint_by_regs(dev->of_node, 0, -1);

More common pattern would be:

sii902x->bus_width = 24;
/* ignore the error */
if (endpoint)
	of_property_read_u32(endpoint, "bus-width", &sii902x->bus_width);


> +	if (endpoint) {
> +		ret = of_property_read_u32(endpoint, "bus-width", &sii902x->bus_width);
> +		if (ret) {
> +			dev_dbg(dev, "Could not get bus-width, defaulting to 24-bit bus-width\n");
> +			sii902x->bus_width = 24;

If endpoint isn't defined in DT (for whatever reasons), bus_width is also not set in the code.

> +		}
> +	}
> +
>  	endpoint = of_graph_get_endpoint_by_regs(dev->of_node, 1, -1);
>  	if (endpoint) {
>  		struct device_node *remote = of_graph_get_remote_port_parent(endpoint);
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
