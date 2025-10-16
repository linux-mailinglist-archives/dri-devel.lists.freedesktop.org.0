Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAC3ABE547E
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 21:49:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8073010EA7D;
	Thu, 16 Oct 2025 19:49:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PSONFAf/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 516BB10E9B7
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 10:55:43 +0000 (UTC)
Received: by mail-qk1-f179.google.com with SMTP id
 af79cd13be357-8599c274188so87202185a.1
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 03:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760612142; x=1761216942; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tUv0dDyeU7y7WspWVqJNMNUdztGgUwvGxjkgJqZoga0=;
 b=PSONFAf/vpTCyMDylxRADUtd8ag529mU/cvVo71n8Azb0W4nqSK3FKipbeOxFQ7rTY
 o/ryqC69T6YKcXZpaa0i07iMu8pLgFmtUsxqNGJFk2C411j8ZY1kqROl+DsiaUOjkfd9
 zZPUb4NgZb9yk18sYzftw+WB3FP3f/tdd1FZyIcWVsFhN+qSv0sKcVVEhtEKuLJCkV+l
 BZv+Og3s9n4fcPOqCiODkLRm8xYeVCn36ArgO/pZnXNeD4IhzBWiJshXfYIaJ181p2rB
 c+F7HPbbJwPLQcEU6XsrdROW76cuqgdjKRxH40NZTuC5re4iQ5eXgbT7gY3LOUE+v77X
 9yHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760612142; x=1761216942;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tUv0dDyeU7y7WspWVqJNMNUdztGgUwvGxjkgJqZoga0=;
 b=dt/LK+HmZP5JmqF0EEmpzc6y2fCFddrpsL25IAMKnr63UEFybmIgYY19z8d/sR5ESA
 PlRIpRm80J+Aa/zqWYmVmZt34ARZIRVUdw5dJQ4RTDrxY89edAJXK/6DVHHCbsTI/CkC
 HToQY2zlnffYWxRX26/Q7o2zIOLrbeKrjJN4HoqTS2wTHGwL5zMK1O1lBXMEdtF6MOCd
 BOhS0Tucvy6DP2zTSgJa8tGb56aYXYz5VcBVJDHISp7zbLvek+EYQY7rSWbX/7pEsEuI
 TltyiRFGcn1dPfboupJ6frvo0+8PC3+gLZI+z14l0vcCEQUDmYZhcmoNyNtwI1773WzE
 tIfw==
X-Gm-Message-State: AOJu0YxLBN+GXwszX4g8dHy4UKrSCWQENmTqpl13e3Ymvg0FC2NSyr5S
 kMe9aBoWW7Bw84Ke9YeU7GOT3oTq7NQTrj6MHYmdySFoF7w8cTljlTu+sY8lkA==
X-Gm-Gg: ASbGncuABtNjKrvBFtY1IQhx0XPGOR/NWvbuy3Z8rXiDw5YkoVhaZG4iwM02PPaM6if
 P5njSw6Uw0j0+grguZPYeU7JtEZy4oYIFj1RZsqPE5JtSByCTBoOEIjTaerRtZKPV0cXcLVmX+v
 w0gqkKuAFtps/7QN3u+1j9Dbx+WyeO/boKrX4NTsuKJYjdhE2/VRcUUYk8HaNkCDel8Y9sNmKGN
 GLgqOU0ZcmVrGfbVBQXMoNloC5d67mTRnoeHPGjOREs6/XyzD8DHCa4QG0ZIB073gkvq7Vmebz/
 m/0NohiR/CcxbFU0p3mjS/0FmO3/kJq4aQBP29e38Sk98MyFbvbdj11Vg2nV/GlGTlhu+j0CYmr
 Drfl26ZE+AxeO9vWloyBS2kwzYBQfi3/qkksxQjuc3YMJLxDwZhPFCy1EE+oA6qTT1l2+HSeVgQ
 uGSBdW+M4zEag7GV3DQTPB3mnlUkVeuLzHqv5IdSnCN10=
X-Google-Smtp-Source: AGHT+IHSbCNA4gKXGQ79Apbh6UBdRta7p0DwiGGgBt4gE+gkwTjNxJ3W0SoZh5OSP96PJHmnX5Q4Lw==
X-Received: by 2002:a05:620a:2982:b0:827:1bda:ca68 with SMTP id
 af79cd13be357-883544f4c00mr3625404985a.46.1760612142108; 
 Thu, 16 Oct 2025 03:55:42 -0700 (PDT)
Received: from kernel-internship-machine.. ([143.110.209.46])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-88f35c67577sm173681985a.25.2025.10.16.03.55.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Oct 2025 03:55:41 -0700 (PDT)
From: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
To: deller@gmx.de,
	soci@c64.rulez.org
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, vivek.balachandhar@gmail.com
Subject: [PATCH] fbdev: vga16fb: replace printk() with dev_*() in probe
Date: Thu, 16 Oct 2025 10:54:46 +0000
Message-Id: <20251016105446.3646544-1-vivek.balachandhar@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 16 Oct 2025 19:49:41 +0000
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

Use dev_*() with &dev->dev and drop the hard-coded prefix. Keep
original severities. No functional change.

Signed-off-by: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
---
 drivers/video/fbdev/vga16fb.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/video/fbdev/vga16fb.c b/drivers/video/fbdev/vga16fb.c
index eedab14c7d51..85852bca2d23 100644
--- a/drivers/video/fbdev/vga16fb.c
+++ b/drivers/video/fbdev/vga16fb.c
@@ -1319,7 +1319,7 @@ static int vga16fb_probe(struct platform_device *dev)
 	if (ret)
 		return ret;
 
-	printk(KERN_DEBUG "vga16fb: initializing\n");
+	dev_dbg(&dev->dev, "initializing\n");
 	info = framebuffer_alloc(sizeof(struct vga16fb_par), &dev->dev);
 
 	if (!info) {
@@ -1331,12 +1331,12 @@ static int vga16fb_probe(struct platform_device *dev)
 	info->screen_base = (void __iomem *)VGA_MAP_MEM(VGA_FB_PHYS_BASE, 0);
 
 	if (!info->screen_base) {
-		printk(KERN_ERR "vga16fb: unable to map device\n");
+		dev_err(&dev->dev, "unable to map device\n");
 		ret = -ENOMEM;
 		goto err_ioremap;
 	}
 
-	printk(KERN_INFO "vga16fb: mapped to 0x%p\n", info->screen_base);
+	dev_info(&dev->dev, "mapped to 0x%p\n", info->screen_base);
 	par = info->par;
 
 	par->isVGA = screen_info_video_type(si) == VIDEO_TYPE_VGAC;
@@ -1364,13 +1364,13 @@ static int vga16fb_probe(struct platform_device *dev)
 	i = (info->var.bits_per_pixel == 8) ? 256 : 16;
 	ret = fb_alloc_cmap(&info->cmap, i, 0);
 	if (ret) {
-		printk(KERN_ERR "vga16fb: unable to allocate colormap\n");
+		dev_err(&dev->dev, "unable to allocate colormap\n");
 		ret = -ENOMEM;
 		goto err_alloc_cmap;
 	}
 
 	if (vga16fb_check_var(&info->var, info)) {
-		printk(KERN_ERR "vga16fb: unable to validate variable\n");
+		dev_err(&dev->dev, "unable to validate variable\n");
 		ret = -EINVAL;
 		goto err_check_var;
 	}
@@ -1381,7 +1381,7 @@ static int vga16fb_probe(struct platform_device *dev)
 	if (ret)
 		goto err_check_var;
 	if (register_framebuffer(info) < 0) {
-		printk(KERN_ERR "vga16fb: unable to register framebuffer\n");
+		dev_err(&dev->dev, "unable to register framebuffer\n");
 		ret = -EINVAL;
 		goto err_check_var;
 	}
-- 
2.34.1

