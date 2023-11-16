Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A78C7EDFC6
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 12:26:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A69B10E26F;
	Thu, 16 Nov 2023 11:26:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 693A010E26E
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 11:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700133988;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xhfIum68/LfGGlKZxKOpUyUVoYt3PypwKYYqLYNBIe4=;
 b=LKXPr3poCS0Jvwqk31sYxbtX4gHmsXQ3+H40DISKO50Nw/5togLZ4lN4mw2tZan/tG2eVV
 KVz8sT1jSe/FivlukqSx7fLktEbrzfA9mXZb5oTTrGkVnBvIjJ0QREVE/rDoUwUecIJm7e
 E8QZPQzmYGerQJbzB7C220J6lXfVBtA=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-440-iciGKbSZOs-UfbHrC74sNg-1; Thu, 16 Nov 2023 06:26:27 -0500
X-MC-Unique: iciGKbSZOs-UfbHrC74sNg-1
Received: by mail-lj1-f200.google.com with SMTP id
 38308e7fff4ca-2c73f8300c9so5986341fa.1
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 03:26:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700133985; x=1700738785;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xhfIum68/LfGGlKZxKOpUyUVoYt3PypwKYYqLYNBIe4=;
 b=vq1/O9P2XyuTzhFy3y9freaV3DBy1rloXxfHqeB6QUQ4JPb4stlfarMLOz4VwwLR+J
 +JNF38WJwxVHD/jC4meaOUkHMKv822lun0ENPGszV5oUGDWWLLgqMzKgB1nSgrVC1T4D
 eJaSN4LYngQw6e3TwCB5G737wIwnjX1CakCMs5vxj/holIlLBtxbaAf7iRRoMVPf8gsa
 cuUORZV1EVtO9RGDqcjrKtVsv38SjfrJv0c+MMLbx45S2+4OEECaTezSP0sdDVWybn4H
 90O5e+xteZ1oO1KCy1AMlYlMEHrqvOFIpph5D2WQ5R25/r0LUgPozI8IiGIi58FafveD
 vtVg==
X-Gm-Message-State: AOJu0YwY5IdPOhMNqDPpyx0+v/Ny5ZPM2MtGMgGCSgvWlazcufKlFQNJ
 FPtXGk7WnnLX4/FZbv5jU0MZpTGUnmo2Oxf2W3bxDnZSHCSrcFF3Fplc7meD+/gTH/uT0X1mW+5
 Rh5b+bWdDGq0C+YPi8ofnzRb8G1BJ
X-Received: by 2002:a2e:a4cb:0:b0:2c5:5926:de52 with SMTP id
 p11-20020a2ea4cb000000b002c55926de52mr5121262ljm.53.1700133985732; 
 Thu, 16 Nov 2023 03:26:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEJnR2iDTGVBiyLONW/q3XfA8jLqJYND8GKOCtotFp7WUFdUTultF747i6hHAkQad7D5Wm1Ng==
X-Received: by 2002:a2e:a4cb:0:b0:2c5:5926:de52 with SMTP id
 p11-20020a2ea4cb000000b002c55926de52mr5121250ljm.53.1700133985429; 
 Thu, 16 Nov 2023 03:26:25 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 k42-20020a05600c1caa00b003feae747ff2sm3302601wms.35.2023.11.16.03.26.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Nov 2023 03:26:25 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de
Subject: Re: [PATCH 20/32] media/ivtvfb: Initialize fb_ops to fbdev
 I/O-memory helpers
In-Reply-To: <20231115102954.7102-21-tzimmermann@suse.de>
References: <20231115102954.7102-1-tzimmermann@suse.de>
 <20231115102954.7102-21-tzimmermann@suse.de>
Date: Thu, 16 Nov 2023 12:26:24 +0100
Message-ID: <87y1ey2b33.fsf@minerva.mail-host-address-is-not-set>
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
Cc: linux-fbdev@vger.kernel.org, Andy Walls <awalls@md.metrocast.net>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Initialize the instance of struct fb_ops with fbdev initializer
> macros for framebuffers in I/O address space. This explictily sets
> the read/write, draw and mmap callbacks to the correct default
> implementation.
>
> Fbdev drivers sometimes rely on the callbacks being NULL for a
> default implementation to be invoked; hence requireing the I/O
> helpers to be built in any case. Setting all callbacks in all
> drivers explicitly will allow to make the I/O helpers optional.
> This benefits systems that do not use these functions.
>
> Set the callbacks via macros. No functional changes.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Andy Walls <awalls@md.metrocast.net>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: linux-media@vger.kernel.org
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

