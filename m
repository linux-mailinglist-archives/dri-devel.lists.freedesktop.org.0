Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7627B390AEC
	for <lists+dri-devel@lfdr.de>; Tue, 25 May 2021 22:58:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D18E6EB22;
	Tue, 25 May 2021 20:58:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C3166EB0C;
 Tue, 25 May 2021 20:57:56 +0000 (UTC)
IronPort-SDR: gqloGdOnjzCrX2nYLx4XEM3Av+3/u0kfDKSduPZOMuNjYWOubxyf7uQxZlK0SrsMyGw6FvxauN
 xuQiXbmQn6vg==
X-IronPort-AV: E=McAfee;i="6200,9189,9995"; a="287876022"
X-IronPort-AV: E=Sophos;i="5.82,329,1613462400"; d="scan'208";a="287876022"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2021 13:57:54 -0700
IronPort-SDR: P3NnyIQ4UD5h5mj8Ri09nzZmNdAvfgis0x1JRa10CDIj+Zd+L6fmvkt1IL76f5AtRhOA4DMeo8
 cw2uKqywN3Pw==
X-IronPort-AV: E=Sophos;i="5.82,329,1613462400"; d="scan'208";a="443603555"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2021 13:57:54 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH 12/17] drm/i915/guc: Relax CTB response timeout
Date: Tue, 25 May 2021 14:15:36 -0700
Message-Id: <20210525211541.87696-13-matthew.brost@intel.com>
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

From: Michal Wajdeczko <michal.wajdeczko@intel.com>

In upcoming patch we will allow more CTB requests to be sent in
parallel to the GuC for procesing, so we shouldn't assume any more
that GuC will always reply without 10ms.

Use bigger value from CONFIG_DRM_I915_GUC_CTB_TIMEOUT instead.

v2: Add CONFIG_DRM_I915_GUC_CTB_TIMEOUT config option

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/Kconfig.profile      | 9 +++++++++
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c | 5 ++++-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/Kconfig.profile b/drivers/gpu/drm/i915/Kconfig.profile
index 39328567c200..68ac707755d2 100644
--- a/drivers/gpu/drm/i915/Kconfig.profile
+++ b/drivers/gpu/drm/i915/Kconfig.profile
@@ -38,6 +38,15 @@ config DRM_I915_USERFAULT_AUTOSUSPEND
 	  May be 0 to disable the extra delay and solely use the device level
 	  runtime pm autosuspend delay tunable.
 
+config DRM_I915_GUC_CTB_TIMEOUT
+	int "How long to wait for the GuC to make forward progress on CTBs (ms)"
+	default 1500 # milliseconds
+	help
+	  Configures the default timeout waiting for GuC the to make forward
+	  progress on CTBs. e.g. Waiting for a response to requeset.
+
+	  A minimum value of 10 ms is allowed.
+
 config DRM_I915_HEARTBEAT_INTERVAL
 	int "Interval between heartbeat pulses (ms)"
 	default 2500 # milliseconds
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
index c87a0a8bef26..62b9b581ce03 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
@@ -436,6 +436,7 @@ static int ct_write(struct intel_guc_ct *ct,
  */
 static int wait_for_ct_request_update(struct ct_request *req, u32 *status)
 {
+	long timeout;
 	int err;
 
 	/*
@@ -443,10 +444,12 @@ static int wait_for_ct_request_update(struct ct_request *req, u32 *status)
 	 * up to that length of time, then switch to a slower sleep-wait loop.
 	 * No GuC command should ever take longer than 10ms.
 	 */
+	timeout = max(10, CONFIG_DRM_I915_GUC_CTB_TIMEOUT);
+
 #define done INTEL_GUC_MSG_IS_RESPONSE(READ_ONCE(req->status))
 	err = wait_for_us(done, 10);
 	if (err)
-		err = wait_for(done, 10);
+		err = wait_for(done, timeout);
 #undef done
 
 	if (unlikely(err))
-- 
2.28.0

