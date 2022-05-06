Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2620A51D55D
	for <lists+dri-devel@lfdr.de>; Fri,  6 May 2022 12:12:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 342E710FBA0;
	Fri,  6 May 2022 10:12:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 620CB10FB3C;
 Fri,  6 May 2022 10:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651831929; x=1683367929;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UrFZJIStvkDTUsk1UphtymgPZ2Ky3s7uc5fSZt7se88=;
 b=VHAEHdhmSa7VjQj5/bwoeG/xvGQldt9e3ATHi4XHk6kjeIottOJhfBz8
 Hg8hsg4hT+K7tf/wfXb2Uy/y9TSeH+J3kZFnPdG/aMt42qbbGT9krmBpO
 /9yHnwQzlhZppuAY/A/kL8EEE1NKrwle9xskqv8URWK3atI7No0UuICYI
 9gSJSrQxbYRKUolypPKZH/m3bwg8szS46JZBEXF6J2dpa8pPWevEQaBDa
 ESEsIK1QEHkq5/qf58jK79fykuMUytEh5xA9m4d4AHNnNlHlCIeQl8CzI
 7trnytg8TBiIjTg+PLlw2yM5pwIIl5z+mKaKLx8Q3QSsk0kv+5aGqbqMM A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10338"; a="293631738"
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="293631738"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2022 03:12:09 -0700
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="812320426"
Received: from psikora-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.157.88])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2022 03:12:07 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 17/25] drm/edid: add drm_edid helper for drm_edid_to_sad()
Date: Fri,  6 May 2022 13:10:24 +0300
Message-Id: <b3a5a99b1ec07d9b3b2bb9ccfadbf89768213fc6.1651830939.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1651830938.git.jani.nikula@intel.com>
References: <cover.1651830938.git.jani.nikula@intel.com>
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

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 37 ++++++++++++++++++++++++-------------
 1 file changed, 24 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 2017feecbe1c..52ea187394dd 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -4954,24 +4954,14 @@ static void drm_edid_to_eld(struct drm_connector *connector,
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
+	cea_db_iter_edid_begin(drm_edid->edid, &iter);
 	cea_db_iter_for_each(db, &iter) {
 		if (cea_db_tag(db) == CTA_DB_AUDIO) {
 			int j;
@@ -4997,6 +4987,27 @@ int drm_edid_to_sad(const struct edid *edid, struct cea_sad **sads)
 
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
+	struct drm_edid drm_edid = {
+		.edid = edid,
+		.size = edid_size(edid),
+	};
+
+	return _drm_edid_to_sad(&drm_edid, sads);
+}
 EXPORT_SYMBOL(drm_edid_to_sad);
 
 /**
-- 
2.30.2

