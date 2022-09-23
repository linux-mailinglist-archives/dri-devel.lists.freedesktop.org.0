Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C24C5E7C27
	for <lists+dri-devel@lfdr.de>; Fri, 23 Sep 2022 15:45:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3564210E551;
	Fri, 23 Sep 2022 13:45:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1044 seconds by postgrey-1.36 at gabe;
 Fri, 23 Sep 2022 13:45:30 UTC
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4217A10E551
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Sep 2022 13:45:30 +0000 (UTC)
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4MYtCG1H9kz1P6tt;
 Fri, 23 Sep 2022 21:23:54 +0800 (CST)
Received: from kwepemm600014.china.huawei.com (7.193.23.54) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 23 Sep 2022 21:28:03 +0800
Received: from huawei.com (10.90.53.225) by kwepemm600014.china.huawei.com
 (7.193.23.54) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Fri, 23 Sep
 2022 21:28:03 +0800
From: Zhang Qilong <zhangqilong3@huawei.com>
To: <tomba@kernel.org>, <airlied@linux.ie>, <daniel@ffwll.ch>
Subject: [PATCH -next] drm: omapdrm: dss: using pm_runtime_resume_and_get
 instead of pm_runtime_get_sync
Date: Fri, 23 Sep 2022 21:31:34 +0800
Message-ID: <20220923133134.66908-1-zhangqilong3@huawei.com>
X-Mailer: git-send-email 2.26.0.106.g9fadedd
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.225]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemm600014.china.huawei.com (7.193.23.54)
X-CFilter-Loop: Reflected
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Using the newest pm_runtime_resume_and_get is more appropriate
for simplifing code here.

Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
---
 drivers/gpu/drm/omapdrm/dss/dispc.c | 6 ++----
 drivers/gpu/drm/omapdrm/dss/dsi.c   | 6 ++----
 drivers/gpu/drm/omapdrm/dss/dss.c   | 6 ++----
 drivers/gpu/drm/omapdrm/dss/hdmi4.c | 6 ++----
 drivers/gpu/drm/omapdrm/dss/hdmi5.c | 6 ++----
 drivers/gpu/drm/omapdrm/dss/venc.c  | 6 ++----
 6 files changed, 12 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/dispc.c b/drivers/gpu/drm/omapdrm/dss/dispc.c
index 0ee344ebcd1c..b6db72cf25f4 100644
--- a/drivers/gpu/drm/omapdrm/dss/dispc.c
+++ b/drivers/gpu/drm/omapdrm/dss/dispc.c
@@ -652,11 +652,9 @@ int dispc_runtime_get(struct dispc_device *dispc)
 
 	DSSDBG("dispc_runtime_get\n");
 
-	r = pm_runtime_get_sync(&dispc->pdev->dev);
-	if (WARN_ON(r < 0)) {
-		pm_runtime_put_noidle(&dispc->pdev->dev);
+	r = pm_runtime_resume_and_get(&dispc->pdev->dev);
+	if (WARN_ON(r < 0))
 		return r;
-	}
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
index a6845856cbce..7e28e314d34c 100644
--- a/drivers/gpu/drm/omapdrm/dss/dsi.c
+++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
@@ -704,11 +704,9 @@ static int dsi_runtime_get(struct dsi_data *dsi)
 
 	DSSDBG("dsi_runtime_get\n");
 
-	r = pm_runtime_get_sync(dsi->dev);
-	if (WARN_ON(r < 0)) {
-		pm_runtime_put_noidle(dsi->dev);
+	r = pm_runtime_resume_and_get(dsi->dev);
+	if (WARN_ON(r < 0))
 		return r;
-	}
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/omapdrm/dss/dss.c b/drivers/gpu/drm/omapdrm/dss/dss.c
index c4febb861910..0e32ddf0e24a 100644
--- a/drivers/gpu/drm/omapdrm/dss/dss.c
+++ b/drivers/gpu/drm/omapdrm/dss/dss.c
@@ -857,11 +857,9 @@ int dss_runtime_get(struct dss_device *dss)
 
 	DSSDBG("dss_runtime_get\n");
 
-	r = pm_runtime_get_sync(&dss->pdev->dev);
-	if (WARN_ON(r < 0)) {
-		pm_runtime_put_noidle(&dss->pdev->dev);
+	r = pm_runtime_resume_and_get(&dss->pdev->dev);
+	if (WARN_ON(r < 0))
 		return r;
-	}
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi4.c b/drivers/gpu/drm/omapdrm/dss/hdmi4.c
index a8a75dc24751..e802d42f12fe 100644
--- a/drivers/gpu/drm/omapdrm/dss/hdmi4.c
+++ b/drivers/gpu/drm/omapdrm/dss/hdmi4.c
@@ -43,11 +43,9 @@ static int hdmi_runtime_get(struct omap_hdmi *hdmi)
 
 	DSSDBG("hdmi_runtime_get\n");
 
-	r = pm_runtime_get_sync(&hdmi->pdev->dev);
-	if (WARN_ON(r < 0)) {
-		pm_runtime_put_noidle(&hdmi->pdev->dev);
+	r = pm_runtime_resume_and_get(&hdmi->pdev->dev);
+	if (WARN_ON(r < 0))
 		return r;
-	}
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi5.c b/drivers/gpu/drm/omapdrm/dss/hdmi5.c
index 868712cd8a3a..96f78aa2b0ba 100644
--- a/drivers/gpu/drm/omapdrm/dss/hdmi5.c
+++ b/drivers/gpu/drm/omapdrm/dss/hdmi5.c
@@ -44,11 +44,9 @@ static int hdmi_runtime_get(struct omap_hdmi *hdmi)
 
 	DSSDBG("hdmi_runtime_get\n");
 
-	r = pm_runtime_get_sync(&hdmi->pdev->dev);
-	if (WARN_ON(r < 0)) {
-		pm_runtime_put_noidle(&hdmi->pdev->dev);
+	r = pm_runtime_resume_and_get(&hdmi->pdev->dev);
+	if (WARN_ON(r < 0))
 		return r;
-	}
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/omapdrm/dss/venc.c b/drivers/gpu/drm/omapdrm/dss/venc.c
index 4480b69ab5a7..8c48f222351b 100644
--- a/drivers/gpu/drm/omapdrm/dss/venc.c
+++ b/drivers/gpu/drm/omapdrm/dss/venc.c
@@ -360,11 +360,9 @@ static int venc_runtime_get(struct venc_device *venc)
 
 	DSSDBG("venc_runtime_get\n");
 
-	r = pm_runtime_get_sync(&venc->pdev->dev);
-	if (WARN_ON(r < 0)) {
-		pm_runtime_put_noidle(&venc->pdev->dev);
+	r = pm_runtime_resume_and_get(&venc->pdev->dev);
+	if (WARN_ON(r < 0))
 		return r;
-	}
 	return 0;
 }
 
-- 
2.25.1

