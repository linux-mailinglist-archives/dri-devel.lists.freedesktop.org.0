Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50AC756C4B8
	for <lists+dri-devel@lfdr.de>; Sat,  9 Jul 2022 01:49:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AD8510F00A;
	Fri,  8 Jul 2022 23:49:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF41D10F00E;
 Fri,  8 Jul 2022 23:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657324142; x=1688860142;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=U/tiOzgj1occBIiyt7kQXYdZAf/dBdyms6s9J2kqpSg=;
 b=cRpubF29waFEdoPhgpC7yQBmwvU1HryNqSNeIxjntGaJu5PISCL4M9Sf
 ka9QaRLKIrHHhL/f5bpTyKuCiW+n46YRPBrK21UQJZlNyPwtz7rtwlJiJ
 eG6IRDR2XZOBeCVW6OJ1iXa8TXIcfkc097ZAe+eueQ2ZW9tjE3yhjvpxw
 YFrcFnOGDw7QihcnWFf5gPIDnIPsWH9OPgw8Ojh+ZWVaxyFadgcbrf+T1
 UtH3SMuJhGqH5zRdA0gp7PlZy3kIiV6hvzHQEdgq/eS3wO0kN46EpKkmh
 WaCfkl5UuS57xEdFEwcfwK5QRW6OVo5ZZJp4iP92PXxrJ5ytT7EslUqTW w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10402"; a="281940290"
X-IronPort-AV: E=Sophos;i="5.92,256,1650956400"; d="scan'208";a="281940290"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2022 16:49:02 -0700
X-IronPort-AV: E=Sophos;i="5.92,256,1650956400"; d="scan'208";a="544377677"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2022 16:49:01 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [RFC] drm/i915/huc: better define HuC status getparam possible return
 values.
Date: Fri,  8 Jul 2022 16:48:41 -0700
Message-Id: <20220708234841.941229-1-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.25.1
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
Cc: Tony Ye <tony.ye@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The current HuC status getparam return values are a bit confusing in
regards to what happens in some scenarios. In particular, most of the
error cases cause the ioctl to return an error, but a couple of them,
INIT_FAIL and LOAD_FAIL, are not explicitly handled and neither is
their expected return value documented; these 2 error cases therefore
end up into the catch-all umbrella of the "HuC not loaded" case, with
this case therefore including both some error scenarios and the load
in progress one.

The updates included in this patch change the handling so that all
error cases behave the same way, i.e. return an errno code, and so
that the HuC load in progress case is unambiguous.

The patch also includes a small change to the FW init path to make sure
we always transition to an error state if something goes wrong.

This is an RFC because this is a minor change in behavior for an ioctl.
I'm arguing that this is not an API breakage because the expected return
for the cases I've changed was not well defined, but I want to make sure
no one is in opposition to this. From comments from media driver devs
on a different patch [1], it sounds like the media driver already
expected an errno value for all errors cases and is therefore already
compatible with the proposed changes.

[1] https://lists.freedesktop.org/archives/intel-gfx/2022-July/300990.html

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: Tony Ye <tony.ye@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc.c   |  1 +
 drivers/gpu/drm/i915/gt/uc/intel_huc.c   | 14 +++++++-------
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c |  1 -
 include/uapi/drm/i915_drm.h              | 16 ++++++++++++++++
 4 files changed, 24 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
index 2706a8c65090..42cb244587f1 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
@@ -455,6 +455,7 @@ int intel_guc_init(struct intel_guc *guc)
 err_fw:
 	intel_uc_fw_fini(&guc->fw);
 out:
+	intel_uc_fw_change_status(&guc->fw, INTEL_UC_FIRMWARE_INIT_FAIL);
 	i915_probe_error(gt->i915, "failed with %d\n", ret);
 	return ret;
 }
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc.c b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
index 3bb8838e325a..bddcd3242ad0 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_huc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
@@ -113,6 +113,7 @@ int intel_huc_init(struct intel_huc *huc)
 	return 0;
 
 out:
+	intel_uc_fw_change_status(&huc->fw, INTEL_UC_FIRMWARE_INIT_FAIL);
 	drm_info(&i915->drm, "HuC init failed with %d\n", err);
 	return err;
 }
@@ -200,13 +201,8 @@ static bool huc_is_authenticated(struct intel_huc *huc)
  * This function reads status register to verify if HuC
  * firmware was successfully loaded.
  *
- * Returns:
- *  * -ENODEV if HuC is not present on this platform,
- *  * -EOPNOTSUPP if HuC firmware is disabled,
- *  * -ENOPKG if HuC firmware was not installed,
- *  * -ENOEXEC if HuC firmware is invalid or mismatched,
- *  * 0 if HuC firmware is not running,
- *  * 1 if HuC firmware is authenticated and running.
+ * The return values match what is expected for the I915_PARAM_HUC_STATUS
+ * getparam.
  */
 int intel_huc_check_status(struct intel_huc *huc)
 {
@@ -219,6 +215,10 @@ int intel_huc_check_status(struct intel_huc *huc)
 		return -ENOPKG;
 	case INTEL_UC_FIRMWARE_ERROR:
 		return -ENOEXEC;
+	case INTEL_UC_FIRMWARE_INIT_FAIL:
+		return -ENOMEM;
+	case INTEL_UC_FIRMWARE_LOAD_FAIL:
+		return -EIO;
 	default:
 		break;
 	}
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
index 27363091e1af..007401397935 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
@@ -707,7 +707,6 @@ int intel_uc_fw_init(struct intel_uc_fw *uc_fw)
 out_unpin:
 	i915_gem_object_unpin_pages(uc_fw->obj);
 out:
-	intel_uc_fw_change_status(uc_fw, INTEL_UC_FIRMWARE_INIT_FAIL);
 	return err;
 }
 
diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
index 094f6e377793..0950ef0d598c 100644
--- a/include/uapi/drm/i915_drm.h
+++ b/include/uapi/drm/i915_drm.h
@@ -645,6 +645,22 @@ typedef struct drm_i915_irq_wait {
  */
 #define   I915_SCHEDULER_CAP_STATIC_PRIORITY_MAP	(1ul << 5)
 
+/*
+ * Query the status of HuC load.
+ *
+ * The query can fail in the following scenarios with the listed error codes:
+ *  -ENODEV if HuC is not present on this platform,
+ *  -EOPNOTSUPP if HuC firmware usage is disabled,
+ *  -ENOPKG if HuC firmware fetch failed,
+ *  -ENOEXEC if HuC firmware is invalid or mismatched,
+ *  -ENOMEM if i915 failed to prepare the FW objects for transfer to the uC,
+ *  -EIO if the FW transfer or the FW authentication failed.
+ *
+ * If the IOCTL is successful, the returned parameter will be set to one of the
+ * following values:
+ *  * 0 if HuC firmware load is not complete,
+ *  * 1 if HuC firmware is authenticated and running.
+ */
 #define I915_PARAM_HUC_STATUS		 42
 
 /* Query whether DRM_I915_GEM_EXECBUFFER2 supports the ability to opt-out of
-- 
2.25.1

