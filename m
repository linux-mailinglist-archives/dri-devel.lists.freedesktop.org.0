Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D1BB87EDEF4
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 11:53:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19F5A10E5C3;
	Thu, 16 Nov 2023 10:53:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A520210E5BE
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 10:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700132012;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tuX86pnoqOc9Lm4Xg+0oGA/Hd0KoSUsDWQB7iIHvV00=;
 b=hQ9I9oz/dmfba2aw0+JilD9XS4tnyMSz1XhH3DXzB2zSHV8PfB/VkuS+NC5fXnISlaXRjL
 4KXBdyMwUhlLj5Sae5mE4ALkBn5Efco3+kHZ+btlqDBgFtr5FMjpy4RVftUchg+P2XwFBf
 wYAodEXAktpAtsHqN6FcNnIzJVsxvf8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-277-qBRFKIIlOhOWOTrLralHMw-1; Thu, 16 Nov 2023 05:53:31 -0500
X-MC-Unique: qBRFKIIlOhOWOTrLralHMw-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-4094158c899so3378185e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 02:53:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700132010; x=1700736810;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tuX86pnoqOc9Lm4Xg+0oGA/Hd0KoSUsDWQB7iIHvV00=;
 b=RRTRmCJe/X3eGb51Hu6vpAEGIMzs18oPJYiL/Z3sv5fZamBs9a69hm5cmMxMf4mBzQ
 NezeO6L8l/qH3FV/K6v2W2Xsq5bq6HCVov7Guy0zfqi/2gKivHYdpHWxej/J9q1wK/Sv
 o0RVUJKPjEW7wv6bx7tga3qZkQe+RQIECP3bpxYooBUysH7FKA7zvVHcbGFqdFjGThla
 9RK00a4uPymMPR390zi4fiQ1Mw82UqYjQELyozvXNUhwWHQvl55758NOgutafW+4JFKf
 ktoA89AVBsBzDviEBfvqY7BaNoa+Eln/mgB3Efto++MN9dXU5rHCtqkonEMdivHDB/er
 voLA==
X-Gm-Message-State: AOJu0YwDHUGupoADmg8a8l5cPgUf6By7ihdBZi6AOylDiUN9Ve//QGHW
 kL1K/ngSJN1Ux4mN/lS6HeTPQDs2xBSzHKzDa7nzBscXhb2IPHlE4P2w9sf2QE94NhMFYJkCoaX
 p3PdfLrZqk08YlWiizTUkNSZhN2UQ
X-Received: by 2002:a05:600c:524c:b0:3fd:2e89:31bd with SMTP id
 fc12-20020a05600c524c00b003fd2e8931bdmr1701734wmb.14.1700132010300; 
 Thu, 16 Nov 2023 02:53:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGxYqt6JEW+U1HNFI57UlEcmFdgsubjyvb53Do4Fx+Au2XkUvyLPoKV7okM0NVKFoXjgldOnw==
X-Received: by 2002:a05:600c:524c:b0:3fd:2e89:31bd with SMTP id
 fc12-20020a05600c524c00b003fd2e8931bdmr1701718wmb.14.1700132009917; 
 Thu, 16 Nov 2023 02:53:29 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 s9-20020a05600c45c900b0040651505684sm3086548wmo.29.2023.11.16.02.53.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Nov 2023 02:53:29 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de
Subject: Re: [PATCH 19/32] fbdev/ps3fb: Initialize fb_ops with fbdev macros
In-Reply-To: <20231115102954.7102-20-tzimmermann@suse.de>
References: <20231115102954.7102-1-tzimmermann@suse.de>
 <20231115102954.7102-20-tzimmermann@suse.de>
Date: Thu, 16 Nov 2023 11:53:29 +0100
Message-ID: <871qcq3r6e.fsf@minerva.mail-host-address-is-not-set>
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
Cc: linux-fbdev@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
 dri-devel@lists.freedesktop.org,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Nicholas Piggin <npiggin@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Initialize the instance of struct fb_ops with fbdev initializer
> macros for framebuffers in virtual address space. Set the read/write,
> draw and mmap callbacks to the correct implementation and avoid
> implicit defaults. Also select the necessary helpers in Kconfig.
>
> Fbdev drivers sometimes rely on the callbacks being NULL for a
> default I/O-memory-based implementation to be invoked; hence
> requiring the I/O helpers to be built in any case. Setting all
> callbacks in all drivers explicitly will allow to make the I/O
> helpers optional. This benefits systems that do not use these
> functions.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Nicholas Piggin <npiggin@gmail.com>
> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> Cc: linuxppc-dev@lists.ozlabs.org
> ---
>  drivers/video/fbdev/Kconfig | 5 +----
>  drivers/video/fbdev/ps3fb.c | 7 ++-----
>  2 files changed, 3 insertions(+), 9 deletions(-)
>

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

