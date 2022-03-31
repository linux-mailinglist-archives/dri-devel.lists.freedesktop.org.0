Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A544EE0E6
	for <lists+dri-devel@lfdr.de>; Thu, 31 Mar 2022 20:45:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1158610F46C;
	Thu, 31 Mar 2022 18:45:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63E5310F46A;
 Thu, 31 Mar 2022 18:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648752338; x=1680288338;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UmsDR08Qio5SdDt08gcg9htocecF05aXi2TcpSL5194=;
 b=PWIDF5jofq+W8g+I+CbOG9lboDmbZwNSqhmqK0Tj//EeRNA0KOmynz7J
 G8z/7QYyxI9ABcTP9ECwSaFtiWc2hllMrzfz2Vm7J5J6suID9brKbxtUW
 5WgwWr6w3o0vdc6KdZYNizTtD1Q8Xy7NJ1wCBlwT2a++o6NCoRFfieyhU
 NZHgNV5hxDysdrSfOaOxh3+mTlBLbtk8ZGQUPgdf3ukDC45HU+D6q79Il
 jH+rmSVQ5k9E7A51jh+sognM0kzfEl9Sq+uiE1/TcPNpKrcAnq8qe+x8j
 +9pyBKmrzz1QwI+yeirdPeQ5dMiReG9zzvBK9DJrMWU2oUqHdmmyQmKXw w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10302"; a="323099369"
X-IronPort-AV: E=Sophos;i="5.90,225,1643702400"; d="scan'208";a="323099369"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2022 11:45:27 -0700
X-IronPort-AV: E=Sophos;i="5.90,225,1643702400"; d="scan'208";a="522460055"
Received: from gluca-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.48.194])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2022 11:45:26 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 03/12] drm/edid: add edid_block_tag() helper to get the
 EDID extension tag
Date: Thu, 31 Mar 2022 21:45:00 +0300
Message-Id: <3f27c67db63c186a48e83fdee2d1ac8a17714e78.1648752228.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1648752228.git.jani.nikula@intel.com>
References: <cover.1648752228.git.jani.nikula@intel.com>
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
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/drm_edid.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 82e00650af14..7c9ce5b0bd5b 100644
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

