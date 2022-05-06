Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D7E0E51D561
	for <lists+dri-devel@lfdr.de>; Fri,  6 May 2022 12:12:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DF6D10FBBF;
	Fri,  6 May 2022 10:12:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC41E10FBBF;
 Fri,  6 May 2022 10:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651831939; x=1683367939;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FM5ur+8pFTiepm0gLzvclkn/dmeJC3xUZmRqXh7tte8=;
 b=JLQ/sZuqBqnWU30bubrSuaWP7YrRdG/qNGxYPJGJiwJP9Y1F2iFiyL6/
 4RwJ5hHUcJz6SLc4uqwhaaVp8WxgVvpUhcZFmcGfvwRto14p7GPctCUK4
 vZicPW6LLARS4rFzar/EZr1NQRZmWGXkLfipwmyZKQShn2kPiEDk2n4Tx
 YwIv3V6+dDFMKmT9sJU6NOZmp67+tDEeIROVODkAYCwPBRfXQx8Cx65yk
 Cs2hd5Y4ZkgcN7sIF9rrw/vaWfqgF5u3J+s5gVGS8sWtbspD9W/te4U/q
 /QmhvcI1ilzXMT1LzWj5hKdofLMKzIbvEC2tWg8Gj6KEmrIoNcTw3kIct A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10338"; a="255909886"
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="255909886"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2022 03:12:19 -0700
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="621764276"
Received: from psikora-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.157.88])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2022 03:12:17 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 19/25] drm/edid: add drm_edid helper for
 drm_detect_hdmi_monitor()
Date: Fri,  6 May 2022 13:10:26 +0300
Message-Id: <d3fdb28765d0bb7f4b9d562890e912a91e7c1600.1651830939.git.jani.nikula@intel.com>
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
 drivers/gpu/drm/drm_edid.c | 36 +++++++++++++++++++++++-------------
 1 file changed, 23 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 51aee048bcff..3277b4fd33ce 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -5100,18 +5100,7 @@ int drm_av_sync_delay(struct drm_connector *connector,
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
@@ -5121,7 +5110,7 @@ bool drm_detect_hdmi_monitor(const struct edid *edid)
 	 * Because HDMI identifier is in Vendor Specific Block,
 	 * search it from all data blocks of CEA extension.
 	 */
-	cea_db_iter_edid_begin(edid, &iter);
+	cea_db_iter_edid_begin(drm_edid->edid, &iter);
 	cea_db_iter_for_each(db, &iter) {
 		if (cea_db_is_hdmi_vsdb(db)) {
 			hdmi = true;
@@ -5132,6 +5121,27 @@ bool drm_detect_hdmi_monitor(const struct edid *edid)
 
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
+	struct drm_edid drm_edid = {
+		.edid = edid,
+		.size = edid_size(edid),
+	};
+
+	return _drm_detect_hdmi_monitor(&drm_edid);
+}
 EXPORT_SYMBOL(drm_detect_hdmi_monitor);
 
 /**
-- 
2.30.2

