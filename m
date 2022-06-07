Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E7A65402C0
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jun 2022 17:50:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B48BC10E07D;
	Tue,  7 Jun 2022 15:50:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9692210E07D;
 Tue,  7 Jun 2022 15:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654617019; x=1686153019;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=F8PetSiKPp4cvob68gVCIGrjNFWOaMLO6XVmt8HVS3I=;
 b=SaaUFQIIebuJuAp4UYDQNDSTBDlb4QSj8mq90CxXu5Tv/oZudtnutzD0
 al+tpD9j+bmQNwrNaNv7oVuXzelLcYQfS7YSb0DaINDMtt6US6IOs826a
 nyjNTLsJjN1JiKmgvQ9/iIzsFlSVoue1zKs2YZi3+WhED1EsF78ISBt/j
 Kpc+l9nbGzKmErgqIIiMfGfX4u+pQ8eT7m1tK27I+nNoKhiUEg010ffVY
 CAV5fJxeOgu9kugC7BPIfOtKTg9z6Eqp8tuCw3gmiRzto1K+A5bgDdTgC
 iggzmDHbqlr+7Ype7TKrsRR+UbunUK1Khj4MhyaRHeOiHLo964MnWpBAA Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10371"; a="265211426"
X-IronPort-AV: E=Sophos;i="5.91,284,1647327600"; d="scan'208";a="265211426"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2022 08:48:01 -0700
X-IronPort-AV: E=Sophos;i="5.91,284,1647327600"; d="scan'208";a="826415207"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2022 08:48:01 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915/dg2: Correct DSS check for Wa_1308578152
Date: Tue,  7 Jun 2022 08:47:24 -0700
Message-Id: <20220607154724.3155521-1-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.35.3
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
Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When converting our DSS masks to bitmaps, we fumbled the condition used
to check whether any DSS are present in the first gslice.  Since
intel_sseu_find_first_xehp_dss() returns a 0-based number, we need a >=
condition rather than >.

Fixes: b87d39019651 ("drm/i915/sseu: Disassociate internal subslice mask representation from uapi")
Reported-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_workarounds.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
index 1b191b234160..67104ba8951e 100644
--- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
+++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
@@ -2079,7 +2079,7 @@ engine_fake_wa_init(struct intel_engine_cs *engine, struct i915_wa_list *wal)
 
 static bool needs_wa_1308578152(struct intel_engine_cs *engine)
 {
-	return intel_sseu_find_first_xehp_dss(&engine->gt->info.sseu, 0, 0) >
+	return intel_sseu_find_first_xehp_dss(&engine->gt->info.sseu, 0, 0) >=
 		GEN_DSS_PER_GSLICE;
 }
 
-- 
2.35.3

