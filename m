Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FCD2976B16
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2024 15:48:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E319B10EB98;
	Thu, 12 Sep 2024 13:48:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="BlaxxT2M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30E8C10EB98
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2024 13:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1726148932;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+G2FeD/2gSNn/khSUjKZIdGPAoKWzovSPO7br86SWA8=;
 b=BlaxxT2Mef8ORnJp3KUhfEACWohWwdgIfwXkfsjbpoy3tyeUDxChDiN4t0wiK11YdEMFYE
 Zr7A5C/ioS3MQEZLP/q9o4PtFIJA9dkhH0p4oPUEuS//pD1PYhV9jmIeJ8eu+oDmjJ6HAh
 OpTrJMJbxhDGYXdPyf2TqTtHltrpvCc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-483-kUpx4jjROf-kISO_8plvaQ-1; Thu, 12 Sep 2024 09:48:51 -0400
X-MC-Unique: kUpx4jjROf-kISO_8plvaQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-42cb471a230so7104785e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2024 06:48:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726148929; x=1726753729;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+G2FeD/2gSNn/khSUjKZIdGPAoKWzovSPO7br86SWA8=;
 b=AD8NQHd+aActuMzWVb5qY29FklGb/eeQMO+0rcI9YH/SvqFDM5QCUMAGk3xhWCO+fr
 ZTTU+8gpQawHOR+3pj9ApA9zVUGyEwffakF5FVzBMzT0oe1lhpYYTjo7n88/iTa8/3Wd
 6X5EZnMQX3zB7rusTyI6NylyU0gWQfrb1nkUC2b0HAipUmzI7rJwczfcdA7XknopIoe+
 up8ZRxQ1unLz4ywWQCq+j3iYYsubROXx2JQ/+HKsYlJhL6+7hmNKw6ugoAn7FGVrZU2y
 kltw7Ouv+o3YeN7bTYWiJNu7pudOdUtQ4sYlMr/bzCR/6AwI9R5Cq47XnkeriZTkM4yC
 77Rw==
X-Gm-Message-State: AOJu0YzzqfSClSbSOtsjVj2KEV1zjwvjOcw9Cuwsqy+gVqIB1nyI+fuc
 g8e6vxr92szGTLQkqPpkz/ODq0VYWNCZzQA7Qjt99MmhbOve+Ua4OoUqo1sKO74LDLhAtnWP5DQ
 /4JAzBLvnAipLW1RwE3R7ZEzhX95nqIL0UC9OOvfjZCkJKWgKxCCC9XNyTOWj/Os42znDn5ltCw
 ==
X-Received: by 2002:a05:600c:605a:b0:42c:b037:5fce with SMTP id
 5b1f17b1804b1-42cdcd7db35mr22587465e9.3.1726148929542; 
 Thu, 12 Sep 2024 06:48:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHlv0nG9vCM/fg9Y2bPfLdc/W1YOTiSPL5DCDe8IAxdpBdTbQDqY0Ari6WAO6bvjDw4QivApw==
X-Received: by 2002:a05:600c:605a:b0:42c:b037:5fce with SMTP id
 5b1f17b1804b1-42cdcd7db35mr22587255e9.3.1726148929107; 
 Thu, 12 Sep 2024 06:48:49 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42caeb44473sm174053185e9.26.2024.09.12.06.48.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Sep 2024 06:48:48 -0700 (PDT)
Message-ID: <392215ef-2d3c-41c7-9cef-7e5fc9cb4413@redhat.com>
Date: Thu, 12 Sep 2024 15:48:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/10] drm/ast: vga: Inline ast_vga_connector_init()
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com
Cc: dri-devel@lists.freedesktop.org
References: <20240911115347.899148-1-tzimmermann@suse.de>
 <20240911115347.899148-9-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20240911115347.899148-9-tzimmermann@suse.de>
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
> Inline ast_vga_connector_init() into its only caller. The helper
> currently only does half of the connector-init work and is trivial
> enough to be inlined. While at it, remove the error message from the
> call to ast_ddc_create(). The function already warns on errors.
> 
> Also set the local variables for encoder and connector as late as
> possible, so that the compiler warns if we use them before having
> initialized the instance.

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/ast/ast_vga.c | 55 +++++++++++++++++------------------
>   1 file changed, 26 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ast/ast_vga.c b/drivers/gpu/drm/ast/ast_vga.c
> index 3e815da43fbd..5c79b773af57 100644
> --- a/drivers/gpu/drm/ast/ast_vga.c
> +++ b/drivers/gpu/drm/ast/ast_vga.c
> @@ -71,52 +71,49 @@ static const struct drm_connector_funcs ast_vga_connector_funcs = {
>   	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
>   };
>   
> -static int ast_vga_connector_init(struct drm_device *dev, struct drm_connector *connector)
> +/*
> + * Output
> + */
> +
> +int ast_vga_output_init(struct ast_device *ast)
>   {
> -	struct ast_device *ast = to_ast_device(dev);
> +	struct drm_device *dev = &ast->base;
> +	struct drm_crtc *crtc = &ast->crtc;
>   	struct i2c_adapter *ddc;
> +	struct drm_encoder *encoder;
> +	struct ast_connector *ast_connector;
> +	struct drm_connector *connector;
>   	int ret;
>   
> +	/* DDC */
> +
>   	ddc = ast_ddc_create(ast);
> -	if (IS_ERR(ddc)) {
> -		ret = PTR_ERR(ddc);
> -		drm_err(dev, "failed to add DDC bus for connector; ret=%d\n", ret);
> +	if (IS_ERR(ddc))
> +		return PTR_ERR(ddc);
> +
> +	/* encoder */
> +
> +	encoder = &ast->output.vga.encoder;
> +	ret = drm_encoder_init(dev, encoder, &ast_vga_encoder_funcs,
> +			       DRM_MODE_ENCODER_DAC, NULL);
> +	if (ret)
>   		return ret;
> -	}
> +	encoder->possible_crtcs = drm_crtc_mask(crtc);
> +
> +	/* connector */
>   
> +	ast_connector = &ast->output.vga.connector;
> +	connector = &ast_connector->base;
>   	ret = drm_connector_init_with_ddc(dev, connector, &ast_vga_connector_funcs,
>   					  DRM_MODE_CONNECTOR_VGA, ddc);
>   	if (ret)
>   		return ret;
> -
>   	drm_connector_helper_add(connector, &ast_vga_connector_helper_funcs);
>   
>   	connector->interlace_allowed = 0;
>   	connector->doublescan_allowed = 0;
> -
>   	connector->polled = DRM_CONNECTOR_POLL_CONNECT | DRM_CONNECTOR_POLL_DISCONNECT;
>   
> -	return 0;
> -}
> -
> -int ast_vga_output_init(struct ast_device *ast)
> -{
> -	struct drm_device *dev = &ast->base;
> -	struct drm_crtc *crtc = &ast->crtc;
> -	struct drm_encoder *encoder = &ast->output.vga.encoder;
> -	struct ast_connector *ast_connector = &ast->output.vga.connector;
> -	struct drm_connector *connector = &ast_connector->base;
> -	int ret;
> -
> -	ret = drm_encoder_init(dev, encoder, &ast_vga_encoder_funcs,
> -			       DRM_MODE_ENCODER_DAC, NULL);
> -	if (ret)
> -		return ret;
> -	encoder->possible_crtcs = drm_crtc_mask(crtc);
> -
> -	ret = ast_vga_connector_init(dev, connector);
> -	if (ret)
> -		return ret;
>   	ast_connector->physical_status = connector->status;
>   
>   	ret = drm_connector_attach_encoder(connector, encoder);

