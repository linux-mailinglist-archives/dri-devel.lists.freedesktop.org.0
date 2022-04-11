Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 44D884FBE07
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 16:00:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08FAB10F265;
	Mon, 11 Apr 2022 14:00:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4359F10F265;
 Mon, 11 Apr 2022 14:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649685655; x=1681221655;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QNHoFBBWXtSyPpVQnFiac5kJ6TlTbdTmJH/pL2VOBH8=;
 b=gNuQFH75xc8JDq7HfR+rzcyPF7iHTQ5Y8QGXzQ58D1QdOeuUfHKb0iGi
 tJbEaqEpp5m611rFf4Cf2FbsmUYk2M1gNiad5mvGHKMN0SbTo0Ctopeqn
 WAQbctdRTd5ROk33zc4Jt6GSOCKm6k5bmFPNKxNt8TtAOE29Gl4gL3SV2
 yZeE3pj6x53LJiWdixg2U3F9HP2b+IQIvAmiVQTMFMXxFG/AGjqfVDj9J
 4hKoC/FqyYV972kFDU+HL6x2JQl9ZO9dILc3HKv26GUGrDOEMv0uGmUD/
 ibGMcWHTHuNymll4liIuv4p9KitxHLAY47pUlWaFCqV/80gM1bqvc8aNq A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10313"; a="259716374"
X-IronPort-AV: E=Sophos;i="5.90,252,1643702400"; d="scan'208";a="259716374"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2022 07:00:52 -0700
X-IronPort-AV: E=Sophos;i="5.90,252,1643702400"; d="scan'208";a="525987335"
Received: from lwit-desk1.ger.corp.intel.com (HELO localhost) ([10.249.143.43])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2022 07:00:49 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [CI v3 02/12] drm/edid: have edid_block_check() detect blocks that
 are all zero
Date: Mon, 11 Apr 2022 17:00:25 +0300
Message-Id: <f9ad302e6b7dbcd1dff98d94ec5500ce27bebe10.1649685475.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1649685475.git.jani.nikula@intel.com>
References: <cover.1649685475.git.jani.nikula@intel.com>
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

We have the check function, have it also detect blocks that are all zero
instead of leaving that to callers.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/drm_edid.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index f4da3f92f41b..f062d1715ec3 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -1671,6 +1671,7 @@ EXPORT_SYMBOL(drm_edid_are_equal);
 enum edid_block_status {
 	EDID_BLOCK_OK = 0,
 	EDID_BLOCK_NULL,
+	EDID_BLOCK_ZERO,
 	EDID_BLOCK_HEADER_CORRUPT,
 	EDID_BLOCK_HEADER_REPAIR,
 	EDID_BLOCK_HEADER_FIXED,
@@ -1689,15 +1690,23 @@ static enum edid_block_status edid_block_check(const void *_block,
 	if (is_base_block) {
 		int score = drm_edid_header_is_valid(block);
 
-		if (score < clamp(edid_fixup, 0, 8))
-			return EDID_BLOCK_HEADER_CORRUPT;
+		if (score < clamp(edid_fixup, 0, 8)) {
+			if (edid_block_is_zero(block))
+				return EDID_BLOCK_ZERO;
+			else
+				return EDID_BLOCK_HEADER_CORRUPT;
+		}
 
 		if (score < 8)
 			return EDID_BLOCK_HEADER_REPAIR;
 	}
 
-	if (edid_block_compute_checksum(block) != edid_block_get_checksum(block))
-		return EDID_BLOCK_CHECKSUM;
+	if (edid_block_compute_checksum(block) != edid_block_get_checksum(block)) {
+		if (edid_block_is_zero(block))
+			return EDID_BLOCK_ZERO;
+		else
+			return EDID_BLOCK_CHECKSUM;
+	}
 
 	if (is_base_block) {
 		if (block->version != 1)
@@ -1785,7 +1794,7 @@ bool drm_edid_block_valid(u8 *_block, int block_num, bool print_bad_edid,
 	}
 
 	if (!valid && print_bad_edid) {
-		if (edid_block_is_zero(block)) {
+		if (status == EDID_BLOCK_ZERO) {
 			pr_notice("EDID block is all zeroes\n");
 		} else {
 			pr_notice("Raw EDID:\n");
-- 
2.30.2

