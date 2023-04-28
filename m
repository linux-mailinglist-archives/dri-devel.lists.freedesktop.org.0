Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D5D56F1318
	for <lists+dri-devel@lfdr.de>; Fri, 28 Apr 2023 10:15:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CD1910EC78;
	Fri, 28 Apr 2023 08:15:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0CE610EC66;
 Fri, 28 Apr 2023 08:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682669710; x=1714205710;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/fbGcVUAgRkDxLs2w4eCmY9c8d+f/M9VsWSm5d15y9Y=;
 b=ZAeijC6jKMX6FKAigZnIpLLa+fDhOG2Y3YYVmzN3Ucbsbvs9GYlxaFl2
 PRjHiihxHotEC51rwf+nAHEO8RqQ5GRWCw8TYZibTnvp+m1n0xgbhD2CF
 6ionFfTdjcfBH9Tcw5LrhqmDMZQBGpQspGC9EGpzP6kMPRkZBKZMxUatN
 9QJilwm96GWY0uiGhWpnWSQkYxyLVQ+C9yz80jJP54HWfJEf8xPyS8i22
 BTKUpNFMpIQIRTjDMT9IsWUrpNa3VmDtTNziq9sCLtQof0TmrY4iQ3B0V
 lWj17kREUnts9AWMpD4NHDOo5I6srJ/pZUSXHckohxiax8JFZWxJmpvxf g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="328011805"
X-IronPort-AV: E=Sophos;i="5.99,234,1677571200"; d="scan'208";a="328011805"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2023 01:15:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="694726772"
X-IronPort-AV: E=Sophos;i="5.99,234,1677571200"; d="scan'208";a="694726772"
Received: from ksathish-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.194.196])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2023 01:15:09 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [RFC 4/4] drm/i915: Expose RPS thresholds in sysfs
Date: Fri, 28 Apr 2023 09:14:57 +0100
Message-Id: <20230428081457.857009-5-tvrtko.ursulin@linux.intel.com>
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

User feedback indicates significant performance gains are possible in
specific games with non default RPS up/down thresholds.

Expose these tunables via sysfs which will allow users to achieve best
performance when running games and best power efficiency elsewhere.

Note this patch supports non GuC based platforms only.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
References: https://gitlab.freedesktop.org/drm/intel/-/issues/8389
---
 drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c | 104 ++++++++++++++++++++
 drivers/gpu/drm/i915/gt/intel_rps.c         |   7 +-
 2 files changed, 110 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c b/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c
index 28f27091cd3b..df1f9ef08475 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c
@@ -671,6 +671,76 @@ static const struct attribute *media_perf_power_attrs[] = {
 	NULL
 };
 
+static ssize_t
+rps_up_threshold_pct_show(struct kobject *kobj, struct kobj_attribute *attr,
+			  char *buf)
+{
+	struct intel_gt *gt = intel_gt_sysfs_get_drvdata(kobj, attr->attr.name);
+	struct intel_rps *rps = &gt->rps;
+
+	return sysfs_emit(buf, "%u\n", intel_rps_get_up_threshold(rps));
+}
+
+static ssize_t
+rps_up_threshold_pct_store(struct kobject *kobj, struct kobj_attribute *attr,
+			   const char *buf, size_t count)
+{
+	struct intel_gt *gt = intel_gt_sysfs_get_drvdata(kobj, attr->attr.name);
+	struct intel_rps *rps = &gt->rps;
+	int ret;
+	u8 val;
+
+	ret = kstrtou8(buf, 10, &val);
+	if (ret)
+		return ret;
+
+	ret = intel_rps_set_up_threshold(rps, val);
+
+	return ret == 0 ? count : ret;
+}
+
+static struct kobj_attribute rps_up_threshold_pct =
+__ATTR(rps_up_threshold_pct, 0664,
+       rps_up_threshold_pct_show, rps_up_threshold_pct_store);
+
+static ssize_t
+rps_down_threshold_pct_show(struct kobject *kobj, struct kobj_attribute *attr,
+			    char *buf)
+{
+	struct intel_gt *gt = intel_gt_sysfs_get_drvdata(kobj, attr->attr.name);
+	struct intel_rps *rps = &gt->rps;
+
+	return sysfs_emit(buf, "%u\n", intel_rps_get_down_threshold(rps));
+}
+
+static ssize_t
+rps_down_threshold_pct_store(struct kobject *kobj, struct kobj_attribute *attr,
+			     const char *buf, size_t count)
+{
+	struct intel_gt *gt = intel_gt_sysfs_get_drvdata(kobj, attr->attr.name);
+	struct intel_rps *rps = &gt->rps;
+	int ret;
+	u8 val;
+
+	ret = kstrtou8(buf, 10, &val);
+	if (ret)
+		return ret;
+
+	ret = intel_rps_set_down_threshold(rps, val);
+
+	return ret == 0 ? count : ret;
+}
+
+static struct kobj_attribute rps_down_threshold_pct =
+__ATTR(rps_down_threshold_pct, 0664,
+       rps_down_threshold_pct_show, rps_down_threshold_pct_store);
+
+static const struct attribute * const gen6_gt_rps_attrs[] = {
+	&rps_up_threshold_pct.attr,
+	&rps_down_threshold_pct.attr,
+	NULL
+};
+
 static ssize_t
 default_min_freq_mhz_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf)
 {
@@ -693,9 +763,37 @@ default_max_freq_mhz_show(struct kobject *kobj, struct kobj_attribute *attr, cha
 static struct kobj_attribute default_max_freq_mhz =
 __ATTR(rps_max_freq_mhz, 0444, default_max_freq_mhz_show, NULL);
 
+static ssize_t
+default_rps_up_threshold_pct_show(struct kobject *kobj,
+				  struct kobj_attribute *attr,
+				  char *buf)
+{
+	struct intel_gt *gt = kobj_to_gt(kobj->parent);
+
+	return sysfs_emit(buf, "%u\n", gt->defaults.rps_up_threshold);
+}
+
+static struct kobj_attribute default_rps_up_threshold_pct =
+__ATTR(rps_up_threshold_pct, 0444, default_rps_up_threshold_pct_show, NULL);
+
+static ssize_t
+default_rps_down_threshold_pct_show(struct kobject *kobj,
+				    struct kobj_attribute *attr,
+				    char *buf)
+{
+	struct intel_gt *gt = kobj_to_gt(kobj->parent);
+
+	return sysfs_emit(buf, "%u\n", gt->defaults.rps_down_threshold);
+}
+
+static struct kobj_attribute default_rps_down_threshold_pct =
+__ATTR(rps_down_threshold_pct, 0444, default_rps_down_threshold_pct_show, NULL);
+
 static const struct attribute * const rps_defaults_attrs[] = {
 	&default_min_freq_mhz.attr,
 	&default_max_freq_mhz.attr,
+	&default_rps_up_threshold_pct.attr,
+	&default_rps_down_threshold_pct.attr,
 	NULL
 };
 
@@ -723,6 +821,12 @@ static int intel_sysfs_rps_init(struct intel_gt *gt, struct kobject *kobj)
 	if (IS_VALLEYVIEW(gt->i915) || IS_CHERRYVIEW(gt->i915))
 		ret = sysfs_create_file(kobj, vlv_attr);
 
+	if (is_object_gt(kobj) && !intel_uc_uses_guc_slpc(&gt->uc)) {
+		ret = sysfs_create_files(kobj, gen6_gt_rps_attrs);
+		if (ret)
+			return ret;
+	}
+
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
index a5a7315f5ace..f790e81546ff 100644
--- a/drivers/gpu/drm/i915/gt/intel_rps.c
+++ b/drivers/gpu/drm/i915/gt/intel_rps.c
@@ -2588,7 +2588,12 @@ static int rps_set_threshold(struct intel_rps *rps, u8 *threshold, u8 val)
 	ret = mutex_lock_interruptible(&rps->lock);
 	if (ret)
 		return ret;
-	*threshold = val;
+	if (*threshold != val) {
+		*threshold = val;
+		intel_rps_set(rps, clamp(rps->cur_freq,
+					 rps->min_freq_softlimit,
+					 rps->max_freq_softlimit));
+	}
 	mutex_unlock(&rps->lock);
 
 	return 0;
-- 
2.37.2

