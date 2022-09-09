Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 160FF5B2B0A
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 02:17:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A398710E8B7;
	Fri,  9 Sep 2022 00:17:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B7BC10E87A;
 Fri,  9 Sep 2022 00:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662682612; x=1694218612;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MGjhivVnReDA5Gk7uWtX9cOLeuyItcQhxZGqtkbTO+M=;
 b=JJ+/LNjxcE1rsPJz9T5PHCt8yJ/OIULhh2DuXPiUWQh+cRV5oLjTMTgR
 UvewlG8nE3lmgq0hmwHXA3yo2AU9UViqmzecNHlDhj//Cmzh3XlJS4tEE
 w5qsmKKMyeZV50Wa7KT+r5vXs0Sag9T7fOdX8LXA/b1hgv1tw4LRG/nfb
 FvnuiYiYErdv2PY65t1OxmJ4w53nG5yReWgAA6kwttXqjzX0LTPCQNDoD
 wA3/pJUEtAJy7X6s4golLmpkEAVC1H5YocWv3sbdvE+X7bNvaMAh5kwJm
 x8/8m+Th+2mTHL8Cut1LOT2vOQ07jfPKUitoUbli55Vwgz2CBvkvUDHH9 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10464"; a="294938876"
X-IronPort-AV: E=Sophos;i="5.93,300,1654585200"; d="scan'208";a="294938876"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2022 17:16:52 -0700
X-IronPort-AV: E=Sophos;i="5.93,300,1654585200"; d="scan'208";a="676933259"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2022 17:16:52 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v4 13/15] drm/i915/huc: better define HuC status getparam
 possible return values.
Date: Thu,  8 Sep 2022 17:16:10 -0700
Message-Id: <20220909001612.728451-14-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220909001612.728451-1-daniele.ceraolospurio@intel.com>
References: <20220909001612.728451-1-daniele.ceraolospurio@intel.com>
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
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>, dri-devel@lists.freedesktop.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
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
Reviewed-by: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc.c   |  1 +
 drivers/gpu/drm/i915/gt/uc/intel_huc.c   | 14 +++++++-------
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c |  1 -
 include/uapi/drm/i915_drm.h              | 16 ++++++++++++++++
 4 files changed, 24 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
index 24451d000a6a..bfc5a8d3d603 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
@@ -441,6 +441,7 @@ int intel_guc_init(struct intel_guc *guc)
 err_fw:
 	intel_uc_fw_fini(&guc->fw);
 out:
+	intel_uc_fw_change_status(&guc->fw, INTEL_UC_FIRMWARE_INIT_FAIL);
 	i915_probe_error(gt->i915, "failed with %d\n", ret);
 	return ret;
 }
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc.c b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
index 13d93e69766f..529ddd1e9c06 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_huc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
@@ -285,6 +285,7 @@ int intel_huc_init(struct intel_huc *huc)
 	return 0;
 
 out:
+	intel_uc_fw_change_status(&huc->fw, INTEL_UC_FIRMWARE_INIT_FAIL);
 	drm_info(&i915->drm, "HuC init failed with %d\n", err);
 	return err;
 }
@@ -404,13 +405,8 @@ bool intel_huc_is_authenticated(struct intel_huc *huc)
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
@@ -423,6 +419,10 @@ int intel_huc_check_status(struct intel_huc *huc)
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
index af425916cdf6..4792960d9c04 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
@@ -890,7 +890,6 @@ int intel_uc_fw_init(struct intel_uc_fw *uc_fw)
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

