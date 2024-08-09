Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E0A294CF78
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2024 13:45:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B9CC10E8D2;
	Fri,  9 Aug 2024 11:45:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="UqycGDwF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2550910E8D2
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Aug 2024 11:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1723203924;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+oRfBnoESrVUyxOJmIqEdIaQf8o3VQAqYIkgZ5io67k=;
 b=UqycGDwF8VdiPGJYEivC+n4IgLkUTlrLgaAlfZHjF0I/T9cTq3HOXMK2T7ogOTSVbYK4qc
 JE+/Ypfq5cnebjNULS6W67fWZxVXkCVXgMAVMP6uYQkW1EYkcjIlmMW+E289Q7bRf71ZNy
 B5dHiNd7aqdO/T2j8wx2xxTB8vxYHkE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-657-7nPuQLzcOVmR-qvJ7SssxQ-1; Fri, 09 Aug 2024 07:45:23 -0400
X-MC-Unique: 7nPuQLzcOVmR-qvJ7SssxQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-428076fef5dso13943145e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Aug 2024 04:45:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723203922; x=1723808722;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+oRfBnoESrVUyxOJmIqEdIaQf8o3VQAqYIkgZ5io67k=;
 b=uT9Q4jBk0tqngPcpER6hWmJVIYs03zvfUaEjOYQ4xg6v+IJEWRew99kNud9ohLO6Ki
 qS0amLqWI3bfxb1ax+iyp0pfH/BqGKDzhgRhTiFKsYzLXGRey7LXHqdFbV3unEi6mTQP
 xYi1nGr4nWLqKHza9z+cea7zBbZG+rwOjOFqjdDPX9Vw7reIeXu/yiJbVHQvZgjLfyR/
 PsQcFWv1V9Gd8KZThDfSiiFnZ5rz3LR3Wh4H7tRRk7IWwCQ5nIszRWDehIuYvo7Ra2u4
 gAQ+N4wtz+Z7ax3cklMSwGVNbL+JNDsfpJZckIaIsAcLk5Gz6MelEbTmxaoao6L43fxe
 YSNQ==
X-Gm-Message-State: AOJu0Yx63ELykuzolUzdwJsIkxSZvk3ngm2VARVsoGUIwHecDMNed6Px
 90do62MoscLQkxWlxN3LpydBgHWqBMnpO+a195sTETFy2bFWpl+0KJW8WG8c99f9CZsZjKr98J4
 wJ9mZn4Q5NzuFVt9/Rt2rrt6FbzsIgWUOOZaWyqxAckybjuH3pk8z7ZWYz5vIXmXd7A==
X-Received: by 2002:a05:600c:4f0d:b0:426:5ee5:3130 with SMTP id
 5b1f17b1804b1-429c3a17ebamr8849865e9.3.1723203921729; 
 Fri, 09 Aug 2024 04:45:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFTuWWDO9REVAoKhV9XTSssERq7p2FCwROd7x/uNpgZBwOM/Qnojd1LNv/ArjyIDQZLrTVp0Q==
X-Received: by 2002:a05:600c:4f0d:b0:426:5ee5:3130 with SMTP id
 5b1f17b1804b1-429c3a17ebamr8849605e9.3.1723203921181; 
 Fri, 09 Aug 2024 04:45:21 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42905971d1dsm123583075e9.20.2024.08.09.04.45.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Aug 2024 04:45:20 -0700 (PDT)
Message-ID: <9ed26274-7263-49d6-a845-5b6cc91ba4fd@redhat.com>
Date: Fri, 9 Aug 2024 13:45:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/9] drm/ast: astdp: Move locking into EDID helper
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 daniel@ffwll.ch, airlied@gmail.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org
References: <20240806125601.78650-1-tzimmermann@suse.de>
 <20240806125601.78650-3-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20240806125601.78650-3-tzimmermann@suse.de>
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

On 06/08/2024 14:51, Thomas Zimmermann wrote:
> The modeset mutex protects EDID retrival from concurrent modeset
> operations. Acquire the lock in ast_astdp_read_edid(). Prepares the
> code for conversion to struct drm_edid.

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/ast/ast_dp.c | 24 ++++++++++--------------
>   1 file changed, 10 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ast/ast_dp.c b/drivers/gpu/drm/ast/ast_dp.c
> index ef2dd9d82de9..217c155f0874 100644
> --- a/drivers/gpu/drm/ast/ast_dp.c
> +++ b/drivers/gpu/drm/ast/ast_dp.c
> @@ -26,6 +26,12 @@ static int ast_astdp_read_edid(struct drm_device *dev, u8 *ediddata)
>   	int ret = 0;
>   	u8 i;
>   
> +	/*
> +	 * Protect access to I/O registers from concurrent modesetting
> +	 * by acquiring the I/O-register lock.
> +	 */
> +	mutex_lock(&ast->modeset_lock);
> +
>   	/* Start reading EDID data */
>   	ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xe5, (u8)~AST_IO_VGACRE5_EDID_READ_DONE, 0x00);
>   
> @@ -95,6 +101,8 @@ static int ast_astdp_read_edid(struct drm_device *dev, u8 *ediddata)
>   	ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xe5, (u8)~AST_IO_VGACRE5_EDID_READ_DONE,
>   			       AST_IO_VGACRE5_EDID_READ_DONE);
>   
> +	mutex_unlock(&ast->modeset_lock);
> +
>   	return ret;
>   }
>   
> @@ -323,9 +331,6 @@ static const struct drm_encoder_helper_funcs ast_astdp_encoder_helper_funcs = {
>   static int ast_astdp_connector_helper_get_modes(struct drm_connector *connector)
>   {
>   	void *edid;
> -	struct drm_device *dev = connector->dev;
> -	struct ast_device *ast = to_ast_device(dev);
> -
>   	int succ;
>   	int count;
>   
> @@ -333,17 +338,9 @@ static int ast_astdp_connector_helper_get_modes(struct drm_connector *connector)
>   	if (!edid)
>   		goto err_drm_connector_update_edid_property;
>   
> -	/*
> -	 * Protect access to I/O registers from concurrent modesetting
> -	 * by acquiring the I/O-register lock.
> -	 */
> -	mutex_lock(&ast->modeset_lock);
> -
>   	succ = ast_astdp_read_edid(connector->dev, edid);
>   	if (succ < 0)
> -		goto err_mutex_unlock;
> -
> -	mutex_unlock(&ast->modeset_lock);
> +		goto err_kfree;
>   
>   	drm_connector_update_edid_property(connector, edid);
>   	count = drm_add_edid_modes(connector, edid);
> @@ -351,8 +348,7 @@ static int ast_astdp_connector_helper_get_modes(struct drm_connector *connector)
>   
>   	return count;
>   
> -err_mutex_unlock:
> -	mutex_unlock(&ast->modeset_lock);
> +err_kfree:
>   	kfree(edid);
>   err_drm_connector_update_edid_property:
>   	drm_connector_update_edid_property(connector, NULL);

