Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F06CC17CCF0
	for <lists+dri-devel@lfdr.de>; Sat,  7 Mar 2020 09:42:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB5F06E0F9;
	Sat,  7 Mar 2020 08:42:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA3FA6E0F9;
 Sat,  7 Mar 2020 08:42:15 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Mar 2020 00:42:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,525,1574150400"; d="scan'208";a="230335276"
Received: from pktinlab.iind.intel.com ([10.66.253.121])
 by orsmga007.jf.intel.com with ESMTP; 07 Mar 2020 00:42:09 -0800
From: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
To: emil.velikov@collabora.com, lyude@redhat.com, jani.nikula@linux.intel.com,
 daniel@ffwll.ch, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>,
 Ben Skeggs <bskeggs@redhat.com>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "David (ChunMing) Zhou" <David1.Zhou@amd.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Sean Paul <seanpaul@chromium.org>,
 Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>,
 Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 5/5] drm: Remove drm dp mst destroy_connector callbacks
Date: Sat,  7 Mar 2020 14:00:23 +0530
Message-Id: <20200307083023.76498-6-pankaj.laxminarayan.bharadiya@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200307083023.76498-1-pankaj.laxminarayan.bharadiya@intel.com>
References: <20200307083023.76498-1-pankaj.laxminarayan.bharadiya@intel.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm_dp_mst_topology_mgr_cbs.destroy_connector callbacks are identical
amongst every driver and don't do anything other than cleaning up the
connector((drm_connector_unregister()/drm_connector_put())) except for
amdgpu_dm driver where some amdgpu_dm specific code in there.

This connector cleaning up is now being handled in the drm core so
driver destroy_connector callbacks are not needed (except for
amdgpu_dm) hence remove them.

Removal is done with below sementic patch:

@r1@
identifier func, E;
@@
struct drm_dp_mst_topology_cbs E = {
	...,
-        .destroy_connector = func
};

@delete depends on r1@
identifier r1.func;
@@
- static void func(...){...}

Signed-off-by: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
Suggested-by: Emil Velikov <emil.velikov@collabora.com>
Suggested-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/i915/display/intel_dp_mst.c | 10 ----------
 drivers/gpu/drm/nouveau/dispnv50/disp.c     | 12 ------------
 drivers/gpu/drm/radeon/radeon_dp_mst.c      | 11 -----------
 3 files changed, 33 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index c6574a0a15b9..a47d14b0c140 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -719,18 +719,8 @@ static struct drm_connector *intel_dp_add_mst_connector(struct drm_dp_mst_topolo
 	return NULL;
 }
 
-static void intel_dp_destroy_mst_connector(struct drm_dp_mst_topology_mgr *mgr,
-					   struct drm_connector *connector)
-{
-	DRM_DEBUG_KMS("[CONNECTOR:%d:%s]\n", connector->base.id, connector->name);
-	drm_connector_unregister(connector);
-
-	drm_connector_put(connector);
-}
-
 static const struct drm_dp_mst_topology_cbs mst_cbs = {
 	.add_connector = intel_dp_add_mst_connector,
-	.destroy_connector = intel_dp_destroy_mst_connector,
 };
 
 static struct intel_dp_mst_encoder *
diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index 4e3917073797..4d1c58468dbc 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -1256,17 +1256,6 @@ nv50_mstm_prepare(struct nv50_mstm *mstm)
 	}
 }
 
-static void
-nv50_mstm_destroy_connector(struct drm_dp_mst_topology_mgr *mgr,
-			    struct drm_connector *connector)
-{
-	struct nv50_mstc *mstc = nv50_mstc(connector);
-
-	drm_connector_unregister(&mstc->connector);
-
-	drm_connector_put(&mstc->connector);
-}
-
 static struct drm_connector *
 nv50_mstm_add_connector(struct drm_dp_mst_topology_mgr *mgr,
 			struct drm_dp_mst_port *port, const char *path)
@@ -1285,7 +1274,6 @@ nv50_mstm_add_connector(struct drm_dp_mst_topology_mgr *mgr,
 static const struct drm_dp_mst_topology_cbs
 nv50_mstm = {
 	.add_connector = nv50_mstm_add_connector,
-	.destroy_connector = nv50_mstm_destroy_connector,
 };
 
 void
diff --git a/drivers/gpu/drm/radeon/radeon_dp_mst.c b/drivers/gpu/drm/radeon/radeon_dp_mst.c
index 795e2df773ae..008308780443 100644
--- a/drivers/gpu/drm/radeon/radeon_dp_mst.c
+++ b/drivers/gpu/drm/radeon/radeon_dp_mst.c
@@ -301,19 +301,8 @@ static struct drm_connector *radeon_dp_add_mst_connector(struct drm_dp_mst_topol
 	return connector;
 }
 
-static void radeon_dp_destroy_mst_connector(struct drm_dp_mst_topology_mgr *mgr,
-					    struct drm_connector *connector)
-{
-	drm_connector_unregister(connector);
-	drm_connector_cleanup(connector);
-
-	kfree(connector);
-	DRM_DEBUG_KMS("\n");
-}
-
 static const struct drm_dp_mst_topology_cbs mst_cbs = {
 	.add_connector = radeon_dp_add_mst_connector,
-	.destroy_connector = radeon_dp_destroy_mst_connector,
 };
 
 static struct
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
