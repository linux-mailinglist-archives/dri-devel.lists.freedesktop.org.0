Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FDC3956777
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 11:50:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBE1410E23D;
	Mon, 19 Aug 2024 09:50:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="fluUdpfp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D43910E23D
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2024 09:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1724061025;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qrvcOG+6RYa73D24126RmRmmGj6uW8fwVVO0iMOTw/k=;
 b=fluUdpfpA2sLcmUBjwlCg7FmRkrN0stPF3VZB/2VlDJpqu8x4K9R78IH+hw4w3nS4uR8X5
 BIZGfd6AbXA4dyEgJVKafUZjKppdZ28frrWouepcu5CO5XKCsLFzAFbcj36n8J6LEQ0+Kt
 xrAGIyeko7ZLEfk3GYoFDDhD1EYs858=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-316-KRsoVW4hNra6USIt31UaUw-1; Mon, 19 Aug 2024 05:50:23 -0400
X-MC-Unique: KRsoVW4hNra6USIt31UaUw-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-37187b43662so2649462f8f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2024 02:50:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724061022; x=1724665822;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qrvcOG+6RYa73D24126RmRmmGj6uW8fwVVO0iMOTw/k=;
 b=JmKdgm5A7ch9xFmzD/Bl4r5mOcvkVszTzVQYrVfMYF0B1je+U17ABjyw1pu+/ekusf
 vuPvE0EWb+XSCYdvreqbsK6j3Z9XVfHZdtB+WEjl7ZcM5uLngT3CIOwetLDIXk5PItqq
 Lqv3rykn0i0JshBMwMsRywejh7MuRSeckk4rYeghd9nKP7lN9x4sTsart4Z7OgEZS3b0
 nooyoIewy05GHV3g2KwdCCvh1wsYR2u/pUapFmbW29T6fSuD4TO3pO50uXODQDHjlkW9
 TwbQ3ieGc471qPRg8DEhe5xGezkQnxwuf/zWKzQxp6v89Njcy+DSBkh42LDlyISSBlOQ
 fmWw==
X-Gm-Message-State: AOJu0Yxw7yZRSi6/I+DpDKiGu6z3IA+TTh8PoPYDs/OjHSK4jwUjGie2
 VBbt+ewVGjyr1MeLt0glNC+upskezAKQQV6u9S1POWv7XqyCy1ZolJPr+7kdMp18juWok9gcMwD
 2vssn0ktNzdlu5pMqO/zNHhwVk+3hb9zCQoYMHoAyjLd7cYpfwcSf82VZvzP8/FJcjA==
X-Received: by 2002:a05:600c:4f0d:b0:426:6822:861 with SMTP id
 5b1f17b1804b1-429ed7f93e3mr58730705e9.36.1724061021667; 
 Mon, 19 Aug 2024 02:50:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH5CYsW7I2KzJ0o6WbpkE5qJQmuHXw0HTA1PXaqTVLMHHVxUN4GzBZk/tgDYrriSelFoh4BEQ==
X-Received: by 2002:a05:600c:4f0d:b0:426:6822:861 with SMTP id
 5b1f17b1804b1-429ed7f93e3mr58730525e9.36.1724061021132; 
 Mon, 19 Aug 2024 02:50:21 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-429ded18630sm157280425e9.1.2024.08.19.02.50.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Aug 2024 02:50:20 -0700 (PDT)
Message-ID: <0cb77679-27eb-4f92-8de1-54fdd8230bea@redhat.com>
Date: Mon, 19 Aug 2024 11:50:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/11] drm/ast: astdp: Simplify power management when
 detecting display
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 daniel@ffwll.ch, airlied@gmail.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org
References: <20240815151953.184679-1-tzimmermann@suse.de>
 <20240815151953.184679-6-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20240815151953.184679-6-tzimmermann@suse.de>
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

On 15/08/2024 17:18, Thomas Zimmermann wrote:
> Remove the CRTC handling in the ASTDP detect_ctx helper and enable
> power while the detecting the display. Unconditionally wait a few
> milliseconds after switching power. Simplifies the code and makes it
> more robust.
> 
Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>


> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/ast/ast_dp.c | 19 ++++++-------------
>   1 file changed, 6 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ast/ast_dp.c b/drivers/gpu/drm/ast/ast_dp.c
> index 45e5c92d19c2..ffbcc397ee6b 100644
> --- a/drivers/gpu/drm/ast/ast_dp.c
> +++ b/drivers/gpu/drm/ast/ast_dp.c
> @@ -170,6 +170,8 @@ static void ast_dp_power_on_off(struct drm_device *dev, bool on)
>   
>   	// DP Power on/off
>   	ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xE3, (u8) ~AST_DP_PHY_SLEEP, bE3);
> +
> +	msleep(50);
>   }
>   
>   static void ast_dp_link_training(struct ast_device *ast)
> @@ -367,27 +369,18 @@ static int ast_astdp_connector_helper_detect_ctx(struct drm_connector *connector
>   	struct drm_device *dev = connector->dev;
>   	struct ast_device *ast = to_ast_device(connector->dev);
>   	enum drm_connector_status status = connector_status_disconnected;
> -	struct drm_connector_state *connector_state = connector->state;
> -	bool is_active = false;
> +	bool power_is_on;
>   
>   	mutex_lock(&ast->modeset_lock);
>   
> -	if (connector_state && connector_state->crtc) {
> -		struct drm_crtc_state *crtc_state = connector_state->crtc->state;
> -
> -		if (crtc_state && crtc_state->active)
> -			is_active = true;
> -	}
> -
> -	if (!is_active && !ast_dp_power_is_on(ast)) {
> +	power_is_on = ast_dp_power_is_on(ast);
> +	if (!power_is_on)
>   		ast_dp_power_on_off(dev, true);
> -		msleep(50);
> -	}
>   
>   	if (ast_astdp_is_connected(ast))
>   		status = connector_status_connected;
>   
> -	if (!is_active && status == connector_status_disconnected)
> +	if (!power_is_on && status == connector_status_disconnected)
>   		ast_dp_power_on_off(dev, false);
>   
>   	mutex_unlock(&ast->modeset_lock);

