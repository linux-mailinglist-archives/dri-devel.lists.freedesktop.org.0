Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CEE6A5818F
	for <lists+dri-devel@lfdr.de>; Sun,  9 Mar 2025 09:16:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 947C110E33D;
	Sun,  9 Mar 2025 08:16:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="lCl0Jg9h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
 by gabe.freedesktop.org (Postfix) with ESMTP id E851B10E33D
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Mar 2025 08:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=FeXfy
 9DrSiD94bOaNEUCI5BYPJ0acvCrnQJISy1Gcq4=; b=lCl0Jg9hrmXh76RBaqg4D
 UKHfyG+h5HgcVkZIesTPeGzzQxzTfhAxVQ8UhzjkgRYWJr6ZnKQPfMMQl1KzuzYg
 XxfUXEtWNiuNRnvpGtTRMu1vieckxIxSdGOyqIX1MNApxObRoYHygGkGRTAp8Ja7
 GGdj1hIbpUNF2YJltREvKU=
Received: from DESKTOP-DMSSUQ5.localdomain (unknown [])
 by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id
 _____wBXBydJTs1n+NhnRQ--.8762S2; 
 Sun, 09 Mar 2025 16:16:09 +0800 (CST)
From: Shixiong Ou <oushixiong1025@163.com>
To: Timur Tabi <timur@kernel.org>
Cc: Helge Deller <deller@gmx.de>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Shixiong Ou <oushixiong@kylinos.cn>
Subject: [PATCH v2] fbdev: fsl-diu-fb: add missing device_remove_file()
Date: Sun,  9 Mar 2025 16:16:07 +0800
Message-ID: <20250309081607.27784-1-oushixiong1025@163.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wBXBydJTs1n+NhnRQ--.8762S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7WFy8Gr1rCr4Dtw4fKryxGrg_yoW8JF4DpF
 W7XFZ5KrZ8Jw1UKw1DGrWxu3WrXw4xA3s3ArW2k34a9wn09Fy8Xa4kJFy8AayFyrWkC3Wa
 qwnrtrWFvF9rWF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UMUDAUUUUU=
X-Originating-IP: [222.240.43.135]
X-CM-SenderInfo: xrxvxxx0lr0wirqskqqrwthudrp/1tbiXRELD2fM8CDgGwABsJ
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
v1->v2:
	add has_sysfs_attrs flag.

 drivers/video/fbdev/fsl-diu-fb.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/video/fbdev/fsl-diu-fb.c b/drivers/video/fbdev/fsl-diu-fb.c
index 5ac8201c3533..57f7fe6a4c76 100644
--- a/drivers/video/fbdev/fsl-diu-fb.c
+++ b/drivers/video/fbdev/fsl-diu-fb.c
@@ -384,6 +384,7 @@ struct fsl_diu_data {
 	__le16 next_cursor[MAX_CURS * MAX_CURS] __aligned(32);
 	uint8_t edid_data[EDID_LENGTH];
 	bool has_edid;
+	bool has_dev_attr;
 } __aligned(32);
 
 /* Determine the DMA address of a member of the fsl_diu_data structure */
@@ -1809,6 +1810,7 @@ static int fsl_diu_probe(struct platform_device *pdev)
 			data->dev_attr.attr.name);
 	}
 
+	data->has_dev_attr = true;
 	dev_set_drvdata(&pdev->dev, data);
 	return 0;
 
@@ -1827,6 +1829,10 @@ static void fsl_diu_remove(struct platform_device *pdev)
 	int i;
 
 	data = dev_get_drvdata(&pdev->dev);
+
+	if (data->has_dev_attr)
+		device_remove_file(&pdev->dev, &data->dev_attr);
+
 	disable_lcdc(&data->fsl_diu_info[0]);
 
 	free_irq(data->irq, data->diu_reg);
-- 
2.43.0

