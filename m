Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF64A1153F
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2025 00:19:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D48510E396;
	Tue, 14 Jan 2025 23:19:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="ShNJIVOP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B70D310E396
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2025 23:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1736896775;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vEH78C4VpeJFY/2kdzUK4Z+Gvb2+CGFwdUUzW6v1srY=;
 b=ShNJIVOPrWP4Kx6TDQV3Hq4o/5rVKgXVHX6FlMC8bn0WD9ynD05gcoY0uwGm7NY0k8M6aw
 wPuAcatSje74rrIgkfQdRxq9w5MMKZ9EkVGBS2LjSusKHSN2064rID1smSiBFVqy8deC3x
 7foY6qygZVotEE9tSmdtkZ76q6aqdCs=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-557-Ofw_OIYlPRG7fpXmMI1ZRg-1; Tue, 14 Jan 2025 18:19:33 -0500
X-MC-Unique: Ofw_OIYlPRG7fpXmMI1ZRg-1
X-Mimecast-MFC-AGG-ID: Ofw_OIYlPRG7fpXmMI1ZRg
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-4362b9c1641so28516375e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2025 15:19:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736896772; x=1737501572;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vEH78C4VpeJFY/2kdzUK4Z+Gvb2+CGFwdUUzW6v1srY=;
 b=ZnB+1fLUPEAtcQP/ahW1vQ/e+0ctjGIZQX50+UBs0CkEUPDVy7zX+UxsM8Ok2RZvP0
 AmZYzQRBVFR2eMiJ5E/1fMR6+Sm923vd8Ra59Odhq3X0vit+xeXB2XUflUDRY85wCmtL
 iRjOyL7bCNfQZi8t4uACM/tQnXy//v64A2rdEblJgx05zC+Y40oKWgQSaOlGtzHwiQuc
 zk/4DyEzWOOA2XGLn3cjhMBd7DtW0Dqa26ULT/CkLXxeWNrugabFemjUyW1TqCNONMQX
 Q2nUUbMJz9elmWlN3tY/tgLee7AuzSkTqJpzq8DfJHLspBIYUaxSY9dGN4YR8KLwJXbc
 5QkQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVBBszbQ+kyX4jZTiH+ySQty2V1I2Q56VODLX12dahGOyxSuK/UvNM6rVh2mtKuJGhx8kuecTyW4Sw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx/TR/ilRPB7f9rpS+9zVHhqeCAqXvgvFJLAPA6BZCs7qD0WwMq
 2nurBjhDgcHnKs73BMYIF3d1yg4hwUi4VkLHcQhiWV1uc9M8NS7xodUKrJXuUCv7nTYBWoTwt0g
 plJM2a86qGhR3i0VM6yBuPSaE4BKUvgo+Qj86ezxKlUWeQ5XcACRV3w0gfWMQxzJHKQ==
X-Gm-Gg: ASbGncubTqZZbrusf530h2V4Y/Xdl3dtYUc87sWi0pWxcT3TT7IN/y/3qCHm9TJIvyo
 S6P+NQfYoYy7rjVCBMTfcUk+7rFnqPbEh79/RhX4CKXu0f6YI3Wu5Bzq2WeA8YZ3DbS5j8jlUjG
 ZWv0jaS6ODX0yQ5kFYuIktS5EmRrYvhALzDwCndohQrlu9Lt+voR7FUnFsksJuGgLeymXFDEFx7
 T0K78FK9Wr7mXfLoJhK3xkskLsaIp4hsQSQgQXIyFRAFktn6+vDsRlMl7EwlJyIjSDoIqgH/fVZ
 wH4qjPkz4hs+y0LrfVM183KVuiqbE4bR6izWzFQ=
X-Received: by 2002:a05:600c:3505:b0:434:a7b6:10e9 with SMTP id
 5b1f17b1804b1-436e26a9045mr259532885e9.17.1736896772613; 
 Tue, 14 Jan 2025 15:19:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHWz6ammZEBbT/nuGvY3Rz/ahY09xIAHiCyZ9AgrNGDygX+MT179mirdv9eYOPWOGlEdRYU/A==
X-Received: by 2002:a05:600c:3505:b0:434:a7b6:10e9 with SMTP id
 5b1f17b1804b1-436e26a9045mr259532695e9.17.1736896772231; 
 Tue, 14 Jan 2025 15:19:32 -0800 (PST)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-437c7499b28sm2526785e9.8.2025.01.14.15.19.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jan 2025 15:19:30 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: John Keeping <jkeeping@inmusicbrands.com>
Cc: John Keeping <jkeeping@inmusicbrands.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] drm/ssd130x: ensure ssd132x pitch is correct
In-Reply-To: <20250113152752.3369731-4-jkeeping@inmusicbrands.com>
References: <20250113152752.3369731-1-jkeeping@inmusicbrands.com>
 <20250113152752.3369731-4-jkeeping@inmusicbrands.com>
Date: Wed, 15 Jan 2025 00:19:28 +0100
Message-ID: <87seplvv9b.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: E8Gr6RQhUaqAgo8TwCskimLDYKxAXK7ohQ-SJxgadnQ_1736896773
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

John Keeping <jkeeping@inmusicbrands.com> writes:

> The bounding rectangle is adjusted to ensure it aligns to
> SSD132X_SEGMENT_WIDTH, which may adjust the pitch.  Calcuate the pitch

Calculate

> after alighting the left and right edge.
>

aligning

> Signed-off-by: John Keeping <jkeeping@inmusicbrands.com>
> ---
>  drivers/gpu/drm/solomon/ssd130x.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/ssd130x.c
> index 64f1123080996..38f31c3624062 100644
> --- a/drivers/gpu/drm/solomon/ssd130x.c
> +++ b/drivers/gpu/drm/solomon/ssd130x.c
> @@ -1037,7 +1037,7 @@ static int ssd132x_fb_blit_rect(struct drm_framebuffer *fb,
>  				struct drm_format_conv_state *fmtcnv_state)
>  {
>  	struct ssd130x_device *ssd130x = drm_to_ssd130x(fb->dev);
> -	unsigned int dst_pitch = drm_rect_width(rect);
> +	unsigned int dst_pitch;
>  	struct iosys_map dst;
>  	int ret = 0;
>  
> @@ -1046,6 +1046,8 @@ static int ssd132x_fb_blit_rect(struct drm_framebuffer *fb,
>  	rect->x2 = min_t(unsigned int, round_up(rect->x2, SSD132X_SEGMENT_WIDTH),
>  			 ssd130x->width);
>  
> +	dst_pitch = drm_rect_width(rect);
> +
>  	ret = drm_gem_fb_begin_cpu_access(fb, DMA_FROM_DEVICE);
>  	if (ret)
>  		return ret;
> -- 
> 2.47.1
>

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

