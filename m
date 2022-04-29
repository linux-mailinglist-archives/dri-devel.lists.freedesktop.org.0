Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 145F4514C62
	for <lists+dri-devel@lfdr.de>; Fri, 29 Apr 2022 16:08:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 360B510ED3D;
	Fri, 29 Apr 2022 14:08:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C7E410ED3D;
 Fri, 29 Apr 2022 14:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651241290; x=1682777290;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=hovIyMEPTK0Zpoh0lsGscfOUbedVSi2bqhhTg2IDjSs=;
 b=YQV37nnXB9C7bI3gI0VeSNsAGE6luW4vLoWguJjEWXNFrVJ8r7cVjYm8
 /ZmbyLgH1NzIA6ecxuGX7eRY+1k/AMlIa1I/A1IlpX5wL1wYUd1RUfPwf
 GVrfRoCh5IJitYjzDGZR3OQPxDyMEPMdi/b87/q9xkIfZu0myyVZNLgfO
 zxxQeSgJQIffeoiGNQ1rCjJuwE0JpZ9nZDlVCpDiJqIeeilAnEZtbrwE1
 nR0gVpsBddRbQVvKU2rv87U+Utpez1BiSM5dtjhJyFiYyQ+xUW0QLW5Jf
 vzLbAY3WW+rIlk0gwq0Rz0v9DhH+NETqV3UHGikpwwkzCjgu8e1T38l2a A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10331"; a="266470831"
X-IronPort-AV: E=Sophos;i="5.91,185,1647327600"; d="scan'208";a="266470831"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2022 07:08:04 -0700
X-IronPort-AV: E=Sophos;i="5.91,185,1647327600"; d="scan'208";a="534503005"
Received: from pfowens-mobl2.ger.corp.intel.com (HELO tursulin-mobl2.home)
 ([10.213.234.194])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2022 07:08:03 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org
Subject: [CI] drm/i915: Fix assert in i915_ggtt_pin
Date: Fri, 29 Apr 2022 15:07:57 +0100
Message-Id: <20220429140757.651406-1-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Use lockdep_assert_not_held to simplify and correct the code. Otherwise
false positive are hit if lock state is uknown like after a previous
taint.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Reported-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
It's not pretty but it fired again and it's distracting so it will have to
do for now.
---
 drivers/gpu/drm/i915/i915_vma.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
index 162e8d83691b..e782ebfcc0ca 100644
--- a/drivers/gpu/drm/i915/i915_vma.c
+++ b/drivers/gpu/drm/i915/i915_vma.c
@@ -1565,9 +1565,7 @@ int i915_ggtt_pin(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
 	if (ww)
 		return __i915_ggtt_pin(vma, ww, align, flags);
 
-#ifdef CONFIG_LOCKDEP
-	WARN_ON(dma_resv_held(vma->obj->base.resv));
-#endif
+	lockdep_assert_not_held(&vma->obj->base.resv->lock.base);
 
 	for_i915_gem_ww(&_ww, err, true) {
 		err = i915_gem_object_lock(vma->obj, &_ww);
-- 
2.32.0

