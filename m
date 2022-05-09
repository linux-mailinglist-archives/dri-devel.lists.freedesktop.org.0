Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 717BF51FC1B
	for <lists+dri-devel@lfdr.de>; Mon,  9 May 2022 14:05:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B470310EF26;
	Mon,  9 May 2022 12:05:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A648C10EEF8;
 Mon,  9 May 2022 12:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652097903; x=1683633903;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=h8iBJUXGwnHpWaWNo2pD5dakHk8nvuh4ZAe9dBCLh88=;
 b=E/9mS9+rFASOhCkwNpVX43zYf8Q0yubEieOs2b5JsJvw3sGXRb6GLGYc
 hNQ3Nj+fOwZ6X4zHZnd+LoNcz8S5mPP4PkaOyLm3BvZ7mwuYGS38n+MO8
 ohvQKh76XZ+pfRlo7oif4n8h/irZfJXplFX3SjmwmoWFmuz59Fue/lWCs
 L5+NnrMfO8B6tE5sBwlVXZZCXtV1O+JscGXHqis69fl0u7OE8xEt11W8d
 1jF7dXFne7biUMghM5wpYEeGCMqMt4Q67UQ/fM9qF8MiANPH2Kiyw+S/p
 H6ajap4x+bZQonXbl74vQYo0rZjeGRyCva5pVFP9ea497BTV83ecyqiGc g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10341"; a="256563903"
X-IronPort-AV: E=Sophos;i="5.91,211,1647327600"; d="scan'208";a="256563903"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2022 05:05:02 -0700
X-IronPort-AV: E=Sophos;i="5.91,211,1647327600"; d="scan'208";a="622937093"
Received: from csawicki-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.129.3])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2022 05:05:00 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 18/25] drm/edid: add drm_edid helper for
 drm_edid_to_speaker_allocation()
Date: Mon,  9 May 2022 15:03:17 +0300
Message-Id: <770d095c93274969c4b86480e07044e16a7b5760.1652097712.git.jani.nikula@intel.com>
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

We'll need to propagate drm_edid everywhere.'

v2: Handle NULL EDID pointer (Ville, CI)

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 37 +++++++++++++++++++++++--------------
 1 file changed, 23 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index dee09359bbc3..5cc851f6d3b3 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -5025,25 +5025,14 @@ int drm_edid_to_sad(const struct edid *edid, struct cea_sad **sads)
 }
 EXPORT_SYMBOL(drm_edid_to_sad);
 
-/**
- * drm_edid_to_speaker_allocation - extracts Speaker Allocation Data Blocks from EDID
- * @edid: EDID to parse
- * @sadb: pointer to the speaker block
- *
- * Looks for CEA EDID block and extracts the Speaker Allocation Data Block from it.
- *
- * Note: The returned pointer needs to be freed using kfree().
- *
- * Return: The number of found Speaker Allocation Blocks or negative number on
- * error.
- */
-int drm_edid_to_speaker_allocation(const struct edid *edid, u8 **sadb)
+static int _drm_edid_to_speaker_allocation(const struct drm_edid *drm_edid,
+					   u8 **sadb)
 {
 	const struct cea_db *db;
 	struct cea_db_iter iter;
 	int count = 0;
 
-	cea_db_iter_edid_begin(edid, &iter);
+	cea_db_iter_edid_begin(drm_edid ? drm_edid->edid : NULL, &iter);
 	cea_db_iter_for_each(db, &iter) {
 		if (cea_db_tag(db) == CTA_DB_SPEAKER &&
 		    cea_db_payload_len(db) == 3) {
@@ -5061,6 +5050,26 @@ int drm_edid_to_speaker_allocation(const struct edid *edid, u8 **sadb)
 
 	return count;
 }
+
+/**
+ * drm_edid_to_speaker_allocation - extracts Speaker Allocation Data Blocks from EDID
+ * @edid: EDID to parse
+ * @sadb: pointer to the speaker block
+ *
+ * Looks for CEA EDID block and extracts the Speaker Allocation Data Block from it.
+ *
+ * Note: The returned pointer needs to be freed using kfree().
+ *
+ * Return: The number of found Speaker Allocation Blocks or negative number on
+ * error.
+ */
+int drm_edid_to_speaker_allocation(const struct edid *edid, u8 **sadb)
+{
+	struct drm_edid drm_edid;
+
+	return _drm_edid_to_speaker_allocation(drm_edid_legacy_init(&drm_edid, edid),
+					       sadb);
+}
 EXPORT_SYMBOL(drm_edid_to_speaker_allocation);
 
 /**
-- 
2.30.2

