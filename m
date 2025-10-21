Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FEC9BF690A
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 14:54:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A176210E5E7;
	Tue, 21 Oct 2025 12:54:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="QAN+i/q1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D09910E5E0
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 12:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1761051281;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tUhGWD3KOWi3hmvVvSMhpn/3z5YSNWZZUAyOX1n5m+w=;
 b=QAN+i/q1cojMZbd8yiOK7Hf4ggvTBtvkOV8/coJAL2osmoPdj21wLgcu/y/6TEluTNhnuE
 sjvRDBs/6l21EQl3P39s5B0jzSQ/fxx3QOHHFSXvo+mSXTPl6EhkmvZSUlpd5IPilyW/Tu
 GT6xWSiSFCSX1ZKSGqaqfQYzqwjWrQI=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-449-c1qWbnu5M-Cna8hLg5xQLA-1; Tue, 21 Oct 2025 08:54:39 -0400
X-MC-Unique: c1qWbnu5M-Cna8hLg5xQLA-1
X-Mimecast-MFC-AGG-ID: c1qWbnu5M-Cna8hLg5xQLA_1761051279
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-426ff59a320so7151731f8f.3
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 05:54:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761051279; x=1761656079;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tUhGWD3KOWi3hmvVvSMhpn/3z5YSNWZZUAyOX1n5m+w=;
 b=uNuZA+0vC+m9IBxcMn0sayMs1WBx7IGIDB2LmwIEFgu2r/tAgEjqBR9R8gxcdTiRcw
 y1exsvJw8ciR6TZv3/SVcz5c+/AKDzgFYBtdK8YmMZOz0pMGHl2PqYiQyfsn2fZx4wfb
 8JnQUG6Xd+zqpGr0j/XKELa5HER3qAUj9CaOAuZDyQuMk82cwi13pFGu48Y1OqB70C6a
 SOWqxWFJAROd8Ep2oPex1H/+Kxb+JdhiQuwwGZHg5fWRagUje5xs7LB9PyIdRpEQoFmw
 o0Fcq7BbpP1PPT4VNk4ts40kQ0HBtnNXJTb7c84FkCS0uXfmiwk3tGiIuLXp9E8DLMuD
 Y12A==
X-Gm-Message-State: AOJu0YyzKeO37VFJKotiBKsX8XL0+W1RqT0+BoQn8ciKrHqu/PSKQCAp
 8wLRnS2ypfb3HYXJvjHqKD0dR+TP9ejyT9aJau/rH5KDea0qKG4n0ySyIYwUvbK8Sr8IDCW0aLG
 6Ci///biO0lsAyVwnQbQSGygNdnVJ2Pv8gPhtF/UoXyRoz7T9c6KQTXi4qksK0qCp/dQbqw==
X-Gm-Gg: ASbGncus5zW098fohVM/PMBXKHGK2JgPAFCN+bDQSW5/SMXRlQ8g5AJOpOTRgIK7kyx
 ZbhDpVwls8g0vttAHzSC3579xhclMAZG8yTsj5PkIR+f8z0dzAsZw/5EemLT7KF1Q4VvRk2uz6O
 rQ0SAUQKBovWSTbWOvGQJ8UqWzUXYvM8dB5eBxuoK62WNsS62e6Rv0eP0L1UHAB64LCKVFK+FH7
 S0PuMpCyE4KDDfiCuShCeCdrZj4xn15zMkITOsuFOPWGfbKXPFoZjoWA4CAHhjQIQ97huQD0L6J
 sEXVW+sWj6MffVX+IbEDHxiB8VbNrVUF/iJBSTxfy9ohkNovINwdt6sHE6MFIXayYIBbPvcrh9A
 GBqmT+vE3yxDZjo2lRN+eEUiMEbeKVaS27G2YnN8=
X-Received: by 2002:a05:6000:40dd:b0:428:52d1:73ab with SMTP id
 ffacd0b85a97d-42852d17555mr9328f8f.58.1761051278689; 
 Tue, 21 Oct 2025 05:54:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGXyISqcFqbNRpkZVSoLyiMwwnftw4aElWS13ARF8Vl+oooKBYCI5OtSoXwM3OMdpKrm2Ijig==
X-Received: by 2002:a05:6000:40dd:b0:428:52d1:73ab with SMTP id
 ffacd0b85a97d-42852d17555mr9303f8f.58.1761051278269; 
 Tue, 21 Oct 2025 05:54:38 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:8998:e0cf:68cc:1b62?
 ([2a01:e0a:c:37e0:8998:e0cf:68cc:1b62])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-427f00cdf6csm20112321f8f.43.2025.10.21.05.54.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Oct 2025 05:54:37 -0700 (PDT)
Message-ID: <2d9d4e7a-6105-41ba-8603-30a86814004f@redhat.com>
Date: Tue, 21 Oct 2025 14:54:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] drm/client: Create client buffers with
 drm_client_buffer_create_dumb()
To: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
 rrameshbabu@nvidia.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org
References: <20251020151402.53013-1-tzimmermann@suse.de>
 <20251020151402.53013-7-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20251020151402.53013-7-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: IiiXU0emrqdkGuYR9TQ9eUObMAmOlz2Rv_niSBvoWk0_1761051279
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
> Rename drm_client_framebuffer_create() to drm_client_buffer_create_dump()
> and adapt callers. The new name reflects the function's purpose. Using
> dumb buffers is the easiest way for creating a GEM buffer in a drivers-
> independent way.
> 
> There's also drm_client_buffer_create(), which creates the client buffer
> from a preexisting buffer object. This helper can be exported for drivers
> that create their own GEM buffer object.

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>


> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/clients/drm_log.c | 2 +-
>   drivers/gpu/drm/drm_client.c      | 6 +++---
>   drivers/gpu/drm/drm_fbdev_dma.c   | 2 +-
>   drivers/gpu/drm/drm_fbdev_shmem.c | 2 +-
>   drivers/gpu/drm/drm_fbdev_ttm.c   | 2 +-
>   include/drm/drm_client.h          | 2 +-
>   6 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/clients/drm_log.c b/drivers/gpu/drm/clients/drm_log.c
> index 2d748ab318fe..b8fb9ee9fcf0 100644
> --- a/drivers/gpu/drm/clients/drm_log.c
> +++ b/drivers/gpu/drm/clients/drm_log.c
> @@ -204,7 +204,7 @@ static int drm_log_setup_modeset(struct drm_client_dev *client,
>   	if (format == DRM_FORMAT_INVALID)
>   		return -EINVAL;
>   
> -	scanout->buffer = drm_client_framebuffer_create(client, width, height, format);
> +	scanout->buffer = drm_client_buffer_create_dumb(client, width, height, format);
>   	if (IS_ERR(scanout->buffer)) {
>   		drm_warn(client->dev, "drm_log can't create framebuffer %d %d %p4cc\n",
>   			 width, height, &format);
> diff --git a/drivers/gpu/drm/drm_client.c b/drivers/gpu/drm/drm_client.c
> index d4c424ff44a9..9105a0b5f468 100644
> --- a/drivers/gpu/drm/drm_client.c
> +++ b/drivers/gpu/drm/drm_client.c
> @@ -372,7 +372,7 @@ void drm_client_buffer_vunmap(struct drm_client_buffer *buffer)
>   EXPORT_SYMBOL(drm_client_buffer_vunmap);
>   
>   /**
> - * drm_client_framebuffer_create - Create a client framebuffer
> + * drm_client_buffer_create_dumb - Create a client buffer backed by a dumb buffer
>    * @client: DRM client
>    * @width: Framebuffer width
>    * @height: Framebuffer height
> @@ -386,7 +386,7 @@ EXPORT_SYMBOL(drm_client_buffer_vunmap);
>    * Pointer to a client buffer or an error pointer on failure.
>    */
>   struct drm_client_buffer *
> -drm_client_framebuffer_create(struct drm_client_dev *client, u32 width, u32 height, u32 format)
> +drm_client_buffer_create_dumb(struct drm_client_dev *client, u32 width, u32 height, u32 format)
>   {
>   	const struct drm_format_info *info = drm_format_info(format);
>   	struct drm_device *dev = client->dev;
> @@ -422,7 +422,7 @@ drm_client_framebuffer_create(struct drm_client_dev *client, u32 width, u32 heig
>   	drm_mode_destroy_dumb(client->dev, dumb_args.handle, client->file);
>   	return ERR_PTR(ret);
>   }
> -EXPORT_SYMBOL(drm_client_framebuffer_create);
> +EXPORT_SYMBOL(drm_client_buffer_create_dumb);
>   
>   /**
>    * drm_client_framebuffer_flush - Manually flush client framebuffer
> diff --git a/drivers/gpu/drm/drm_fbdev_dma.c b/drivers/gpu/drm/drm_fbdev_dma.c
> index 17fef288e86b..7d4e557d6a5d 100644
> --- a/drivers/gpu/drm/drm_fbdev_dma.c
> +++ b/drivers/gpu/drm/drm_fbdev_dma.c
> @@ -285,7 +285,7 @@ int drm_fbdev_dma_driver_fbdev_probe(struct drm_fb_helper *fb_helper,
>   
>   	format = drm_driver_legacy_fb_format(dev, sizes->surface_bpp,
>   					     sizes->surface_depth);
> -	buffer = drm_client_framebuffer_create(client, sizes->surface_width,
> +	buffer = drm_client_buffer_create_dumb(client, sizes->surface_width,
>   					       sizes->surface_height, format);
>   	if (IS_ERR(buffer))
>   		return PTR_ERR(buffer);
> diff --git a/drivers/gpu/drm/drm_fbdev_shmem.c b/drivers/gpu/drm/drm_fbdev_shmem.c
> index f7966b8c51cd..b9e48a0bd39f 100644
> --- a/drivers/gpu/drm/drm_fbdev_shmem.c
> +++ b/drivers/gpu/drm/drm_fbdev_shmem.c
> @@ -149,7 +149,7 @@ int drm_fbdev_shmem_driver_fbdev_probe(struct drm_fb_helper *fb_helper,
>   		    sizes->surface_bpp);
>   
>   	format = drm_driver_legacy_fb_format(dev, sizes->surface_bpp, sizes->surface_depth);
> -	buffer = drm_client_framebuffer_create(client, sizes->surface_width,
> +	buffer = drm_client_buffer_create_dumb(client, sizes->surface_width,
>   					       sizes->surface_height, format);
>   	if (IS_ERR(buffer))
>   		return PTR_ERR(buffer);
> diff --git a/drivers/gpu/drm/drm_fbdev_ttm.c b/drivers/gpu/drm/drm_fbdev_ttm.c
> index 54f9a46b96c2..b1188692399a 100644
> --- a/drivers/gpu/drm/drm_fbdev_ttm.c
> +++ b/drivers/gpu/drm/drm_fbdev_ttm.c
> @@ -189,7 +189,7 @@ int drm_fbdev_ttm_driver_fbdev_probe(struct drm_fb_helper *fb_helper,
>   
>   	format = drm_driver_legacy_fb_format(dev, sizes->surface_bpp,
>   					     sizes->surface_depth);
> -	buffer = drm_client_framebuffer_create(client, sizes->surface_width,
> +	buffer = drm_client_buffer_create_dumb(client, sizes->surface_width,
>   					       sizes->surface_height, format);
>   	if (IS_ERR(buffer))
>   		return PTR_ERR(buffer);
> diff --git a/include/drm/drm_client.h b/include/drm/drm_client.h
> index 6019f2712448..e4df404a9645 100644
> --- a/include/drm/drm_client.h
> +++ b/include/drm/drm_client.h
> @@ -184,7 +184,7 @@ struct drm_client_buffer {
>   };
>   
>   struct drm_client_buffer *
> -drm_client_framebuffer_create(struct drm_client_dev *client, u32 width, u32 height, u32 format);
> +drm_client_buffer_create_dumb(struct drm_client_dev *client, u32 width, u32 height, u32 format);
>   void drm_client_buffer_delete(struct drm_client_buffer *buffer);
>   int drm_client_framebuffer_flush(struct drm_client_buffer *buffer, struct drm_rect *rect);
>   int drm_client_buffer_vmap_local(struct drm_client_buffer *buffer,

