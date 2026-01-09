Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F9F2D08837
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 11:21:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3BDF10E167;
	Fri,  9 Jan 2026 10:21:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="SiITk1La";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3F5010E167
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jan 2026 10:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1767954100;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FezN54GYPDoxnsyXbOv5BiaITQPqN2z+3NnISchCk/Q=;
 b=SiITk1LaVaNco5I5gy7Ya5odyQXiWD8xGjSoH1kewxL0e8OMtDI2w7BlTvIdwDjPhqUxWJ
 ucfDdyMhl333xr5Axtt5AqHuSolC0bMHRv5zT8d5bRYi0zHbIz8ubbpzhzszwTEBKay7Qd
 S5lhO1+2eEYk2GZiS7j3FFkULonRSXM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-498-BLwmjsceOMOE0vB_109FcQ-1; Fri, 09 Jan 2026 05:21:39 -0500
X-MC-Unique: BLwmjsceOMOE0vB_109FcQ-1
X-Mimecast-MFC-AGG-ID: BLwmjsceOMOE0vB_109FcQ_1767954098
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-43065ad16a8so2393921f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jan 2026 02:21:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767954098; x=1768558898;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FezN54GYPDoxnsyXbOv5BiaITQPqN2z+3NnISchCk/Q=;
 b=kqi/bYwfOtL9xGZ1G/D0ImGWdRSDRwiZKA+dKeR+N6aUZFud/1yBquxdVNOqMlflYG
 /QOC4Ddg28m4WuZpto47l6nRZNlJbCYFWKriyg0rIDP94ltIrza03f54stKMds/XM/nG
 5fq2NlDtpdsbyO7Nmdq6Tx/HB3SzTjgukD4dLuwLqIIG0A6F0eFRzN0Mc6PnUi7BRyD0
 caV++dY1HpurDmRuSiLIoR4YzeHLRPhcafSnHsunll1S6HImt/Xdt64d7U0axMR1s6w7
 H1QeowaQsoQVxnIBxICO0yzThmnfZj/iqipABb4Vcvmblg5VA8phCLWwZ+KOlTzPqgKu
 DMng==
X-Forwarded-Encrypted: i=1;
 AJvYcCXtz7PQbb8yLceFd4wP7aR9zeNMqMzoL0AabLTB+oZ/pXuTMqKwL27NxxJY4I/FhU6qXFyO3oxQtgo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwY9GgoQoUO4hGRyfTpQsY8c4bt92xvJLRwQ9ZMV+VkO+MQlhbM
 szNKziC22wlXLAqDVQu8sXCgB2FiuuUflRTVudABXyZBqgFJ9dESxQbWRZPYWg6jaDq3/5U5m+w
 aFJdRiwkaROks6z/gD8kUyZOGSJFdSil85nlzTcG2Ax2by5ER+4uvqI1aJvjVa9vJEqns8Q==
X-Gm-Gg: AY/fxX5wKQUXft7s1oK3QWGGpx3m6IAu17ijcgPLfy2eDv5fMwfbno9HBgbgiqu08IP
 tlAUQ0PXmwtxGmRP/AF1MJIqosIT9CtJtO68lmmPWYTSVQpCREJBy/GogzOWecB8ip3GuQj0T/k
 1kAiCGJlQ/7nUinl1VeFaT/ECNM3GKa7PXdPBAnsby6CsXZLEhkwZlEZrdxVQ8jSUetUo23QfXA
 J8x0sfMHgPgwvo1PUGlZ5IViVCUA2tB575kf+1mk7hzERJgFitt4XWr47BUZFhJF9ZPWCu81sdX
 dlwS/c9q9zC8ZSxPSZA6d3XRWYI/5yBKw3tza5GaTJK743p5fbQzUqHLGgz9HWXYis+aE6nYnl1
 GaCGPMZzjFcZEoRHG+5WL6CB+QbGR2ArFtV9t1LQukUngsAl6LCFd5otYRyFxuOGMT4/T
X-Received: by 2002:a05:6000:258a:b0:431:1ae:a3be with SMTP id
 ffacd0b85a97d-432c36280damr10902030f8f.3.1767954098356; 
 Fri, 09 Jan 2026 02:21:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEtCX+SYG3wx1L2Yc3dj54o790Re1VGvFH2eZ6tg5FAB0dllrthP5tvWIarRl51Mjjd7wi/qQ==
X-Received: by 2002:a05:6000:258a:b0:431:1ae:a3be with SMTP id
 ffacd0b85a97d-432c36280damr10902013f8f.3.1767954097964; 
 Fri, 09 Jan 2026 02:21:37 -0800 (PST)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432bd0e175csm21406436f8f.14.2026.01.09.02.21.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jan 2026 02:21:37 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, Julius Werner
 <jwerner@chromium.org>
Cc: tzungbi@kernel.org, briannorris@chromium.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch, chrome-platform@lists.linux.dev,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/8] firmware: google: Do sysfb test before creating
 coreboot framebuffer
In-Reply-To: <9d9015fa-aba4-4dd7-a024-563f58b7f43a@suse.de>
References: <20260108145058.56943-1-tzimmermann@suse.de>
 <20260108145058.56943-2-tzimmermann@suse.de>
 <CAODwPW9_ym3E4za3yoUAs0+1sQfaKTDOau4Oh9Zm8+2uvYVgFQ@mail.gmail.com>
 <9d9015fa-aba4-4dd7-a024-563f58b7f43a@suse.de>
Date: Fri, 09 Jan 2026 11:21:36 +0100
Message-ID: <87tswvf5n3.fsf@ocarina.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: RO8dNSnnwmJO_nPAfVIj2-UTG-X71Q1lmvC8cSMIiqU_1767954098
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

Thomas Zimmermann <tzimmermann@suse.de> writes:

Hello Thomas and Julius,

> Hi
>
> Am 08.01.26 um 17:55 schrieb Julius Werner:
>> This seems less consistent to me, although tbh I don't understand the
>> Linux device and driver framework that well. I think the original idea
>> here was that the coreboot bus represents the coreboot table, and each
>> entry is represented as one device (regardless of whether any driver
>> actually wants to do anything with that entry). That's why we're
>> creating a device for all the tags even though most of them aren't
>> really interesting for kernel drivers. This also helps with inspecting
>> things in sysfs.
>
> We need to distinguish between coreboot and sysfb. Only one of these 
> subsystems can handle the framebuffer. Having a framebuffer device on 
> the coreboot bus, if the underlying framebuffer is managed by a 
> different device seems even more incorrect.
>

I'm not familiar with coreboot so please forgive me if something that I
say makes no sense but IMO what should be done is the following:

* coreboot_table_populate() should populate the bus and devices for all
  devices. That way the complete device hierarchy will be exposed in the
  sysfs entries as Julius mentioned.

* the check on whether the CB_TAG_FRAMEBUFFER should be used or not by the
  kernel should also be there (what Thomas did in patch 1/8) but instead
  of omiting registering the coreboot device in the bus, the device could
  be marked as "unused" or "disabled" (by adding a field to coreboot_device).

* the coreboot_bus_match() function then can take this new field into
  account and only match if (device->entry.tag == id->tag && !device->unused)
  or something like that.

That way no device will be removed from the bus and the corebootdrm driver
will only be probed when the device has to actually be used by the kernel.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

