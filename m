Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 448AB7E8F81
	for <lists+dri-devel@lfdr.de>; Sun, 12 Nov 2023 11:36:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78E2110E080;
	Sun, 12 Nov 2023 10:36:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEE0710E080
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Nov 2023 10:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1699785361;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pn7WPKM4HtnK2cvNB6bMbh+1lkVgXkcNqa52GuSQ+IE=;
 b=cDgkyUEqYJGDA3Rs69DlUDLSDI/qDJgLiyp0t08MnB654bvlqlmcNKwHCyNCMOuTrBs2Tv
 sNsfbOvUZVh2ILHZ8XmO8awupUnIl4fCYrRgpqAWaBxIV9oAq5C+zyrvl0WLCXZaw2FbZL
 mDS/0S3/TrT9Rs+rxSjlOJadTvBmOdU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-218-jMKxxyItNoSWX7aMlU6xmw-1; Sun, 12 Nov 2023 05:35:59 -0500
X-MC-Unique: jMKxxyItNoSWX7aMlU6xmw-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-4083717431eso24264355e9.1
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Nov 2023 02:35:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699785358; x=1700390158;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pn7WPKM4HtnK2cvNB6bMbh+1lkVgXkcNqa52GuSQ+IE=;
 b=i3iBIMULgVm13+TI/PjPBeL/SE+rhkNsOvoOlLZojgL8qczciin/QA6bb/dFGne1wA
 yMjRmAzHOHwnH2vAQ/R2rVUUy3P9pSZ/EZdRtZrvpBFwOpYYmf+LLq6LSDx786+KMzUQ
 osH3K+L3sH3ZB3uvK+jAtnSl6BgZIx5fFqt89ga7y0DeTay6eNbCMwr9YBSRy8TdQGJS
 cOpAPzUObdrMlHkSMsrYwGAi1m55VZib8Hut66mURJaWglCrRTEmc5Sp9jc27VUnBHLt
 tjHJJvLGuDNoN131cjbX4t9Jn720yJsZWpVegGCeT1kBzNq/5JvyBwIea0TFMMInOhKI
 rqmA==
X-Gm-Message-State: AOJu0YzEgKAlzCB86G6YpbLVCIOtHlG3w/OGRQx2A859JWXL9NZYBNqu
 G0QT/EeR57/+X0/S9SyOWCBjk7M8PeYN+3lq0bPN0O8sCY0rDi8xY1XQX4lWKrulogRClNWHWia
 VCRgfTMsMJEqqYsx4vz54EXl5ugZb
X-Received: by 2002:a05:600c:4755:b0:406:84a0:bc87 with SMTP id
 w21-20020a05600c475500b0040684a0bc87mr2815687wmo.15.1699785358667; 
 Sun, 12 Nov 2023 02:35:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEFh3vCs8LSPnTUNj+YttAQdNRqf7lb0ez3l+bzndSoh3Pzgn80bfEVm/QX/8F27nAigheJFg==
X-Received: by 2002:a05:600c:4755:b0:406:84a0:bc87 with SMTP id
 w21-20020a05600c475500b0040684a0bc87mr2815674wmo.15.1699785358221; 
 Sun, 12 Nov 2023 02:35:58 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 bd13-20020a05600c1f0d00b004065daba6casm10553641wmb.46.2023.11.12.02.35.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Nov 2023 02:35:57 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Andrew Worsley <amworsley@gmail.com>
Subject: Re: [PATCH] Fix failure of simpledrm probe when trying to grab FB
 from the EFI-based Framebuffer
In-Reply-To: <CA+Y=x3nift8Xt_zT1na7D3ReRwy6Lh66Cszz9zkBpkz7tka20w@mail.gmail.com>
References: <20231111042926.52990-1-amworsley@gmail.com>
 <20231111042926.52990-2-amworsley@gmail.com>
 <CA+Y=x3mF4jFX7PiJQ-1Gk9zyBE1mwZaF_GLYjSspT+mxtMn4GQ@mail.gmail.com>
 <87cywgac4r.fsf@minerva.mail-host-address-is-not-set>
 <CA+Y=x3nift8Xt_zT1na7D3ReRwy6Lh66Cszz9zkBpkz7tka20w@mail.gmail.com>
Date: Sun, 12 Nov 2023 11:35:56 +0100
Message-ID: <87a5rj9s37.fsf@minerva.mail-host-address-is-not-set>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 open list <linux-kernel@vger.kernel.org>, "open
 list:DRM DRIVER FOR FIRMWARE FRAMEBUFFERS" <dri-devel@lists.freedesktop.org>,
 Maxime Ripard <mripard@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Andrew Worsley <amworsley@gmail.com> writes:

Hello Andrew,

> On Sat, 11 Nov 2023 at 20:10, Javier Martinez Canillas
> <javierm@redhat.com> wrote:
>>
> ....
>> > On Sat, 11 Nov 2023 at 15:30, Andrew Worsley <amworsley@gmail.com> wrote:
>> >>
>> >>    The simpledrm.c does not call aperture_remove_conflicting_devices() in it's probe
>> >>    function as the drivers/video/aperture.c documentation says it should. Consequently
>> >>    it's request for the FB memory fails.
>> >>
>>
>> The current behaviour is correct since aperture_remove_conflicting_devices()
>> is for native drivers to remove simple framebuffer devices such as simpledrm,
>> simplefb, efifb, etc.
>
> The efifb is the driver that has "grabbed" the FB earlier
>
> Here's a debug output with a dump_stack() call in the devm_aperture_acquire()
> % grep --color -A14 -B4 devm_aperture_acquire ~/dmesg2.txt
> [    0.055752] efifb: framebuffer at 0xbd58dc000, using 16000k, total 16000k
> [    0.055755] efifb: mode is 2560x1600x32, linelength=10240, pages=1
> [    0.055758] efifb: scrolling: redraw
> [    0.055759] efifb: Truecolor: size=2:10:10:10, shift=30:20:10:0
> [    0.055771] devm_aperture_acquire: dump stack for debugging
> [    0.055775] CPU: 2 PID: 1 Comm: swapper/0 Tainted: G S

I see. This is the problem then. Your platform then is using a Device Tree
that contains a "simple-framebuffer" node but also doing a UEFI boot and
providing an EFI GOP table that is picked by the Linux EFI stub on boot.

[...]

>>
>> >> ...
>> >> [    3.085302] simple-framebuffer bd58dc000.framebuffer: [drm] *ERROR* could not acquire memory range [??? 0xffff6e1d8629d580-0x2a5000001a7 flags 0x0]: -16
>> >> [    3.086433] simple-framebuffer: probe of bd58dc000.framebuffer failed with error -16
>> >> ...
>> >>
>>
>> This is -EBUSY. What is your kernel configuration? Can you share it please.
>
> Attached - hope that's acceptable...
>
>

Thanks a lot for providing this. It was very helpful to understand the issue.

[...]

>>
>> I would rather try to understand what is going on in your setup and why
>> the acquire is returning -EBUSY.
>>
>
> Ok - thanks - let me know where to go from here.
>

I think that what we should do instead is to prevent both the EFI GOP and
"simple-framebuffer" to provide a system framebuffer information and the
kernel to register two devices (a "simple-framebuffer" by the OF core and
an "efi-framebuffer" by the sysfb infrastructure).

In my opinion, the DTB is the best source of truth on an DT platform and
so is the sysfb that should be disabled if there's a "simple-framebuffer"
DT node found.

Can you please try the following (untested) patch?

From 7bf4a7917962c24c9f15aaf6e798db9d652c6806 Mon Sep 17 00:00:00 2001
From: Javier Martinez Canillas <javierm@redhat.com>
Date: Sun, 12 Nov 2023 11:06:22 +0100
Subject: [PATCH] of/platform: Disable sysfb if a simple-framebuffer node is
 found

Some DT platforms use EFI to boot and in this case the EFI Boot Services
may register a EFI_GRAPHICS_OUTPUT_PROTOCOL handle, that will later be
queried by the Linux EFI stub to fill the global struct screen_info data.

The data is used by the Generic System Framebuffers (sysfb) framework to
add a platform device with platform data about the system framebuffer.

But if there is a "simple-framebuffer" node in the DT, the OF core will
also do the same and add another device for the system framebuffer.

This could lead for example, to two platform devices ("simple-framebuffer"
and "efi-framebuffer") to be added and matched with their corresponding
drivers. So both efifb and simpledrm will be probed, leading to following:

[    0.055752] efifb: framebuffer at 0xbd58dc000, using 16000k, total 16000k
[    0.055755] efifb: mode is 2560x1600x32, linelength=10240, pages=1
[    0.055758] efifb: scrolling: redraw
[    0.055759] efifb: Truecolor: size=2:10:10:10, shift=30:20:10:0
...
[    3.295896] simple-framebuffer bd58dc000.framebuffer: [drm] *ERROR*
could not acquire memory range [??? 0xffff79f30a29ee40-0x2a5000001a7
flags 0x0]: -16
[    3.298018] simple-framebuffer: probe of bd58dc000.framebuffer
failed with error -16

To prevent the issue, make the OF core to disable sysfb if there is a node
with a "simple-framebuffer" compatible. That way only this device will be
registered and sysfb would not attempt to register another one using the
screen_info data even if this has been filled.

Reported-by: Andrew Worsley <amworsley@gmail.com>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/of/platform.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/of/platform.c b/drivers/of/platform.c
index f235ab55b91e..a9fd91e6a6df 100644
--- a/drivers/of/platform.c
+++ b/drivers/of/platform.c
@@ -621,8 +621,21 @@ static int __init of_platform_default_populate_init(void)
 		}
 
 		node = of_get_compatible_child(of_chosen, "simple-framebuffer");
-		of_platform_device_create(node, NULL, NULL);
-		of_node_put(node);
+		if (node) {
+			/*
+			 * Since a "simple-framebuffer" device is already added
+			 * here, disable the Generic System Framebuffers (sysfb)
+			 * to prevent it from registering another device for the
+			 * system framebuffer later (e.g: using the screen_info
+			 * data that may had been filled as well).
+			 *
+			 * This can happen for example on DT systems that do EFI
+			 * booting and may provide a GOP table to the EFI stub.
+			 */
+			sysfb_disable();
+			of_platform_device_create(node, NULL, NULL);
+			of_node_put(node);
+		}
 
 		/* Populate everything else. */
 		of_platform_default_populate(NULL, NULL, NULL);
-- 
2.41.0

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

