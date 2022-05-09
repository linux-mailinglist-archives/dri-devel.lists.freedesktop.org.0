Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC13E51FC1E
	for <lists+dri-devel@lfdr.de>; Mon,  9 May 2022 14:05:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A55B710EE80;
	Mon,  9 May 2022 12:05:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB2D110EF10;
 Mon,  9 May 2022 12:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652097910; x=1683633910;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4e/H+M/w7GyoXGTbcexhRPemupb4qMGVT74NWpudlzc=;
 b=fyorAYKZbyT1YNwlIuQxJ3Gdxuvr2ua/HzuU5k+dqHsWU+P/pE4i+9Iw
 vWr5jZn7XWv4pkJMgEr5n7Vl/IXZ9zulCfqxQhcJBAdlpn5KmYSklm+Sl
 38CUODe3M5LyF95LFikDWcUcqTQP/47KdcgQXCIOmoNTENpy6sHgMzOpm
 NmVdPLQVR3a/Cr7EuBPYzt1nnhfzzV2TL+pSzyQYDiNR7GMx1SOW8Cuxr
 Q15NYTLVctyvA8SoTloZqkr/0JwdE+B5f76We+ZcaoIWjGJ6bA0luSxYM
 1Pn2RTOkVzFslz2r+oXEZVTb2n7KjMQpPw4r/uqpXMB0eLEQmtiaxSHWO A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10341"; a="248930340"
X-IronPort-AV: E=Sophos;i="5.91,211,1647327600"; d="scan'208";a="248930340"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2022 05:05:07 -0700
X-IronPort-AV: E=Sophos;i="5.91,211,1647327600"; d="scan'208";a="570130359"
Received: from csawicki-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.129.3])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2022 05:05:05 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 19/25] drm/edid: add drm_edid helper for
 drm_detect_hdmi_monitor()
Date: Mon,  9 May 2022 15:03:18 +0300
Message-Id: <2fbee0d7b544b44ef0866bb154beefac5d260bec.1652097712.git.jani.nikula@intel.com>
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
 drivers/gpu/drm/drm_edid.c | 33 ++++++++++++++++++++-------------
 1 file changed, 20 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 5cc851f6d3b3..fc74159cd426 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -5113,18 +5113,7 @@ int drm_av_sync_delay(struct drm_connector *connector,
 }
 EXPORT_SYMBOL(drm_av_sync_delay);
 
-/**
- * drm_detect_hdmi_monitor - detect whether monitor is HDMI
- * @edid: monitor EDID information
- *
- * Parse the CEA extension according to CEA-861-B.
- *
- * Drivers that have added the modes parsed from EDID to drm_display_info
- * should use &drm_display_info.is_hdmi instead of calling this function.
- *
- * Return: True if the monitor is HDMI, false if not or unknown.
- */
-bool drm_detect_hdmi_monitor(const struct edid *edid)
+static bool _drm_detect_hdmi_monitor(const struct drm_edid *drm_edid)
 {
 	const struct cea_db *db;
 	struct cea_db_iter iter;
@@ -5134,7 +5123,7 @@ bool drm_detect_hdmi_monitor(const struct edid *edid)
 	 * Because HDMI identifier is in Vendor Specific Block,
 	 * search it from all data blocks of CEA extension.
 	 */
-	cea_db_iter_edid_begin(edid, &iter);
+	cea_db_iter_edid_begin(drm_edid ? drm_edid->edid : NULL, &iter);
 	cea_db_iter_for_each(db, &iter) {
 		if (cea_db_is_hdmi_vsdb(db)) {
 			hdmi = true;
@@ -5145,6 +5134,24 @@ bool drm_detect_hdmi_monitor(const struct edid *edid)
 
 	return hdmi;
 }
+
+/**
+ * drm_detect_hdmi_monitor - detect whether monitor is HDMI
+ * @edid: monitor EDID information
+ *
+ * Parse the CEA extension according to CEA-861-B.
+ *
+ * Drivers that have added the modes parsed from EDID to drm_display_info
+ * should use &drm_display_info.is_hdmi instead of calling this function.
+ *
+ * Return: True if the monitor is HDMI, false if not or unknown.
+ */
+bool drm_detect_hdmi_monitor(const struct edid *edid)
+{
+	struct drm_edid drm_edid;
+
+	return _drm_detect_hdmi_monitor(drm_edid_legacy_init(&drm_edid, edid));
+}
 EXPORT_SYMBOL(drm_detect_hdmi_monitor);
 
 /**
-- 
2.30.2

