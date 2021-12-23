Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C66347DD61
	for <lists+dri-devel@lfdr.de>; Thu, 23 Dec 2021 02:31:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A70910E1DF;
	Thu, 23 Dec 2021 01:31:30 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D449810E1BB;
 Thu, 23 Dec 2021 01:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640223088; x=1671759088;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=C82B1KRBO7hHNmCFvhZRaQeIfnCCMtaTmGJC7nQ5HPw=;
 b=QUijWE+04AswIR1VuvgFtNpgZKcZCWzii331EO1iO2lbPe8mH33TtcCy
 KvhpiZr7lxoX2CRofSUCg4hlmhSClxslqnhqf/awxdcC3KgD68mmP1MNw
 BTUdwbB662zxr19nvePB9Cs/oSF6BFRTF7xr0o59KRyX1K44/rzxBb9xv
 LdPjVsDjSJwEFZLUj8R1m/RcFBLavNlZL7+sZHgBmEKteU14/V0j3Lr7l
 lm+H1+bHnB+ecRO27SQqHXomKVvPJ9IIiVtgNPI4X77TWqTXVuMNOaEzi
 hOfcjRmVWp60fACLGwFImVuAJqKJGdCCSl6a8LARISA5yrGKKDDjGBt1d w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10206"; a="240688347"
X-IronPort-AV: E=Sophos;i="5.88,228,1635231600"; d="scan'208";a="240688347"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2021 17:31:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,228,1635231600"; d="scan'208";a="484933853"
Received: from relo-linux-5.jf.intel.com ([10.165.21.134])
 by orsmga002.jf.intel.com with ESMTP; 22 Dec 2021 17:31:28 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH] drm/i915/guc: Report error on invalid reset notification
Date: Wed, 22 Dec 2021 17:31:28 -0800
Message-Id: <20211223013128.1739792-1-John.C.Harrison@Intel.com>
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

Don't silently drop reset notifications from the GuC. It might not be
safe to do an error capture but we still want some kind of report that
the reset happened.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index e7517206af82..0fbf24b8d5e1 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -3979,6 +3979,11 @@ static void guc_handle_context_reset(struct intel_guc *guc,
 		   !context_blocked(ce))) {
 		capture_error_state(guc, ce);
 		guc_context_replay(ce);
+	} else {
+		drm_err(&guc_to_gt(guc)->i915->drm,
+			"Invalid GuC engine reset notificaion for 0x%04X on %s: banned = %d, blocked = %d",
+			ce->guc_id.id, ce->engine->name, intel_context_is_banned(ce),
+			context_blocked(ce));
 	}
 }
 
-- 
2.25.1

