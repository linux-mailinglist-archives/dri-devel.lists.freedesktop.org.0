Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +GOwKvLonmk/XwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 13:20:02 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A9821972DB
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 13:20:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 975C610E75D;
	Wed, 25 Feb 2026 12:20:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="FtMMzfaY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24D1B10E75D;
 Wed, 25 Feb 2026 12:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=e1SibA/Ve6OpNSHuevvuSOeVaTbKhMQbccBOMaUKm88=; b=FtMMzfaYKwiZC+L2hRvovlYMxo
 dQa8k5/FQebz20ZOI1Uav7dfsuWEuthXo6h2rS6GY/aotZKPcBOJ3FCmJ0a1vpox7nuLuKBXQ+APP
 i/4lC6DHydQjAjydmyt7HJnBxzP3iC5Uc2QBfDos3J0Vi9U6IVzClMR+4h+Mtfg9s7OWFhyR71fH8
 lx5Z9IyyDdX5tFvg3B9+7We2jbi/cFkPO6a6+YmVnLDdZ1jvnn7ONjaV1ZEjDX+jawaClfa5SBovX
 KfkR3C8cAGz2+Ah2ZW9WHYilveRg5KwbD0qIsndKR3Tn4+Uah2sm29qfRVpgjIUuwfGij1uIPyGeZ
 kss38XWA==;
Received: from [186.208.68.119] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vvDrj-005DpP-HY; Wed, 25 Feb 2026 13:19:43 +0100
From: Melissa Wen <mwen@igalia.com>
To: airlied@gmail.com, alexander.deucher@amd.com, alex.hung@amd.com,
 andrzej.hajda@intel.com, christian.koenig@amd.com, harry.wentland@amd.com,
 jernej.skrabec@gmail.com, jonas@kwiboo.se,
 Laurent.pinchart@ideasonboard.com, maarten.lankhorst@linux.intel.com,
 mario.limonciello@amd.com, mripard@kernel.org, mwen@igalia.com,
 neil.armstrong@linaro.org, rfoss@kernel.org, simona@ffwll.ch,
 siqueira@igalia.com, sunpeng.li@amd.com, tzimmermann@suse.de
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Michel Daenzer <michel.daenzer@mailbox.org>,
 =?UTF-8?q?Timur=20Krist=C3=B3f?= <timur.kristof@gmail.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 kernel-dev@igalia.com
Subject: [PATCH v8 5/8] drm/edid: introduce a helper that gets monitor name
 from drm_edid
Date: Wed, 25 Feb 2026 09:04:34 -0300
Message-ID: <20260225121903.236115-6-mwen@igalia.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260225121903.236115-1-mwen@igalia.com>
References: <20260225121903.236115-1-mwen@igalia.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_TO(0.00)[gmail.com,amd.com,intel.com,kwiboo.se,ideasonboard.com,linux.intel.com,kernel.org,igalia.com,linaro.org,ffwll.ch,suse.de];
	FREEMAIL_CC(0.00)[linux.intel.com,mailbox.org,gmail.com,lists.freedesktop.org,igalia.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	NEURAL_HAM(-0.00)[-0.715];
	FROM_NEQ_ENVFROM(0.00)[mwen@igalia.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DKIM_TRACE(0.00)[igalia.com:-];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 5A9821972DB
X-Rspamd-Action: no action

Original drm_edid_get_monitor_name encapsulates raw edid in drm_edid and
then call get_monitor_name. AMD still stores the display name for
debugging, but it is migrating to drm_edid, on the other hand,
drm_dp_mst_topology and sil-sii8620 still use the raw edid version.

Split drm_edid_get_monitor_name into two helpers, one that gets monitor
name from raw edid and another from drm_edid. It's temporary and the raw
edid version should be removed later.

Signed-off-by: Melissa Wen <mwen@igalia.com>
---

v3:
- kernel-doc and commit msg mentionind raw edid stuff is deprecated (jani)
- use drm_edid_legacy_init instead of open coded (jani)
- move drm_edid new func declaration to its section (jani)
---
 .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c |  2 +-
 drivers/gpu/drm/bridge/sil-sii8620.c          |  2 +-
 drivers/gpu/drm/display/drm_dp_mst_topology.c |  2 +-
 drivers/gpu/drm/drm_edid.c                    | 30 +++++++++++++------
 include/drm/drm_edid.h                        |  7 +++--
 5 files changed, 29 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
index e553b9cbe179..6a017e9a7bd9 100644
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
index 26bb7710a462..78d676e8ab35 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -5600,27 +5600,23 @@ static int get_monitor_name(const struct drm_edid *drm_edid, char name[13])
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
 
@@ -5628,6 +5624,22 @@ void drm_edid_get_monitor_name(const struct edid *edid, char *name, int bufsize)
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
index 04f7a7f1f108..2aeba6f10e6b 100644
--- a/include/drm/drm_edid.h
+++ b/include/drm/drm_edid.h
@@ -454,8 +454,8 @@ int drm_add_modes_noedid(struct drm_connector *connector,
 
 int drm_edid_header_is_valid(const void *edid);
 bool drm_edid_is_valid(struct edid *edid);
-void drm_edid_get_monitor_name(const struct edid *edid, char *name,
-			       int buflen);
+void drm_edid_raw_get_monitor_name(const struct edid *edid, char *name,
+				   int bufsize);
 struct drm_display_mode *drm_mode_find_dmt(struct drm_device *dev,
 					   int hsize, int vsize, int fresh,
 					   bool rb);
@@ -490,5 +490,8 @@ u32 drm_edid_get_panel_id(const struct drm_edid *drm_edid);
 bool drm_edid_match(const struct drm_edid *drm_edid,
 		    const struct drm_edid_ident *ident);
 bool drm_edid_has_quirk(struct drm_connector *connector, enum drm_edid_quirk quirk);
+void drm_edid_get_monitor_name(const struct drm_edid *drm_edid,
+			       char *name,
+			       int bufsize);
 
 #endif /* __DRM_EDID_H__ */
-- 
2.51.0

