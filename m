Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D4C0C16BAB
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 21:07:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71F9710E657;
	Tue, 28 Oct 2025 20:07:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JLXTPriX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99AC210E657;
 Tue, 28 Oct 2025 20:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761682069; x=1793218069;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dKm7EbbMJfhQQJ6Fk0HrN3tG7hQMrWbdsDSdiHPZH4g=;
 b=JLXTPriXraH6S6yoNWG01kDIWZuJyJc2OmccslFWNTT2NxAlFccMMSbZ
 WwacmcNIcPvrFXZ0GWqm79c68SIHqyoRSmRpZFMUej4OMnJDWCu2OjlVB
 nEOCs2gVARZOCAfsHJC1gT8nd2OaHYWZd6KkDSnrJSAt6vsIj4eJ4Z4/R
 m/Atk22CFxPLihN9KZV5iSyx7pb7S0FeQnAKSrdTjtxkUzm4sVfcvm1IG
 34hEIcfG64RFgRW5snU4tbk7rSMhaf4Ao/WbkSpzSA8qA9kc+SzNJ+BfQ
 u97WC47uTnceCYFFmDY8S8LIopc/kVeekfMUfqSZ6SBLIi2DzgDvyuYBz g==;
X-CSE-ConnectionGUID: PSBY1++WQE2UPXmqXnDOgw==
X-CSE-MsgGUID: e2g3Vbg8RyOZGT/ZwThNMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="66410039"
X-IronPort-AV: E=Sophos;i="6.19,262,1754982000"; d="scan'208";a="66410039"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 13:07:48 -0700
X-CSE-ConnectionGUID: JXRdQxh2RFGlM539pvmYZg==
X-CSE-MsgGUID: VTzWAsqiSa+klAGfIRLRWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,262,1754982000"; d="scan'208";a="185366658"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.90])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 13:07:46 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 tiago.martins.araujo@gmail.com, jani.nikula@intel.com
Subject: [PATCH 3/3] drm/displayid: add quirk to ignore DisplayID checksum
 errors
Date: Tue, 28 Oct 2025 22:07:27 +0200
Message-ID: <c04d81ae648c5f21b3f5b7953f924718051f2798.1761681968.git.jani.nikula@intel.com>
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

Add a mechanism for DisplayID specific quirks, and add the first quirk
to ignore DisplayID section checksum errors.

It would be quite inconvenient to pass existing EDID quirks from
drm_edid.c for DisplayID parsing. Not all places doing DisplayID
iteration have the quirks readily available, and would have to pass it
in all places. Simply add a separate array of DisplayID specific EDID
quirks. We do end up checking it every time we iterate DisplayID blocks,
but hopefully the number of quirks remains small.

There are a few laptop models with DisplayID checksum failures, leading
to higher refresh rates only present in the DisplayID blocks being
ignored. Add a quirk for the panel in the machines.

Reported-by: Tiago Martins Araújo <tiago.martins.araujo@gmail.com>
Closes: https://lore.kernel.org/r/CACRbrPGvLP5LANXuFi6z0S7XMbAG4X5y2YOLBDxfOVtfGGqiKQ@mail.gmail.com
Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14703
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_displayid.c          | 41 +++++++++++++++++++++---
 drivers/gpu/drm/drm_displayid_internal.h |  2 ++
 2 files changed, 39 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_displayid.c b/drivers/gpu/drm/drm_displayid.c
index 20b453d2b854..58d0bb6d2676 100644
--- a/drivers/gpu/drm/drm_displayid.c
+++ b/drivers/gpu/drm/drm_displayid.c
@@ -9,6 +9,34 @@
 #include "drm_crtc_internal.h"
 #include "drm_displayid_internal.h"
 
+enum {
+	QUIRK_IGNORE_CHECKSUM,
+};
+
+struct displayid_quirk {
+	const struct drm_edid_ident ident;
+	u8 quirks;
+};
+
+static const struct displayid_quirk quirks[] = {
+	{
+		.ident = DRM_EDID_IDENT_INIT('C', 'S', 'O', 5142, "MNE007ZA1-5"),
+		.quirks = BIT(QUIRK_IGNORE_CHECKSUM),
+	},
+};
+
+static u8 get_quirks(const struct drm_edid *drm_edid)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(quirks); i++) {
+		if (drm_edid_match(drm_edid, &quirks[i].ident))
+			return quirks[i].quirks;
+	}
+
+	return 0;
+}
+
 static const struct displayid_header *
 displayid_get_header(const u8 *displayid, int length, int index)
 {
@@ -23,7 +51,7 @@ displayid_get_header(const u8 *displayid, int length, int index)
 }
 
 static const struct displayid_header *
-validate_displayid(const u8 *displayid, int length, int idx)
+validate_displayid(const u8 *displayid, int length, int idx, bool ignore_checksum)
 {
 	int i, dispid_length;
 	u8 csum = 0;
@@ -41,8 +69,11 @@ validate_displayid(const u8 *displayid, int length, int idx)
 	for (i = 0; i < dispid_length; i++)
 		csum += displayid[idx + i];
 	if (csum) {
-		DRM_NOTE("DisplayID checksum invalid, remainder is %d\n", csum);
-		return ERR_PTR(-EINVAL);
+		DRM_NOTE("DisplayID checksum invalid, remainder is %d%s\n", csum,
+			 ignore_checksum ? " (ignoring)" : "");
+
+		if (!ignore_checksum)
+			return ERR_PTR(-EINVAL);
 	}
 
 	return base;
@@ -52,6 +83,7 @@ static const u8 *find_next_displayid_extension(struct displayid_iter *iter)
 {
 	const struct displayid_header *base;
 	const u8 *displayid;
+	bool ignore_checksum = iter->quirks & BIT(QUIRK_IGNORE_CHECKSUM);
 
 	displayid = drm_edid_find_extension(iter->drm_edid, DISPLAYID_EXT, &iter->ext_index);
 	if (!displayid)
@@ -61,7 +93,7 @@ static const u8 *find_next_displayid_extension(struct displayid_iter *iter)
 	iter->length = EDID_LENGTH - 1;
 	iter->idx = 1;
 
-	base = validate_displayid(displayid, iter->length, iter->idx);
+	base = validate_displayid(displayid, iter->length, iter->idx, ignore_checksum);
 	if (IS_ERR(base))
 		return NULL;
 
@@ -76,6 +108,7 @@ void displayid_iter_edid_begin(const struct drm_edid *drm_edid,
 	memset(iter, 0, sizeof(*iter));
 
 	iter->drm_edid = drm_edid;
+	iter->quirks = get_quirks(drm_edid);
 }
 
 static const struct displayid_block *
diff --git a/drivers/gpu/drm/drm_displayid_internal.h b/drivers/gpu/drm/drm_displayid_internal.h
index 957dd0619f5c..5b1b32f73516 100644
--- a/drivers/gpu/drm/drm_displayid_internal.h
+++ b/drivers/gpu/drm/drm_displayid_internal.h
@@ -167,6 +167,8 @@ struct displayid_iter {
 
 	u8 version;
 	u8 primary_use;
+
+	u8 quirks;
 };
 
 void displayid_iter_edid_begin(const struct drm_edid *drm_edid,
-- 
2.47.3

