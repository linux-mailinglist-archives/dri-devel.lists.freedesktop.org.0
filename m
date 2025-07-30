Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E57B16870
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jul 2025 23:46:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BD2110E057;
	Wed, 30 Jul 2025 21:46:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=siemens.com header.i=nicusor.huhulea@siemens.com header.b="f24kyfv6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 602 seconds by postgrey-1.36 at gabe;
 Wed, 30 Jul 2025 16:23:16 UTC
Received: from mta-65-226.siemens.flowmailer.net
 (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC6E910E37A
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jul 2025 16:23:16 +0000 (UTC)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id
 20250730161313b93a79f184b0a15c6b
 for <dri-devel@lists.freedesktop.org>;
 Wed, 30 Jul 2025 18:13:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=nicusor.huhulea@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=yDLMm9ODQNJJLoeLAlYD4fQh6aLFQJRfq+mXyFVSVnA=;
 b=f24kyfv6HkDpJ7btSyAK6ZLNvcXzGIwSkv708FrJSlCWDD/1/Qc4blzQPC5n/y+L2gjRxs
 9G+FVEDVavKwM6df/qgcbp07iBdsVEzIWtaoOg/dDpv+Un/rmbvqipwiMCfnn0i+ODvwIhSs
 LFIDs5SNYZCLfCvD2j+27Q+0f01Uu2Z/N5EXNrkQ5Ko5NWWNBOPP+8Ua2h0lKVJuUt7I51Sf
 5EseHMss+b5IXGEg95K+JG0761h359SH+vmS/EU4hL/eAC8BENOd+ZamTYWN4SubBLU35pT+
 uez2Oz855nB+39Td88C9km0L+SMkNKC/TylvZ2UsR0NF3p7YNVd5SdEw==;
From: Nicusor Huhulea <nicusor.huhulea@siemens.com>
To: stable@vger.kernel.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Cc: cip-dev@lists.cip-project.org, imre.deak@intel.com,
 jouni.hogander@intel.com, neil.armstrong@linaro.org,
 jani.nikula@linux.intel.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 daniel@ffwll.ch, joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
 tvrtko.ursulin@linux.intel.com, laurentiu.palcu@oss.nxp.com,
 cedric.hombourger@siemens.com, shrikant.bobade@siemens.com,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Nicusor Huhulea <nicusor.huhulea@siemens.com>
Subject: [PATCH 2/5] drm: Add an HPD poll helper to reschedule the poll work
Date: Wed, 30 Jul 2025 19:11:03 +0300
Message-Id: <20250730161106.80725-3-nicusor.huhulea@siemens.com>
In-Reply-To: <20250730161106.80725-1-nicusor.huhulea@siemens.com>
References: <20250730161106.80725-1-nicusor.huhulea@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1331196:519-21489:flowmailer
X-Mailman-Approved-At: Wed, 30 Jul 2025 21:46:19 +0000
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

From: Imre Deak <imre.deak@intel.com>

commit fe2352fd64029918174de4b460dfe6df0c6911cd upstream

This is not a clean cherry-pick due to code divergence.

Add a helper to reschedule drm_mode_config::output_poll_work after
polling has been enabled for a connector (and needing a reschedule,
since previously polling was disabled for all connectors and hence
output_poll_work was not running).

This is needed by the next patch fixing HPD polling on i915.

Cc: stable@vger.kernel.org # 6.4+
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: dri-devel@lists.freedesktop.org
Reviewed-by: Jouni Högander <jouni.hogander@intel.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Imre Deak <imre.deak@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20230822113015.41224-1-imre.deak@intel.com
Signed-off-by: Nicusor Huhulea <nicusor.huhulea@siemens.com>
---
 drivers/gpu/drm/drm_probe_helper.c | 74 +++++++++++++++++++-----------
 include/drm/drm_probe_helper.h     |  1 +
 2 files changed, 49 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
index 0e5eadc6d44d..787f6699971f 100644
--- a/drivers/gpu/drm/drm_probe_helper.c
+++ b/drivers/gpu/drm/drm_probe_helper.c
@@ -224,6 +224,26 @@ drm_connector_mode_valid(struct drm_connector *connector,
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
@@ -244,43 +264,45 @@ drm_connector_mode_valid(struct drm_connector *connector,
  */
 void drm_kms_helper_poll_enable(struct drm_device *dev)
 {
-	bool poll = false;
+
 	struct drm_connector *connector;
 	struct drm_connector_list_iter conn_iter;
-	unsigned long delay = DRM_OUTPUT_POLL_PERIOD;
 
 	if (drm_WARN_ON_ONCE(dev, !dev->mode_config.poll_enabled) ||
 	    !drm_kms_helper_poll || dev->mode_config.poll_running)
 		return;
 
-	drm_connector_list_iter_begin(dev, &conn_iter);
-	drm_for_each_connector_iter(connector, &conn_iter) {
-		if (connector->polled & (DRM_CONNECTOR_POLL_CONNECT |
-					 DRM_CONNECTOR_POLL_DISCONNECT))
-			poll = true;
-	}
-	drm_connector_list_iter_end(&conn_iter);
+	if (drm_kms_helper_enable_hpd(dev) ||
+	    dev->mode_config.delayed_event)
+		reschedule_output_poll_work(dev);
 
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
+	dev->mode_config.poll_running = true;
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
index 5880daa14624..429a85f38036 100644
--- a/include/drm/drm_probe_helper.h
+++ b/include/drm/drm_probe_helper.h
@@ -25,6 +25,7 @@ void drm_kms_helper_connector_hotplug_event(struct drm_connector *connector);
 
 void drm_kms_helper_poll_disable(struct drm_device *dev);
 void drm_kms_helper_poll_enable(struct drm_device *dev);
+void drm_kms_helper_poll_reschedule(struct drm_device *dev);
 bool drm_kms_helper_is_poll_worker(void);
 
 enum drm_mode_status drm_crtc_helper_mode_valid_fixed(struct drm_crtc *crtc,
-- 
2.39.2

