Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CAEEF675A3C
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 17:41:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 566A110E027;
	Fri, 20 Jan 2023 16:41:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C76FA10EAAD;
 Fri, 20 Jan 2023 16:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674232888; x=1705768888;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Vv/F1KLWiNKMQCtGlnsWwh7HVyMiV4oF7jvh2rIsTMQ=;
 b=fJx44QDxE6FDdW5Is6pZe/bgQgaAcya1TA2Pqr3U4p/ZbeyHzq0mpTLD
 pkX9RYRxqRzJfR31JKhSHmCYs+2T13qEjHoJ8F15Bu0vmip1drPCOr/zG
 97nPdQNdMPgLNGi7Mkbtcp4lcPgKvADqdTjuzEBrYefEAl7H8/3C8o37I
 fimZrGkbYyM86lOwvaYZVb1bX3rQnpIs1802E7ks6b9VgcRGBxq+tTOg5
 2Cn7JBLefI4fdukyu0hvYxbkth6zRqHvZj4qEzILZSkn7dQiPRIYtwONg
 C61sufAtMN2pNb2TQfhWJS3hGu5xgY98ArVx9AxDOLq5gfEq7Yj5ExjFB A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="325656803"
X-IronPort-AV: E=Sophos;i="5.97,232,1669104000"; d="scan'208";a="325656803"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2023 08:41:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="749398882"
X-IronPort-AV: E=Sophos;i="5.97,232,1669104000"; d="scan'208";a="749398882"
Received: from irvmail001.ir.intel.com ([10.43.11.63])
 by FMSMGA003.fm.intel.com with ESMTP; 20 Jan 2023 08:41:27 -0800
Received: from mwajdecz-MOBL.ger.corp.intel.com
 (mwajdecz-MOBL.ger.corp.intel.com [10.249.145.153])
 by irvmail001.ir.intel.com (8.14.3/8.13.6/MailSET/Hub) with ESMTP id
 30KGfEfe023485; Fri, 20 Jan 2023 16:41:26 GMT
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH 4/8] drm/i915/guc: Update GuC messages in intel_guc_ct.c
Date: Fri, 20 Jan 2023 17:40:46 +0100
Message-Id: <20230120164050.1765-5-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20230120164050.1765-1-michal.wajdeczko@intel.com>
References: <20230120164050.1765-1-michal.wajdeczko@intel.com>
MIME-Version: 1.0
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
Cc: John Harrison <John.C.Harrison@Intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use new macros to have common prefix that also include GT#.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
index 2b22065e87bf..89adfc4193d2 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
@@ -11,6 +11,7 @@
 
 #include "i915_drv.h"
 #include "intel_guc_ct.h"
+#include "intel_guc_print.h"
 #include "gt/intel_gt.h"
 
 static inline struct intel_guc *ct_to_guc(struct intel_guc_ct *ct)
@@ -28,21 +29,16 @@ static inline struct drm_i915_private *ct_to_i915(struct intel_guc_ct *ct)
 	return ct_to_gt(ct)->i915;
 }
 
-static inline struct drm_device *ct_to_drm(struct intel_guc_ct *ct)
-{
-	return &ct_to_i915(ct)->drm;
-}
-
 #define CT_ERROR(_ct, _fmt, ...) \
-	drm_err(ct_to_drm(_ct), "CT: " _fmt, ##__VA_ARGS__)
+	guc_err(ct_to_guc(_ct), "CT: " _fmt, ##__VA_ARGS__)
 #ifdef CONFIG_DRM_I915_DEBUG_GUC
 #define CT_DEBUG(_ct, _fmt, ...) \
-	drm_dbg(ct_to_drm(_ct), "CT: " _fmt, ##__VA_ARGS__)
+	guc_dbg(ct_to_guc(_ct), "CT: " _fmt, ##__VA_ARGS__)
 #else
 #define CT_DEBUG(...)	do { } while (0)
 #endif
 #define CT_PROBE_ERROR(_ct, _fmt, ...) \
-	i915_probe_error(ct_to_i915(ct), "CT: " _fmt, ##__VA_ARGS__)
+	guc_probe_error(ct_to_guc(ct), "CT: " _fmt, ##__VA_ARGS__)
 
 /**
  * DOC: CTB Blob
-- 
2.25.1

