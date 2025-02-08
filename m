Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 975A6A2D576
	for <lists+dri-devel@lfdr.de>; Sat,  8 Feb 2025 11:24:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F80610E034;
	Sat,  8 Feb 2025 10:24:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="ZoMhS++v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
 by gabe.freedesktop.org (Postfix) with ESMTP id AA30F10E034
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Feb 2025 10:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=FJHFR
 zNnEifHYNKmIB7Y5o2gTuLBBAspQuUOtDbOveo=; b=ZoMhS++vRlud5Xteoz1Jr
 E6b/AdX87wumrtvySKDrXZX6lBwR9cgiKFsOAcKFn+nhZfURWx7KSLp+fUgoobZn
 w9eOGbgBopWt1YWDyK+THd7upBIYiIlbTNsLsrOxCA9XZ0tSMH1lTV3Uvq9maSV6
 kjs4Fkj7YH+fHjs5QxACFQ=
Received: from localhost.localdomain (unknown [])
 by gzsmtp4 (Coremail) with SMTP id PygvCgB3tQ_EMKdnfA5VBw--.59282S2;
 Sat, 08 Feb 2025 18:24:06 +0800 (CST)
From: oushixiong1025@163.com
To: Timur Tabi <timur@kernel.org>
Cc: Helge Deller <deller@gmx.de>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Shixiong Ou <oushixiong@kylinos.cn>
Subject: [PATCH] fbdev: fsl-diu-fb: add missing device_remove_file()
Date: Sat,  8 Feb 2025 18:23:59 +0800
Message-Id: <20250208102359.279333-1-oushixiong1025@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PygvCgB3tQ_EMKdnfA5VBw--.59282S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrZFWDGFWxWw47GrWkCFWruFg_yoWDGFc_uF
 15ZrWvgr1UGr1vgr1kKF4SyryrKF1qgay3XFs2gFyrt3s7u3yYg3yUZr4jgrZrWw4IkF90
 yw1DWrZxZF1rCjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU1nqXJUUUUU==
X-Originating-IP: [116.128.244.169]
X-CM-SenderInfo: xrxvxxx0lr0wirqskqqrwthudrp/1tbiXQTtD2enL0MPhwAAsf
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

From: Shixiong Ou <oushixiong@kylinos.cn>

Call device_remove_file() when driver remove.

Signed-off-by: Shixiong Ou <oushixiong@kylinos.cn>
---
 drivers/video/fbdev/fsl-diu-fb.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/video/fbdev/fsl-diu-fb.c b/drivers/video/fbdev/fsl-diu-fb.c
index 5ac8201c3533..8c91af9a9156 100644
--- a/drivers/video/fbdev/fsl-diu-fb.c
+++ b/drivers/video/fbdev/fsl-diu-fb.c
@@ -1807,6 +1807,7 @@ static int fsl_diu_probe(struct platform_device *pdev)
 	if (ret) {
 		dev_err(&pdev->dev, "could not create sysfs file %s\n",
 			data->dev_attr.attr.name);
+		goto error;
 	}
 
 	dev_set_drvdata(&pdev->dev, data);
@@ -1827,6 +1828,9 @@ static void fsl_diu_remove(struct platform_device *pdev)
 	int i;
 
 	data = dev_get_drvdata(&pdev->dev);
+
+	device_remove_file(&pdev->dev, &data->dev_attr);
+
 	disable_lcdc(&data->fsl_diu_info[0]);
 
 	free_irq(data->irq, data->diu_reg);
-- 
2.17.1

