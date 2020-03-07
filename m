Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 68FF217CCEB
	for <lists+dri-devel@lfdr.de>; Sat,  7 Mar 2020 09:42:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E5806E0E3;
	Sat,  7 Mar 2020 08:42:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B3BC6E0E3;
 Sat,  7 Mar 2020 08:41:59 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Mar 2020 00:41:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,525,1574150400"; d="scan'208";a="230335179"
Received: from pktinlab.iind.intel.com ([10.66.253.121])
 by orsmga007.jf.intel.com with ESMTP; 07 Mar 2020 00:41:51 -0800
From: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
To: emil.velikov@collabora.com, lyude@redhat.com, jani.nikula@linux.intel.com,
 daniel@ffwll.ch, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "David (ChunMing) Zhou" <David1.Zhou@amd.com>,
 David Airlie <airlied@linux.ie>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Ben Skeggs <bskeggs@redhat.com>,
 Mikita Lipski <mikita.lipski@amd.com>,
 Nicholas Kazlauskas <Nicholas.Kazlauskas@amd.com>,
 Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>,
 David Francis <David.Francis@amd.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Sean Paul <sean@poorly.run>, Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 2/5] drm: Remove dp mst register connector callbacks
Date: Sat,  7 Mar 2020 14:00:20 +0530
Message-Id: <20200307083023.76498-3-pankaj.laxminarayan.bharadiya@intel.com>
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

drm_dp_mst_port_add_connector() directly calls the
drm_connector_register() now and
drm_dp_mst_topology_mgr_cbs.register_connector callback is not getting
called anymore.

Hence remove all drm_dp_mst_topology_mgr_cbs.register_connector
callbacks.

This is the preparatory step for removing the
drm_dp_mst_topology_mgr_cbs.register_connector callback hook.

The removal is done with below sementic patch:

@r1@
identifier func, E;
@@
struct drm_dp_mst_topology_cbs E = {
	...,
-        .register_connector = func
};

@delete depends on r1@
identifier r1.func;
@@
- static void func(...){...}

Signed-off-by: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
Suggested-by: Emil Velikov <emil.velikov@collabora.com>
Suggested-by: Lyude Paul <lyude@redhat.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    | 6 ------
 drivers/gpu/drm/i915/display/intel_dp_mst.c                | 6 ------
 drivers/gpu/drm/nouveau/dispnv50/disp.c                    | 7 -------
 drivers/gpu/drm/radeon/radeon_dp_mst.c                     | 6 ------
 4 files changed, 25 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
index 00c8627eb60e..5ee2dc4597f0 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
@@ -458,15 +458,9 @@ static void dm_dp_destroy_mst_connector(struct drm_dp_mst_topology_mgr *mgr,
 	drm_connector_put(connector);
 }
 
-static void dm_dp_mst_register_connector(struct drm_connector *connector)
-{
-	drm_connector_register(connector);
-}
-
 static const struct drm_dp_mst_topology_cbs dm_mst_cbs = {
 	.add_connector = dm_dp_add_mst_connector,
 	.destroy_connector = dm_dp_destroy_mst_connector,
-	.register_connector = dm_dp_mst_register_connector
 };
 
 void amdgpu_dm_initialize_dp_connector(struct amdgpu_display_manager *dm,
diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index d53978ed3c12..c6574a0a15b9 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -719,11 +719,6 @@ static struct drm_connector *intel_dp_add_mst_connector(struct drm_dp_mst_topolo
 	return NULL;
 }
 
-static void intel_dp_register_mst_connector(struct drm_connector *connector)
-{
-	drm_connector_register(connector);
-}
-
 static void intel_dp_destroy_mst_connector(struct drm_dp_mst_topology_mgr *mgr,
 					   struct drm_connector *connector)
 {
@@ -735,7 +730,6 @@ static void intel_dp_destroy_mst_connector(struct drm_dp_mst_topology_mgr *mgr,
 
 static const struct drm_dp_mst_topology_cbs mst_cbs = {
 	.add_connector = intel_dp_add_mst_connector,
-	.register_connector = intel_dp_register_mst_connector,
 	.destroy_connector = intel_dp_destroy_mst_connector,
 };
 
diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index 4e164ad8003f..4e3917073797 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -1267,12 +1267,6 @@ nv50_mstm_destroy_connector(struct drm_dp_mst_topology_mgr *mgr,
 	drm_connector_put(&mstc->connector);
 }
 
-static void
-nv50_mstm_register_connector(struct drm_connector *connector)
-{
-	drm_connector_register(connector);
-}
-
 static struct drm_connector *
 nv50_mstm_add_connector(struct drm_dp_mst_topology_mgr *mgr,
 			struct drm_dp_mst_port *port, const char *path)
@@ -1291,7 +1285,6 @@ nv50_mstm_add_connector(struct drm_dp_mst_topology_mgr *mgr,
 static const struct drm_dp_mst_topology_cbs
 nv50_mstm = {
 	.add_connector = nv50_mstm_add_connector,
-	.register_connector = nv50_mstm_register_connector,
 	.destroy_connector = nv50_mstm_destroy_connector,
 };
 
diff --git a/drivers/gpu/drm/radeon/radeon_dp_mst.c b/drivers/gpu/drm/radeon/radeon_dp_mst.c
index 5a9fb0ad175a..795e2df773ae 100644
--- a/drivers/gpu/drm/radeon/radeon_dp_mst.c
+++ b/drivers/gpu/drm/radeon/radeon_dp_mst.c
@@ -301,11 +301,6 @@ static struct drm_connector *radeon_dp_add_mst_connector(struct drm_dp_mst_topol
 	return connector;
 }
 
-static void radeon_dp_register_mst_connector(struct drm_connector *connector)
-{
-	drm_connector_register(connector);
-}
-
 static void radeon_dp_destroy_mst_connector(struct drm_dp_mst_topology_mgr *mgr,
 					    struct drm_connector *connector)
 {
@@ -318,7 +313,6 @@ static void radeon_dp_destroy_mst_connector(struct drm_dp_mst_topology_mgr *mgr,
 
 static const struct drm_dp_mst_topology_cbs mst_cbs = {
 	.add_connector = radeon_dp_add_mst_connector,
-	.register_connector = radeon_dp_register_mst_connector,
 	.destroy_connector = radeon_dp_destroy_mst_connector,
 };
 
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
