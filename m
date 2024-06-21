Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0967D912A84
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2024 17:43:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8320A10EFD5;
	Fri, 21 Jun 2024 15:43:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="EeWo22ks";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 200FA10EFD6
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 15:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1718984578;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8padAC2vgZoYm5gMWgM5Jxwrly13NFf+7Nho49URbpE=;
 b=EeWo22ksrY0Kr4l7bU0s0MyBhylNxIdimT17s2Z9gZSzjND/RQsJ0v1HOyq4M+SR8Cr41Q
 kBMOND6iRhx9AiKmyOZGeNlIUzgnfmlrxVkGj3vlYTW10tiDfIBqtoE+SKwxYWJobtld8c
 JUDNYmIczRxm9Optej07oA1LdfC8Emw=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-584-3kol43H3NiiFQv_dbwjlsw-1; Fri, 21 Jun 2024 11:42:56 -0400
X-MC-Unique: 3kol43H3NiiFQv_dbwjlsw-1
Received: by mail-lj1-f200.google.com with SMTP id
 38308e7fff4ca-2ebd982d244so15454241fa.3
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 08:42:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718984575; x=1719589375;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8padAC2vgZoYm5gMWgM5Jxwrly13NFf+7Nho49URbpE=;
 b=ReFh/ThBaLH1bzi1sAGrydMH+tSZg48ZxOuU9hI+eSJ/e9GEZXhqof082Uzuvq9rxE
 i71ZzVacHJp+ifXUsOrJ+7TMPRr8lDlOOV6uYvziXUfx4G3/9Q79Pos+7pSSUyRL0C0M
 hJ8aAo+D8ehbBTXwY52NbvX07Pmbqd5d43faMCaHlOH9c3mCWlhMpBdJuW0tE2G1kOEC
 lHuUWGpjJqdR2REfp/ElHMeQXOsX2DeTeTHxtL6PadN+DZKtDCfaxktvUA+xYasEpmiR
 hWFM2+AoF2d3Xtr95x6uhfZNX+BmZLRaRKbFomG0MVuFXSdpHgfNtvdz5Ht42fBLEQ3S
 kzog==
X-Forwarded-Encrypted: i=1;
 AJvYcCWdQXs57XSSBnUYXV0wnIfZxKzQ44fZKCM0j9eLeNtOApy6s3qvSg+pOPGzhe/Kbm2cQHeVNd0I21K8jws9sSfIYnx1sG0A1ClJdYA0GEIO
X-Gm-Message-State: AOJu0YwIDXEW9owJwZdfHxQQ3V1lojyaDWKqCwdCpPnfs//emihB6Gpx
 ekzsc2rOQyl3Qwv89MBEmsUAogboIVwhRZQaMn8yxpeseDX8j+Fd2gFOe8ACv5j/nqlShbvoQP/
 WzJWhQqhbKlcFVFPvgCMSark0hWm/uGqVRI8WvdIbokz0eYaGSle53ZLX8ZCp6//i9g==
X-Received: by 2002:a2e:87c2:0:b0:2ec:50dc:af8d with SMTP id
 38308e7fff4ca-2ec50dcb1c0mr10844031fa.12.1718984575414; 
 Fri, 21 Jun 2024 08:42:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEcL/uAmvTw3Xz4SGTKYWK4KNhLBx9ctCWYZtT7LlItr1HRHTMUIIoIfC6SGU42CcZuFEWfeQ==
X-Received: by 2002:a2e:87c2:0:b0:2ec:50dc:af8d with SMTP id
 38308e7fff4ca-2ec50dcb1c0mr10843901fa.12.1718984574941; 
 Fri, 21 Jun 2024 08:42:54 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-424817a9f11sm31899275e9.18.2024.06.21.08.42.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jun 2024 08:42:54 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Jocelyn Falempe <jfalempe@redhat.com>, linux-kernel@vger.kernel.org
Cc: Maxime Ripard <mripard@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/ssd130x: Add drm_panic support
In-Reply-To: <87h6dmjry6.fsf@minerva.mail-host-address-is-not-set>
References: <20240620222222.155933-1-javierm@redhat.com>
 <24205cdf-a3c6-475e-ba8a-a52d039a402d@redhat.com>
 <87h6dmjry6.fsf@minerva.mail-host-address-is-not-set>
Date: Fri, 21 Jun 2024 17:42:53 +0200
Message-ID: <87ed8qjo8y.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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

Javier Martinez Canillas <javierm@redhat.com> writes:

> Jocelyn Falempe <jfalempe@redhat.com> writes:
>
> Hello Jocelyn, thanks for your feedback!
>
>> On 21/06/2024 00:22, Javier Martinez Canillas wrote:
>>> Add support for the drm_panic infrastructure, which allows to display
>>> a user friendly message on the screen when a Linux kernel panic occurs.
>>> 
>>> The display controller doesn't scanout the framebuffer, but instead the
>>> pixels are sent to the device using a transport bus. For this reason, a
>>> .panic_flush handler is needed to flush the panic image to the display.
>>
>> Thanks for this patch, that's really cool that drm_panic can work on 
>> this device too.
>>
>
> Indeed, that's why I did it. Just to see if it could work :)
>
> [...]
>
>>> +static void ssd130x_primary_plane_helper_panic_flush(struct drm_plane *plane)
>>> +{
>>> +	struct drm_plane_state *plane_state = plane->state;
>>> +	struct ssd130x_plane_state *ssd130x_plane_state = to_ssd130x_plane_state(plane_state);
>>> +	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(plane_state);
>>> +	struct drm_crtc *crtc = plane_state->crtc;
>>> +	struct ssd130x_crtc_state *ssd130x_crtc_state = to_ssd130x_crtc_state(crtc->state);
>>> +
>>> +	ssd130x_fb_blit_rect(plane_state->fb, &shadow_plane_state->data[0], &plane_state->dst,
>>> +			     ssd130x_plane_state->buffer, ssd130x_crtc_state->data_array,
>>> +			     &shadow_plane_state->fmtcnv_state);
>>
>> ssd130x_fb_blit_rect() will call regmap->write(), which involve mutex 
>> and might sleep. And if the mutex is taken when the panic occurs, it 
>> might deadlock the panic handling.
>
> That's a good point and I something haven't considered...
>
>> One solution would be to configure the regmap with config->fast_io and 
>> config->use_raw_spinlock, and check that the lock is available with 
>> try_lock(map->raw_spin_lock)
>> But that means it will waste cpu cycle with busy waiting for normal 
>> operation, which is not good.
>>
>
> Yeah, I would prefer to not change the driver for normal operation.
>

Another option, that I believe makes more sense, is to just disable the
regmap locking (using struct regmap_config.disable_locking field [0]).

Since this regmap is not shared with other drivers and so any concurrent
access should already be prevented by the DRM core locking scheme.

Is my understanding correct?

[0]: https://elixir.bootlin.com/linux/v6.10-rc1/source/include/linux/regmap.h#L326

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

