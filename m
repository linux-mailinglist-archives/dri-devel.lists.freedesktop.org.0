Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DF09501246
	for <lists+dri-devel@lfdr.de>; Thu, 14 Apr 2022 17:07:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31A3E10FF59;
	Thu, 14 Apr 2022 15:07:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C72010FF51;
 Thu, 14 Apr 2022 15:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649948862; x=1681484862;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ATLkre7exDN92CUYLN16of+EFgUdq1ko/VIwSaVNZto=;
 b=mHGEa3YGsoj8c7LlzW7VfrAZT6SGPbadR5+m1hnGSOLyptfWYwHipr8T
 Cq11O49JbHezZjy2JnfqtcgtenaCRloVZR/cU3moUTNOxMn/JXAK/2kL+
 NTKJySCDKJx2PfuRlXkrojxiAt2YYBMI61PyqkxR0ZzI8ptz1URdiW2my
 LxA4Bt5vbQRS7aVXXqo4M+NBkDr25Y3+0as4cnorFWXBb1XPrp3glFZSO
 hlh2ntv8TjxWUTwdV9PG1W670Q2FiTqfUud9Us6SQasJUeur/R+KqUl1t
 PXvxyIWAerh2s4awnI8EQFaJ+4ZAXZd+GfeilcfAoQvazBlOUpUEE40qn g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10317"; a="323394648"
X-IronPort-AV: E=Sophos;i="5.90,260,1643702400"; d="scan'208";a="323394648"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2022 08:07:42 -0700
X-IronPort-AV: E=Sophos;i="5.90,260,1643702400"; d="scan'208";a="725393675"
Received: from nplaweck-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.149.236])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2022 08:07:39 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 06/19] drm/edid: clean up cea_db_is_*() functions
Date: Thu, 14 Apr 2022 18:06:49 +0300
Message-Id: <da6e3a1f1b5f1038d37e82bdbd9244f999b72d96.1649948562.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1649948562.git.jani.nikula@intel.com>
References: <cover.1649948562.git.jani.nikula@intel.com>
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

Abstract helpers for matching vendor data blocks and extended tags, and
use them to simplify all the cea_db_is_*() functions.

Take void pointer as parameter to allow transitional use for both u8 *
and struct cea_db *.

v2: Remove superfluous parens (Ville)

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 127 ++++++++++++-------------------------
 1 file changed, 40 insertions(+), 87 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 43d9e04f8fb9..34897b1417a5 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -4360,12 +4360,6 @@ do_hdmi_vsdb_modes(struct drm_connector *connector, const u8 *db, u8 len,
 	return modes;
 }
 
-static int
-cea_db_extended_tag(const u8 *db)
-{
-	return db[1];
-}
-
 static int
 cea_revision(const u8 *cea)
 {
@@ -4477,6 +4471,22 @@ static const void *cea_db_data(const struct cea_db *db)
 	return db->data;
 }
 
+static bool cea_db_is_extended_tag(const struct cea_db *db, int tag)
+{
+	return cea_db_tag(db) == CTA_DB_EXTENDED_TAG &&
+		cea_db_payload_len(db) >= 1 &&
+		db->data[0] == tag;
+}
+
+static bool cea_db_is_vendor(const struct cea_db *db, int vendor_oui)
+{
+	const u8 *data = cea_db_data(db);
+
+	return cea_db_tag(db) == CTA_DB_VENDOR &&
+		cea_db_payload_len(db) >= 3 &&
+		oui(data[2], data[1], data[0]) == vendor_oui;
+}
+
 static void cea_db_iter_edid_begin(const struct edid *edid, struct cea_db_iter *iter)
 {
 	memset(iter, 0, sizeof(*iter));
@@ -4611,93 +4621,50 @@ static void cea_db_iter_end(struct cea_db_iter *iter)
 	memset(iter, 0, sizeof(*iter));
 }
 
-static bool cea_db_is_hdmi_vsdb(const u8 *db)
+static bool cea_db_is_hdmi_vsdb(const void *db)
 {
-	if (cea_db_tag(db) != CTA_DB_VENDOR)
-		return false;
-
-	if (cea_db_payload_len(db) < 5)
-		return false;
-
-	return oui(db[3], db[2], db[1]) == HDMI_IEEE_OUI;
+	return cea_db_is_vendor(db, HDMI_IEEE_OUI) &&
+		cea_db_payload_len(db) >= 5;
 }
 
-static bool cea_db_is_hdmi_forum_vsdb(const u8 *db)
+static bool cea_db_is_hdmi_forum_vsdb(const void *db)
 {
-	if (cea_db_tag(db) != CTA_DB_VENDOR)
-		return false;
-
-	if (cea_db_payload_len(db) < 7)
-		return false;
-
-	return oui(db[3], db[2], db[1]) == HDMI_FORUM_IEEE_OUI;
+	return cea_db_is_vendor(db, HDMI_FORUM_IEEE_OUI) &&
+		cea_db_payload_len(db) >= 7;
 }
 
-static bool cea_db_is_microsoft_vsdb(const u8 *db)
+static bool cea_db_is_microsoft_vsdb(const void *db)
 {
-	if (cea_db_tag(db) != CTA_DB_VENDOR)
-		return false;
-
-	if (cea_db_payload_len(db) != 21)
-		return false;
-
-	return oui(db[3], db[2], db[1]) == MICROSOFT_IEEE_OUI;
+	return cea_db_is_vendor(db, MICROSOFT_IEEE_OUI) &&
+		cea_db_payload_len(db) == 21;
 }
 
-static bool cea_db_is_vcdb(const u8 *db)
+static bool cea_db_is_vcdb(const void *db)
 {
-	if (cea_db_tag(db) != CTA_DB_EXTENDED_TAG)
-		return false;
-
-	if (cea_db_payload_len(db) != 2)
-		return false;
-
-	if (cea_db_extended_tag(db) != CTA_EXT_DB_VIDEO_CAP)
-		return false;
-
-	return true;
+	return cea_db_is_extended_tag(db, CTA_EXT_DB_VIDEO_CAP) &&
+		cea_db_payload_len(db) == 2;
 }
 
-static bool cea_db_is_hdmi_forum_scdb(const u8 *db)
+static bool cea_db_is_hdmi_forum_scdb(const void *db)
 {
-	if (cea_db_tag(db) != CTA_DB_EXTENDED_TAG)
-		return false;
-
-	if (cea_db_payload_len(db) < 7)
-		return false;
-
-	if (cea_db_extended_tag(db) != CTA_EXT_DB_HF_SCDB)
-		return false;
-
-	return true;
+	return cea_db_is_extended_tag(db, CTA_EXT_DB_HF_SCDB) &&
+		cea_db_payload_len(db) >= 7;
 }
 
-static bool cea_db_is_y420cmdb(const u8 *db)
+static bool cea_db_is_y420cmdb(const void *db)
 {
-	if (cea_db_tag(db) != CTA_DB_EXTENDED_TAG)
-		return false;
-
-	if (!cea_db_payload_len(db))
-		return false;
-
-	if (cea_db_extended_tag(db) != CTA_EXT_DB_420_VIDEO_CAP_MAP)
-		return false;
-
-	return true;
+	return cea_db_is_extended_tag(db, CTA_EXT_DB_420_VIDEO_CAP_MAP);
 }
 
-static bool cea_db_is_y420vdb(const u8 *db)
+static bool cea_db_is_y420vdb(const void *db)
 {
-	if (cea_db_tag(db) != CTA_DB_EXTENDED_TAG)
-		return false;
-
-	if (!cea_db_payload_len(db))
-		return false;
-
-	if (cea_db_extended_tag(db) != CTA_EXT_DB_420_VIDEO_DATA)
-		return false;
+	return cea_db_is_extended_tag(db, CTA_EXT_DB_420_VIDEO_DATA);
+}
 
-	return true;
+static bool cea_db_is_hdmi_hdr_metadata_block(const void *db)
+{
+	return cea_db_is_extended_tag(db, CTA_EXT_DB_HDR_STATIC_METADATA) &&
+		cea_db_payload_len(db) >= 3;
 }
 
 #define for_each_cea_db(cea, i, start, end) \
@@ -4833,20 +4800,6 @@ static void fixup_detailed_cea_mode_clock(struct drm_display_mode *mode)
 	mode->clock = clock;
 }
 
-static bool cea_db_is_hdmi_hdr_metadata_block(const u8 *db)
-{
-	if (cea_db_tag(db) != CTA_DB_EXTENDED_TAG)
-		return false;
-
-	if (db[1] != CTA_EXT_DB_HDR_STATIC_METADATA)
-		return false;
-
-	if (cea_db_payload_len(db) < 3)
-		return false;
-
-	return true;
-}
-
 static uint8_t eotf_supported(const u8 *edid_ext)
 {
 	return edid_ext[2] &
-- 
2.30.2

