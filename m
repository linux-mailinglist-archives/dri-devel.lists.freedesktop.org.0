Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CEE94E7361
	for <lists+dri-devel@lfdr.de>; Fri, 25 Mar 2022 13:26:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0A7E10E4FC;
	Fri, 25 Mar 2022 12:26:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F08C810E5A4;
 Fri, 25 Mar 2022 12:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648211164; x=1679747164;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bTuISRUOz42f6W6vKjN6r3Nh5xsf4gWS+y1HtBiVPzc=;
 b=H/n4MESYMkCujE3zupMD3fOL+d5rpQsKhOv8anequtHuaI3ZCXcS1w5a
 jLxWnAangPvAO97m7L3B6PyqPZVrmn+j/1R8Z7iDoZgSR614Q6d2hFjFB
 ZGl4BbPlrw1sR+mS8/7rU1/fvt5DcfXz6oOb7JytCmBhgaFLtbc9jbhXo
 UxbvN9sznM+/JME3SMLB7Y0j677wozZsSnAzYgdZxBiMKiB36/CGvGJ4V
 1MC9Zz9B3QftSSbFPoAN1kFQXTQUHh7PMIEkXwFME8sQLExyZFSpncrIu
 h75drpkEqcealOmjyzCog7TyFMOniWbFSGAqICuKt+doN8jqvuEMq/nLs g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10296"; a="256189092"
X-IronPort-AV: E=Sophos;i="5.90,209,1643702400"; d="scan'208";a="256189092"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2022 05:25:58 -0700
X-IronPort-AV: E=Sophos;i="5.90,209,1643702400"; d="scan'208";a="501767384"
Received: from avgorshk-mobl.ccr.corp.intel.com (HELO localhost)
 ([10.252.35.183])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2022 05:25:56 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 4/9] drm/edid: use struct detailed_timing member access in
 gtf2 functions
Date: Fri, 25 Mar 2022 14:25:26 +0200
Message-Id: <a3efe539d68b72f99ec649cdd6f881d357b1d5fa.1648210803.git.jani.nikula@intel.com>
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
 drivers/gpu/drm/drm_edid.c | 57 +++++++++++++++++++++++++-------------
 1 file changed, 37 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 5396fa78e864..a9df75cdcc5b 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -2433,61 +2433,78 @@ drm_monitor_supports_rb(struct edid *edid)
 }
 
 static void
-find_gtf2(struct detailed_timing *t, void *data)
+find_gtf2(struct detailed_timing *timing, void *data)
 {
-	u8 *r = (u8 *)t;
+	struct detailed_timing **res = data;
 
-	if (!is_display_descriptor(t, EDID_DETAIL_MONITOR_RANGE))
+	if (!is_display_descriptor(timing, EDID_DETAIL_MONITOR_RANGE))
 		return;
 
-	if (r[10] == 0x02)
-		*(u8 **)data = r;
+	BUILD_BUG_ON(offsetof(typeof(*timing), data.other_data.data.range.flags) != 10);
+
+	if (timing->data.other_data.data.range.flags == 0x02)
+		*res = timing;
 }
 
 /* Secondary GTF curve kicks in above some break frequency */
 static int
 drm_gtf2_hbreak(struct edid *edid)
 {
-	u8 *r = NULL;
+	struct detailed_timing *timing = NULL;
+
+	drm_for_each_detailed_block((u8 *)edid, find_gtf2, &timing);
 
-	drm_for_each_detailed_block((u8 *)edid, find_gtf2, &r);
-	return r ? (r[12] * 2) : 0;
+	BUILD_BUG_ON(offsetof(typeof(*timing), data.other_data.data.range.formula.gtf2.hfreq_start_khz) != 12);
+
+	return timing ? timing->data.other_data.data.range.formula.gtf2.hfreq_start_khz * 2 : 0;
 }
 
 static int
 drm_gtf2_2c(struct edid *edid)
 {
-	u8 *r = NULL;
+	struct detailed_timing *timing = NULL;
+
+	drm_for_each_detailed_block((u8 *)edid, find_gtf2, &timing);
+
+	BUILD_BUG_ON(offsetof(typeof(*timing), data.other_data.data.range.formula.gtf2.c) != 13);
 
-	drm_for_each_detailed_block((u8 *)edid, find_gtf2, &r);
-	return r ? r[13] : 0;
+	return timing ? timing->data.other_data.data.range.formula.gtf2.c : 0;
 }
 
 static int
 drm_gtf2_m(struct edid *edid)
 {
-	u8 *r = NULL;
+	struct detailed_timing *timing = NULL;
 
-	drm_for_each_detailed_block((u8 *)edid, find_gtf2, &r);
-	return r ? (r[15] << 8) + r[14] : 0;
+	drm_for_each_detailed_block((u8 *)edid, find_gtf2, &timing);
+
+	BUILD_BUG_ON(offsetof(typeof(*timing), data.other_data.data.range.formula.gtf2.m) != 14);
+
+	return timing ? le16_to_cpu(timing->data.other_data.data.range.formula.gtf2.m) : 0;
 }
 
 static int
 drm_gtf2_k(struct edid *edid)
 {
-	u8 *r = NULL;
+	struct detailed_timing *timing = NULL;
+
+	drm_for_each_detailed_block((u8 *)edid, find_gtf2, &timing);
 
-	drm_for_each_detailed_block((u8 *)edid, find_gtf2, &r);
-	return r ? r[16] : 0;
+	BUILD_BUG_ON(offsetof(typeof(*timing), data.other_data.data.range.formula.gtf2.k) != 16);
+
+	return timing ? timing->data.other_data.data.range.formula.gtf2.k : 0;
 }
 
 static int
 drm_gtf2_2j(struct edid *edid)
 {
-	u8 *r = NULL;
+	struct detailed_timing *timing = NULL;
+
+	drm_for_each_detailed_block((u8 *)edid, find_gtf2, &timing);
+
+	BUILD_BUG_ON(offsetof(typeof(*timing), data.other_data.data.range.formula.gtf2.j) != 17);
 
-	drm_for_each_detailed_block((u8 *)edid, find_gtf2, &r);
-	return r ? r[17] : 0;
+	return timing ? timing->data.other_data.data.range.formula.gtf2.j : 0;
 }
 
 /**
-- 
2.30.2

