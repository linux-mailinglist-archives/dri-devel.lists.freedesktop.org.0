Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 894274EB382
	for <lists+dri-devel@lfdr.de>; Tue, 29 Mar 2022 20:42:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EEC810E4F3;
	Tue, 29 Mar 2022 18:42:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DB4C10E4F3;
 Tue, 29 Mar 2022 18:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648579360; x=1680115360;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=P+cGMuT1NpJwOQ0o3PAvSvjJP0jvql8YfL4ujjnOAXs=;
 b=D/vrVZ6KAnV9wQFeQAPaGLnwVy14GboYCbrXGFgDAfTQtb47P2fVlDw0
 tuIG0qgamqgIhYMy/DaEhoTeKMvtaarnlQ83gFb/uyPbbsE1TKXEUBeff
 P1bwX4cy1Sp0mr0ZH60zUXp7cf4J/rRe6du8qmKJAnQhhNrtvGUMMVmdC
 bA1DfaGkC8iN+rU2xGCnb/qBBJwTd6Tg7Didok0peimq0Sh9h7deQiSBY
 /4BjnGFdQQMB7P416tnE/hQD4EUafW6bvlm3unfA9Dm/kVuKnhlxozxcD
 /kMqjQlvm1EYYVs72kGYQkuk/+eK3PMRFadACGmEDrXE9IQyEJ96Qp4ML A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10301"; a="259521544"
X-IronPort-AV: E=Sophos;i="5.90,220,1643702400"; d="scan'208";a="259521544"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2022 11:42:39 -0700
X-IronPort-AV: E=Sophos;i="5.90,220,1643702400"; d="scan'208";a="546510304"
Received: from dmendyk-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.63.121])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2022 11:42:37 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 03/12] drm/edid: add edid_block_tag() helper to get the EDID
 extension tag
Date: Tue, 29 Mar 2022 21:42:10 +0300
Message-Id: <506aa8486c7dedf68f2c0d5a3b2d7388a1ab5610.1648578814.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1648578814.git.jani.nikula@intel.com>
References: <cover.1648578814.git.jani.nikula@intel.com>
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

The extension tag at offset 0 is not present in struct edid, add a
helper for it to reduce the need to use u8 *.

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 73f05e0363c0..95f0303bc63e 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -1618,6 +1618,13 @@ static int edid_block_get_checksum(const void *_block)
 	return block->checksum;
 }
 
+static int edid_block_tag(const void *_block)
+{
+	const u8 *block = _block;
+
+	return block[0];
+}
+
 static bool drm_edid_is_zero(const u8 *in_edid, int length)
 {
 	if (memchr_inv(in_edid, 0, length))
@@ -1710,7 +1717,7 @@ bool drm_edid_block_valid(u8 *raw_edid, int block, bool print_bad_edid,
 			*edid_corrupt = true;
 
 		/* allow CEA to slide through, switches mangle this */
-		if (raw_edid[0] == CEA_EXT) {
+		if (edid_block_tag(raw_edid) == CEA_EXT) {
 			DRM_DEBUG("EDID checksum is invalid, remainder is %d\n", csum);
 			DRM_DEBUG("Assuming a KVM switch modified the CEA block but left the original checksum\n");
 		} else {
@@ -1722,7 +1729,7 @@ bool drm_edid_block_valid(u8 *raw_edid, int block, bool print_bad_edid,
 	}
 
 	/* per-block-type checks */
-	switch (raw_edid[0]) {
+	switch (edid_block_tag(raw_edid)) {
 	case 0: /* base */
 		if (edid->version != 1) {
 			DRM_NOTE("EDID has major version %d, instead of 1\n", edid->version);
@@ -3366,7 +3373,7 @@ const u8 *drm_find_edid_extension(const struct edid *edid,
 	/* Find CEA extension */
 	for (i = *ext_index; i < edid->extensions; i++) {
 		edid_ext = (const u8 *)edid + EDID_LENGTH * (i + 1);
-		if (edid_ext[0] == ext_id)
+		if (edid_block_tag(edid_ext) == ext_id)
 			break;
 	}
 
-- 
2.30.2

