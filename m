Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA1867DAC8
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jan 2023 01:29:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4A5F10E163;
	Fri, 27 Jan 2023 00:29:07 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 065E710E159;
 Fri, 27 Jan 2023 00:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674779341; x=1706315341;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ge027wYS9Kpvkw04aKFhgn6e7W9uzBegmpREjabV0iY=;
 b=OWzfPyPHQnr8QKLOcWkQaS5BZnQr5dDaYTmiTfL8pillhvDdSfD323yP
 75XV1YEywDmHsweSlXLHK4KFRUcUTUPcn5k+P3j5CZyAQCKFLE92jL4E+
 4vAla7BbjwtGs4FFQpKSuc9CPJVWmQ2bp0V766X64AmfKbmo1XYbeGHhj
 x8mfITtOW/4l1FGxllipKJf7DaekKV86vuDPVe/EXdrA0RP1lzqcZ3xok
 h7TqMr5ZMvFLQDeCIn0BwqO3M2sL8dVOyyvTK+o7VyslyQqUTmzb+ozdR
 FnwHYTGjmGIJJ5Mk92NwvmBEWkdwxQ75MiSSvnSSMHemS5YTxXa9MGspZ w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10602"; a="324687313"
X-IronPort-AV: E=Sophos;i="5.97,249,1669104000"; d="scan'208";a="324687313"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2023 16:28:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10602"; a="805621922"
X-IronPort-AV: E=Sophos;i="5.97,249,1669104000"; d="scan'208";a="805621922"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by fmsmga001.fm.intel.com with ESMTP; 26 Jan 2023 16:28:53 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH v6 7/8] drm/i915/guc: Add a debug print on GuC triggered reset
Date: Thu, 26 Jan 2023 16:28:41 -0800
Message-Id: <20230127002842.3169194-8-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230127002842.3169194-1-John.C.Harrison@Intel.com>
References: <20230127002842.3169194-1-John.C.Harrison@Intel.com>
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
Cc: John Harrison <John.C.Harrison@Intel.com>, DRI-Devel@Lists.FreeDesktop.Org,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

For understanding bug reports, it can be useful to have an explicit
dmesg print when a reset notification is received from GuC. As opposed
to simply inferring that this happened from other messages.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 7adc35bd4435a..2e6ab0bb5c2b6 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -4666,6 +4666,10 @@ static void guc_handle_context_reset(struct intel_guc *guc,
 {
 	trace_intel_context_reset(ce);
 
+	drm_dbg(&guc_to_gt(guc)->i915->drm, "Got GuC reset of 0x%04X, exiting = %d, banned = %d\n",
+		ce->guc_id.id, test_bit(CONTEXT_EXITING, &ce->flags),
+		test_bit(CONTEXT_BANNED, &ce->flags));
+
 	if (likely(intel_context_is_schedulable(ce))) {
 		capture_error_state(guc, ce);
 		guc_context_replay(ce);
-- 
2.39.1

