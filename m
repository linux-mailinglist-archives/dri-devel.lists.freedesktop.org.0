Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A99C2976ACF
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2024 15:39:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 224BA10EB8B;
	Thu, 12 Sep 2024 13:39:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="J3J2o/ip";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A10F110EB8B
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2024 13:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1726148338;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jjfWOsFjUhh8i8jfn7SKq5VFvhIW60zA8ix02JZThjM=;
 b=J3J2o/ip8FExD74PyJqc8IuNiOAci0Dc+50oDHinmjmiCRbthlwGXD2IvzvOej6mev/ZPs
 t555dQKgBv3MrgzGpJxWN/ixkz7UdbFzvlWdxclm/nKOTQ9O7prRX0viecyvxUiwnK3ULZ
 5Mxdt+KeSfo2iTyD36quKr5bTMmP8X4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-52-S3Mgy06QM16wS3Wy8LGSGw-1; Thu, 12 Sep 2024 09:38:57 -0400
X-MC-Unique: S3Mgy06QM16wS3Wy8LGSGw-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-42ca8037d9aso6456475e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2024 06:38:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726148336; x=1726753136;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jjfWOsFjUhh8i8jfn7SKq5VFvhIW60zA8ix02JZThjM=;
 b=i2tF466ClmWth/OmeL/S5C1addTzFniY0sL4PUzcrPaqrNGJs923OlYGoLLLO+VSPF
 zBlpi2O81tVFqY7FtIEbJApHu4UAIutlVArckV2Dwtm0U4s21GKPcUg1TocyxOumLE4x
 9DhcghR8zU/OiFtgD6eLzJg07DmGXvZJXdYXYHjYeAnHSkUFD+e62hA5EjjoOEFs6sqP
 +opXU4yzIgHed6POT0yzaCjFDHj/VWV6SZHdVMUr7zmGwRS9uXyC5KVHpIWTXSSzY5oV
 sgqE0KzbXr14k5xmPdh0Wh5scZKhO8FLXpeAEUew6OuQq1QpFT/o/xoWSQbyULADII/B
 KRHQ==
X-Gm-Message-State: AOJu0YyFckw4AA7LWjGHbtWsAsP75m2dSEPtgxCbhJyVZ086+JC47ZfG
 WWfZ1frhlbp/rbD79A9hZakgs8Xinhn4ehf2JJrKq+/iadwaq08ESReTbdp0DMX+NeiJBJHWt+q
 gT/7VDPx1dF8Mu96CcbAE1voHkh4lyvoDsHCSlU5XbxKpxTNzSlDouq3RLSZLTSTc/g==
X-Received: by 2002:a05:600c:460a:b0:42c:dce1:8915 with SMTP id
 5b1f17b1804b1-42cdce18a0bmr18422415e9.33.1726148336055; 
 Thu, 12 Sep 2024 06:38:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGVZoae1f265PgXTgbu1a0yFIXbzdmY2/BN+ZqD9T95bGDEW9E5gTHKDJpPF0/QCk5gO6qLzw==
X-Received: by 2002:a05:600c:460a:b0:42c:dce1:8915 with SMTP id
 5b1f17b1804b1-42cdce18a0bmr18422185e9.33.1726148335503; 
 Thu, 12 Sep 2024 06:38:55 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42caeb81ac0sm176193325e9.34.2024.09.12.06.38.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Sep 2024 06:38:54 -0700 (PDT)
Message-ID: <809b376b-a648-43b4-abfa-5921e1d49803@redhat.com>
Date: Thu, 12 Sep 2024 15:38:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/10] drm/ast: dp501: Inline ast_dp501_connector_init()
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com
Cc: dri-devel@lists.freedesktop.org
References: <20240911115347.899148-1-tzimmermann@suse.de>
 <20240911115347.899148-6-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20240911115347.899148-6-tzimmermann@suse.de>
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
> Inline ast_dp501_connector_init() into its only caller. The helper
> currently only does half of the connector-init work and is trivial
> enough to be inlined.
> 
> Also set the local variables for encoder and connector as late as
> possible, so that the compiler warns if we use them before having
> initialized the instance.

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/ast/ast_dp501.c | 43 ++++++++++++++++-----------------
>   1 file changed, 21 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ast/ast_dp501.c b/drivers/gpu/drm/ast/ast_dp501.c
> index 99bf44eec7b3..abb03d14c338 100644
> --- a/drivers/gpu/drm/ast/ast_dp501.c
> +++ b/drivers/gpu/drm/ast/ast_dp501.c
> @@ -567,34 +567,22 @@ static const struct drm_connector_funcs ast_dp501_connector_funcs = {
>   	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
>   };
>   
> -static int ast_dp501_connector_init(struct drm_device *dev, struct drm_connector *connector)
> -{
> -	int ret;
> -
> -	ret = drm_connector_init(dev, connector, &ast_dp501_connector_funcs,
> -				 DRM_MODE_CONNECTOR_DisplayPort);
> -	if (ret)
> -		return ret;
> -
> -	drm_connector_helper_add(connector, &ast_dp501_connector_helper_funcs);
> -
> -	connector->interlace_allowed = 0;
> -	connector->doublescan_allowed = 0;
> -
> -	connector->polled = DRM_CONNECTOR_POLL_CONNECT | DRM_CONNECTOR_POLL_DISCONNECT;
> -
> -	return 0;
> -}
> +/*
> + * Output
> + */
>   
>   int ast_dp501_output_init(struct ast_device *ast)
>   {
>   	struct drm_device *dev = &ast->base;
>   	struct drm_crtc *crtc = &ast->crtc;
> -	struct drm_encoder *encoder = &ast->output.dp501.encoder;
> -	struct ast_connector *ast_connector = &ast->output.dp501.connector;
> -	struct drm_connector *connector = &ast_connector->base;
> +	struct drm_encoder *encoder;
> +	struct ast_connector *ast_connector;
> +	struct drm_connector *connector;
>   	int ret;
>   
> +	/* encoder */
> +
> +	encoder = &ast->output.dp501.encoder;
>   	ret = drm_encoder_init(dev, encoder, &ast_dp501_encoder_funcs,
>   			       DRM_MODE_ENCODER_TMDS, NULL);
>   	if (ret)
> @@ -603,9 +591,20 @@ int ast_dp501_output_init(struct ast_device *ast)
>   
>   	encoder->possible_crtcs = drm_crtc_mask(crtc);
>   
> -	ret = ast_dp501_connector_init(dev, connector);
> +	/* connector */
> +
> +	ast_connector = &ast->output.dp501.connector;
> +	connector = &ast_connector->base;
> +	ret = drm_connector_init(dev, connector, &ast_dp501_connector_funcs,
> +				 DRM_MODE_CONNECTOR_DisplayPort);
>   	if (ret)
>   		return ret;
> +	drm_connector_helper_add(connector, &ast_dp501_connector_helper_funcs);
> +
> +	connector->interlace_allowed = 0;
> +	connector->doublescan_allowed = 0;
> +	connector->polled = DRM_CONNECTOR_POLL_CONNECT | DRM_CONNECTOR_POLL_DISCONNECT;
> +
>   	ast_connector->physical_status = connector->status;
>   
>   	ret = drm_connector_attach_encoder(connector, encoder);

