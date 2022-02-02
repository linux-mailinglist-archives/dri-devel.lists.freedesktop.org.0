Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CC9F4A6CA6
	for <lists+dri-devel@lfdr.de>; Wed,  2 Feb 2022 09:08:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 018BE10F9A0;
	Wed,  2 Feb 2022 08:08:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D96A510F9A4;
 Wed,  2 Feb 2022 08:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643789303; x=1675325303;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=aAdYZR2x1c+cQ9tFtkg20dT/K5jLv5l9CIBh/uaUOGU=;
 b=Ed4qahXJJU0TrmwWbsAG37S3GCiOvgnSP63IT0JKR4cpsxDQ6FkRdADJ
 tm7C/SN0abO0DhsntR+rvQCknMHy6u+3QcgA7Hzldkz+3qLlIUIudwkDD
 Vgy8T5V4ZEBMeWud8vWXsG2DeI62Y5VmZSQ6fu7GPpgvlG8fzOWaX1u09
 LeUWscrflq1YbhdRtOh2Riro7Kq1bBCJAqeKihTCf9Gj3+1PP2q/AXeeT
 Pj9sgwhl3itGo2pO5/ntGGI6B5er7eOIoOfXY440hpHRxN5Nmxf39w1ao
 N82wEP6K0jn9ec0m3kgdd2Wbg/zXx7aPGRBJaDWBT6jjQZQb19GLQBWMv g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10245"; a="246699343"
X-IronPort-AV: E=Sophos;i="5.88,336,1635231600"; d="scan'208";a="246699343"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2022 00:08:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,336,1635231600"; d="scan'208";a="771367962"
Received: from srr4-3-linux-116-skandpal.iind.intel.com ([10.190.238.57])
 by fmsmga005.fm.intel.com with ESMTP; 02 Feb 2022 00:08:19 -0800
From: Kandpal Suraj <suraj.kandpal@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 1/6] drm: add writeback pointers to drm_connector
Date: Wed,  2 Feb 2022 13:46:57 +0530
Message-Id: <20220202081702.22119-1-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220111101801.28310-1-suraj.kandpal@intel.com>
References: <20220111101801.28310-1-suraj.kandpal@intel.com>
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
Cc: Kandpal Suraj <suraj.kandpal@intel.com>, carsten.haitzler@arm.com,
 jani.nikula@intel.com, quic_abhinavk@quicinc.com,
 laurent.pinchart@ideasonboard.com, dmitry.baryshkov@linaro.org,
 arun.r.murthy@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Changing drm_connector and drm_encoder feilds to pointers in
drm_writeback_connector as the elements of struct
drm_writeback_connector are:
struct drm_writeback_connector {
	struct drm_connector base;
	struct drm_encoder encoder;
Similarly the elements of intel_encoder and intel_connector
are:
struct intel_encoder {
	struct drm_encoder base;

struct intel_connector {
	struct drm_connector base;

The function drm_writeback_connector_init() will initialize the
drm_connector and drm_encoder and attach them as well.
Since the drm_connector/encoder are both struct in
drm_writeback_connector and intel_connector/encoder, we need
one of them to be a pointer so we can reference them or else we
will be pointing to 2 seprate instances.

Usually the struct defined in drm framework pointing to any
struct will be pointer and allocating them and initialization
will be done with the users.
Like struct drm_connector and drm_encoder are part of drm
framework and the users of these such as i915 have included them
in their struct intel_connector and intel_encoder. Likewise
struct drm_writeback_connector is a special connector and hence
is not a user of drm_connector and hence this should be pointers.

Adding drm_writeback_connector to drm_connector so that
writeback_connector can be fetched from drm_connector as the previous
container_of method won't work due to change in the feilds of
drm_connector and drm_encoder in drm_writeback_connector.

Note:The corresponding ripple effect due to the above changes namely in
two drivers as I can see it komeda and vkms have been dealt with in the
upcoming patches of this series.

Signed-off-by: Kandpal Suraj <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/drm_writeback.c | 19 ++++++++++---------
 include/drm/drm_connector.h     |  3 +++
 include/drm/drm_writeback.h     |  6 +++---
 3 files changed, 16 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/drm_writeback.c b/drivers/gpu/drm/drm_writeback.c
index dccf4504f1bb..47238db42363 100644
--- a/drivers/gpu/drm/drm_writeback.c
+++ b/drivers/gpu/drm/drm_writeback.c
@@ -87,7 +87,7 @@ static const char *drm_writeback_fence_get_driver_name(struct dma_fence *fence)
 	struct drm_writeback_connector *wb_connector =
 		fence_to_wb_connector(fence);
 
-	return wb_connector->base.dev->driver->name;
+	return wb_connector->base->dev->driver->name;
 }
 
 static const char *
@@ -177,7 +177,7 @@ int drm_writeback_connector_init(struct drm_device *dev,
 				 const u32 *formats, int n_formats)
 {
 	struct drm_property_blob *blob;
-	struct drm_connector *connector = &wb_connector->base;
+	struct drm_connector *connector = wb_connector->base;
 	struct drm_mode_config *config = &dev->mode_config;
 	int ret = create_writeback_properties(dev);
 
@@ -189,14 +189,15 @@ int drm_writeback_connector_init(struct drm_device *dev,
 	if (IS_ERR(blob))
 		return PTR_ERR(blob);
 
-	drm_encoder_helper_add(&wb_connector->encoder, enc_helper_funcs);
-	ret = drm_encoder_init(dev, &wb_connector->encoder,
+	drm_encoder_helper_add(wb_connector->encoder, enc_helper_funcs);
+	ret = drm_encoder_init(dev, wb_connector->encoder,
 			       &drm_writeback_encoder_funcs,
 			       DRM_MODE_ENCODER_VIRTUAL, NULL);
 	if (ret)
 		goto fail;
 
 	connector->interlace_allowed = 0;
+	connector->wb_connector = wb_connector;
 
 	ret = drm_connector_init(dev, connector, con_funcs,
 				 DRM_MODE_CONNECTOR_WRITEBACK);
@@ -204,7 +205,7 @@ int drm_writeback_connector_init(struct drm_device *dev,
 		goto connector_fail;
 
 	ret = drm_connector_attach_encoder(connector,
-						&wb_connector->encoder);
+						wb_connector->encoder);
 	if (ret)
 		goto attach_fail;
 
@@ -233,7 +234,7 @@ int drm_writeback_connector_init(struct drm_device *dev,
 attach_fail:
 	drm_connector_cleanup(connector);
 connector_fail:
-	drm_encoder_cleanup(&wb_connector->encoder);
+	drm_encoder_cleanup(wb_connector->encoder);
 fail:
 	drm_property_blob_put(blob);
 	return ret;
@@ -263,7 +264,7 @@ int drm_writeback_prepare_job(struct drm_writeback_job *job)
 {
 	struct drm_writeback_connector *connector = job->connector;
 	const struct drm_connector_helper_funcs *funcs =
-		connector->base.helper_private;
+		connector->base->helper_private;
 	int ret;
 
 	if (funcs->prepare_writeback_job) {
@@ -315,7 +316,7 @@ void drm_writeback_cleanup_job(struct drm_writeback_job *job)
 {
 	struct drm_writeback_connector *connector = job->connector;
 	const struct drm_connector_helper_funcs *funcs =
-		connector->base.helper_private;
+		connector->base->helper_private;
 
 	if (job->prepared && funcs->cleanup_writeback_job)
 		funcs->cleanup_writeback_job(connector, job);
@@ -401,7 +402,7 @@ drm_writeback_get_out_fence(struct drm_writeback_connector *wb_connector)
 {
 	struct dma_fence *fence;
 
-	if (WARN_ON(wb_connector->base.connector_type !=
+	if (WARN_ON(wb_connector->base->connector_type !=
 		    DRM_MODE_CONNECTOR_WRITEBACK))
 		return NULL;
 
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 64cf5f88c05b..fa06faeb7844 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -44,6 +44,7 @@ struct drm_printer;
 struct drm_privacy_screen;
 struct edid;
 struct i2c_adapter;
+struct drm_writeback_connector;
 
 enum drm_connector_force {
 	DRM_FORCE_UNSPECIFIED,
@@ -1539,6 +1540,8 @@ struct drm_connector {
 	 */
 	struct drm_encoder *encoder;
 
+	struct drm_writeback_connector *wb_connector;
+
 #define MAX_ELD_BYTES	128
 	/** @eld: EDID-like data, if present */
 	uint8_t eld[MAX_ELD_BYTES];
diff --git a/include/drm/drm_writeback.h b/include/drm/drm_writeback.h
index 9697d2714d2a..078c9907219c 100644
--- a/include/drm/drm_writeback.h
+++ b/include/drm/drm_writeback.h
@@ -22,7 +22,7 @@ struct drm_writeback_connector {
 	/**
 	 * @base: base drm_connector object
 	 */
-	struct drm_connector base;
+	struct drm_connector *base;
 
 	/**
 	 * @encoder: Internal encoder used by the connector to fulfill
@@ -31,7 +31,7 @@ struct drm_writeback_connector {
 	 * by passing the @enc_funcs parameter to drm_writeback_connector_init()
 	 * function.
 	 */
-	struct drm_encoder encoder;
+	struct drm_encoder *encoder;
 
 	/**
 	 * @pixel_formats_blob_ptr:
@@ -143,7 +143,7 @@ struct drm_writeback_job {
 static inline struct drm_writeback_connector *
 drm_connector_to_writeback(struct drm_connector *connector)
 {
-	return container_of(connector, struct drm_writeback_connector, base);
+	return connector->wb_connector;
 }
 
 int drm_writeback_connector_init(struct drm_device *dev,
-- 
2.17.1

