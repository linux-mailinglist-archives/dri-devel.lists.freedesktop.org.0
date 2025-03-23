Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9000A6CEA4
	for <lists+dri-devel@lfdr.de>; Sun, 23 Mar 2025 11:17:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54BE810E0F7;
	Sun, 23 Mar 2025 10:17:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="TIDLo+8b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 200C589FF7
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Mar 2025 10:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1742725068;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=A5dWCQzkdRdwuT8HCV5yxDFaQJnH4A3I2f8XXdm5Y6I=;
 b=TIDLo+8boY7u/j72S43LsTNvlN9xAczUhV0QnswEi3YiBVaC8rRWm9/sdD97o8WeGyFGDy
 2eT1tzhSWQqqB8BNJ5WOBIg6gGu75gJAqcECX/r7+NpQLroVKz6OxKIRrWGJ0CD3V/TXZP
 aP5Ozgz8prDDvrIv4XCarjYfLskYgCM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-364-l9JRdWObOCOmwiuHoinFXw-1; Sun, 23 Mar 2025 06:17:44 -0400
X-MC-Unique: l9JRdWObOCOmwiuHoinFXw-1
X-Mimecast-MFC-AGG-ID: l9JRdWObOCOmwiuHoinFXw_1742725062
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-43cfda30a3cso19895245e9.3
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Mar 2025 03:17:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742725061; x=1743329861;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=A5dWCQzkdRdwuT8HCV5yxDFaQJnH4A3I2f8XXdm5Y6I=;
 b=IaznyI0hR65OAm2HtY6uBSi63YYhoW68+7+v0/8W6t9Ni1yAI2M12piKcBVnsy8Mdf
 WpHIKJV4nf/OjOUWjd30HJrpiyQftlB4W42HBVcz/d55wBnXQWv1b06bv9DUZQNi+Fcm
 X+/KkJH/Ngq7ZbR9KuhGwK0+8ytWaG0ayAuMN9SzFGv+MgRBLfk17LeNBrx7129z9kaN
 AWULQngPEFNbZcCU32046HVJGCClOU3po3bNuzR3O1LVEybIud0ZImYQimmQXVJ3nBox
 9ybxPr9sQGQZls8Y98/EzrJQ+LBpfTCmP2m5VJLLX7exdxgjRlr/ktcXZB3KIvqwx5kg
 rG+w==
X-Gm-Message-State: AOJu0YxP+Zm4F/bZQZVnvSKGikPVnlDlCfRpuuBwZOQAxR9oRL7nvL4S
 EUGq9f+ZRDEnPvcd3Vr+OgwI9t0pfgj1uiwEqjdGgRKQqmbJuYEnpIjQP0CGN0fFLyY10LKVqS9
 T3rVwtBvqhaK6a20w97/isnUS8+TmKhDsYKs1oeCGM57WP+8kqjcFza5Ex7F880g09r1//4/ZEg
 ==
X-Gm-Gg: ASbGnct2uBUUZtRba8ogBJ0Y3GQV1aNWNRfk0b/Dk8GrCHXmBKC/ECQ5uL3Ytw5CFNi
 n+53AUczi7gxVojWpxaBjulWd0lsPbNjpqPhuFS9ONe1M2+0KThNzDV6koIf5yQuYjoXLEoP8QQ
 MIqAFko7OVkwGLAXImuiW4LxMQvPfsiJ6PdtHE90QsnYbwse7aKjAKVq6DdaPDz1DzKGLWMLEex
 JPN6YitelxXzhsilq704njSkkoVAm+uby6I6Bafu7u1+X3JoxesGPyg9dOLqLCElmUQVEi+LAHu
 dS/DnSp/xDoY6ssl/LNKZ8xvK7MJFuE7/jR2WlJGECZuWiC3UJ47lpQxT4NVckKHSyJzCMNVaw=
 =
X-Received: by 2002:a05:600c:3ba4:b0:43c:e2dd:98f3 with SMTP id
 5b1f17b1804b1-43d5a32be59mr21838165e9.21.1742725061599; 
 Sun, 23 Mar 2025 03:17:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG4C0nfV1BbZTSXzKAObmZsg1JFK59J6K1/tu5YOR74LaTyqHlSwLDZ+jQMso/An4UWfwzYsg==
X-Received: by 2002:a05:600c:3ba4:b0:43c:e2dd:98f3 with SMTP id
 5b1f17b1804b1-43d5a32be59mr21838055e9.21.1742725061144; 
 Sun, 23 Mar 2025 03:17:41 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d3cf2e1ffsm72320595e9.3.2025.03.23.03.17.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Mar 2025 03:17:39 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, simona@ffwll.ch,
 airlied@gmail.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 03/18] drm/simpledrm: Remove struct
 simpledrm_device.nformats
In-Reply-To: <20250319083021.6472-4-tzimmermann@suse.de>
References: <20250319083021.6472-1-tzimmermann@suse.de>
 <20250319083021.6472-4-tzimmermann@suse.de>
Date: Sun, 23 Mar 2025 11:17:38 +0100
Message-ID: <87zfhcdpa5.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: BD4c1qLEuToN8jNU0mYbLBxKoa6AlN-W93Ieklq58ak_1742725062
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

Thomas Zimmermann <tzimmermann@suse.de> writes:

> The field nformats is unused. Remove it.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/tiny/simpledrm.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tiny/simpledrm.c
> index 5d9ab8adf800..d949713f5ff6 100644
> --- a/drivers/gpu/drm/tiny/simpledrm.c
> +++ b/drivers/gpu/drm/tiny/simpledrm.c
> @@ -246,7 +246,6 @@ struct simpledrm_device {
>  
>  	/* modesetting */
>  	uint32_t formats[8];
> -	size_t nformats;
>  	struct drm_plane primary_plane;
>  	struct drm_crtc crtc;
>  	struct drm_encoder encoder;
> -- 
> 2.48.1
>

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

