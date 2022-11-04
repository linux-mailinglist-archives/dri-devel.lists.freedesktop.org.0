Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE8F7619E98
	for <lists+dri-devel@lfdr.de>; Fri,  4 Nov 2022 18:23:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F1F110E02C;
	Fri,  4 Nov 2022 17:23:40 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEB5A10E961;
 Fri,  4 Nov 2022 17:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667582616; x=1699118616;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RbNywyY32xkqUqLQtgseZY7rjf5uA+sZ/9wA4vgH228=;
 b=A7peKLiJ+UPd5RwKL3dO5wfjaJlVy56SzQYPKhuvAzAav5k+06VWVapc
 j9YShakquEduM+QKuA9N+Aaxjh9sAEPzEH//7kKCSES2BDNNGT7wWKFA+
 zWF8+xD2EdyqWsmuXxjdYjRb49qeU6ISO8LY6ZzU36h/Q3tw6WC+eXzSB
 ZM7GQijBm5I4hAdoAbWL+2FtnnyMfmCFchKeVrpC8QtR1QPRXiqEqvVOk
 U44sVUTRZgxgPxf7+K3+gZVBIldOIvnwQ5fcRnoKScJi4JO0QuZVzgCYm
 M7D2n9Ref3dQHdt/EzeQrpwVN3HT0aa1R6qVcmcZHsR4RRbJymK10RB0k g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10521"; a="293350203"
X-IronPort-AV: E=Sophos;i="5.96,138,1665471600"; d="scan'208";a="293350203"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2022 10:23:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10521"; a="724422784"
X-IronPort-AV: E=Sophos;i="5.96,138,1665471600"; d="scan'208";a="724422784"
Received: from relo-linux-5.jf.intel.com ([10.165.21.154])
 by FMSMGA003.fm.intel.com with ESMTP; 04 Nov 2022 10:23:35 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH 1/2] drm/i915/gt: Add GT oriented dmesg output
Date: Fri,  4 Nov 2022 10:25:24 -0700
Message-Id: <20221104172525.569913-2-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221104172525.569913-1-John.C.Harrison@Intel.com>
References: <20221104172525.569913-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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
Cc: John Harrison <John.C.Harrison@Intel.com>, DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

When trying to analyse bug reports from CI, customers, etc. it can be
difficult to work out exactly what is happening on which GT in a
multi-GT system. So add GT oriented debug/error message wrappers. If
used instead of the drm_ equivalents, you get the same output but with
a GT# prefix on it.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt.h | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt.h b/drivers/gpu/drm/i915/gt/intel_gt.h
index e0365d5562484..1e016fb0117a4 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt.h
@@ -13,6 +13,21 @@
 struct drm_i915_private;
 struct drm_printer;
 
+#define GT_ERR(_gt, _fmt, ...) \
+	drm_err(&(_gt)->i915->drm, "GT%u: " _fmt, (_gt)->info.id, ##__VA_ARGS__)
+
+#define GT_WARN(_gt, _fmt, ...) \
+	drm_warn(&(_gt)->i915->drm, "GT%u: " _fmt, (_gt)->info.id, ##__VA_ARGS__)
+
+#define GT_NOTICE(_gt, _fmt, ...) \
+	drm_notice(&(_gt)->i915->drm, "GT%u: " _fmt, (_gt)->info.id, ##__VA_ARGS__)
+
+#define GT_INFO(_gt, _fmt, ...) \
+	drm_info(&(_gt)->i915->drm, "GT%u: " _fmt, (_gt)->info.id, ##__VA_ARGS__)
+
+#define GT_DBG(_gt, _fmt, ...) \
+	drm_dbg(&(_gt)->i915->drm, "GT%u: " _fmt, (_gt)->info.id, ##__VA_ARGS__)
+
 #define GT_TRACE(gt, fmt, ...) do {					\
 	const struct intel_gt *gt__ __maybe_unused = (gt);		\
 	GEM_TRACE("%s " fmt, dev_name(gt__->i915->drm.dev),		\
-- 
2.37.3

