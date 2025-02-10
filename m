Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FD0EA2ED43
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2025 14:10:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1125010E521;
	Mon, 10 Feb 2025 13:10:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="ioi04qgm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89E0D10E521
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2025 13:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739193049;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ynZxZdFzJG19mzr6L9OQPCSKo3D7vE1M9zL9O1ubTkE=;
 b=ioi04qgmw+jAbEgMs3Z0Ng8cV+Vv7BovhLc2IqvR7hqVmCTjZKPyvgg1GlSffb974Qdgb4
 5UQtxjporX/+5+BeTB6kL9ZYVp52OqiZUyanmYuLjPu65rZOkOCX1fT4YyPG8Ml/deCFn2
 KxTtuVQFJf9QcdFQcsQXkIo6+sbOcnE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-646-RiPs9ycFPJGtF3ST406g8g-1; Mon, 10 Feb 2025 08:10:48 -0500
X-MC-Unique: RiPs9ycFPJGtF3ST406g8g-1
X-Mimecast-MFC-AGG-ID: RiPs9ycFPJGtF3ST406g8g
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-43619b135bcso22873685e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2025 05:10:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739193047; x=1739797847;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ynZxZdFzJG19mzr6L9OQPCSKo3D7vE1M9zL9O1ubTkE=;
 b=S2Iyi9dSCILxNQ9DEkG8plyGXnnGLHPD+XAj+dyNFgw24VKlr1kSkvaBqA5AQTX7MA
 K64YYLSQvpRGODzGA6+Y0wWL/xkliX6jF5SCaDgVE7KIxIZERXAzOzzDFt72zmcHh8RE
 67Cl0X4D3BhtoB1rKoiDZPP+DS65pFC9kKoV/LzvsRocgdBPMXE7mAs+071q5v29E4T/
 0Jjhk/EdRnHPgkioyzajs5WBLllyI4Xu5N8hG0SXnafThePdYKulqVH49OLWMBCxwEIQ
 zhaJydC6VY4CfalZZUUWbfF522ytwH17bKfHukH0B75nXjqZxCEe+Nu5YEhtzp9TugdC
 cPFQ==
X-Gm-Message-State: AOJu0Yy79aO6TXkM3/edyPYEucOmVGytBreqE2UeYlVpesn4xlefpa1y
 Y5gAPJIomqsBj2JD54Q3aCS8RsDjEAjHJhsb+ObKY+dOkNtPR8z6VILxsglcdYdycmSDOVVxGjd
 5nw15gXQWE2Zoj8GQOwa7ecJ+BdrZnxCuGlVXVqVfRXhKZzPWPPjm4nhnwyqRFgCRkQ==
X-Gm-Gg: ASbGnctNYYOF2PH0g7uu/QsmH8xyYiBBPqftnEuzt69I7mJqrgYySKHFMp3gkP6n/S2
 Q3aDbRNwLHBViYYP2dE85bAKoRog39qFzev4xnSgNj/s56IHQJPjVw2lXC9BW+uiRKY9vdEAp+I
 gkRqYXbfBlzHsDDRagtW5Q78+cbJf3go1dcEamROkNCQKBVgmZO7EgnQGopq+dToKGjszxC70Ug
 C0pDtOmVH7NwNdsN9zNmtj0gmUM9b752Wu9n/hZ1vKkyjFPqO7HZgHX076f4R/p+tL0Bo4inCY8
 5gZKayCpF+1IcQR2FcwKpAdryI0pSSchq67065ZhCtcQ
X-Received: by 2002:a05:600c:4455:b0:434:9934:575 with SMTP id
 5b1f17b1804b1-43924990c58mr129928095e9.16.1739193046657; 
 Mon, 10 Feb 2025 05:10:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGYxa7SN38UxGQWV9HehIARussNJmTqRuWN9VFic88RSCfUG4P8n5iRWJlYDS8Bm5Gbz0Nc1g==
X-Received: by 2002:a05:600c:4455:b0:434:9934:575 with SMTP id
 5b1f17b1804b1-43924990c58mr129927765e9.16.1739193046251; 
 Mon, 10 Feb 2025 05:10:46 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4391dcae5c7sm144916145e9.18.2025.02.10.05.10.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Feb 2025 05:10:45 -0800 (PST)
Message-ID: <dac4ded8-f53f-466c-86cc-76ff47fb22c5@redhat.com>
Date: Mon, 10 Feb 2025 14:10:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] drm/ast: astdp: Add connector state
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com
Cc: dri-devel@lists.freedesktop.org
References: <20250204133209.403327-1-tzimmermann@suse.de>
 <20250204133209.403327-2-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20250204133209.403327-2-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: rSoBE97LEFMVny_Kt1q-JMR8Le-Z4meHNwKoYNZ5pNg_1739193047
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
> Add dedicated connector state for ASTDP connectors. The state will
> store values for programming the transmitter chip.

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/ast/ast_dp.c | 62 ++++++++++++++++++++++++++++++++----
>   1 file changed, 56 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ast/ast_dp.c b/drivers/gpu/drm/ast/ast_dp.c
> index db3eb9ce1498..9c49b507a0d2 100644
> --- a/drivers/gpu/drm/ast/ast_dp.c
> +++ b/drivers/gpu/drm/ast/ast_dp.c
> @@ -42,6 +42,16 @@ static const struct ast_astdp_mode_index_table_entry ast_astdp_mode_index_table[
>   	{ 0 }
>   };
>   
> +struct ast_astdp_connector_state {
> +	struct drm_connector_state base;
> +};
> +
> +static struct ast_astdp_connector_state *
> +to_ast_astdp_connector_state(const struct drm_connector_state *state)
> +{
> +	return container_of(state, struct ast_astdp_connector_state, base);
> +}
> +
>   static int __ast_astdp_get_mode_index(unsigned int hdisplay, unsigned int vdisplay)
>   {
>   	const struct ast_astdp_mode_index_table_entry *entry = ast_astdp_mode_index_table;
> @@ -442,18 +452,58 @@ static const struct drm_connector_helper_funcs ast_astdp_connector_helper_funcs
>   	.detect_ctx = ast_astdp_connector_helper_detect_ctx,
>   };
>   
> -/*
> - * Output
> - */
> +static void ast_astdp_connector_reset(struct drm_connector *connector)
> +{
> +	struct ast_astdp_connector_state *astdp_state =
> +		kzalloc(sizeof(*astdp_state), GFP_KERNEL);
> +
> +	if (connector->state)
> +		connector->funcs->atomic_destroy_state(connector, connector->state);
> +
> +	if (astdp_state)
> +		__drm_atomic_helper_connector_reset(connector, &astdp_state->base);
> +	else
> +		__drm_atomic_helper_connector_reset(connector, NULL);
> +}
> +
> +static struct drm_connector_state *
> +ast_astdp_connector_atomic_duplicate_state(struct drm_connector *connector)
> +{
> +	struct ast_astdp_connector_state *new_astdp_state;
> +	struct drm_device *dev = connector->dev;
> +
> +	if (drm_WARN_ON(dev, !connector->state))
> +		return NULL;
> +
> +	new_astdp_state = kmalloc(sizeof(*new_astdp_state), GFP_KERNEL);
> +	if (!new_astdp_state)
> +		return NULL;
> +	__drm_atomic_helper_connector_duplicate_state(connector, &new_astdp_state->base);
> +
> +	return &new_astdp_state->base;
> +}
> +
> +static void ast_astdp_connector_atomic_destroy_state(struct drm_connector *connector,
> +						     struct drm_connector_state *state)
> +{
> +	struct ast_astdp_connector_state *astdp_state = to_ast_astdp_connector_state(state);
> +
> +	__drm_atomic_helper_connector_destroy_state(&astdp_state->base);
> +	kfree(astdp_state);
> +}
>   
>   static const struct drm_connector_funcs ast_astdp_connector_funcs = {
> -	.reset = drm_atomic_helper_connector_reset,
> +	.reset = ast_astdp_connector_reset,
>   	.fill_modes = drm_helper_probe_single_connector_modes,
>   	.destroy = drm_connector_cleanup,
> -	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
> -	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
> +	.atomic_duplicate_state = ast_astdp_connector_atomic_duplicate_state,
> +	.atomic_destroy_state = ast_astdp_connector_atomic_destroy_state,
>   };
>   
> +/*
> + * Output
> + */
> +
>   int ast_astdp_output_init(struct ast_device *ast)
>   {
>   	struct drm_device *dev = &ast->base;

