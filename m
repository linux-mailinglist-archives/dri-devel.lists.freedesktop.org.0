Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1CBBB2035D
	for <lists+dri-devel@lfdr.de>; Mon, 11 Aug 2025 11:27:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3F6910E3BB;
	Mon, 11 Aug 2025 09:27:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jLxdILoe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B22010E3B7;
 Mon, 11 Aug 2025 09:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754904467; x=1786440467;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xZRDvFI/h1XsPkkG0EgE3BdZNi3nIhnVkdTx1q+0bvY=;
 b=jLxdILoehxKJLfv1NmRumCgqiyDciDb+J5q/7OpsbusdaVfoemjnl1OQ
 PnvRQmtDCAUkqwC0pxWUXpt5LDRqY8wGl+I9gSCEmGdoC8CVMA3KFUW7D
 /yaUbemdP2KN47sKanUVl/ZdQSR0lA01vXYwG/QOrPqAQP2+0g7Up5zud
 CZO19LVXN/koA77Rd+VO7S/Myqt7PE2DY87wDzHegztDYJgstUbpJG+gM
 17EKRDKmJVJOoRPcFhLVvvHaq56dk96WN6VKTQq92YoqsniizstB2LfUt
 1bIiegMLf+H5e+iywrkmZFGGY80qgGw64gTAqoPDiXf84GkmD32OGdpC0 A==;
X-CSE-ConnectionGUID: 5h4cFP/+SEuHQWtET6Lekg==
X-CSE-MsgGUID: 4gaVOAPdTe2UCt0nLa2SpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="57217932"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; d="scan'208";a="57217932"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2025 02:27:47 -0700
X-CSE-ConnectionGUID: mCgCOl6pReSie7XKk/kxkw==
X-CSE-MsgGUID: RUTqBuzZRLKvxdKvph0kPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; d="scan'208";a="165860299"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by orviesa007.jf.intel.com with ESMTP; 11 Aug 2025 02:27:37 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: kernel-list@raspberrypi.com, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, arun.r.murthy@intel.com, uma.shankar@intel.com,
 jani.nikula@intel.com, dmitry.baryshkov@oss.qualcomm.com,
 harry.wentland@amd.com, siqueira@igalia.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch,
 liviu.dudau@arm.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 robin.clark@oss.qualcomm.com, abhinav.kumar@linux.dev, tzimmermann@suse.de,
 jessica.zhang@oss.qualcomm.com, sean@poorly.run,
 marijn.suijten@somainline.org, laurent.pinchart+renesas@ideasonboard.com,
 mcanal@igalia.com, dave.stevenson@raspberrypi.com,
 tomi.valkeinen+renesas@ideasonboard.com,
 kieran.bingham+renesas@ideasonboard.com, louis.chauvet@bootlin.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [RFC PATCH 1/8] drm: writeback: Refactor drm_writeback_connector
 structure
Date: Mon, 11 Aug 2025 14:57:00 +0530
Message-Id: <20250811092707.3986802-2-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250811092707.3986802-1-suraj.kandpal@intel.com>
References: <20250811092707.3986802-1-suraj.kandpal@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some drivers cannot work with the current design where the connector
is embedded within the drm_writeback_connector such as intel and
some drivers that can get it working end up adding a lot of checks
all around the code to check if it's a writeback conenctor or not.
To solve this we move the drm_writeback_connector within the
drm_connector and remove the drm_connector base which was in
drm_writeback_connector. We do all other required
modifications that come with these changes along with addition
of new function which returns the drm_connector when
drm_writeback_connector is present.
All drivers will be expected to allocate the drm_connector.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/drm_writeback.c | 33 ++++++++++------
 include/drm/drm_connector.h     | 60 +++++++++++++++++++++++++++++
 include/drm/drm_writeback.h     | 68 ++++-----------------------------
 3 files changed, 89 insertions(+), 72 deletions(-)

diff --git a/drivers/gpu/drm/drm_writeback.c b/drivers/gpu/drm/drm_writeback.c
index ec2575c4c21b..198b8c488056 100644
--- a/drivers/gpu/drm/drm_writeback.c
+++ b/drivers/gpu/drm/drm_writeback.c
@@ -89,8 +89,10 @@ static const char *drm_writeback_fence_get_driver_name(struct dma_fence *fence)
 {
 	struct drm_writeback_connector *wb_connector =
 		fence_to_wb_connector(fence);
+	struct drm_connector *connector =
+		drm_writeback_to_connector(wb_connector);
 
-	return wb_connector->base.dev->driver->name;
+	return connector->dev->driver->name;
 }
 
 static const char *
@@ -187,7 +189,8 @@ static int __drm_writeback_connector_init(struct drm_device *dev,
 					  struct drm_encoder *enc, const u32 *formats,
 					  int n_formats)
 {
-	struct drm_connector *connector = &wb_connector->base;
+	struct drm_connector *connector =
+		drm_writeback_to_connector(wb_connector);
 	struct drm_mode_config *config = &dev->mode_config;
 	struct drm_property_blob *blob;
 	int ret = create_writeback_properties(dev);
@@ -269,7 +272,8 @@ int drm_writeback_connector_init(struct drm_device *dev,
 				 struct drm_encoder *enc,
 				 const u32 *formats, int n_formats)
 {
-	struct drm_connector *connector = &wb_connector->base;
+	struct drm_connector *connector =
+		drm_writeback_to_connector(wb_connector);
 	int ret;
 
 	ret = drm_connector_init(dev, connector, con_funcs,
@@ -339,7 +343,8 @@ int drmm_writeback_connector_init(struct drm_device *dev,
 				  struct drm_encoder *enc,
 				  const u32 *formats, int n_formats)
 {
-	struct drm_connector *connector = &wb_connector->base;
+	struct drm_connector *connector =
+		drm_writeback_to_connector(wb_connector);
 	int ret;
 
 	ret = drmm_connector_init(dev, connector, con_funcs,
@@ -382,13 +387,15 @@ int drm_writeback_set_fb(struct drm_connector_state *conn_state,
 
 int drm_writeback_prepare_job(struct drm_writeback_job *job)
 {
-	struct drm_writeback_connector *connector = job->connector;
+	struct drm_writeback_connector *wb_connector = job->connector;
+	struct drm_connector *connector
+		= drm_writeback_to_connector(wb_connector);
 	const struct drm_connector_helper_funcs *funcs =
-		connector->base.helper_private;
+		connector->helper_private;
 	int ret;
 
 	if (funcs->prepare_writeback_job) {
-		ret = funcs->prepare_writeback_job(connector, job);
+		ret = funcs->prepare_writeback_job(wb_connector, job);
 		if (ret < 0)
 			return ret;
 	}
@@ -434,12 +441,14 @@ EXPORT_SYMBOL(drm_writeback_queue_job);
 
 void drm_writeback_cleanup_job(struct drm_writeback_job *job)
 {
-	struct drm_writeback_connector *connector = job->connector;
+	struct drm_writeback_connector *wb_connector = job->connector;
+	struct drm_connector *connector
+		= drm_writeback_to_connector(wb_connector);
 	const struct drm_connector_helper_funcs *funcs =
-		connector->base.helper_private;
+		connector->helper_private;
 
 	if (job->prepared && funcs->cleanup_writeback_job)
-		funcs->cleanup_writeback_job(connector, job);
+		funcs->cleanup_writeback_job(wb_connector, job);
 
 	if (job->fb)
 		drm_framebuffer_put(job->fb);
@@ -521,8 +530,10 @@ struct dma_fence *
 drm_writeback_get_out_fence(struct drm_writeback_connector *wb_connector)
 {
 	struct dma_fence *fence;
+	struct drm_connector *connector =
+		drm_writeback_to_connector(wb_connector);
 
-	if (WARN_ON(wb_connector->base.connector_type !=
+	if (WARN_ON(connector->connector_type !=
 		    DRM_MODE_CONNECTOR_WRITEBACK))
 		return NULL;
 
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 8f34f4b8183d..da63fdafd9f2 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -1882,6 +1882,61 @@ struct drm_connector_cec {
 	void *data;
 };
 
+/**
+ * struct drm_writeback_connector - DRM writeback connector
+ */
+struct drm_writeback_connector {
+	/**
+	 * @pixel_formats_blob_ptr:
+	 *
+	 * DRM blob property data for the pixel formats list on writeback
+	 * connectors
+	 * See also drm_writeback_connector_init()
+	 */
+	struct drm_property_blob *pixel_formats_blob_ptr;
+
+	/** @job_lock: Protects job_queue */
+	spinlock_t job_lock;
+
+	/**
+	 * @job_queue:
+	 *
+	 * Holds a list of a connector's writeback jobs; the last item is the
+	 * most recent. The first item may be either waiting for the hardware
+	 * to begin writing, or currently being written.
+	 *
+	 * See also: drm_writeback_queue_job() and
+	 * drm_writeback_signal_completion()
+	 */
+	struct list_head job_queue;
+
+	/**
+	 * @fence_context:
+	 *
+	 * timeline context used for fence operations.
+	 */
+	unsigned int fence_context;
+	/**
+	 * @fence_lock:
+	 *
+	 * spinlock to protect the fences in the fence_context.
+	 */
+	spinlock_t fence_lock;
+	/**
+	 * @fence_seqno:
+	 *
+	 * Seqno variable used as monotonic counter for the fences
+	 * created on the connector's timeline.
+	 */
+	unsigned long fence_seqno;
+	/**
+	 * @timeline_name:
+	 *
+	 * The name of the connector's fence timeline.
+	 */
+	char timeline_name[32];
+};
+
 /**
  * struct drm_connector - central DRM connector control structure
  *
@@ -2305,6 +2360,11 @@ struct drm_connector {
 	 * @cec: CEC-related data.
 	 */
 	struct drm_connector_cec cec;
+
+	/**
+	 * @writeback: Writeback related valriables.
+	 */
+	struct drm_writeback_connector writeback;
 };
 
 #define obj_to_connector(x) container_of(x, struct drm_connector, base)
diff --git a/include/drm/drm_writeback.h b/include/drm/drm_writeback.h
index 958466a05e60..2a52b6761797 100644
--- a/include/drm/drm_writeback.h
+++ b/include/drm/drm_writeback.h
@@ -15,66 +15,6 @@
 #include <drm/drm_encoder.h>
 #include <linux/workqueue.h>
 
-/**
- * struct drm_writeback_connector - DRM writeback connector
- */
-struct drm_writeback_connector {
-	/**
-	 * @base: base drm_connector object
-	 */
-	struct drm_connector base;
-
-	/**
-	 * @pixel_formats_blob_ptr:
-	 *
-	 * DRM blob property data for the pixel formats list on writeback
-	 * connectors
-	 * See also drm_writeback_connector_init()
-	 */
-	struct drm_property_blob *pixel_formats_blob_ptr;
-
-	/** @job_lock: Protects job_queue */
-	spinlock_t job_lock;
-
-	/**
-	 * @job_queue:
-	 *
-	 * Holds a list of a connector's writeback jobs; the last item is the
-	 * most recent. The first item may be either waiting for the hardware
-	 * to begin writing, or currently being written.
-	 *
-	 * See also: drm_writeback_queue_job() and
-	 * drm_writeback_signal_completion()
-	 */
-	struct list_head job_queue;
-
-	/**
-	 * @fence_context:
-	 *
-	 * timeline context used for fence operations.
-	 */
-	unsigned int fence_context;
-	/**
-	 * @fence_lock:
-	 *
-	 * spinlock to protect the fences in the fence_context.
-	 */
-	spinlock_t fence_lock;
-	/**
-	 * @fence_seqno:
-	 *
-	 * Seqno variable used as monotonic counter for the fences
-	 * created on the connector's timeline.
-	 */
-	unsigned long fence_seqno;
-	/**
-	 * @timeline_name:
-	 *
-	 * The name of the connector's fence timeline.
-	 */
-	char timeline_name[32];
-};
-
 /**
  * struct drm_writeback_job - DRM writeback job
  */
@@ -131,10 +71,16 @@ struct drm_writeback_job {
 	void *priv;
 };
 
+static inline struct drm_connector *
+drm_writeback_to_connector(struct drm_writeback_connector *wb_connector)
+{
+	return container_of(wb_connector, struct drm_connector, writeback);
+}
+
 static inline struct drm_writeback_connector *
 drm_connector_to_writeback(struct drm_connector *connector)
 {
-	return container_of(connector, struct drm_writeback_connector, base);
+	return &connector->writeback;
 }
 
 int drm_writeback_connector_init(struct drm_device *dev,
-- 
2.34.1

