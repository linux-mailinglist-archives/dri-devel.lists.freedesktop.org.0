Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E0EEC16BA2
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 21:07:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D66310E65C;
	Tue, 28 Oct 2025 20:07:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YwR6UvcQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B194B10E65A;
 Tue, 28 Oct 2025 20:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761682058; x=1793218058;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=upK4vOr7hmLUn2XNy0qE/BRB7azM7QZ4p5+nwLfUSuM=;
 b=YwR6UvcQUKQuFyZgRs3kYecf8+v5s4xoyaaECDqXQXxekb4LvyuwsNNT
 D04x2RmBRJxbvOc/StTLrowJZu1coydFXybA86KtVpt++1jxG/N0gDuTX
 FdnDWckG9DHsNq3/4GHJyOIcWz7JaUH3rtTQCugLZssOgbp1v7UyCat5b
 V0S4I/7BlWi8Yb3P44XhV2bzy5X1Mq7rf7mbFv25bvn2JLFZmoMFO6k3J
 4OfXJUH3zR4ov3tlckawl/+IuoTKr9Hw/dwueUqfrHiCZW8pSVKFIL69f
 jzcpzn9eooxpGukhv896pN6P1nHbx57yjaGyeApzL/A9/kIEEfaXlDcCX g==;
X-CSE-ConnectionGUID: 3U4kroxUSJ++ccQ9mbYfqg==
X-CSE-MsgGUID: jRZeHXhiS8eYv2E6gBABtg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="67657951"
X-IronPort-AV: E=Sophos;i="6.19,262,1754982000"; d="scan'208";a="67657951"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 13:07:38 -0700
X-CSE-ConnectionGUID: 6QOADa3ATdqiFaje1Y/DZg==
X-CSE-MsgGUID: bOpxi/GeSBKHQMI5rb0pAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,262,1754982000"; d="scan'208";a="185085224"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.90])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 13:07:36 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 tiago.martins.araujo@gmail.com, jani.nikula@intel.com
Subject: [PATCH 1/3] drm/displayid: pass iter to drm_find_displayid_extension()
Date: Tue, 28 Oct 2025 22:07:25 +0200
Message-ID: <3837ae7f095e77a082ac2422ce2fac96c4f9373d.1761681968.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1761681968.git.jani.nikula@intel.com>
References: <cover.1761681968.git.jani.nikula@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It's more convenient to pass iter than a handful of its members to
drm_find_displayid_extension(), especially as we're about to add another
member.

Rename the function find_next_displayid_extension() while at it, to be
more descriptive.

Cc: Tiago Martins Araújo <tiago.martins.araujo@gmail.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_displayid.c | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/drm_displayid.c b/drivers/gpu/drm/drm_displayid.c
index b4fd43783c50..20b453d2b854 100644
--- a/drivers/gpu/drm/drm_displayid.c
+++ b/drivers/gpu/drm/drm_displayid.c
@@ -48,26 +48,24 @@ validate_displayid(const u8 *displayid, int length, int idx)
 	return base;
 }
 
-static const u8 *drm_find_displayid_extension(const struct drm_edid *drm_edid,
-					      int *length, int *idx,
-					      int *ext_index)
+static const u8 *find_next_displayid_extension(struct displayid_iter *iter)
 {
 	const struct displayid_header *base;
 	const u8 *displayid;
 
-	displayid = drm_edid_find_extension(drm_edid, DISPLAYID_EXT, ext_index);
+	displayid = drm_edid_find_extension(iter->drm_edid, DISPLAYID_EXT, &iter->ext_index);
 	if (!displayid)
 		return NULL;
 
 	/* EDID extensions block checksum isn't for us */
-	*length = EDID_LENGTH - 1;
-	*idx = 1;
+	iter->length = EDID_LENGTH - 1;
+	iter->idx = 1;
 
-	base = validate_displayid(displayid, *length, *idx);
+	base = validate_displayid(displayid, iter->length, iter->idx);
 	if (IS_ERR(base))
 		return NULL;
 
-	*length = *idx + sizeof(*base) + base->bytes;
+	iter->length = iter->idx + sizeof(*base) + base->bytes;
 
 	return displayid;
 }
@@ -126,10 +124,7 @@ __displayid_iter_next(struct displayid_iter *iter)
 		/* The first section we encounter is the base section */
 		bool base_section = !iter->section;
 
-		iter->section = drm_find_displayid_extension(iter->drm_edid,
-							     &iter->length,
-							     &iter->idx,
-							     &iter->ext_index);
+		iter->section = find_next_displayid_extension(iter);
 		if (!iter->section) {
 			iter->drm_edid = NULL;
 			return NULL;
-- 
2.47.3

