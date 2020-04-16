Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4E9E1AD685
	for <lists+dri-devel@lfdr.de>; Fri, 17 Apr 2020 09:00:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EDA86E353;
	Fri, 17 Apr 2020 06:59:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from cmccmta2.chinamobile.com (cmccmta2.chinamobile.com
 [221.176.66.80])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1243F6E204
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Apr 2020 14:41:51 +0000 (UTC)
Received: from spf.mail.chinamobile.com (unknown[172.16.121.13]) by
 rmmx-syy-dmz-app05-12005 (RichMail) with SMTP id 2ee55e986e993ef-8760d;
 Thu, 16 Apr 2020 22:41:32 +0800 (CST)
X-RM-TRANSID: 2ee55e986e993ef-8760d
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from localhost.localdomain (unknown[112.1.173.7])
 by rmsmtp-syy-appsvr07-12007 (RichMail) with SMTP id 2ee75e986e9a334-6c092;
 Thu, 16 Apr 2020 22:41:32 +0800 (CST)
X-RM-TRANSID: 2ee75e986e9a334-6c092
From: Tang Bin <tangbin@cmss.chinamobile.com>
To: thierry.reding@gmail.com, airlied@linux.ie, daniel@ffwll.ch,
 jonathanh@nvidia.com
Subject: [PATCH] drm/tegra: dc: Omit superfluous error message in
 tegra_dc_probe()
Date: Thu, 16 Apr 2020 22:43:17 +0800
Message-Id: <20200416144317.2036-1-tangbin@cmss.chinamobile.com>
X-Mailer: git-send-email 2.20.1.windows.1
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 17 Apr 2020 06:59:46 +0000
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
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Tang Bin <tangbin@cmss.chinamobile.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In the function tegra_dc_probe(), when get irq failed, the function
platform_get_irq() logs an error message, so remove redundant message
here.

Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>
---
 drivers/gpu/drm/tegra/dc.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index 7c70fd31a..d26fb16d6 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -2566,10 +2566,8 @@ static int tegra_dc_probe(struct platform_device *pdev)
 		return PTR_ERR(dc->regs);
 
 	dc->irq = platform_get_irq(pdev, 0);
-	if (dc->irq < 0) {
-		dev_err(&pdev->dev, "failed to get IRQ\n");
+	if (dc->irq < 0)
 		return -ENXIO;
-	}
 
 	err = tegra_dc_rgb_probe(dc);
 	if (err < 0 && err != -ENODEV) {
-- 
2.20.1.windows.1



_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
