Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53E7AA2ED46
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2025 14:13:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9EC310E1B1;
	Mon, 10 Feb 2025 13:13:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="fvC0YKZs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AB0010E1B1
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2025 13:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739193222;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ybkXhLrMZAlWxOlZAW6ui6kjbPVAdQu0Z0o64VwBIzY=;
 b=fvC0YKZsFdKMlrk47l5Br1JJxPGlNPpSkq0B3tWoJO1xg8TuEMstHun8fxQntgg3BZuEKu
 HQUAWy/7b1P/3X/JYskvqKVk2PEwAaPmh8/yHjDIAk+Yhr8+uFPBY/ssxUEm+15JapWwh6
 6g6+sfgHH4cQTW3Eeix6WspwnPjYS+Q=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-302-DlNRboWjMwKddsNpvU8ETg-1; Mon, 10 Feb 2025 08:13:41 -0500
X-MC-Unique: DlNRboWjMwKddsNpvU8ETg-1
X-Mimecast-MFC-AGG-ID: DlNRboWjMwKddsNpvU8ETg
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-38dcc9653a7so1121208f8f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2025 05:13:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739193219; x=1739798019;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ybkXhLrMZAlWxOlZAW6ui6kjbPVAdQu0Z0o64VwBIzY=;
 b=A8p5nS+U5+s9jMuhTo4Enh7CUIfw/ut8rh6mpcPmpgp3fCxC3dJHMTgTJckrlhn49y
 5KsFXRxWPRneAhvSLkydyG/xp25a72BwV0PwdRriXmhzWeYx+a9CnGf+EF01Ti+UlSaH
 /DuzGMHHaMShoVY9D9TyLEwIH+X1SXMGnTGSsw2BWHuPaFxwrXYUN/giw4l0vRMTFdZK
 eOQXz6tJzIzUEki+qqp7JZS6GL/kvne7SoZE6T8vXqPYfftOUIH1R00Is6K4RQ/qst5e
 c1OHJ0U5kijuOMJDmNDCM3xfi24uax0sWsH1s+6bP/7tigMIOjEmFNujFEShevPmtAy2
 RJUA==
X-Gm-Message-State: AOJu0Yyq1fKPcyhHVfAodZU6VCKEcOoBxXPh/XcizkHDVVYbUY+kuKSC
 kFfSHBRnmxpG94hAyljork49gQd0PxENJuXOxeUOkzLzM2ECQBc7rHG8Ebvj8AFa7CzUSEcHl/K
 0YYip8J/RLqfe4WjXM9q4V11yFjKCgGMPQMW3XOpGXPhYVtIe7hZKYU3bUAmgCDt2GCmlM0hIfg
 ==
X-Gm-Gg: ASbGncujOp+Pi61ul59GmfQ2Sfq6+r+VnTdPf4YwQrCZf3mjbszLIJV1f2M08wzWS6r
 gLHt8rhYTUcastrmqPPmqg7kbnZRNj9HYcr9g7ikc2mHqCe0yKtLTwU31qiBgz3H7TGJVkHlXvp
 YyQEzeWZUAbuCdyTeEe41UtgX7Kzc2gaJcd2sz9jp74nETeK4EGsot8OELz+IjIXnWrTJ1EoEXw
 2mkZ4hDAyIpMcaJbKEYqGup7mV77GkAItjxor8AqsYjo/5iLWbqxFTm+SXWC1UPhm7m7NtsEGCW
 XPTxIuBmsIbZG5R7xf+lojvz7H5lO8kH2aQHFrI+nFGA
X-Received: by 2002:a5d:64c9:0:b0:38d:dd70:d705 with SMTP id
 ffacd0b85a97d-38ddd70e0a0mr4009617f8f.15.1739193219637; 
 Mon, 10 Feb 2025 05:13:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHV1XbYAIiWgFjhU+ExXPbcnvZp/GIlewdwxhv5yup392oRUloq8mmWsSNs2+oVM9aFd8+/eg==
X-Received: by 2002:a5d:64c9:0:b0:38d:dd70:d705 with SMTP id
 ffacd0b85a97d-38ddd70e0a0mr4009594f8f.15.1739193219209; 
 Mon, 10 Feb 2025 05:13:39 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4391d5283b2sm151045695e9.0.2025.02.10.05.13.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Feb 2025 05:13:38 -0800 (PST)
Message-ID: <a0deae3b-b03f-464f-b1ed-ffb0e8cf65c0@redhat.com>
Date: Mon, 10 Feb 2025 14:13:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] drm/ast: astdp: Store mode index in connector state
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com
Cc: dri-devel@lists.freedesktop.org
References: <20250204133209.403327-1-tzimmermann@suse.de>
 <20250204133209.403327-4-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20250204133209.403327-4-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: QALFyfUPhCSSzgj4cmU9EhRpq95kcVVFVqMQ6yEQNzM_1739193220
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

On 04/02/2025 14:26, Thomas Zimmermann wrote:
> Look up the mode index for the astdp transmitter ship in the encoder's
> atomic check and report an error if the display mode is not supported.
> 
> The lookup uses the DRM display mode instead of the driver's internal
> VBIOS mode. Both are be equivalent. The modesetting code later reads
Typo: Both are equivalent

> the calculated index from the connector state to avoid recalculating it.

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/ast/ast_dp.c | 37 ++++++++++++++++++++++++++++++------
>   1 file changed, 31 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ast/ast_dp.c b/drivers/gpu/drm/ast/ast_dp.c
> index e7b00153c37e..056991afde7f 100644
> --- a/drivers/gpu/drm/ast/ast_dp.c
> +++ b/drivers/gpu/drm/ast/ast_dp.c
> @@ -5,6 +5,7 @@
>   #include <linux/firmware.h>
>   #include <linux/delay.h>
>   
> +#include <drm/drm_atomic.h>
>   #include <drm/drm_atomic_state_helper.h>
>   #include <drm/drm_edid.h>
>   #include <drm/drm_modeset_helper_vtables.h>
> @@ -44,6 +45,8 @@ static const struct ast_astdp_mode_index_table_entry ast_astdp_mode_index_table[
>   
>   struct ast_astdp_connector_state {
>   	struct drm_connector_state base;
> +
> +	int mode_index;
>   };
>   
>   static struct ast_astdp_connector_state *
> @@ -305,14 +308,12 @@ static void ast_astdp_encoder_helper_atomic_mode_set(struct drm_encoder *encoder
>   	struct ast_device *ast = to_ast_device(dev);
>   	struct ast_crtc_state *ast_crtc_state = to_ast_crtc_state(crtc_state);
>   	const struct ast_vbios_enhtable *vmode = ast_crtc_state->vmode;
> -	int mode_index;
> +	struct ast_astdp_connector_state *astdp_conn_state =
> +		to_ast_astdp_connector_state(conn_state);
> +	int mode_index = astdp_conn_state->mode_index;
>   	u8 refresh_rate_index;
>   	u8 vgacre0, vgacre1, vgacre2;
>   
> -	mode_index = ast_astdp_get_mode_index(vmode->hde, vmode->vde);
> -	if (drm_WARN_ON(dev, mode_index < 0))
> -		return;
> -
>   	if (drm_WARN_ON(dev, vmode->refresh_rate_index < 1 || vmode->refresh_rate_index > 255))
>   		return;
>   	refresh_rate_index = vmode->refresh_rate_index - 1;
> @@ -368,10 +369,30 @@ static void ast_astdp_encoder_helper_atomic_disable(struct drm_encoder *encoder,
>   	ast_dp_set_phy_sleep(ast, true);
>   }
>   
> +static int ast_astdp_encoder_helper_atomic_check(struct drm_encoder *encoder,
> +						 struct drm_crtc_state *crtc_state,
> +						 struct drm_connector_state *conn_state)
> +{
> +	const struct drm_display_mode *mode = &crtc_state->mode;
> +	struct ast_astdp_connector_state *astdp_conn_state =
> +		to_ast_astdp_connector_state(conn_state);
> +	int res;
> +
> +	if (drm_atomic_crtc_needs_modeset(crtc_state)) {
> +		res = ast_astdp_get_mode_index(mode->hdisplay, mode->vdisplay);
> +		if (res < 0)
> +			return res;
> +		astdp_conn_state->mode_index = res;
> +	}
> +
> +	return 0;
> +}
> +
>   static const struct drm_encoder_helper_funcs ast_astdp_encoder_helper_funcs = {
>   	.atomic_mode_set = ast_astdp_encoder_helper_atomic_mode_set,
>   	.atomic_enable = ast_astdp_encoder_helper_atomic_enable,
>   	.atomic_disable = ast_astdp_encoder_helper_atomic_disable,
> +	.atomic_check = ast_astdp_encoder_helper_atomic_check,
>   };
>   
>   /*
> @@ -459,7 +480,7 @@ static void ast_astdp_connector_reset(struct drm_connector *connector)
>   static struct drm_connector_state *
>   ast_astdp_connector_atomic_duplicate_state(struct drm_connector *connector)
>   {
> -	struct ast_astdp_connector_state *new_astdp_state;
> +	struct ast_astdp_connector_state *new_astdp_state, *astdp_state;
>   	struct drm_device *dev = connector->dev;
>   
>   	if (drm_WARN_ON(dev, !connector->state))
> @@ -470,6 +491,10 @@ ast_astdp_connector_atomic_duplicate_state(struct drm_connector *connector)
>   		return NULL;
>   	__drm_atomic_helper_connector_duplicate_state(connector, &new_astdp_state->base);
>   
> +	astdp_state = to_ast_astdp_connector_state(connector->state);
> +
> +	new_astdp_state->mode_index = astdp_state->mode_index;
> +
>   	return &new_astdp_state->base;
>   }
>   

