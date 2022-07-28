Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A74CD5836CB
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jul 2022 04:22:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11CC410F637;
	Thu, 28 Jul 2022 02:21:22 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4430510F269;
 Thu, 28 Jul 2022 02:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658974833; x=1690510833;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=No/dA2ewOO1GiW7SHUQrG6UH1H4fa4EXD45mnD6c/jg=;
 b=bNQLwgkRNIFiT0BUjXrT2DgazjRwPnutS3ixSNxsnVNk6ZBLzu+QP5Y/
 5uJIzT7xOy+8Nt5Gdm85RThIDOzYxFC9Fy6hDHYyEIV4YlnIUBIJbH8V+
 Q2FSVprr0OI/aEqWHmXBV5nkzqYKUwAKxGskWEhzcOrVxhHpTrh7TTzfm
 4GUoG5fnN6vK6TKCt6XE1bDX2+7uRlniYtDIdzx1yNY+3GqIhLJGaWwEK
 epXnT07O7sDnNRgOkhjoIQm1tOAxsV4hDjA8xl8T1jLbavZH6SyeZppGv
 mCAPl4vhT/nw8KH+TjV+UYn3u9Db7n7XRQRYHckAF+hi0audloQj64JMr g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10421"; a="285947581"
X-IronPort-AV: E=Sophos;i="5.93,196,1654585200"; d="scan'208";a="285947581"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2022 19:20:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,196,1654585200"; d="scan'208";a="600648462"
Received: from relo-linux-5.jf.intel.com ([10.165.21.134])
 by orsmga002.jf.intel.com with ESMTP; 27 Jul 2022 19:20:28 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH 1/7] drm/i915/guc: Add a helper for log buffer size
Date: Wed, 27 Jul 2022 19:20:22 -0700
Message-Id: <20220728022028.2190627-2-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220728022028.2190627-1-John.C.Harrison@Intel.com>
References: <20220728022028.2190627-1-John.C.Harrison@Intel.com>
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Alan Previn <alan.previn.teres.alexis@intel.com>

Add a helper to get GuC log buffer size.

Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_log.c | 49 ++++++++++++----------
 1 file changed, 27 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
index 25b2d7ce6640d..492bbf419d4df 100644
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
2.37.1

