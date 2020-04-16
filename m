Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 881E81AD695
	for <lists+dri-devel@lfdr.de>; Fri, 17 Apr 2020 09:00:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5E876E3A2;
	Fri, 17 Apr 2020 06:59:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from cmccmta3.chinamobile.com (cmccmta3.chinamobile.com
 [221.176.66.81])
 by gabe.freedesktop.org (Postfix) with ESMTP id CEE446E204
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Apr 2020 14:41:15 +0000 (UTC)
Received: from spf.mail.chinamobile.com (unknown[172.16.121.7]) by
 rmmx-syy-dmz-app11-12011 (RichMail) with SMTP id 2eeb5e986e743db-8764b;
 Thu, 16 Apr 2020 22:40:57 +0800 (CST)
X-RM-TRANSID: 2eeb5e986e743db-8764b
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from localhost.localdomain (unknown[112.1.173.7])
 by rmsmtp-syy-appsvr04-12004 (RichMail) with SMTP id 2ee45e986e750b1-26b7b;
 Thu, 16 Apr 2020 22:40:57 +0800 (CST)
X-RM-TRANSID: 2ee45e986e750b1-26b7b
From: Tang Bin <tangbin@cmss.chinamobile.com>
To: thierry.reding@gmail.com, airlied@linux.ie, daniel@ffwll.ch,
 jonathanh@nvidia.com
Subject: [PATCH] drm/tegra: dc: Use devm_platform_ioremap_resource() to
 simplify code
Date: Thu, 16 Apr 2020 22:42:40 +0800
Message-Id: <20200416144240.20184-1-tangbin@cmss.chinamobile.com>
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

Use devm_platform_ioremap_resource() instead of 
platform_get_resource()+ devm_ioremap_resource().

Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>
---
 drivers/gpu/drm/tegra/dc.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index d26fb16d6..72c952b1a 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -2503,7 +2503,6 @@ static int tegra_dc_couple(struct tegra_dc *dc)
 
 static int tegra_dc_probe(struct platform_device *pdev)
 {
-	struct resource *regs;
 	struct tegra_dc *dc;
 	int err;
 
@@ -2560,8 +2559,7 @@ static int tegra_dc_probe(struct platform_device *pdev)
 		tegra_powergate_power_off(dc->powergate);
 	}
 
-	regs = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	dc->regs = devm_ioremap_resource(&pdev->dev, regs);
+	dc->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(dc->regs))
 		return PTR_ERR(dc->regs);
 
-- 
2.20.1.windows.1



_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
