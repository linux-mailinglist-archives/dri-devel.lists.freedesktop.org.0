Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 022276D83A4
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 18:27:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02A1610EA08;
	Wed,  5 Apr 2023 16:27:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEE4D10EA08
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Apr 2023 16:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680712040;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BepbRdXMmknjyJpXJ6R3qQ1sNQIxMV2arEMQCnNCsRo=;
 b=cZZE/5nfHqKkrkHWZQuTRo0rcK7UAxSL91D0Iv8iEFMw6EwRIZnkf6PSn/rAyecNqJ5ceH
 aD/QHU6urg1x9is8l7mlYX39DZF10mP1cCT30BVIRI3p/Xqq7uMMMB1IZ5RDaCZT0NAc3k
 dTOUJbKdS0YcqMiGBo66/a6CyGB8RAY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-645-PklVBU9ZOy6yL-WSxGee6A-1; Wed, 05 Apr 2023 12:27:19 -0400
X-MC-Unique: PklVBU9ZOy6yL-WSxGee6A-1
Received: by mail-wm1-f69.google.com with SMTP id
 bi7-20020a05600c3d8700b003edecc610abso19336228wmb.7
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Apr 2023 09:27:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680712038;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BepbRdXMmknjyJpXJ6R3qQ1sNQIxMV2arEMQCnNCsRo=;
 b=UVhwVHqeSya0aMfuzDIaeWvgbQ7TWY56e8Qc3VjrDs00rwY1nvPKWzxIzo+6D1X7R6
 5squQWvWDMR/Erws6uHncN7tbqDFWbksTu4VP1k8KkuL/H2hAuZnp6+Cj2ufSr84ArCF
 AqUWJ9PeWMs+k3lBOHmoaSOGnTeJl/9ah4XjL++sr8rbqXwimhm1FxsxqMjklj3AhjRW
 Nvq/0F/KZK6H60eRhaq74cmmRmLCYfRKcclS2BF8jfXWjtGWhUc/Xo7YxdpFfa5S9eKy
 +lIJ0JHynX1nC8C7O2AS5cctWtmnrB0IoRTi2CgNwAvZgSiyWDYIV4Q3BGHVb7uH7dv8
 Zo3w==
X-Gm-Message-State: AAQBX9dlK+awp7/zvt4i5qT1yrB+hB7A5MMoqDJjBNMvkMGuL1IgeVif
 ejS34gX/5WukanCJgb/0oLXXUWviK6RloZ+uQcur1MlMqgCbO/tBY9KK1v2wSQx+d6ntfGaAA92
 LrfQMuJIYWwAcciE6NaPhYjkMXGjM
X-Received: by 2002:adf:db4d:0:b0:2d1:7ade:aad with SMTP id
 f13-20020adfdb4d000000b002d17ade0aadmr4963258wrj.31.1680712038614; 
 Wed, 05 Apr 2023 09:27:18 -0700 (PDT)
X-Google-Smtp-Source: AKy350be0ydhuGHVuI4dvQaCzef1K++pPNT56jl9mJW1ZgzNP+ITW5Avc2lYYjw5qxrGjFAo0K1NxA==
X-Received: by 2002:adf:db4d:0:b0:2d1:7ade:aad with SMTP id
 f13-20020adfdb4d000000b002d17ade0aadmr4963244wrj.31.1680712038275; 
 Wed, 05 Apr 2023 09:27:18 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 v12-20020a5d4b0c000000b002cfed482e9asm15380895wrq.61.2023.04.05.09.27.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Apr 2023 09:27:18 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 3/3] drm/fb-helper: fix input validation gaps in check_var
In-Reply-To: <ZC12aR9ddp3j/3dL@phenom.ffwll.local>
References: <20230404194038.472803-1-daniel.vetter@ffwll.ch>
 <20230404194038.472803-3-daniel.vetter@ffwll.ch>
 <87a5zmd2jn.fsf@minerva.mail-host-address-is-not-set>
 <ZC12aR9ddp3j/3dL@phenom.ffwll.local>
Date: Wed, 05 Apr 2023 18:27:17 +0200
Message-ID: <87ilea9twa.fsf@minerva.mail-host-address-is-not-set>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Daniel Vetter <daniel@ffwll.ch> writes:

[...]

>> 
>> but only the 'var->xres > fb->width || var->yres > fb->height' from the
>> conditions checked could be false after your __fill_var() call above.
>> 
>> You should drop the 'var->bits_per_pixel > bpp', 'var->xres_virtual >
>> fb->width' and 'var->yres_virtual > fb->height' checks I believe since
>> those will always be true.
>
> The __fill_var is after this. I'm honestly not sure what the exact

Ah, your patch adds it after that indeed. Please ignore my comment then.

> semantics are supposed to be, but essentially if userspace asks for too
> big virtual size, we reject it. And for anything else we then tell it
> (with __fill_var) how big the actually available space is.
>
> What I'm wondering now is whether too small x/yres won't lead to problems
> of some sorts ... For multi-screen we set the virtual size to be big
> enough for all crtc, and then just set x/yres to be the smallest output.
> That way fbcon knows to only draw as much as is visible on all screens.
> But if you then pan that too much, the bigger screens might not have a big
> enough buffer anymore and things fail (but shouldn't).
>
> Not sure how to fix that tbh.

Would this be a problem in practice?

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

