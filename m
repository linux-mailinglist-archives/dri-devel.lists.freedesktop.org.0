Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C067A976B12
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2024 15:48:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 439C910EB94;
	Thu, 12 Sep 2024 13:48:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="SwChi/K8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F63710EB94
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2024 13:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1726148918;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h79LItYHB6bz8IcuLEeEtPoYuohcEAzqqitXhZruIS8=;
 b=SwChi/K84CD5LtbCEw/M2u5bMJvh6V/OpnK5Q0jC1lkVNapYSpqBocQH8wPHulnrqhui48
 zpCtrNWNlub1ZwzyBg5xXRa7z4deKSY3sq3eLN8DtENhm3m/+c7VlUfck+B6dPXjCoPiqU
 fSo0E9TE6h+DCfXSSPrafq2/HjLpezY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-80-8-D7o5CiNEa1A9i_0xgFRg-1; Thu, 12 Sep 2024 09:48:37 -0400
X-MC-Unique: 8-D7o5CiNEa1A9i_0xgFRg-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-378ab5b74e1so482072f8f.3
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2024 06:48:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726148916; x=1726753716;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=h79LItYHB6bz8IcuLEeEtPoYuohcEAzqqitXhZruIS8=;
 b=C15ZBqTapRp6le/jvjyGCDT7/Oik7R977ykOtCcMJ3TMDjrqB/yz9OurH2TQO3iOjs
 m8yWhraqjnNJxgIJt7BSRrGtyJyh3RqGWvLVlabLb8sRx/8EdspV8NKC3DeFu3emOIi/
 GT7S1ZluYbzEzahcOb38mxKVkLN3iBSj5Tp5HZDzzIKdHtcnPjGaf19kY8C/OKwajI69
 T4DSyL4EluNF1+JEDZ3OYzhCFC9vvhJN0FAWGDfTAOSG6juq4beCOmSf59BsHIxjrOa3
 AfdwBhVtxgMkwit23+E16elVE8awSThPo/zhdpJNhHe7idQiU7uWjCyGl+8ZHVV9tXMF
 9cUw==
X-Gm-Message-State: AOJu0YyeYUbDW2zzulevVHKL5T47keW9pnKKMRHMgXfBpM8rqb1tU7QT
 3xymVWV5rr19AubNHM5YGgqAym+fXZv+cuPwtBzVFVT+U+S3ZzdvG1c2G5zXKcF1tCU8mec06U4
 PWN4nVuqGD4c+ZPWUJ1Nev2UGQlJoJeX0SVKOiSJDjFoLKR/WUSSANAT6wyTqL9rkIA==
X-Received: by 2002:a5d:6a92:0:b0:368:3b1f:fe40 with SMTP id
 ffacd0b85a97d-378c2cf3f44mr1478041f8f.20.1726148916164; 
 Thu, 12 Sep 2024 06:48:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFQQiko5oB5KKM9lBe6+4tmOXDA3Qanx9lT1ffU2yMPXB11QApDls2x3INZPUo7WldW4IZ7KA==
X-Received: by 2002:a5d:6a92:0:b0:368:3b1f:fe40 with SMTP id
 ffacd0b85a97d-378c2cf3f44mr1478017f8f.20.1726148915621; 
 Thu, 12 Sep 2024 06:48:35 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-378956d35e5sm14507252f8f.76.2024.09.12.06.48.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Sep 2024 06:48:35 -0700 (PDT)
Message-ID: <064d14f0-71a6-491f-b0b9-a4c73b2564b7@redhat.com>
Date: Thu, 12 Sep 2024 15:48:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/10] drm/ast: sil164: Inline ast_sil164_connector_init()
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com
Cc: dri-devel@lists.freedesktop.org
References: <20240911115347.899148-1-tzimmermann@suse.de>
 <20240911115347.899148-8-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20240911115347.899148-8-tzimmermann@suse.de>
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
> Inline ast_sil164_connector_init() into its only caller. The helper
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
>   drivers/gpu/drm/ast/ast_sil164.c | 55 +++++++++++++++-----------------
>   1 file changed, 26 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ast/ast_sil164.c b/drivers/gpu/drm/ast/ast_sil164.c
> index 496c7120e515..6a72268d2314 100644
> --- a/drivers/gpu/drm/ast/ast_sil164.c
> +++ b/drivers/gpu/drm/ast/ast_sil164.c
> @@ -71,52 +71,49 @@ static const struct drm_connector_funcs ast_sil164_connector_funcs = {
>   	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
>   };
>   
> -static int ast_sil164_connector_init(struct drm_device *dev, struct drm_connector *connector)
> +/*
> + * Output
> + */
> +
> +int ast_sil164_output_init(struct ast_device *ast)
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
> +	encoder = &ast->output.sil164.encoder;
> +	ret = drm_encoder_init(dev, encoder, &ast_sil164_encoder_funcs,
> +			       DRM_MODE_ENCODER_TMDS, NULL);
> +	if (ret)
>   		return ret;
> -	}
> +	encoder->possible_crtcs = drm_crtc_mask(crtc);
> +
> +	/* connector */
>   
> +	ast_connector = &ast->output.sil164.connector;
> +	connector = &ast_connector->base;
>   	ret = drm_connector_init_with_ddc(dev, connector, &ast_sil164_connector_funcs,
>   					  DRM_MODE_CONNECTOR_DVII, ddc);
>   	if (ret)
>   		return ret;
> -
>   	drm_connector_helper_add(connector, &ast_sil164_connector_helper_funcs);
>   
>   	connector->interlace_allowed = 0;
>   	connector->doublescan_allowed = 0;
> -
>   	connector->polled = DRM_CONNECTOR_POLL_CONNECT | DRM_CONNECTOR_POLL_DISCONNECT;
>   
> -	return 0;
> -}
> -
> -int ast_sil164_output_init(struct ast_device *ast)
> -{
> -	struct drm_device *dev = &ast->base;
> -	struct drm_crtc *crtc = &ast->crtc;
> -	struct drm_encoder *encoder = &ast->output.sil164.encoder;
> -	struct ast_connector *ast_connector = &ast->output.sil164.connector;
> -	struct drm_connector *connector = &ast_connector->base;
> -	int ret;
> -
> -	ret = drm_encoder_init(dev, encoder, &ast_sil164_encoder_funcs,
> -			       DRM_MODE_ENCODER_TMDS, NULL);
> -	if (ret)
> -		return ret;
> -	encoder->possible_crtcs = drm_crtc_mask(crtc);
> -
> -	ret = ast_sil164_connector_init(dev, connector);
> -	if (ret)
> -		return ret;
>   	ast_connector->physical_status = connector->status;
>   
>   	ret = drm_connector_attach_encoder(connector, encoder);

