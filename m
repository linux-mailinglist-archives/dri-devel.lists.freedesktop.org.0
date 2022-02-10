Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B8194B17D1
	for <lists+dri-devel@lfdr.de>; Thu, 10 Feb 2022 22:47:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72FEC10E96A;
	Thu, 10 Feb 2022 21:47:11 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D10110E969;
 Thu, 10 Feb 2022 21:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644529629; x=1676065629;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ulUI2rQ0jVtBvKRy7Yd3tKvcPQE+Xcd0GjiqTWQyO5s=;
 b=Vmvi2YDYn/LwaEbwobsw6pRWRN7OaiHCsPpsaVopWi25z576MBEhh+Rm
 XYOrUNj4uwF8ZGi0ZPWydZnTu/pjGEWQfNllZKpjOiSpmrhwPYtCPRQvz
 x5rIikymOURG/alffnUwH5Lw5+r3gOFjafIiJkPXdMWZ2/FZbQkBjljww
 xhkZYT8n/SDCYzZPeByuBTcRypciRXFywqOEwCgGsefNTzT5cw4ehGbd4
 iGiSf1X9CqdaW5aTmz3SwLS0YzxKIs0sHkNx/kPn42qtT2TDh/mg12KeU
 JnLEm74JRf4pcVpkshiL6L8FhnXPa8w/kYBqFY5Qzdld2AlCNmnG3TbUF g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10254"; a="230243659"
X-IronPort-AV: E=Sophos;i="5.88,359,1635231600"; d="scan'208";a="230243659"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2022 13:47:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,359,1635231600"; d="scan'208";a="537447466"
Received: from relo-linux-5.jf.intel.com ([10.165.21.134])
 by fmsmga007.fm.intel.com with ESMTP; 10 Feb 2022 13:47:08 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH] drm/i915/guc: Do not complain about stale reset notifications
Date: Thu, 10 Feb 2022 13:47:08 -0800
Message-Id: <20220210214708.2911301-1-John.C.Harrison@Intel.com>
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

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index b3a429a92c0d..3a4a87d1c89c 100644
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
+			 "Invalid GuC engine reset notification for 0x%04X on %s: banned = %d, blocked = %d",
+			 ce->guc_id.id, ce->engine->name, intel_context_is_banned(ce),
+			 context_blocked(ce));
 	}
 }
 
-- 
2.25.1

