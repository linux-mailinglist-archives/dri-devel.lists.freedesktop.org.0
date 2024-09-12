Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CBE6976ACA
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2024 15:37:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AA0610EB8D;
	Thu, 12 Sep 2024 13:37:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="A8W39yiK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD0B810EB8B
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2024 13:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1726148267;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1KV/kSMCvXx0YUZGJUGlJs+QYE62HmZDG48VtBgT5ps=;
 b=A8W39yiK6Fe4J08SYyOyWGsuNBdBreAn+CplUAV1mYDf8MYk1jNF8fcE2j6LEmNC/YUPl5
 XppYKlYXWpn41ruKrLoVGM41ek0Lf1JJGRfPrEgVMHfiPDi0nUKU39NQrczkyW3E8SYXk6
 7Y1SlM+6NboWU4Tx57o5xozZYPpox8U=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-515-BJyiyfQGNIe8D_mm93bd8Q-1; Thu, 12 Sep 2024 09:37:45 -0400
X-MC-Unique: BJyiyfQGNIe8D_mm93bd8Q-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-42cb115566eso8336675e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2024 06:37:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726148264; x=1726753064;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1KV/kSMCvXx0YUZGJUGlJs+QYE62HmZDG48VtBgT5ps=;
 b=A+bUlM9gin6Gceu45LGwkw+VjzACPj29ZbfyKgKWB70wgrh6ykH/aoQS4WbUp6rs5u
 n76D5sLhriasQfbeB8qnkT9eXtEQHdyKQvhKhUkZ+Seq/uQPBQNZTx96lh/Qeuhu+RMl
 fVwq+7VKvyITGOnBaBfpkzgx86Kgc4tprsBigdke0e2E+BGPrPlOQz+NlR6Mr1qWhiN3
 RJDCbZSiJjeLvWbpDwQ31NGhmCqi4s6QBRoSW/U6qJJM0ecbHBLQfbBGfys/WDi/tsiV
 B0n38a7yyWcd6sTEX1VfGtOOQzhHLT3GfW7QuUDKGYqTENyogjGJ/u9iD++Qw3LMeF2X
 pUPA==
X-Gm-Message-State: AOJu0YzHWv44BajYXJ7BtUDBno8AAdeTTp4YfUHC7BVhbKm5JoemE9dk
 xUn7NucMtnsxZnJIotc8VocO0LpCbtXiM53lm9eg91Quz4xVHUEhyfZ8hLmf7UxBuI8xuJMUdpy
 N/BS9N2XaB/I9JvMLzrjIdBkNb0Tw4XvfdfQzmsw/+mfgvIRHYWtHNXJruSsNyx7azQB2qnVmOQ
 ==
X-Received: by 2002:a05:600c:1c27:b0:426:62c5:4731 with SMTP id
 5b1f17b1804b1-42cdb579f50mr28607655e9.29.1726148264317; 
 Thu, 12 Sep 2024 06:37:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFFkX+EwSbwzZJExI4m6GPe/Hp0F6aGmBXjTma1fHIsufzmfiBbnaI843SAd0E+Yh74Z9t3cA==
X-Received: by 2002:a05:600c:1c27:b0:426:62c5:4731 with SMTP id
 5b1f17b1804b1-42cdb579f50mr28607325e9.29.1726148263751; 
 Thu, 12 Sep 2024 06:37:43 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42cb5ba4532sm149622415e9.38.2024.09.12.06.37.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Sep 2024 06:37:43 -0700 (PDT)
Message-ID: <0060992a-cc9a-41b6-9ae0-658759b36ad6@redhat.com>
Date: Thu, 12 Sep 2024 15:37:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/10] drm/ast: astdp: Replace power_on helpers
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com
Cc: dri-devel@lists.freedesktop.org
References: <20240911115347.899148-1-tzimmermann@suse.de>
 <20240911115347.899148-4-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20240911115347.899148-4-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
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

On 11/09/2024 13:51, Thomas Zimmermann wrote:
> Replace the helper for controlling power on the physical connector,
> ast_dp_power_on_off(), with ast_dp_set_phy_sleep(). The new name
> reflects the effect of the operation. Simplify the implementation.
> The call now controls sleeping, hence semantics are inversed. Each
> 'on' becomes an 'off' operation and vice versa.
> 
> Do the same for ast_dp_power_is_on() and also align naming of the
> register constant with the rest of the code.


Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/ast/ast_dp.c  | 39 +++++++++++++++--------------------
>   drivers/gpu/drm/ast/ast_drv.h |  3 ---
>   drivers/gpu/drm/ast/ast_reg.h |  2 +-
>   3 files changed, 18 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ast/ast_dp.c b/drivers/gpu/drm/ast/ast_dp.c
> index 2b5129c6f8b0..d4362807d777 100644
> --- a/drivers/gpu/drm/ast/ast_dp.c
> +++ b/drivers/gpu/drm/ast/ast_dp.c
> @@ -149,27 +149,22 @@ int ast_dp_launch(struct ast_device *ast)
>   	return 0;
>   }
>   
> -static bool ast_dp_power_is_on(struct ast_device *ast)
> +static bool ast_dp_get_phy_sleep(struct ast_device *ast)
>   {
> -	u8 vgacre3;
> +	u8 vgacre3 = ast_get_index_reg(ast, AST_IO_VGACRI, 0xe3);
>   
> -	vgacre3 = ast_get_index_reg(ast, AST_IO_VGACRI, 0xe3);
> -
> -	return !(vgacre3 & AST_DP_PHY_SLEEP);
> +	return (vgacre3 & AST_IO_VGACRE3_DP_PHY_SLEEP);
>   }
>   
> -static void ast_dp_power_on_off(struct ast_device *ast, bool on)
> +static void ast_dp_set_phy_sleep(struct ast_device *ast, bool sleep)
>   {
> -	// Read and Turn off DP PHY sleep
> -	u8 bE3 = ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xE3, AST_DP_VIDEO_ENABLE);
> -
> -	// Turn on DP PHY sleep
> -	if (!on)
> -		bE3 |= AST_DP_PHY_SLEEP;
> +	u8 vgacre3 = 0x00;
>   
> -	// DP Power on/off
> -	ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xE3, (u8) ~AST_DP_PHY_SLEEP, bE3);
> +	if (sleep)
> +		vgacre3 |= AST_IO_VGACRE3_DP_PHY_SLEEP;
>   
> +	ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xe3, (u8)~AST_IO_VGACRE3_DP_PHY_SLEEP,
> +			       vgacre3);
>   	msleep(50);
>   }
>   
> @@ -319,7 +314,7 @@ static void ast_astdp_encoder_helper_atomic_enable(struct drm_encoder *encoder,
>   	struct ast_connector *ast_connector = &ast->output.astdp.connector;
>   
>   	if (ast_connector->physical_status == connector_status_connected) {
> -		ast_dp_power_on_off(ast, AST_DP_POWER_ON);
> +		ast_dp_set_phy_sleep(ast, false);
>   		ast_dp_link_training(ast);
>   
>   		ast_wait_for_vretrace(ast);
> @@ -333,7 +328,7 @@ static void ast_astdp_encoder_helper_atomic_disable(struct drm_encoder *encoder,
>   	struct ast_device *ast = to_ast_device(encoder->dev);
>   
>   	ast_dp_set_on_off(ast, 0);
> -	ast_dp_power_on_off(ast, AST_DP_POWER_OFF);
> +	ast_dp_set_phy_sleep(ast, true);
>   }
>   
>   static const struct drm_encoder_helper_funcs ast_astdp_encoder_helper_funcs = {
> @@ -382,19 +377,19 @@ static int ast_astdp_connector_helper_detect_ctx(struct drm_connector *connector
>   	struct ast_connector *ast_connector = to_ast_connector(connector);
>   	struct ast_device *ast = to_ast_device(connector->dev);
>   	enum drm_connector_status status = connector_status_disconnected;
> -	bool power_is_on;
> +	bool phy_sleep;
>   
>   	mutex_lock(&ast->modeset_lock);
>   
> -	power_is_on = ast_dp_power_is_on(ast);
> -	if (!power_is_on)
> -		ast_dp_power_on_off(ast, true);
> +	phy_sleep = ast_dp_get_phy_sleep(ast);
> +	if (phy_sleep)
> +		ast_dp_set_phy_sleep(ast, false);
>   
>   	if (ast_astdp_is_connected(ast))
>   		status = connector_status_connected;
>   
> -	if (!power_is_on && status == connector_status_disconnected)
> -		ast_dp_power_on_off(ast, false);
> +	if (phy_sleep && status == connector_status_disconnected)
> +		ast_dp_set_phy_sleep(ast, true);
>   
>   	mutex_unlock(&ast->modeset_lock);
>   
> diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
> index b6ca14a3b967..cafc4234e839 100644
> --- a/drivers/gpu/drm/ast/ast_drv.h
> +++ b/drivers/gpu/drm/ast/ast_drv.h
> @@ -403,9 +403,6 @@ int ast_mode_config_init(struct ast_device *ast);
>   #define AST_DP501_LINKRATE	0xf014
>   #define AST_DP501_EDID_DATA	0xf020
>   
> -#define AST_DP_POWER_ON			true
> -#define AST_DP_POWER_OFF			false
> -
>   /*
>    * ASTDP resoultion table:
>    * EX:	ASTDP_A_B_C:
> diff --git a/drivers/gpu/drm/ast/ast_reg.h b/drivers/gpu/drm/ast/ast_reg.h
> index 040961cc1a19..d7a22cea8271 100644
> --- a/drivers/gpu/drm/ast/ast_reg.h
> +++ b/drivers/gpu/drm/ast/ast_reg.h
> @@ -41,6 +41,7 @@
>   #define AST_IO_VGACRD7_EDID_VALID_FLAG	BIT(0)
>   #define AST_IO_VGACRDC_LINK_SUCCESS	BIT(0)
>   #define AST_IO_VGACRDF_HPD		BIT(0)
> +#define AST_IO_VGACRE3_DP_PHY_SLEEP	BIT(4)
>   #define AST_IO_VGACRE5_EDID_READ_DONE	BIT(0)
>   
>   #define AST_IO_VGAIR1_R			(0x5A)
> @@ -69,7 +70,6 @@
>    */
>   
>   /* Define for Soc scratched reg used on ASTDP */
> -#define AST_DP_PHY_SLEEP		BIT(4)
>   #define AST_DP_VIDEO_ENABLE		BIT(0)
>   
>   /*

