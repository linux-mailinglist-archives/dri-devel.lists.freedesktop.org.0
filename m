Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20FED6EAC04
	for <lists+dri-devel@lfdr.de>; Fri, 21 Apr 2023 15:47:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D6EC10EE16;
	Fri, 21 Apr 2023 13:47:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13E3B10EE18;
 Fri, 21 Apr 2023 13:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682084848; x=1713620848;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=A5yOEgDInbrGFZpwhr75Bt2EYxXvm02NKtYnf9gyOsM=;
 b=IVDnV0BGPwaQqcsUoPPC0Wz5mdumYJv2xXjQce1u+FBkERCKJiW79G0u
 BIHmQoyTGUUI5Y1FWmmkj4b6jF9cItpm2E7JPSJONnrN3UIW3yM5LzsXO
 OuLFgkCB7JBunc97YzlDRzKEFzlYaYd/ji8fmhoDnqDtjIyBrMv86xSTy
 d/64GyiBLUYCYrJ7a0wJ1YlHZ6gUgOIMzx3DC4ZoTIvmujSsOK9Jr1Wui
 Xt260UFOQuZlob11deg5hrJ5oVkj6k/dMjIoMumBfRAVTZWLcscoTeE8Q
 lFODZhaCmSpGh8PrJ2MAerUSD07Hjc+LMaLxXmyZ+dmVt98VAwvlTllyl g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="347894207"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; d="scan'208";a="347894207"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2023 06:47:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="781599294"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; d="scan'208";a="781599294"
Received: from ppuente-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.251.214.65])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2023 06:47:22 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Intel GFX <intel-gfx@lists.freedesktop.org>,
 DRI Devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH 1/2] drm/i915/i915_drv: Use proper parameter naming in
 for_each_gt()
Date: Fri, 21 Apr 2023 15:46:53 +0200
Message-Id: <20230421134654.273182-2-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230421134654.273182-1-andi.shyti@linux.intel.com>
References: <20230421134654.273182-1-andi.shyti@linux.intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Andi Shyti <andi.shyti@kernel.org>, Andi Shyti <andi.shyti@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

for_each_gt() loops through engines in the GT, not in dev_priv.
Because it's misleading, call it "gt__" instead of "dev_priv__".

Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
---
 drivers/gpu/drm/i915/i915_drv.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index fe7eeafe9cff6..c16f8a3cd914f 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -381,11 +381,11 @@ static inline struct intel_gt *to_gt(struct drm_i915_private *i915)
 }
 
 /* Simple iterator over all initialised engines */
-#define for_each_engine(engine__, dev_priv__, id__) \
+#define for_each_engine(engine__, gt__, id__) \
 	for ((id__) = 0; \
 	     (id__) < I915_NUM_ENGINES; \
 	     (id__)++) \
-		for_each_if ((engine__) = (dev_priv__)->engine[(id__)])
+		for_each_if ((engine__) = (gt__)->engine[(id__)])
 
 /* Iterator over subset of engines selected by mask */
 #define for_each_engine_masked(engine__, gt__, mask__, tmp__) \
-- 
2.40.0

