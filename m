Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0723E5BA32F
	for <lists+dri-devel@lfdr.de>; Fri, 16 Sep 2022 01:27:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D31B10EC14;
	Thu, 15 Sep 2022 23:27:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9060C10EC12;
 Thu, 15 Sep 2022 23:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663284420; x=1694820420;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=32adMwr+xoi5uUOPdlifc4/erY9Xxj+lmU5EL0uD9Rg=;
 b=KsOuuellYuDWGJgoH8lMNJMeTPQP64Q574u+GeSC3/Djf1e93h8hhRnv
 P3XpKq28LZVxZCLFxXb1MKlKJK3Oa5MCsT80EhnaOgHjDMrB8OWT29MqG
 5w6zH7gSk9H4jfr+0xk38EHlMHHYSnE/XPebrNNjvbbrCneGlGq+NxiqS
 OOtC1We8vLmkrxNojyNnq+pOMj7+i1J8W+gP5zACkuUtR95krpcHPm9mL
 E0MiVvjzRLpHknRKVaeTJzSQsg2Bo1hCRS/kAW6KFSs+YuSb6PMp+/7RX
 3r29IAX/QNhJUDHAgi+2btZcCsnURacJuP5sp15CYBaI6zU44Qm5+fqPF w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10471"; a="299689108"
X-IronPort-AV: E=Sophos;i="5.93,319,1654585200"; d="scan'208";a="299689108"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2022 16:26:59 -0700
X-IronPort-AV: E=Sophos;i="5.93,319,1654585200"; d="scan'208";a="685923299"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2022 16:26:59 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 1/4] drm/i915/gt: Cleanup partial engine discovery failures
Date: Thu, 15 Sep 2022 16:26:51 -0700
Message-Id: <20220915232654.3283095-2-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220915232654.3283095-1-matthew.d.roper@intel.com>
References: <20220915232654.3283095-1-matthew.d.roper@intel.com>
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
Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Chris Wilson <chris.p.wilson@intel.com>, dri-devel@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Wilson <chris.p.wilson@intel.com>

If we abort driver initialisation in the middle of gt/engine discovery,
some engines will be fully setup and some not. Those incompletely setup
engines only have 'engine->release == NULL' and so will leak any of the
common objects allocated.

v2:
 - Drop the destroy_pinned_context() helper for now.  It's not really
   worth it with just a single callsite at the moment.  (Janusz)

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_engine_cs.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
index 1f7188129cd1..2ddcad497fa3 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
@@ -1274,8 +1274,13 @@ int intel_engines_init(struct intel_gt *gt)
 			return err;
 
 		err = setup(engine);
-		if (err)
+		if (err) {
+			intel_engine_cleanup_common(engine);
 			return err;
+		}
+
+		/* The backend should now be responsible for cleanup */
+		GEM_BUG_ON(engine->release == NULL);
 
 		err = engine_init_common(engine);
 		if (err)
-- 
2.37.3

