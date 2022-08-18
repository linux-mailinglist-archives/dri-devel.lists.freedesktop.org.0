Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C735990E3
	for <lists+dri-devel@lfdr.de>; Fri, 19 Aug 2022 01:04:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FB0710EF95;
	Thu, 18 Aug 2022 23:04:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2AA510E441;
 Thu, 18 Aug 2022 23:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660863806; x=1692399806;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ofie0f11RtB4MpZLQTp7TX+t/kKyNhbN3eXjdX4N77I=;
 b=Skcyx60nMvmAKzaXgcLiUBEyl+qiu/nyfGlwjaOGSKbBb5gyn6bTVPDf
 rsOqiyxq+c1SMrmgPjcIceMiCViwn/WfXsSCPgJjcvjjIMK0coLpVwVhX
 5UNcYmWmtJ72Eg38MKach6aBAa8hHzkaNiiP0qOzzJC436axmUBcbeJs2
 lf9emKcDp3LjqMeheWwWvGaMCnHA5JLwOIIO/455+sdPjJvD5hupD9wLB
 44y4CfJGaoouNR4Pd4OAyYAH6xLRT6a3r/A4CVLXjn8Fibjo9fJ2fuOAl
 +g/GzZ/w834BJJiKngVriwqgZh5Pc5rvEcu5Bfo2mI6vJ/HCVNTvchHsX g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10443"; a="293677579"
X-IronPort-AV: E=Sophos;i="5.93,247,1654585200"; d="scan'208";a="293677579"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2022 16:03:26 -0700
X-IronPort-AV: E=Sophos;i="5.93,247,1654585200"; d="scan'208";a="641042887"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2022 16:03:26 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 13/15] drm/i915/huc: better define HuC status getparam
 possible return values.
Date: Thu, 18 Aug 2022 16:02:41 -0700
Message-Id: <20220818230243.3921066-14-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220818230243.3921066-1-daniele.ceraolospurio@intel.com>
References: <20220818230243.3921066-1-daniele.ceraolospurio@intel.com>
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
 dri-devel@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
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

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: Tony Ye <tony.ye@intel.com>
Acked-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Acked-by: Tony Ye <tony.ye@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc.c   |  1 +
 drivers/gpu/drm/i915/gt/uc/intel_huc.c   | 14 +++++++-------
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c |  1 -
 include/uapi/drm/i915_drm.h              | 16 ++++++++++++++++
 4 files changed, 24 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
index 01f2705cb94a..10b2da810a8f 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
@@ -443,6 +443,7 @@ int intel_guc_init(struct intel_guc *guc)
 err_fw:
 	intel_uc_fw_fini(&guc->fw);
 out:
+	intel_uc_fw_change_status(&guc->fw, INTEL_UC_FIRMWARE_INIT_FAIL);
 	i915_probe_error(gt->i915, "failed with %d\n", ret);
 	return ret;
 }
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc.c b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
index 9a97b8cc90c7..1a34c902d081 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_huc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
@@ -284,6 +284,7 @@ int intel_huc_init(struct intel_huc *huc)
 	return 0;
 
 out:
+	intel_uc_fw_change_status(&huc->fw, INTEL_UC_FIRMWARE_INIT_FAIL);
 	drm_info(&i915->drm, "HuC init failed with %d\n", err);
 	return err;
 }
@@ -403,13 +404,8 @@ bool intel_huc_is_authenticated(struct intel_huc *huc)
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
@@ -422,6 +418,10 @@ int intel_huc_check_status(struct intel_huc *huc)
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
index 58547292efa0..cec6bf6bad3f 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
@@ -749,7 +749,6 @@ int intel_uc_fw_init(struct intel_uc_fw *uc_fw)
 out_unpin:
 	i915_gem_object_unpin_pages(uc_fw->obj);
 out:
-	intel_uc_fw_change_status(uc_fw, INTEL_UC_FIRMWARE_INIT_FAIL);
 	return err;
 }
 
diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
index 520ad2691a99..629198f1d8d8 100644
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
2.37.2

