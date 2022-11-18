Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F41E62F40D
	for <lists+dri-devel@lfdr.de>; Fri, 18 Nov 2022 12:53:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD6EE10E6FC;
	Fri, 18 Nov 2022 11:53:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA0FA10E1F5;
 Fri, 18 Nov 2022 11:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668772380; x=1700308380;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=tJ2YH/qx93td2pW8yOzfU3fpvOktkXMM9du6wzxIY9Q=;
 b=KOLOkIUiN67z0bzlqw4t6t5Rb7c2q0kMsgsM6jfZpBD8ilohAgTNIvN8
 nMJI9sBeHkKcVDyYNlSJgoxo42cYchwVx0u7aBakujs6W77+khlpH5djN
 ouPjLeiAyR3FRWviXI5Gb56QTo3LrhcqwFswMfwXBHncS4wV7BsKukB9O
 ExJf3CH2KuDBWEkUwkSCvESBjNqG7v4erqjeJqrq8OHupACCm7O8PEFTW
 72i8A4/ljSbRaioh65OwXxdcyIMfsWtuyE2PJ+s/bBleTR3OM+rzfKHjM
 HuKThkGzkNcusvjO29NxKkicKsGdPpskj+Gp1wnJJI9OYKuWNuR/l8932 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10534"; a="375252553"
X-IronPort-AV: E=Sophos;i="5.96,174,1665471600"; d="scan'208";a="375252553"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2022 03:52:59 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10534"; a="709009168"
X-IronPort-AV: E=Sophos;i="5.96,174,1665471600"; d="scan'208";a="709009168"
Received: from richieox-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.209.178])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2022 03:52:58 -0800
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/i915: Fix workarounds on Gen2-3
Date: Fri, 18 Nov 2022 11:52:49 +0000
Message-Id: <20221118115249.2683946-1-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.34.1
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
Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

In 3653727560d0 ("drm/i915: Simplify internal helper function signature")
I broke the old platforms by not noticing engine workaround init does not
initialize the list on old platforms. Fix it by always initializing which
already does the right thing by mostly not doing anything if there aren't
any workarounds on the list.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Fixes: 3653727560d0 ("drm/i915: Simplify internal helper function signature")
Reported-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 drivers/gpu/drm/i915/gt/intel_workarounds.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
index 213160f29ec3..4d7a01b45e09 100644
--- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
+++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
@@ -2991,7 +2991,7 @@ general_render_compute_wa_init(struct intel_engine_cs *engine, struct i915_wa_li
 static void
 engine_init_workarounds(struct intel_engine_cs *engine, struct i915_wa_list *wal)
 {
-	if (I915_SELFTEST_ONLY(GRAPHICS_VER(engine->i915) < 4))
+	if (GRAPHICS_VER(engine->i915) < 4)
 		return;
 
 	engine_fake_wa_init(engine, wal);
@@ -3016,9 +3016,6 @@ void intel_engine_init_workarounds(struct intel_engine_cs *engine)
 {
 	struct i915_wa_list *wal = &engine->wa_list;
 
-	if (GRAPHICS_VER(engine->i915) < 4)
-		return;
-
 	wa_init_start(wal, engine->gt, "engine", engine->name);
 	engine_init_workarounds(engine, wal);
 	wa_init_finish(wal);
-- 
2.34.1

