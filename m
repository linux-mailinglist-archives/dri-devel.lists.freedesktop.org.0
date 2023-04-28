Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 11AF96F19AD
	for <lists+dri-devel@lfdr.de>; Fri, 28 Apr 2023 15:34:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0AFF10E6D9;
	Fri, 28 Apr 2023 13:34:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7138910E6D9
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Apr 2023 13:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682688852;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=T6nMtf6Gzq3uJ6hYj+VP/gNrA7S63KDC0HhAUOQNVRE=;
 b=GhtKNEj57lOfd7UOCclytWJ54wXi9syriyFr8DtkvSBnJHV7Ybe99Ep+7E/zHrz7MSCU7b
 LOtl7TlniIHxnvxeVCC4DEHaq4Biz550x5uILld8kHn9hJoK2jYSc1akHWXQqyAK8AlE2B
 ErO8oc+hTwSukrc8NdjwmgsNMtGQo/s=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-591-ptVHASZvMjG1PsQD6CZrSg-1; Fri, 28 Apr 2023 09:34:05 -0400
X-MC-Unique: ptVHASZvMjG1PsQD6CZrSg-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-3f171d201afso61538685e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Apr 2023 06:34:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682688844; x=1685280844;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=T6nMtf6Gzq3uJ6hYj+VP/gNrA7S63KDC0HhAUOQNVRE=;
 b=WuQgtxUBHIf37vI+wqX2zwVdqb9xhn8RwIHY9xkxcTDZY7qmg6FkGRzpryGikVhvf1
 X/Whu3qbe331f2XCSy88BjZNVXRd+aqksuEIC3NI3r9yK+2Db12fsjMrhlAsNJrANnSQ
 qHyOSmYAY6VIPgO7XXu69uQH/Y3WDXonRuEhw2avJdrcBqJrmZJQkbIGlgmgjHGf52ve
 AUxZDdQ0+J/JZlTegkSOLNOc0WLeQfc3jIz6X699ZVXbVgO6JQ4T5rypZP1AX6DDrrCc
 ZEXoyEpzmfGb0JwaXyoq32P+yMss8Rcr2lH4nR8uGu/55DWpPKRt6HO3As44TTutqzMg
 w4ZQ==
X-Gm-Message-State: AC+VfDwixGgPELiQymLPOU/DvEhq/4ADptQ223DWLN6lIwKQMhTMFdmH
 wvqgHIT1HBoGmMJHCY7XmHxfljErg8IBESYcgv3nJSN5nQDekHgB9S+pMhJ0HdD6EVCPNTibPaZ
 b4HJ1uzuk/+3hvnvfY2lH72eSVjB3
X-Received: by 2002:a05:600c:257:b0:3f1:6ead:e389 with SMTP id
 23-20020a05600c025700b003f16eade389mr4088072wmj.30.1682688844481; 
 Fri, 28 Apr 2023 06:34:04 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6APGvdtm/YP9mNCQTuu7xjUKb4lnkET42/qbhnzhp0iz8vor0r5uUclqXdzyG09R3eF09kYQ==
X-Received: by 2002:a05:600c:257:b0:3f1:6ead:e389 with SMTP id
 23-20020a05600c025700b003f16eade389mr4088048wmj.30.1682688844182; 
 Fri, 28 Apr 2023 06:34:04 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 f25-20020a7bc8d9000000b003f0b1b8cd9bsm24470014wml.4.2023.04.28.06.34.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Apr 2023 06:34:03 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch, deller@gmx.de, geert@linux-m68k.org,
 sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com
Subject: Re: [PATCH v2 02/19] auxdisplay/ht16k33: Use struct
 fb_info.screen_buffer
In-Reply-To: <20230428122452.4856-3-tzimmermann@suse.de>
References: <20230428122452.4856-1-tzimmermann@suse.de>
 <20230428122452.4856-3-tzimmermann@suse.de>
Date: Fri, 28 Apr 2023 15:34:03 +0200
Message-ID: <87fs8kgmgk.fsf@minerva.mail-host-address-is-not-set>
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
Cc: linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
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

