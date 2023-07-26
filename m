Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60EF2763017
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jul 2023 10:41:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F7BC10E187;
	Wed, 26 Jul 2023 08:41:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55EAB10E192
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jul 2023 08:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1690360899;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+zny/31jXD+P2CN+ULAVJPqdZ/8NR3Ja6mEATlh7y2k=;
 b=Map75fZbpNtEiFzr5hBxKyDXWpkLpgpATSp3QCk0/UiP1vqkE8GAinT0YfuX25Rs5pAp4P
 YiGsPtTfphb1Tj4WIBDFrjwEONMyIpXy/oUnoV/43n3UWaqvcQYHssB+SKYoS+bswWDecf
 vwEEFs4QtC9EqgJRI7n7tzoIR8Uix7o=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-86-Zg_yi_GFOiueFU35c4yiig-1; Wed, 26 Jul 2023 04:41:38 -0400
X-MC-Unique: Zg_yi_GFOiueFU35c4yiig-1
Received: by mail-lf1-f69.google.com with SMTP id
 2adb3069b0e04-4fdde274744so5337865e87.0
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jul 2023 01:41:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690360896; x=1690965696;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+zny/31jXD+P2CN+ULAVJPqdZ/8NR3Ja6mEATlh7y2k=;
 b=c53+HR2USdR8muPJW5au7LLw81Nn9gu7A8fneH/Mnt+ljiHGW/jBwFaEaNREWYhLfX
 WaBC+4GfwYbtTPDRXDsjAstYEcllK/3hndDVY019XGhBKwrg2ir6ajO9P4wdEaWObp71
 2cButTZoK1lh3iGPsutVBvUNB83Rzqf1kuZUqO/KC8cagikAQyvP6Jxyg9QUq9rMe6xX
 xRPKdgIe81HEnKtsj8LGOp8yJfpVq+MaV+YvRXk0pH/glh4QYjJ1sy9CPMQLtsSZoByy
 kfv7H+ZDG2UX3brS1mNVUH5mcc+g26CRBto9dJGTfwPgwXZIPBznmxMP6g+N01/3kR0E
 Q+gQ==
X-Gm-Message-State: ABy/qLbti7+Hl25l9QzvjtApdJttrLAc6vb4YD7eui+0Gw+WYqEpYup0
 PLEKRgwSHGEgqJ2qICbn4YSUMxaODPj7mAYM9OJ94vvnhYEJiTt4esfzBgyeGbrWm92he3Z4tEX
 ULVh2ic4IvWcYDxLzpVRkwr1Jp2ZZ
X-Received: by 2002:a05:6512:b08:b0:4fa:f79f:85a with SMTP id
 w8-20020a0565120b0800b004faf79f085amr879915lfu.69.1690360896737; 
 Wed, 26 Jul 2023 01:41:36 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFNv3khCwUAw1D+Ozl7DyWjQ6rrSP/R/vWtO03fF8g0uX/QLtqchahcT/DAVh+PkjmuqdUGvw==
X-Received: by 2002:a05:6512:b08:b0:4fa:f79f:85a with SMTP id
 w8-20020a0565120b0800b004faf79f085amr879898lfu.69.1690360896345; 
 Wed, 26 Jul 2023 01:41:36 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:d5:a000:680e:9bf4:b6a9:959b?
 ([2a01:e0a:d5:a000:680e:9bf4:b6a9:959b])
 by smtp.gmail.com with ESMTPSA id
 24-20020a05600c229800b003fbcdba1a52sm1389449wmf.3.2023.07.26.01.41.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jul 2023 01:41:35 -0700 (PDT)
Message-ID: <64d97bb4-e95a-3b03-a2f4-e000930f3ac9@redhat.com>
Date: Wed, 26 Jul 2023 10:41:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v6 1/2] drm/ast: Add BMC virtual connector
To: tzimmermann@suse.de, airlied@redhat.com, kuohsiang_chou@aspeedtech.com,
 jammy_huang@aspeedtech.com, jani.nikula@linux.intel.com,
 dianders@chromium.org
References: <20230713134316.332502-1-jfalempe@redhat.com>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20230713134316.332502-1-jfalempe@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 13/07/2023 15:41, Jocelyn Falempe wrote:
> Most aspeed devices have a BMC, which allows to remotely see the screen.
> Also in the common use case, those servers don't have a display connected.
> So add a Virtual connector, to reflect that even if no display is
> connected, the framebuffer can still be seen remotely.
> This prepares the work to implement a detect_ctx() for the Display port
> connector.
> 
> v4: call drm_add_modes_noedid() with 4096x4096 (Thomas Zimmermann)
>      remove useless struct field init to 0 (Thomas Zimmermann)
>      don't use drm_simple_encoder_init() (Thomas Zimmermann)
>      inline ast_bmc_connector_init() (Thomas Zimmermann)
> 
> Fixes: fae7d186403e ("drm/probe-helper: Default to 640x480 if no EDID on DP")
> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> ---
>   drivers/gpu/drm/ast/ast_drv.h  |  4 +++
>   drivers/gpu/drm/ast/ast_mode.c | 58 ++++++++++++++++++++++++++++++++++
>   2 files changed, 62 insertions(+)
> 
> diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
> index 3f6e0c984523..c9659e72002f 100644
> --- a/drivers/gpu/drm/ast/ast_drv.h
> +++ b/drivers/gpu/drm/ast/ast_drv.h
> @@ -214,6 +214,10 @@ struct ast_device {
>   			struct drm_encoder encoder;
>   			struct drm_connector connector;
>   		} astdp;
> +		struct {
> +			struct drm_encoder encoder;
> +			struct drm_connector connector;
> +		} bmc;
>   	} output;
>   
>   	bool support_wide_screen;
> diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
> index f711d592da52..1a8293162fec 100644
> --- a/drivers/gpu/drm/ast/ast_mode.c
> +++ b/drivers/gpu/drm/ast/ast_mode.c
> @@ -1735,6 +1735,61 @@ static int ast_astdp_output_init(struct ast_device *ast)
>   	return 0;
>   }
>   
> +/*
> + * BMC virtual Connector
> + */
> +
> +static int ast_bmc_connector_helper_get_modes(struct drm_connector *connector)
> +{
> +	return drm_add_modes_noedid(connector, 4096, 4096);
> +}
> +
> +static const struct drm_connector_helper_funcs ast_bmc_connector_helper_funcs = {
> +	.get_modes = ast_bmc_connector_helper_get_modes,
> +};
> +
> +static const struct drm_connector_funcs ast_bmc_connector_funcs = {
> +	.reset = drm_atomic_helper_connector_reset,
> +	.fill_modes = drm_helper_probe_single_connector_modes,
> +	.destroy = drm_connector_cleanup,
> +	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
> +	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
> +};
> +
> +static const struct drm_encoder_funcs ast_bmc_encoder_funcs = {
> +	.destroy = drm_encoder_cleanup,
> +};
> +
> +static int ast_bmc_output_init(struct ast_device *ast)
> +{
> +	struct drm_device *dev = &ast->base;
> +	struct drm_crtc *crtc = &ast->crtc;
> +	struct drm_encoder *encoder = &ast->output.bmc.encoder;
> +	struct drm_connector *connector = &ast->output.bmc.connector;
> +	int ret;
> +
> +
> +	ret = drm_encoder_init(dev, encoder,
> +				&ast_bmc_encoder_funcs,
> +				DRM_MODE_ENCODER_VIRTUAL, "ast_bmc");
> +	if (ret)
> +		return ret;
> +	encoder->possible_crtcs = drm_crtc_mask(crtc);
> +
> +	ret = drm_connector_init(dev, connector, &ast_bmc_connector_funcs,
> +				 DRM_MODE_CONNECTOR_VIRTUAL);
> +	if (ret)
> +		return ret;
> +
> +	drm_connector_helper_add(connector, &ast_bmc_connector_helper_funcs);
> +
> +	ret = drm_connector_attach_encoder(connector, encoder);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
>   /*
>    * Mode config
>    */
> @@ -1842,6 +1897,9 @@ int ast_mode_config_init(struct ast_device *ast)
>   		if (ret)
>   			return ret;
>   	}
> +	ret = ast_bmc_output_init(ast);
> +	if (ret)
> +		return ret;
>   
>   	drm_mode_config_reset(dev);
>   
> 
> base-commit: b32d5a51f3c21843011d68a58e6ac0b897bce9f2


I'm missing a review on this patch. The VGA CRD0[7] register check 
doesn't work on my server, so I'm adding the BMC virtual connector for 
all aspeed hardware, but as discussed, it shouldn't have a negative impact.

Thanks,

-- 

Jocelyn

