Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D58E97DCA94
	for <lists+dri-devel@lfdr.de>; Tue, 31 Oct 2023 11:17:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4838A10E460;
	Tue, 31 Oct 2023 10:17:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39F3110E45E;
 Tue, 31 Oct 2023 10:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698747446; x=1730283446;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=U/laAZZZgIzi/W3rQP+RXQrO/ezW7oNamWciLiVbVb4=;
 b=MU2kCfTKma1hixyESgYld2saiZZRMc9HTjwqpoUvDjqKr/JsK+IIcfrV
 4VmuUhBAZGLjJ678khA2/PclD467T1zgUwRkVicB9pjc8i5dF4ePzHrpr
 Oy59NzimrSdw5l6KSKi0mSkKtNBmJdR0f3dvLshuZJqFfNjL0D1mQ9aiZ
 kpuZ4sdXuTsmfy4BuFMbqBJAtK9/hUjQTzw8dHA/H1G3PcOUy2rudV9/k
 X1OAa2YFxleRAMozIyXfcdoyGzYRKqxTS7NxyShBH4l9A0y8KO8cc0uK0
 N4rFeksaG1ZOf3DYiaFVCfGmpkkVblNuXe/QvEIgnWlcN0wBURyx391Gp Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="454724942"
X-IronPort-AV: E=Sophos;i="6.03,265,1694761200"; d="scan'208";a="454724942"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2023 03:17:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="789747811"
X-IronPort-AV: E=Sophos;i="6.03,265,1694761200"; d="scan'208";a="789747811"
Received: from moelschl-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.51.45])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2023 03:17:10 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 4/6] drm/edid: use a temp variable for sads to drop one
 level of dereferences
Date: Tue, 31 Oct 2023 12:16:41 +0200
Message-Id: <b6e2f295ae5491c2bb0f528508f0f5fca921dc77.1698747331.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1698747331.git.jani.nikula@intel.com>
References: <cover.1698747331.git.jani.nikula@intel.com>
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
Cc: Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org,
 Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use a temporary variable struct cea_sad *, instead of using struct
cea_sad ** directly with the double dereferences. It's arguably easier
on the eyes, and drops a set of parenthesis too.

Cc: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Reviewed-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 8be0f26702b5..c0d50082b504 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -5594,7 +5594,7 @@ static void drm_edid_to_eld(struct drm_connector *connector,
 }
 
 static int _drm_edid_to_sad(const struct drm_edid *drm_edid,
-			    struct cea_sad **sads)
+			    struct cea_sad **psads)
 {
 	const struct cea_db *db;
 	struct cea_db_iter iter;
@@ -5603,19 +5603,21 @@ static int _drm_edid_to_sad(const struct drm_edid *drm_edid,
 	cea_db_iter_edid_begin(drm_edid, &iter);
 	cea_db_iter_for_each(db, &iter) {
 		if (cea_db_tag(db) == CTA_DB_AUDIO) {
+			struct cea_sad *sads;
 			int j;
 
 			count = cea_db_payload_len(db) / 3; /* SAD is 3B */
-			*sads = kcalloc(count, sizeof(**sads), GFP_KERNEL);
-			if (!*sads)
+			sads = kcalloc(count, sizeof(*sads), GFP_KERNEL);
+			*psads = sads;
+			if (!sads)
 				return -ENOMEM;
 			for (j = 0; j < count; j++) {
 				const u8 *sad = &db->data[j * 3];
 
-				(*sads)[j].format = (sad[0] & 0x78) >> 3;
-				(*sads)[j].channels = sad[0] & 0x7;
-				(*sads)[j].freq = sad[1] & 0x7F;
-				(*sads)[j].byte2 = sad[2];
+				sads[j].format = (sad[0] & 0x78) >> 3;
+				sads[j].channels = sad[0] & 0x7;
+				sads[j].freq = sad[1] & 0x7F;
+				sads[j].byte2 = sad[2];
 			}
 			break;
 		}
-- 
2.39.2

