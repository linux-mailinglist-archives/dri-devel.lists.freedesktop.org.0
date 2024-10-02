Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F9E598EA76
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 09:37:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2D6F10E7BE;
	Thu,  3 Oct 2024 07:37:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="bUniXL0R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
 [209.85.208.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFC8310E10E
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Oct 2024 21:45:50 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id
 4fb4d7f45d1cf-5c883459b19so175800a12.2
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Oct 2024 14:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727905549; x=1728510349; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=TpAVWbf3/lT0CKVerCtL5WEmBdJkY5+gMWEwEveY7JI=;
 b=bUniXL0Rr4OiVVDk4Y4PVbUOrzkh+7aEU8fRccDv2vWBC4ZVI8WttjwQ1Yx2n5pZTb
 xYgwNIDm0Ct70XzMhpI7NnIixd09inbWVx4s6u8yMU1BevGdYDYgPTS20xrH2pkshn1v
 JyP47ZSQg2Hl04HvjDX6PLG+JWDH9kF+/VV+O//YqkXQ0+9dmTF91Tk62CPetditbrVs
 aSb87h/Pc+0U7Bj5wLW42KcL4OWKrhpSBb6pvjL6afsNlHBAH+CQITh4fRufwqF7Hfjx
 5mIJtlL+U1nWq3jRG5Qb/wzfEYIJZLJ4dyLz6u5zlxQ2qiX2VUxjcRMa2ArMAUGWQXjt
 PFWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727905549; x=1728510349;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TpAVWbf3/lT0CKVerCtL5WEmBdJkY5+gMWEwEveY7JI=;
 b=I0cC8bvrpoqYtl2c4n45ni/t2FjWvbzR2Z2xqv/bp5bmQfCbMfsUlNxmDkKRv2pUr4
 IjckCqM8gMJwYNvmciyoj/XEuYXuoqEHWUn4lLTMzaYpdxatGIRIwMuj2iUF6tYWZvtM
 8SgfL2JkUiN9jsL2JFvlguFHX/mN/WIQmr5G8EPMGdCoG0izhb3K8SdFwCGmetV8V6+T
 6Wz2hxIwaKCDkV4vUVnK7SpF0b+Tukqn5caTvhSSb423iaxLPJKYKqKSJnN0QvrSv6BO
 YEvB9rfpw7K5+WF/OU8g0S4p1afqKRAfGqAvL/m+VbEFbbZOFwghYu/1g8N8y0Qud5T9
 esLg==
X-Gm-Message-State: AOJu0Yy8z21bYFK2aSwqi4wNoD00yUHIjsJIlauca9G/KsJ9YE1gFYif
 2aw3U9DFQUU2GJ9f6ePCratyq+KqZDotHMOV2pMOheGVF0oaocdZ
X-Google-Smtp-Source: AGHT+IEW4do9mEryEFFcJLi2oiNfrekou4nnddOfqmVNu1oFKsPf/Ce6bVcEm9stBqwE+CF+wPk0Iw==
X-Received: by 2002:a05:6402:2691:b0:5c8:a0b1:b60 with SMTP id
 4fb4d7f45d1cf-5c8b18e4467mr3091612a12.4.1727905548536; 
 Wed, 02 Oct 2024 14:45:48 -0700 (PDT)
Received: from localhost.localdomain ([83.165.96.99])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c88b189878sm6548101a12.93.2024.10.02.14.45.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Oct 2024 14:45:46 -0700 (PDT)
From: Gonzalo Silvalde Blanco <gonzalo.silvalde@gmail.com>
To: linux-fbdev@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, thomas.zimmermann@suse.de,
 Gonzalo Silvalde Blanco <gonzalo.silvalde@gmail.com>
Subject: [PATCH] Subject: fbdev: sstfb: Make CONFIG_FB_DEVICE optional
Date: Wed,  2 Oct 2024 23:45:16 +0200
Message-Id: <20241002214517.206657-1-gonzalo.silvalde@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 03 Oct 2024 07:37:11 +0000
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

The sstfb driver currently depends on CONFIG_FB_DEVICE to create sysfs
entries and access info->dev. This patch wraps the relevant code blocks
with #ifdef CONFIG_FB_DEVICE, allowing the driver to be built and used
even if CONFIG_FB_DEVICE is not selected.

Tested by building with and without CONFIG_FB_DEVICE, both of which
compile without issues
Signed-off-by: Gonzalo Silvalde Blanco <gonzalo.silvalde@gmail.com>
---
 drivers/video/fbdev/sstfb.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/video/fbdev/sstfb.c b/drivers/video/fbdev/sstfb.c
index f8ae54ca0cc3..17f39cc721aa 100644
--- a/drivers/video/fbdev/sstfb.c
+++ b/drivers/video/fbdev/sstfb.c
@@ -716,6 +716,7 @@ static void sstfb_setvgapass( struct fb_info *info, int enable )
 	pci_write_config_dword(sst_dev, PCI_INIT_ENABLE, tmp);
 }
 
+#ifdef CONFIG_FB_DEVICE
 static ssize_t store_vgapass(struct device *device, struct device_attribute *attr,
 			const char *buf, size_t count)
 {
@@ -736,10 +737,10 @@ static ssize_t show_vgapass(struct device *device, struct device_attribute *attr
 	struct sstfb_par *par = info->par;
 	return sprintf(buf, "%d\n", par->vgapass);
 }
-
 static struct device_attribute device_attrs[] = {
 	__ATTR(vgapass, S_IRUGO|S_IWUSR, show_vgapass, store_vgapass)
 	};
+#endif
 
 static int sstfb_ioctl(struct fb_info *info, unsigned int cmd,
 			unsigned long arg)
@@ -1435,10 +1436,10 @@ static int sstfb_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	}
 
 	sstfb_clear_screen(info);
-
+	#ifdef CONFIG_FB_DEVICE
 	if (device_create_file(info->dev, &device_attrs[0]))
 		printk(KERN_WARNING "sstfb: can't create sysfs entry.\n");
-
+	#endif
 
 	fb_info(info, "%s frame buffer device at 0x%p\n",
 		fix->id, info->screen_base);
@@ -1467,8 +1468,9 @@ static void sstfb_remove(struct pci_dev *pdev)
 
 	info = pci_get_drvdata(pdev);
 	par = info->par;
-
+	#ifdef CONFIG_FB_DEVICE
 	device_remove_file(info->dev, &device_attrs[0]);
+	#endif
 	sst_shutdown(info);
 	iounmap(info->screen_base);
 	iounmap(par->mmio_vbase);
-- 
2.39.5

