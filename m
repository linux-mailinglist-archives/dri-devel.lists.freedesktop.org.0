Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E0136F1A7E
	for <lists+dri-devel@lfdr.de>; Fri, 28 Apr 2023 16:31:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A589D10E128;
	Fri, 28 Apr 2023 14:31:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F142910E128
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Apr 2023 14:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682692295;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=T6nMtf6Gzq3uJ6hYj+VP/gNrA7S63KDC0HhAUOQNVRE=;
 b=avHzSlayKi9IllRZx3NuUeE2fL+ihfarAaYX0ez6dVxgnXhv7KuSW27BnHpNGJ3iNerbPH
 tHhDjNzeQxfcuc5WpdIv/vyS69n8qskh+iOKoedUn2T5V8XaZW3J4HtIYBnLPiUpgB97j8
 6wasYyQrUseOWOhDw5b4DSnWZ2+E7+Y=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-282-b71bjK7LNA6_PkH6NkZlvA-1; Fri, 28 Apr 2023 10:31:33 -0400
X-MC-Unique: b71bjK7LNA6_PkH6NkZlvA-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-3f315735edeso41805595e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Apr 2023 07:31:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682692292; x=1685284292;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=T6nMtf6Gzq3uJ6hYj+VP/gNrA7S63KDC0HhAUOQNVRE=;
 b=kFr6fHEwi5pNwaZ5lG9xQsMJepknJn74TmUny4YoWYOHavqk6mDB94uJD3Lq0BFt8u
 evYczCQfs9vNIy2jDZVHDlJ6vMNif70v6mwg23S6vVw65mWyJEbu8OORJaWZjGGPRiE6
 ARYdHzQWy/jBxxpf1wza+fajYV2FtBQ8J1d4aH7GQJswp2Hn6VSCEYz0KLa4ME0r8AyR
 3KxCBKaYhXCiS2FoU7R1x2rMEvRxv0KqYs9yk3ZuhPZ2+/+y6A4cIhEfZOvwLPZ3uZgk
 ugOuVS4wZnX9Q7Ska7h+Wl8VNQHCcRhY+HJiZUygAq8mTO7umc8GyvWKdqIPC76IW5+S
 AY5w==
X-Gm-Message-State: AC+VfDydFO4+Dpds+GqNdY1CoaOXn39fxqxX+xHlU1kYQLPTQ1ciZimc
 YDxMOd/zjvTIFRxNeY9QHDviiCENCTQLWKI9mmZJl7yfu5c1jVnafe/1WsL7Rqtz178sB05sMii
 X4GBhz0YzwxKJZGRVMBhYDm8RpKu5
X-Received: by 2002:a05:600c:378e:b0:3f1:65cb:8156 with SMTP id
 o14-20020a05600c378e00b003f165cb8156mr3964484wmr.0.1682692292496; 
 Fri, 28 Apr 2023 07:31:32 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4muiSR8Tdhi6QJG9j+lv9oeqIiugsfDwxBycG/oNh6nECXC9yJkPiL5Ke6E4x/Ylci6N3S/w==
X-Received: by 2002:a05:600c:378e:b0:3f1:65cb:8156 with SMTP id
 o14-20020a05600c378e00b003f165cb8156mr3964469wmr.0.1682692292241; 
 Fri, 28 Apr 2023 07:31:32 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 u3-20020a7bcb03000000b003f16f3cc9fcsm24600054wmj.9.2023.04.28.07.31.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Apr 2023 07:31:31 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch, deller@gmx.de, geert@linux-m68k.org,
 sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com
Subject: Re: [PATCH v2 06/19] fbdev/broadsheetfb: Use struct
 fb_info.screen_buffer
In-Reply-To: <20230428122452.4856-7-tzimmermann@suse.de>
References: <20230428122452.4856-1-tzimmermann@suse.de>
 <20230428122452.4856-7-tzimmermann@suse.de>
Date: Fri, 28 Apr 2023 16:31:31 +0200
Message-ID: <874jp0gjss.fsf@minerva.mail-host-address-is-not-set>
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
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Use info->screen_buffer when reading and writing framebuffers in
> system memory. It's the correct pointer for this address space.
>
> The struct fb_info has a union to store the framebuffer memory. This can
> either be info->screen_base if the framebuffer is stored in I/O memory,
> or info->screen_buffer if the framebuffer is stored in system memory.
>
> As the driver operates on the latter address space, it is wrong to use
> .screen_base and .screen_buffer must be used instead. This also gets
> rid of casting needed due to not using the correct data type.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

