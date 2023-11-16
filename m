Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A877EE03D
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 12:57:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5638910E27A;
	Thu, 16 Nov 2023 11:57:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DA7910E27A
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 11:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700135855;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=d0x9UvS/AGzYjlZ/Z2zNd3aI+mpUR93ucZIMrrtEjbM=;
 b=P3DaPKNdVSNLQmXBIq6QsXC5XSBKuyQXcnTCioWXQ80VCorMGZRxp+dNzBKbpX39KmBQXS
 CSWscRcWSQ0ofHyPGip1V1j+bGwlboG98lvrjqWZhG+rinQ2jF6Pb9Ktl7n3SBzFBZrQ6B
 4heoXWweYVwii+mXVquz5M00GIGiIOA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-86-Tel7VndmNB--JAiAkGWMeQ-1; Thu, 16 Nov 2023 06:57:34 -0500
X-MC-Unique: Tel7VndmNB--JAiAkGWMeQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-4090fa518bbso3972835e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 03:57:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700135853; x=1700740653;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=d0x9UvS/AGzYjlZ/Z2zNd3aI+mpUR93ucZIMrrtEjbM=;
 b=NFkoX6wyrQlOWnLHsF3O+3uYTXcjuFF7exEYHtP1KSg4kbuJyVdacsSvXLNf2G5+hp
 XfD599Gyf/1Cl5x6ZMYK6Y1YAlfkVnPotLANA3R7jvTRav8YeO7+WseBMJy+SYtg080y
 HGohZZRFWlrVmHWuURBlZIf4R5sWucy/jFGxMTvQXnqmFYSV9obiT8etBPy0xkKzBvvY
 jnmgRPwS5+7rC3DuXk3ruB++2vtaYViI/bDIn0J85+y6mCT7jfCBp3VTcfMulB0VrGOR
 DgL6suEe9wW6BtPaopaLSeblWS+Qs33SeFVUQrXWqwDtL/sQVYGkrQ0wBuYoTt4FQrgq
 mJxQ==
X-Gm-Message-State: AOJu0YwrBFSEcTfCY0jPdkSriAQpaondd1lGr+Wje/58cMhmFd7E2PRE
 nEyMrC86QU9wpLltbeKK9doQr8YP0/2B6EY4Per/kO1cM1fjHHKkVWNfkVIoa+4na1rLIbuzEzF
 /kkdq4KZyixAhL76h1ON8YysHalbu
X-Received: by 2002:a05:600c:45cb:b0:407:4944:76d1 with SMTP id
 s11-20020a05600c45cb00b00407494476d1mr13758927wmo.17.1700135852901; 
 Thu, 16 Nov 2023 03:57:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFm26jbjrnNx5RwuUbvEv4kZjrhk1hAedzBux3U2jDdTSsXmQhUUYJ6Mw3sAUj+R0Hgu6ZZMQ==
X-Received: by 2002:a05:600c:45cb:b0:407:4944:76d1 with SMTP id
 s11-20020a05600c45cb00b00407494476d1mr13758914wmo.17.1700135852559; 
 Thu, 16 Nov 2023 03:57:32 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 j6-20020adff006000000b0033142b1a1eesm13008753wro.87.2023.11.16.03.57.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Nov 2023 03:57:32 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de
Subject: Re: [PATCH 26/32] staging/sm750fb: Initialize fb_ops with fbdev macros
In-Reply-To: <20231115102954.7102-27-tzimmermann@suse.de>
References: <20231115102954.7102-1-tzimmermann@suse.de>
 <20231115102954.7102-27-tzimmermann@suse.de>
Date: Thu, 16 Nov 2023 12:57:31 +0100
Message-ID: <87h6ll3o7o.fsf@minerva.mail-host-address-is-not-set>
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
Cc: linux-fbdev@vger.kernel.org, Teddy Wang <teddy.wang@siliconmotion.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Initialize all instances of struct fb_ops with fbdev initializer
> macros for framebuffers in I/O address space. Set the read/write,
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
> Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
> Cc: Teddy Wang <teddy.wang@siliconmotion.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: linux-staging@lists.linux.dev
> ---
>  drivers/staging/sm750fb/sm750.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

