Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0B3E4B3249
	for <lists+dri-devel@lfdr.de>; Sat, 12 Feb 2022 02:04:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C2BD10EB76;
	Sat, 12 Feb 2022 01:04:28 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18FED10EB30;
 Sat, 12 Feb 2022 01:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644627866; x=1676163866;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=JoXk/LX33R71U0UqNFJDbdx8S950Fpv5sBcoRuTgI0U=;
 b=N2HVf8uGg9AHApKnDHydRIaK+lZE+xmWQHlJ2EfxgwnT0czTUH2gRPr2
 ecpF/ksy0ocCg0wRMH4PinyYe0UOXCh1aL9wvoxZr3/3aSj9FH6Kuz5Zs
 npineozGGuqER5pa83Yh9XUT1d1ULNWmUy7NhpvVK5M9tAGoPaVNYdNi0
 PLGXaP77fngbcVnbjOj7TPLNXWccgVF8BxbnzzP1yeOOmb1elOTjLG62S
 YhdqA9NO5UonikUkB34wzoIn/Lk+5f80hHcoxumyOax9XddekRRQRsiPe
 l/J/WgYPGjlUCAhxN5sPRKmkDRWtDa5IdMJQJIP22ECnjkuNrl4X2nS6c A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10255"; a="336261271"
X-IronPort-AV: E=Sophos;i="5.88,361,1635231600"; d="scan'208";a="336261271"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 17:04:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,361,1635231600"; d="scan'208";a="542308223"
Received: from relo-linux-5.jf.intel.com ([10.165.21.134])
 by orsmga008.jf.intel.com with ESMTP; 11 Feb 2022 17:04:25 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH v2] drm/i915/guc: Do not complain about stale reset
 notifications
Date: Fri, 11 Feb 2022 17:04:25 -0800
Message-Id: <20220212010425.3643192-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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
Cc: John Harrison <John.C.Harrison@Intel.com>, DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

It is possible for reset notifications to arrive for a context that is
in the process of being banned. So don't flag these as an error, just
report it as informational (because it is still useful to know that
resets are happening even if they are being ignored).

v2: Better wording for the message (review feedback from Tvrtko).

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index b3a429a92c0d..3afff24b8f24 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -4022,10 +4022,10 @@ static void guc_handle_context_reset(struct intel_guc *guc,
 		capture_error_state(guc, ce);
 		guc_context_replay(ce);
 	} else {
-		drm_err(&guc_to_gt(guc)->i915->drm,
-			"Invalid GuC engine reset notificaion for 0x%04X on %s: banned = %d, blocked = %d",
-			ce->guc_id.id, ce->engine->name, intel_context_is_banned(ce),
-			context_blocked(ce));
+		drm_info(&guc_to_gt(guc)->i915->drm,
+			 "Ignoring context reset notification for 0x%04X on %s: banned = %d, blocked = %d",
+			 ce->guc_id.id, ce->engine->name, intel_context_is_banned(ce),
+			 context_blocked(ce));
 	}
 }
 
-- 
2.25.1

