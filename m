Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61EAC6838D7
	for <lists+dri-devel@lfdr.de>; Tue, 31 Jan 2023 22:44:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CBDB10E2BD;
	Tue, 31 Jan 2023 21:44:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92BF610E2BA;
 Tue, 31 Jan 2023 21:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675201461; x=1706737461;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=cZidDXHL/IDAvgcMIRA+zwP+GRrWYlFlPE4VDinv6zc=;
 b=bLo+NLjWjVJL9T6QFQd1yWs6kU43LeqW2DphjdCp/CcUaSp28HIhWcZL
 f+KkJQBKW6pdnxeXVIfPepGOuR7/jjVujg+8CjywcCXZapuz9PoNd5Xmy
 Tpcqxo2hhGyGEOGlRNA8ZeE+Id9pLBDEFu+KUmuol0zExd5RXECdcV0zt
 wrc/7bQ++v1v5hDTMUFilZcNZxLFuJyrgg3GAci5Z6vtVgOAb4CsLCMe3
 KnotjioFDeiCqDVgJzDwHc4eLkqrFddUh53bdUYkfhl6NwVbOiOkTQRoJ
 zdrHeCeCr4g2VjrQiqo0aUFZwXBVcrrnBE6F8I9198lODXbbIwy02RUJ7 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="327981350"
X-IronPort-AV: E=Sophos;i="5.97,261,1669104000"; d="scan'208";a="327981350"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2023 13:44:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="910064958"
X-IronPort-AV: E=Sophos;i="5.97,261,1669104000"; d="scan'208";a="910064958"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmsmga006.fm.intel.com with ESMTP; 31 Jan 2023 13:44:19 -0800
Received: from mwajdecz-MOBL.ger.corp.intel.com
 (mwajdecz-MOBL.ger.corp.intel.com [10.249.150.146])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id C2FAC34933;
 Tue, 31 Jan 2023 21:44:18 +0000 (GMT)
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915/guc: Improve debug message on context reset
 notification
Date: Tue, 31 Jan 2023 22:44:13 +0100
Message-Id: <20230131214413.1879-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
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
Cc: John Harrison <John.C.Harrison@Intel.com>, dri-devel@lists.freedesktop.org,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Just recently we switched over to new GuC oriented log macros but in
the meantime yet another message was added that we missed to update.

While around improve that new message by adding engine name and use
existing helpers to check for context state.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 53f3ed3244d5..be495e657d66 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -4660,9 +4660,10 @@ static void guc_handle_context_reset(struct intel_guc *guc,
 {
 	trace_intel_context_reset(ce);
 
-	drm_dbg(&guc_to_gt(guc)->i915->drm, "Got GuC reset of 0x%04X, exiting = %d, banned = %d\n",
-		ce->guc_id.id, test_bit(CONTEXT_EXITING, &ce->flags),
-		test_bit(CONTEXT_BANNED, &ce->flags));
+	guc_dbg(guc, "Got context reset notification: 0x%04X on %s, exiting = %s, banned = %s\n",
+		ce->guc_id.id, ce->engine->name,
+		str_yes_no(intel_context_is_exiting(ce)),
+		str_yes_no(intel_context_is_banned(ce)));
 
 	if (likely(intel_context_is_schedulable(ce))) {
 		capture_error_state(guc, ce);
-- 
2.25.1

