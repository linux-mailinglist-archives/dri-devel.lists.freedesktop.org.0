Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 403BC3FD139
	for <lists+dri-devel@lfdr.de>; Wed,  1 Sep 2021 04:21:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 362C36E112;
	Wed,  1 Sep 2021 02:20:56 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13D176E047;
 Wed,  1 Sep 2021 02:20:53 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10093"; a="218324972"
X-IronPort-AV: E=Sophos;i="5.84,368,1620716400"; d="scan'208";a="218324972"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2021 19:20:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,368,1620716400"; d="scan'208";a="519983668"
Received: from relo-linux-5.jf.intel.com ([10.165.21.134])
 by fmsmga004.fm.intel.com with ESMTP; 31 Aug 2021 19:20:44 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Cc: DRI-Devel@Lists.FreeDesktop.Org,
	Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH 7/7] Me: Dump GuC log to dmesg on SLPC load failure
Date: Tue, 31 Aug 2021 19:20:43 -0700
Message-Id: <20210901022043.2395135-8-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210901022043.2395135-1-John.C.Harrison@Intel.com>
References: <20210901022043.2395135-1-John.C.Harrison@Intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Matthew Brost <matthew.brost@intel.com>

---
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c |  3 +
 drivers/gpu/drm/i915/i915_gpu_error.c       | 97 +++++++++++++++++++++
 drivers/gpu/drm/i915/i915_gpu_error.h       |  3 +
 3 files changed, 103 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
index 65a3e7fdb2b2..9b52cae16ebb 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
@@ -262,6 +262,9 @@ static int slpc_reset(struct intel_guc_slpc *slpc)
 		if (wait_for(slpc_is_running(slpc), SLPC_RESET_TIMEOUT_MS)) {
 			drm_err(&i915->drm, "SLPC not enabled! State = %s\n",
 				slpc_get_state_string(slpc));
+
+			intel_klog_error_capture(guc_to_gt(guc),
+						 (intel_engine_mask_t) ~0U);
 			return -EIO;
 		}
 	}
diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c b/drivers/gpu/drm/i915/i915_gpu_error.c
index a61e23deeb00..55e58810a381 100644
--- a/drivers/gpu/drm/i915/i915_gpu_error.c
+++ b/drivers/gpu/drm/i915/i915_gpu_error.c
@@ -1969,3 +1969,100 @@ void i915_disable_error_state(struct drm_i915_private *i915, int err)
 		i915->gpu_error.first_error = ERR_PTR(err);
 	spin_unlock_irq(&i915->gpu_error.lock);
 }
+
+void intel_klog_error_capture(struct intel_gt *gt,
+			      intel_engine_mask_t engine_mask)
+{
+	struct drm_i915_private *i915 = gt->i915;
+	struct i915_gpu_coredump *error;
+	intel_wakeref_t wakeref;
+	size_t buf_size = PAGE_SIZE * 128;
+	size_t pos_err;
+	char *buf, *ptr, *next;
+
+	error = READ_ONCE(i915->gpu_error.first_error);
+	if (error) {
+		drm_err(&i915->drm, "Clearing existing error capture first...\n");
+		i915_reset_error_state(i915);
+	}
+
+	with_intel_runtime_pm(&i915->runtime_pm, wakeref)
+		error = i915_gpu_coredump(gt, engine_mask);
+
+	if (IS_ERR(error)) {
+		drm_err(&i915->drm, "Failed to capture error capture: %ld!\n", PTR_ERR(error));
+		return;
+	}
+
+	buf = kvmalloc(buf_size, GFP_KERNEL);
+	if (!buf) {
+		drm_err(&i915->drm, "Failed to allocate buffer for error capture!\n");
+		return;
+	}
+
+	drm_info(&i915->drm, "Dumping i915 error capture...\n");
+
+	/* Largest string length safe to print via dmesg */
+#	define MAX_CHUNK	800
+
+	pos_err = 0;
+	while (1) {
+		ssize_t got = i915_gpu_coredump_copy_to_buffer(error, buf, pos_err, buf_size - 1);
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
+					ptr[pos] = 0;
+					drm_info(&i915->drm, "Capture }%s{\n", ptr2);
+					ptr[pos] = chr;
+					ptr2 = ptr + pos;
+				}
+
+				if (ptr2 < (ptr + count))
+					drm_info(&i915->drm, "Capture %c%s%c\n", tag[0], ptr2, tag[1]);
+				else if (tag[0] == '>')
+					drm_info(&i915->drm, "Capture ><\n");
+			} else
+				drm_info(&i915->drm, "Capture %c%s%c\n", tag[0], ptr, tag[1]);
+
+			ptr = next;
+			got -= count;
+			if (next) {
+				ptr++;
+				got--;
+			}
+		}
+
+		if (got)
+			drm_info(&i915->drm, "Got %zd bytes remaining!\n", got);
+	}
+
+	kvfree(buf);
+
+	drm_info(&i915->drm, "Dumped %zd bytes\n", pos_err);
+}
diff --git a/drivers/gpu/drm/i915/i915_gpu_error.h b/drivers/gpu/drm/i915/i915_gpu_error.h
index b98d8cdbe4f2..f5ab72cc3367 100644
--- a/drivers/gpu/drm/i915/i915_gpu_error.h
+++ b/drivers/gpu/drm/i915/i915_gpu_error.h
@@ -214,6 +214,9 @@ struct drm_i915_error_state_buf {
 
 #if IS_ENABLED(CONFIG_DRM_I915_CAPTURE_ERROR)
 
+void intel_klog_error_capture(struct intel_gt *gt,
+			      intel_engine_mask_t engine_mask);
+
 __printf(2, 3)
 void i915_error_printf(struct drm_i915_error_state_buf *e, const char *f, ...);
 
-- 
2.25.1

