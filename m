Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65E65BF6835
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 14:45:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99E9E10E06F;
	Tue, 21 Oct 2025 12:45:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="T0Y6+zat";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31E1D10E06F
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 12:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1761050704;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y4MF8cYrtBQt6vnITZED5iizM0I9XUa6X+RyR34GMXI=;
 b=T0Y6+zat4Zga+TX3W+FEBh6fwIZckBW6T/fDn0IMT3BDFhdUJMneYHOnrn6QP5TdjUD6jE
 fHLbgie8YTF9up0GdLD8YKkrPCf3z0X77dXAqvrh+tWYn4Xp72xjMdFcW3dG+rDMg8EKMO
 HuC1v9VYgSMQeqsEyAU3kYB6GKcBDqU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-207-Sy6-E6S8Ou-EsQrslfRwKQ-1; Tue, 21 Oct 2025 08:45:00 -0400
X-MC-Unique: Sy6-E6S8Ou-EsQrslfRwKQ-1
X-Mimecast-MFC-AGG-ID: Sy6-E6S8Ou-EsQrslfRwKQ_1761050700
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-427a125c925so2463833f8f.2
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 05:45:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761050699; x=1761655499;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Y4MF8cYrtBQt6vnITZED5iizM0I9XUa6X+RyR34GMXI=;
 b=dMQrl8+SZ8FQjNNwiF6WsCt1Vebya7uukWIr8/jXaYla9b20PnfumZ2XAtmsr7UYzk
 e+y1QeO4HJHuBNSNE9Z4qnACMJvHjObwUaUwAUIfSXSniIHUKgWHkhrCYo56SPw+LYmU
 hoYKSTKFMwrB6GiLO1HDeaCLzDgWkd/42SqLrZvZ+6Pm+uxSaqAZA4qvTpibPUjQ78hP
 c8Big7JBrFgTF+4i3Pr5Y4dmRLxHCzjWzWiQEt/d4RQOtvECynxU5j8UyN0jtejWJOYg
 JL8wniAqsLsKJt1/LWyKwTDil6ImgOtBPlGewOUpjG/T0ihNbly/7vBA8mqbuiSgVab7
 jHQw==
X-Gm-Message-State: AOJu0YxQTx5xHC1t32lyZP8zoiRgVc8MF3M2Cv4+7U7654aG6wl6HG64
 AfOQpdJECUe55OCxkxXCDeMlxDHneEEI/vOCeh0BFKPBzuIrA8dFq85oI1kg4q62kHQs7KptMl4
 EtJ+eHf8BrIfSq5V2eX4LIogk8ewKIeyYhVcu+uOEYBxZhxd0OQx6xUK5CsMADjxZHI0luw==
X-Gm-Gg: ASbGnctshRAriM9WerUlC+hpwnte6aTjP6RTVw1aJbOqPLNWivkLreaygVpfB0j2uan
 5qoPicMSf7jWqhg0tcqoS01KXXC6s6ghe0nLMfUV3eM0swpbAACqJNtPq6PexCuUKQAHdouYA4T
 r2zA3phZjXOqcKz/CwV8OuU9OC908bDfQ9BFI5vxDNVSMDMPlchLRROfSU5Dz7mJMDYXkstQ5fP
 TGVtLplBak2tb1QlDvSb+YnyFf4b/041PSBBuJpTWPddV+nIn5MzlZdJ53PEE2oCkO0Z4D0odBO
 7bT2gzByIoHYfkIClP/ROQ5AmsZij1JCeWoaVqDlG9jckWtiBSvqFjgS9SqL//vNJTe7cSQUw5V
 tqKENOlt6gCmEJFyAEn0hqworhilRxie/09SV9gE=
X-Received: by 2002:a05:600c:3553:b0:471:a73:a9d2 with SMTP id
 5b1f17b1804b1-471178a6484mr119038155e9.11.1761050699577; 
 Tue, 21 Oct 2025 05:44:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF7wsge2f3lh9qh71r+hCw3X9qTOEYgCgUaInZ2KLmzY2I1qhSTzmNIPQ87dQ89T8nn9QK3KA==
X-Received: by 2002:a05:600c:3553:b0:471:a73:a9d2 with SMTP id
 5b1f17b1804b1-471178a6484mr119037905e9.11.1761050699177; 
 Tue, 21 Oct 2025 05:44:59 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:8998:e0cf:68cc:1b62?
 ([2a01:e0a:c:37e0:8998:e0cf:68cc:1b62])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-427f009a9a9sm20783866f8f.29.2025.10.21.05.44.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Oct 2025 05:44:58 -0700 (PDT)
Message-ID: <3992919c-ad69-4d1d-9867-3046f7eede24@redhat.com>
Date: Tue, 21 Oct 2025 14:44:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] drm/client: Remove pitch from struct drm_client_buffer
To: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
 rrameshbabu@nvidia.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org
References: <20251020151402.53013-1-tzimmermann@suse.de>
 <20251020151402.53013-2-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20251020151402.53013-2-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: INvhcgsQqoccSs7XzU1iJrSbXK4PLV5ig64t1eJythA_1761050700
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
> Only the client-buffer setup uses the pitch field from struct
> drm_client_buffer. Remove the field and pass the value among setup
> helpers.
> 
> Clients that need the pitch should rather look at the framebuffer's
> pitches[0] directly.

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/drm_client.c | 14 +++++++-------
>   include/drm/drm_client.h     |  5 -----
>   2 files changed, 7 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_client.c b/drivers/gpu/drm/drm_client.c
> index 3fa38d4ac70b..5fa8a1628563 100644
> --- a/drivers/gpu/drm/drm_client.c
> +++ b/drivers/gpu/drm/drm_client.c
> @@ -184,7 +184,7 @@ static void drm_client_buffer_delete(struct drm_client_buffer *buffer)
>   
>   static struct drm_client_buffer *
>   drm_client_buffer_create(struct drm_client_dev *client, u32 width, u32 height,
> -			 u32 format, u32 *handle)
> +			 u32 format, u32 *handle, u32 *pitch)
>   {
>   	const struct drm_format_info *info = drm_format_info(format);
>   	struct drm_mode_create_dumb dumb_args = { };
> @@ -212,9 +212,9 @@ drm_client_buffer_create(struct drm_client_dev *client, u32 width, u32 height,
>   		goto err_delete;
>   	}
>   
> -	buffer->pitch = dumb_args.pitch;
>   	buffer->gem = obj;
>   	*handle = dumb_args.handle;
> +	*pitch = dumb_args.pitch;
>   
>   	return buffer;
>   
> @@ -349,7 +349,7 @@ static void drm_client_buffer_rmfb(struct drm_client_buffer *buffer)
>   
>   static int drm_client_buffer_addfb(struct drm_client_buffer *buffer,
>   				   u32 width, u32 height, u32 format,
> -				   u32 handle)
> +				   u32 handle, u32 pitch)
>   {
>   	struct drm_client_dev *client = buffer->client;
>   	struct drm_mode_fb_cmd2 fb_req = { };
> @@ -359,7 +359,7 @@ static int drm_client_buffer_addfb(struct drm_client_buffer *buffer,
>   	fb_req.height = height;
>   	fb_req.pixel_format = format;
>   	fb_req.handles[0] = handle;
> -	fb_req.pitches[0] = buffer->pitch;
> +	fb_req.pitches[0] = pitch;
>   
>   	ret = drm_mode_addfb2(client->dev, &fb_req, client->file);
>   	if (ret)
> @@ -395,15 +395,15 @@ struct drm_client_buffer *
>   drm_client_framebuffer_create(struct drm_client_dev *client, u32 width, u32 height, u32 format)
>   {
>   	struct drm_client_buffer *buffer;
> -	u32 handle;
> +	u32 handle, pitch;
>   	int ret;
>   
>   	buffer = drm_client_buffer_create(client, width, height, format,
> -					  &handle);
> +					  &handle, &pitch);
>   	if (IS_ERR(buffer))
>   		return buffer;
>   
> -	ret = drm_client_buffer_addfb(buffer, width, height, format, handle);
> +	ret = drm_client_buffer_addfb(buffer, width, height, format, handle, pitch);
>   
>   	/*
>   	 * The handle is only needed for creating the framebuffer, destroy it
> diff --git a/include/drm/drm_client.h b/include/drm/drm_client.h
> index 3556928d3938..db0665263a10 100644
> --- a/include/drm/drm_client.h
> +++ b/include/drm/drm_client.h
> @@ -163,11 +163,6 @@ struct drm_client_buffer {
>   	 */
>   	struct drm_client_dev *client;
>   
> -	/**
> -	 * @pitch: Buffer pitch
> -	 */
> -	u32 pitch;
> -
>   	/**
>   	 * @gem: GEM object backing this buffer
>   	 *

