Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9850A3919AD
	for <lists+dri-devel@lfdr.de>; Wed, 26 May 2021 16:15:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C2566ED27;
	Wed, 26 May 2021 14:15:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 857606ED1B;
 Wed, 26 May 2021 14:15:34 +0000 (UTC)
IronPort-SDR: FTW4hAiM0TdyVLJtW+dnXSllbcQXbQ39U03C1hwv3skFe8JSPe5762tB/k1Ieq+PhEt4bIl0tH
 Wn8oNsqdnoPg==
X-IronPort-AV: E=McAfee;i="6200,9189,9996"; a="223660570"
X-IronPort-AV: E=Sophos;i="5.82,331,1613462400"; d="scan'208";a="223660570"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2021 07:15:10 -0700
IronPort-SDR: AZmF54z4FVa7erOv61PoB6Md6tGIOYsqCEJkNaVINkympvLPPai5rQfALVhrFEOpCbsh7pzGx/
 Uj8CDdefZqxg==
X-IronPort-AV: E=Sophos;i="5.82,331,1613462400"; d="scan'208";a="547206302"
Received: from wardmich-mobl.ger.corp.intel.com (HELO tursulin-mobl2.home)
 ([10.213.209.181])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2021 07:15:09 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org
Subject: [PATCH 04/12] drm/i915: Wrap cmpxchg64 with try_cmpxchg64() helper
Date: Wed, 26 May 2021 15:14:48 +0100
Message-Id: <20210526141456.2334192-5-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210526141456.2334192-1-tvrtko.ursulin@linux.intel.com>
References: <20210526141456.2334192-1-tvrtko.ursulin@linux.intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>, dri-devel@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Wilson <chris@chris-wilson.co.uk>

Wrap cmpxchg64 with a try_cmpxchg()-esque helper. Hiding the old-value
dance in the helper allows for cleaner code.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 drivers/gpu/drm/i915/i915_utils.h | 32 +++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/gpu/drm/i915/i915_utils.h b/drivers/gpu/drm/i915/i915_utils.h
index c3d234133da7..a42d9ddd0415 100644
--- a/drivers/gpu/drm/i915/i915_utils.h
+++ b/drivers/gpu/drm/i915/i915_utils.h
@@ -475,4 +475,36 @@ void __mark_lock_used_irq(struct lockdep_map *lock);
  */
 #define IS_ACTIVE(config) ((config) != 0)
 
+#ifndef try_cmpxchg64
+#if IS_ENABLED(CONFIG_64BIT)
+#define try_cmpxchg64(_ptr, _pold, _new) try_cmpxchg(_ptr, _pold, _new)
+#else
+#define try_cmpxchg64(_ptr, _pold, _new)				\
+({									\
+	__typeof__(_ptr) _old = (__typeof__(_ptr))(_pold);		\
+	__typeof__(*(_ptr)) __old = *_old;				\
+	__typeof__(*(_ptr)) __cur = cmpxchg64(_ptr, __old, _new);	\
+	bool success = __cur == __old;					\
+	if (unlikely(!success))						\
+		*_old = __cur;						\
+	likely(success);						\
+})
+#endif
+#endif
+
+#ifndef xchg64
+#if IS_ENABLED(CONFIG_64BIT)
+#define xchg64(_ptr, _new) xchg(_ptr, _new)
+#else
+#define xchg64(_ptr, _new)						\
+({									\
+	__typeof__(_ptr) __ptr = (_ptr);				\
+	__typeof__(*(_ptr)) __old = *__ptr;				\
+	while (!try_cmpxchg64(__ptr, &__old, (_new)))			\
+		;							\
+	__old;								\
+})
+#endif
+#endif
+
 #endif /* !__I915_UTILS_H */
-- 
2.30.2

