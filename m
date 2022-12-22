Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DA53654880
	for <lists+dri-devel@lfdr.de>; Thu, 22 Dec 2022 23:30:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DB4810E5C9;
	Thu, 22 Dec 2022 22:29:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33B3F10E59A;
 Thu, 22 Dec 2022 22:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671748121; x=1703284121;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=udy3o7Zh3bLx5Qyst2WymzJlU/6Te2eQtfE6CrJkhxo=;
 b=eWZpg94Z14ImqdIwFS/fOLwBU7/pBRxEGK9oSNZY5XOKmvd6sGH5ZHDD
 0Evs9172LH/KmLJJlD8RsvU8f3oLqWukRk1A4M37EBtzvxsqWXgDUCqUC
 7Gua5y3C/VEFXJ5nnQqHjlJKJvFas0B8/U/SpYr85hwU/0VYV/QgPoYVt
 6ey2byZxk9EksSaeGWcpl+a/KH01gKfQ+areSy24XJvIaZjhVIS9gkTIJ
 WsoLVleWXdzbdYxeGHhwzf+zDzQJtlPYa2oaBl93x8U1kW6wIiHvOng2q
 Clav9zJBFHPLwwZ+3q9VKWzq4IgslX2BxYmvuHSOlbSAKkZcdZYxteUnH w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10569"; a="406472861"
X-IronPort-AV: E=Sophos;i="5.96,266,1665471600"; d="scan'208";a="406472861"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2022 14:28:40 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10569"; a="645412323"
X-IronPort-AV: E=Sophos;i="5.96,266,1665471600"; d="scan'208";a="645412323"
Received: from jons-linux-dev-box.fm.intel.com ([10.1.27.20])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2022 14:28:39 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [RFC PATCH 13/20] drm/i915/display: Add more macros to remove all
 direct calls to uncore
Date: Thu, 22 Dec 2022 14:21:20 -0800
Message-Id: <20221222222127.34560-14-matthew.brost@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221222222127.34560-1-matthew.brost@intel.com>
References: <20221222222127.34560-1-matthew.brost@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_de.h | 38 +++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_de.h b/drivers/gpu/drm/i915/display/intel_de.h
index 3dbd76fdabd6..3394044d281c 100644
--- a/drivers/gpu/drm/i915/display/intel_de.h
+++ b/drivers/gpu/drm/i915/display/intel_de.h
@@ -9,6 +9,7 @@
 #include "i915_drv.h"
 #include "i915_trace.h"
 #include "intel_uncore.h"
+#include "intel_pcode.h"
 
 static inline u32
 intel_de_read(struct drm_i915_private *i915, i915_reg_t reg)
@@ -116,4 +117,41 @@ intel_de_write_notrace(struct drm_i915_private *i915, i915_reg_t reg, u32 val)
 	intel_uncore_write_notrace(&i915->uncore, reg, val);
 }
 
+static inline void
+intel_de_write_samevalue(struct drm_i915_private *i915, i915_reg_t reg)
+{
+	spin_lock_irq(&i915->uncore.lock);
+	intel_de_write_fw(i915, reg, intel_de_read_fw(i915, reg));
+	spin_unlock_irq(&i915->uncore.lock);
+}
+
+static inline int
+intel_de_pcode_write_timeout(struct drm_i915_private *i915, u32 mbox, u32 val,
+			    int fast_timeout_us, int slow_timeout_ms)
+{
+	return snb_pcode_write_timeout(&i915->uncore, mbox, val,
+				       fast_timeout_us, slow_timeout_ms);
+}
+
+static inline int
+intel_de_pcode_write(struct drm_i915_private *i915, u32 mbox, u32 val)
+{
+
+	return snb_pcode_write(&i915->uncore, mbox, val);
+}
+
+static inline int
+intel_de_pcode_read(struct drm_i915_private *i915, u32 mbox, u32 *val, u32 *val1)
+{
+	return snb_pcode_read(&i915->uncore, mbox, val, val1);
+}
+
+static inline int intel_de_pcode_request(struct drm_i915_private *i915, u32 mbox,
+					 u32 request, u32 reply_mask, u32 reply,
+					 int timeout_base_ms)
+{
+	return skl_pcode_request(&i915->uncore, mbox, request, reply_mask, reply,
+				 timeout_base_ms);
+}
+
 #endif /* __INTEL_DE_H__ */
-- 
2.37.3

