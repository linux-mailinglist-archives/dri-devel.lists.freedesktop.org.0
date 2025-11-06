Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D29CC3C9EC
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 17:56:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 919D810E96B;
	Thu,  6 Nov 2025 16:56:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="B2DOI86F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43E0010E96B;
 Thu,  6 Nov 2025 16:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=RtcNUxngvnYSZYfTEIGIc1TjW+Cfdmve0GDQY1BV9bk=; b=B2DOI86Fp5ETu2SA7Wdu2GRl25
 VJU9tDr4dSB/ohdw0ZQSHGMeIfb6JezB+ztOJzwsfPQurGLMxrL9/N5UHD8aR37ieac94SEVe6mVn
 iV35jW2ZCy2P42RpeKsFK6EdZvlCCC/WZ0WZJvJWDmTVQ6g4OmqewEvaEZysryISM0W3JzFSH0QsO
 JdNXuuN49w7KlOwSlm15+kcDO+jr6aFNT3ETrSFdMV67mqvM+PEDO/X1IAQyxNcBN8fUDKWUPih5D
 QftC9c59zV/lw2MvHVjWByDOXz1B8Us83GJc/FnsAt/1KqdPQraQDC7aJcxG3hLXFBw52q3Qvsm5i
 UsTG0fXg==;
Received: from [186.208.74.26] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vH3HR-0035jh-NC; Thu, 06 Nov 2025 17:56:14 +0100
From: Melissa Wen <mwen@igalia.com>
To: Harry Wentland <harry.wentland@amd.com>, Alex Hung <alex.hung@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>, airlied@gmail.com,
 alexander.deucher@amd.com, andrzej.hajda@intel.com,
 christian.koenig@amd.com, jernej.skrabec@gmail.com, jonas@kwiboo.se,
 Laurent.pinchart@ideasonboard.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, mwen@igalia.com, neil.armstrong@linaro.org,
 rfoss@kernel.org, simona@ffwll.ch, sunpeng.li@amd.com, tzimmermann@suse.de
Cc: Michel Daenzer <michel.daenzer@mailbox.org>,
 Jani Nikula <jani.nikula@linux.intel.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
Subject: [PATCH v7 05/15] drm/edid: introduce a helper that gets monitor name
 from drm_edid
Date: Thu,  6 Nov 2025 13:49:08 -0300
Message-ID: <20251106165536.161662-6-mwen@igalia.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251106165536.161662-1-mwen@igalia.com>
References: <20251106165536.161662-1-mwen@igalia.com>
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
 include/drm/drm_edid.h                        |  7 +++--
 5 files changed, 29 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
index 05e5f51b0a90..632cf2a32a4e 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
@@ -137,7 +137,7 @@ enum dc_edid_status dm_helpers_parse_edid_caps(
 	edid_caps->manufacture_year = product_id.year_of_manufacture;
 	edid_caps->analog = !drm_edid_is_digital(drm_edid);
 
-	drm_edid_get_monitor_name(edid_buf,
+	drm_edid_get_monitor_name(drm_edid,
 				  edid_caps->display_name,
 				  AUDIO_INFO_DISPLAY_NAME_SIZE_IN_CHARS);
 
diff --git a/drivers/gpu/drm/bridge/sil-sii8620.c b/drivers/gpu/drm/bridge/sil-sii8620.c
index 9e48ad39e1cc..891d904a7174 100644
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
index 64e5c176d5cc..14e916bf88d0 100644
--- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
@@ -4892,7 +4892,7 @@ static void fetch_monitor_name(struct drm_dp_mst_topology_mgr *mgr,
 	struct edid *mst_edid;
 
 	mst_edid = drm_dp_mst_get_edid(port->connector, mgr, port);
-	drm_edid_get_monitor_name(mst_edid, name, namelen);
+	drm_edid_raw_get_monitor_name(mst_edid, name, namelen);
 	kfree(mst_edid);
 }
 
diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index e2e85345aa9a..5ed8e683987e 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -5597,27 +5597,23 @@ static int get_monitor_name(const struct drm_edid *drm_edid, char name[13])
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
 
@@ -5625,6 +5621,22 @@ void drm_edid_get_monitor_name(const struct edid *edid, char *name, int bufsize)
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
index 3d1aecfec9b2..44ef3498a169 100644
--- a/include/drm/drm_edid.h
+++ b/include/drm/drm_edid.h
@@ -448,8 +448,8 @@ int drm_add_modes_noedid(struct drm_connector *connector,
 
 int drm_edid_header_is_valid(const void *edid);
 bool drm_edid_is_valid(struct edid *edid);
-void drm_edid_get_monitor_name(const struct edid *edid, char *name,
-			       int buflen);
+void drm_edid_raw_get_monitor_name(const struct edid *edid, char *name,
+				   int bufsize);
 struct drm_display_mode *drm_mode_find_dmt(struct drm_device *dev,
 					   int hsize, int vsize, int fresh,
 					   bool rb);
@@ -484,5 +484,8 @@ u32 drm_edid_get_panel_id(const struct drm_edid *drm_edid);
 bool drm_edid_match(const struct drm_edid *drm_edid,
 		    const struct drm_edid_ident *ident);
 bool drm_edid_has_quirk(struct drm_connector *connector, enum drm_edid_quirk quirk);
+void drm_edid_get_monitor_name(const struct drm_edid *drm_edid,
+			       char *name,
+			       int bufsize);
 
 #endif /* __DRM_EDID_H__ */
-- 
2.51.0

