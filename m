Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD8A046C4AC
	for <lists+dri-devel@lfdr.de>; Tue,  7 Dec 2021 21:32:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 521706EDB7;
	Tue,  7 Dec 2021 20:31:51 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37CC66E329;
 Tue,  7 Dec 2021 20:31:48 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10191"; a="237486064"
X-IronPort-AV: E=Sophos;i="5.87,295,1631602800"; d="scan'208";a="237486064"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2021 12:19:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,295,1631602800"; d="scan'208";a="657837954"
Received: from relo-linux-5.jf.intel.com ([10.165.21.134])
 by fmsmga001.fm.intel.com with ESMTP; 07 Dec 2021 12:19:33 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH v2 2/3] drm/i915/guc: Increase GuC log size for
 CONFIG_DEBUG_GEM
Date: Tue,  7 Dec 2021 12:19:31 -0800
Message-Id: <20211207201932.240050-3-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211207201932.240050-1-John.C.Harrison@Intel.com>
References: <20211207201932.240050-1-John.C.Harrison@Intel.com>
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
 John Harrison <John.C.Harrison@Intel.com>, DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

Lots of testing is done with the DEBUG_GEM config option enabled but
not the DEBUG_GUC option. That means we only get teeny-tiny GuC logs
which are not hugely useful. Enabling full DEBUG_GUC also spews lots
of other detailed output that is not generally desired. However,
bigger GuC logs are extremely useful for almost any regression debug.
So enable bigger logs for DEBUG_GEM builds as well.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_log.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.h
index ac1ee1d5ce10..fe6ab7550a14 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.h
@@ -15,9 +15,12 @@
 
 struct intel_guc;
 
-#ifdef CONFIG_DRM_I915_DEBUG_GUC
+#if defined(CONFIG_DRM_I915_DEBUG_GUC)
 #define CRASH_BUFFER_SIZE	SZ_2M
 #define DEBUG_BUFFER_SIZE	SZ_16M
+#elif defined(CONFIG_DRM_I915_DEBUG_GEM)
+#define CRASH_BUFFER_SIZE	SZ_1M
+#define DEBUG_BUFFER_SIZE	SZ_2M
 #else
 #define CRASH_BUFFER_SIZE	SZ_8K
 #define DEBUG_BUFFER_SIZE	SZ_64K
-- 
2.25.1

