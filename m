Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4E36486EDF
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jan 2022 01:31:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34E0610E8D8;
	Fri,  7 Jan 2022 00:31:46 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C89510E8D8;
 Fri,  7 Jan 2022 00:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641515505; x=1673051505;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2ICm2V0/8/FUyE/YDMNlYnbVn19ewlzoaVf+eUJiAH0=;
 b=UrBc5g05W8f4HgEMmM3Wpa3JRaZpLIIXVP7k3vPZS5IB0BD21gr5/63W
 jtiYANIsTHMJXq0k7Dss7gdf0n7BHS08SpS39O9BgFjO+K5FdfposPEaj
 eXS8F9ffXVqEC9/SpcJaxgAg0mrIQx7sLmIoyG+N0pNuSoyEyz9Klj9cV
 2mZLW7cNekeg/mPoW/bYm+yX3ztq8t4EPS0eON7VXGLX30frfa9Rt/ktM
 A2wKdWjxGLh1TYgdu4BX7sMFFhXG4YArTiw+LrOxKdR2tikSFJUsi0hVy
 wFfEre2IzVJlb5Q7I/Vc7DlMjqzB3/tyqzkS7e9L1DssAeGs9KYi0VywX g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10217"; a="306137162"
X-IronPort-AV: E=Sophos;i="5.88,268,1635231600"; d="scan'208";a="306137162"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2022 16:31:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,268,1635231600"; d="scan'208";a="489119238"
Received: from relo-linux-5.jf.intel.com ([10.165.21.134])
 by orsmga002.jf.intel.com with ESMTP; 06 Jan 2022 16:31:43 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH] drm/i915/guc: Don't error on reset of banned context
Date: Thu,  6 Jan 2022 16:31:43 -0800
Message-Id: <20220107003143.326046-1-John.C.Harrison@Intel.com>
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

There is a race (already documented in the code) whereby a context can
be (re-)queued for submission at the same time as it is being banned
due to a hang and reset. That leads to a hang/reset report from GuC
for a context which i915 thinks is already banned.

While the race is indented to be fixed in a future GuC update, there
is no actual harm beyond the wasted execution time of that new hang
detection period. The context has already been banned for bad
behaviour so a fresh hang is hardly surprising and certainly isn't
going to be losing any work that wouldn't already have been lost if
there was no race.

So don't treat this situation as an error. The error message is seen
by the CI system as something fatal and causes test failures. Instead,
just print an informational so the user at least knows a context reset
occurred (given that the error capture is being skipped).

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 9989d121127d..e8a32a7e7daf 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -3978,6 +3978,10 @@ static void guc_handle_context_reset(struct intel_guc *guc,
 		   !context_blocked(ce))) {
 		capture_error_state(guc, ce);
 		guc_context_replay(ce);
+	} else if (intel_context_is_banned(ce)) {
+		drm_info(&guc_to_gt(guc)->i915->drm,
+			 "Reset notificaion for banned context 0x%04X on %s",
+			 ce->guc_id.id, ce->engine->name);
 	} else {
 		drm_err(&guc_to_gt(guc)->i915->drm,
 			"Invalid GuC engine reset notificaion for 0x%04X on %s: banned = %d, blocked = %d",
-- 
2.25.1

