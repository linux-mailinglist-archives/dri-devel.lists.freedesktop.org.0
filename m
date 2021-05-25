Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4806E390AD8
	for <lists+dri-devel@lfdr.de>; Tue, 25 May 2021 22:58:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1143C6EB0A;
	Tue, 25 May 2021 20:57:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7B066E43B;
 Tue, 25 May 2021 20:57:53 +0000 (UTC)
IronPort-SDR: E4wQTuev25/DFjKou47sZWXwcweWlFfHeTa2xZBgWcZE8Vnq94tqg3czw0M2e9Fvy+Jwq+Sv/x
 AwPcoC5MT5lg==
X-IronPort-AV: E=McAfee;i="6200,9189,9995"; a="266195937"
X-IronPort-AV: E=Sophos;i="5.82,329,1613462400"; d="scan'208";a="266195937"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2021 13:57:52 -0700
IronPort-SDR: jR791WHivchwm9doP5BWZO1rAK68QfekrHO2eGEz1pyvl6QmBrDOB6iDH57IOXn6iolG6XbIJm
 fNh1pJwFbBWQ==
X-IronPort-AV: E=Sophos;i="5.82,329,1613462400"; d="scan'208";a="443603517"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2021 13:57:52 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH 02/17] drm/i915/guc: use probe_error log for CT enablement
 failure
Date: Tue, 25 May 2021 14:15:26 -0700
Message-Id: <20210525211541.87696-3-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210525211541.87696-1-matthew.brost@intel.com>
References: <20210525211541.87696-1-matthew.brost@intel.com>
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
Cc: Michal.Wajdeczko@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

We have a couple of failure injection points in the CT enablement path,
so we need to use i915_probe_error() to select the appropriate log level.
A new macro (CT_PROBE_ERROR) has been added to the set of CT logging
macros to be used in this scenario and upcoming ones.

While adding the new macros, fix the underlying logging mechanics used
by the existing ones (DRM_DEV_* -> drm_*) and move the inlines to
before they're used inside the macros.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c | 48 ++++++++++++-----------
 1 file changed, 25 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
index fa9e048cc65f..25618649048f 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
@@ -7,14 +7,36 @@
 #include "intel_guc_ct.h"
 #include "gt/intel_gt.h"
 
+static inline struct intel_guc *ct_to_guc(struct intel_guc_ct *ct)
+{
+	return container_of(ct, struct intel_guc, ct);
+}
+
+static inline struct intel_gt *ct_to_gt(struct intel_guc_ct *ct)
+{
+	return guc_to_gt(ct_to_guc(ct));
+}
+
+static inline struct drm_i915_private *ct_to_i915(struct intel_guc_ct *ct)
+{
+	return ct_to_gt(ct)->i915;
+}
+
+static inline struct drm_device *ct_to_drm(struct intel_guc_ct *ct)
+{
+	return &ct_to_i915(ct)->drm;
+}
+
 #define CT_ERROR(_ct, _fmt, ...) \
-	DRM_DEV_ERROR(ct_to_dev(_ct), "CT: " _fmt, ##__VA_ARGS__)
+	drm_err(ct_to_drm(_ct), "CT: " _fmt, ##__VA_ARGS__)
 #ifdef CONFIG_DRM_I915_DEBUG_GUC
 #define CT_DEBUG(_ct, _fmt, ...) \
-	DRM_DEV_DEBUG_DRIVER(ct_to_dev(_ct), "CT: " _fmt, ##__VA_ARGS__)
+	drm_dbg(ct_to_drm(_ct), "CT: " _fmt, ##__VA_ARGS__)
 #else
 #define CT_DEBUG(...)	do { } while (0)
 #endif
+#define CT_PROBE_ERROR(_ct, _fmt, ...) \
+	i915_probe_error(ct_to_i915(ct), "CT: " _fmt, ##__VA_ARGS__);
 
 struct ct_request {
 	struct list_head link;
@@ -47,26 +69,6 @@ void intel_guc_ct_init_early(struct intel_guc_ct *ct)
 	INIT_WORK(&ct->requests.worker, ct_incoming_request_worker_func);
 }
 
-static inline struct intel_guc *ct_to_guc(struct intel_guc_ct *ct)
-{
-	return container_of(ct, struct intel_guc, ct);
-}
-
-static inline struct intel_gt *ct_to_gt(struct intel_guc_ct *ct)
-{
-	return guc_to_gt(ct_to_guc(ct));
-}
-
-static inline struct drm_i915_private *ct_to_i915(struct intel_guc_ct *ct)
-{
-	return ct_to_gt(ct)->i915;
-}
-
-static inline struct device *ct_to_dev(struct intel_guc_ct *ct)
-{
-	return ct_to_i915(ct)->drm.dev;
-}
-
 static inline const char *guc_ct_buffer_type_to_str(u32 type)
 {
 	switch (type) {
@@ -264,7 +266,7 @@ int intel_guc_ct_enable(struct intel_guc_ct *ct)
 err_deregister:
 	ct_deregister_buffer(ct, INTEL_GUC_CT_BUFFER_TYPE_RECV);
 err_out:
-	CT_ERROR(ct, "Failed to open open CT channel (err=%d)\n", err);
+	CT_PROBE_ERROR(ct, "Failed to open channel (err=%d)\n", err);
 	return err;
 }
 
-- 
2.28.0

