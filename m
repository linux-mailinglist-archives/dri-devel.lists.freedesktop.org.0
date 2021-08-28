Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9B643FA486
	for <lists+dri-devel@lfdr.de>; Sat, 28 Aug 2021 10:48:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 997696EA1E;
	Sat, 28 Aug 2021 08:48:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from baidu.com (mx21.baidu.com [220.181.3.85])
 by gabe.freedesktop.org (Postfix) with ESMTP id C33FA6EA1E
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Aug 2021 08:48:28 +0000 (UTC)
Received: from BJHW-Mail-Ex12.internal.baidu.com (unknown [10.127.64.35])
 by Forcepoint Email with ESMTPS id 908BFF22137F2E0B3BA9;
 Sat, 28 Aug 2021 16:48:26 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BJHW-Mail-Ex12.internal.baidu.com (10.127.64.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Sat, 28 Aug 2021 16:48:26 +0800
Received: from LAPTOP-UKSR4ENP.internal.baidu.com (172.31.62.14) by
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Sat, 28 Aug 2021 16:48:25 +0800
From: Cai Huoqing <caihuoqing@baidu.com>
To: <tomba@kernel.org>, <airlied@linux.ie>, <daniel@ffwll.ch>
CC: <dri-devel@lists.freedesktop.org>, Cai Huoqing <caihuoqing@baidu.com>
Subject: [PATCH] drm/omap: dss: Make use of the helper macro
 SET_RUNTIME_PM_OPS()
Date: Sat, 28 Aug 2021 16:48:11 +0800
Message-ID: <20210828084811.104-1-caihuoqing@baidu.com>
X-Mailer: git-send-email 2.32.0.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.31.62.14]
X-ClientProxiedBy: BC-Mail-Ex17.internal.baidu.com (172.31.51.11) To
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42)
X-Baidu-BdMsfe-DateCheck: 1_BJHW-Mail-Ex12_2021-08-28 16:48:26:574
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

Use the helper macro SET_RUNTIME_PM_OPS() instead of the verbose
operators ".runtime_suspend/.runtime_resume", because the
SET_RUNTIME_PM_OPS() is a nice helper macro that could be brought
in to make code a little clearer, a little more concise.

Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
---
 drivers/gpu/drm/omapdrm/dss/dispc.c | 3 +--
 drivers/gpu/drm/omapdrm/dss/dsi.c   | 3 +--
 drivers/gpu/drm/omapdrm/dss/dss.c   | 3 +--
 drivers/gpu/drm/omapdrm/dss/venc.c  | 3 +--
 4 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/dispc.c b/drivers/gpu/drm/omapdrm/dss/dispc.c
index 5619420cc2cc..a23587c58555 100644
--- a/drivers/gpu/drm/omapdrm/dss/dispc.c
+++ b/drivers/gpu/drm/omapdrm/dss/dispc.c
@@ -4887,8 +4887,7 @@ static int dispc_runtime_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops dispc_pm_ops = {
-	.runtime_suspend = dispc_runtime_suspend,
-	.runtime_resume = dispc_runtime_resume,
+	SET_RUNTIME_PM_OPS(dispc_runtime_suspend, dispc_runtime_resume, NULL)
 	SET_LATE_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
 };
 
diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
index 5f1722b040f4..c22b2b4eae4f 100644
--- a/drivers/gpu/drm/omapdrm/dss/dsi.c
+++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
@@ -5086,8 +5086,7 @@ static int dsi_runtime_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops dsi_pm_ops = {
-	.runtime_suspend = dsi_runtime_suspend,
-	.runtime_resume = dsi_runtime_resume,
+	SET_RUNTIME_PM_OPS(dsi_runtime_suspend, dsi_runtime_resume, NULL)
 	SET_LATE_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
 };
 
diff --git a/drivers/gpu/drm/omapdrm/dss/dss.c b/drivers/gpu/drm/omapdrm/dss/dss.c
index d6a5862b4dbf..7a4581bf63e6 100644
--- a/drivers/gpu/drm/omapdrm/dss/dss.c
+++ b/drivers/gpu/drm/omapdrm/dss/dss.c
@@ -1606,8 +1606,7 @@ static int dss_runtime_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops dss_pm_ops = {
-	.runtime_suspend = dss_runtime_suspend,
-	.runtime_resume = dss_runtime_resume,
+	SET_RUNTIME_PM_OPS(dss_runtime_suspend, dss_runtime_resume, NULL)
 	SET_LATE_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
 };
 
diff --git a/drivers/gpu/drm/omapdrm/dss/venc.c b/drivers/gpu/drm/omapdrm/dss/venc.c
index e522c17955d0..37d9cf876c27 100644
--- a/drivers/gpu/drm/omapdrm/dss/venc.c
+++ b/drivers/gpu/drm/omapdrm/dss/venc.c
@@ -902,8 +902,7 @@ static int venc_runtime_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops venc_pm_ops = {
-	.runtime_suspend = venc_runtime_suspend,
-	.runtime_resume = venc_runtime_resume,
+	SET_RUNTIME_PM_OPS(venc_runtime_suspend, venc_runtime_resume, NULL)
 	SET_LATE_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
 };
 
-- 
2.25.1

