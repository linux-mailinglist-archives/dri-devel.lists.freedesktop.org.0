Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB5E37EDEBD
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 11:45:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 358DD10E5B2;
	Thu, 16 Nov 2023 10:45:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDBCA10E5B2
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 10:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700131514;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ekjp6Qw4GqreWi+hdESCK5ioDUqlNBXiY58gfjfFY0g=;
 b=KaAl1EtX7EUFonCUDViWINiyP/boqTQ8kLox5lDvSQ8JhQ8wQThAS77dF56ZCQ8cTVOQq+
 X2gEAS8OLcZxNU6sgekZ6/Dob1bGtTOXFYcIXbGcSs/ZaGr9cBiCtsGLFPAnISqGO12ez2
 YNOBDrlH3UBKgLiwuMy6EBV9PZKpNXk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-617-zJjuC3VfP96jP5mPaZXSRg-1; Thu, 16 Nov 2023 05:45:13 -0500
X-MC-Unique: zJjuC3VfP96jP5mPaZXSRg-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-40853e14f16so3717655e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 02:45:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700131512; x=1700736312;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ekjp6Qw4GqreWi+hdESCK5ioDUqlNBXiY58gfjfFY0g=;
 b=Exgn8+erBh1XlRFxWLvTjPgY80x1qOrJsvQ0PKHq91f7eUlAQqgrGTLmMV/aairtV5
 YsmzWrW5VC/pXpzTXa6Nxyz0bWRFJTuYYp0XyM2uHRjZ9+LevjiFcgwd056xmbcMfwGD
 9Xo7Fv26Ez3QFyvroRYCW8yQ/buAE9TJkBZYWD9/8jRd8GypOCtYNuMWl6D5qYxBsnce
 ZsF3iZmSC5AG4b2H2LHj2PjrYObSswARqew/NRllt3YnDrwYOn8EU6NSSagAtFdeEXnA
 ofitVl2Qqv2lOdjjVDZFtZcHfvG20H0Xi61PY0b0jw87OO0XW7WLgFNkI5qFupGaX37j
 JQBA==
X-Gm-Message-State: AOJu0YzDezu1T6ZBXxtgUoTyziqeYwzjGVe92JvtyvjN7/kdffuRVqdB
 hOml+DqCOFMbkHpeU9AeGGL/82xYdMo1U/48T+2aStUMEvGwWJT7agNr0y0/CEtse1HSMQZXZSN
 rEKFH8WC1Q33oymI+SczLwA5tpV0V
X-Received: by 2002:a05:600c:602a:b0:405:3ae6:2413 with SMTP id
 az42-20020a05600c602a00b004053ae62413mr11953374wmb.25.1700131512663; 
 Thu, 16 Nov 2023 02:45:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGAq3MAO+9d9bKj+7E5Zz+JyoZGWlumRiADKSViRJXoB8t+ePziwl5543tthNcB39pcWIUaYQ==
X-Received: by 2002:a05:600c:602a:b0:405:3ae6:2413 with SMTP id
 az42-20020a05600c602a00b004053ae62413mr11953365wmb.25.1700131512320; 
 Thu, 16 Nov 2023 02:45:12 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 m10-20020a05600c4f4a00b00407460234f9sm3097588wmq.21.2023.11.16.02.45.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Nov 2023 02:45:12 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de
Subject: Re: [PATCH 13/32] fbdev/sh_mobile_lcdcfb: Initialize fb_ops with
 fbdev macros
In-Reply-To: <20231115102954.7102-14-tzimmermann@suse.de>
References: <20231115102954.7102-1-tzimmermann@suse.de>
 <20231115102954.7102-14-tzimmermann@suse.de>
Date: Thu, 16 Nov 2023 11:45:11 +0100
Message-ID: <87il623rk8.fsf@minerva.mail-host-address-is-not-set>
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

> Initialize the instance of struct fb_ops with fbdev initializer
> macros for framebuffers in DMA-able virtual address space. Set the
> read/write, draw and mmap callbacks to the correct implementation
> and avoid implicit defaults. Also select the necessary helpers in
> Kconfig.
>
> The driver uses a mixture of DMA helpers and deferred I/O. That
> probably needs fixing by a driver maintainer.
>
> Fbdev drivers sometimes rely on the callbacks being NULL for a
> default I/O-memory-based implementation to be invoked; hence
> requiring the I/O helpers to be built in any case. Setting all
> callbacks in all drivers explicitly will allow to make the I/O
> helpers optional. This benefits systems that do not use these
> functions.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

