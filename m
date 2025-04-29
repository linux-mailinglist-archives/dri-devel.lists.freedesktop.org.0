Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 703D2AA0494
	for <lists+dri-devel@lfdr.de>; Tue, 29 Apr 2025 09:33:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6090610E374;
	Tue, 29 Apr 2025 07:33:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="ggxje4NR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA72E10E374
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Apr 2025 07:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1745912005;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=P+72HNtfhPv8IsRO4PpBbClmzVtCdsJ1REbN19xYrgg=;
 b=ggxje4NRTKfkAUI0QIWOfWiOjaUkugR9C76Zj33BO3vVjdsWVdbhAP/XxGDVsHZ/oKscc9
 ydoDU3SsaZMrGfPBB60cI7lfnR8A9TnJLNfeLj0Et9pV76s984eV3+XmS0yxEbjVDsw2eK
 iIArgYXBy1B4vZVO/nr910ixW+0N4nI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-258-JCisTVXQMIywILxXPtf4fw-1; Tue, 29 Apr 2025 03:33:22 -0400
X-MC-Unique: JCisTVXQMIywILxXPtf4fw-1
X-Mimecast-MFC-AGG-ID: JCisTVXQMIywILxXPtf4fw_1745912001
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-43d4d15058dso38670915e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Apr 2025 00:33:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745912001; x=1746516801;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=P+72HNtfhPv8IsRO4PpBbClmzVtCdsJ1REbN19xYrgg=;
 b=P+lqbzGHNnlntV2b6kk7bnhzx/lTrKsvCM8W4GSij8pTPCx6ahdzRFSzXcVtSrjlv3
 2PzsY4bMqe+n5ASzQUpqzrDtee8glVQBqeMtVIsgHTV/ubEjEymY5KzFpvzq5LkFBKdi
 DDsUsj97qZuVYPvfw173v/shMdSXX4UyCmrqTAHsZ0epmkD+c/j1nKut1ky/QUA3E9ac
 Sk4Q6nKxgQY5pxkqWrblvkl57FGSJ1fPUZj2gQ5j4OdbyudZGYqoNR8b9eaCfqes4mJw
 47F9z9TWmJLinsNmQL24UYoBdqSWjeAvvyNemWcuEFIp9XpnYDsXk3ZHGGkp0j1YRBKK
 RKvA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXiM4rimL1B6wpkCrHtnpN3mD5dS+9SO5kFht8vlFT4f3XZELhYFPs5xhWqtKgf7T6A3Tg6iIA1pos=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzQG/n09sS7omPdjL/+RwwXwX3HPLVF/si8BItTmAAyR5dIq5pA
 iedN6/5hu+1WT42lqCYOtav5zHOO3QJb9KELg2PmpXYP13It5miy9AhZJxY4juQZKapzOq7G4J4
 Vdnve99bPyTOh7dDfrm1yZc5Ac/BrKZrUqLRW/aA0O7uOkoO4lhlltkcKiIKb46OS5A==
X-Gm-Gg: ASbGncvTi4HQ1blsV3uIChqlEeczSD5Y032u/4LtPfHLwePxnUbWQ1LHzK0EUXvSXSD
 aY984xRyeI1Cdn457SmMVRasVG5zzNuE7KsXH9c5/WHxjavslmofwFhuwUe1hhbpZh1ICMbtVte
 U6okhP7IW/0mNhoVGqH9OhBpHMXUipaUP7JOaNRj7YocRyqybZ/CjtUUGDRGTSA1a+BH/aJTGsu
 OckVjQSpFvhCAFkTHW/gUdfeZW6CXXpUTj1fwYVT9JWet3neo6aGJuise3/EUhRS+Q8+PoEAEzv
 lDxNWFknYFwlMO9GbOiGgRUo39tE703AmQ6N7KXesaBqHygfRVbkSF2RE+Ezihjg6BWDCg==
X-Received: by 2002:a05:600c:19cc:b0:43d:9f2:6274 with SMTP id
 5b1f17b1804b1-441ac85786bmr19965665e9.14.1745912001307; 
 Tue, 29 Apr 2025 00:33:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHQHljw4FTOErNPchc4gpA5RoNY02F91HquBdjkOTWdJUR7gI95jnweHCcRLzTuNXQSYwqi6w==
X-Received: by 2002:a05:600c:19cc:b0:43d:9f2:6274 with SMTP id
 5b1f17b1804b1-441ac85786bmr19965335e9.14.1745912000916; 
 Tue, 29 Apr 2025 00:33:20 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a073c8ca72sm12866525f8f.4.2025.04.29.00.33.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Apr 2025 00:33:18 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Jocelyn Falempe <jfalempe@redhat.com>, Miguel Ojeda <ojeda@kernel.org>,
 Christian Schrefl <chrisi.schrefl@gmail.com>, Arnd Bergmann
 <arnd@arndb.de>, Russell King <linux@armlinux.org.uk>, Paolo Bonzini
 <pbonzini@redhat.com>, rust-for-linux <rust-for-linux@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, Thomas Zimmermann
 <tzimmermann@suse.de>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Subject: Re: [PATCH] drm/panic: Use a decimal fifo to avoid u64 by u64 divide
In-Reply-To: <20250418165059.560503-1-jfalempe@redhat.com>
References: <20250418165059.560503-1-jfalempe@redhat.com>
Date: Tue, 29 Apr 2025 09:33:17 +0200
Message-ID: <8734dr1kxu.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: p7d80jShUhrAA0ovg07v63lugVJ1kdcvbzvwkmLn510_1745912001
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

Jocelyn Falempe <jfalempe@redhat.com> writes:

Hello Jocelyn,

> On 32bits ARM, u64/u64 is not supported [1], so change the algorithm
> to use a simple fifo with decimal digits as u8 instead.
> This is slower but should compile on all architecture.
>
> Link: https://lore.kernel.org/dri-devel/CANiq72ke45eOwckMhWHvmwxc03dxr4rnxxKvx+HvWdBLopZfrQ@mail.gmail.com/ [1]
> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> ---

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

