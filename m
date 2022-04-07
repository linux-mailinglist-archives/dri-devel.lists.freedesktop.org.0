Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C9384F7B3F
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 11:14:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D023510E753;
	Thu,  7 Apr 2022 09:14:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CA2010E656;
 Thu,  7 Apr 2022 09:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649322895; x=1680858895;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XaDp3DJV+THGFW/cFPINCIEEAJ5+GOYXCAM3Znv1bZo=;
 b=K8qCnJH1eStIou/tr/M3B6JpItv2aSsmbSzABCXnH0XfIRheSmFSVh1E
 UrNNMaoUcqtpp3orNfAOZkr6SlLbLR17APW9XMVw4s4/94/kUo0r091xx
 1cuMZbJpAGrKma4w5xr2URshEkRjhx3EjLCaDnFUnAN7NjAER7OaSVcaD
 K27s/wFl//46Hc96g4XKQlBDQMaCtEGaPuTjTeQmDz/aFlBDbYPDB5hpF
 5fL3musTrDowNNO9FREvN2qm8ZncyWmCyK5JljqC2sKfAwF2EWdPvyydF
 otfh4tm7hRUWyn/zlmv/rleici7DILl8QqkSps31JXZjmlTmNOlzwrkdU Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10309"; a="248795092"
X-IronPort-AV: E=Sophos;i="5.90,241,1643702400"; d="scan'208";a="248795092"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2022 02:14:55 -0700
X-IronPort-AV: E=Sophos;i="5.90,241,1643702400"; d="scan'208";a="524844615"
Received: from kgibala-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.142.48])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2022 02:14:52 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 02/12] drm/edid: have edid_block_check() detect blocks that
 are all zero
Date: Thu,  7 Apr 2022 12:14:28 +0300
Message-Id: <eb493446e5a7fd442f78078dc49d83c6e458caa0.1649322799.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1649322799.git.jani.nikula@intel.com>
References: <cover.1649322799.git.jani.nikula@intel.com>
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

We have the check function, have it also detect blocks that are all zero
instead of leaving that to callers.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
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

