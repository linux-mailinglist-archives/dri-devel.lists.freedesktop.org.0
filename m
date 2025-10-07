Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12C92BC03E4
	for <lists+dri-devel@lfdr.de>; Tue, 07 Oct 2025 07:46:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 377C010E558;
	Tue,  7 Oct 2025 05:46:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hTGCqIic";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62E0C10E541;
 Tue,  7 Oct 2025 05:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759815998; x=1791351998;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sfdHKHKE8aJQSbt6YTQHJT6N3AnLF3LOg9V21AwRg5k=;
 b=hTGCqIic8BDUqyp+0xWuJhyivuSaekzcu+b2NNb9diSRG1n3VsqDAWFM
 cv3HRzNs2qQ5NCU97o7BGaECt+qwLnmiJ/DucDgFbjwiNyf1ofQO6TY0c
 Q3qATBGB0DYiiSsf7P2+QSpQuVz6+WBTy6iI/V74GdMccvfZEe0QWNChF
 6ggYH08oLw+KLzSRDviP07k+57C3zC2dgmuRqGm6tH/c4RZhzzAkWDtxA
 hHXuh9ioCCuEOeAhsWKrqoiGjsVfv7EeRJPna7Zri5r28HE3xPSoN0ZQC
 SCX2Llald2gaLPpZMgzJGX9jbip+sJVqL4Ti7J1HtWf9gSYXwmsP79dHm w==;
X-CSE-ConnectionGUID: SWcHYJ5+S/iOhJ4K4PQPgQ==
X-CSE-MsgGUID: aRTrjm1SRRi46p64hZwXKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11574"; a="61027988"
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="61027988"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 22:46:37 -0700
X-CSE-ConnectionGUID: Q3Zmr/y+RXKKOK6p/BWrpg==
X-CSE-MsgGUID: b1Xg8XO1Qw6eHyzu8W7GWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="180479480"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa008.fm.intel.com with ESMTP; 06 Oct 2025 22:46:28 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, kernel-list@raspberrypi.com,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
Cc: dmitry.baryshkov@oss.qualcomm.com, ankit.k.nautiyal@intel.com,
 arun.r.murthy@intel.com, uma.shankar@intel.com, jani.nikula@intel.com,
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
Subject: [PATCH v2 5/7] drm: writeback: Modify params for
 drm_writeback_get_out_fence
Date: Tue,  7 Oct 2025 11:15:27 +0530
Message-Id: <20251007054528.2900905-6-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251007054528.2900905-1-suraj.kandpal@intel.com>
References: <20251007054528.2900905-1-suraj.kandpal@intel.com>
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

Use drm_connector instead of drm_writeback_connector since it now
resides within drm_connector and also helps make sure
drm_wrtieback_connector is being modified mostly by drm core
provided helpers.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
V1 -> V2: Use &connector->writeback (Dmitry)
---
 drivers/gpu/drm/drm_atomic_uapi.c | 4 +---
 drivers/gpu/drm/drm_writeback.c   | 6 +++---
 include/drm/drm_writeback.h       | 2 +-
 3 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index a102738a8733..c38dfc61fb88 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -1271,7 +1271,6 @@ static int prepare_signaling(struct drm_device *dev,
 	}
 
 	for_each_new_connector_in_state(state, conn, conn_state, i) {
-		struct drm_writeback_connector *wb_conn;
 		struct drm_out_fence_state *f;
 		struct dma_fence *fence;
 		s32 __user *fence_ptr;
@@ -1293,8 +1292,7 @@ static int prepare_signaling(struct drm_device *dev,
 		f[*num_fences].out_fence_ptr = fence_ptr;
 		*fence_state = f;
 
-		wb_conn = &conn->writeback;
-		fence = drm_writeback_get_out_fence(wb_conn);
+		fence = drm_writeback_get_out_fence(conn);
 		if (!fence)
 			return -ENOMEM;
 
diff --git a/drivers/gpu/drm/drm_writeback.c b/drivers/gpu/drm/drm_writeback.c
index da7be54f5b13..da2acb932ac0 100644
--- a/drivers/gpu/drm/drm_writeback.c
+++ b/drivers/gpu/drm/drm_writeback.c
@@ -529,11 +529,11 @@ drm_writeback_signal_completion(struct drm_connector *connector,
 EXPORT_SYMBOL(drm_writeback_signal_completion);
 
 struct dma_fence *
-drm_writeback_get_out_fence(struct drm_writeback_connector *wb_connector)
+drm_writeback_get_out_fence(struct drm_connector *connector)
 {
 	struct dma_fence *fence;
-	struct drm_connector *connector =
-		drm_writeback_to_connector(wb_connector);
+	struct drm_writeback_connector *wb_connector =
+		&connector->writeback;
 
 	if (WARN_ON(connector->connector_type !=
 		    DRM_MODE_CONNECTOR_WRITEBACK))
diff --git a/include/drm/drm_writeback.h b/include/drm/drm_writeback.h
index 5e8ab51c2da4..2afa48ea7c00 100644
--- a/include/drm/drm_writeback.h
+++ b/include/drm/drm_writeback.h
@@ -104,5 +104,5 @@ drm_writeback_signal_completion(struct drm_connector *connector,
 				int status);
 
 struct dma_fence *
-drm_writeback_get_out_fence(struct drm_writeback_connector *wb_connector);
+drm_writeback_get_out_fence(struct drm_connector *connector);
 #endif
-- 
2.34.1

