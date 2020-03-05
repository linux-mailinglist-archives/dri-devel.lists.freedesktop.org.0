Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00A9317A50A
	for <lists+dri-devel@lfdr.de>; Thu,  5 Mar 2020 13:16:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C495B6E303;
	Thu,  5 Mar 2020 12:16:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D27416E301;
 Thu,  5 Mar 2020 12:16:16 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Mar 2020 04:16:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,518,1574150400"; d="scan'208";a="352350037"
Received: from pktinlab.iind.intel.com ([10.66.253.121])
 by fmsmga001.fm.intel.com with ESMTP; 05 Mar 2020 04:16:11 -0800
From: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
To: jani.nikula@linux.intel.com, daniel@ffwll.ch,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "David (ChunMing) Zhou" <David1.Zhou@amd.com>,
 David Airlie <airlied@linux.ie>, Mikita Lipski <mikita.lipski@amd.com>,
 Lyude Paul <lyude@redhat.com>,
 Nicholas Kazlauskas <Nicholas.Kazlauskas@amd.com>,
 David Francis <David.Francis@amd.com>,
 Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
Subject: [RESEND PATCH v2 3/7] drm/amdgpu: Remove drm_fb_helper_{add,
 remove}_one_connector calls
Date: Thu,  5 Mar 2020 17:34:30 +0530
Message-Id: <20200305120434.111091-4-pankaj.laxminarayan.bharadiya@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200305120434.111091-1-pankaj.laxminarayan.bharadiya@intel.com>
References: <20200305120434.111091-1-pankaj.laxminarayan.bharadiya@intel.com>
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
Cc: Emil Velikov <emil.velikov@collabora.com>
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
Reviewed-by: Emil Velikov <emil.velikov@collabora.com>
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
---
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
index 0ef0eeb16778..0c4faba8ed28 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
@@ -440,9 +440,6 @@ dm_dp_add_mst_connector(struct drm_dp_mst_topology_mgr *mgr,
 static void dm_dp_destroy_mst_connector(struct drm_dp_mst_topology_mgr *mgr,
 					struct drm_connector *connector)
 {
-	struct amdgpu_dm_connector *master = container_of(mgr, struct amdgpu_dm_connector, mst_mgr);
-	struct drm_device *dev = master->base.dev;
-	struct amdgpu_device *adev = dev->dev_private;
 	struct amdgpu_dm_connector *aconnector = to_amdgpu_dm_connector(connector);
 
 	DRM_INFO("DM_MST: Disabling connector: %p [id: %d] [master: %p]\n",
@@ -457,21 +454,11 @@ static void dm_dp_destroy_mst_connector(struct drm_dp_mst_topology_mgr *mgr,
 	}
 
 	drm_connector_unregister(connector);
-	if (adev->mode_info.rfbdev)
-		drm_fb_helper_remove_one_connector(&adev->mode_info.rfbdev->helper, connector);
 	drm_connector_put(connector);
 }
 
 static void dm_dp_mst_register_connector(struct drm_connector *connector)
 {
-	struct drm_device *dev = connector->dev;
-	struct amdgpu_device *adev = dev->dev_private;
-
-	if (adev->mode_info.rfbdev)
-		drm_fb_helper_add_one_connector(&adev->mode_info.rfbdev->helper, connector);
-	else
-		DRM_ERROR("adev->mode_info.rfbdev is NULL\n");
-
 	drm_connector_register(connector);
 }
 
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
