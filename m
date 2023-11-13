Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E7F77E9818
	for <lists+dri-devel@lfdr.de>; Mon, 13 Nov 2023 09:53:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1111310E166;
	Mon, 13 Nov 2023 08:53:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1FEA10E16B
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Nov 2023 08:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1699865612;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=cNzwUiFENrfxS16AlOPS5/AIJUox4EDd0wo9fGfe2EM=;
 b=AT2L3ZIwngRTH25fmVxgi/GxZCI+Pd/N1vYp4LaQ1xqdx0cUsJCP1KRUA5FQ4FVmHtlnqR
 gIzk8yibSYEP8vHnLljQu6MMl71w2id3wnrcoFG5m8EPgH2+emho8sPfnqlvuZOuf8BUwV
 IKz3ErM74XoJZUPt+3+5tETNVLHOMyw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-615-BG-7XssHP1KjN_hXAJegeQ-1; Mon, 13 Nov 2023 03:53:30 -0500
X-MC-Unique: BG-7XssHP1KjN_hXAJegeQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-408695c377dso27120775e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Nov 2023 00:53:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699865609; x=1700470409;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cNzwUiFENrfxS16AlOPS5/AIJUox4EDd0wo9fGfe2EM=;
 b=pfIgQZoKwKjHi2LpEkUZyY3ijrwUszmSP/to8M5TXjQJ02IrJ3f2ASNyGeGaZo+UWH
 6xN8zXoIHe5P/DAQzVGBz29wu5EwN0oJ4S3keIfbb8OcBNX/Q4cMztpjlBTNAw3V9F92
 8fJ6+aSfmvtU1ADsHxjMdG/b9dShGmsP13QKwqeaTm5ea+PfR5Er//mgl2B8Z1Ohz1fZ
 JGazOga6G6elap1j9XwU3eGsdVxODiOjULlqkAtg5JmPG1oBIzN4V6AKlzb8/SsexWMo
 sol5C1yqIgGrhEg59XJpWGONAacfa2XWsYrlBDGX2pyO8DKrBnfNMT+AtMRxsEgO7OmW
 /kKA==
X-Gm-Message-State: AOJu0YwbDcHAmz3bNQFp/1fo61v3nUO/6DQn7g3hPm+iMCHDYokG5w4v
 xreSzOIjEaushP3/mL4pXDsioD9wsS/LyKDgEXitQ7AtjAw9PExSq/NLZIpJGfRRmMsIbrdCG/R
 8OAoOFG1gU7cqq0b5utuP4QxGlA8o
X-Received: by 2002:a05:600c:198a:b0:409:7aa9:e0b with SMTP id
 t10-20020a05600c198a00b004097aa90e0bmr4828727wmq.32.1699865609482; 
 Mon, 13 Nov 2023 00:53:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGtyLOgcwZL+AdrLG958gidU7i+Mgqcg5fd8WDulVArdFeC6hjxYHKLm20rhC7ry8KWaggNrg==
X-Received: by 2002:a05:600c:198a:b0:409:7aa9:e0b with SMTP id
 t10-20020a05600c198a00b004097aa90e0bmr4828715wmq.32.1699865609141; 
 Mon, 13 Nov 2023 00:53:29 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 j10-20020a05600c300a00b0040773c69fc0sm12890382wmh.11.2023.11.13.00.53.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Nov 2023 00:53:28 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [RFC PATCH] of/platform: Disable sysfb if a simple-framebuffer node
 is found
Date: Mon, 13 Nov 2023 09:51:41 +0100
Message-ID: <20231113085305.1823455-1-javierm@redhat.com>
X-Mailer: git-send-email 2.41.0
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
Cc: Sergio Lopez <slp@redhat.com>, devicetree@vger.kernel.org,
 Sima Vetter <daniel.vetter@ffwll.ch>, Hector Martin <marcan@marcan.st>,
 Andrew Worsley <amworsley@gmail.com>, dri-devel@lists.freedesktop.org,
 Javier Martinez Canillas <javierm@redhat.com>,
 Rob Herring <robh+dt@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Frank Rowand <frowand.list@gmail.com>, Ard Biesheuvel <ardb@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

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

This seems the correct thing to do in this case because:

a) On a DT platform, the DTB is the single source of truth since is what
   describes the hardware topology. Even if EFI Boot Services are used to
   boot the machine.

b) The of_platform_default_populate_init() function is called in the
   arch_initcall_sync() initcall level while the sysfb_init() function
   is called later in the subsys_initcall() initcall level.

Reported-by: Andrew Worsley <amworsley@gmail.com>
Closes: https://lore.kernel.org/all/20231111042926.52990-2-amworsley@gmail.com
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

 drivers/of/platform.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/of/platform.c b/drivers/of/platform.c
index f235ab55b91e..0a692fdfef59 100644
--- a/drivers/of/platform.c
+++ b/drivers/of/platform.c
@@ -20,6 +20,7 @@
 #include <linux/of_irq.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
+#include <linux/sysfb.h>
 
 #include "of_private.h"
 
@@ -621,8 +622,21 @@ static int __init of_platform_default_populate_init(void)
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
+			 * booting and may provide a GOP handle to the EFI stub.
+			 */
+			sysfb_disable();
+			of_platform_device_create(node, NULL, NULL);
+			of_node_put(node);
+		}
 
 		/* Populate everything else. */
 		of_platform_default_populate(NULL, NULL, NULL);
-- 
2.41.0

