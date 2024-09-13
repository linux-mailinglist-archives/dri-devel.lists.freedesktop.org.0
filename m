Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56232978AA0
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2024 23:33:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C28B10EDB5;
	Fri, 13 Sep 2024 21:32:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="iCf/dYCo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8657E10EDB5
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 21:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1726263176;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=zq/XGfhuxnu2xqsl1VfuSOlwQfCDeWHk07eSBLjaxgY=;
 b=iCf/dYCoIjcWgy/Q8hHGRXYp6P17suRj3qHBl8g9M0WEgeFCEcuSnAcEbcKxFIjGHT44HC
 dO1QQ13geCGKZhciRZAZtv9PiT5zyaRW2OlYZZtfrA1D28VGfVcjYcSKbQcNbWmBZkjkvV
 MFm0az08Y6iv1758zobmTCLzFC6jTIQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-45-zpGIT0ddNVaeGVWbtw0i8Q-1; Fri, 13 Sep 2024 17:32:53 -0400
X-MC-Unique: zpGIT0ddNVaeGVWbtw0i8Q-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-378ab5b74e1so681984f8f.3
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 14:32:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726263172; x=1726867972;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zq/XGfhuxnu2xqsl1VfuSOlwQfCDeWHk07eSBLjaxgY=;
 b=Gg7kh6EQAwQMWE0qi166e+b7a89kFSyZgEAlyGrIYRNVdNJSeTuK0cydzfUAldgiO0
 sCLS1HLa1rZ9h8OyLyFlt58VvpymUzcDQU8U4zQWJw/BEUeETKYMoNUc5CeeLv9FyOjo
 b30zfZm08mxbvEDFBBfHW9kE2p8TdfyhUYxPnU4LFvArKg9y8ceXYy8jFR5Ux/O52vJ5
 HxdBHJ7LgoFiQ8KBQsz3DriUEHpghDI2XY0TjUWmBgYcmHgNnV0IxRRsTB0wRhj+plWY
 LyiZx4JnX1oQ0kHJpf9JvFxdXVLY4ZXJwsXm577QxEvFGRVtADQNlwiBBKg4NjhwZ3WC
 FwsA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWE9vH0+C6t3T7LENNUPpIonPwuyJQocn/fNU7IJpw1/qmTs0t+PoJwDIzL644wVDOCMK2yV5C9GdU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw5NGftAhFGmx7NCSpN5eoFcMLx22eaM/DSVzV/gJvMHmDWHgGG
 keCfRMP+Nwij+Omei92l6ibKx4aa5xCw9UQamTmaI/zEekr0vsGE1Jryr0XgoOUgvEa/aq1T5/z
 CetN/HVPO5Zh+mUFErGbU7zzir6biAaQLHNO3wvFcdrW/043fdOfRvXjMHNt9Oq0OIA==
X-Received: by 2002:a5d:4388:0:b0:368:5b0c:7d34 with SMTP id
 ffacd0b85a97d-378d61e2c14mr2554800f8f.22.1726263172214; 
 Fri, 13 Sep 2024 14:32:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFEyVfX5FD6HqnGhKNhramC2RAHdl6F32DVAZO0vkVjMaGBuk7aa+lbQRZkWnexB34MoaO9XQ==
X-Received: by 2002:a5d:4388:0:b0:368:5b0c:7d34 with SMTP id
 ffacd0b85a97d-378d61e2c14mr2554779f8f.22.1726263171717; 
 Fri, 13 Sep 2024 14:32:51 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42cc01a8ee7sm142234035e9.0.2024.09.13.14.32.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Sep 2024 14:32:51 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Julius Werner <jwerner@chromium.org>,
 Hugues Bruant <hugues.bruant@gmail.com>, intel-gfx@lists.freedesktop.org,
 Brian Norris <briannorris@chromium.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 Borislav Petkov <bp@alien8.de>, chrome-platform@lists.linux.dev,
 Javier Martinez Canillas <javierm@redhat.com>,
 Tzung-Bi Shih <tzungbi@kernel.org>
Subject: [PATCH v3] firmware: coreboot: Don't register a pdev if screen_info
 data is present
Date: Fri, 13 Sep 2024 23:32:29 +0200
Message-ID: <20240913213246.1549213-1-javierm@redhat.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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

On coreboot platforms, a system framebuffer may be provided to the Linux
kernel by filling a LB_TAG_FRAMEBUFFER entry in the coreboot table. But
a coreboot payload (e.g: SeaBIOS) could also provide its own framebuffer
information to the Linux kernel.

If that's the case, arch x86 boot code will fill the global screen_info
data and this used by the Generic System Framebuffers (sysfb) framework,
to register a platform device with pdata about the system's framebuffer.

But later, the framebuffer_coreboot driver will try to do the same and
attempt to register a "simple-framebuffer" platform device (using the
information from the coreboot table), which will lead to an error due a
device with the same name already being registered:

    sysfs: cannot create duplicate filename '/bus/platform/devices/simple-framebuffer.0'
    ...
    coreboot: could not register framebuffer
    framebuffer coreboot8: probe with driver framebuffer failed with error -17

To prevent this issue, make the framebuffer_core driver to not register
a platform device if the global struct screen_info data has been filled.

Reported-by: Brian Norris <briannorris@chromium.org>
Closes: https://lore.kernel.org/all/ZuCG-DggNThuF4pj@b20ea791c01f/T/#ma7fb65acbc1a56042258adac910992bb225a20d2
Suggested-by: Julius Werner <jwerner@chromium.org>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Brian Norris <briannorris@chromium.org>
Reviewed-by: Julius Werner <jwerner@chromium.org>
---

Changes in v3:
- Fix coreboot spelling to be all in lowercase (Julius Werner).

Changes in v2:
- Declare the struct screen_info as constant variable (Thomas Zimmermann).
- Use screen_info_video_type() instead of checking the screen_info video
  types directly (Thomas Zimmermann).
- Fix missing "device" word in a comment (Brian Norris).
- Fix some mispellings in a comment (Brian Norris).
- Change error code returned from -EINVAL to -ENODEV (Brian Norris).

 drivers/firmware/google/framebuffer-coreboot.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/firmware/google/framebuffer-coreboot.c b/drivers/firmware/google/framebuffer-coreboot.c
index daadd71d8ddd..f722292e7684 100644
--- a/drivers/firmware/google/framebuffer-coreboot.c
+++ b/drivers/firmware/google/framebuffer-coreboot.c
@@ -15,6 +15,7 @@
 #include <linux/module.h>
 #include <linux/platform_data/simplefb.h>
 #include <linux/platform_device.h>
+#include <linux/screen_info.h>
 
 #include "coreboot_table.h"
 
@@ -27,8 +28,10 @@ static int framebuffer_probe(struct coreboot_device *dev)
 	int i;
 	u32 length;
 	struct lb_framebuffer *fb = &dev->framebuffer;
+	const struct screen_info *si = &screen_info;
 	struct platform_device *pdev;
 	struct resource res;
+	unsigned int type;
 	struct simplefb_platform_data pdata = {
 		.width = fb->x_resolution,
 		.height = fb->y_resolution,
@@ -36,6 +39,20 @@ static int framebuffer_probe(struct coreboot_device *dev)
 		.format = NULL,
 	};
 
+	/*
+	 * On coreboot systems, the advertised LB_TAG_FRAMEBUFFER entry
+	 * in the coreboot table should only be used if the payload did
+	 * not pass a framebuffer information to the Linux kernel.
+	 *
+	 * If the global screen_info data has been filled, the Generic
+	 * System Framebuffers (sysfb) will already register a platform
+	 * device and pass that screen_info as platform_data to a driver
+	 * that can scan-out using the system provided framebuffer.
+	 */
+	type = screen_info_video_type(si);
+	if (type)
+		return -ENODEV;
+
 	if (!fb->physical_address)
 		return -ENODEV;
 
-- 
2.46.0

