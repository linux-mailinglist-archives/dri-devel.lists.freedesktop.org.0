Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A4CB6F061F
	for <lists+dri-devel@lfdr.de>; Thu, 27 Apr 2023 14:46:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B453010EB46;
	Thu, 27 Apr 2023 12:45:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D4C810E286;
 Thu, 27 Apr 2023 12:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682599552; x=1714135552;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PC1vECL2c+JoHVRPLsgM4/oemXCBC0sHDU/jgIbcJY4=;
 b=Bq/+c4cO23/UKrvovaUqaB5WG2tgV1wTV7bugCXnfuX8bsgvSWq5EaUS
 YdpocMvSVTDeuh7R24niyboRm7kMetbMnWCKFzLC4wj/bpDnfON6oAbu5
 2YjsL7rQ8uU6S0BFu9Y+GNDEb4sJTQ5m7Avrwtuqkz6zf6dLxXZ0pSkDN
 0m7oxKcXKuJ/OgBMMzGw8UQ93S35FlZ7EflL+GKctwRVdM1a5IJ2xMQ5U
 P/x+oxkFxh1JXHF6hxW9uveWaz9qo2JqdrLt2dUMerpxJVnbMPbCwVAnl
 //TwECFHEs9S6XvPRVNMzxMirA/CQ7Ji2uFnOLo6ePKy+TkQVdyEVVagd A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="331680646"
X-IronPort-AV: E=Sophos;i="5.99,230,1677571200"; d="scan'208";a="331680646"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2023 05:45:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="688414521"
X-IronPort-AV: E=Sophos;i="5.99,230,1677571200"; d="scan'208";a="688414521"
Received: from ebaldwin-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.239.242])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2023 05:45:50 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [RFC 3/4] drm/i915: Add helpers for managing rps thresholds
Date: Thu, 27 Apr 2023 13:45:36 +0100
Message-Id: <20230427124537.820273-4-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230427124537.820273-1-tvrtko.ursulin@linux.intel.com>
References: <20230427124537.820273-1-tvrtko.ursulin@linux.intel.com>
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
index 343a50188c5e..c02b7104d11e 100644
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

