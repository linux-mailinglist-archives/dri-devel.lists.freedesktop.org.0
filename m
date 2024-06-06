Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCB248FE695
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2024 14:35:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C520410E08B;
	Thu,  6 Jun 2024 12:35:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UQ1+usKq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D21410E08B;
 Thu,  6 Jun 2024 12:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717677308; x=1749213308;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=02QRQ9ckj2LjSze1krKDMbztHgYpEQuLy92Wm2FG+RE=;
 b=UQ1+usKqbftme4T5nQK3a9m+PXPM8ngtcLw3B9ldsnN2llzjoZIS2dXX
 o2DuGy/6NQvdLAGwxExtWJxsQgm9rCKqFu29jACwusCUY3aLrNmuoWJeu
 ofrpDUQ043qRQ/VBhadGRkfUVJk9HErFr3g4O5hsBgO3GS5WphNyNu+3s
 1qD/AB0F0xQeYiUIBp/IuVNBthc7rAZpcd4tnCSuM2rwwcnw9xA6sC0Oi
 NOnRywW0kLvlE+rOYBnXHTzcBpLFFUXVJglA1e9NXVTtI1j6x+wzhUFrZ
 zINLSXHky6NLgrOuIrrNQPkXELOokcBzK0mohT08UqmtbBf3V8ephnBbO Q==;
X-CSE-ConnectionGUID: yho7dUDsRyW2iRuxd0ncBQ==
X-CSE-MsgGUID: /om0u/McQ0OBMQq2KCjDaQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="14494070"
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; d="scan'208";a="14494070"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2024 05:35:07 -0700
X-CSE-ConnectionGUID: 5Qw985QhTLiK6jUcBc6rmg==
X-CSE-MsgGUID: cF/QfiGqT0O+F3pP90yZhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; d="scan'208";a="61138985"
Received: from unknown (HELO localhost) ([10.237.66.160])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2024 05:35:06 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org,
	jani.nikula@intel.com
Subject: [PATCH] drm/edid: reduce DisplayID log spamming
Date: Thu,  6 Jun 2024 15:35:03 +0300
Message-Id: <20240606123503.2825088-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Debug printing at DisplayID validation leads to lots of log spamming as
it's called at DisplayID iterators during EDID parsing. Remove it, and
replace with a less noisy message at connector EDID update.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_displayid.c | 3 ---
 drivers/gpu/drm/drm_edid.c      | 5 +++++
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_displayid.c b/drivers/gpu/drm/drm_displayid.c
index 9d01d762801f..b4fd43783c50 100644
--- a/drivers/gpu/drm/drm_displayid.c
+++ b/drivers/gpu/drm/drm_displayid.c
@@ -33,9 +33,6 @@ validate_displayid(const u8 *displayid, int length, int idx)
 	if (IS_ERR(base))
 		return base;
 
-	DRM_DEBUG_KMS("base revision 0x%x, length %d, %d %d\n",
-		      base->rev, base->bytes, base->prod_id, base->ext_count);
-
 	/* +1 for DispID checksum */
 	dispid_length = sizeof(*base) + base->bytes + 1;
 	if (dispid_length > length - idx)
diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index f68a41eeb1fa..9fc7292f5382 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -6629,6 +6629,11 @@ static void update_displayid_info(struct drm_connector *connector,
 
 	displayid_iter_edid_begin(drm_edid, &iter);
 	displayid_iter_for_each(block, &iter) {
+		drm_dbg_kms(connector->dev,
+			    "[CONNECTOR:%d:%s] DisplayID extension version 0x%02x, primary use 0x%02x\n",
+			    connector->base.id, connector->name,
+			    displayid_version(&iter),
+			    displayid_primary_use(&iter));
 		if (displayid_version(&iter) == DISPLAY_ID_STRUCTURE_VER_20 &&
 		    (displayid_primary_use(&iter) == PRIMARY_USE_HEAD_MOUNTED_VR ||
 		     displayid_primary_use(&iter) == PRIMARY_USE_HEAD_MOUNTED_AR))
-- 
2.39.2

