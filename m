Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5EE94B1CFB
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 04:36:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B335310E9DD;
	Fri, 11 Feb 2022 03:36:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 428 seconds by postgrey-1.36 at gabe;
 Fri, 11 Feb 2022 03:36:04 UTC
Received: from qq.com (smtpbg478.qq.com [59.36.132.92])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D066210E9DD
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Feb 2022 03:36:04 +0000 (UTC)
X-QQ-mid: bizesmtp50t1644550079to65l9oo
Received: from localhost.localdomain (unknown [123.114.60.34])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Fri, 11 Feb 2022 11:27:57 +0800 (CST)
X-QQ-SSF: 01400000000000B0L000B00A0000000
X-QQ-FEAT: F3yR32iATbh2oLBgY04bLCEUrugK2eYu4uqKzn4vZXr8M3FhjTaXhTsqQBEGA
 1bFiRILN7D7WuAlXkxS9K6wuxbIdfTOvRUPUc//342iGA4AzJ2ggNOHQyQjx1WOpFSfWPIB
 GGlRpicv3TZMkOyuYQSiWFlgtLY9vw69udozN1/DwrdX+yChhQq9zOyjzn2BkEjIJ2z1Sqi
 r7vsbqLo42piW5VVPu0IQRh6GyHruikoqHcT/Xr4HNvJUOSulO8P+8FF9oE9M9DsW6UGuB9
 yGbEJuu2gF7uT5B9RxzK4jb12w8Deol0kDfhrhTxBePHSsfuGRryHcQtSIC5aVaOZnvyF7I
 +eBXrlcM4Y2JsmK3VT4FW26RuQqwyXUlO0hVF4S
X-QQ-GoodBg: 2
From: zhaoxiao <zhaoxiao@uniontech.com>
To: jingoohan1@gmail.com,
	deller@gmx.de
Subject: [PATCH] video: s3c-fb: Use platform_get_irq() to get the interrupt
Date: Fri, 11 Feb 2022 11:27:55 +0800
Message-Id: <20220211032755.2271-1-zhaoxiao@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign7
X-QQ-Bgrelay: 1
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
Cc: zhaoxiao <zhaoxiao@uniontech.com>, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

platform_get_resource(pdev, IORESOURCE_IRQ, ..) relies on static
allocation of IRQ resources in DT core code, this causes an issue
when using hierarchical interrupt domains using "interrupts" property
in the node as this bypassed the hierarchical setup and messed up the
irq chaining.

In preparation for removal of static setup of IRQ resource from DT core
code use platform_get_irq().

Signed-off-by: zhaoxiao <zhaoxiao@uniontech.com>
---
 drivers/video/fbdev/s3c-fb.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/video/fbdev/s3c-fb.c b/drivers/video/fbdev/s3c-fb.c
index 3b134e1bbc38..6ead7d3e2312 100644
--- a/drivers/video/fbdev/s3c-fb.c
+++ b/drivers/video/fbdev/s3c-fb.c
@@ -1360,7 +1360,6 @@ static int s3c_fb_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct s3c_fb_platdata *pd;
 	struct s3c_fb *sfb;
-	struct resource *res;
 	int win;
 	int ret = 0;
 	u32 reg;
@@ -1418,13 +1417,13 @@ static int s3c_fb_probe(struct platform_device *pdev)
 		goto err_lcd_clk;
 	}
 
-	res = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
-	if (!res) {
+	sfb->irq_no = platform_get_irq(pdev, 0);
+	if (sfb->irq_no < 0) {
 		dev_err(dev, "failed to acquire irq resource\n");
 		ret = -ENOENT;
 		goto err_lcd_clk;
 	}
-	sfb->irq_no = res->start;
+
 	ret = devm_request_irq(dev, sfb->irq_no, s3c_fb_irq,
 			  0, "s3c_fb", sfb);
 	if (ret) {
-- 
2.20.1



