Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38623C0E63F
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 15:25:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49C5E10E4BA;
	Mon, 27 Oct 2025 14:25:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="gXIkGpth";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64C3310E4BA
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 14:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1761575102;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8LciegDERX8CTeDkRujZY/rWA8CKpiM+K0O6UGrEoME=;
 b=gXIkGpthq4tN3OjI2vYh+NyEp6ritBg+iDrvpkzaYS+7APghcmjxVh6hGDV1mxjxmWd5M9
 exL9YkFgcM1XWkA6jOXDq0m7zT7q4Omc3BFxUTaepG8jPZBTqrkWNT+Q0bJFHbTm63KBuj
 34ZNxdzrSyAECF1f8fdUXmb09wcWvZQ=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-196-CWzlbZvKNFOIHzxb5YAP3Q-1; Mon, 27 Oct 2025 10:25:01 -0400
X-MC-Unique: CWzlbZvKNFOIHzxb5YAP3Q-1
X-Mimecast-MFC-AGG-ID: CWzlbZvKNFOIHzxb5YAP3Q_1761575100
Received: by mail-ed1-f70.google.com with SMTP id
 4fb4d7f45d1cf-63c4d429a93so1050628a12.2
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 07:25:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761575100; x=1762179900;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8LciegDERX8CTeDkRujZY/rWA8CKpiM+K0O6UGrEoME=;
 b=b8NW/bliIEvX69o9jSWIOP993DtPZnlzU/vdqVjYONRFWOu24zrY/QgIDvHDHoMgVX
 iguPZNPzqU4S+TpKhmCUSqvFso78W4iQUDSpPkZlQ88IVh0YFQ1TiVywJiJLyX4CHxfM
 z56y01EE6g4eK1uITOPh8jfJIzcCS+9SvZRTVXTge/5yTJ4UAKSrTsD977+cALZV3Dz4
 Cs/wS0CIx7vfQy0J5wDoCd+lSVy6rYMSShLq6uJEEA5vIvyUCES+G1ZY2hcALVrGe4l8
 lQ7JB/CLQc4VQSxBeqHYhzxQ6vRHxrTMackih/2D3xH8hMDwKzF9kpKS3wu8vfCvDrGb
 XTDQ==
X-Gm-Message-State: AOJu0Yxeu3ou8Q0X4lO6d40QzUMZCtKOdbggMJm1SuQ+/Ed0kTmdl8sq
 DzwbFEg0xniSL7guh0xX4NIwtYHePkYgeODD89giyJex30xh7BdmgK7KHBufpZ3ppWXWyFq7zVW
 7PS62ZONRUpZb9gynBdmT67CASg9uuwSiJ3o9oAf+Ns0jYbCGjy2cnG0gd1QKxC1T5stXfw==
X-Gm-Gg: ASbGncsdI/aMEo88PFNe4S8U2ZAA3rN87mBQ+jtpScoiQwOaq3qikFh2UtcH+QuarE0
 F320c3t+Mdzv4fOEB2oh9RB5kQ3HANCx/1iteKqGflwyjS29tmVE8d7TcqjQpLR+0jOFMx51wXr
 9aTa4oK+NqrX/JR4UaSpfaYnfuLmorUU2aHFG3j2sblmGHT6seXvtrMHyaVUep5HA0K64Qdn56z
 ajeogH9k8We4KGzx6Dv/WHvsAVHW0ULlHfqVsxGIsq7AvOcucbzXDK1/rTDlXSq7vTOZYt9VUip
 l6uZxjiWJefb9yDuk1tTnE4Usuu1hjsAA+nJ2f6T0vvoSExJZW+xesrfAJjBaDUlDzgBzD2PerS
 WQdXyKrtFxyktlm6dL6LhfeJgwnNNpJ6QQjkVGA8=
X-Received: by 2002:a05:6402:3986:b0:636:681e:a3dc with SMTP id
 4fb4d7f45d1cf-63ed84a2202mr137004a12.36.1761575099716; 
 Mon, 27 Oct 2025 07:24:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG4EDE4rEaOfrc6xNfbIqqG/7hfY/ubNO62eX5M6Z7irKw912o69doYTAu4D35JOV3AjllIsA==
X-Received: by 2002:a05:6402:3986:b0:636:681e:a3dc with SMTP id
 4fb4d7f45d1cf-63ed84a2202mr136984a12.36.1761575099299; 
 Mon, 27 Oct 2025 07:24:59 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:d5:a000:d252:5640:545:41db?
 ([2a01:e0a:d5:a000:d252:5640:545:41db])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-63e7efb9739sm6521847a12.29.2025.10.27.07.24.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Oct 2025 07:24:58 -0700 (PDT)
Message-ID: <8904639b-1f55-4b89-bca1-3def1057c220@redhat.com>
Date: Mon, 27 Oct 2025 15:24:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/7] drm/client: Flush client buffers with
 drm_client_buffer_sync()
To: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
 rrameshbabu@nvidia.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, francesco@valla.it, airlied@gmail.com
Cc: dri-devel@lists.freedesktop.org
References: <20251027121042.143588-1-tzimmermann@suse.de>
 <20251027121042.143588-8-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20251027121042.143588-8-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: qRUk28on0syVWxvM35_pdOl1ntdNnZeFE8ghioNlGes_1761575100
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

On 27/10/2025 13:09, Thomas Zimmermann wrote:
> Rename drm_client_framebuffer_flush() to drm_cient_buffer_flush() and
> adapt its callers. The old name was left over from previous naming
> conventions.

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/clients/drm_log.c | 4 ++--
>   drivers/gpu/drm/drm_client.c      | 8 ++++----
>   include/drm/drm_client.h          | 2 +-
>   3 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/clients/drm_log.c b/drivers/gpu/drm/clients/drm_log.c
> index 48636bb1a21e..19e55aa0ed74 100644
> --- a/drivers/gpu/drm/clients/drm_log.c
> +++ b/drivers/gpu/drm/clients/drm_log.c
> @@ -100,7 +100,7 @@ static void drm_log_clear_line(struct drm_log_scanout *scanout, u32 line)
>   		return;
>   	iosys_map_memset(&map, r.y1 * fb->pitches[0], 0, height * fb->pitches[0]);
>   	drm_client_buffer_vunmap_local(scanout->buffer);
> -	drm_client_framebuffer_flush(scanout->buffer, &r);
> +	drm_client_buffer_flush(scanout->buffer, &r);
>   }
>   
>   static void drm_log_draw_line(struct drm_log_scanout *scanout, const char *s,
> @@ -133,7 +133,7 @@ static void drm_log_draw_line(struct drm_log_scanout *scanout, const char *s,
>   	if (scanout->line >= scanout->rows)
>   		scanout->line = 0;
>   	drm_client_buffer_vunmap_local(scanout->buffer);
> -	drm_client_framebuffer_flush(scanout->buffer, &r);
> +	drm_client_buffer_flush(scanout->buffer, &r);
>   }
>   
>   static void drm_log_draw_new_line(struct drm_log_scanout *scanout,
> diff --git a/drivers/gpu/drm/drm_client.c b/drivers/gpu/drm/drm_client.c
> index e7dfbdeca45a..504ec5bdfa2c 100644
> --- a/drivers/gpu/drm/drm_client.c
> +++ b/drivers/gpu/drm/drm_client.c
> @@ -430,8 +430,8 @@ drm_client_buffer_create_dumb(struct drm_client_dev *client, u32 width, u32 heig
>   EXPORT_SYMBOL(drm_client_buffer_create_dumb);
>   
>   /**
> - * drm_client_framebuffer_flush - Manually flush client framebuffer
> - * @buffer: DRM client buffer (can be NULL)
> + * drm_client_buffer_flush - Manually flush client buffer
> + * @buffer: DRM client buffer
>    * @rect: Damage rectangle (if NULL flushes all)
>    *
>    * This calls &drm_framebuffer_funcs->dirty (if present) to flush buffer changes
> @@ -440,7 +440,7 @@ EXPORT_SYMBOL(drm_client_buffer_create_dumb);
>    * Returns:
>    * Zero on success or negative error code on failure.
>    */
> -int drm_client_framebuffer_flush(struct drm_client_buffer *buffer, struct drm_rect *rect)
> +int drm_client_buffer_flush(struct drm_client_buffer *buffer, struct drm_rect *rect)
>   {
>   	if (!buffer || !buffer->fb || !buffer->fb->funcs->dirty)
>   		return 0;
> @@ -460,4 +460,4 @@ int drm_client_framebuffer_flush(struct drm_client_buffer *buffer, struct drm_re
>   	return buffer->fb->funcs->dirty(buffer->fb, buffer->client->file,
>   					0, 0, NULL, 0);
>   }
> -EXPORT_SYMBOL(drm_client_framebuffer_flush);
> +EXPORT_SYMBOL(drm_client_buffer_flush);
> diff --git a/include/drm/drm_client.h b/include/drm/drm_client.h
> index 690ef04fccce..5ecde0f6f591 100644
> --- a/include/drm/drm_client.h
> +++ b/include/drm/drm_client.h
> @@ -196,7 +196,7 @@ struct drm_client_buffer {
>   struct drm_client_buffer *
>   drm_client_buffer_create_dumb(struct drm_client_dev *client, u32 width, u32 height, u32 format);
>   void drm_client_buffer_delete(struct drm_client_buffer *buffer);
> -int drm_client_framebuffer_flush(struct drm_client_buffer *buffer, struct drm_rect *rect);
> +int drm_client_buffer_flush(struct drm_client_buffer *buffer, struct drm_rect *rect);
>   int drm_client_buffer_vmap_local(struct drm_client_buffer *buffer,
>   				 struct iosys_map *map_copy);
>   void drm_client_buffer_vunmap_local(struct drm_client_buffer *buffer);

