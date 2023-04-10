Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D674C6DCB84
	for <lists+dri-devel@lfdr.de>; Mon, 10 Apr 2023 21:25:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC5EB10E0E9;
	Mon, 10 Apr 2023 19:25:51 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC4DD10E0E9;
 Mon, 10 Apr 2023 19:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681154748; x=1712690748;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=chvrDkpzYnMq+VYPjmz27fYL85B2c1Um8Sp8H6bMVhg=;
 b=UXSU7nS6OTxeRjpJ0mNYIPHko00eq1i+0vOL3FDujyTisogcOkgOH4xq
 gYTopgIzgm3QU75n77jwodv7/+E9nvDpxVvHxht5/NXJHF/lX999I1vcy
 jABMksUTd8hzt0rT2lO+OMBGad+F3fXNH48+stKxCXE0C4R25Htn4SO+V
 ck4XKSo6/AuWIxInie3yHwgQN0zmYzIDmCkH6ycV9udgPVPTZZl2a4VdC
 ZA5vlm48iSIiNypUWy+324dMvclJmD/XXBNyps2q+yJci6JNPYsOkTnsT
 3SHQqmOuuzw0nG0hhjjvqKa1XiWJymcDNp1VriHnoBjv0HBMEw2LeSxBT g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="323797875"
X-IronPort-AV: E=Sophos;i="5.98,333,1673942400"; d="scan'208";a="323797875"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2023 12:25:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="638554244"
X-IronPort-AV: E=Sophos;i="5.98,333,1673942400"; d="scan'208";a="638554244"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orsmga003.jf.intel.com with ESMTP; 10 Apr 2023 12:25:43 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH 1/2] drm/i915: Dump error capture to kernel log
Date: Mon, 10 Apr 2023 12:25:22 -0700
Message-Id: <20230410192523.2020049-2-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230410192523.2020049-1-John.C.Harrison@Intel.com>
References: <20230410192523.2020049-1-John.C.Harrison@Intel.com>
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

This is useful for getting debug information out in certain
situations, such as failing kernel selftests and CI runs that don't
log error captures. It is especially useful for things like retrieving
GuC logs as GuC operation can't be tracked by adding printk or ftrace
entries.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/i915_gpu_error.c | 130 ++++++++++++++++++++++++++
 drivers/gpu/drm/i915/i915_gpu_error.h |   8 ++
 2 files changed, 138 insertions(+)

diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c b/drivers/gpu/drm/i915/i915_gpu_error.c
index f020c0086fbcd..500fec34188a0 100644
--- a/drivers/gpu/drm/i915/i915_gpu_error.c
+++ b/drivers/gpu/drm/i915/i915_gpu_error.c
@@ -2219,3 +2219,133 @@ void i915_disable_error_state(struct drm_i915_private *i915, int err)
 		i915->gpu_error.first_error = ERR_PTR(err);
 	spin_unlock_irq(&i915->gpu_error.lock);
 }
+
+void intel_klog_error_capture(struct intel_gt *gt,
+			      intel_engine_mask_t engine_mask)
+{
+	static int g_count;
+	struct drm_i915_private *i915 = gt->i915;
+	struct i915_gpu_coredump *error;
+	intel_wakeref_t wakeref;
+	size_t buf_size = PAGE_SIZE * 128;
+	size_t pos_err;
+	char *buf, *ptr, *next;
+	int l_count = g_count++;
+	int line = 0;
+
+	/* Can't allocate memory during a reset */
+	if (test_bit(I915_RESET_BACKOFF, &gt->reset.flags)) {
+		drm_err(&gt->i915->drm, "[Capture/%d.%d] Inside GT reset, skipping error capture :(\n",
+			l_count, line++);
+		return;
+	}
+
+	error = READ_ONCE(i915->gpu_error.first_error);
+	if (error) {
+		drm_err(&i915->drm, "[Capture/%d.%d] Clearing existing error capture first...\n",
+			l_count, line++);
+		i915_reset_error_state(i915);
+	}
+
+	with_intel_runtime_pm(&i915->runtime_pm, wakeref)
+		error = i915_gpu_coredump(gt, engine_mask, CORE_DUMP_FLAG_NONE);
+
+	if (IS_ERR(error)) {
+		drm_err(&i915->drm, "[Capture/%d.%d] Failed to capture error capture: %ld!\n",
+			l_count, line++, PTR_ERR(error));
+		return;
+	}
+
+	buf = kvmalloc(buf_size, GFP_KERNEL);
+	if (!buf) {
+		drm_err(&i915->drm, "[Capture/%d.%d] Failed to allocate buffer for error capture!\n",
+			l_count, line++);
+		i915_gpu_coredump_put(error);
+		return;
+	}
+
+	drm_info(&i915->drm, "[Capture/%d.%d] Dumping i915 error capture for %ps...\n",
+		 l_count, line++, __builtin_return_address(0));
+
+	/* Largest string length safe to print via dmesg */
+#	define MAX_CHUNK	800
+
+	pos_err = 0;
+	while (1) {
+		ssize_t got = i915_gpu_coredump_copy_to_buffer(error, buf, pos_err, buf_size - 1);
+
+		if (got <= 0)
+			break;
+
+		buf[got] = 0;
+		pos_err += got;
+
+		ptr = buf;
+		while (got > 0) {
+			size_t count;
+			char tag[2];
+
+			next = strnchr(ptr, got, '\n');
+			if (next) {
+				count = next - ptr;
+				*next = 0;
+				tag[0] = '>';
+				tag[1] = '<';
+			} else {
+				count = got;
+				tag[0] = '}';
+				tag[1] = '{';
+			}
+
+			if (count > MAX_CHUNK) {
+				size_t pos;
+				char *ptr2 = ptr;
+
+				for (pos = MAX_CHUNK; pos < count; pos += MAX_CHUNK) {
+					char chr = ptr[pos];
+
+					ptr[pos] = 0;
+					drm_info(&i915->drm, "[Capture/%d.%d] }%s{\n",
+						 l_count, line++, ptr2);
+					ptr[pos] = chr;
+					ptr2 = ptr + pos;
+
+					/*
+					 * If spewing large amounts of data via a serial console,
+					 * this can be a very slow process. So be friendly and try
+					 * not to cause 'softlockup on CPU' problems.
+					 */
+					cond_resched();
+				}
+
+				if (ptr2 < (ptr + count))
+					drm_info(&i915->drm, "[Capture/%d.%d] %c%s%c\n",
+						 l_count, line++, tag[0], ptr2, tag[1]);
+				else if (tag[0] == '>')
+					drm_info(&i915->drm, "[Capture/%d.%d] ><\n",
+						 l_count, line++);
+			} else {
+				drm_info(&i915->drm, "[Capture/%d.%d] %c%s%c\n",
+					 l_count, line++, tag[0], ptr, tag[1]);
+			}
+
+			ptr = next;
+			got -= count;
+			if (next) {
+				ptr++;
+				got--;
+			}
+
+			/* As above. */
+			cond_resched();
+		}
+
+		if (got)
+			drm_info(&i915->drm, "[Capture/%d.%d] Got %zd bytes remaining!\n",
+				 l_count, line++, got);
+	}
+
+	kvfree(buf);
+
+	drm_info(&i915->drm, "[Capture/%d.%d] Dumped %zd bytes\n", l_count, line++, pos_err);
+}
diff --git a/drivers/gpu/drm/i915/i915_gpu_error.h b/drivers/gpu/drm/i915/i915_gpu_error.h
index a91932cc65317..b14c2c9915141 100644
--- a/drivers/gpu/drm/i915/i915_gpu_error.h
+++ b/drivers/gpu/drm/i915/i915_gpu_error.h
@@ -260,6 +260,9 @@ static inline u32 i915_reset_engine_count(struct i915_gpu_error *error,
 
 #if IS_ENABLED(CONFIG_DRM_I915_CAPTURE_ERROR)
 
+void intel_klog_error_capture(struct intel_gt *gt,
+			      intel_engine_mask_t engine_mask);
+
 __printf(2, 3)
 void i915_error_printf(struct drm_i915_error_state_buf *e, const char *f, ...);
 void intel_gpu_error_print_vma(struct drm_i915_error_state_buf *m,
@@ -323,6 +326,11 @@ void i915_disable_error_state(struct drm_i915_private *i915, int err);
 
 #else
 
+static inline void intel_klog_error_capture(struct intel_gt *gt,
+					    intel_engine_mask_t engine_mask)
+{
+}
+
 __printf(2, 3)
 static inline void
 i915_error_printf(struct drm_i915_error_state_buf *e, const char *f, ...)
-- 
2.39.1

