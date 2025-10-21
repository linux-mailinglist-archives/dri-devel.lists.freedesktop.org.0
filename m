Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81353BF688F
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 14:49:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A08D410E2F9;
	Tue, 21 Oct 2025 12:49:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="G/hqdvVC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F63A10E2F9
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 12:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1761050952;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NotgoKovng1iy+0xpZ6BU/lVjcuGwV7UFwjMJDqBXWM=;
 b=G/hqdvVCiQCFt6tn3iwvz1SSYt6zZI1J3a+ZpW2XsrIYb4y55ssTnEWuRi80YUNaZ4BV5s
 SnXPAkUTRGsH5m1SruUBGO+GTIT2ZkkdnpV27PBuAa+cAfbXyqqfMVsvMycHRpfwpPkICc
 fnPk0hwAMNl+IA3zZpv1pOsILHvQ5y4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-636-kqV8saaOOF-cFB2bWWQ3Mg-1; Tue, 21 Oct 2025 08:49:10 -0400
X-MC-Unique: kqV8saaOOF-cFB2bWWQ3Mg-1
X-Mimecast-MFC-AGG-ID: kqV8saaOOF-cFB2bWWQ3Mg_1761050949
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-471005f28d2so21569615e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 05:49:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761050949; x=1761655749;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NotgoKovng1iy+0xpZ6BU/lVjcuGwV7UFwjMJDqBXWM=;
 b=ECwPL8HHXQPSfnAzbjeytADmlUX1jp6pYEUeHSY74j0rkap/AaNdF1/84+ojUeK/vX
 /DJVa+b3UwjyekKqNsoBgCCmkkNG17/qAhh8sNAaSDXGBr8g1U5A9H/X9TRAePaF2SE+
 zdu/l2DToFxCp++GkVar01Kxh2nLKSe590HCUlvo2sSs4HnOLuCMuIakUUf8OURHg1gy
 lHvSeURu8V0KO428oBibWuoyXpCULLW614N3jNUE4nSfMxngGYFe+sDqQRkdljbuxbB6
 zNfcdmfsXmJcBN9hi+sBC14A3ajV9DYmntfA/zzeVsJTOdvotqQtOuIDMdfjcNAq6hTP
 q5HA==
X-Gm-Message-State: AOJu0YwgY8FZ25Cd54XrsIcmNWBhYf3bdDf8ZYfQHNXyT+awXWc0Q0h3
 1lsQ1iRrxYPFozMY9HzS9teD8PRm1HpMP6IsWLOC9KcHnJrzqBVkVA+DW8E0zU704Ubj64iOgY9
 vAe+LrZbTk87crn776x9ARw0IPgj34YWww4F0PNtoi29y1ISNBkQ5HgiV8GUxEDmkrz6EmQ==
X-Gm-Gg: ASbGncszT3W7qpHJeaFLamewwDHQsgTcxZ87WFvtDKrVrndebUZxSq+NwIVLaVk/+xO
 FYt06E7/N7klzvnC361RWzrNomCWMHYM2pOhig/BKyNAMZ9/bZvtOf4xJ9OilNQONYZ4/yM/Afj
 tn+wC5BClxhJynWNs4LOOHk5tCUEsMCXqUN4WdWUMLP04ZVKPGtGJHg8tj00mImMz1pFW5eno4p
 CccuDasxCl4/NuWCoc+kt0csBxAol+hfiQbjK46gH2tVbC5CwcEojPN+Fzp2ZYWg0aufbV/q91h
 bBvVIG9ImIkYNLsbFQhADSsGtRXNY1ixma23awXbFCREF5Ii3kv3vdv5q5AglMjiKuR7H1MYn33
 nKYmPZbXz2+KQr5Tbh1SS2Koi+OD1djJEVBCnuGQ=
X-Received: by 2002:a05:600c:3492:b0:46e:33b2:c8da with SMTP id
 5b1f17b1804b1-4711791cadfmr146170845e9.32.1761050949426; 
 Tue, 21 Oct 2025 05:49:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEZvGLG+4O4+8tcsZ0H2qZUwGE2TzgllXp8mzAZGq8ee+8KjdZQgUv57Azkf47sFP7cA1RkiQ==
X-Received: by 2002:a05:600c:3492:b0:46e:33b2:c8da with SMTP id
 5b1f17b1804b1-4711791cadfmr146170595e9.32.1761050949029; 
 Tue, 21 Oct 2025 05:49:09 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:8998:e0cf:68cc:1b62?
 ([2a01:e0a:c:37e0:8998:e0cf:68cc:1b62])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47154d382d8sm199012585e9.12.2025.10.21.05.49.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Oct 2025 05:49:08 -0700 (PDT)
Message-ID: <9c4e9000-7196-42c3-a76d-333ae037af29@redhat.com>
Date: Tue, 21 Oct 2025 14:49:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] drm/client: Inline drm_client_buffer_addfb() and
 _rmfb()
To: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
 rrameshbabu@nvidia.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org
References: <20251020151402.53013-1-tzimmermann@suse.de>
 <20251020151402.53013-4-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20251020151402.53013-4-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 5225BeqrdcHgH9kM4cgm37xuHuYc7DK5Ib38xmjeJp0_1761050949
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

On 20/10/2025 17:04, Thomas Zimmermann wrote:
> Creating and deleting a client buffer always creates and deletes
> the underlying DRM framebuffer. Inline the helper functions into
> their callers.
> 
> With the _addfb code being inlined into drm_client_buffer_create(),
> clean up the function's error rollback to release the framebuffer's
> handle and GEM buffer object as needed.
> 
> Move the _rmfb code into drm_client_buffer_delete() rather than its
> current location in drm_client_framebuffer_delete(). The former is
> now the inverse of drm_client_buffer_create(). Makes no difference
> for cleaning up. Also prepares for the removal of
> drm_client_framebuffer_delete().

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>


> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/drm_client.c | 93 ++++++++++++++++--------------------
>   1 file changed, 40 insertions(+), 53 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_client.c b/drivers/gpu/drm/drm_client.c
> index 9bf2edfb7b64..73ae63f856a0 100644
> --- a/drivers/gpu/drm/drm_client.c
> +++ b/drivers/gpu/drm/drm_client.c
> @@ -174,6 +174,13 @@ EXPORT_SYMBOL(drm_client_release);
>   
>   static void drm_client_buffer_delete(struct drm_client_buffer *buffer)
>   {
> +	int ret;
> +
> +	ret = drm_mode_rmfb(buffer->client->dev, buffer->fb->base.id, buffer->client->file);
> +	if (ret)
> +		drm_err(buffer->client->dev,
> +			"Error removing FB:%u (%d)\n", buffer->fb->base.id, ret);
> +
>   	if (buffer->gem) {
>   		drm_gem_vunmap(buffer->gem, &buffer->map);
>   		drm_gem_object_put(buffer->gem);
> @@ -186,8 +193,21 @@ static struct drm_client_buffer *
>   drm_client_buffer_create(struct drm_client_dev *client, u32 width, u32 height,
>   			 u32 format, u32 handle, u32 pitch)
>   {
> +	struct drm_mode_fb_cmd2 fb_req = {
> +		.width = width,
> +		.height = height,
> +		.pixel_format = format,
> +		.handles = {
> +			handle,
> +		},
> +		.pitches = {
> +			pitch,
> +		},
> +	};
> +	struct drm_device *dev = client->dev;
>   	struct drm_client_buffer *buffer;
>   	struct drm_gem_object *obj;
> +	struct drm_framebuffer *fb;
>   	int ret;
>   
>   	buffer = kzalloc(sizeof(*buffer), GFP_KERNEL);
> @@ -202,10 +222,30 @@ drm_client_buffer_create(struct drm_client_dev *client, u32 width, u32 height,
>   		goto err_delete;
>   	}
>   
> +	ret = drm_mode_addfb2(dev, &fb_req, client->file);
> +	if (ret)
> +		goto err_drm_gem_object_put;
> +
> +	fb = drm_framebuffer_lookup(dev, client->file, fb_req.fb_id);
> +	if (drm_WARN_ON(dev, !fb)) {
> +		ret = -ENOENT;
> +		goto err_drm_mode_rmfb;
> +	}
> +
> +	/* drop the reference we picked up in framebuffer lookup */
> +	drm_framebuffer_put(fb);
> +
> +	strscpy(fb->comm, client->name, TASK_COMM_LEN);
> +
>   	buffer->gem = obj;
> +	buffer->fb = fb;
>   
>   	return buffer;
>   
> +err_drm_mode_rmfb:
> +	drm_mode_rmfb(dev, fb_req.fb_id, client->file);
> +err_drm_gem_object_put:
> +	drm_gem_object_put(obj);
>   err_delete:
>   	kfree(buffer);
>   	return ERR_PTR(ret);
> @@ -319,51 +359,6 @@ void drm_client_buffer_vunmap(struct drm_client_buffer *buffer)
>   }
>   EXPORT_SYMBOL(drm_client_buffer_vunmap);
>   
> -static void drm_client_buffer_rmfb(struct drm_client_buffer *buffer)
> -{
> -	int ret;
> -
> -	if (!buffer->fb)
> -		return;
> -
> -	ret = drm_mode_rmfb(buffer->client->dev, buffer->fb->base.id, buffer->client->file);
> -	if (ret)
> -		drm_err(buffer->client->dev,
> -			"Error removing FB:%u (%d)\n", buffer->fb->base.id, ret);
> -
> -	buffer->fb = NULL;
> -}
> -
> -static int drm_client_buffer_addfb(struct drm_client_buffer *buffer,
> -				   u32 width, u32 height, u32 format,
> -				   u32 handle, u32 pitch)
> -{
> -	struct drm_client_dev *client = buffer->client;
> -	struct drm_mode_fb_cmd2 fb_req = { };
> -	int ret;
> -
> -	fb_req.width = width;
> -	fb_req.height = height;
> -	fb_req.pixel_format = format;
> -	fb_req.handles[0] = handle;
> -	fb_req.pitches[0] = pitch;
> -
> -	ret = drm_mode_addfb2(client->dev, &fb_req, client->file);
> -	if (ret)
> -		return ret;
> -
> -	buffer->fb = drm_framebuffer_lookup(client->dev, buffer->client->file, fb_req.fb_id);
> -	if (WARN_ON(!buffer->fb))
> -		return -ENOENT;
> -
> -	/* drop the reference we picked up in framebuffer lookup */
> -	drm_framebuffer_put(buffer->fb);
> -
> -	strscpy(buffer->fb->comm, client->name, TASK_COMM_LEN);
> -
> -	return 0;
> -}
> -
>   /**
>    * drm_client_framebuffer_create - Create a client framebuffer
>    * @client: DRM client
> @@ -401,11 +396,6 @@ drm_client_framebuffer_create(struct drm_client_dev *client, u32 width, u32 heig
>   		goto err_drm_mode_destroy_dumb;
>   	}
>   
> -	ret = drm_client_buffer_addfb(buffer, width, height, format,
> -				      dumb_args.handle, dumb_args.pitch);
> -	if (ret)
> -		goto err_drm_client_buffer_delete;
> -
>   	/*
>   	 * The handle is only needed for creating the framebuffer, destroy it
>   	 * again to solve a circular dependency should anybody export the GEM
> @@ -416,8 +406,6 @@ drm_client_framebuffer_create(struct drm_client_dev *client, u32 width, u32 heig
>   
>   	return buffer;
>   
> -err_drm_client_buffer_delete:
> -	drm_client_buffer_delete(buffer);
>   err_drm_mode_destroy_dumb:
>   	drm_mode_destroy_dumb(client->dev, dumb_args.handle, client->file);
>   	return ERR_PTR(ret);
> @@ -433,7 +421,6 @@ void drm_client_framebuffer_delete(struct drm_client_buffer *buffer)
>   	if (!buffer)
>   		return;
>   
> -	drm_client_buffer_rmfb(buffer);
>   	drm_client_buffer_delete(buffer);
>   }
>   EXPORT_SYMBOL(drm_client_framebuffer_delete);

