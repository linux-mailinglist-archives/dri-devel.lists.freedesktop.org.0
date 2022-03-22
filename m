Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 483564E4883
	for <lists+dri-devel@lfdr.de>; Tue, 22 Mar 2022 22:42:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF12C10E5AB;
	Tue, 22 Mar 2022 21:42:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0119010E5A9;
 Tue, 22 Mar 2022 21:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647985325; x=1679521325;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IjWkfQp/X4dXy04ufGQ9+ZkFd1Ewxsl/BGjj2LigBB0=;
 b=UgFs0Yn0h5QkSHh/7DbDbgc31esXRRa5N7MrV7dB3kIVGz+dsG8Optr9
 MnAhrXkxbqNMvhPCappf9jqfb7rKTSqJw0mEcFRmE6wUjmt2DL4IpISuF
 Mb43FLF1n94pdH3LU/aZoSRtaygpVHzbi4nB5v4zFbmi7Lm9y+LoLxBCw
 e9dFUNIN8tkepgZQk1bt81i6U74en7PMhTUP0/pVImfCwfihofCu1blJF
 +jQ81JOmeiu2TKt6jnrry0hsUfJjf/ZtBMqn+3eJVe9Arfgb0JANNdAtI
 8xElD0x0ebJ9cOuPS95BgcMTv+2NYMlV05vgZxZ7TivhsuUbmEzEQfnsj A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10294"; a="257904577"
X-IronPort-AV: E=Sophos;i="5.90,202,1643702400"; d="scan'208";a="257904577"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2022 14:42:03 -0700
X-IronPort-AV: E=Sophos;i="5.90,202,1643702400"; d="scan'208";a="616190953"
Received: from sburacze-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.58.237])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2022 14:42:01 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [RFC 14/19] drm/edid: sunset the old unused cea data block iterators
Date: Tue, 22 Mar 2022 23:40:43 +0200
Message-Id: <8a7fc17d9a19295a1b9230139c46a47d6b1d8ebb.1647985054.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1647985054.git.jani.nikula@intel.com>
References: <cover.1647985054.git.jani.nikula@intel.com>
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

All CEA data block iteration has now been converted to the new cea db
iterators.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 45 --------------------------------------
 1 file changed, 45 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index ccbaa91b171d..0400c4024de7 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -4209,48 +4209,6 @@ cea_revision(const u8 *cea)
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
  * CEA Data Block iterator.
  *
@@ -4493,9 +4451,6 @@ static bool cea_db_is_hdmi_hdr_metadata_block(const void *db)
 		cea_db_payload_len(db) >= 3);
 }
 
-#define for_each_cea_db(cea, i, start, end) \
-	for ((i) = (start); (i) < (end) && (i) + cea_db_payload_len(&(cea)[(i)]) < (end); (i) += cea_db_payload_len(&(cea)[(i)]) + 1)
-
 static void drm_parse_y420cmdb_bitmap(struct drm_connector *connector,
 				      const u8 *db)
 {
-- 
2.30.2

