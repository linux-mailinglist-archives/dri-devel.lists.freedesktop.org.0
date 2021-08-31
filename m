Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C1F3FC98D
	for <lists+dri-devel@lfdr.de>; Tue, 31 Aug 2021 16:18:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8804C6E077;
	Tue, 31 Aug 2021 14:18:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E79796E075;
 Tue, 31 Aug 2021 14:17:59 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10093"; a="282195776"
X-IronPort-AV: E=Sophos;i="5.84,366,1620716400"; d="scan'208";a="282195776"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2021 07:17:59 -0700
X-IronPort-AV: E=Sophos;i="5.84,366,1620716400"; d="scan'208";a="541026287"
Received: from anicol1x-mobl.ger.corp.intel.com (HELO localhost)
 ([10.251.211.207])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2021 07:17:57 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, ville.syrjala@linux.intel.com,
 jani.nikula@intel.com
Subject: [PATCH v2 3/6] drm/edid: abstract OUI conversion to 24-bit int
Date: Tue, 31 Aug 2021 17:17:32 +0300
Message-Id: <2f43032d5f001510c7eed059321ceeb76d07a606.1630419362.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1630419362.git.jani.nikula@intel.com>
References: <cover.1630419362.git.jani.nikula@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Replace the open coded OUI conversion from three bytes to a 24-bit int,
as we'll be adding one more user shortly. No functional changes.

Side note: CTA-861 format has the OUI bytes in reverse order.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 6325877c5fd6..92974b1478bc 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -49,6 +49,11 @@
 	(((edid)->version > (maj)) || \
 	 ((edid)->version == (maj) && (edid)->revision > (min)))
 
+static int oui(u8 first, u8 second, u8 third)
+{
+	return (first << 16) | (second << 8) | third;
+}
+
 #define EDID_EST_TIMINGS 16
 #define EDID_STD_TIMINGS 8
 #define EDID_DETAILED_TIMINGS 4
@@ -4113,32 +4118,24 @@ cea_db_offsets(const u8 *cea, int *start, int *end)
 
 static bool cea_db_is_hdmi_vsdb(const u8 *db)
 {
-	int hdmi_id;
-
 	if (cea_db_tag(db) != VENDOR_BLOCK)
 		return false;
 
 	if (cea_db_payload_len(db) < 5)
 		return false;
 
-	hdmi_id = db[1] | (db[2] << 8) | (db[3] << 16);
-
-	return hdmi_id == HDMI_IEEE_OUI;
+	return oui(db[3], db[2], db[1]) == HDMI_IEEE_OUI;
 }
 
 static bool cea_db_is_hdmi_forum_vsdb(const u8 *db)
 {
-	unsigned int oui;
-
 	if (cea_db_tag(db) != VENDOR_BLOCK)
 		return false;
 
 	if (cea_db_payload_len(db) < 7)
 		return false;
 
-	oui = db[3] << 16 | db[2] << 8 | db[1];
-
-	return oui == HDMI_FORUM_IEEE_OUI;
+	return oui(db[3], db[2], db[1]) == HDMI_FORUM_IEEE_OUI;
 }
 
 static bool cea_db_is_vcdb(const u8 *db)
-- 
2.30.2

