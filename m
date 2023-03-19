Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F59A6C031E
	for <lists+dri-devel@lfdr.de>; Sun, 19 Mar 2023 17:32:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 923E710E0F5;
	Sun, 19 Mar 2023 16:32:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com
 [209.85.166.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6060910E0F5
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Mar 2023 16:32:48 +0000 (UTC)
Received: by mail-il1-f178.google.com with SMTP id r4so5397017ilt.8
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Mar 2023 09:32:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679243567;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rE9pu/DRfAdXm95rr3VepAwA/+9JYYjjkqTbdSZh0/k=;
 b=qYXA4udGj3PLconKcxjOHbTgEVlcXZsCHNmCeMgVKvx4NxBkc4iYVrzn7b4Q1td1GE
 HkfQon44axmPRGLUXawFwIG2aUIPPQQGltb2HN8SXofZh+zOrTyx8KkpqNJWUNwFyHd7
 RzGGEq4oVK/vQSOUXBfTTFfgEuF4Qz3jd5QAwxHvG4NhE6HQYdm+BLEKwlR+v/ZZ3J/C
 dzIsL8nduFZV/tupuX7XoNI881uSbq1OStyEXj019Ndvo8AzvBs0uEdn0ABzMh94xiy+
 0dbQFZ/rLzZJl6jengj+oMsijhzZyGmYA98l/iOx4KyitilmkR9Revwae/J3PCZOP1W9
 jXGQ==
X-Gm-Message-State: AO0yUKUyS0n26O0XOJ1SEKwtjadcil8ZExisIzrAlwZWmJPspjRqRkIZ
 V83YRvHGonYYYvN+p7R/69ecwlhq8Q==
X-Google-Smtp-Source: AK7set8TmV5UVPTkReQlgL09w24MdyyWUQneS0fdD4520jOIVQTiqM8e0NB/f35ify8j+9IAH9zL9A==
X-Received: by 2002:a92:ce50:0:b0:31a:1554:b0a with SMTP id
 a16-20020a92ce50000000b0031a15540b0amr3905365ilr.10.1679243567618; 
 Sun, 19 Mar 2023 09:32:47 -0700 (PDT)
Received: from robh_at_kernel.org ([2605:ef80:80c7:2689:137d:d795:47e4:3de1])
 by smtp.gmail.com with ESMTPSA id
 n18-20020a922612000000b00316dc3afe57sm2150373ile.86.2023.03.19.09.32.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Mar 2023 09:32:47 -0700 (PDT)
Received: (nullmailer pid 227058 invoked by uid 1000);
 Sun, 19 Mar 2023 16:32:44 -0000
From: Rob Herring <robh@kernel.org>
To: Russell King <linux@armlinux.org.uk>, Helge Deller <deller@gmx.de>
Subject: [PATCH] video: ARM CLCD: Use of_address_to_resource()
Date: Sun, 19 Mar 2023 11:32:41 -0500
Message-Id: <20230319163241.226984-1-robh@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Replace of_get_address() and of_translate_address() with single call
to of_address_to_resource(). With this, use ioremap() instead of
of_iomap() which would parse "reg" a second time.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/video/fbdev/amba-clcd.c | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/drivers/video/fbdev/amba-clcd.c b/drivers/video/fbdev/amba-clcd.c
index f65c96d1394d..1289bfe6e872 100644
--- a/drivers/video/fbdev/amba-clcd.c
+++ b/drivers/video/fbdev/amba-clcd.c
@@ -759,7 +759,7 @@ static int clcdfb_of_vram_setup(struct clcd_fb *fb)
 {
 	int err;
 	struct device_node *memory;
-	u64 size;
+	struct resource res;
 
 	err = clcdfb_of_init_display(fb);
 	if (err)
@@ -769,18 +769,20 @@ static int clcdfb_of_vram_setup(struct clcd_fb *fb)
 	if (!memory)
 		return -ENODEV;
 
-	fb->fb.screen_base = of_iomap(memory, 0);
-	if (!fb->fb.screen_base) {
-		of_node_put(memory);
-		return -ENOMEM;
-	}
 
-	fb->fb.fix.smem_start = of_translate_address(memory,
-			of_get_address(memory, 0, &size, NULL));
-	fb->fb.fix.smem_len = size;
-	of_node_put(memory);
+	err = of_address_to_resource(memory, 0, &res);
+	if (err)
+		goto out;
 
-	return 0;
+	fb->fb.screen_base = ioremap(res.start, resource_size(&res));
+	if (!fb->fb.screen_base)
+		goto out;
+
+	fb->fb.fix.smem_start = res.start;
+	fb->fb.fix.smem_len = resource_size(&res);
+out:
+	of_node_put(memory);
+	return err;
 }
 
 static int clcdfb_of_vram_mmap(struct clcd_fb *fb, struct vm_area_struct *vma)
-- 
2.39.2

