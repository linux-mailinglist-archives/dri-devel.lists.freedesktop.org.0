Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F45682EF7D
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jan 2024 14:09:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0293910E561;
	Tue, 16 Jan 2024 13:09:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEB6910E598;
 Tue, 16 Jan 2024 13:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705410537; x=1736946537;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Il6I5/c5CRzVwH3EioaJ7CiY7XP+/71GxCauqv15NOs=;
 b=KXVvEShGUvZriQn4WZAepfZaSS88DM0BCGib918ApZHMKZtCiJGdTwGq
 /efOynoeLw8yxnAcxZhizLYqyLnSPBVvrOiwi85YJpkgwFSvBl1H8X7R7
 2xEAZXR3lorGdgqvewNv6ivv2PVY9rlLc4NWuK4s0tpBLqyGUJHdHL73s
 uPPDrBvMJg/Mhstj4N2HsgFXfoMHHa7wfqvQpDrYwpXrYVoNBDrHq2izG
 O+AWk+YA1lYzZwDu9w+WnZfQ/nVzN/0/nbxtIUxn6xMPAT3HvhVCmp4EX
 HfCfLRfqzAyS1iMVXArolFMMpEmVQ9VJBpfYOWVbp9d44t2w4AQkpH41X w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10954"; a="397016169"
X-IronPort-AV: E=Sophos;i="6.05,199,1701158400"; d="scan'208";a="397016169"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2024 05:08:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10954"; a="760181613"
X-IronPort-AV: E=Sophos;i="6.05,199,1701158400"; d="scan'208";a="760181613"
Received: from jfunnell-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.39.52])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2024 05:08:28 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 10/10] drm: remove drm_debug_printer in favor of
 drm_dbg_printer
Date: Tue, 16 Jan 2024 15:07:35 +0200
Message-Id: <18b5b91e62d071675a651f6f91c58f05ad74134a.1705410327.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1705410327.git.jani.nikula@intel.com>
References: <cover.1705410327.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Convert the remaining drm_debug_printer users over to drm_dbg_printer,
as it can handle the cases without struct drm_device pointer, and also
provides drm debug category and prefix support. Remove drm_debug_printer
altogether.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_modeset_lock.c |  2 +-
 drivers/gpu/drm/drm_print.c        |  7 -------
 drivers/gpu/drm/ttm/ttm_bo.c       |  2 +-
 include/drm/drm_print.h            | 17 -----------------
 4 files changed, 2 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/drm_modeset_lock.c b/drivers/gpu/drm/drm_modeset_lock.c
index 918065982db4..7694b85e75e3 100644
--- a/drivers/gpu/drm/drm_modeset_lock.c
+++ b/drivers/gpu/drm/drm_modeset_lock.c
@@ -91,7 +91,7 @@ static noinline depot_stack_handle_t __drm_stack_depot_save(void)
 
 static void __drm_stack_depot_print(depot_stack_handle_t stack_depot)
 {
-	struct drm_printer p = drm_debug_printer("drm_modeset_lock");
+	struct drm_printer p = drm_dbg_printer(NULL, DRM_UT_KMS, "drm_modeset_lock");
 	unsigned long *entries;
 	unsigned int nr_entries;
 	char *buf;
diff --git a/drivers/gpu/drm/drm_print.c b/drivers/gpu/drm/drm_print.c
index 673b29c732ea..699b7dbffd7b 100644
--- a/drivers/gpu/drm/drm_print.c
+++ b/drivers/gpu/drm/drm_print.c
@@ -182,13 +182,6 @@ void __drm_printfn_info(struct drm_printer *p, struct va_format *vaf)
 }
 EXPORT_SYMBOL(__drm_printfn_info);
 
-void __drm_printfn_debug(struct drm_printer *p, struct va_format *vaf)
-{
-	/* pr_debug callsite decorations are unhelpful here */
-	printk(KERN_DEBUG "%s %pV", p->prefix, vaf);
-}
-EXPORT_SYMBOL(__drm_printfn_debug);
-
 void __drm_printfn_dbg(struct drm_printer *p, struct va_format *vaf)
 {
 	const struct drm_device *drm = p->arg;
diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index edf10618fe2b..30e1fe864826 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -49,7 +49,7 @@
 static void ttm_bo_mem_space_debug(struct ttm_buffer_object *bo,
 					struct ttm_placement *placement)
 {
-	struct drm_printer p = drm_debug_printer(TTM_PFX);
+	struct drm_printer p = drm_dbg_printer(NULL, DRM_UT_CORE, TTM_PFX);
 	struct ttm_resource_manager *man;
 	int i, mem_type;
 
diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
index 27e23c06dad4..9cc473e5d353 100644
--- a/include/drm/drm_print.h
+++ b/include/drm/drm_print.h
@@ -184,7 +184,6 @@ void __drm_puts_coredump(struct drm_printer *p, const char *str);
 void __drm_printfn_seq_file(struct drm_printer *p, struct va_format *vaf);
 void __drm_puts_seq_file(struct drm_printer *p, const char *str);
 void __drm_printfn_info(struct drm_printer *p, struct va_format *vaf);
-void __drm_printfn_debug(struct drm_printer *p, struct va_format *vaf);
 void __drm_printfn_dbg(struct drm_printer *p, struct va_format *vaf);
 void __drm_printfn_err(struct drm_printer *p, struct va_format *vaf);
 
@@ -317,22 +316,6 @@ static inline struct drm_printer drm_info_printer(struct device *dev)
 	return p;
 }
 
-/**
- * drm_debug_printer - construct a &drm_printer that outputs to pr_debug()
- * @prefix: debug output prefix
- *
- * RETURNS:
- * The &drm_printer object
- */
-static inline struct drm_printer drm_debug_printer(const char *prefix)
-{
-	struct drm_printer p = {
-		.printfn = __drm_printfn_debug,
-		.prefix = prefix
-	};
-	return p;
-}
-
 /**
  * drm_dbg_printer - construct a &drm_printer for drm device specific output
  * @drm: the &struct drm_device pointer, or NULL
-- 
2.39.2

