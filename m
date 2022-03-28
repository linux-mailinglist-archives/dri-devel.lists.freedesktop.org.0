Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF1D14E90FE
	for <lists+dri-devel@lfdr.de>; Mon, 28 Mar 2022 11:18:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EAED10EB21;
	Mon, 28 Mar 2022 09:18:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C79E10EB21;
 Mon, 28 Mar 2022 09:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648459098; x=1679995098;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2zJZJqG0N7GQHilr3yQN0NDn/DXYmpQNBFZxXSeiiHo=;
 b=G9O46mewAl4LMHSJeIUmQTLnx0WCJ/y3dnj9KBehuYtZWAUTPG6ryf/y
 Zy/8+M2OZEGAiKwRXhhbakxUaah/SN0odkh3VlV22Y4gQGNfEmo/I5zAu
 vikTNrNUj3uxkmchb7bKoX5rMNpzZP6rlZeULB/dE4EfXuGnHMa2CmLEw
 wRgBT+ImnwixnzAIm5T717gtwfj2/EhB9P6ffhfyuKaMAKHqjUVaJWdcF
 XAVeTxGHqVUDaCsYZRWJaPUGFuVYiCTTpPd3NweBKaXL8aIBUHF/zrZsD
 cQw1LInznRNH2GC7Qa8FmbrfAyRQT3b9m7Up7j30XS9PJ8DDKcnMGinhp g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10299"; a="319655777"
X-IronPort-AV: E=Sophos;i="5.90,217,1643702400"; d="scan'208";a="319655777"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2022 02:17:59 -0700
X-IronPort-AV: E=Sophos;i="5.90,217,1643702400"; d="scan'208";a="638893109"
Received: from aysivtso-mobl.ccr.corp.intel.com (HELO localhost)
 ([10.252.62.56])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2022 02:17:57 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 05/11] drm/edid: use struct detailed_timing member access
 in is_rb()
Date: Mon, 28 Mar 2022 12:17:19 +0300
Message-Id: <a9dba61a0c6f9bea480786383a6a6e79499a7be2.1648458971.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1648458971.git.jani.nikula@intel.com>
References: <cover.1648458971.git.jani.nikula@intel.com>
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

Use struct detailed_timing member access instead of direct offsets to
avoid casting.

Use BUILD_BUG_ON() for sanity check.

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>

---

Note: Why can we use range.formula.cvt.flags directly in is_rb() while
gtf2 functions check for range.flags == 0x02 first to ensure it's gtf2?
---
 drivers/gpu/drm/drm_edid.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 586b0ed3b3dc..242f074f60d9 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -2406,15 +2406,21 @@ drm_for_each_detailed_block(u8 *raw_edid, detailed_cb *cb, void *closure)
 }
 
 static void
-is_rb(struct detailed_timing *t, void *data)
+is_rb(struct detailed_timing *descriptor, void *data)
 {
-	u8 *r = (u8 *)t;
+	bool *res = data;
 
-	if (!is_display_descriptor(t, EDID_DETAIL_MONITOR_RANGE))
+	if (!is_display_descriptor(descriptor, EDID_DETAIL_MONITOR_RANGE))
 		return;
 
-	if (r[10] == DRM_EDID_CVT_SUPPORT_FLAG && r[15] & 0x10)
-		*(bool *)data = true;
+	BUILD_BUG_ON(offsetof(typeof(*descriptor),
+			      data.descriptor.data.range.flags) != 10);
+	BUILD_BUG_ON(offsetof(typeof(*descriptor),
+			      data.descriptor.data.range.formula.cvt.flags) != 15);
+
+	if (descriptor->data.descriptor.data.range.flags == DRM_EDID_CVT_SUPPORT_FLAG &&
+	    descriptor->data.descriptor.data.range.formula.cvt.flags & 0x10)
+		*res = true;
 }
 
 /* EDID 1.4 defines this explicitly.  For EDID 1.3, we guess, badly. */
-- 
2.30.2

