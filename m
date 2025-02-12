Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14DF9A33066
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2025 21:06:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A8C610E97E;
	Wed, 12 Feb 2025 20:06:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IPEinzJc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BC8910E97E
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2025 20:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739390769; x=1770926769;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Gr626Pije9wvykEMTGa0ijTndejJ/ehjVeon9HAk+UU=;
 b=IPEinzJcFFN2aCUc5ReplUMXvsner+sBnOWKh2SCPsE6HBS20PnJrPSX
 jCIjfVlua356+xMXDy1mrbbth45W2c5pz6AOEMqp3ae9AnGIn/icEILhq
 MW0irKONA++q6JrpIViUOfNhoAVzb4eiw5Hz7dN5bWdfBoMG6bAW/GYdj
 Vc5NdG6/DCyEEX+91yAEeZhpCBdo/6oRpYdvf6MNLFAK6llLQQXK6V6OK
 TagaKUWB3DxdbuN8S8qehuXKp2yggnJlBXXtujBUcRCGpJSO0Q4MrVed2
 TPGGS5NurpHgP0fbvCkYwYgI6iYKEj1lNxJBsEWKRyB6e5lhnXrVmoweO A==;
X-CSE-ConnectionGUID: UqSu2pnkTIa3rmW561e8fg==
X-CSE-MsgGUID: O03ZSP13Td2IrWcUFPuy+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="50718511"
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; d="scan'208";a="50718511"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 12:06:08 -0800
X-CSE-ConnectionGUID: nO6j/1LaSwKZdrcUYzdffQ==
X-CSE-MsgGUID: TCOz3OYYR0y5qL07mSklIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; d="scan'208";a="118010770"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 12:06:08 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: linux-kernel@vger.kernel.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>, dri-devel@lists.freedesktop.org,
 Danilo Krummrich <dakr@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 6/6] drm/xe: Drop remove callback support
Date: Wed, 12 Feb 2025 12:05:42 -0800
Message-ID: <20250212200542.515493-7-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250212200542.515493-1-lucas.demarchi@intel.com>
References: <20250212200542.515493-1-lucas.demarchi@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Now that devres supports component driver cleanup during driver removal
cleanup, the xe custom support for removal callbacks is not needed
anymore. Drop it.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c       | 79 ----------------------------
 drivers/gpu/drm/xe/xe_device.h       |  4 --
 drivers/gpu/drm/xe/xe_device_types.h | 17 ------
 drivers/gpu/drm/xe/xe_pci.c          |  4 +-
 4 files changed, 1 insertion(+), 103 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 4b4039cf29fd4..d83400bbff8b1 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -65,12 +65,6 @@
 
 #include <generated/xe_wa_oob.h>
 
-struct xe_device_remove_action {
-	struct list_head node;
-	xe_device_remove_action_t remove;
-	void *data;
-};
-
 static int xe_file_open(struct drm_device *dev, struct drm_file *file)
 {
 	struct xe_device *xe = to_xe_device(dev);
@@ -752,9 +746,6 @@ int xe_device_probe(struct xe_device *xe)
 	int err;
 	u8 id;
 
-	xe->probing = true;
-	INIT_LIST_HEAD(&xe->remove_action_list);
-
 	xe_pat_init_early(xe);
 
 	err = xe_sriov_init(xe);
@@ -904,8 +895,6 @@ int xe_device_probe(struct xe_device *xe)
 
 	xe_vsec_init(xe);
 
-	xe->probing = false;
-
 	return devm_add_action_or_reset(xe->drm.dev, xe_device_sanitize, xe);
 
 err_unregister_display:
@@ -916,72 +905,6 @@ int xe_device_probe(struct xe_device *xe)
 	return err;
 }
 
-/**
- * xe_device_call_remove_actions - Call the remove actions
- * @xe: xe device instance
- *
- * This is only to be used by xe_pci and xe_device to call the remove actions
- * while removing the driver or handling probe failures.
- */
-void xe_device_call_remove_actions(struct xe_device *xe)
-{
-	struct xe_device_remove_action *ra, *tmp;
-
-	list_for_each_entry_safe(ra, tmp, &xe->remove_action_list, node) {
-		ra->remove(xe, ra->data);
-		list_del(&ra->node);
-		kfree(ra);
-	}
-
-	xe->probing = false;
-}
-
-/**
- * xe_device_add_action_or_reset - Add an action to run on driver removal
- * @xe: xe device instance
- * @ra: pointer to the object embedded into the object to cleanup
- * @remove: function to execute. The @ra is passed as argument
- *
- * Example:
- *
- * .. code-block:: c
- *
- *	static void foo_remove(struct xe_device_remove_action *ra)
- *	{
- *		struct xe_foo *foo = container_of(ra, struct xe_foo, remove_action);
- *		...
- *	}
- *
- *	int xe_foo_init(struct xe_foo *foo)
- *	{
- *		...
- *		xe_device_add_remove_action(xe, &foo->remove_action, foo_remove);
- *		...
- *		return 0;
- *	};
- */
-int xe_device_add_action_or_reset(struct xe_device *xe,
-				  xe_device_remove_action_t action,
-				  void *data)
-{
-	struct xe_device_remove_action *ra;
-
-	drm_WARN_ON(&xe->drm, !xe->probing);
-
-	ra = kmalloc(sizeof(*ra), GFP_KERNEL);
-	if (!ra) {
-		action(xe, data);
-		return -ENOMEM;
-	}
-
-	INIT_LIST_HEAD(&ra->node);
-	ra->remove = action;
-	ra->data = data;
-	list_add(&ra->node, &xe->remove_action_list);
-
-	return 0;
-}
-
 void xe_device_remove(struct xe_device *xe)
 {
 	xe_display_unregister(xe);
@@ -991,8 +914,6 @@ void xe_device_remove(struct xe_device *xe)
 	xe_display_driver_remove(xe);
 
 	xe_heci_gsc_fini(xe);
-
-	xe_device_call_remove_actions(xe);
 }
 
 void xe_device_shutdown(struct xe_device *xe)
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index a6fedf1ef3c7b..0bc3bc8e68030 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -45,10 +45,6 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
 				   const struct pci_device_id *ent);
 int xe_device_probe_early(struct xe_device *xe);
 int xe_device_probe(struct xe_device *xe);
-int xe_device_add_action_or_reset(struct xe_device *xe,
-				  xe_device_remove_action_t action,
-				  void *data);
-void xe_device_call_remove_actions(struct xe_device *xe);
 void xe_device_remove(struct xe_device *xe);
 void xe_device_shutdown(struct xe_device *xe);
 
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index b322d49c83c77..833c29fed3a37 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -35,7 +35,6 @@
 #include "intel_display_device.h"
 #endif
 
-struct xe_device;
 struct xe_ggtt;
 struct xe_pat_ops;
 struct xe_pxp;
@@ -71,8 +70,6 @@ struct xe_pxp;
 		 const struct xe_tile * : (const struct xe_device *)((tile__)->xe),	\
 		 struct xe_tile * : (tile__)->xe)
 
-typedef void (*xe_device_remove_action_t)(struct xe_device *xe, void *data);
-
 /**
  * struct xe_vram_region - memory region structure
  * This is used to describe a memory region in xe
@@ -431,20 +428,6 @@ struct xe_device {
 	/** @tiles: device tiles */
 	struct xe_tile tiles[XE_MAX_TILES_PER_DEVICE];
 
-	/**
-	 * @remove_action_list: list of actions to execute on device remove.
-	 * Use xe_device_add_remove_action() for that. Actions can only be added
-	 * during probe and are executed during the call from PCI subsystem to
-	 * remove the driver from the device.
-	 */
-	struct list_head remove_action_list;
-
-	/**
-	 * @probing: cover the section in which @remove_action_list can be used
-	 * to post cleaning actions
-	 */
-	bool probing;
-
 	/**
 	 * @mem_access: keep track of memory access in the device, possibly
 	 * triggering additional actions when they occur.
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 41ec6825b9bcc..447eacb355d7c 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -900,10 +900,8 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 		return err;
 
 	err = xe_device_probe(xe);
-	if (err) {
-		xe_device_call_remove_actions(xe);
+	if (err)
 		return err;
-	}
 
 	err = xe_pm_init(xe);
 	if (err)
-- 
2.48.1

