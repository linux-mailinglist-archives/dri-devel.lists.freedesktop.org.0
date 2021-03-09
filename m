Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C8103327CF
	for <lists+dri-devel@lfdr.de>; Tue,  9 Mar 2021 14:54:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24AA76E8FF;
	Tue,  9 Mar 2021 13:54:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 456FD6E8FD;
 Tue,  9 Mar 2021 13:54:51 +0000 (UTC)
IronPort-SDR: iiA8gusjaZE+wPqbT3S9lyvOW9Pc95KcfLSQpkrBoDkOaNlR1X4MIhCGrC3y4baEg0I+tXp+FM
 lg9Y3/T4tTkA==
X-IronPort-AV: E=McAfee;i="6000,8403,9917"; a="167508529"
X-IronPort-AV: E=Sophos;i="5.81,234,1610438400"; d="scan'208";a="167508529"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2021 05:54:50 -0800
IronPort-SDR: eqF9g8oMFZloJDQCpwrq4YgMokudhNKbXWz5AJVPHWhEG071S9yGlzvUrGF+fCqF7YN2Scl3fc
 kQm77foLOjYQ==
X-IronPort-AV: E=Sophos;i="5.81,234,1610438400"; d="scan'208";a="386231450"
Received: from kjwindec-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.48.180])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2021 05:54:48 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [RFC v1 4/6] drm/edid: use the new displayid iterator for detailed
 modes
Date: Tue,  9 Mar 2021 15:54:12 +0200
Message-Id: <ca35f536b8c6b25f518a56b443807256a40e7d2c.1615297748.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1615297748.git.jani.nikula@intel.com>
References: <cover.1615297748.git.jani.nikula@intel.com>
MIME-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Neatly reduce displayid boilerplate in code. No functional changes.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 23 ++++++-----------------
 1 file changed, 6 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 58e61f792bc7..fbaa7d679cb2 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -5333,27 +5333,16 @@ static int add_displayid_detailed_1_modes(struct drm_connector *connector,
 static int add_displayid_detailed_modes(struct drm_connector *connector,
 					struct edid *edid)
 {
-	const u8 *displayid;
-	int length, idx;
 	const struct displayid_block *block;
+	struct displayid_iter iter;
 	int num_modes = 0;
-	int ext_index = 0;
-
-	for (;;) {
-		displayid = drm_find_displayid_extension(edid, &length, &idx,
-							 &ext_index);
-		if (!displayid)
-			break;
 
-		idx += sizeof(struct displayid_hdr);
-		for_each_displayid_db(displayid, block, idx, length) {
-			switch (block->tag) {
-			case DATA_BLOCK_TYPE_1_DETAILED_TIMING:
-				num_modes += add_displayid_detailed_1_modes(connector, block);
-				break;
-			}
-		}
+	displayid_iter_edid_begin(edid, &iter);
+	displayid_iter_for_each(block, &iter) {
+		if (block->tag == DATA_BLOCK_TYPE_1_DETAILED_TIMING)
+			num_modes += add_displayid_detailed_1_modes(connector, block);
 	}
+	displayid_iter_end(&iter);
 
 	return num_modes;
 }
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
