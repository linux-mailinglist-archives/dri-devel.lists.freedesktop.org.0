Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08BC2A58A28
	for <lists+dri-devel@lfdr.de>; Mon, 10 Mar 2025 02:54:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EAC810E38E;
	Mon, 10 Mar 2025 01:54:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="oG5lFVfo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3CB2210E38E
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Mar 2025 01:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=WQbkt
 5MbX6FWnP6mNnh/2Ztp8PMd5g3lbLTTqSinn6c=; b=oG5lFVfoOiSoCuZhwK6aL
 5Ohoqeol/tXcQ2ETIOgUYVjLKQ2JQ0oV4IL7oTfqG/tiMznTz3qIx9QMsdtVKXsj
 M0b0kkLNgY+Z/UGLbcfSNIGATX7U79OHYRNZykoK5W5/O/vX9vwuMejUEOjbx4kt
 Ate2Qr2P9lqD3iGbT1yuhk=
Received: from localhost.localdomain (unknown [])
 by gzga-smtp-mtada-g1-0 (Coremail) with SMTP id
 _____wDXTzNYRs5nFOjSRg--.17921S2; 
 Mon, 10 Mar 2025 09:54:34 +0800 (CST)
From: oushixiong1025@163.com
To: Timur Tabi <timur@kernel.org>
Cc: Helge Deller <deller@gmx.de>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Shixiong Ou <oushixiong@kylinos.cn>
Subject: [PATCH v3] fbdev: fsl-diu-fb: add missing device_remove_file()
Date: Mon, 10 Mar 2025 09:54:31 +0800
Message-Id: <20250310015431.43387-1-oushixiong1025@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDXTzNYRs5nFOjSRg--.17921S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrZFWDGFWxWw18ArWkGw43GFg_yoW3Zwc_uF
 15Z395Xr4UGr1kKw1IgFsIyryUKF1qgay3XFs2gr95J3s7uw4Yq3yjvr42grWDWw4IkF9x
 tw1qgr4jvF1rCjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU1nXo3UUUUU==
X-Originating-IP: [116.128.244.169]
X-CM-SenderInfo: xrxvxxx0lr0wirqskqqrwthudrp/1tbiXAQMD2fOO+-mFwAAsX
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
	add has_dev_attrs flag.
v2->v3:
	drop those extra checks.

 drivers/video/fbdev/fsl-diu-fb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/video/fbdev/fsl-diu-fb.c b/drivers/video/fbdev/fsl-diu-fb.c
index 5ac8201c3533..b71d15794ce8 100644
--- a/drivers/video/fbdev/fsl-diu-fb.c
+++ b/drivers/video/fbdev/fsl-diu-fb.c
@@ -1827,6 +1827,7 @@ static void fsl_diu_remove(struct platform_device *pdev)
 	int i;
 
 	data = dev_get_drvdata(&pdev->dev);
+	device_remove_file(&pdev->dev, &data->dev_attr);
 	disable_lcdc(&data->fsl_diu_info[0]);
 
 	free_irq(data->irq, data->diu_reg);
-- 
2.25.1

