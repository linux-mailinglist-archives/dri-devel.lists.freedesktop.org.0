Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54F8460A65C
	for <lists+dri-devel@lfdr.de>; Mon, 24 Oct 2022 14:34:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B1B310E4E2;
	Mon, 24 Oct 2022 12:34:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DEFB10E4D5;
 Mon, 24 Oct 2022 12:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666614868; x=1698150868;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jFNhNAQS7BoL2wpIwTvAJB4BZ76AYZ7eywRxep+G5Vs=;
 b=WP8HGKYsgxNr3JIEUZI2mYkeZlYUVHwWbhtaDRNWcsXcaRoeFGMoFOyY
 3Nm9gto2PFxVp5FXbREshOd3+7BJF7i6Ta6CE/DqsM12Bz1oWs6fZumg0
 M/OyL4608OwKpKJVbtR9q9EtKIa6AD43c3xhqZeE8SoC8dgPM7D79CvdY
 9pebSi11cnIV7fpVU4imVEmAXr7UxkL74DIrhq+zl3VIY/FRIDDFNgRCN
 4gz+zIaR9b7lLwPuoW/bcQlOR1ocDm7nqm4WnkfVgE9X5hR2ZuEJhjcqA
 VQf98cTGdvCLa7TFlDOYWkd+AwsPPmQi5yktKB9Ev4r6UJbxfII8Fln0a A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10509"; a="294803392"
X-IronPort-AV: E=Sophos;i="5.95,209,1661842800"; d="scan'208";a="294803392"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2022 05:34:27 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10509"; a="633693782"
X-IronPort-AV: E=Sophos;i="5.95,209,1661842800"; d="scan'208";a="633693782"
Received: from emontau-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.52.221])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2022 05:34:25 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 08/16] drm/edid: add function for checking drm_edid validity
Date: Mon, 24 Oct 2022 15:33:36 +0300
Message-Id: <f96188f64e9f7f3deff348d08296609353b12316.1666614699.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1666614699.git.jani.nikula@intel.com>
References: <cover.1666614699.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

We've lacked a function for immutable validity check on drm_edid. Add
one.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/drm_edid.c | 30 ++++++++++++++++++++++++++++++
 include/drm/drm_edid.h     |  1 +
 2 files changed, 31 insertions(+)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 616c1cdc7507..c3cf942186b7 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -2040,6 +2040,36 @@ bool drm_edid_is_valid(struct edid *edid)
 }
 EXPORT_SYMBOL(drm_edid_is_valid);
 
+/**
+ * drm_edid_valid - sanity check EDID data
+ * @drm_edid: EDID data
+ *
+ * Sanity check an EDID. Cross check block count against allocated size and
+ * checksum the blocks.
+ *
+ * Return: True if the EDID data is valid, false otherwise.
+ */
+bool drm_edid_valid(const struct drm_edid *drm_edid)
+{
+	int i;
+
+	if (!drm_edid)
+		return false;
+
+	if (edid_size_by_blocks(__drm_edid_block_count(drm_edid)) != drm_edid->size)
+		return false;
+
+	for (i = 0; i < drm_edid_block_count(drm_edid); i++) {
+		const void *block = drm_edid_block_data(drm_edid, i);
+
+		if (!edid_block_valid(block, i == 0))
+			return false;
+	}
+
+	return true;
+}
+EXPORT_SYMBOL(drm_edid_valid);
+
 static struct edid *edid_filter_invalid_blocks(struct edid *edid,
 					       size_t *alloc_size)
 {
diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
index 05380681a4fb..a2e25e7e6ee5 100644
--- a/include/drm/drm_edid.h
+++ b/include/drm/drm_edid.h
@@ -606,6 +606,7 @@ drm_display_mode_from_cea_vic(struct drm_device *dev,
 const struct drm_edid *drm_edid_alloc(const void *edid, size_t size);
 const struct drm_edid *drm_edid_dup(const struct drm_edid *drm_edid);
 void drm_edid_free(const struct drm_edid *drm_edid);
+bool drm_edid_valid(const struct drm_edid *drm_edid);
 const struct edid *drm_edid_raw(const struct drm_edid *drm_edid);
 const struct drm_edid *drm_edid_read(struct drm_connector *connector);
 const struct drm_edid *drm_edid_read_ddc(struct drm_connector *connector,
-- 
2.34.1

