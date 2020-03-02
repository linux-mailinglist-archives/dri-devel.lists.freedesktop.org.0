Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB09D175B37
	for <lists+dri-devel@lfdr.de>; Mon,  2 Mar 2020 14:08:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCAFD6E282;
	Mon,  2 Mar 2020 13:08:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A68936E27A;
 Mon,  2 Mar 2020 13:08:55 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Mar 2020 05:08:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,507,1574150400"; d="scan'208";a="319059297"
Received: from pktinlab.iind.intel.com ([10.66.253.121])
 by orsmga001.jf.intel.com with ESMTP; 02 Mar 2020 05:08:52 -0800
From: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
To: jani.nikula@linux.intel.com, daniel@ffwll.ch,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "David (ChunMing) Zhou" <David1.Zhou@amd.com>,
 David Airlie <airlied@linux.ie>
Subject: [PATCH 2/9] drm/radeon: remove radeon_fb_{add,
 remove}_connector functions
Date: Mon,  2 Mar 2020 18:26:42 +0530
Message-Id: <20200302125649.61443-3-pankaj.laxminarayan.bharadiya@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200302125649.61443-1-pankaj.laxminarayan.bharadiya@intel.com>
References: <20200302125649.61443-1-pankaj.laxminarayan.bharadiya@intel.com>
MIME-Version: 1.0
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
Cc: pankaj.laxminarayan.bharadiya@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm_fb_helper_{add,remove}_one_connector() are dummy functions now
and serve no purpose. Hence remove their calls.

This is the preparatory step for removing the
drm_fb_helper_{add,remove}_one_connector() functions from
drm_fb_helper.h

Signed-off-by: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
---
 drivers/gpu/drm/radeon/radeon_dp_mst.c | 10 ----------
 drivers/gpu/drm/radeon/radeon_fb.c     | 12 ------------
 drivers/gpu/drm/radeon/radeon_mode.h   |  3 ---
 3 files changed, 25 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_dp_mst.c b/drivers/gpu/drm/radeon/radeon_dp_mst.c
index 28eef9282874..5a9fb0ad175a 100644
--- a/drivers/gpu/drm/radeon/radeon_dp_mst.c
+++ b/drivers/gpu/drm/radeon/radeon_dp_mst.c
@@ -303,23 +303,13 @@ static struct drm_connector *radeon_dp_add_mst_connector(struct drm_dp_mst_topol
 
 static void radeon_dp_register_mst_connector(struct drm_connector *connector)
 {
-	struct drm_device *dev = connector->dev;
-	struct radeon_device *rdev = dev->dev_private;
-
-	radeon_fb_add_connector(rdev, connector);
-
 	drm_connector_register(connector);
 }
 
 static void radeon_dp_destroy_mst_connector(struct drm_dp_mst_topology_mgr *mgr,
 					    struct drm_connector *connector)
 {
-	struct radeon_connector *master = container_of(mgr, struct radeon_connector, mst_mgr);
-	struct drm_device *dev = master->base.dev;
-	struct radeon_device *rdev = dev->dev_private;
-
 	drm_connector_unregister(connector);
-	radeon_fb_remove_connector(rdev, connector);
 	drm_connector_cleanup(connector);
 
 	kfree(connector);
diff --git a/drivers/gpu/drm/radeon/radeon_fb.c b/drivers/gpu/drm/radeon/radeon_fb.c
index 85548cf2529a..1c02cd771d52 100644
--- a/drivers/gpu/drm/radeon/radeon_fb.c
+++ b/drivers/gpu/drm/radeon/radeon_fb.c
@@ -403,15 +403,3 @@ bool radeon_fbdev_robj_is_fb(struct radeon_device *rdev, struct radeon_bo *robj)
 		return true;
 	return false;
 }
-
-void radeon_fb_add_connector(struct radeon_device *rdev, struct drm_connector *connector)
-{
-	if (rdev->mode_info.rfbdev)
-		drm_fb_helper_add_one_connector(&rdev->mode_info.rfbdev->helper, connector);
-}
-
-void radeon_fb_remove_connector(struct radeon_device *rdev, struct drm_connector *connector)
-{
-	if (rdev->mode_info.rfbdev)
-		drm_fb_helper_remove_one_connector(&rdev->mode_info.rfbdev->helper, connector);
-}
diff --git a/drivers/gpu/drm/radeon/radeon_mode.h b/drivers/gpu/drm/radeon/radeon_mode.h
index 629567da29f1..c7f223743d46 100644
--- a/drivers/gpu/drm/radeon/radeon_mode.h
+++ b/drivers/gpu/drm/radeon/radeon_mode.h
@@ -986,9 +986,6 @@ bool radeon_fbdev_robj_is_fb(struct radeon_device *rdev, struct radeon_bo *robj)
 
 void radeon_crtc_handle_vblank(struct radeon_device *rdev, int crtc_id);
 
-void radeon_fb_add_connector(struct radeon_device *rdev, struct drm_connector *connector);
-void radeon_fb_remove_connector(struct radeon_device *rdev, struct drm_connector *connector);
-
 void radeon_crtc_handle_flip(struct radeon_device *rdev, int crtc_id);
 
 int radeon_align_pitch(struct radeon_device *rdev, int width, int bpp, bool tiled);
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
