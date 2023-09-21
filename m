Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E8F7A99BF
	for <lists+dri-devel@lfdr.de>; Thu, 21 Sep 2023 20:21:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0BA110E15B;
	Thu, 21 Sep 2023 18:21:24 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F37AF10E152;
 Thu, 21 Sep 2023 18:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695320482; x=1726856482;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=gF9YaWLf5j8y4umFkKe3L4QbsxVsINM2PMkoT8McGUU=;
 b=XyuU4LzqEKQsMFs8T6V7PJZyUPPOeVrv9Ip/TrT5VWkIMzJ/UkkNekgi
 f8uIMy4dXYXIqfEQLxm/nVgbdprvFZuulVX+QQf3pZeOd55eWw7S/ADLf
 bpItpckFui/g+dlAJJKGJulHpZ3PDhVpCsPa+PvenSfIxsgXlgnxCwv4/
 jgsfe/Ez3rwXiU0MbcGi800VFWErCaoXsFDXwBH6CQYMEYjoiDF9flzUM
 0VjsF9b9wvus+oyV6LVvAh6GI8yJ622b4cUhMGJx7wkR5h94P/jj1btEF
 0N+mmkj2NbEsgcUdEa4Rt3slPqvPO+sEn7Gwm2c+29acJ8+TISkT7R+rs g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="384461598"
X-IronPort-AV: E=Sophos;i="6.03,166,1694761200"; d="scan'208";a="384461598"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2023 11:21:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="776545658"
X-IronPort-AV: E=Sophos;i="6.03,166,1694761200"; d="scan'208";a="776545658"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orsmga008.jf.intel.com with ESMTP; 21 Sep 2023 11:21:21 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH] drm/i915/guc: Suppress 'ignoring reset notification' message
Date: Thu, 21 Sep 2023 11:20:33 -0700
Message-ID: <20230921182033.135448-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.41.0
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

If an active context has been banned (e.g. Ctrl+C killed) then it is
likely to be reset as part of evicting it from the hardware. That
results in a 'ignoring context reset notification: banned = 1'
message at info level. This confuses/concerns people and makes them
thing something has gone wrong when it hasn't.

There is already a debug level message with essentially the same
information. So drop the 'ignore' info level one and just add the
'ignore' flag to the debug level one instead (which will therefore not
appear by default but will still show up in CI runs).

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index cabdc645fcddb..da7331346df1f 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -4770,19 +4770,19 @@ static void guc_context_replay(struct intel_context *ce)
 static void guc_handle_context_reset(struct intel_guc *guc,
 				     struct intel_context *ce)
 {
+	bool capture = intel_context_is_schedulable(ce);
+
 	trace_intel_context_reset(ce);
 
-	guc_dbg(guc, "Got context reset notification: 0x%04X on %s, exiting = %s, banned = %s\n",
+	guc_dbg(guc, "%s context reset notification: 0x%04X on %s, exiting = %s, banned = %s\n",
+		capture ? "Got" : "Ignoring",
 		ce->guc_id.id, ce->engine->name,
 		str_yes_no(intel_context_is_exiting(ce)),
 		str_yes_no(intel_context_is_banned(ce)));
 
-	if (likely(intel_context_is_schedulable(ce))) {
+	if (capture) {
 		capture_error_state(guc, ce);
 		guc_context_replay(ce);
-	} else {
-		guc_info(guc, "Ignoring context reset notification of exiting context 0x%04X on %s",
-			 ce->guc_id.id, ce->engine->name);
 	}
 }
 
-- 
2.41.0

