Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D409B783EC0
	for <lists+dri-devel@lfdr.de>; Tue, 22 Aug 2023 13:30:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFFB410E303;
	Tue, 22 Aug 2023 11:30:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACC3A10E05B;
 Tue, 22 Aug 2023 11:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692703802; x=1724239802;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=GGGF5+5clAnbTw18HrSaM87xI6XEZZlGcfnRBzEuPko=;
 b=TQGv7UJIqyVf31qA4VEKReSO9a+hESUvMXpPLzFUWqgytbHTT+aG1Ra9
 v3nsh40Zhz71yI5hoZB6M4PDFVprbGdDU4ufN0ZyaurFkQCLnOdQ6u+zi
 MMwdfYBIqTkGOTJZCkcJ1bwk60cZDhB2zqHNQs5zfeb6IxwHDNEDRRjKv
 MlvpIMh6GrjrIjpfJvFNJIXworec+30eUN04D9yNjtQ5YiGMa8+BWSj4Z
 EJyWUezymM/oouQmnVqCF/P6ZAffGW4y0hbiaM2IoMBANnOmBSVWKXuHS
 pLMpSd6FXk7jR3/+XZt35Xbgx7+6a66CykJ8BnVEkDqKp7FEFU8zQl8WC g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="377611505"
X-IronPort-AV: E=Sophos;i="6.01,192,1684825200"; d="scan'208";a="377611505"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2023 04:30:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="859886947"
X-IronPort-AV: E=Sophos;i="6.01,192,1684825200"; d="scan'208";a="859886947"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2023 04:30:00 -0700
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [CI 1/2] drm: Add an HPD poll helper to reschedule the poll work
Date: Tue, 22 Aug 2023 14:30:14 +0300
Message-Id: <20230822113015.41224-1-imre.deak@intel.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 dri-devel@lists.freedesktop.org, stable@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a helper to reschedule drm_mode_config::output_poll_work after
polling has been enabled for a connector (and needing a reschedule,
since previously polling was disabled for all connectors and hence
output_poll_work was not running).

This is needed by the next patch fixing HPD polling on i915.

CC: stable@vger.kernel.org # 6.4+
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: dri-devel@lists.freedesktop.org
Reviewed-by: Jouni Högander <jouni.hogander@intel.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/drm_probe_helper.c | 68 ++++++++++++++++++++----------
 include/drm/drm_probe_helper.h     |  1 +
 2 files changed, 47 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
index 2fb9bf901a2cc..3f479483d7d80 100644
--- a/drivers/gpu/drm/drm_probe_helper.c
+++ b/drivers/gpu/drm/drm_probe_helper.c
@@ -262,6 +262,26 @@ static bool drm_kms_helper_enable_hpd(struct drm_device *dev)
 }
 
 #define DRM_OUTPUT_POLL_PERIOD (10*HZ)
+static void reschedule_output_poll_work(struct drm_device *dev)
+{
+	unsigned long delay = DRM_OUTPUT_POLL_PERIOD;
+
+	if (dev->mode_config.delayed_event)
+		/*
+		 * FIXME:
+		 *
+		 * Use short (1s) delay to handle the initial delayed event.
+		 * This delay should not be needed, but Optimus/nouveau will
+		 * fail in a mysterious way if the delayed event is handled as
+		 * soon as possible like it is done in
+		 * drm_helper_probe_single_connector_modes() in case the poll
+		 * was enabled before.
+		 */
+		delay = HZ;
+
+	schedule_delayed_work(&dev->mode_config.output_poll_work, delay);
+}
+
 /**
  * drm_kms_helper_poll_enable - re-enable output polling.
  * @dev: drm_device
@@ -279,37 +299,41 @@ static bool drm_kms_helper_enable_hpd(struct drm_device *dev)
  */
 void drm_kms_helper_poll_enable(struct drm_device *dev)
 {
-	bool poll = false;
-	unsigned long delay = DRM_OUTPUT_POLL_PERIOD;
-
 	if (!dev->mode_config.poll_enabled || !drm_kms_helper_poll ||
 	    dev->mode_config.poll_running)
 		return;
 
-	poll = drm_kms_helper_enable_hpd(dev);
-
-	if (dev->mode_config.delayed_event) {
-		/*
-		 * FIXME:
-		 *
-		 * Use short (1s) delay to handle the initial delayed event.
-		 * This delay should not be needed, but Optimus/nouveau will
-		 * fail in a mysterious way if the delayed event is handled as
-		 * soon as possible like it is done in
-		 * drm_helper_probe_single_connector_modes() in case the poll
-		 * was enabled before.
-		 */
-		poll = true;
-		delay = HZ;
-	}
-
-	if (poll)
-		schedule_delayed_work(&dev->mode_config.output_poll_work, delay);
+	if (drm_kms_helper_enable_hpd(dev) ||
+	    dev->mode_config.delayed_event)
+		reschedule_output_poll_work(dev);
 
 	dev->mode_config.poll_running = true;
 }
 EXPORT_SYMBOL(drm_kms_helper_poll_enable);
 
+/**
+ * drm_kms_helper_poll_reschedule - reschedule the output polling work
+ * @dev: drm_device
+ *
+ * This function reschedules the output polling work, after polling for a
+ * connector has been enabled.
+ *
+ * Drivers must call this helper after enabling polling for a connector by
+ * setting %DRM_CONNECTOR_POLL_CONNECT / %DRM_CONNECTOR_POLL_DISCONNECT flags
+ * in drm_connector::polled. Note that after disabling polling by clearing these
+ * flags for a connector will stop the output polling work automatically if
+ * the polling is disabled for all other connectors as well.
+ *
+ * The function can be called only after polling has been enabled by calling
+ * drm_kms_helper_poll_init() / drm_kms_helper_poll_enable().
+ */
+void drm_kms_helper_poll_reschedule(struct drm_device *dev)
+{
+	if (dev->mode_config.poll_running)
+		reschedule_output_poll_work(dev);
+}
+EXPORT_SYMBOL(drm_kms_helper_poll_reschedule);
+
 static enum drm_connector_status
 drm_helper_probe_detect_ctx(struct drm_connector *connector, bool force)
 {
diff --git a/include/drm/drm_probe_helper.h b/include/drm/drm_probe_helper.h
index 4977e0ab72dbb..fad3c4003b2b5 100644
--- a/include/drm/drm_probe_helper.h
+++ b/include/drm/drm_probe_helper.h
@@ -25,6 +25,7 @@ void drm_kms_helper_connector_hotplug_event(struct drm_connector *connector);
 
 void drm_kms_helper_poll_disable(struct drm_device *dev);
 void drm_kms_helper_poll_enable(struct drm_device *dev);
+void drm_kms_helper_poll_reschedule(struct drm_device *dev);
 bool drm_kms_helper_is_poll_worker(void);
 
 enum drm_mode_status drm_crtc_helper_mode_valid_fixed(struct drm_crtc *crtc,
-- 
2.37.2

