Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wE9IJYRdqGmZtgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 17:27:48 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 078FC2043EF
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 17:27:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBC6910EA65;
	Wed,  4 Mar 2026 16:27:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="vFxEQfMj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7061E10EA65
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Mar 2026 16:27:44 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-4837584120eso52895535e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Mar 2026 08:27:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772641663; x=1773246463; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=RUiQRhZhuyL2bRHYFIvUj3h1OxzYZlpga2Ooaul5ruw=;
 b=vFxEQfMjyxRA5dECFmlJpoxp2vvY/SNZp60pOxhCgeTAhb0I8mbTjiOhg1PaAOPPlu
 5elBVGLREfKLmNlxlrtUPY4T+JPo4lvcgksVjZm7Y+vx12d9rXMIYkbPrpYBN8XjJTHU
 EXamwL2BFO9rB5IEPvc2HcmtP07ZEnNzW+wWqh+/jPfcSMvZUqvNika0W9UAoOUl210I
 jBMgEzotlno40YoRDTHOv7Iw41GIWRI4d7ohTza697ai+uUuFJd3Zu5ezrayP9y3K85O
 3b5HxoPKxb/WwnfWmXv6dJIFns4c1A7JaQbLiAj7MhLgMsN4OIVShWemws25FbrFhn9h
 YKjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772641663; x=1773246463;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RUiQRhZhuyL2bRHYFIvUj3h1OxzYZlpga2Ooaul5ruw=;
 b=M1h9fD+axp3wnP8D1XF3I/wLoIzwJDWde6Ko5xjs17jnuXwCBIj8C4GfGVMqHoBwX6
 OlUfEQuE0liAC51/5McOH6299IiRYH2xW1k+D0F35RpvPKMRMtufJOavIpRh1qvG23DV
 Fmvaq2Xe+DCw79syY+/kWeKM9Nld9nJEX7ptN8QbA4DURij4aBejwbEquQhZlQeEDqga
 hea3941R8WC4UsjVGZI/fdYKP/N2xObBKSpCuGnTZdCUQ8bYgJA+gPKONHUm7ORL3B9i
 SlH7aBR2GaorlLFL7qsNkK8+yHCN/WrFNco4LlypiQzA4TLudKG93ROqI88J1+OfClhN
 HH0w==
X-Gm-Message-State: AOJu0YwllnWY9J6bqHDcD6UIl0ke9vFA1syUIhLnRPe6sSd/uajhEpse
 kcye8kR+XJfVHm1SZVLijmtafxD3IDlZd+SqT4EAVwb1Yk34t/DkHkfRfbHG3cryxNI=
X-Gm-Gg: ATEYQzwAWaQ7C5yUUOH45C9tYNI08VwDreNLqHkjr7xdfDPwjXZKy8pSwFp13A1lWuw
 W5PGfg52D0gZ76Ql3o2rcdiK7af4g747cYvAB4nTCop77NZoZ7WJ05HhpRZ/Vk/pymd7K99Xl9c
 bJP4NeCtSUypCLwXoWxhjbnomPe/Me6MUJgRxf1221d+2qzp4tpKTqpnuIlQHm2VCIPQe+HIfCi
 aDOzAa1TvefJSSlfB/hBOKquPoE7xZ+pe2EfRDWZUiR/FzjtDRwV/51mJ69DUaVYM4Fojp27t6P
 wnvuHbFy39tixZqxMq2KXa0hGOUvCzcCIM+hzIz9munF3CSx0glPt57ECZGhv9IA8vKvmy8mfi9
 cSf+J2gDM4SOQQ4cURoMlgUGNj8M7KpjuZMqjQv0HTj56Qz6TDL0l3T67MP5hpAwtHqf4+HlyPa
 1XuXlreZHVAw5Na2JVKsS7o4Oxc7iiOXXaa5XIODMWqBThYd+U62hdXwr0FdnDYwda/NrWYcPsv
 iNqwwE71l11JTQ=
X-Received: by 2002:a05:600c:828a:b0:480:1c53:2085 with SMTP id
 5b1f17b1804b1-4851986f362mr50738455e9.19.1772641662829; 
 Wed, 04 Mar 2026 08:27:42 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:da6:dde3:e477:94d2?
 ([2a01:e0a:106d:1080:da6:dde3:e477:94d2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4851ad02ffcsm11481675e9.20.2026.03.04.08.27.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Mar 2026 08:27:42 -0800 (PST)
Message-ID: <b2ce76f4-bb19-4e4c-a5bb-c3000f8a9827@linaro.org>
Date: Wed, 4 Mar 2026 17:27:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 4/4] drm/panel: himax-hx83102: Add support for DSI DCS
 backlight control
To: Val Packett <val@packett.cool>, Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, phone-devel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht, linux-kernel@vger.kernel.org
References: <20260217070121.190108-1-val@packett.cool>
 <20260217070121.190108-5-val@packett.cool>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20260217070121.190108-5-val@packett.cool>
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
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Queue-Id: 078FC2043EF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[packett.cool,gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch];
	FORGED_RECIPIENTS(0.00)[m:val@packett.cool,m:jesszhan0024@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:phone-devel@vger.kernel.org,m:~postmarketos/upstreaming@lists.sr.ht,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[neil.armstrong@linaro.org,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,packett.cool:email,linaro.org:dkim,linaro.org:email,linaro.org:mid,linaro.org:replyto];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[neil.armstrong@linaro.org];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Action: no action

On 2/17/26 08:00, Val Packett wrote:
> The HTF065H045 panel based on the HX83102 controller does use DCS
> commands for controlling backlight brightness. Make the driver fall back
> to DCS when no external backlight has been defined in the device tree,
> like many other drivers do.
> 
> Signed-off-by: Val Packett <val@packett.cool>
> ---
>   drivers/gpu/drm/panel/panel-himax-hx83102.c | 65 +++++++++++++++++++++
>   1 file changed, 65 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-himax-hx83102.c b/drivers/gpu/drm/panel/panel-himax-hx83102.c
> index 34e0e956db48..8b2a68ee851e 100644
> --- a/drivers/gpu/drm/panel/panel-himax-hx83102.c
> +++ b/drivers/gpu/drm/panel/panel-himax-hx83102.c
> @@ -7,6 +7,7 @@
>    * Based on drivers/gpu/drm/panel/panel-himax-hx8394.c
>    */
>   
> +#include <linux/backlight.h>
>   #include <linux/delay.h>
>   #include <linux/gpio/consumer.h>
>   #include <linux/module.h>
> @@ -76,6 +77,8 @@ struct hx83102_panel_desc {
>   		unsigned int height_mm;
>   	} size;
>   
> +	bool has_backlight;
> +
>   	int (*init)(struct hx83102 *ctx);
>   };
>   
> @@ -913,6 +916,7 @@ static const struct hx83102_panel_desc holitech_htf065h045_desc = {
>   		.width_mm = 68,
>   		.height_mm = 151,
>   	},
> +	.has_backlight = true,
>   	.init = holitech_htf065h045_init,
>   };
>   
> @@ -1049,6 +1053,59 @@ static const struct drm_panel_funcs hx83102_drm_funcs = {
>   	.get_orientation = hx83102_get_orientation,
>   };
>   
> +static int hx83102_bl_update_status(struct backlight_device *bl)
> +{
> +	struct mipi_dsi_device *dsi = bl_get_data(bl);
> +	u16 brightness = backlight_get_brightness(bl);
> +	int ret;
> +
> +	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
> +
> +	ret = mipi_dsi_dcs_set_display_brightness_large(dsi, brightness);
> +	if (ret < 0)
> +		return ret;
> +
> +	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
> +
> +	return 0;
> +}
> +
> +static int hx83102_bl_get_brightness(struct backlight_device *bl)
> +{
> +	struct mipi_dsi_device *dsi = bl_get_data(bl);
> +	u16 brightness;
> +	int ret;
> +
> +	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
> +
> +	ret = mipi_dsi_dcs_get_display_brightness_large(dsi, &brightness);
> +	if (ret < 0)
> +		return ret;
> +
> +	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
> +
> +	return brightness;
> +}
> +
> +static const struct backlight_ops hx83102_bl_ops = {
> +	.update_status = hx83102_bl_update_status,
> +	.get_brightness = hx83102_bl_get_brightness,
> +};
> +
> +static struct backlight_device *
> +hx83102_create_dcs_backlight(struct mipi_dsi_device *dsi)
> +{
> +	struct device *dev = &dsi->dev;
> +	const struct backlight_properties props = {
> +		.type = BACKLIGHT_RAW,
> +		.brightness = 4095,
> +		.max_brightness = 4095,

I guess those values could be in the hx83102_panel_desc.

Anyway:

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

> +	};
> +
> +	return devm_backlight_device_register(dev, dev_name(dev), dev, dsi,
> +					      &hx83102_bl_ops, &props);
> +}
> +
>   static int hx83102_panel_add(struct hx83102 *ctx)
>   {
>   	struct device *dev = &ctx->dsi->dev;
> @@ -1080,6 +1137,14 @@ static int hx83102_panel_add(struct hx83102 *ctx)
>   	if (err)
>   		return err;
>   
> +	/* Use DSI-based backlight as fallback if available */
> +	if (ctx->desc->has_backlight && !ctx->base.backlight) {
> +		ctx->base.backlight = hx83102_create_dcs_backlight(ctx->dsi);
> +		if (IS_ERR(ctx->base.backlight))
> +			return dev_err_probe(dev, PTR_ERR(ctx->base.backlight),
> +					     "Failed to create backlight\n");
> +	}
> +
>   	ctx->base.funcs = &hx83102_drm_funcs;
>   	ctx->base.dev = &ctx->dsi->dev;
>   

