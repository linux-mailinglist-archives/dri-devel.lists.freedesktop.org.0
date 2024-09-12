Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B15DF9767F9
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2024 13:35:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7537A10EB4E;
	Thu, 12 Sep 2024 11:35:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="RbV6sVf+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5548210EB4E
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2024 11:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1726140951;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IYaaq+dX0/7DEojW1l9AFpFIChJdEY2bBK1F9k5BgD0=;
 b=RbV6sVf+4F8Jb9xKXS6d/m0T6SHPJdHYQdrCtvekXILAZl1B70+DB6QY6CjOBYeUxb715C
 EOE8xgStkUjCl0Dk+Z1M4GR7AnhpwdKZDAecashU64gi1ocQtUoEflCbTaeQL97vezv8SM
 5ZkY465XuG1j4Pf+l47A5q2rSRe986c=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-627-LZcwKrklPuylAVOKnjjxjQ-1; Thu, 12 Sep 2024 07:35:50 -0400
X-MC-Unique: LZcwKrklPuylAVOKnjjxjQ-1
Received: by mail-lf1-f72.google.com with SMTP id
 2adb3069b0e04-5365cd47dd8so719526e87.2
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2024 04:35:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726140949; x=1726745749;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IYaaq+dX0/7DEojW1l9AFpFIChJdEY2bBK1F9k5BgD0=;
 b=NnUjgplt+9tl0VEqsDRdxDSDMXa3Eq33qGeNd1PCjn45l2IN9Qbk0Ea8N9i3PXKetH
 LKNSKx1GLbTgDb22vJUmHk+kUQTSnb2+0Mw6iHO+zp4enSxRvJT/prDSy858t7tXVcxC
 +OVH9Ug+AKonePUuNIeahNQ1uzYTdaY/vjPhQXc6uRFKrHU45N+pfH/JMEVN91MFYqFv
 RPnBZtPjpzaU4bFMHXd4X8GZtoy85wk0f/H+O/GDSrjJLoAKvvMWaMZ5AHDTjJtdZ06S
 PfII00cVZGkYkw5ZCev7pHgOY2i2oSrXE5v3zW4jVCxsOoVlJaH9AYkY+bDmx9PUERF6
 wRYQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXoyX4z3Hv+1fqNzjgbB4VHktJqdDB0VjmkO7tQ4ZwlazwUG2AdbJ9PnDsby+KXJi497ozzWLq1Npg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxPN/eB8OY0RFxg11vF1YV2oShFlWIYJobmMSIYFSwgJhZdusub
 pRU0mfKd2lMzFvZvEVvtvdvPOFTdFNhEfvUBy/FipC/8WGnT84yQ1yX7OCfSRrssj7AoEHyJ3J9
 SRzDLQqr3JQcQs+TWTRMusvTMC6fZzrkGFs28ltoinx9LhyyIL028pTGh9QIXKnFmhw==
X-Received: by 2002:a05:6512:4017:b0:533:4785:82a7 with SMTP id
 2adb3069b0e04-53678fc8586mr1605062e87.28.1726140948557; 
 Thu, 12 Sep 2024 04:35:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEBna+5EinCwR/Lij9CpfGsghHsYmmA3HZg2qxflQ5JJykqP5bH1I+Yy9IcXwnu0/KGf+lDXw==
X-Received: by 2002:a05:6512:4017:b0:533:4785:82a7 with SMTP id
 2adb3069b0e04-53678fc8586mr1605032e87.28.1726140947816; 
 Thu, 12 Sep 2024 04:35:47 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42cb179f8e3sm162451165e9.43.2024.09.12.04.35.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Sep 2024 04:35:47 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Brian Norris <briannorris@chromium.org>, Borislav Petkov <bp@alien8.de>
Cc: Hugues Bruant <hugues.bruant@gmail.com>, stable@vger.kernel.org,
 regressions@lists.linux.dev, linux-kernel@vger.kernel.org, Fenghua Yu
 <fenghua.yu@intel.com>, Reinette Chatre <reinette.chatre@intel.com>, Tony
 Luck <tony.luck@intel.com>, Tzung-Bi Shih <tzungbi@kernel.org>, Julius
 Werner <jwerner@chromium.org>, chrome-platform@lists.linux.dev, Jani
 Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [NOT A REGRESSION] firmware: framebuffer-coreboot: duplicate
 device name "simple-framebuffer.0"
In-Reply-To: <ZuCGkjoxKxpnhEh6@google.com>
References: <CALvjV29jozswRtmYxDur2TuEQ=1JSDrM+uWVHmghW3hG5Y9F+w@mail.gmail.com>
 <20240909080200.GAZt6reI9c98c9S_Xc@fat_crate.local>
 <ZuCGkjoxKxpnhEh6@google.com>
Date: Thu, 12 Sep 2024 13:35:46 +0200
Message-ID: <87jzfhayul.fsf@minerva.mail-host-address-is-not-set>
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

Brian Norris <briannorris@chromium.org> writes:

Hello Brian,

> (Tweaking subject; this indeed isn't related to the regression at all)
>
> Hi,
>
> On Mon, Sep 09, 2024 at 10:02:00AM +0200, Borislav Petkov wrote:
>> Looking at your log, the first warn is in framebuffer_coreboot. Some mess in
>> the sysfs platform devices registration.
>> 
>> Adding the relevant people for that:
>> 
>> Aug 20 20:29:36 luna kernel: sysfs: cannot create duplicate filename '/bus/platform/devices/simple-framebuffer.0'
>> Aug 20 20:29:36 luna kernel: CPU: 5 PID: 571 Comm: (udev-worker) Tainted: G           OE      6.10.6-arch1-1 #1 703d152c24f1971e36f16e505405e456fc9e23f8
>> Aug 20 20:29:36 luna kernel: Hardware name: Purism Librem 14/Librem 14, BIOS 4.14-Purism-1 06/18/2021
>> Aug 20 20:29:36 luna kernel: Call Trace:
>> Aug 20 20:29:36 luna kernel:  <TASK>
>> Aug 20 20:29:36 luna kernel:  dump_stack_lvl+0x5d/0x80
>> Aug 20 20:29:36 luna kernel:  sysfs_warn_dup.cold+0x17/0x23
>> Aug 20 20:29:36 luna kernel:  sysfs_do_create_link_sd+0xcf/0xe0
>> Aug 20 20:29:36 luna kernel:  bus_add_device+0x6b/0x130
>> Aug 20 20:29:36 luna kernel:  device_add+0x3b3/0x870
>> Aug 20 20:29:36 luna kernel:  platform_device_add+0xed/0x250
>> Aug 20 20:29:36 luna kernel:  platform_device_register_full+0xbb/0x140
>> Aug 20 20:29:36 luna kernel:  platform_device_register_resndata.constprop.0+0x54/0x80 [framebuffer_coreboot a587d2fc243ebaa0205c3badd33442a004d284e0]
>> Aug 20 20:29:36 luna kernel:  framebuffer_probe+0x165/0x1b0 [framebuffer_coreboot a587d2fc243ebaa0205c3badd33442a004d284e0]
>> Aug 20 20:29:36 luna kernel:  really_probe+0xdb/0x340
>> Aug 20 20:29:36 luna kernel:  ? pm_runtime_barrier+0x54/0x90
>> Aug 20 20:29:36 luna kernel:  ? __pfx___driver_attach+0x10/0x10
>> Aug 20 20:29:36 luna kernel:  __driver_probe_device+0x78/0x110
>> Aug 20 20:29:36 luna kernel:  driver_probe_device+0x1f/0xa0
>> Aug 20 20:29:36 luna kernel:  __driver_attach+0xba/0x1c0
>> Aug 20 20:29:36 luna kernel:  bus_for_each_dev+0x8c/0xe0
>> Aug 20 20:29:36 luna kernel:  bus_add_driver+0x112/0x1f0
>> Aug 20 20:29:36 luna kernel:  driver_register+0x72/0xd0
>> Aug 20 20:29:36 luna kernel:  ? __pfx_framebuffer_driver_init+0x10/0x10 [framebuffer_coreboot a587d2fc243ebaa0205c3badd33442a004d284e0]
>> Aug 20 20:29:36 luna kernel:  do_one_initcall+0x58/0x310
>> Aug 20 20:29:36 luna kernel:  do_init_module+0x60/0x220
>> Aug 20 20:29:36 luna kernel:  init_module_from_file+0x89/0xe0
>> Aug 20 20:29:36 luna kernel:  idempotent_init_module+0x121/0x320
>> Aug 20 20:29:36 luna kernel:  __x64_sys_finit_module+0x5e/0xb0
>> Aug 20 20:29:36 luna kernel:  do_syscall_64+0x82/0x190
>> Aug 20 20:29:36 luna kernel:  ? __do_sys_newfstatat+0x3c/0x80
>> Aug 20 20:29:36 luna kernel:  ? syscall_exit_to_user_mode+0x72/0x200
>> Aug 20 20:29:36 luna kernel:  ? do_syscall_64+0x8e/0x190
>> Aug 20 20:29:36 luna kernel:  ? do_sys_openat2+0x9c/0xe0
>> Aug 20 20:29:36 luna kernel:  ? syscall_exit_to_user_mode+0x72/0x200
>> Aug 20 20:29:36 luna kernel:  ? do_syscall_64+0x8e/0x190
>> Aug 20 20:29:36 luna kernel:  ? clear_bhb_loop+0x25/0x80
>> Aug 20 20:29:36 luna kernel:  ? clear_bhb_loop+0x25/0x80
>> Aug 20 20:29:36 luna kernel:  ? clear_bhb_loop+0x25/0x80
>> Aug 20 20:29:36 luna kernel:  entry_SYSCALL_64_after_hwframe+0x76/0x7e
>> Aug 20 20:29:36 luna kernel: RIP: 0033:0x7b1bee2f81fd
>
> Looks like it might be a conflict with
> drivers/firmware/sysfb_simplefb.c, which also uses the
> "simple-framebuffer" name with a constant ID of 0. It's possible both
> drivers should be switched to use PLATFORM_DEVID_AUTO? Or at least one
> of them. Or they should use different base names.
>

I'm unsure about PLATFORM_DEVID_AUTO because I don't know if there are
user-space programs that assume this to always be "simple-framebuffer.0".

> I'm not really sure what the best option is (does anyone rely on or care
> about the device naming?), and I don't actually use this driver. But
> here's an untested diff to try if you'd really like. If you test it,
> feel free to submit as a proper patch with my:
>


I've discussed this with Thomas Zimmermann (simpledrm maintainer) and
he suggests that the problem is the system framebuffer information to
be provided in both Coreboot table entry (AFAIU is LB_TAG_FRAMEBUFFER)
and in the boot_params, which leads to struct screen_info to be filled.

We had the same problem for EFI systems that passed DTB to the kernel
instead of ACPI, in those cases both a "simple-framebuffer" DT node and
an EFI-GOP table could be provided.

Commit 3310288f6135 "(of/platform: Disable sysfb if a simple-framebuffer
node is found") solved that issue. I've typed the same for Coreboot to
handle in the same way. Please let me know what you think:

From 6955149fb13af1c0cba2e5c1fbb1ac9367a09ae2 Mon Sep 17 00:00:00 2001
From: Javier Martinez Canillas <javierm@redhat.com>
Date: Thu, 12 Sep 2024 12:55:29 +0200
Subject: [RFC PATCH] firmware: coreboot: Disable sysfb if Coreboot already
 provides a FB

On Coreboot platforms, a system framebuffer may be provided to the Linux
kernel by filling a LB_TAG_FRAMEBUFFER entry in the Coreboot table. But
it seems SeaBIOS payload can also provide a VGA mode in the boot params.

If that the case, early arch x86 boot code will fill the global struct
screen_info data.

The data is used by the Generic System Framebuffers (sysfb) framework to
add a platform device with platform data about the system framebuffer.

But if there is information about the system framebuffer in the Coreboot
table as well, the framebuffer_coreboot driver will also try to do the
same and add another device for the system framebuffer. This will fail
though because there's already a simple-framebuffer.0 device registered:

    sysfs: cannot create duplicate filename '/bus/platform/devices/simple-framebuffer.0'
    ...
    coreboot: could not register framebuffer
    framebuffer coreboot8: probe with driver framebuffer failed with error -17

To prevent the issue, make the framebuffer_core driver to disable sysfb
if there is system framebuffer data in the Coreboot table. That way only
this driver will register a device and sysfb would not attempt to do it
(or remove its registered device if was already executed before).

Reported-by: Brian Norris <briannorris@chromium.org>
Link: https://lore.kernel.org/all/ZuCG-DggNThuF4pj@b20ea791c01f/T/#ma7fb65acbc1a56042258adac910992bb225a20d2
Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/firmware/google/framebuffer-coreboot.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/firmware/google/framebuffer-coreboot.c b/drivers/firmware/google/framebuffer-coreboot.c
index daadd71d8ddd..0a28aa5b17dc 100644
--- a/drivers/firmware/google/framebuffer-coreboot.c
+++ b/drivers/firmware/google/framebuffer-coreboot.c
@@ -61,6 +61,19 @@ static int framebuffer_probe(struct coreboot_device *dev)
 	if (res.end <= res.start)
 		return -EINVAL;
 
+	/*
+	 * Since a "simple-framebuffer" device is already added
+	 * here, disable the Generic System Framebuffers (sysfb)
+	 * to prevent it from registering another device for the
+	 * system framebuffer later (e.g: using the screen_info
+	 * data that may had been filled as well).
+	 *
+	 * This can happen for example on Coreboot systems, that
+	 * advertise a LB_TAG_FRAMEBUFFER entry in their Coreboot
+	 * table and also a VESA mode by the BIOS used as payload.
+	 */
+	sysfb_disable();
+
 	pdev = platform_device_register_resndata(&dev->dev,
 						 "simple-framebuffer", 0,
 						 &res, 1, &pdata,
-- 
 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

