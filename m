Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12D446F1316
	for <lists+dri-devel@lfdr.de>; Fri, 28 Apr 2023 10:15:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A28A10EC76;
	Fri, 28 Apr 2023 08:15:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B51310EC6D;
 Fri, 28 Apr 2023 08:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682669709; x=1714205709;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4B20lUE1ON4vMMwkAs7ciCQmA9lQDT48Tp5c5tkAh+I=;
 b=MraAfq/0mT03UN8OOCL/ySHnOV3AstfWuUOuaiONyg2u6U3CwaT/24VY
 jjqQ8EqDTsWj3nh8Ye9HnXfVl0re4Z05cQJfAp/jyjE6O+DqWSsyD1mhQ
 3SN2icaQVFtI3cGjYFkyPQse3Demby8Z0xBAhN2naQAL67G5yaowQHf7z
 20cpWdXxq9Q6o8a0cXDJzn+Z/G3+8XeQisy5Qm66+TfTmcKcSj356yEJk
 BQcQg+Kl0xYGDvIsRDZPJr5Sftbv0iZMmCx57Uhp8/dqMYRJ/1MQ/ZhfE
 e64NYw1D2TTXxgDfdwMmW25UaEkqDygcVwcO+aPFdYhJsLMwbCkjryuFi A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="328011803"
X-IronPort-AV: E=Sophos;i="5.99,234,1677571200"; d="scan'208";a="328011803"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2023 01:15:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="694726768"
X-IronPort-AV: E=Sophos;i="5.99,234,1677571200"; d="scan'208";a="694726768"
Received: from ksathish-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.194.196])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2023 01:15:07 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [RFC 3/4] drm/i915: Add helpers for managing rps thresholds
Date: Fri, 28 Apr 2023 09:14:56 +0100
Message-Id: <20230428081457.857009-4-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230428081457.857009-1-tvrtko.ursulin@linux.intel.com>
References: <20230428081457.857009-1-tvrtko.ursulin@linux.intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

In preparation for exposing via sysfs add helpers for managing rps
thresholds.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_rps.c | 36 +++++++++++++++++++++++++++++
 drivers/gpu/drm/i915/gt/intel_rps.h |  4 ++++
 2 files changed, 40 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
index a39eee444849..a5a7315f5ace 100644
--- a/drivers/gpu/drm/i915/gt/intel_rps.c
+++ b/drivers/gpu/drm/i915/gt/intel_rps.c
@@ -2573,6 +2573,42 @@ int intel_rps_set_min_frequency(struct intel_rps *rps, u32 val)
 		return set_min_freq(rps, val);
 }
 
+u8 intel_rps_get_up_threshold(struct intel_rps *rps)
+{
+	return rps->power.up_threshold;
+}
+
+static int rps_set_threshold(struct intel_rps *rps, u8 *threshold, u8 val)
+{
+	int ret;
+
+	if (val > 100)
+		return -EINVAL;
+
+	ret = mutex_lock_interruptible(&rps->lock);
+	if (ret)
+		return ret;
+	*threshold = val;
+	mutex_unlock(&rps->lock);
+
+	return 0;
+}
+
+int intel_rps_set_up_threshold(struct intel_rps *rps, u8 threshold)
+{
+	return rps_set_threshold(rps, &rps->power.up_threshold, threshold);
+}
+
+u8 intel_rps_get_down_threshold(struct intel_rps *rps)
+{
+	return rps->power.down_threshold;
+}
+
+int intel_rps_set_down_threshold(struct intel_rps *rps, u8 threshold)
+{
+	return rps_set_threshold(rps, &rps->power.down_threshold, threshold);
+}
+
 static void intel_rps_set_manual(struct intel_rps *rps, bool enable)
 {
 	struct intel_uncore *uncore = rps_to_uncore(rps);
diff --git a/drivers/gpu/drm/i915/gt/intel_rps.h b/drivers/gpu/drm/i915/gt/intel_rps.h
index a3fa987aa91f..92fb01f5a452 100644
--- a/drivers/gpu/drm/i915/gt/intel_rps.h
+++ b/drivers/gpu/drm/i915/gt/intel_rps.h
@@ -37,6 +37,10 @@ void intel_rps_mark_interactive(struct intel_rps *rps, bool interactive);
 
 int intel_gpu_freq(struct intel_rps *rps, int val);
 int intel_freq_opcode(struct intel_rps *rps, int val);
+u8 intel_rps_get_up_threshold(struct intel_rps *rps);
+int intel_rps_set_up_threshold(struct intel_rps *rps, u8 threshold);
+u8 intel_rps_get_down_threshold(struct intel_rps *rps);
+int intel_rps_set_down_threshold(struct intel_rps *rps, u8 threshold);
 u32 intel_rps_read_actual_frequency(struct intel_rps *rps);
 u32 intel_rps_read_actual_frequency_fw(struct intel_rps *rps);
 u32 intel_rps_get_requested_frequency(struct intel_rps *rps);
-- 
2.37.2

