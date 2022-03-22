Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 183BD4E487A
	for <lists+dri-devel@lfdr.de>; Tue, 22 Mar 2022 22:41:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C10510E59C;
	Tue, 22 Mar 2022 21:41:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E24E210E598;
 Tue, 22 Mar 2022 21:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647985306; x=1679521306;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UbvXYkMkSae9SPD7wHJMpg4UfSlGNk02cXNLQ2cZB/c=;
 b=d0eSInGb0kO1Js/dsHWaTmBU/9/cSAL5GlXEnGHQH6KKy9tEjXOxODlD
 MwcYz1sBBuyx/a34NMkYAFqpUvwuDzBmRZcndo7J+8EBvrT0ny6ASWuyo
 bvbOKc15aPeT4fJ1CQJTMw4NBaqlbSOniAV+ZucrYt0ZdfFRPtSv0xVsd
 /+6FQKwd75B1ANL06Zvk+w9lBkqZ3ZbGA0mvj2vhbGCnM/+rQXWT7zkHS
 9nUUpINFQcxZSvPN4eH9LmueOAWWPIcb56PVgLQMl758ggptH9otu6P4I
 vgCO/keKOi8cFpNI8dzE/3elTscQWXxCdAviPrh7jZmVQGzwPJNCQMlwp A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10294"; a="257670910"
X-IronPort-AV: E=Sophos;i="5.90,202,1643702400"; d="scan'208";a="257670910"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2022 14:41:46 -0700
X-IronPort-AV: E=Sophos;i="5.90,202,1643702400"; d="scan'208";a="601056201"
Received: from sburacze-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.58.237])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2022 14:41:44 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [RFC 10/19] drm/edid: convert drm_detect_hdmi_monitor() to use cea db
 iter
Date: Tue, 22 Mar 2022 23:40:39 +0200
Message-Id: <301e3bd6a2a65b93c6ff01c1a74f55c076b7bbf4.1647985054.git.jani.nikula@intel.com>
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

Iterate through all CEA data blocks, not just the first CEA extension.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 25 +++++++++++--------------
 1 file changed, 11 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index e341790521d6..399e69dc1aed 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -4978,27 +4978,24 @@ EXPORT_SYMBOL(drm_av_sync_delay);
  */
 bool drm_detect_hdmi_monitor(struct edid *edid)
 {
-	const u8 *edid_ext;
-	int i;
-	int start_offset, end_offset;
-
-	edid_ext = drm_find_cea_extension(edid);
-	if (!edid_ext)
-		return false;
-
-	if (cea_db_offsets(edid_ext, &start_offset, &end_offset))
-		return false;
+	const struct cea_db *db;
+	struct cea_db_iter iter;
+	bool hdmi = false;
 
 	/*
 	 * Because HDMI identifier is in Vendor Specific Block,
 	 * search it from all data blocks of CEA extension.
 	 */
-	for_each_cea_db(edid_ext, i, start_offset, end_offset) {
-		if (cea_db_is_hdmi_vsdb(&edid_ext[i]))
-			return true;
+	cea_db_iter_edid_begin(edid, &iter);
+	cea_db_iter_for_each(db, &iter) {
+		if (cea_db_is_hdmi_vsdb(db)) {
+			hdmi = true;
+			break;
+		}
 	}
+	cea_db_iter_end(&iter);
 
-	return false;
+	return hdmi;
 }
 EXPORT_SYMBOL(drm_detect_hdmi_monitor);
 
-- 
2.30.2

