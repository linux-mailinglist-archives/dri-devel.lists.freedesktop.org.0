Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E25827536AB
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jul 2023 11:34:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8E8B10E0EA;
	Fri, 14 Jul 2023 09:34:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EF2B10E0EA
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 09:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689327256;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tomnXjxAClsXXjmt2CtXXzFMGlnovEg82VMD7EM7NSg=;
 b=hF0WDDcUmwmTZVSAfeTDswSUreLSl7NOenbhc/1WM+04hZklrszZbE07ploZ6PIEhfcJ1+
 CLHpexTaBecpj4PVTNsGvaT6JMiaQSJSpaep+J5z3hpicuabYfkZI+B7jdTcRJT5n4yGKS
 LhLNXWwGdlqko+rOXZBELBU0GYgDBYY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-360-vHE8ByZ6MhOkw-SlqPQ8xQ-1; Fri, 14 Jul 2023 05:34:15 -0400
X-MC-Unique: vHE8ByZ6MhOkw-SlqPQ8xQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-314394a798dso716480f8f.0
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 02:34:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689327254; x=1691919254;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tomnXjxAClsXXjmt2CtXXzFMGlnovEg82VMD7EM7NSg=;
 b=Zf/FiSpYb4GKBzjW0jVYuiGnkUYKY9RrQnltNMSVtM3TddzcL7wNagxF5dgRxv4L6w
 HIHPvsZrz+iD4QTqoacNCcS4l17uSf9YZaCiIdS89DoCuYzEaaBw7fzhT3ZQsZ+ecVNi
 af1HwFvLyWb6qSk4fasq2CfI1TY8v5asaJbvhabLQw9WYxuY1ubVBFxK09Rr4JRq06ct
 mmqpKFxSNbH2gR5YnTUD07S7GM5BTnwAR1iuiHCe1QwB0ZgnlM6Nb7q1t1mZfbKjqNJq
 a4GcEpMDzUWiJAEVrrhUsk7f7El2riz94cqZYZ9CjAdg7AnhNdi+k5nGg3Dj0SCAkBNb
 /WYw==
X-Gm-Message-State: ABy/qLZ9PATF+6ac07NA920zkgRo9s/dtxCoCo8R3Ff507axvbzNG8au
 Z/4ki254m+kecDOMTurH6xv7wYnL7iGhY8+Z6F61Xh670p+ug082Im2vU4Nw8Vpb0IQ+fLP3H5Z
 9ZMoxFSyqIP3rVH/lAe6yhzKAPZXl
X-Received: by 2002:adf:ef04:0:b0:314:385d:3f32 with SMTP id
 e4-20020adfef04000000b00314385d3f32mr1869000wro.29.1689327253982; 
 Fri, 14 Jul 2023 02:34:13 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGlN1baoTS0XRh4Lep0MfIU2RSnGLx0MemZn1GdGq2pOjqBhMm1RbYRqPn3kOwZi4UbTW1kfQ==
X-Received: by 2002:adf:ef04:0:b0:314:385d:3f32 with SMTP id
 e4-20020adfef04000000b00314385d3f32mr1868979wro.29.1689327253654; 
 Fri, 14 Jul 2023 02:34:13 -0700 (PDT)
Received: from localhost ([91.126.32.244]) by smtp.gmail.com with ESMTPSA id
 12-20020a05600c230c00b003f90b9b2c31sm990232wmo.28.2023.07.14.02.34.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jul 2023 02:34:12 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 1/8] drm/ssd130x: Fix pitch calculation in
 ssd130x_fb_blit_rect()
In-Reply-To: <54deec2ec533e90544faa8c60a0c2518c58f3e9c.1689252746.git.geert@linux-m68k.org>
References: <cover.1689252746.git.geert@linux-m68k.org>
 <54deec2ec533e90544faa8c60a0c2518c58f3e9c.1689252746.git.geert@linux-m68k.org>
Date: Fri, 14 Jul 2023 11:34:11 +0200
Message-ID: <87r0pau99o.fsf@minerva.mail-host-address-is-not-set>
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
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Geert Uytterhoeven <geert@linux-m68k.org> writes:

Hello Geert,

Thanks for your patch!

> The page height must be taken into account only for vertical coordinates
> and heights, not for horizontal coordinates and widths.
>
> Fixes: 179a790aaf2a0127 ("drm/ssd130x: Set the page height value in the device info data")
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
>  drivers/gpu/drm/solomon/ssd130x.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/ssd130x.c
> index afb08a8aa9fcdaf2..b4c376962629580b 100644
> --- a/drivers/gpu/drm/solomon/ssd130x.c
> +++ b/drivers/gpu/drm/solomon/ssd130x.c
> @@ -596,7 +596,7 @@ static int ssd130x_fb_blit_rect(struct drm_framebuffer *fb, const struct iosys_m
>  	rect->y1 = round_down(rect->y1, page_height);
>  	rect->y2 = min_t(unsigned int, round_up(rect->y2, page_height), ssd130x->height);
>  
> -	dst_pitch = DIV_ROUND_UP(drm_rect_width(rect), page_height);
> +	dst_pitch = DIV_ROUND_UP(drm_rect_width(rect), 8);
>

That's true for ssd130x controllers that use R1, but when doing that
change one of my goals was to prepare the driver for supporting the
ssd132x family that use a 16-grayscale pixel format (R4).

For those controllers, the pixels are encoded in 4-bit and each page
has two pixels. So for those controllers the dst_pitch will need to
be DIV_ROUND_UP(drm_rect_width(rect), 2) instead since the width is
not 8 in that case.

So I would prefer to skip this patch from your set, because otherwise
we will need to revert it when adding support for SSD132x controllers.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

