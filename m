Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AFA8B11796
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jul 2025 07:04:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A16F10E423;
	Fri, 25 Jul 2025 05:04:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i/lXGYg4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D82910E41D;
 Fri, 25 Jul 2025 05:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753419863; x=1784955863;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gsx64ULxlvfSGnVnONmBFIQLsSs0qJlOuiWlo+pfZB8=;
 b=i/lXGYg4QKyKj/XSZ/iFEFtCV6zBk6aat2vX+7qBAvPt4VSQZdwMVGSo
 /kbWGLgB94/ndbYavH8qBAqn2tqZcN5Wl3nmQ7DzRheiFz40XpTzlxyAW
 uT0nV7K2Lp/7I/izGvvGQVH0LFr0DUUzZpJJs75772vIdkRQk7zbfUdpb
 sVOaPZPqE/174f4I+cMEb8Cwm2keL6lOJ6MEGWmfwgcwUvYk8vLdH5QJv
 YWJk1AdB3recAkQcrJLxoglwtIrPIq4LMXfUQnYsfpEiDInoVfNMLdpeb
 GWUs8UP1Hf3vNKKe5c7TWUX6ZbnR8+Z0bvt103S3qKMH/Bv8Ihx5jNhzD g==;
X-CSE-ConnectionGUID: FWQW4PsDQJm0OMMhgRVSNQ==
X-CSE-MsgGUID: Ap2XxjljRTWgF2FxrdFeXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="78299517"
X-IronPort-AV: E=Sophos;i="6.16,338,1744095600"; d="scan'208";a="78299517"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2025 22:04:23 -0700
X-CSE-ConnectionGUID: Rwjrh9c+THaIuK1qNn74Eg==
X-CSE-MsgGUID: d+dkbyS4SoCjI0FbUkSDag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,338,1744095600"; d="scan'208";a="160956494"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa009.fm.intel.com with ESMTP; 24 Jul 2025 22:04:20 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, arun.r.murthy@intel.com, uma.shankar@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 03/28] drm/writeback: Define function to get drm_connector
 from writeback
Date: Fri, 25 Jul 2025 10:33:44 +0530
Message-Id: <20250725050409.2687242-4-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250725050409.2687242-1-suraj.kandpal@intel.com>
References: <20250725050409.2687242-1-suraj.kandpal@intel.com>
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

Now that drm_connector may not always be embedded within
drm_writeback_connector, let's define a function which either uses
the writeback helper hook that returns the drm_connector associated
with the drm_writeback_connector or just return the drm_connector
embedded inside drm_writeback_connector if the helper hook is not
present. Lets use this function and call it whenever
drm_connector is required mostly when connector helper private funcs
need to be fetched.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/drm_writeback.c | 33 ++++++++++++++++++++++++++-------
 1 file changed, 26 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/drm_writeback.c b/drivers/gpu/drm/drm_writeback.c
index e9f7123270d6..d610cb827975 100644
--- a/drivers/gpu/drm/drm_writeback.c
+++ b/drivers/gpu/drm/drm_writeback.c
@@ -120,6 +120,18 @@ drm_connector_to_writeback(struct drm_connector *connector)
 }
 EXPORT_SYMBOL(drm_connector_to_writeback);
 
+static struct drm_connector *
+drm_connector_from_writeback(struct drm_writeback_connector *wb_connector)
+{
+	const struct drm_writeback_connector_helper_funcs *funcs =
+		wb_connector->helper_private;
+
+	if (funcs && funcs->get_connector_from_writeback)
+		return funcs->get_connector_from_writeback(wb_connector);
+
+	return &wb_connector->base;
+}
+
 static int create_writeback_properties(struct drm_device *dev)
 {
 	struct drm_property *prop;
@@ -478,6 +490,7 @@ drm_writeback_connector_init_with_conn(struct drm_device *dev, struct drm_connec
 	if (ret)
 		goto connector_fail;
 
+	drm_writeback_connector_helper_add(wb_connector, wb_funcs);
 	INIT_LIST_HEAD(&wb_connector->job_queue);
 	spin_lock_init(&wb_connector->job_lock);
 
@@ -527,13 +540,15 @@ int drm_writeback_set_fb(struct drm_connector_state *conn_state,
 
 int drm_writeback_prepare_job(struct drm_writeback_job *job)
 {
-	struct drm_writeback_connector *connector = job->connector;
+	struct drm_writeback_connector *wb_connector = job->connector;
+	struct drm_connector *connector =
+		drm_connector_from_writeback(wb_connector);
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
@@ -579,12 +594,14 @@ EXPORT_SYMBOL(drm_writeback_queue_job);
 
 void drm_writeback_cleanup_job(struct drm_writeback_job *job)
 {
-	struct drm_writeback_connector *connector = job->connector;
+	struct drm_writeback_connector *wb_connector = job->connector;
+	struct drm_connector *connector =
+		drm_connector_from_writeback(wb_connector);
 	const struct drm_connector_helper_funcs *funcs =
-		connector->base.helper_private;
+		connector->helper_private;
 
 	if (job->prepared && funcs->cleanup_writeback_job)
-		funcs->cleanup_writeback_job(connector, job);
+		funcs->cleanup_writeback_job(wb_connector, job);
 
 	if (job->fb)
 		drm_framebuffer_put(job->fb);
@@ -665,9 +682,11 @@ EXPORT_SYMBOL(drm_writeback_signal_completion);
 struct dma_fence *
 drm_writeback_get_out_fence(struct drm_writeback_connector *wb_connector)
 {
+	struct drm_connector *connector =
+		drm_connector_from_writeback(wb_connector);
 	struct dma_fence *fence;
 
-	if (WARN_ON(wb_connector->base.connector_type !=
+	if (WARN_ON(connector->connector_type !=
 		    DRM_MODE_CONNECTOR_WRITEBACK))
 		return NULL;
 
-- 
2.34.1

