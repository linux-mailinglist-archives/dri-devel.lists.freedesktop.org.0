Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 889836F062A
	for <lists+dri-devel@lfdr.de>; Thu, 27 Apr 2023 14:46:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1C0410EB50;
	Thu, 27 Apr 2023 12:45:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4B4A10EB4A;
 Thu, 27 Apr 2023 12:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682599553; x=1714135553;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5wYSUCOP8c/f8dUmE993Lb7hQFoS+E3Lw+fDhhj/isw=;
 b=bEKgJURKuzj407UUIQpOo73d2gzqSVgy546se+GBdhP9wg36sNjQvM1P
 6MDdJtOGBDSZwRBSFk4zUUZ8oIrxAHdiHeTTyqO+Aye36I5/zbDdIs3t9
 RCc3nTZO8Qy0Y4Ld6xWfOx03QXmRIKocYft97BQXReyqkO+6NNY9V1C91
 akJdwEYQPS0VootJkZ0b1Vo1tEXVPTkRN3j+GmwDICImCIwJuP0Sf+FZs
 VOm0ii45u/T6+N0Ru8eDpnSO9BsmNFIMyUG9b4vTujzXGeFdrB3c9/n23
 4XVed0eN6KjrH5UMsMa6Ve7GQ441nWQZg3pGkjz4K7bOehtZQPIsa4fVV g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="331680649"
X-IronPort-AV: E=Sophos;i="5.99,230,1677571200"; d="scan'208";a="331680649"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2023 05:45:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="688414526"
X-IronPort-AV: E=Sophos;i="5.99,230,1677571200"; d="scan'208";a="688414526"
Received: from ebaldwin-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.239.242])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2023 05:45:52 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [RFC 4/4] drm/i915: Expose RPS thresholds in sysfs
Date: Thu, 27 Apr 2023 13:45:37 +0100
Message-Id: <20230427124537.820273-5-tvrtko.ursulin@linux.intel.com>
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

User feedback indicates significant performance gains are possible in
specific games with non default RPS up/down thresholds.

Expose these tunables via sysfs which will allow users to achieve best
performance when running games and best power efficiency elsewhere.

Note this patch supports non GuC based platforms only.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
References: https://gitlab.freedesktop.org/drm/intel/-/issues/8389
---
 drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c | 104 ++++++++++++++++++++
 1 file changed, 104 insertions(+)

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
 
-- 
2.37.2

