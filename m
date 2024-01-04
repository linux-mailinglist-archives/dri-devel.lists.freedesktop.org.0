Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 56D148243E7
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jan 2024 15:36:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 801A510E48F;
	Thu,  4 Jan 2024 14:36:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9654910E48F;
 Thu,  4 Jan 2024 14:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704378976; x=1735914976;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=c501XbbTAXstC29zB4+v+B7E+LETyaMn8iPatwaRnYo=;
 b=JB8W/Ikpi8wEYkqd/sJ8755+mvqyLukBKlSFZkxE4KK7w8gdvb4yoiKh
 j6uY7V5Ed6Z6gbrqnduJL9jpPRtpzdxfgLqoQH0d3+x1rcrcocOr02JDI
 UQDMAjMgfQpu4XvY+w6QMe/J9Zeb1W5luj5AMTDBth2zTpLiLW0GuoUaZ
 Re71HLqsj4S4kVQ0U186MIjvOVf1mhbO4djFCx9GPytrtzbrMmztK3kxu
 QpINA3dx1zOn+9be+ix63p84oXEkX9VCQuSs2g9Tg01pVeK1LDSKBUW6I
 ZlPZm1AazDwNhNKWEKDLtJP973dhLXL+iOcVnuE6Guc7DhvyM+KRZ/Uyh Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="4072792"
X-IronPort-AV: E=Sophos;i="6.04,330,1695711600"; 
   d="scan'208";a="4072792"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2024 06:36:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="846271857"
X-IronPort-AV: E=Sophos;i="6.04,330,1695711600"; d="scan'208";a="846271857"
Received: from unknown (HELO intel.com) ([10.252.52.99])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2024 06:36:13 -0800
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 2/3] drm/i915/gt: Allow user to set up the CSS mode
Date: Thu,  4 Jan 2024 15:35:56 +0100
Message-ID: <20240104143558.193694-3-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240104143558.193694-1-andi.shyti@linux.intel.com>
References: <20240104143558.193694-1-andi.shyti@linux.intel.com>
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
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Now that the CCS mode is configurable, an interface has been
exposed in the GT's sysfs set of files, allowing users to set the
mode.

Additionally, another interface has been added to display the
number of available slices, named 'num_slices.'

Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c | 68 +++++++++++++++++++++
 drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.h |  1 +
 drivers/gpu/drm/i915/gt/intel_gt_sysfs.c    |  2 +
 3 files changed, 71 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c b/drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c
index fab8a77bded2..88663698eb1f 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c
@@ -7,6 +7,7 @@
 
 #include "intel_gt.h"
 #include "intel_gt_ccs_mode.h"
+#include "intel_gt_print.h"
 #include "intel_gt_regs.h"
 #include "intel_gt_types.h"
 
@@ -79,3 +80,70 @@ void intel_gt_fini_ccs_mode(struct intel_gt *gt)
 {
 	mutex_destroy(&gt->ccs.mutex);
 }
+
+static ssize_t
+ccs_mode_show(struct kobject *kobj, struct kobj_attribute *attr, char *buff)
+{
+	struct intel_gt *gt = container_of(kobj, struct intel_gt, sysfs_gt);
+
+	return sysfs_emit(buff, "%u\n", gt->ccs.mode);
+}
+
+static ssize_t
+ccs_mode_store(struct kobject *kobj, struct kobj_attribute *attr,
+	       const char *buff, size_t count)
+{
+	struct intel_gt *gt = container_of(kobj, struct intel_gt, sysfs_gt);
+	int num_slices = hweight32(CCS_MASK(gt));
+	int err;
+	u32 val;
+
+	err = kstrtou32(buff, 0, &val);
+	if (err)
+		return err;
+
+	if ((!val) || (val > num_slices) || (val % num_slices))
+		return -EINVAL;
+
+	mutex_lock(&gt->ccs.mutex);
+
+	if (val == gt->ccs.mode)
+		goto out;
+
+	gt->ccs.mode = val;
+	intel_gt_apply_ccs_mode(gt);
+
+out:
+	mutex_unlock(&gt->ccs.mutex);
+
+	return count;
+}
+
+static ssize_t
+num_slices_show(struct kobject *kobj, struct kobj_attribute *attr, char *buff)
+{
+	struct intel_gt *gt = container_of(kobj, struct intel_gt, sysfs_gt);
+	u32 num_slices;
+
+	num_slices = hweight32(CCS_MASK(gt));
+
+	return sysfs_emit(buff, "%u\n", num_slices);
+}
+
+static struct kobj_attribute ccs_mode = __ATTR_RW(ccs_mode);
+static struct kobj_attribute num_slices = __ATTR_RO(num_slices);
+
+static const struct attribute * const ccs_mode_attrs[] = {
+	&ccs_mode.attr,
+	&num_slices.attr,
+	NULL
+};
+
+void intel_gt_sysfs_ccs_mode(struct intel_gt *gt)
+{
+	int ret;
+
+	ret = sysfs_create_files(&gt->sysfs_gt, ccs_mode_attrs);
+	if (ret)
+		gt_warn(gt, "Failed to create ccs mode sysfs files");
+}
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.h b/drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.h
index 751c5700944b..ae96de1b36c5 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.h
@@ -12,5 +12,6 @@ void intel_gt_init_ccs_mode(struct intel_gt *gt);
 void intel_gt_fini_ccs_mode(struct intel_gt *gt);
 
 void intel_gt_apply_ccs_mode(struct intel_gt *gt);
+void intel_gt_sysfs_ccs_mode(struct intel_gt *gt);
 
 #endif /* INTEL_GT_CCS_MODE_H */
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_sysfs.c b/drivers/gpu/drm/i915/gt/intel_gt_sysfs.c
index 33cba406b569..a0290347938d 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_sysfs.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_sysfs.c
@@ -12,6 +12,7 @@
 #include "i915_drv.h"
 #include "i915_sysfs.h"
 #include "intel_gt.h"
+#include "intel_gt_ccs_mode.h"
 #include "intel_gt_print.h"
 #include "intel_gt_sysfs.h"
 #include "intel_gt_sysfs_pm.h"
@@ -101,6 +102,7 @@ void intel_gt_sysfs_register(struct intel_gt *gt)
 		goto exit_fail;
 
 	intel_gt_sysfs_pm_init(gt, &gt->sysfs_gt);
+	intel_gt_sysfs_ccs_mode(gt);
 
 	return;
 
-- 
2.43.0

