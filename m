Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B665FB2037A
	for <lists+dri-devel@lfdr.de>; Mon, 11 Aug 2025 11:28:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0558F10E3E8;
	Mon, 11 Aug 2025 09:28:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K8T+Njk8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FF8410E3E7;
 Mon, 11 Aug 2025 09:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754904516; x=1786440516;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1wt9TGKVHpEOGWtUwQvSvwHMqVCuk5olmwKqlio6imU=;
 b=K8T+Njk88DEMKkuVJeAS4KmPU4nATxPO2Vm84APYZqwBaQl67fUIvbHf
 NXrVztZ96rkmKn8mJxXiwYGg9k65j2eCbUbp4sDhTg/mOAvJMysrqTblU
 g3j++9MKI3WQj4EuI1Y4LxGoEhAJpdE0skQ9shdnfagMqgvJ9iF9L8wof
 cgtKYGNPHPysua5SnX/Vc1T18tiKR2f7Aompoi1sb/BdF5UibpqBNw+N8
 kTZh2GbevjDfSknioducRFi0n0amXTYBvAF0rGg3PDr1+FGWWWMPjljoI
 B8yUAFbIhHUy2WgbSDaCvtd8vPFU8T9jWsqmcoj3JXp4/PEXMS2iME0hQ w==;
X-CSE-ConnectionGUID: BVKuqGFMTpuZO8WunvvXSA==
X-CSE-MsgGUID: qAnuYAXLR7mT1DQs+y8bpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="57218086"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; d="scan'208";a="57218086"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2025 02:28:35 -0700
X-CSE-ConnectionGUID: b6XwttqyRhq1/Pa2QhuxWg==
X-CSE-MsgGUID: CV794O3JQbKX4G/bQVO+gA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; d="scan'208";a="165860484"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by orviesa007.jf.intel.com with ESMTP; 11 Aug 2025 02:28:25 -0700
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
Subject: [RFC PATCH 6/8] drm/vkms: Adapt vkms writeback to new
 drm_writeback_connector
Date: Mon, 11 Aug 2025 14:57:05 +0530
Message-Id: <20250811092707.3986802-7-suraj.kandpal@intel.com>
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

Now that drm_writeback_connector is embedded with the drm_connector
adapt the vkms writeback functionality to this changes. This
includes changing the drm_writeback_connector to be changed to
drm_connector within the vkms_output.
Some other changes are done which are a result of the all the above
changes mentioned.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/vkms/vkms_composer.c  |  2 +-
 drivers/gpu/drm/vkms/vkms_drv.h       |  2 +-
 drivers/gpu/drm/vkms/vkms_writeback.c | 15 +++++++++------
 3 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index fa269d279e25..b5f20637121c 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -543,7 +543,7 @@ void vkms_composer_worker(struct work_struct *work)
 		return;
 
 	if (wb_pending) {
-		drm_writeback_signal_completion(&out->wb_connector, 0);
+		drm_writeback_signal_completion(&out->connector.writeback, 0);
 		spin_lock_irq(&out->composer_lock);
 		crtc_state->wb_pending = false;
 		spin_unlock_irq(&out->composer_lock);
diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index 8013c31efe3b..2e58a06c9ad8 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -213,7 +213,7 @@ struct vkms_crtc_state {
  */
 struct vkms_output {
 	struct drm_crtc crtc;
-	struct drm_writeback_connector wb_connector;
+	struct drm_connector connector;
 	struct drm_encoder wb_encoder;
 	struct hrtimer vblank_hrtimer;
 	ktime_t period_ns;
diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c b/drivers/gpu/drm/vkms/vkms_writeback.c
index 45d69a3b85f6..13c2a5c8f57a 100644
--- a/drivers/gpu/drm/vkms/vkms_writeback.c
+++ b/drivers/gpu/drm/vkms/vkms_writeback.c
@@ -102,13 +102,16 @@ static int vkms_wb_prepare_job(struct drm_writeback_connector *wb_connector,
 	return ret;
 }
 
-static void vkms_wb_cleanup_job(struct drm_writeback_connector *connector,
+static void vkms_wb_cleanup_job(struct drm_writeback_connector *wb_connector,
 				struct drm_writeback_job *job)
 {
 	struct vkms_writeback_job *vkmsjob = job->priv;
+	struct drm_connector *connector = container_of(wb_connector,
+						       struct drm_connector,
+						       writeback);
 	struct vkms_output *vkms_output = container_of(connector,
 						       struct vkms_output,
-						       wb_connector);
+						       connector);
 
 	if (!job->fb)
 		return;
@@ -127,8 +130,8 @@ static void vkms_wb_atomic_commit(struct drm_connector *conn,
 	struct drm_connector_state *connector_state = drm_atomic_get_new_connector_state(state,
 											 conn);
 	struct vkms_output *output = drm_crtc_to_vkms_output(connector_state->crtc);
-	struct drm_writeback_connector *wb_conn = &output->wb_connector;
-	struct drm_connector_state *conn_state = wb_conn->base.state;
+	struct drm_writeback_connector *wb_conn = &output->connector.writeback;
+	struct drm_connector_state *conn_state = output->connector.state;
 	struct vkms_crtc_state *crtc_state = output->composer_state;
 	struct drm_framebuffer *fb = connector_state->writeback_job->fb;
 	u16 crtc_height = crtc_state->base.mode.vdisplay;
@@ -166,7 +169,7 @@ static const struct drm_connector_helper_funcs vkms_wb_conn_helper_funcs = {
 int vkms_enable_writeback_connector(struct vkms_device *vkmsdev,
 				    struct vkms_output *vkms_output)
 {
-	struct drm_writeback_connector *wb = &vkms_output->wb_connector;
+	struct drm_writeback_connector *wb = &vkms_output->connector.writeback;
 	int ret;
 
 	ret = drmm_encoder_init(&vkmsdev->drm, &vkms_output->wb_encoder,
@@ -177,7 +180,7 @@ int vkms_enable_writeback_connector(struct vkms_device *vkmsdev,
 	vkms_output->wb_encoder.possible_clones |=
 		drm_encoder_mask(&vkms_output->wb_encoder);
 
-	drm_connector_helper_add(&wb->base, &vkms_wb_conn_helper_funcs);
+	drm_connector_helper_add(&vkms_output->connector, &vkms_wb_conn_helper_funcs);
 
 	return drmm_writeback_connector_init(&vkmsdev->drm, wb,
 					     &vkms_wb_connector_funcs,
-- 
2.34.1

