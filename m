Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E47B470F37
	for <lists+dri-devel@lfdr.de>; Sat, 11 Dec 2021 01:08:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F9C410E659;
	Sat, 11 Dec 2021 00:08:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97BD010E4A0;
 Sat, 11 Dec 2021 00:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639181291; x=1670717291;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dC5LiorMzWxyw9iYNvu/Uc0O5j2xIIDyz27Nm3jOgN0=;
 b=laeNDZ6jWPWoWJXOVJBbBSAZgr5C8tifc3kYVJ+6iYOH4oXCSKV8sCOF
 jpcGCoL2NoxzlcSp+lGhd3HkPJMVng6xZnWuZMW3CiGZsq81PlT/87n16
 yaT4RqWZt4hJ94ABGRrL6A3ORM9HhRM3QNjDWJmiwk4fCvy1soE9TnVX1
 Afe8rS+K8yPjiz164bOOx1Vyg5MLN4+3SCqvKCwKzyuj9p92KSFgnoFd2
 loapYqfiAzctjD07ABjkAk/Q9HT/CiE5CholCKMteRwC/D6tUnddJfJsv
 cleXERKiY3g/KYXRnIeY3wwThMt6ZEcFIjXk0ErG6JAd2z+XVJydQXwQE g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10194"; a="218508331"
X-IronPort-AV: E=Sophos;i="5.88,197,1635231600"; d="scan'208";a="218508331"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2021 16:08:11 -0800
X-IronPort-AV: E=Sophos;i="5.88,197,1635231600"; d="scan'208";a="504149984"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2021 16:08:11 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 1/3] drm/i915/uc: correctly track uc_fw init failure
Date: Fri, 10 Dec 2021 16:07:54 -0800
Message-Id: <20211211000756.1698923-2-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211211000756.1698923-1-daniele.ceraolospurio@intel.com>
References: <20211211000756.1698923-1-daniele.ceraolospurio@intel.com>
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The FAILURE state of uc_fw currently implies that the fw is loadable
(i.e init completed), so we can't use it for init failures and instead
need a dedicated error code.

Note that this currently does not cause any issues because if we fail to
init any of the firmwares we abort the load, but better be accurate
anyway in case things change in the future.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c |  2 +-
 drivers/gpu/drm/i915/gt/uc/intel_huc.c    |  2 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c  |  4 ++--
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h  | 17 +++++++++++------
 4 files changed, 15 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c
index 196424be0998..796483a41353 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c
@@ -164,6 +164,6 @@ int intel_guc_fw_upload(struct intel_guc *guc)
 	return 0;
 
 out:
-	intel_uc_fw_change_status(&guc->fw, INTEL_UC_FIRMWARE_FAIL);
+	intel_uc_fw_change_status(&guc->fw, INTEL_UC_FIRMWARE_LOAD_FAIL);
 	return ret;
 }
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc.c b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
index ff4b6869b80b..c10736dddfb4 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_huc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
@@ -199,7 +199,7 @@ int intel_huc_auth(struct intel_huc *huc)
 
 fail:
 	i915_probe_error(gt->i915, "HuC: Authentication failed %d\n", ret);
-	intel_uc_fw_change_status(&huc->fw, INTEL_UC_FIRMWARE_FAIL);
+	intel_uc_fw_change_status(&huc->fw, INTEL_UC_FIRMWARE_LOAD_FAIL);
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
index 3aa87be4f2e4..b7fa51aefdff 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
@@ -540,7 +540,7 @@ int intel_uc_fw_upload(struct intel_uc_fw *uc_fw, u32 dst_offset, u32 dma_flags)
 	i915_probe_error(gt->i915, "Failed to load %s firmware %s (%d)\n",
 			 intel_uc_fw_type_repr(uc_fw->type), uc_fw->path,
 			 err);
-	intel_uc_fw_change_status(uc_fw, INTEL_UC_FIRMWARE_FAIL);
+	intel_uc_fw_change_status(uc_fw, INTEL_UC_FIRMWARE_LOAD_FAIL);
 	return err;
 }
 
@@ -558,7 +558,7 @@ int intel_uc_fw_init(struct intel_uc_fw *uc_fw)
 	if (err) {
 		DRM_DEBUG_DRIVER("%s fw pin-pages err=%d\n",
 				 intel_uc_fw_type_repr(uc_fw->type), err);
-		intel_uc_fw_change_status(uc_fw, INTEL_UC_FIRMWARE_FAIL);
+		intel_uc_fw_change_status(uc_fw, INTEL_UC_FIRMWARE_INIT_FAIL);
 	}
 
 	return err;
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
index 1e00bf65639e..fd17abf2ab02 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
@@ -32,11 +32,12 @@ struct intel_gt;
  * |            |    MISSING <--/    |    \--> ERROR                |
  * |   fetch    |                    V                              |
  * |            |                 AVAILABLE                         |
- * +------------+-                   |                             -+
+ * +------------+-                   |   \                         -+
+ * |            |                    |    \--> INIT FAIL            |
  * |   init     |                    V                              |
  * |            |        /------> LOADABLE <----<-----------\       |
  * +------------+-       \         /    \        \           \     -+
- * |            |         FAIL <--<      \--> TRANSFERRED     \     |
+ * |            |    LOAD FAIL <--<      \--> TRANSFERRED     \     |
  * |   upload   |                  \           /   \          /     |
  * |            |                   \---------/     \--> RUNNING    |
  * +------------+---------------------------------------------------+
@@ -50,8 +51,9 @@ enum intel_uc_fw_status {
 	INTEL_UC_FIRMWARE_MISSING, /* blob not found on the system */
 	INTEL_UC_FIRMWARE_ERROR, /* invalid format or version */
 	INTEL_UC_FIRMWARE_AVAILABLE, /* blob found and copied in mem */
+	INTEL_UC_FIRMWARE_INIT_FAIL, /* failed to prepare fw objects for load */
 	INTEL_UC_FIRMWARE_LOADABLE, /* all fw-required objects are ready */
-	INTEL_UC_FIRMWARE_FAIL, /* failed to xfer or init/auth the fw */
+	INTEL_UC_FIRMWARE_LOAD_FAIL, /* failed to xfer or init/auth the fw */
 	INTEL_UC_FIRMWARE_TRANSFERRED, /* dma xfer done */
 	INTEL_UC_FIRMWARE_RUNNING /* init/auth done */
 };
@@ -130,10 +132,12 @@ const char *intel_uc_fw_status_repr(enum intel_uc_fw_status status)
 		return "ERROR";
 	case INTEL_UC_FIRMWARE_AVAILABLE:
 		return "AVAILABLE";
+	case INTEL_UC_FIRMWARE_INIT_FAIL:
+		return "INIT FAIL";
 	case INTEL_UC_FIRMWARE_LOADABLE:
 		return "LOADABLE";
-	case INTEL_UC_FIRMWARE_FAIL:
-		return "FAIL";
+	case INTEL_UC_FIRMWARE_LOAD_FAIL:
+		return "LOAD FAIL";
 	case INTEL_UC_FIRMWARE_TRANSFERRED:
 		return "TRANSFERRED";
 	case INTEL_UC_FIRMWARE_RUNNING:
@@ -155,7 +159,8 @@ static inline int intel_uc_fw_status_to_error(enum intel_uc_fw_status status)
 		return -ENOENT;
 	case INTEL_UC_FIRMWARE_ERROR:
 		return -ENOEXEC;
-	case INTEL_UC_FIRMWARE_FAIL:
+	case INTEL_UC_FIRMWARE_INIT_FAIL:
+	case INTEL_UC_FIRMWARE_LOAD_FAIL:
 		return -EIO;
 	case INTEL_UC_FIRMWARE_SELECTED:
 		return -ESTALE;
-- 
2.25.1

