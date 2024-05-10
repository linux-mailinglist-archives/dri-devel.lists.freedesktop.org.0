Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C5E58C1F0C
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2024 09:37:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4E5410E0F5;
	Fri, 10 May 2024 07:37:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="AyWcIMBv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BFE310E0F5
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2024 07:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1715326623;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=f3snRDY5LM+E4fFNdUEk/aHSs6UauMwWG/qLALDMApo=;
 b=AyWcIMBv0iV0HpbaRZK449Q/gTPfhr2eSIttjIXTL4iyqFic7JrixkPpJ6fzP6zTLmkFZo
 aQva0djSlmRlP3FXtWaNVLftVrUXvdqGVM16jZSrUcjKuwdzRezgAqb2ZNPgvEdkBh43dW
 k1kuqUWZ2/KST0CHx+tVd8XMOsjDO6Q=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-385-Z1wANACsP06aT4yL1NerYg-1; Fri, 10 May 2024 03:37:01 -0400
X-MC-Unique: Z1wANACsP06aT4yL1NerYg-1
Received: by mail-lj1-f199.google.com with SMTP id
 38308e7fff4ca-2e289eec4d1so15056981fa.0
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2024 00:37:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715326619; x=1715931419;
 h=mime-version:message-id:date:references:in-reply-to:subject:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=f3snRDY5LM+E4fFNdUEk/aHSs6UauMwWG/qLALDMApo=;
 b=DRSffFU8slsuuh0xHQKNOscdzqYxzS6OLiLvEDWGI8v9toOU5soDtcJsb0v+VTM0WS
 R9gbeGZ/9BGFqHprtMQemV6rEhHdbi6UtIQsSsjL6qMtOMXnHFXuoylXGr8ktRngPvmI
 qhLkhvazR1anKwayx7LRFDgfJ+w2QZ+Pf3SkNSk5a9+SVhggxB3Vg5Bzq01n3fbJkfbJ
 LTKzGBrVmJnCbAPYmWPFqoYKKuJ92yJ+QiuZKgBpODSiqPmw7+0mErzapqhoECw1msua
 lmxmdOc9i49zmrHQypR5o94UTGAJEENNlvfvUoYlazNXmmaMpzeyt68q+uBXSLpP0Qfp
 9AQw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX2xYeUkTxEfuDrC+EOGrWql9metglXCXwkO1pi2ZrjxwWvy7PHoOHKONrLk0OTlTY4kWzoDp4CemJKqCueKovbwT+Brk8VEySL6XqJKkjz
X-Gm-Message-State: AOJu0Yyl+OLxcW0m3uPE9w7oQMgAw7neRpD+ZyrspTAWXc5HKKaawplY
 jDTTwvRXC4VHhEkd/XPW5IH4rr52X673FaAjHZCHe1veJ8WxFyXO0QhqZNtY51FyTU0T2r3T2lv
 bIzLvxeTUfKIR3EgcCbBqephZf84t2WRwOno1lz1aiQzRawZJOL1Zv26y1j7O0wTARduLf26xyQ
 ==
X-Received: by 2002:a2e:b01a:0:b0:2de:3421:9edd with SMTP id
 38308e7fff4ca-2e5203a4665mr9366431fa.33.1715326619401; 
 Fri, 10 May 2024 00:36:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFUOLfzWovTQltZ8oy0Cew/16VSGPB4VeoKBOb8QA63KKZYPiO5xFEAjB05GyRI7xxMzqtBrQ==
X-Received: by 2002:a2e:b01a:0:b0:2de:3421:9edd with SMTP id
 38308e7fff4ca-2e5203a4665mr9366321fa.33.1715326618792; 
 Fri, 10 May 2024 00:36:58 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-41f87d20488sm87796615e9.25.2024.05.10.00.36.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 May 2024 00:36:58 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: nerdopolis <bluescreen_avenger@verizon.net>,
 dri-devel@lists.freedesktop.org
Subject: Re: simpledrm, running display servers, and drivers replacing
 simpledrm while the display server is running
In-Reply-To: <9215788.EvYhyI6sBW@nerdopolis2>
References: <9215788.EvYhyI6sBW.ref@nerdopolis2>
 <9215788.EvYhyI6sBW@nerdopolis2>
Date: Fri, 10 May 2024 09:36:57 +0200
Message-ID: <87seyqce3q.fsf@minerva.mail-host-address-is-not-set>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

nerdopolis <bluescreen_avenger@verizon.net> writes:

Hello,

> Hi
>
> So I have been made aware of an apparent race condition of some drivers taking a bit longer to load, which could lead to a possible race condition of display servers/greeters using the simpledrm device, and then experiencing problems once the real driver loads, the simpledrm device that the display servers are using as their primary GPU goes away. 
>

Plymouth also had this issue and that is the reason why simpledrm is not
treated as a KMS device by default (unless plymouth.use-simpledrm used).

> For example Weston crashes, Xorg crashes, wlroots seems to stay running, but doesn't draw anything on the screen, kwin aborts, 
> This is if you boot on a QEMU machine with the virtio card, with modprobe.blacklist=virtio_gpu, and then, when the display server is running, run sudo modprobe virtio-gpu
>
> Namely, it's been recently reported here: https://github.com/sddm/sddm/issues/1917[1] and here https://github.com/systemd/systemd/issues/32509[2]
>
> My thinking: Instead of simpledrm's /dev/dri/card0 device going away when the real driver loads, is it possible for simpledrm to instead simulate an unplug of the fake display/CRTC?
> That way in theory, the simpledrm device will now be useless for drawing for drawing to the screen at that point, since the real driver is now taken over, but this way here, at least the display server doesn't lose its handles to the /dev/dri/card0 device, (and then maybe only remove itself once the final handle to it closes?)
>
> Is something like this possible to do with the way simpledrm works with the low level video memory? Or is this not possible?
>

How it works is that when a native DRM driver is probed, it calls to the
drm_aperture_remove_conflicting_framebuffers() to kick out the generic
system framebuffer video drivers and the aperture infrastructure does a
device (e.g: "simple-framebuffer", "efi-framebuffer", etc) unregistration.

So is not only that the /dev/dri/card0 devnode is unregistered but that the
underlaying platform device bound to the simpledrm/efifb/vesafb/simplefb
drivers are unregistered, and this leads to the drivers being unregistered
as well by the Linux device model infrastructure.

But also, this seems to be user-space bugs for me and doing anything in
the kernel is papering over the real problem IMO.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

