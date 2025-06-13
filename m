Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 920B6AD907E
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jun 2025 17:01:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFF4D10EA00;
	Fri, 13 Jun 2025 15:01:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="o2hrT2OC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6687410E9EF;
 Fri, 13 Jun 2025 15:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=u8WmZIBhHdOswBUT+/lwCu+2qP2QhixX9cGaN8KCqr4=; b=o2hrT2OCI0Hp2ZHxLZijjm+hPH
 LIt/5L6gPFnVr1gHfOayF0subGNUw2sZUw0Ud9+Ae6snc6zMMU3nusVGUAxOJE04K2cmr6+ZALpDJ
 OqMWkjdlNT48lw5Y/SWlS4CJ3Zg4vSzzavlDwJqMR6QT2yhK4o7XMBMFk8lpATHkntbT8/mmD33oz
 WhA2E16jvVDXs5laW/ZZMpzpKx5r6z9nb6s/QuwIBcSf4anRDWdczpEJ3vrRqTZm/uvcLTxmpf6Cm
 XFVzAOeS6u62vFWn3rfU+3LwXjaiY6lTvZxDfB4VOdDT+S6mhbaBDwT+B4jgBTIIeOdhWAG4V2FUp
 Quo9OxpA==;
Received: from [189.6.13.79] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uQ5ti-00342T-AG; Fri, 13 Jun 2025 17:00:50 +0200
From: Melissa Wen <mwen@igalia.com>
To: Alex Hung <alex.hung@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>, harry.wentland@amd.com,
 sunpeng.li@amd.com, alexander.deucher@amd.com, christian.koenig@amd.com,
 airlied@gmail.com, simona@ffwll.ch, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Michel Daenzer <michel.daenzer@mailbox.org>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
Subject: [PATCH v4 04/14] drm/edid: introduce a helper that gets monitor name
 from drm_edid
Date: Fri, 13 Jun 2025 11:58:06 -0300
Message-ID: <20250613150015.245917-5-mwen@igalia.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250613150015.245917-1-mwen@igalia.com>
References: <20250613150015.245917-1-mwen@igalia.com>
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

Original drm_edid_get_monitor_name encapsulates raw edid in drm_edid and
then call get_monitor_name. AMD still stores the display name for
debugging, but it is migrating to drm_edid, on the other hand,
drm_dp_mst_topology and sil-sii8620 still use the raw edid version.

Split drm_edid_get_monitor_name into two helpers, one that gets monitor
name from raw edid and another from drm_edid. It's temporary and the raw
edid version should be removed later.

v3:
- kernel-doc and commit msg mentionind raw edid stuff is deprecated (jani)
- use drm_edid_legacy_init instead of open coded (jani)
- move drm_edid new func declaration to its section (jani)

Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c |  2 +-
 drivers/gpu/drm/bridge/sil-sii8620.c          |  2 +-
 drivers/gpu/drm/display/drm_dp_mst_topology.c |  2 +-
 drivers/gpu/drm/drm_edid.c                    | 30 +++++++++++++------
 include/drm/drm_edid.h                        |  8 +++--
 5 files changed, 29 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
index b1085f1195f7..514da4d5d300 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
@@ -134,7 +134,7 @@ enum dc_edid_status dm_helpers_parse_edid_caps(
 	edid_caps->manufacture_week = product_id.week_of_manufacture;
 	edid_caps->manufacture_year = product_id.year_of_manufacture;
 
-	drm_edid_get_monitor_name(edid_buf,
+	drm_edid_get_monitor_name(drm_edid,
 				  edid_caps->display_name,
 				  AUDIO_INFO_DISPLAY_NAME_SIZE_IN_CHARS);
 
diff --git a/drivers/gpu/drm/bridge/sil-sii8620.c b/drivers/gpu/drm/bridge/sil-sii8620.c
index 28a2e1ee04b2..c2d60b9c28fd 100644
--- a/drivers/gpu/drm/bridge/sil-sii8620.c
+++ b/drivers/gpu/drm/bridge/sil-sii8620.c
@@ -505,7 +505,7 @@ static void sii8620_identify_sink(struct sii8620 *ctx)
 	else
 		ctx->sink_type = SINK_DVI;
 
-	drm_edid_get_monitor_name(ctx->edid, sink_name, ARRAY_SIZE(sink_name));
+	drm_edid_raw_get_monitor_name(ctx->edid, sink_name, ARRAY_SIZE(sink_name));
 
 	dev_info(dev, "detected sink(type: %s): %s\n",
 		 sink_str[ctx->sink_type], sink_name);
diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
index 3a1f1ffc7b55..b17a602516ee 100644
--- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
@@ -4896,7 +4896,7 @@ static void fetch_monitor_name(struct drm_dp_mst_topology_mgr *mgr,
 	struct edid *mst_edid;
 
 	mst_edid = drm_dp_mst_get_edid(port->connector, mgr, port);
-	drm_edid_get_monitor_name(mst_edid, name, namelen);
+	drm_edid_raw_get_monitor_name(mst_edid, name, namelen);
 	kfree(mst_edid);
 }
 
diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 13bc4c290b17..d5772a3d27f1 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -5575,27 +5575,23 @@ static int get_monitor_name(const struct drm_edid *drm_edid, char name[13])
 }
 
 /**
- * drm_edid_get_monitor_name - fetch the monitor name from the edid
- * @edid: monitor EDID information
+ * drm_edid_get_monitor_name - fetch the monitor name from the drm_edid
+ * @drm_edid: EDID
  * @name: pointer to a character array to hold the name of the monitor
  * @bufsize: The size of the name buffer (should be at least 14 chars.)
  *
  */
-void drm_edid_get_monitor_name(const struct edid *edid, char *name, int bufsize)
+void drm_edid_get_monitor_name(const struct drm_edid *drm_edid, char *name, int bufsize)
 {
 	int name_length = 0;
 
 	if (bufsize <= 0)
 		return;
 
-	if (edid) {
+	if (drm_edid->edid) {
 		char buf[13];
-		struct drm_edid drm_edid = {
-			.edid = edid,
-			.size = edid_size(edid),
-		};
 
-		name_length = min(get_monitor_name(&drm_edid, buf), bufsize - 1);
+		name_length = min(get_monitor_name(drm_edid, buf), bufsize - 1);
 		memcpy(name, buf, name_length);
 	}
 
@@ -5603,6 +5599,22 @@ void drm_edid_get_monitor_name(const struct edid *edid, char *name, int bufsize)
 }
 EXPORT_SYMBOL(drm_edid_get_monitor_name);
 
+/**
+ * drm_edid_raw_get_monitor_name - fetch the monitor name from raw edid
+ * @edid: monitor EDID information
+ * @name: pointer to a character array to hold the name of the monitor
+ * @bufsize: The size of the name buffer (should be at least 14 chars.)
+ *
+ * This function is deprecated. Use drm_edid_get_monitor_name() instead.
+ */
+void drm_edid_raw_get_monitor_name(const struct edid *edid, char *name, int bufsize)
+{
+	struct drm_edid drm_edid;
+
+	drm_edid_get_monitor_name(drm_edid_legacy_init(&drm_edid, edid), name, bufsize);
+}
+EXPORT_SYMBOL(drm_edid_raw_get_monitor_name);
+
 static void clear_eld(struct drm_connector *connector)
 {
 	mutex_lock(&connector->eld_mutex);
diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
index eaac5e665892..960592167486 100644
--- a/include/drm/drm_edid.h
+++ b/include/drm/drm_edid.h
@@ -441,8 +441,8 @@ int drm_add_modes_noedid(struct drm_connector *connector,
 
 int drm_edid_header_is_valid(const void *edid);
 bool drm_edid_is_valid(struct edid *edid);
-void drm_edid_get_monitor_name(const struct edid *edid, char *name,
-			       int buflen);
+void drm_edid_raw_get_monitor_name(const struct edid *edid, char *name,
+				   int bufsize);
 struct drm_display_mode *drm_mode_find_dmt(struct drm_device *dev,
 					   int hsize, int vsize, int fresh,
 					   bool rb);
@@ -476,5 +476,7 @@ void drm_edid_print_product_id(struct drm_printer *p,
 u32 drm_edid_get_panel_id(const struct drm_edid *drm_edid);
 bool drm_edid_match(const struct drm_edid *drm_edid,
 		    const struct drm_edid_ident *ident);
-
+void drm_edid_get_monitor_name(const struct drm_edid *drm_edid,
+			       char *name,
+			       int bufsize);
 #endif /* __DRM_EDID_H__ */
-- 
2.47.2

