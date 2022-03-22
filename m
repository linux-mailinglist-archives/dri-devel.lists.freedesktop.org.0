Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F8084E4891
	for <lists+dri-devel@lfdr.de>; Tue, 22 Mar 2022 22:42:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DCAE10E5C7;
	Tue, 22 Mar 2022 21:42:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 316F510E5C1;
 Tue, 22 Mar 2022 21:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647985345; x=1679521345;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RAs881SQdU0x9yQqDTJ4ecj4mknGyUDxzffOdBjt/qQ=;
 b=jaM7SSMiN9oyeZec5zBcSafq6LI1vVNmq274//Spps1u5m9DJo++435w
 2IL6GIbTFYriKGslCLLksgASZNCA+mfNSGIOTDaUb9ZLXc6xfLSbuLufy
 jRu4xQ0LL6PZe9r903il/LgK6iFUd5DAHZIMs3dVnQf5dW6R36H6yPVst
 sbKRCHXi+cyxoPfVivIIxhLsDDJFSXO78MRQBEz/1fSBs99ZIQHVZ+o9L
 nqM+bM0hQlW77s9XQrhyDTcs2YGhSoW6Lv3J7peGLKpUWdIn9FQRl9PLl
 L8Zy/23hinmzlDYgNz7aQa5k/nCfdbpuenzRpEXs8QUVR9I+Q4IDBtWmB g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10294"; a="282795557"
X-IronPort-AV: E=Sophos;i="5.90,202,1643702400"; d="scan'208";a="282795557"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2022 14:42:11 -0700
X-IronPort-AV: E=Sophos;i="5.90,202,1643702400"; d="scan'208";a="560605846"
Received: from sburacze-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.58.237])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2022 14:42:09 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [RFC 16/19] drm/edid: detect basic audio only on CEA extension
Date: Tue, 22 Mar 2022 23:40:45 +0200
Message-Id: <403d47054c94a1feecab1c5fb8b4779689b38088.1647985054.git.jani.nikula@intel.com>
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

The CTA data block in DisplayID does not have the bits from byte 3 that
a CEA extension has. Only look for them in CEA extensions, but also look
for them in all CEA extensions.

References: https://patchwork.freedesktop.org/patch/msgid/20220321044330.27723-1-cooper.chiou@intel.com
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index b3aedeefed82..b6675f8638bb 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -4959,16 +4959,21 @@ EXPORT_SYMBOL(drm_detect_hdmi_monitor);
  */
 bool drm_detect_monitor_audio(struct edid *edid)
 {
+	struct drm_edid_iter edid_iter;
 	const struct cea_db *db;
 	struct cea_db_iter iter;
-	const u8 *edid_ext;
+	const u8 *cea;
 	bool has_audio = false;
 
-	edid_ext = drm_find_cea_extension(edid);
-	if (!edid_ext)
-		goto end;
-
-	has_audio = ((edid_ext[3] & EDID_BASIC_AUDIO) != 0);
+	drm_edid_iter_begin(edid, &edid_iter);
+	drm_edid_iter_for_each(cea, &edid_iter) {
+		if (cea[0] == CEA_EXT) {
+			has_audio = cea[3] & EDID_BASIC_AUDIO;
+			if (has_audio)
+				break;
+		}
+	}
+	drm_edid_iter_end(&edid_iter);
 
 	if (has_audio) {
 		DRM_DEBUG_KMS("Monitor has basic audio support\n");
-- 
2.30.2

