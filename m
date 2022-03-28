Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 929CE4E99B9
	for <lists+dri-devel@lfdr.de>; Mon, 28 Mar 2022 16:35:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38F5C10E668;
	Mon, 28 Mar 2022 14:35:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A923510E662;
 Mon, 28 Mar 2022 14:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648478108; x=1680014108;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oAhfUXiMazft0Sk7OJlKeUDeL0NNjK33Z2dPTFGQWX8=;
 b=kdnl08Xj0E8nscUpGuFMpGRUbV5J+G7wXZips7hjnEmahONppln3Tq7s
 WyikjZVzKlUM1PAozp01hRdnzGwv0DQnkX19jmzCWho98khdf4m3UhXN2
 +YUBWJ0Bo1hYT62HIxoac1VcTPSLT7VYEG0lTsLfVvbkhk5yPHAdA0PBE
 MbazfWxpE6ZgZf45AfSz0ykAg03J7qbU8O0Q8caGq28D8VkOiI3Tmudy7
 dnYTXgVhBeMBCRsUGuH99WMH0IU8YP/jPWKWEkbYqZb1CugryVu6JsqP4
 dfKxXjkNmJaprO14NRGHlDfWhtgJi6bFDt/ufcfC0bL7IjOjPHgutIq7G g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10299"; a="322198033"
X-IronPort-AV: E=Sophos;i="5.90,217,1643702400"; d="scan'208";a="322198033"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2022 07:35:08 -0700
X-IronPort-AV: E=Sophos;i="5.90,217,1643702400"; d="scan'208";a="502532270"
Received: from aysivtso-mobl.ccr.corp.intel.com (HELO localhost)
 ([10.252.62.56])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2022 07:35:06 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 05/12] drm/edid: use struct detailed_timing member access
 in is_rb()
Date: Mon, 28 Mar 2022 17:34:26 +0300
Message-Id: <c069669c2fe8f9c3061c7d1a413c75a33ec48813.1648477901.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1648477901.git.jani.nikula@intel.com>
References: <cover.1648477901.git.jani.nikula@intel.com>
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
 drivers/gpu/drm/drm_edid.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 10da6b9b14fb..39c8bf4ca082 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -2408,15 +2408,19 @@ drm_for_each_detailed_block(u8 *raw_edid, detailed_cb *cb, void *closure)
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
+	BUILD_BUG_ON(offsetof(typeof(*descriptor), data.other_data.data.range.flags) != 10);
+	BUILD_BUG_ON(offsetof(typeof(*descriptor), data.other_data.data.range.formula.cvt.flags) != 15);
+
+	if (descriptor->data.other_data.data.range.flags == DRM_EDID_CVT_SUPPORT_FLAG &&
+	    descriptor->data.other_data.data.range.formula.cvt.flags & 0x10)
+		*res = true;
 }
 
 /* EDID 1.4 defines this explicitly.  For EDID 1.3, we guess, badly. */
-- 
2.30.2

