Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E70A653703
	for <lists+dri-devel@lfdr.de>; Wed, 21 Dec 2022 20:30:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EC3B10E493;
	Wed, 21 Dec 2022 19:29:55 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D10DC10E48D;
 Wed, 21 Dec 2022 19:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671650991; x=1703186991;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xR2sj4Q8bZ1XJXrYRM3EK9V+NbIW9Jf7aYvdNJfLCeU=;
 b=KWETc1Pyg9HO/oDvLCAG61emThSYQoX41xp1Bc5J8hu9nXYyUi2jIYn7
 q1GlS08PDTNv5oMnTterwnCq24PmU9O9kn+49rPSJZ0NuACPz3uvfWriA
 ixtxQv5kt322cMkiO5KilsStYRyx/SDSq7i19G2tw5eZ1tBn4hHX8xbc6
 meiHUj68L9/xAbpJxh6yniuHcdI5cnw+yKQ3F4+8weIfIOkV81qiWL5Ek
 Uqhag9eJfdSXRqJfcincZxh5P9hV8eLrxiipObM5aPkODaA/sYGHhms0J
 7OAKpmMrpLV1gXLaqL5nILNM14X35/l/fpZW89NbmFX7h/Pchf3gNHCJC w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10568"; a="321871018"
X-IronPort-AV: E=Sophos;i="5.96,263,1665471600"; d="scan'208";a="321871018"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2022 11:29:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10568"; a="644948813"
X-IronPort-AV: E=Sophos;i="5.96,263,1665471600"; d="scan'208";a="644948813"
Received: from relo-linux-5.jf.intel.com ([10.165.21.200])
 by orsmga007.jf.intel.com with ESMTP; 21 Dec 2022 11:29:50 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH 3/3] drm/i915/uc: Fix two issues with over-size firmware files
Date: Wed, 21 Dec 2022 11:30:31 -0800
Message-Id: <20221221193031.687266-4-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221221193031.687266-1-John.C.Harrison@Intel.com>
References: <20221221193031.687266-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 Jani Nikula <jani.nikula@intel.com>, DRI-Devel@Lists.FreeDesktop.Org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

In the case where a firmware file is too large (e.g. someone
downloaded a web page ASCII dump from github...), the firmware object
is released but the pointer is not zerod. If no other firmware file
was found then release would be called again leading to a double kfree.

Also, the size check was only being applied to the initial firmware
load not any of the subsequent attempts. So move the check into a
wrapper that is used for all loads.

Fixes: 016241168dc5 ("drm/i915/uc: use different ggtt pin offsets for uc loads")
Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c | 42 ++++++++++++++++--------
 1 file changed, 28 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
index d6ff6c584c1e1..65672ff826054 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
@@ -675,6 +675,32 @@ static int check_fw_header(struct intel_gt *gt,
 	return 0;
 }
 
+static int try_firmware_load(struct intel_uc_fw *uc_fw, const struct firmware **fw)
+{
+	struct intel_gt *gt = __uc_fw_to_gt(uc_fw);
+	struct device *dev = gt->i915->drm.dev;
+	int err;
+
+	err = firmware_request_nowarn(fw, uc_fw->file_selected.path, dev);
+
+	if (err)
+		return err;
+
+	if ((*fw)->size > INTEL_UC_RSVD_GGTT_PER_FW) {
+		drm_err(&gt->i915->drm,
+			"%s firmware %s: size (%zuKB) exceeds max supported size (%uKB)\n",
+			intel_uc_fw_type_repr(uc_fw->type), uc_fw->file_selected.path,
+			(*fw)->size / SZ_1K, INTEL_UC_RSVD_GGTT_PER_FW / SZ_1K);
+
+		/* try to find another blob to load */
+		release_firmware(*fw);
+		*fw = NULL;
+		return -ENOENT;
+	}
+
+	return 0;
+}
+
 /**
  * intel_uc_fw_fetch - fetch uC firmware
  * @uc_fw: uC firmware
@@ -688,7 +714,6 @@ int intel_uc_fw_fetch(struct intel_uc_fw *uc_fw)
 	struct intel_gt *gt = __uc_fw_to_gt(uc_fw);
 	struct drm_i915_private *i915 = gt->i915;
 	struct intel_uc_fw_file file_ideal;
-	struct device *dev = i915->drm.dev;
 	struct drm_i915_gem_object *obj;
 	const struct firmware *fw = NULL;
 	bool old_ver = false;
@@ -704,20 +729,9 @@ int intel_uc_fw_fetch(struct intel_uc_fw *uc_fw)
 	__force_fw_fetch_failures(uc_fw, -EINVAL);
 	__force_fw_fetch_failures(uc_fw, -ESTALE);
 
-	err = firmware_request_nowarn(&fw, uc_fw->file_selected.path, dev);
+	err = try_firmware_load(uc_fw, &fw);
 	memcpy(&file_ideal, &uc_fw->file_wanted, sizeof(file_ideal));
 
-	if (!err && fw->size > INTEL_UC_RSVD_GGTT_PER_FW) {
-		drm_err(&i915->drm,
-			"%s firmware %s: size (%zuKB) exceeds max supported size (%uKB)\n",
-			intel_uc_fw_type_repr(uc_fw->type), uc_fw->file_selected.path,
-			fw->size / SZ_1K, INTEL_UC_RSVD_GGTT_PER_FW / SZ_1K);
-
-		/* try to find another blob to load */
-		release_firmware(fw);
-		err = -ENOENT;
-	}
-
 	/* Any error is terminal if overriding. Don't bother searching for older versions */
 	if (err && intel_uc_fw_is_overridden(uc_fw))
 		goto fail;
@@ -738,7 +752,7 @@ int intel_uc_fw_fetch(struct intel_uc_fw *uc_fw)
 			break;
 		}
 
-		err = firmware_request_nowarn(&fw, uc_fw->file_selected.path, dev);
+		err = try_firmware_load(uc_fw, &fw);
 	}
 
 	if (err)
-- 
2.39.0

