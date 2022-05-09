Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E3B051FC14
	for <lists+dri-devel@lfdr.de>; Mon,  9 May 2022 14:05:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D88A710EEF4;
	Mon,  9 May 2022 12:05:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9774D10EE68;
 Mon,  9 May 2022 12:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652097898; x=1683633898;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XO01sFGZFgBwjSKmt7DnzUDNl+nCnCuzVQg24cqbuws=;
 b=KDhafAU+iy3MvEPl/GgiWikSw2ef4e2C5BqhZSLz7neHLfSWcg4KqMVd
 68rwOnj0xkOyi5vKcmHcua+Z7E15/qpdTySRXiyHm5/KtdQhnH77G+fs1
 Cq3Tf4WbmsdBIhDdgGY6x2YXADuOo0umwvTQ5L8dyUjpmn6xhJhrT8ZQm
 qcpQuOG6w5T6dhz4/jUyoz4E7s87qhalpd2FdTi9JeG0k6SmI6GVTu9/+
 3qcMF2ykdh/rjIB8sOdKHSGNBut4VfIQAbpquH+QafapgL5jd+NqxlFnk
 D8YxYgMIj3a8l1cJxu4LgVD2I8fxzK8thYO73Cmdo58bQAgCd+YSXD1FP A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10341"; a="332062962"
X-IronPort-AV: E=Sophos;i="5.91,211,1647327600"; d="scan'208";a="332062962"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2022 05:04:58 -0700
X-IronPort-AV: E=Sophos;i="5.91,211,1647327600"; d="scan'208";a="656733121"
Received: from csawicki-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.129.3])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2022 05:04:56 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 17/25] drm/edid: add drm_edid helper for drm_edid_to_sad()
Date: Mon,  9 May 2022 15:03:16 +0300
Message-Id: <14aa1e44caa2e9c1b54c2f2a471d2fd7d3f62d5d.1652097712.git.jani.nikula@intel.com>
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
 drivers/gpu/drm/drm_edid.c | 34 +++++++++++++++++++++-------------
 1 file changed, 21 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 61551ce0db88..dee09359bbc3 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -4972,24 +4972,14 @@ static void drm_edid_to_eld(struct drm_connector *connector,
 		      drm_eld_size(eld), total_sad_count);
 }
 
-/**
- * drm_edid_to_sad - extracts SADs from EDID
- * @edid: EDID to parse
- * @sads: pointer that will be set to the extracted SADs
- *
- * Looks for CEA EDID block and extracts SADs (Short Audio Descriptors) from it.
- *
- * Note: The returned pointer needs to be freed using kfree().
- *
- * Return: The number of found SADs or negative number on error.
- */
-int drm_edid_to_sad(const struct edid *edid, struct cea_sad **sads)
+static int _drm_edid_to_sad(const struct drm_edid *drm_edid,
+			    struct cea_sad **sads)
 {
 	const struct cea_db *db;
 	struct cea_db_iter iter;
 	int count = 0;
 
-	cea_db_iter_edid_begin(edid, &iter);
+	cea_db_iter_edid_begin(drm_edid ? drm_edid->edid : NULL, &iter);
 	cea_db_iter_for_each(db, &iter) {
 		if (cea_db_tag(db) == CTA_DB_AUDIO) {
 			int j;
@@ -5015,6 +5005,24 @@ int drm_edid_to_sad(const struct edid *edid, struct cea_sad **sads)
 
 	return count;
 }
+
+/**
+ * drm_edid_to_sad - extracts SADs from EDID
+ * @edid: EDID to parse
+ * @sads: pointer that will be set to the extracted SADs
+ *
+ * Looks for CEA EDID block and extracts SADs (Short Audio Descriptors) from it.
+ *
+ * Note: The returned pointer needs to be freed using kfree().
+ *
+ * Return: The number of found SADs or negative number on error.
+ */
+int drm_edid_to_sad(const struct edid *edid, struct cea_sad **sads)
+{
+	struct drm_edid drm_edid;
+
+	return _drm_edid_to_sad(drm_edid_legacy_init(&drm_edid, edid), sads);
+}
 EXPORT_SYMBOL(drm_edid_to_sad);
 
 /**
-- 
2.30.2

