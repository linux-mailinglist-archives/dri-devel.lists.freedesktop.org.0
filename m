Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D1EB4E735D
	for <lists+dri-devel@lfdr.de>; Fri, 25 Mar 2022 13:25:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F14010E3BB;
	Fri, 25 Mar 2022 12:25:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E60410E3BB;
 Fri, 25 Mar 2022 12:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648211153; x=1679747153;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iIBuLrma+vxzn/Z/Apj4PC99qGdthrECbZgiww/H/1Y=;
 b=HLRaOlK4PwJqxo8MPinXRHIvbfH0rB/nmyRERifPtgaQEAQIl8rkXTaG
 MPrb8JlsSDIbcTvAzZ6dgarnZhkH9Ef2nCOJRbCS8W/azeGYMpO4b7wOU
 Yzd8fFnoyb3dMJhR+uZOSBso6VcVl7gmEE+SqGlAG0jzQXSs8fU//fbHx
 WVYy0FqZaUovJiTP1kNwocLfxH3717pDmNMUX4JAnDwttnXYwCdhixQMj
 tOE689IKL6PMU4xxJ7C2AXIMS13thSgU562ckrEF2tY8/7lW8o957Un40
 KCiYyTv57pXR/qU/JzEqEXvWYdwYGOBpR60ddwAVAzRAuQ9UwosF6Zqt2 w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10296"; a="258337793"
X-IronPort-AV: E=Sophos;i="5.90,209,1643702400"; d="scan'208";a="258337793"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2022 05:25:53 -0700
X-IronPort-AV: E=Sophos;i="5.90,209,1643702400"; d="scan'208";a="650223586"
Received: from avgorshk-mobl.ccr.corp.intel.com (HELO localhost)
 ([10.252.35.183])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2022 05:25:51 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/9] drm/edid: use struct detailed_timing member access in
 is_rb()
Date: Fri, 25 Mar 2022 14:25:25 +0200
Message-Id: <7fd382f989d169f6a03c473699e1385dd145069e.1648210803.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1648210803.git.jani.nikula@intel.com>
References: <cover.1648210803.git.jani.nikula@intel.com>
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
 drivers/gpu/drm/drm_edid.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 48707eef1dc2..5396fa78e864 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -2405,15 +2405,17 @@ drm_for_each_detailed_block(u8 *raw_edid, detailed_cb *cb, void *closure)
 }
 
 static void
-is_rb(struct detailed_timing *t, void *data)
+is_rb(struct detailed_timing *timing, void *data)
 {
-	u8 *r = (u8 *)t;
+	bool *res = data;
 
-	if (!is_display_descriptor(t, EDID_DETAIL_MONITOR_RANGE))
+	if (!is_display_descriptor(timing, EDID_DETAIL_MONITOR_RANGE))
 		return;
 
-	if (r[15] & 0x10)
-		*(bool *)data = true;
+	BUILD_BUG_ON(offsetof(typeof(*timing), data.other_data.data.range.formula.cvt.flags) != 15);
+
+	if (timing->data.other_data.data.range.formula.cvt.flags & 0x10)
+		*res = true;
 }
 
 /* EDID 1.4 defines this explicitly.  For EDID 1.3, we guess, badly. */
-- 
2.30.2

