Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38407B7E316
	for <lists+dri-devel@lfdr.de>; Wed, 17 Sep 2025 14:44:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94AC210E199;
	Wed, 17 Sep 2025 10:49:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="TfgNnxfw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50DAE10E199
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Sep 2025 10:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1758106150;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7Gx+TdCKsbhxyY3jdn0KEhYYDqelpsIcgLkEZzRgBNo=;
 b=TfgNnxfwWm00Y4mOLgHNA22tCdWgRrd341EWF3Ajd9ZioCoFwUrAC7oklNtxMkWGx1H+RM
 UthaKbiBJRbKa+d8MbY6VAdYsJr95P857zC88cL+/cXaheJmWjksZIjjlHMMEWNq17LN0Q
 6ETkZaU5zQTuRl0Yz3SUxcSpcwMaRog=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-359-Pz9buNinNNehu0X3TSOVOw-1; Wed, 17 Sep 2025 06:49:07 -0400
X-MC-Unique: Pz9buNinNNehu0X3TSOVOw-1
X-Mimecast-MFC-AGG-ID: Pz9buNinNNehu0X3TSOVOw_1758106146
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-3eb536ac039so1912697f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Sep 2025 03:49:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758106146; x=1758710946;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7Gx+TdCKsbhxyY3jdn0KEhYYDqelpsIcgLkEZzRgBNo=;
 b=YARdfPUwGqQa2UopI+Rb6TYiRpudeMVrkPYXOQZQ0OfKFjFrrHUKPpdc5nZ/lkPZMc
 4EDdNXNmnOEr9ysVojR0M/ffX9wZwUsg3VzL6X10/RMCnakkm6XG7BesynQgPZsimu8o
 IGAVrx7hP/xlk2Qym589mmPNXIt6QrrgOIMKmHr+dCTMW1YZqHADwCnjT8qJ0TELPU75
 OpMYLg+gK7dwc/5jQHD9GCDedsKp8l408Dt7iYHRDLo2iEsi2Lkj9fZ6qlgTk5Aznrpm
 LavuRQRW6YlEXCD5GlEAMZyCr0jPURwGnlBeZAoHdsptb4uzYJIDxZuFXLMA3pNU9cmk
 kLJQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVXs0OtWNveEO5mlkQoG+DL/1aoBWMdvFWsTkTq64MQdOMkk+epKci0spckM/L8d9sLBQQISkJawrM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyJQgVyxajoTsCitl4AGphQWFzz9H8MmkndSau3Qa5cGW6gZL6C
 UByFEdmjWXxRh73bsT5orelw1ANvhgAkGe2v0h0/NTL7fmYEBz1ZxbCxvBCBf1JmeKNoYLAfzTm
 dJ7MlmoiSvxeO/DUNzWGcuOw1qoKa393CwQnbjtm9WsmKQczWTyg4aMj8Nyq3joBhgQPGIw==
X-Gm-Gg: ASbGncsuuVHVeE9vMQZaefV184VfSwuBPOCcMYPG8SsOZxW+tI0Wrab5LXGoA4HxzQR
 zPdloSddMJJopSpBfKB+yThWjoENxIqa3pV8Pd+4Q4AF6E8KsUfD2CrvLe38LjUgu4GhsYtUo2O
 /i8/FIf+StNfft1fnwUEJ/AeJ1RMW0hWMwuyxJ5p6fb1P1oGRqecSehfbS7f42x9cfA/Fwhd0tr
 +vXrt04pqW2S1GohJyq6RjtNn9TwHYX9JKVz5jjdhLs4KXw6SHnNtJCwuZjjShm77o7EAD0bHJF
 bK+VYH9k8PaMCI8eWSur4BU9/jmPRQHKvVUAjH0tnr6swZbCbC28ObawRRwyN+Y+BZT0Jl6J0MX
 xUG5w2XXF0MrpZXdMDOU1Ew==
X-Received: by 2002:a05:6000:420a:b0:3ec:db18:1695 with SMTP id
 ffacd0b85a97d-3ecdfa2af44mr1788139f8f.45.1758106145840; 
 Wed, 17 Sep 2025 03:49:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFWDibHsRXwK4fNY6Iro6utVUGE4L1K31z5iDT3jS0cDkRWw/GZJYpDVS83FdGh12iI5IMZeA==
X-Received: by 2002:a05:6000:420a:b0:3ec:db18:1695 with SMTP id
 ffacd0b85a97d-3ecdfa2af44mr1788111f8f.45.1758106145366; 
 Wed, 17 Sep 2025 03:49:05 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3e7607870cfsm26394071f8f.19.2025.09.17.03.49.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Sep 2025 03:49:04 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: James Flowers <bold.zone2373@fastmail.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 skhan@linuxfoundation.com
Cc: James Flowers <bold.zone2373@fastmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH] drm/ssd130x: Use kmalloc_array() instead of kmalloc()
In-Reply-To: <20250914073841.69582-1-bold.zone2373@fastmail.com>
References: <20250914073841.69582-1-bold.zone2373@fastmail.com>
Date: Wed, 17 Sep 2025 12:49:03 +0200
Message-ID: <871po54an4.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: fJqpDN2ZVggluwJBfPphFR6SZIxmnqmSglZzPFSMz4o_1758106146
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

James Flowers <bold.zone2373@fastmail.com> writes:

> Documentation/process/deprecated.rst recommends against the use of
> kmalloc with dynamic size calculations due to the risk of overflow and
> smaller allocation being made than the caller was expecting.
> kmalloc_array avoids this issue.
>
> Signed-off-by: James Flowers <bold.zone2373@fastmail.com>
> ---

Pushed to drm-misc (drm-misc-next). Thanks!

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

