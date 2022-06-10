Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D34A54686E
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 16:36:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2549C10E035;
	Fri, 10 Jun 2022 14:36:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D4F510E0A9
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 14:35:59 +0000 (UTC)
Received: from fsav314.sakura.ne.jp (fsav314.sakura.ne.jp [153.120.85.145])
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 25AEZvW8083526;
 Fri, 10 Jun 2022 23:35:57 +0900 (JST)
 (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav314.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav314.sakura.ne.jp);
 Fri, 10 Jun 2022 23:35:57 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav314.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
 (authenticated bits=0)
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 25AEZvpm083523
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Fri, 10 Jun 2022 23:35:57 +0900 (JST)
 (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <e9b95132-89cd-5cfc-1a09-966393c5ecb0@I-love.SAKURA.ne.jp>
Date: Fri, 10 Jun 2022 23:35:53 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: [PATCH v2] gpu/drm/bridge/cadence: avoid flush_scheduled_work() usage
Content-Language: en-US
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
References: <d87fdfd0-71d0-09e0-a5ea-652edd50dfdd@I-love.SAKURA.ne.jp>
In-Reply-To: <d87fdfd0-71d0-09e0-a5ea-652edd50dfdd@I-love.SAKURA.ne.jp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: DRI <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use local wq in order to avoid flush_scheduled_work() usage.

Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
---
Changes in v2:
  Replace flush_scheduled_work() with flush_workqueue().

Please see commit c4f135d643823a86 ("workqueue: Wrap flush_workqueue()
using a macro") for background.

This is a blind conversion, and is only compile tested.

 .../drm/bridge/cadence/cdns-mhdp8546-core.c   | 32 ++++++++++++++++---
 .../drm/bridge/cadence/cdns-mhdp8546-core.h   |  2 ++
 .../drm/bridge/cadence/cdns-mhdp8546-hdcp.c   | 16 +++++-----
 3 files changed, 37 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
index 67f0f444b4e8..f29c9484d4bb 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
@@ -53,6 +53,8 @@
 #include "cdns-mhdp8546-hdcp.h"
 #include "cdns-mhdp8546-j721e.h"
 
+struct workqueue_struct *cadence_mhdp_wq;
+
 static int cdns_mhdp_mailbox_read(struct cdns_mhdp_device *mhdp)
 {
 	int ret, empty;
@@ -2049,7 +2051,7 @@ static void cdns_mhdp_atomic_enable(struct drm_bridge *bridge,
 out:
 	mutex_unlock(&mhdp->link_mutex);
 	if (ret < 0)
-		schedule_work(&mhdp->modeset_retry_work);
+		queue_work(cadence_mhdp_wq, &mhdp->modeset_retry_work);
 }
 
 static void cdns_mhdp_atomic_disable(struct drm_bridge *bridge,
@@ -2373,7 +2375,7 @@ static irqreturn_t cdns_mhdp_irq_handler(int irq, void *data)
 	spin_unlock(&mhdp->start_lock);
 
 	if (bridge_attached && (sw_ev0 & CDNS_DPTX_HPD)) {
-		schedule_work(&mhdp->hpd_work);
+		queue_work(cadence_mhdp_wq, &mhdp->hpd_work);
 	}
 
 	if (sw_ev0 & ~CDNS_DPTX_HPD) {
@@ -2413,7 +2415,7 @@ static void cdns_mhdp_hpd_work(struct work_struct *work)
 	ret = cdns_mhdp_update_link_status(mhdp);
 	if (mhdp->connector.dev) {
 		if (ret < 0)
-			schedule_work(&mhdp->modeset_retry_work);
+			queue_work(cadence_mhdp_wq, &mhdp->modeset_retry_work);
 		else
 			drm_kms_helper_hotplug_event(mhdp->bridge.dev);
 	} else {
@@ -2603,7 +2605,7 @@ static int cdns_mhdp_remove(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 
 	cancel_work_sync(&mhdp->modeset_retry_work);
-	flush_scheduled_work();
+	flush_workqueue(cadence_mhdp_wq);
 
 	clk_disable_unprepare(mhdp->clk);
 
@@ -2632,7 +2634,27 @@ static struct platform_driver mhdp_driver = {
 	.probe	= cdns_mhdp_probe,
 	.remove	= cdns_mhdp_remove,
 };
-module_platform_driver(mhdp_driver);
+
+static int __init mhdp_init(void)
+{
+	int ret;
+
+	cadence_mhdp_wq = alloc_workqueue("cadence_mhdp_wq", 0, 0);
+	if (!cadence_mhdp_wq)
+		return -ENOMEM;
+	ret = platform_driver_register(&mhdp_driver);
+	if (ret)
+		destroy_workqueue(cadence_mhdp_wq);
+	return ret;
+}
+module_init(mhdp_init);
+
+static void __exit mhdp_exit(void)
+{
+	platform_driver_unregister(&mhdp_driver);
+	destroy_workqueue(cadence_mhdp_wq);
+}
+module_exit(mhdp_exit);
 
 MODULE_FIRMWARE(FW_NAME);
 
diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h
index bedddd510d17..e6c475612480 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h
@@ -419,4 +419,6 @@ struct cdns_mhdp_device {
 
 u32 cdns_mhdp_wait_for_sw_event(struct cdns_mhdp_device *mhdp, uint32_t event);
 
+extern struct workqueue_struct *cadence_mhdp_wq;
+
 #endif
diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c
index 946212a95598..09f9e3d42f11 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c
@@ -449,14 +449,14 @@ static int cdns_mhdp_hdcp_check_link(struct cdns_mhdp_device *mhdp)
 	ret = _cdns_mhdp_hdcp_disable(mhdp);
 	if (ret) {
 		mhdp->hdcp.value = DRM_MODE_CONTENT_PROTECTION_DESIRED;
-		schedule_work(&mhdp->hdcp.prop_work);
+		queue_work(cadence_mhdp_wq, &mhdp->hdcp.prop_work);
 		goto out;
 	}
 
 	ret = _cdns_mhdp_hdcp_enable(mhdp, mhdp->hdcp.hdcp_content_type);
 	if (ret) {
 		mhdp->hdcp.value = DRM_MODE_CONTENT_PROTECTION_DESIRED;
-		schedule_work(&mhdp->hdcp.prop_work);
+		queue_work(cadence_mhdp_wq, &mhdp->hdcp.prop_work);
 	}
 out:
 	mutex_unlock(&mhdp->hdcp.mutex);
@@ -474,8 +474,8 @@ static void cdns_mhdp_hdcp_check_work(struct work_struct *work)
 						     hdcp);
 
 	if (!cdns_mhdp_hdcp_check_link(mhdp))
-		schedule_delayed_work(&hdcp->check_work,
-				      DRM_HDCP_CHECK_PERIOD_MS);
+		queue_delayed_work(cadence_mhdp_wq, &hdcp->check_work,
+				   DRM_HDCP_CHECK_PERIOD_MS);
 }
 
 static void cdns_mhdp_hdcp_prop_work(struct work_struct *work)
@@ -538,9 +538,9 @@ int cdns_mhdp_hdcp_enable(struct cdns_mhdp_device *mhdp, u8 content_type)
 
 	mhdp->hdcp.hdcp_content_type = content_type;
 	mhdp->hdcp.value = DRM_MODE_CONTENT_PROTECTION_ENABLED;
-	schedule_work(&mhdp->hdcp.prop_work);
-	schedule_delayed_work(&mhdp->hdcp.check_work,
-			      DRM_HDCP_CHECK_PERIOD_MS);
+	queue_work(cadence_mhdp_wq, &mhdp->hdcp.prop_work);
+	queue_delayed_work(cadence_mhdp_wq, &mhdp->hdcp.check_work,
+			   DRM_HDCP_CHECK_PERIOD_MS);
 out:
 	mutex_unlock(&mhdp->hdcp.mutex);
 	return ret;
@@ -553,7 +553,7 @@ int cdns_mhdp_hdcp_disable(struct cdns_mhdp_device *mhdp)
 	mutex_lock(&mhdp->hdcp.mutex);
 	if (mhdp->hdcp.value != DRM_MODE_CONTENT_PROTECTION_UNDESIRED) {
 		mhdp->hdcp.value = DRM_MODE_CONTENT_PROTECTION_UNDESIRED;
-		schedule_work(&mhdp->hdcp.prop_work);
+		queue_work(cadence_mhdp_wq, &mhdp->hdcp.prop_work);
 		ret = _cdns_mhdp_hdcp_disable(mhdp);
 	}
 	mutex_unlock(&mhdp->hdcp.mutex);
-- 
2.18.4


