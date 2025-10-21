Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BDC4BF689B
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 14:49:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8819F10E5DF;
	Tue, 21 Oct 2025 12:49:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="bc0Kf/2e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD65F10E5DB
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 12:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1761050981;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oqT2vkxYzYXTJPeR8LEY/Mv8KKMVkwxia8flP4OZ+cs=;
 b=bc0Kf/2e6ZaRtkoPFQPNF0kyp68xpMsp0X2I3uD/k8LgGWO0d7CERwTWoa1zWnV1fvQ0TB
 5noO7GTEGFNvdp6pfSLjMRNzsX4iCnZr8YK+TaAc1MNnzv+b20PyhFiGmYByTSawTbfZNj
 YcV9IeBTiq4hzk03+5u7+NaFD52dKNM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-130-rTYiK5jQM8K2X9497I57LQ-1; Tue, 21 Oct 2025 08:49:39 -0400
X-MC-Unique: rTYiK5jQM8K2X9497I57LQ-1
X-Mimecast-MFC-AGG-ID: rTYiK5jQM8K2X9497I57LQ_1761050979
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-471193dacffso37566645e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 05:49:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761050978; x=1761655778;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oqT2vkxYzYXTJPeR8LEY/Mv8KKMVkwxia8flP4OZ+cs=;
 b=cekM8F1XJxsZY2Y/Eg88VU0Tgc3/ZoVljpGFONdwN2ttl1BCwyjWhQT612kv7XhE73
 VQgdUXcb2JWaT9UYhaLg0lvF8GeaPanCAwZFwD+cblTo4t61+rzbfSEpmB9hQYctatzZ
 1u5gziQxuLkQp/4bXJuO+8jSPLEXBO3xBwQ/+tWFLvz3Ij2v8Uvz3QRL1ydm630g/nBI
 lsF5W2VXjiqKj5ExR/0segjbLUKk9NZFvi2IyjWVpl0RnaYLCAnNouyNrTURShcszTDj
 7mdB+2ZuBp8+3VvClTQzdSg//9KUywryBEzuqn8FLqizZ5wAuqC9JcuJJ+ixUXn/TYxM
 xGDA==
X-Gm-Message-State: AOJu0YxYl8JDfVNTknLIu2yms22bpHnSFqqc1YtBtpMvPEcnvRAmJHJW
 yROUf9NIh3TJHjK59t6PCHatzWM3FPqNWzGdQ3UNf3L1gVnRlJ4ptYLhhsNEV+685OZXjSMQaYA
 oi7dgMLTLM5oCYU0D0atAPLTrPtHLwx+Clkn6BqVK2qxOthImtXBb34vEnhTbE5nz8iXjOg==
X-Gm-Gg: ASbGncuCiW+5ilUIQKbFB85fO6bu6hF6kXWUZnNhHaXy7FSU4by+acoQZQk5DoQIi+3
 m6WhPUl///Q+1adHsifkak006A2Uun/x/wP6VC+3AKKRl/azpY4LRUpMKGEx5e0XGfSq7Z97RCp
 yFQ2VV2uwTZEbL97uERF7sxSWI1GTv96SH1Fh5CT836z9xHHTYMefmVlvP7WDfq1Nc/e8FgFqKo
 81o2+DT0vn8K0SJ6RftiIV1paus9lw8Bs1GlnHdQO3JmVuX6djJjmGDqUaiJdTg5kTJ+yfd5d/N
 DmTsf5eWcRoFZ1rq6HQEcl/w1yTWu1NXaZObL+BoGKY2PFndiPsggFAgFVyJx3HG3PncoFT8UwE
 j7zvLPvSs4ncFDM8JHQvowRYbOHV021N2Sz9bcQU=
X-Received: by 2002:a05:600c:3513:b0:46f:b43a:aef3 with SMTP id
 5b1f17b1804b1-47117920953mr100164755e9.39.1761050978554; 
 Tue, 21 Oct 2025 05:49:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEZE/ladMSk50JT7xwxFZW6/3TTUzC73BBUinG1RqnkubctTdW7wvfl1ZOjHGYvM6gCccjKpA==
X-Received: by 2002:a05:600c:3513:b0:46f:b43a:aef3 with SMTP id
 5b1f17b1804b1-47117920953mr100164565e9.39.1761050978149; 
 Tue, 21 Oct 2025 05:49:38 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:8998:e0cf:68cc:1b62?
 ([2a01:e0a:c:37e0:8998:e0cf:68cc:1b62])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-471144b5c29sm282242885e9.12.2025.10.21.05.49.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Oct 2025 05:49:37 -0700 (PDT)
Message-ID: <bbce165c-5abc-4cae-9154-74aba2ca53a0@redhat.com>
Date: Tue, 21 Oct 2025 14:49:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] drm/client: Deprecate struct drm_client_buffer.gem
To: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
 rrameshbabu@nvidia.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org
References: <20251020151402.53013-1-tzimmermann@suse.de>
 <20251020151402.53013-5-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20251020151402.53013-5-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: zP9Uq0qv9v1ik1_CDnmFHVHFjC3Xk8Q06kX6RwvDz0M_1761050979
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
> The client buffer's framebuffer holds a reference and pointer on
> each of its GEM buffer objects. Thus the field gem in the client-
> buffer struct is not necessary. Deprecated the field and convert
> the client-buffer helpers to use the framebuffer's objects.
> 
> In drm_client_buffer_delete(), do a possible vunmap before releasing
> the framebuffer. Otherwise we'd eventually release the framebuffer
> before unmaping its buffer objects.

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>


> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/drm_client.c | 20 ++++++++++++--------
>   include/drm/drm_client.h     |  9 +++------
>   2 files changed, 15 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_client.c b/drivers/gpu/drm/drm_client.c
> index 73ae63f856a0..29ed5f55b5f9 100644
> --- a/drivers/gpu/drm/drm_client.c
> +++ b/drivers/gpu/drm/drm_client.c
> @@ -17,6 +17,7 @@
>   #include <drm/drm_fourcc.h>
>   #include <drm/drm_framebuffer.h>
>   #include <drm/drm_gem.h>
> +#include <drm/drm_gem_framebuffer_helper.h>
>   #include <drm/drm_mode.h>
>   #include <drm/drm_print.h>
>   
> @@ -174,17 +175,17 @@ EXPORT_SYMBOL(drm_client_release);
>   
>   static void drm_client_buffer_delete(struct drm_client_buffer *buffer)
>   {
> +	struct drm_gem_object *gem = drm_gem_fb_get_obj(buffer->fb, 0);
>   	int ret;
>   
> +	drm_gem_vunmap(gem, &buffer->map);
> +
>   	ret = drm_mode_rmfb(buffer->client->dev, buffer->fb->base.id, buffer->client->file);
>   	if (ret)
>   		drm_err(buffer->client->dev,
>   			"Error removing FB:%u (%d)\n", buffer->fb->base.id, ret);
>   
> -	if (buffer->gem) {
> -		drm_gem_vunmap(buffer->gem, &buffer->map);
> -		drm_gem_object_put(buffer->gem);
> -	}
> +	drm_gem_object_put(buffer->gem);
>   
>   	kfree(buffer);
>   }
> @@ -274,7 +275,7 @@ drm_client_buffer_create(struct drm_client_dev *client, u32 width, u32 height,
>   int drm_client_buffer_vmap_local(struct drm_client_buffer *buffer,
>   				 struct iosys_map *map_copy)
>   {
> -	struct drm_gem_object *gem = buffer->gem;
> +	struct drm_gem_object *gem = drm_gem_fb_get_obj(buffer->fb, 0);
>   	struct iosys_map *map = &buffer->map;
>   	int ret;
>   
> @@ -303,7 +304,7 @@ EXPORT_SYMBOL(drm_client_buffer_vmap_local);
>    */
>   void drm_client_buffer_vunmap_local(struct drm_client_buffer *buffer)
>   {
> -	struct drm_gem_object *gem = buffer->gem;
> +	struct drm_gem_object *gem = drm_gem_fb_get_obj(buffer->fb, 0);
>   	struct iosys_map *map = &buffer->map;
>   
>   	drm_gem_vunmap_locked(gem, map);
> @@ -334,9 +335,10 @@ EXPORT_SYMBOL(drm_client_buffer_vunmap_local);
>   int drm_client_buffer_vmap(struct drm_client_buffer *buffer,
>   			   struct iosys_map *map_copy)
>   {
> +	struct drm_gem_object *gem = drm_gem_fb_get_obj(buffer->fb, 0);
>   	int ret;
>   
> -	ret = drm_gem_vmap(buffer->gem, &buffer->map);
> +	ret = drm_gem_vmap(gem, &buffer->map);
>   	if (ret)
>   		return ret;
>   	*map_copy = buffer->map;
> @@ -355,7 +357,9 @@ EXPORT_SYMBOL(drm_client_buffer_vmap);
>    */
>   void drm_client_buffer_vunmap(struct drm_client_buffer *buffer)
>   {
> -	drm_gem_vunmap(buffer->gem, &buffer->map);
> +	struct drm_gem_object *gem = drm_gem_fb_get_obj(buffer->fb, 0);
> +
> +	drm_gem_vunmap(gem, &buffer->map);
>   }
>   EXPORT_SYMBOL(drm_client_buffer_vunmap);
>   
> diff --git a/include/drm/drm_client.h b/include/drm/drm_client.h
> index db0665263a10..5909664d4d43 100644
> --- a/include/drm/drm_client.h
> +++ b/include/drm/drm_client.h
> @@ -166,12 +166,9 @@ struct drm_client_buffer {
>   	/**
>   	 * @gem: GEM object backing this buffer
>   	 *
> -	 * FIXME: The dependency on GEM here isn't required, we could
> -	 * convert the driver handle to a dma-buf instead and use the
> -	 * backend-agnostic dma-buf vmap support instead. This would
> -	 * require that the handle2fd prime ioctl is reworked to pull the
> -	 * fd_install step out of the driver backend hooks, to make that
> -	 * final step optional for internal users.
> +	 * FIXME: The DRM framebuffer holds a reference on its GEM
> +	 * buffer objects. Do not use this field in new code and
> +	 * update existing users.
>   	 */
>   	struct drm_gem_object *gem;
>   

