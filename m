Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FF9CBF68B6
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 14:51:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DDED10E5DE;
	Tue, 21 Oct 2025 12:51:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="UWegeLBG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9F8E10E5DE
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 12:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1761051062;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TUgvyKJjSPu3KWgjI9OA8D7l95+GmQlFsSQ0tgCxkb8=;
 b=UWegeLBGBwD9H112nTE2zro9sjNjBnwxTPzNAYMGoFNWgn+avoy9fGIAyoBppGhfGsYKf4
 xBhUlQndaZ5BNgLOFPztBl6amIre3hchMba+swJS9ANQtS8cmjlE9qXSru1izC/M3Tng0F
 kgEiAnWoAlhFPLnY5NHDVkEf/r3OeDk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-19-TXucnd2vPNGPYB17iotPww-1; Tue, 21 Oct 2025 08:51:01 -0400
X-MC-Unique: TXucnd2vPNGPYB17iotPww-1
X-Mimecast-MFC-AGG-ID: TXucnd2vPNGPYB17iotPww_1761051061
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-42700099ff5so4400151f8f.2
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 05:51:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761051060; x=1761655860;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TUgvyKJjSPu3KWgjI9OA8D7l95+GmQlFsSQ0tgCxkb8=;
 b=IMgSHzt93qa+qkhyG0tGELIwcaRfABtP/YD54+4dy0flSCf41QKy9XQCdkfNBMQp2Q
 tu+GsblZwji8xaXLyAteiNN5eZLlVZlt5G84idE2yXcDzqRH/BpIbxH+nkSwLWp58ot8
 X907zqm5pDsTWEcu8yIbooCFe38fkQIh73ZfPtJmBH1HpHNEXiIXOKD4vo7T1J/OqzSL
 GbDNPC7m37QHHpyRF8owcC9i0EAnOMrKK+Ow7Xu85LLv0yThAMXRPPzIP5KuBsQMhaVY
 y8VVZO7h4Hof91C3esaQpbtRCHh2ju0Cz45mpa3cDy/oQiPp/9qwJ2SLSwDFgNYmGV4L
 06lQ==
X-Gm-Message-State: AOJu0Yw9ZRfkUOikWfcivsoCZ8F+utr2U3WYXP4wK/XCWehvjrnYqOku
 lHx5cZQVWYYuh+q0Wtz6yQ/wz6KIqTMV/KOov/kxBN501Xd1WAaOJQlXNIAk0ZYlR/V7zNlGmzO
 khErfv2MYW4OVFlrfAOvcyY4iaCr9Dm5ZbcJ5RtKXAAqMrjf5wbwt/5zBEtF/+UQ0CvV3acRiCi
 KiTQ==
X-Gm-Gg: ASbGnctYLQ6tUXi8htGrnMRLm54WR2Jsk3r/qX0U9MT6uBbc175HvqC9Djw5tGasQlh
 uNuFUT7QEs5xmRFv52TPm/hpR9iyPgvzcD5NljVmICTJ9sEH5sJJuy65Ui1rJyk6ihuvNzMe5CM
 7XGoyhH4Gw70N0sMtmBoecgDoZxyfcYuLQI6PEE9GKGIeeP5cALoLbLRqX4dKgw0b4VHJU1VANM
 RZeCZE/KBLejugyvxHhKJ98d4dTskAYgPef63tsC08hfWV4PyqrGAO76+5wRhcktsnx9M/oCSo9
 LHrbHcthFlpPb5ouAM36km1hddKZnRyVD/o3vwd4OecajzrtiOrG+MaEHtteGpHRv1eWTKnHfer
 NSmS2qEjzC1BBFIPNPK6ztDy2Gcv3wjsw/Q/hmrA=
X-Received: by 2002:a05:6000:1a8e:b0:410:3a4f:1298 with SMTP id
 ffacd0b85a97d-42704d86b8fmr11322250f8f.15.1761051060207; 
 Tue, 21 Oct 2025 05:51:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEWjf6B2ByHTOy8FrT+rzfF6XIRgkXbcgq+Q5Z2ge4eNqJwo/6jlSbkSO3I+7zpf3gS36lJWg==
X-Received: by 2002:a05:6000:1a8e:b0:410:3a4f:1298 with SMTP id
 ffacd0b85a97d-42704d86b8fmr11322224f8f.15.1761051059713; 
 Tue, 21 Oct 2025 05:50:59 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:8998:e0cf:68cc:1b62?
 ([2a01:e0a:c:37e0:8998:e0cf:68cc:1b62])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-427ea5b3c56sm20473660f8f.18.2025.10.21.05.50.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Oct 2025 05:50:59 -0700 (PDT)
Message-ID: <2951cbcf-f5fa-4c3f-b8e8-9cc91914176d@redhat.com>
Date: Tue, 21 Oct 2025 14:50:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] drm/client: Remove drm_client_framebuffer_delete()
To: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
 rrameshbabu@nvidia.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org
References: <20251020151402.53013-1-tzimmermann@suse.de>
 <20251020151402.53013-6-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20251020151402.53013-6-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Nb3iJuihDZeViL1LVZNvWjhttUAnEZ49Bq3sM8nnE80_1761051061
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
> Release client buffers with drm_client_buffer_delete() instead of
> drm_client_framebuffer_delete(). The latter is just a tiny wrapper
> around the former.
> 
> Move the test for !buffer into drm_client_buffer_delete(), although
> all callers appear to always have a valid pointer.


A minor issue below, with that fixed:

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>


> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/clients/drm_log.c |  4 ++--
>   drivers/gpu/drm/drm_client.c      | 25 ++++++++++---------------
>   drivers/gpu/drm/drm_fbdev_dma.c   |  6 +++---
>   drivers/gpu/drm/drm_fbdev_shmem.c |  4 ++--
>   drivers/gpu/drm/drm_fbdev_ttm.c   |  8 ++++----
>   include/drm/drm_client.h          |  2 +-
>   6 files changed, 22 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/gpu/drm/clients/drm_log.c b/drivers/gpu/drm/clients/drm_log.c
> index fd8556dd58ed..2d748ab318fe 100644
> --- a/drivers/gpu/drm/clients/drm_log.c
> +++ b/drivers/gpu/drm/clients/drm_log.c
> @@ -272,7 +272,7 @@ static void drm_log_init_client(struct drm_log *dlog)
>   
>   err_failed_commit:
>   	for (i = 0; i < n_modeset; i++)
> -		drm_client_framebuffer_delete(dlog->scanout[i].buffer);
> +		drm_client_buffer_delete(dlog->scanout[i].buffer);
>   
>   err_nomodeset:
>   	kfree(dlog->scanout);
> @@ -286,7 +286,7 @@ static void drm_log_free_scanout(struct drm_client_dev *client)
>   
>   	if (dlog->n_scanout) {
>   		for (i = 0; i < dlog->n_scanout; i++)
> -			drm_client_framebuffer_delete(dlog->scanout[i].buffer);
> +			drm_client_buffer_delete(dlog->scanout[i].buffer);
>   		dlog->n_scanout = 0;
>   		kfree(dlog->scanout);
>   		dlog->scanout = NULL;
> diff --git a/drivers/gpu/drm/drm_client.c b/drivers/gpu/drm/drm_client.c
> index 29ed5f55b5f9..d4c424ff44a9 100644
> --- a/drivers/gpu/drm/drm_client.c
> +++ b/drivers/gpu/drm/drm_client.c
> @@ -173,11 +173,18 @@ void drm_client_release(struct drm_client_dev *client)
>   }
>   EXPORT_SYMBOL(drm_client_release);
>   
> -static void drm_client_buffer_delete(struct drm_client_buffer *buffer)
> +/**
> + * drm_client_buffer_delete - Delete a client buffer
> + * @buffer: DRM client buffer
> + */
> +void drm_client_buffer_delete(struct drm_client_buffer *buffer)
>   {
>   	struct drm_gem_object *gem = drm_gem_fb_get_obj(buffer->fb, 0);
>   	int ret;
>   
> +	if (!buffer)
> +		return;
> +

It's too late to check, as you already used buffer->fb in the previous line.

>   	drm_gem_vunmap(gem, &buffer->map);
>   
>   	ret = drm_mode_rmfb(buffer->client->dev, buffer->fb->base.id, buffer->client->file);
> @@ -189,6 +196,7 @@ static void drm_client_buffer_delete(struct drm_client_buffer *buffer)
>   
>   	kfree(buffer);
>   }
> +EXPORT_SYMBOL(drm_client_buffer_delete);
>   
>   static struct drm_client_buffer *
>   drm_client_buffer_create(struct drm_client_dev *client, u32 width, u32 height,
> @@ -372,7 +380,7 @@ EXPORT_SYMBOL(drm_client_buffer_vunmap);
>    *
>    * This function creates a &drm_client_buffer which consists of a
>    * &drm_framebuffer backed by a dumb buffer.
> - * Call drm_client_framebuffer_delete() to free the buffer.
> + * Call drm_client_buffer_delete() to free the buffer.
>    *
>    * Returns:
>    * Pointer to a client buffer or an error pointer on failure.
> @@ -416,19 +424,6 @@ drm_client_framebuffer_create(struct drm_client_dev *client, u32 width, u32 heig
>   }
>   EXPORT_SYMBOL(drm_client_framebuffer_create);
>   
> -/**
> - * drm_client_framebuffer_delete - Delete a client framebuffer
> - * @buffer: DRM client buffer (can be NULL)
> - */
> -void drm_client_framebuffer_delete(struct drm_client_buffer *buffer)
> -{
> -	if (!buffer)
> -		return;
> -
> -	drm_client_buffer_delete(buffer);
> -}
> -EXPORT_SYMBOL(drm_client_framebuffer_delete);
> -
>   /**
>    * drm_client_framebuffer_flush - Manually flush client framebuffer
>    * @buffer: DRM client buffer (can be NULL)
> diff --git a/drivers/gpu/drm/drm_fbdev_dma.c b/drivers/gpu/drm/drm_fbdev_dma.c
> index 8bd626ef16c7..17fef288e86b 100644
> --- a/drivers/gpu/drm/drm_fbdev_dma.c
> +++ b/drivers/gpu/drm/drm_fbdev_dma.c
> @@ -55,7 +55,7 @@ static void drm_fbdev_dma_fb_destroy(struct fb_info *info)
>   	drm_fb_helper_fini(fb_helper);
>   
>   	drm_client_buffer_vunmap(fb_helper->buffer);
> -	drm_client_framebuffer_delete(fb_helper->buffer);
> +	drm_client_buffer_delete(fb_helper->buffer);
>   	drm_client_release(&fb_helper->client);
>   	drm_fb_helper_unprepare(fb_helper);
>   	kfree(fb_helper);
> @@ -90,7 +90,7 @@ static void drm_fbdev_dma_shadowed_fb_destroy(struct fb_info *info)
>   	vfree(shadow);
>   
>   	drm_client_buffer_vunmap(fb_helper->buffer);
> -	drm_client_framebuffer_delete(fb_helper->buffer);
> +	drm_client_buffer_delete(fb_helper->buffer);
>   	drm_client_release(&fb_helper->client);
>   	drm_fb_helper_unprepare(fb_helper);
>   	kfree(fb_helper);
> @@ -328,7 +328,7 @@ int drm_fbdev_dma_driver_fbdev_probe(struct drm_fb_helper *fb_helper,
>   	fb_helper->buffer = NULL;
>   	drm_client_buffer_vunmap(buffer);
>   err_drm_client_buffer_delete:
> -	drm_client_framebuffer_delete(buffer);
> +	drm_client_buffer_delete(buffer);
>   	return ret;
>   }
>   EXPORT_SYMBOL(drm_fbdev_dma_driver_fbdev_probe);
> diff --git a/drivers/gpu/drm/drm_fbdev_shmem.c b/drivers/gpu/drm/drm_fbdev_shmem.c
> index 1e827bf8b815..f7966b8c51cd 100644
> --- a/drivers/gpu/drm/drm_fbdev_shmem.c
> +++ b/drivers/gpu/drm/drm_fbdev_shmem.c
> @@ -63,7 +63,7 @@ static void drm_fbdev_shmem_fb_destroy(struct fb_info *info)
>   	drm_fb_helper_fini(fb_helper);
>   
>   	drm_client_buffer_vunmap(fb_helper->buffer);
> -	drm_client_framebuffer_delete(fb_helper->buffer);
> +	drm_client_buffer_delete(fb_helper->buffer);
>   	drm_client_release(&fb_helper->client);
>   	drm_fb_helper_unprepare(fb_helper);
>   	kfree(fb_helper);
> @@ -206,7 +206,7 @@ int drm_fbdev_shmem_driver_fbdev_probe(struct drm_fb_helper *fb_helper,
>   	fb_helper->buffer = NULL;
>   	drm_client_buffer_vunmap(buffer);
>   err_drm_client_buffer_delete:
> -	drm_client_framebuffer_delete(buffer);
> +	drm_client_buffer_delete(buffer);
>   	return ret;
>   }
>   EXPORT_SYMBOL(drm_fbdev_shmem_driver_fbdev_probe);
> diff --git a/drivers/gpu/drm/drm_fbdev_ttm.c b/drivers/gpu/drm/drm_fbdev_ttm.c
> index 85feb55bba11..54f9a46b96c2 100644
> --- a/drivers/gpu/drm/drm_fbdev_ttm.c
> +++ b/drivers/gpu/drm/drm_fbdev_ttm.c
> @@ -50,7 +50,7 @@ static void drm_fbdev_ttm_fb_destroy(struct fb_info *info)
>   	fb_deferred_io_cleanup(info);
>   	drm_fb_helper_fini(fb_helper);
>   	vfree(shadow);
> -	drm_client_framebuffer_delete(fb_helper->buffer);
> +	drm_client_buffer_delete(fb_helper->buffer);
>   
>   	drm_client_release(&fb_helper->client);
>   	drm_fb_helper_unprepare(fb_helper);
> @@ -202,7 +202,7 @@ int drm_fbdev_ttm_driver_fbdev_probe(struct drm_fb_helper *fb_helper,
>   	screen_buffer = vzalloc(screen_size);
>   	if (!screen_buffer) {
>   		ret = -ENOMEM;
> -		goto err_drm_client_framebuffer_delete;
> +		goto err_drm_client_buffer_delete;
>   	}
>   
>   	info = drm_fb_helper_alloc_info(fb_helper);
> @@ -235,10 +235,10 @@ int drm_fbdev_ttm_driver_fbdev_probe(struct drm_fb_helper *fb_helper,
>   	drm_fb_helper_release_info(fb_helper);
>   err_vfree:
>   	vfree(screen_buffer);
> -err_drm_client_framebuffer_delete:
> +err_drm_client_buffer_delete:
>   	fb_helper->fb = NULL;
>   	fb_helper->buffer = NULL;
> -	drm_client_framebuffer_delete(buffer);
> +	drm_client_buffer_delete(buffer);
>   	return ret;
>   }
>   EXPORT_SYMBOL(drm_fbdev_ttm_driver_fbdev_probe);
> diff --git a/include/drm/drm_client.h b/include/drm/drm_client.h
> index 5909664d4d43..6019f2712448 100644
> --- a/include/drm/drm_client.h
> +++ b/include/drm/drm_client.h
> @@ -185,7 +185,7 @@ struct drm_client_buffer {
>   
>   struct drm_client_buffer *
>   drm_client_framebuffer_create(struct drm_client_dev *client, u32 width, u32 height, u32 format);
> -void drm_client_framebuffer_delete(struct drm_client_buffer *buffer);
> +void drm_client_buffer_delete(struct drm_client_buffer *buffer);
>   int drm_client_framebuffer_flush(struct drm_client_buffer *buffer, struct drm_rect *rect);
>   int drm_client_buffer_vmap_local(struct drm_client_buffer *buffer,
>   				 struct iosys_map *map_copy);

