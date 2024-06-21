Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B7491278E
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2024 16:23:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B07110F1B9;
	Fri, 21 Jun 2024 14:23:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="agXfzdad";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FC7110F1C1
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 14:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1718979782;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qV90C7UJlVmCFYl+NUkqoGghcuANzyZHieaRfwTm4mo=;
 b=agXfzdadxZwaTq/G+3ceyztNXRfGOJZm5c4IsP/YBdaZUmyKsuFiGa0lulmHDym4nyNVio
 1PyP/armlmqVhyjA8lB5QWkdIr5zv4akKX8Pg32tDQc53PkF3XGr09QFl6akk2AH5kZiSH
 GViQUEzysWWMW5cal1VXSamU09A7RO4=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-347--PST1TqeM9m4g96MCQIGBw-1; Fri, 21 Jun 2024 10:23:00 -0400
X-MC-Unique: -PST1TqeM9m4g96MCQIGBw-1
Received: by mail-lf1-f71.google.com with SMTP id
 2adb3069b0e04-52cb2fc9434so1563196e87.0
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 07:23:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718979779; x=1719584579;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qV90C7UJlVmCFYl+NUkqoGghcuANzyZHieaRfwTm4mo=;
 b=r5/NMnbhyF3uUNtSU5t0oesV++rZLsMhNZu3efz4Zmvw5zxqMCyRClEkhaebzfDLHG
 X8kDFrd26w/Syx6dVf7UI4ZPYZZyz3TBLam/Stw7PH9krZGVJNEziPv86UbANdmjGLKA
 KLKDzZDfAb3dgPCF64a+nWw4BQkMqwPVam+W9EtiNb6CLnh95OnUfK/wnR0D7/5jNlng
 vjz1sVRjfzhuqtLxVOmJf1EHJ+d0WbYJR/EXXZNB5MP7J2lXgwU4uTGnGnnKaC+DlqVg
 wJcbWSQVN8ASfU7iLNItMwpjUiHAX3pjceftzZMOEvee92dDgQy9oR4x2OOwK2M6XVif
 F6Cg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVAR6wBk0dn9/ciHNRKotCNVUa+Pulj6P3nM2zy5bBOdLN0w+U1ASCoBJaMJSzQnErHhp9s34hLEHYz//oW/vZd+oR2egpxlwPupXvWRt6V
X-Gm-Message-State: AOJu0YzrDVqUF2fd4Bsdyq18cc7PgNeFJ6XdKseN5QCsAvtOEB9j7XuN
 Bv9Zq9oHFTmrTHFuwqnAJVxMiFFa7xAGsleji7QJwUGaOLI546KKP0YZdXT/WmZFXaUZjdRBRqQ
 gFag8xYMEICUZpExNuue3+0n4KZ2mq9+FrCloipQBs+t/9SoSJnpD0heLZSMx5NVDGA==
X-Received: by 2002:a05:6512:1242:b0:52c:8837:718a with SMTP id
 2adb3069b0e04-52ccaa918b4mr7215879e87.43.1718979779027; 
 Fri, 21 Jun 2024 07:22:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGzAV6+Rl/xfj+isJfV3mrm2ePVS6gx8oMmzBUO+GxqHw6XoMk3+zLYkOix/dNQI0VJ7gDQ9Q==
X-Received: by 2002:a05:6512:1242:b0:52c:8837:718a with SMTP id
 2adb3069b0e04-52ccaa918b4mr7215852e87.43.1718979778456; 
 Fri, 21 Jun 2024 07:22:58 -0700 (PDT)
Received: from localhost ([185.124.31.167]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-366389b88easm1884384f8f.39.2024.06.21.07.22.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jun 2024 07:22:58 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Jocelyn Falempe <jfalempe@redhat.com>, linux-kernel@vger.kernel.org
Cc: Maxime Ripard <mripard@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/ssd130x: Add drm_panic support
In-Reply-To: <24205cdf-a3c6-475e-ba8a-a52d039a402d@redhat.com>
References: <20240620222222.155933-1-javierm@redhat.com>
 <24205cdf-a3c6-475e-ba8a-a52d039a402d@redhat.com>
Date: Fri, 21 Jun 2024 16:22:57 +0200
Message-ID: <87h6dmjry6.fsf@minerva.mail-host-address-is-not-set>
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

Jocelyn Falempe <jfalempe@redhat.com> writes:

Hello Jocelyn, thanks for your feedback!

> On 21/06/2024 00:22, Javier Martinez Canillas wrote:
>> Add support for the drm_panic infrastructure, which allows to display
>> a user friendly message on the screen when a Linux kernel panic occurs.
>> 
>> The display controller doesn't scanout the framebuffer, but instead the
>> pixels are sent to the device using a transport bus. For this reason, a
>> .panic_flush handler is needed to flush the panic image to the display.
>
> Thanks for this patch, that's really cool that drm_panic can work on 
> this device too.
>

Indeed, that's why I did it. Just to see if it could work :)

[...]

>> +static void ssd130x_primary_plane_helper_panic_flush(struct drm_plane *plane)
>> +{
>> +	struct drm_plane_state *plane_state = plane->state;
>> +	struct ssd130x_plane_state *ssd130x_plane_state = to_ssd130x_plane_state(plane_state);
>> +	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(plane_state);
>> +	struct drm_crtc *crtc = plane_state->crtc;
>> +	struct ssd130x_crtc_state *ssd130x_crtc_state = to_ssd130x_crtc_state(crtc->state);
>> +
>> +	ssd130x_fb_blit_rect(plane_state->fb, &shadow_plane_state->data[0], &plane_state->dst,
>> +			     ssd130x_plane_state->buffer, ssd130x_crtc_state->data_array,
>> +			     &shadow_plane_state->fmtcnv_state);
>
> ssd130x_fb_blit_rect() will call regmap->write(), which involve mutex 
> and might sleep. And if the mutex is taken when the panic occurs, it 
> might deadlock the panic handling.

That's a good point and I something haven't considered...

> One solution would be to configure the regmap with config->fast_io and 
> config->use_raw_spinlock, and check that the lock is available with 
> try_lock(map->raw_spin_lock)
> But that means it will waste cpu cycle with busy waiting for normal 
> operation, which is not good.
>

Yeah, I would prefer to not change the driver for normal operation.

> So for this particular device, I think it's ok, because it's unlikely 
> you'll run kdump or other kernel panic handlers.
> But I would like to know what others think about it, and if it's 
> acceptable or not.
>

I don't know either. I guess that after a panic everything is best effort
anyways so it may be acceptable? But let's see what others think about it.

> -- 
>
> Jocelyn

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

