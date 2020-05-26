Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1229A1E223D
	for <lists+dri-devel@lfdr.de>; Tue, 26 May 2020 14:50:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98F8E6E188;
	Tue, 26 May 2020 12:50:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A31396E188
 for <dri-devel@lists.freedesktop.org>; Tue, 26 May 2020 12:50:24 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id x13so5626077wrv.4
 for <dri-devel@lists.freedesktop.org>; Tue, 26 May 2020 05:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:autocrypt:organization:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=x52IImu6UuzA9b3pfkA9PO1Q3BR4NImsoPwbbpDxa0k=;
 b=Oth1vWsHkK38NZ1+dFwPTf3MdLoLO/rRqPHKZka1KXtSCFzHWjJLRFw2fgCuDDG9tx
 fo63oeIIESo7fIJQTHZqIuk+gEsjC3NKQ5bw4aK+t4i8dIwukV16B5ZDl8JPqySyLZXw
 zHHJCuibFxWB8JzdT7pyr/Tjyz4bxZW90iWmMw28OWg2iwPzCXY2gkLKnubzcxdQGaFj
 KQfBXoBCQkRIWIPGv29KvXMcu/z/W/Mnv0q1fjZNdHDJY2Z43AMeZtapN8SQfnBD401W
 IjnySUimkVn3i+AN1+s9qLNgBN0Netb6XmEnLzUXdz6hCPJOKV9cXSEzQp2Q/zxyhVw/
 xI9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=x52IImu6UuzA9b3pfkA9PO1Q3BR4NImsoPwbbpDxa0k=;
 b=cTAtBR0WZ2bgdHWtfRvomlQ0IBrnxt5uTY3n+UAwZIR2x4zwXNAqKj374NRuZNeSQC
 UlZDgX+CRmA+T3/geVHwTnJ0JtLRYfzP8MbR3OLqTRObRxKIw4DmAlx6MUR2kKSNUfJN
 9aIBQ/uWTlulmzI97/wCfE/wlYmiJ6R+XtKYWk8z6CEWidUCBKPhu70dPP1nwjaGQtdN
 iYwIhvCwfQqaf+QQc7Q1zaYD+pJwtQIAVc8OxeMwMfGWodbfcpUE7pa+WRUZbYddxAlP
 syKXcqiy3AvYlSInPDuNavOCWyMdxlfpY4HuwjtPxRy/CKtYwGq/f6n+/jCeh2xQh6cq
 0sRA==
X-Gm-Message-State: AOAM533OtMb6+qelALpkVDHl5EDXPuqVXtfKmt9sLlnvjizk6PjHXjAN
 TGXH2ljln2UMDoYKwHbG73LDWQ==
X-Google-Smtp-Source: ABdhPJy3jP1cIbEAdWh1QLGhoKDK+3rZdgHG9S+jlqSj1NqAcGF17hX6RFN9sMGHIGUNYaOqPZK4Qw==
X-Received: by 2002:a5d:49c5:: with SMTP id t5mr20461653wrs.18.1590497423104; 
 Tue, 26 May 2020 05:50:23 -0700 (PDT)
Received: from ?IPv6:2a01:e35:2ec0:82b0:acf8:18a8:b3a5:a17b?
 ([2a01:e35:2ec0:82b0:acf8:18a8:b3a5:a17b])
 by smtp.gmail.com with ESMTPSA id j5sm5274050wrm.57.2020.05.26.05.50.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 May 2020 05:50:22 -0700 (PDT)
Subject: Re: [PATCH 23/27] drm: bridge: dw-hdmi: Attach to next bridge if
 available
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
References: <20200526011505.31884-1-laurent.pinchart+renesas@ideasonboard.com>
 <20200526011505.31884-24-laurent.pinchart+renesas@ideasonboard.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 BSwxi7g3Mu7u5kUByanqHyA=
Organization: Baylibre
Message-ID: <f75a9b4f-a283-53b1-ecb1-2bb6c9a278d6@baylibre.com>
Date: Tue, 26 May 2020 14:50:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200526011505.31884-24-laurent.pinchart+renesas@ideasonboard.com>
Content-Language: en-US
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 linux-renesas-soc@vger.kernel.org, Andrzej Hajda <a.hajda@samsung.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 26/05/2020 03:15, Laurent Pinchart wrote:
> On all platforms except i.MX and Rockchip, the dw-hdmi DT bindings
> require a video output port connected to an HDMI sink (most likely an
> HDMI connector, in rare cases another bridges converting HDMI to another
> protocol). For those platforms, retrieve the next bridge and attach it
> from the dw-hdmi bridge attach handler.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 52 ++++++++++++++++++++++-
>  include/drm/bridge/dw_hdmi.h              |  2 +
>  2 files changed, 53 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> index 6148a022569a..512e67bb1c32 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> @@ -143,6 +143,7 @@ struct dw_hdmi_phy_data {
>  struct dw_hdmi {
>  	struct drm_connector connector;
>  	struct drm_bridge bridge;
> +	struct drm_bridge *next_bridge;
>  
>  	unsigned int version;
>  
> @@ -2797,7 +2798,8 @@ static int dw_hdmi_bridge_attach(struct drm_bridge *bridge,
>  	struct dw_hdmi *hdmi = bridge->driver_private;
>  
>  	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)
> -		return 0;
> +		return drm_bridge_attach(bridge->encoder, hdmi->next_bridge,
> +					 bridge, flags);
>  
>  	return dw_hdmi_connector_create(hdmi);
>  }
> @@ -3179,6 +3181,50 @@ static void dw_hdmi_init_hw(struct dw_hdmi *hdmi)
>  		hdmi->phy.ops->setup_hpd(hdmi, hdmi->phy.data);
>  }
>  
> +static int dw_hdmi_parse_dt(struct dw_hdmi *hdmi)
> +{
> +	struct device_node *endpoint;
> +	struct device_node *remote;
> +
> +	if (!hdmi->plat_data->output_port)
> +		return 0;
> +
> +	endpoint = of_graph_get_endpoint_by_regs(hdmi->dev->of_node,
> +						 hdmi->plat_data->output_port,
> +						 -1);
> +	if (!endpoint) {
> +		/*
> +		 * Don't treat this as a fatal error as the Rockchip DW-HDMI
> +		 * binding doesn't make the output port mandatory.
> +		 */
> +		dev_dbg(hdmi->dev, "Missing endpoint in port@%u\n",
> +			hdmi->plat_data->output_port);
> +		return 0;
> +	}
> +
> +	remote = of_graph_get_remote_port_parent(endpoint);
> +	of_node_put(endpoint);
> +	if (!remote) {
> +		dev_err(hdmi->dev, "Endpoint in port@%u unconnected\n",
> +			hdmi->plat_data->output_port);
> +		return -ENODEV;
> +	}
> +
> +	if (!of_device_is_available(remote)) {
> +		dev_err(hdmi->dev, "port@%u remote device is disabled\n",
> +			hdmi->plat_data->output_port);
> +		of_node_put(remote);
> +		return -ENODEV;
> +	}
> +
> +	hdmi->next_bridge = of_drm_find_bridge(remote);
> +	of_node_put(remote);
> +	if (!hdmi->next_bridge)
> +		return -EPROBE_DEFER;

I'll be safer to print a warn for now until all platforms has been tested.

> +
> +	return 0;
> +}
> +
>  static struct dw_hdmi *
>  __dw_hdmi_probe(struct platform_device *pdev,
>  		const struct dw_hdmi_plat_data *plat_data)
> @@ -3216,6 +3262,10 @@ __dw_hdmi_probe(struct platform_device *pdev,
>  	mutex_init(&hdmi->cec_notifier_mutex);
>  	spin_lock_init(&hdmi->audio_lock);
>  
> +	ret = dw_hdmi_parse_dt(hdmi);
> +	if (ret < 0)
> +		return ERR_PTR(ret);
> +
>  	ddc_node = of_parse_phandle(np, "ddc-i2c-bus", 0);
>  	if (ddc_node) {
>  		hdmi->ddc = of_get_i2c_adapter_by_node(ddc_node);
> diff --git a/include/drm/bridge/dw_hdmi.h b/include/drm/bridge/dw_hdmi.h
> index ea34ca146b82..8ebeb65d6371 100644
> --- a/include/drm/bridge/dw_hdmi.h
> +++ b/include/drm/bridge/dw_hdmi.h
> @@ -126,6 +126,8 @@ struct dw_hdmi_phy_ops {
>  struct dw_hdmi_plat_data {
>  	struct regmap *regm;
>  
> +	unsigned int output_port;
> +
>  	unsigned long input_bus_encoding;
>  	bool use_drm_infoframe;
>  	bool ycbcr_420_allowed;
> 

I must check on meson, since I'm not sure for now if the connector probes.

Anyway, this looks fine.

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
