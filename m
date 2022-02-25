Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A86754C4CB9
	for <lists+dri-devel@lfdr.de>; Fri, 25 Feb 2022 18:41:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A267A10E8A8;
	Fri, 25 Feb 2022 17:41:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8C9310E8AB;
 Fri, 25 Feb 2022 17:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645810904; x=1677346904;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=cIygZA8H0wV2V2MqFGFXxFa1gViw98lHB32WDZLZ+ns=;
 b=PnjYJeVmUPBVPN4Xj5qe1r+RgZBB2JSEfLUHdbj0JGZPaFVcIEJn4GqP
 3nGXhPj7/oRahxeiZMXs8AZcmOU92rbvQOyspEBviIPnIiUoaqUNHW2fj
 0Eo1S/8TqYi3uicYIv7JCj86HC/+gIYOISEimqV9gDng+YKEaLPNTPMoq
 xK0OV/Bddr1bjt3Znort6zb/JeuI+/cJlyg4MixyVfp1WeV9HoQlbTxem
 ypth13bWT56oIZAMZ8NwkYi0GYYn7nNgwQsiVJBIvY1khfrX1f3mGVhuq
 41mXGQODvEkxCIDEIT6OFIcazf6T8aa3htb6x1Y1ScLXDBJORRP2trDbp Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10268"; a="233168650"
X-IronPort-AV: E=Sophos;i="5.90,136,1643702400"; d="scan'208";a="233168650"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2022 09:41:27 -0800
X-IronPort-AV: E=Sophos;i="5.90,136,1643702400"; d="scan'208";a="549349933"
Received: from pkinsell-mobl.ger.corp.intel.com (HELO tursulin-mobl2.home)
 ([10.213.234.117])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2022 09:41:26 -0800
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org
Subject: [PATCH 1/2] drm/i915: Fix assert in i915_ggtt_pin
Date: Fri, 25 Feb 2022 17:41:17 +0000
Message-Id: <20220225174118.1320237-1-tvrtko.ursulin@linux.intel.com>
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
Cc: dri-devel@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Use lockdep_assert_not_held to simplify and correct the code. Otherwise
false positive are hit if lock state is uknown like after a previous
taint.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Reported-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/i915_vma.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
index 3558b16a929c..4469b7f52853 100644
--- a/drivers/gpu/drm/i915/i915_vma.c
+++ b/drivers/gpu/drm/i915/i915_vma.c
@@ -1552,9 +1552,7 @@ int i915_ggtt_pin(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
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

