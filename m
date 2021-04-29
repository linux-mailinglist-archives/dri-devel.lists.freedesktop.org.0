Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5B0136E7BD
	for <lists+dri-devel@lfdr.de>; Thu, 29 Apr 2021 11:13:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4A706EDCA;
	Thu, 29 Apr 2021 09:13:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3CC06E1A7;
 Thu, 29 Apr 2021 09:13:07 +0000 (UTC)
IronPort-SDR: Q+Jk6EVnnsbPJoPrtv+K6+2cByLxh4Ph25262/MqQqY9V6PgJUu7tHti+vlpKDd11K2Hs/S5CZ
 4LjTSv36ibDw==
X-IronPort-AV: E=McAfee;i="6200,9189,9968"; a="197011312"
X-IronPort-AV: E=Sophos;i="5.82,258,1613462400"; d="scan'208";a="197011312"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2021 02:13:07 -0700
IronPort-SDR: mV26fsgb/uE6BmvjbqHYul0hFxA9Cqdwx4kEIDlmaHwsSB/n0kQeNFNHJRmuTVPnfWT+5A991M
 X+9BC8X5Za8w==
X-IronPort-AV: E=Sophos;i="5.82,258,1613462400"; d="scan'208";a="537298816"
Received: from gwaise-mobl1.ger.corp.intel.com (HELO tursulin-mobl2.home)
 ([10.213.208.64])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2021 02:13:06 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org
Subject: [PATCH 5/6] drm/i915/icl: Stop conflating mask and readback verify
Date: Thu, 29 Apr 2021 10:12:53 +0100
Message-Id: <20210429091254.855248-6-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210429091254.855248-1-tvrtko.ursulin@linux.intel.com>
References: <20210429091254.855248-1-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Add a new helper wa_write_no_verify for Wa_1604278689:icl,ehl which is
a write only register. This allows the mask to correctly reflect what
bits the workaround writes versus which bits it will verify during read-
back. In turn this will allow more safety checks to be added in a
following patch.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_workarounds.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
index 07579bb9b6a7..cd84c2a86787 100644
--- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
+++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
@@ -186,6 +186,12 @@ wa_write(struct i915_wa_list *wal, i915_reg_t reg, u32 set)
 	wa_write_clr_set(wal, reg, ~0, set);
 }
 
+static void
+wa_write_no_verify(struct i915_wa_list *wal, i915_reg_t reg, u32 set)
+{
+	wa_add(wal, reg, ~0, set, 0);
+}
+
 static void
 wa_write_or(struct i915_wa_list *wal, i915_reg_t reg, u32 set)
 {
@@ -616,9 +622,7 @@ static void icl_ctx_workarounds_init(struct intel_engine_cs *engine,
 
 	/* Wa_1604278689:icl,ehl */
 	wa_write(wal, IVB_FBC_RT_BASE, 0xFFFFFFFF & ~ILK_FBC_RT_VALID);
-	wa_write_clr_set(wal, IVB_FBC_RT_BASE_UPPER,
-			 0, /* write-only register; skip validation */
-			 0xFFFFFFFF);
+	wa_write_no_verify(wal, IVB_FBC_RT_BASE_UPPER, 0xFFFFFFFF);
 
 	/* Wa_1406306137:icl,ehl */
 	wa_masked_en(wal, GEN9_ROW_CHICKEN4, GEN11_DIS_PICK_2ND_EU);
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
