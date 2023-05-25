Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E4047106FF
	for <lists+dri-devel@lfdr.de>; Thu, 25 May 2023 10:12:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 497C510E811;
	Thu, 25 May 2023 08:12:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF94510E7EE;
 Thu, 25 May 2023 08:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685002324; x=1716538324;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cD9zyhxp1uXzU07tl3dhVj4mDkaCDgdNKKeEwPinc7g=;
 b=b2JKoNr4O2OdSnesl1A7ht05cFBhix3wxBwSSWFOUkMEu0brmICVYnTU
 GOdymBca+L6h6d8o3o84mkCKfEObErQI5ZgCoONgPAE+mVkY4c2jr97kO
 7QCOF6ryMRkOOQaf4aZs5/hkpWYP7vuHFLUbiDECIS5DLGNqP3srdiRt3
 Qvee2tFJhu5+8AQWP3wzZepeelRb+XTw9YmaTUwT6+lHi9IJoKBuknXdg
 pVPkDF0GnNqsTRUC7fYxqiLK4OG0zwr5Y8MtCGX8kkK3oPQy2FGorm070
 oleM+YeWLi6ZCqDN+N21PdsVKc2F4KKesZUiMXCpSmJbq2kqNytKnEspJ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="417288510"
X-IronPort-AV: E=Sophos;i="6.00,190,1681196400"; d="scan'208";a="417288510"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 01:11:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="655122999"
X-IronPort-AV: E=Sophos;i="6.00,190,1681196400"; d="scan'208";a="655122999"
Received: from moiraric-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.234.103])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 01:11:49 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 4/5] drm/i915: Expose RPS thresholds in sysfs
Date: Thu, 25 May 2023 09:11:32 +0100
Message-Id: <20230525081133.215292-5-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230525081133.215292-1-tvrtko.ursulin@linux.intel.com>
References: <20230525081133.215292-1-tvrtko.ursulin@linux.intel.com>
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
Cc: Rodrigo Vivi <rodrigo.vivi@kernel.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Andi Shyti <andi.shyti@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

User feedback indicates significant performance gains are possible in
specific games with non default RPS up/down thresholds.

Expose these tunables via sysfs which will allow users to achieve best
performance when running games and best power efficiency elsewhere.

Note this patch supports non GuC based platforms only.

v2:
 * Make checkpatch happy.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
References: https://gitlab.freedesktop.org/drm/intel/-/issues/8389
Cc: Rodrigo Vivi <rodrigo.vivi@kernel.org>
Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c | 108 ++++++++++++++++++++
 1 file changed, 108 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c b/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c
index ee2b44f896a2..f0dea54880af 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c
@@ -700,6 +700,80 @@ static const struct attribute *media_perf_power_attrs[] = {
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
+	__ATTR(rps_up_threshold_pct,
+	       0664,
+	       rps_up_threshold_pct_show,
+	       rps_up_threshold_pct_store);
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
+	__ATTR(rps_down_threshold_pct,
+	       0664,
+	       rps_down_threshold_pct_show,
+	       rps_down_threshold_pct_store);
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
@@ -722,9 +796,37 @@ default_max_freq_mhz_show(struct kobject *kobj, struct kobj_attribute *attr, cha
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
 
@@ -752,6 +854,12 @@ static int intel_sysfs_rps_init(struct intel_gt *gt, struct kobject *kobj)
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
2.39.2

