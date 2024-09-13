Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F2FA9788AF
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2024 21:14:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF3B410ED7E;
	Fri, 13 Sep 2024 19:14:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="gn8OnToN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06BE710ED7E
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 19:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1726254876;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=kEDaZq1JvqwS7B5a6C/b79xspKvNtOtKMLXgoPqkWiU=;
 b=gn8OnToNjz4Pg7jXMn6YFiD2+exz+iT56wTI1/3KMVy2WJ7fBg/jD6U2U1dc5AqJt/ty5i
 IejIdaqd3LmfQSJdUMjCtaMtlY6QBr8aCgBkuFu9Dz4qNRtvgy7r4uGq9D7MLe23U9GIuk
 Qb7Ft8lN6kZFXOQpB2BQYKM2WYvpHSs=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-663-vmzeetMNPByzxIWiYV0UtA-1; Fri, 13 Sep 2024 15:14:34 -0400
X-MC-Unique: vmzeetMNPByzxIWiYV0UtA-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-42cb0b0514bso19183105e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 12:14:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726254873; x=1726859673;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kEDaZq1JvqwS7B5a6C/b79xspKvNtOtKMLXgoPqkWiU=;
 b=pKMKmXWyhPtEZiM5tUiZ13Bg27LQQAhA4jCI1F0IPe1mOZ0UWe/KFhKlyR8NS+e1Qa
 DMivSGwa4iX/mZUXv7iIHriIQvz+trM/6A3S/uGc9gAtK8vSK0KXKXQLGXcwDMSjfPiH
 MdHPR2KUFWn/AbNhoMfDaseRbgmPU8uVhbCnY7Pz3obHMN5PHrxrXYe0FIphcaKYdkEW
 TpukU7lNhIUQfTWHAd6BAOqf8PgzNBKdtPH8pnvu297r/lSQfQRGWihodKwIK8rJT9GL
 iXHiMIsAKcS2KhWVEQU1AbsPYgIBwWELQ7AFohZP1l+srnCz0ePZL7KqCqdZhyKIkT0E
 m3CQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXNq5XbO5O90gOPH5jhL4SLGO8GAB7udqMGKt1693fk7qdtZBi6dt823oHvrZ9QFA8bhDX3v71telc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxq+bQIKJQX8LM1YSV9k9qjDlu7aHoAVKSSpVJrNzr1byK1O7yE
 gz8kfgG6XJI0+7kwFhdFZS3mN7PP2sbo278KiYVWRFvMu0yDuAc9zQhAQDWF09wgCYrNO2jLBfc
 0BdI404xke8p5abtjIMMjMMu/2sNnJPMJiYqTqw/+6O6781QySiboH7b6H8xpiNoiBQ==
X-Received: by 2002:a05:600c:3514:b0:42c:df67:1d35 with SMTP id
 5b1f17b1804b1-42cdf671f9emr58878255e9.1.1726254873459; 
 Fri, 13 Sep 2024 12:14:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEv6ZqQqprM8k1B6dy7IN1qr0vv0mBK5M/OuTZw60w5IV+Msv048q6Y8MOMeLK+vWaPrKuugg==
X-Received: by 2002:a05:600c:3514:b0:42c:df67:1d35 with SMTP id
 5b1f17b1804b1-42cdf671f9emr58878005e9.1.1726254872862; 
 Fri, 13 Sep 2024 12:14:32 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42da22b8b49sm380015e9.2.2024.09.13.12.14.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Sep 2024 12:14:32 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: chrome-platform@lists.linux.dev, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Hugues Bruant <hugues.bruant@gmail.com>,
 Julius Werner <jwerner@chromium.org>,
 Brian Norris <briannorris@chromium.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Borislav Petkov <bp@alien8.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Tzung-Bi Shih <tzungbi@kernel.org>
Subject: [PATCH v2] firmware: coreboot: Don't register a pdev if screen_info
 data is present
Date: Fri, 13 Sep 2024 21:13:59 +0200
Message-ID: <20240913191428.1539653-1-javierm@redhat.com>
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

On Coreboot platforms, a system framebuffer may be provided to the Linux
kernel by filling a LB_TAG_FRAMEBUFFER entry in the Coreboot table. But
a Coreboot payload (e.g: SeaBIOS) could also provide its own framebuffer
information to the Linux kernel.

If that's the case, arch x86 boot code will fill the global screen_info
data and this used by the Generic System Framebuffers (sysfb) framework,
to register a platform device with pdata about the system's framebuffer.

But later, the framebuffer_coreboot driver will try to do the same and
attempt to register a "simple-framebuffer" platform device (using the
information from the Coreboot table), which will lead to an error due a
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
---

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
index daadd71d8ddd..49eeb13814e4 100644
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
+	 * On Coreboot systems, the advertised LB_TAG_FRAMEBUFFER entry
+	 * in the Coreboot table should only be used if the payload did
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

