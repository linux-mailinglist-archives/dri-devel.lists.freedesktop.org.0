Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A97A551FC1F
	for <lists+dri-devel@lfdr.de>; Mon,  9 May 2022 14:05:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6028110EF50;
	Mon,  9 May 2022 12:05:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2270610EE80;
 Mon,  9 May 2022 12:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652097913; x=1683633913;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CBkr+Ea8nCYUX9AuKEIgdBn+frRHRM3xELIaB/RD7pc=;
 b=iWS8+oZ2lOv+J5f8aooKFBPc+sMYuDq2bM0DWltqciptqqDgXZS/rd6q
 I1oJqvpiZgTtHGgQTiD0c5YvBYwH4Q6tdjNyHh1fmnX9LFucNnGPyvSdC
 JegP3Qe0kfwokeYg6xSU2lGOwLwMer+Xu9e2zaSpiqJNfQvUKVyGUKUpp
 v8yezboHmZ4YLNynGX7wHklKOOjVtvnuZijzsYz/KxPJ2lSgMa9YwPvdY
 8j5qyUpUse0IrEqBhxH2nlgoTqyGEx/g3ag1ZBq8m5UkZo0VJE48yzY8Y
 V6mri0Xtgrhj8sLbk63lob4PPGedqu3pbEz6nF+dPnuFF5txsj9j0OXfj Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10341"; a="267869388"
X-IronPort-AV: E=Sophos;i="5.91,211,1647327600"; d="scan'208";a="267869388"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2022 05:05:12 -0700
X-IronPort-AV: E=Sophos;i="5.91,211,1647327600"; d="scan'208";a="669116231"
Received: from csawicki-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.129.3])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2022 05:05:10 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 20/25] drm/edid: add drm_edid helper for
 drm_detect_monitor_audio()
Date: Mon,  9 May 2022 15:03:19 +0300
Message-Id: <ea33244c473ace1bc72a7e87f97580f00705a683.1652097712.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1652097712.git.jani.nikula@intel.com>
References: <cover.1652097712.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We'll need to propagate drm_edid everywhere.

v2: Handle NULL EDID pointer (Ville, CI)

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 37 ++++++++++++++++++++++---------------
 1 file changed, 22 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index fc74159cd426..f072cfba9dd9 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -5154,19 +5154,7 @@ bool drm_detect_hdmi_monitor(const struct edid *edid)
 }
 EXPORT_SYMBOL(drm_detect_hdmi_monitor);
 
-/**
- * drm_detect_monitor_audio - check monitor audio capability
- * @edid: EDID block to scan
- *
- * Monitor should have CEA extension block.
- * If monitor has 'basic audio', but no CEA audio blocks, it's 'basic
- * audio' only. If there is any audio extension block and supported
- * audio format, assume at least 'basic audio' support, even if 'basic
- * audio' is not defined in EDID.
- *
- * Return: True if the monitor supports audio, false otherwise.
- */
-bool drm_detect_monitor_audio(const struct edid *edid)
+static bool _drm_detect_monitor_audio(const struct drm_edid *drm_edid)
 {
 	struct drm_edid_iter edid_iter;
 	const struct cea_db *db;
@@ -5174,7 +5162,7 @@ bool drm_detect_monitor_audio(const struct edid *edid)
 	const u8 *edid_ext;
 	bool has_audio = false;
 
-	drm_edid_iter_begin(edid, &edid_iter);
+	drm_edid_iter_begin(drm_edid ? drm_edid->edid : NULL, &edid_iter);
 	drm_edid_iter_for_each(edid_ext, &edid_iter) {
 		if (edid_ext[0] == CEA_EXT) {
 			has_audio = edid_ext[3] & EDID_BASIC_AUDIO;
@@ -5189,7 +5177,7 @@ bool drm_detect_monitor_audio(const struct edid *edid)
 		goto end;
 	}
 
-	cea_db_iter_edid_begin(edid, &iter);
+	cea_db_iter_edid_begin(drm_edid ? drm_edid->edid : NULL, &iter);
 	cea_db_iter_for_each(db, &iter) {
 		if (cea_db_tag(db) == CTA_DB_AUDIO) {
 			const u8 *data = cea_db_data(db);
@@ -5207,6 +5195,25 @@ bool drm_detect_monitor_audio(const struct edid *edid)
 end:
 	return has_audio;
 }
+
+/**
+ * drm_detect_monitor_audio - check monitor audio capability
+ * @edid: EDID block to scan
+ *
+ * Monitor should have CEA extension block.
+ * If monitor has 'basic audio', but no CEA audio blocks, it's 'basic
+ * audio' only. If there is any audio extension block and supported
+ * audio format, assume at least 'basic audio' support, even if 'basic
+ * audio' is not defined in EDID.
+ *
+ * Return: True if the monitor supports audio, false otherwise.
+ */
+bool drm_detect_monitor_audio(const struct edid *edid)
+{
+	struct drm_edid drm_edid;
+
+	return _drm_detect_monitor_audio(drm_edid_legacy_init(&drm_edid, edid));
+}
 EXPORT_SYMBOL(drm_detect_monitor_audio);
 
 
-- 
2.30.2

