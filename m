Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DFD4AEC5A9
	for <lists+dri-devel@lfdr.de>; Sat, 28 Jun 2025 09:44:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C83A10E169;
	Sat, 28 Jun 2025 07:44:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Dt1IH20A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0DD010E169
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Jun 2025 07:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1751096658;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ydIOn4cObg5jMynOcPUQSKhCiIT10hi8OVkhpABvLHw=;
 b=Dt1IH20AAfsxMrFVqgBm34ppWsqgG5FvlhThQKwE7img+Xo/4etB2E5NE8Qloq+vJdZtAt
 mOua6nk5en6rNM8A6XtcvCEx06WcrzU0T/UUnQQoaMqknlTHY7hMjr+bstajyiYR6DlAsH
 iG8VLYY8BqObnLWGydtOSs2hqMcoDys=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-515-NFBkAACmMyujvtnWjpo2ww-1; Sat, 28 Jun 2025 03:44:16 -0400
X-MC-Unique: NFBkAACmMyujvtnWjpo2ww-1
X-Mimecast-MFC-AGG-ID: NFBkAACmMyujvtnWjpo2ww_1751096655
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-451d2037f1eso2965155e9.0
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Jun 2025 00:44:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751096655; x=1751701455;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ydIOn4cObg5jMynOcPUQSKhCiIT10hi8OVkhpABvLHw=;
 b=cvBr9Ow6xv0G9lxqRhooAfXu8mV/IofDVaRKAW6e7Y3H6mA6L6VHOi/wQf9jA7aPSo
 LXFreORrqNkVgBaY9v45RA4I+pfOhkrISfyrOqYEDHZpTPBO/8JBItOk5ScbM61Oskje
 C0ofXkMIJPD24oXpmb4i4pPAePpse2oKFjFXg44xIXRfQaySxLchCr7rVzdgOHoFsXAA
 A/D4fv40U3QqDj7hVfzq2H480AR7WM/HLA43EsnrPfRssOE71iQSzL9C3o8IflyYOF02
 aG0rNxip6jf9ulNv1T1DMYPYBP7L8gyGfXoCXOp4QqhG+phiUgNSVh7ME84wxLwBU95i
 V43Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVrw4mic9AueOgRRUSbel8A1crB1uHgSQCdnB0k5YPzekFX3PklxOlfBcbcTF4iDmOkkUW08/E4Ym8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxqLDkzq97HV5P/kggYsjfrmoPBbvg29oD47m1viLxHyGua9iPw
 h+71VKWinlpm/UNQKKH2domy1naK+E+uy1H2EMYi2ve0jKg1qXbynIvYcsd4+aB+PhvNsJ9uFkI
 DRv+vOqNT8q1rL7RyMgkrCcHaG8TbsMPFTq4nAFvq930jU9/NhXGFWhwZTjV7RqC/F9jqB5SWJe
 kUTg==
X-Gm-Gg: ASbGncskLy8Y3OEJ7bf1EvjRywImz9jzUNDyb6TPEsulL97qSypZSo14IMbKMuO+LZC
 qdItCtzafXVTYwrszlhHET/am2/agnh748KFHKOpkQsbMuDsWU2f/S3GhzKhABkSZwkWoaFSqVI
 3FvfDWDThYgWPAC3arwj8mX6skv1nxWcer2xkQDOT9StzGi9PKBQG7lbgs72P+IqgCC6SqeWOSR
 qkIiJEimV4KgRIezdwMO0ld+Xfen1qxZDmycyGsHdEYwj40aGp/bsCxBgDyY7utNDISEnH15Ogl
 xn1LXqZ6s55ZfiL8Tya/4n2HQkZRCBxriJnP/hHQlNNf2CglhJ1v/dlAx4Qsz0/6pqgO0PJ/Tr3
 EctFi
X-Received: by 2002:a05:600c:5493:b0:44b:1f5b:8c85 with SMTP id
 5b1f17b1804b1-4538ee3b945mr61735925e9.13.1751096654913; 
 Sat, 28 Jun 2025 00:44:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGA3QiP5gV2eDPP2/C7TDuUzC2dzUVwImKjDjLFfIECYmunirpIeECcO6UhqJs+LjySXky4Nw==
X-Received: by 2002:a05:600c:5493:b0:44b:1f5b:8c85 with SMTP id
 5b1f17b1804b1-4538ee3b945mr61735675e9.13.1751096654451; 
 Sat, 28 Jun 2025 00:44:14 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a892e6214fsm4673306f8f.98.2025.06.28.00.44.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Jun 2025 00:44:13 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, dri-devel@lists.freedesktop.org, Borislav Petkov
 <bp@suse.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Simona
 Vetter <simona.vetter@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] MAINTAINERS: Add missing sysfb files to firmware
 framebuffers entry
In-Reply-To: <20250627113328.2703491-1-javierm@redhat.com>
References: <20250627113328.2703491-1-javierm@redhat.com>
Date: Sat, 28 Jun 2025 09:44:12 +0200
Message-ID: <871pr4b99v.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: PQbRdEHEamUqTL6aQ8Jj-YQgjInYugEYDvI68TVs45s_1751096655
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

Javier Martinez Canillas <javierm@redhat.com> writes:

> The commit d391c5827107 ("drivers/firmware: move x86 Generic System
> Framebuffers support") moved the sysfb*.c source files from arch/x86
> to drivers/firmware, because the logic wasn't x86 specific and could
> be used by other architectures.
>
> But the drivers/firmware path is not listed in MAINTAINERS, which led
> to the files being orphaned and scripts/get_maintainer.pl not listing
> a mailing list to Cc anymore.
>
> Now that we have an entry for all the firmware-provided framebuffer code,
> add the missing sysfb files to make sure correct folks and list is Cc'ed.
>
> Fixes: d391c5827107 ("drivers/firmware: move x86 Generic System Framebuffers support")
> Reported-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Closes: https://lore.kernel.org/lkml/aF53djlieUNF_-aV@smile.fi.intel.com/
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> ---
>

Pushed to drm-misc (drm-misc-next). Thanks!

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

