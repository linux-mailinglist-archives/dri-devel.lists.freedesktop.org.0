Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E1EA5729F7
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jul 2022 01:32:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 291DC976CA;
	Tue, 12 Jul 2022 23:31:42 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F21B5976C6;
 Tue, 12 Jul 2022 23:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657668699; x=1689204699;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ldq8n0PudUb3seogcSKkSq2VMrWwDUfdLFuwepmIGZc=;
 b=FmOtYFLKHCM66yOOO8x/RxQ+EcSNTThBan2eOeRB7t74juJumhwe8YMx
 E6YTb67ocde6Ww18AcdhlH4on5CHLGRpBuvII9rV/kZ4HuIAMFWIiyBex
 QwSWsIdalDgshSUB44EpfU1Dn48nY30SkmMitQtsA8EFVjmx+mgo7+mXI
 wWRgJvY+VHMyRT7YjIi213E3XjkuTrR1wtfahPfhiIwt64EB1/dq4zbz+
 p7Q6OAG5wR4N44ucXJmC7gma6v8os74Fx2OFoQA/9vJbF6fw0t93XHJWo
 fdp/lrwYicaFbzLsXWalplxZTC4YiBl0+ZRRwKCRM5e1wvS4cUfHmE1S/ A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10406"; a="285812573"
X-IronPort-AV: E=Sophos;i="5.92,266,1650956400"; d="scan'208";a="285812573"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2022 16:31:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,266,1650956400"; d="scan'208";a="722137792"
Received: from relo-linux-5.jf.intel.com ([10.165.21.134])
 by orsmga004.jf.intel.com with ESMTP; 12 Jul 2022 16:31:37 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH 12/12] drm/i915/guc: Add a helper for log buffer size
Date: Tue, 12 Jul 2022 16:31:36 -0700
Message-Id: <20220712233136.1044951-13-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220712233136.1044951-1-John.C.Harrison@Intel.com>
References: <20220712233136.1044951-1-John.C.Harrison@Intel.com>
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
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>,
 DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Alan Previn <alan.previn.teres.alexis@intel.com>

Add a helper to get GuC log buffer size.

Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_log.c | 49 ++++++++++++----------
 1 file changed, 27 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
index ff091adb56096..4bb81d2cf3828 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
@@ -15,6 +15,32 @@
 
 static void guc_log_copy_debuglogs_for_relay(struct intel_guc_log *log);
 
+static u32 intel_guc_log_size(struct intel_guc_log *log)
+{
+	/*
+	 *  GuC Log buffer Layout:
+	 *
+	 *  NB: Ordering must follow "enum guc_log_buffer_type".
+	 *
+	 *  +===============================+ 00B
+	 *  |      Debug state header       |
+	 *  +-------------------------------+ 32B
+	 *  |    Crash dump state header    |
+	 *  +-------------------------------+ 64B
+	 *  |     Capture state header      |
+	 *  +-------------------------------+ 96B
+	 *  |                               |
+	 *  +===============================+ PAGE_SIZE (4KB)
+	 *  |          Debug logs           |
+	 *  +===============================+ + DEBUG_SIZE
+	 *  |        Crash Dump logs        |
+	 *  +===============================+ + CRASH_SIZE
+	 *  |         Capture logs          |
+	 *  +===============================+ + CAPTURE_SIZE
+	 */
+	return PAGE_SIZE + CRASH_BUFFER_SIZE + DEBUG_BUFFER_SIZE + CAPTURE_BUFFER_SIZE;
+}
+
 /**
  * DOC: GuC firmware log
  *
@@ -461,32 +487,11 @@ int intel_guc_log_create(struct intel_guc_log *log)
 
 	GEM_BUG_ON(log->vma);
 
-	/*
-	 *  GuC Log buffer Layout
-	 * (this ordering must follow "enum guc_log_buffer_type" definition)
-	 *
-	 *  +===============================+ 00B
-	 *  |      Debug state header       |
-	 *  +-------------------------------+ 32B
-	 *  |    Crash dump state header    |
-	 *  +-------------------------------+ 64B
-	 *  |     Capture state header      |
-	 *  +-------------------------------+ 96B
-	 *  |                               |
-	 *  +===============================+ PAGE_SIZE (4KB)
-	 *  |          Debug logs           |
-	 *  +===============================+ + DEBUG_SIZE
-	 *  |        Crash Dump logs        |
-	 *  +===============================+ + CRASH_SIZE
-	 *  |         Capture logs          |
-	 *  +===============================+ + CAPTURE_SIZE
-	 */
 	if (intel_guc_capture_output_min_size_est(guc) > CAPTURE_BUFFER_SIZE)
 		DRM_WARN("GuC log buffer for state_capture maybe too small. %d < %d\n",
 			 CAPTURE_BUFFER_SIZE, intel_guc_capture_output_min_size_est(guc));
 
-	guc_log_size = PAGE_SIZE + CRASH_BUFFER_SIZE + DEBUG_BUFFER_SIZE +
-		       CAPTURE_BUFFER_SIZE;
+	guc_log_size = intel_guc_log_size(log);
 
 	vma = intel_guc_allocate_vma(guc, guc_log_size);
 	if (IS_ERR(vma)) {
-- 
2.36.0

