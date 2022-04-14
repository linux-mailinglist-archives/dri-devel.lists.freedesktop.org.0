Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 61F7B501277
	for <lists+dri-devel@lfdr.de>; Thu, 14 Apr 2022 17:08:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2391510FD05;
	Thu, 14 Apr 2022 15:08:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 573D610FD0B;
 Thu, 14 Apr 2022 15:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649948908; x=1681484908;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9dWIYS/Zq0MooZlJI02jCKibqQBa2XtW4YOPMiPAiDs=;
 b=bWxU4ZA+aa3NqTwlISV/RtlWLEHiyJowTxxeDLf6c/KGwu9pxzwDMtOl
 S6jM+ywEDGhlRk406Qe5bXdZv/YMo7PS7QA5JkTfKNaPhF5BhmteCHbqJ
 e2kFMe2nmRInyKqCnlmGvnJQkOsf+iCcxrS6YC5743Pc6Lv2DDNVEY0B6
 VglgRX9HSkkDetvXMnH71UZIDV8OX3P3xxi3wyTkYgJ5giIyxdcPgJyx+
 RZPmEwRk/53djs5F3isQip7Bq+SkLIJ8YPhpw4hLtQwp+NDoCtAOAssNh
 9xyLC55N/rHimWAbYr6HKcUtptvRMbahmASmHHIdwuQKuop/TPgqDOVoX A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10317"; a="262703146"
X-IronPort-AV: E=Sophos;i="5.90,260,1643702400"; d="scan'208";a="262703146"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2022 08:08:27 -0700
X-IronPort-AV: E=Sophos;i="5.90,260,1643702400"; d="scan'208";a="526946873"
Received: from nplaweck-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.149.236])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2022 08:08:25 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 14/19] drm/edid: sunset the old unused cea data block iterators
Date: Thu, 14 Apr 2022 18:06:57 +0300
Message-Id: <1f5abce2064c6eeaa6fb03c39ce9fcc6c7eb6765.1649948563.git.jani.nikula@intel.com>
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

All CTA data block iteration has now been converted to the new cea db
iterators.

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 45 --------------------------------------
 1 file changed, 45 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index fa7f2bf68da3..7ed0258c0edf 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -4373,48 +4373,6 @@ cea_revision(const u8 *cea)
 	return cea[1];
 }
 
-static int
-cea_db_offsets(const u8 *cea, int *start, int *end)
-{
-	/* DisplayID CTA extension blocks and top-level CEA EDID
-	 * block header definitions differ in the following bytes:
-	 *   1) Byte 2 of the header specifies length differently,
-	 *   2) Byte 3 is only present in the CEA top level block.
-	 *
-	 * The different definitions for byte 2 follow.
-	 *
-	 * DisplayID CTA extension block defines byte 2 as:
-	 *   Number of payload bytes
-	 *
-	 * CEA EDID block defines byte 2 as:
-	 *   Byte number (decimal) within this block where the 18-byte
-	 *   DTDs begin. If no non-DTD data is present in this extension
-	 *   block, the value should be set to 04h (the byte after next).
-	 *   If set to 00h, there are no DTDs present in this block and
-	 *   no non-DTD data.
-	 */
-	if (cea[0] == DATA_BLOCK_CTA) {
-		/*
-		 * for_each_displayid_db() has already verified
-		 * that these stay within expected bounds.
-		 */
-		*start = 3;
-		*end = *start + cea[2];
-	} else if (cea[0] == CEA_EXT) {
-		/* Data block offset in CEA extension block */
-		*start = 4;
-		*end = cea[2];
-		if (*end == 0)
-			*end = 127;
-		if (*end < 4 || *end > 127)
-			return -ERANGE;
-	} else {
-		return -EOPNOTSUPP;
-	}
-
-	return 0;
-}
-
 /*
  * CTA Data Block iterator.
  *
@@ -4667,9 +4625,6 @@ static bool cea_db_is_hdmi_hdr_metadata_block(const void *db)
 		cea_db_payload_len(db) >= 3;
 }
 
-#define for_each_cea_db(cea, i, start, end) \
-	for ((i) = (start); (i) < (end) && (i) + cea_db_payload_len(&(cea)[(i)]) < (end); (i) += cea_db_payload_len(&(cea)[(i)]) + 1)
-
 static void drm_parse_y420cmdb_bitmap(struct drm_connector *connector,
 				      const u8 *db)
 {
-- 
2.30.2

