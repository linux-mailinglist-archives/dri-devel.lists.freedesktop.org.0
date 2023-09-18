Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 046C17A453E
	for <lists+dri-devel@lfdr.de>; Mon, 18 Sep 2023 10:57:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0464D10E22F;
	Mon, 18 Sep 2023 08:57:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD6B910E22C
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Sep 2023 08:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695027473;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qyKdzQXW09x6MEXHXxxG+nlHUmD9Upbh0B3MwI8uyUs=;
 b=gqj4UcapYRKRIkriOfuYcwYUgh0UFApr/r4CClt2gQrmK+isSZBU3Ke069dYmHIxeA+Rlz
 TYnJYBt0Fy+Hsx1eIrRd46pILjxdKKOCeJJRgzO1Im7ZsCj1ccV1k8kFVeH8qbH7WTe6UN
 6ib79gvIrqnV8kylNKU10frxFnH63Uk=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-399-PAuqstNzNgeICBH6avicMQ-1; Mon, 18 Sep 2023 04:57:48 -0400
X-MC-Unique: PAuqstNzNgeICBH6avicMQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-31f8e062cadso2983138f8f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Sep 2023 01:57:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695027467; x=1695632267;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qyKdzQXW09x6MEXHXxxG+nlHUmD9Upbh0B3MwI8uyUs=;
 b=L6uG1FxBQMlln3l07Ayhlryua5hKJEoX6C5HYV8wJ0AFYpe2asiaPnYGpx6YXkv5W4
 EJzF5pFn+wHV9iHV8J+MCuOlqiSj1DfWGykuS7Xy9hkM/zN3qq3Wbc1XasIDKUWFAiCv
 9sE26k8xFTiVEh1SFpxbR9fNEXRcnG08bDEFRTXz9tDNT1rOxpLyO+6sTXCdMG6gprjk
 rDeyyB4LuXbAlHaln1+DerCwzhfWsVnvrpP1nN3Wjc+dNGyBD0xVngMPpZ6Ahs4ZJFwc
 5uoGACJ9IMjXk8Jrl97DCBAwCHd8zYuxAqz5tVIiz/zgW60fq+uRxMwivgSNibv7AagY
 1t/Q==
X-Gm-Message-State: AOJu0Yz7xMmmX6vWMUREUAv0+AdlpDLvd80y4jPH6gmX5ra6qwurBAZo
 KF9YqtgcLx1o/0Zwu3Trdjv0PxjnAhln2+tcpyRcFIDEMi+LIeqYsjwEj+O2KkJxJwmr3T2khfg
 7mkLLvQVKY2xiNPTrpIu0YdEvuA1f
X-Received: by 2002:a5d:66c7:0:b0:31a:e744:1297 with SMTP id
 k7-20020a5d66c7000000b0031ae7441297mr7396708wrw.50.1695027467459; 
 Mon, 18 Sep 2023 01:57:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHh82k9EsEnX0jxsbjPY0Fo6+RHb1RPgMoMZx6OcS4zMw8+Pv1zpozGayE9LfYPLqYeBM/rmQ==
X-Received: by 2002:a5d:66c7:0:b0:31a:e744:1297 with SMTP id
 k7-20020a5d66c7000000b0031ae7441297mr7396691wrw.50.1695027467110; 
 Mon, 18 Sep 2023 01:57:47 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 u8-20020a5d6ac8000000b003179b3fd837sm11908680wrw.33.2023.09.18.01.57.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Sep 2023 01:57:46 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, Arnd Bergmann
 <arnd@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>
Subject: Re: [PATCH] drm: fix up fbdev Kconfig defaults
In-Reply-To: <971f1e86-bcc4-4462-81c7-571a05748b46@suse.de>
References: <20230911205338.2385278-1-arnd@kernel.org>
 <971f1e86-bcc4-4462-81c7-571a05748b46@suse.de>
Date: Mon, 18 Sep 2023 10:57:45 +0200
Message-ID: <87r0mv5052.fsf@minerva.mail-host-address-is-not-set>
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
Cc: linux-fbdev@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Arthur Grillo <arthurgrillo@riseup.net>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Dave Airlie <airlied@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 Christian =?utf-8?Q?K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Hi
>
> Am 11.09.23 um 22:52 schrieb Arnd Bergmann:
>> From: Arnd Bergmann <arnd@arndb.de>
>> 
>> As a result of the recent Kconfig reworks, the default settings for the
>> framebuffer interfaces changed in unexpected ways:
>> 
>> Configurations that leave CONFIG_FB disabled but use DRM now get
>> DRM_FBDEV_EMULATION by default. This also turns on the deprecated /dev/fb
>> device nodes for machines that don't actually want it.
>> 
>> In turn, configurations that previously had DRM_FBDEV_EMULATION enabled
>> now only get the /dev/fb front-end but not the more useful framebuffer
>> console, which is not selected any more.
>> 
>> We had previously decided that any combination of the three frontends
>> (FB_DEVICE, FRAMEBUFFER_CONSOLE and LOGO) should be selectable, but the
>> new default settings mean that a lot of defconfig files would have to
>> get adapted.
>> 
>> Change the defaults back to what they were in Linux 6.5:
>> 
>>   - Leave DRM_FBDEV_EMULATION turned off unless CONFIG_FB
>>     is enabled. Previously this was a hard dependency but now the two are
>>     independent. However, configurations that enable CONFIG_FB probably
>>     also want to keep the emulation for DRM, while those without FB
>>     presumably did that intentionally in the past.
>> 
>>   - Leave FB_DEVICE turned off for FB=n. Following the same
>>     logic, the deprecated option should not automatically get enabled
>>     here, most users that had FB turned off in the past do not want it,
>>     even if they want the console
>> 
>>   - Turn the FRAMEBUFFER_CONSOLE option on if
>>     DRM_FBDEV_EMULATION is set to avoid having to change defconfig
>>     files that relied on it being selected unconditionally in the past.
>>     This also makes sense since both LOGO and FB_DEVICE are now disabled
>>     by default for builds without CONFIG_FB, but DRM_FBDEV_EMULATION
>>     would make no sense if all three are disabled.
>> 
>> Fixes: a5ae331edb02b ("drm: Drop select FRAMEBUFFER_CONSOLE for DRM_FBDEV_EMULATION")
>> Fixes: 701d2054fa317 ("fbdev: Make support for userspace interfaces configurable")
>> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
>

Pushed to drm-misc (drm-misc-fixes). Thanks!

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

