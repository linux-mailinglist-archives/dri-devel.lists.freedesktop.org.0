Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 87BCB7CD2B9
	for <lists+dri-devel@lfdr.de>; Wed, 18 Oct 2023 05:38:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCE6810E357;
	Wed, 18 Oct 2023 03:37:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43CD810E357
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Oct 2023 03:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697600276; x=1729136276;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=P1Y4r0Us5zf2Vwf6/V8LkQboWRZ55cSVjIX4qdzVeSk=;
 b=lqWGvFWfvnHifJxJ9n7eEvNISS1M4Kvec4jzXm+p/CyPR8axSJsyQwbR
 Y3bKAcSsYI/EOmGKsqmOL25lYAUmeCPdxgr9vGtlXJDfpZWN6La/IHJ6S
 ZY0ruyfqY4s2huhexrRtf9FudhVonvDZVuM5lXP3BRR/UntE1YxR+EyTd
 g3muYR5p2nsWBHtnRjVLRttVRhlxoSrzE91qQCYAF/tZX/hktP4XRGOZN
 wLUuebYKY5IWyNN151S4GDvUN892ue2+n9QPi/t6F4/LBQOuEzq+8OU9f
 KHHNkPu1nB/vsHzz6LhA2QQUzOYj7KvxCsKgQTorv9of4xtoaEgqxxvrl A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="384808947"
X-IronPort-AV: E=Sophos;i="6.03,234,1694761200"; d="scan'208";a="384808947"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2023 20:37:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="822264440"
X-IronPort-AV: E=Sophos;i="6.03,234,1694761200"; d="scan'208";a="822264440"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga008.fm.intel.com with ESMTP; 17 Oct 2023 20:37:53 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id E2A0E130; Wed, 18 Oct 2023 06:37:51 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Helge Deller <deller@gmx.de>, linux-fbdev@vger.kernel.org,
 linux-omap@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/1] fbdev: omapfb: Do not shadow error code from
 platform_get_irq()
Date: Wed, 18 Oct 2023 06:37:50 +0300
Message-Id: <20231018033750.1123859-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.40.0.1.gaa8946217a0b
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
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Dan Carpenter <dan.carpenter@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There is no point in shadowing the error codes from platform_get_irq().
Refactor omapfb_do_probe() accordingly.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/video/fbdev/omap/omapfb_main.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/video/fbdev/omap/omapfb_main.c b/drivers/video/fbdev/omap/omapfb_main.c
index 42c96f1cfc93..631076bf71f9 100644
--- a/drivers/video/fbdev/omap/omapfb_main.c
+++ b/drivers/video/fbdev/omap/omapfb_main.c
@@ -1643,17 +1643,16 @@ static int omapfb_do_probe(struct platform_device *pdev,
 		r = -ENOMEM;
 		goto cleanup;
 	}
-	fbdev->int_irq = platform_get_irq(pdev, 0);
-	if (fbdev->int_irq < 0) {
-		r = -ENXIO;
+
+	r = platform_get_irq(pdev, 0);
+	if (r < 0)
 		goto cleanup;
-	}
+	fbdev->int_irq = r;
 
-	fbdev->ext_irq = platform_get_irq(pdev, 1);
-	if (fbdev->ext_irq < 0) {
-		r = -ENXIO;
+	r = platform_get_irq(pdev, 1);
+	if (r < 0)
 		goto cleanup;
-	}
+	fbdev->ext_irq = r;
 
 	init_state++;
 
-- 
2.40.0.1.gaa8946217a0b

