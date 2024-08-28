Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0A11961C59
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 04:48:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E482710E473;
	Wed, 28 Aug 2024 02:48:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KMjtA/HJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C288010E457;
 Wed, 28 Aug 2024 02:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724813292; x=1756349292;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Vx+8VWEdGezuA95bABYtF6TDAgHg9iYCZ0igRn4uPGI=;
 b=KMjtA/HJD37cYXucxboGaroOFzUE//oKc36E/QjrS7PUtxmHGMRLondL
 KFon94iclv1w4no+zMekxBFx8axwQZZZ/GYvMHqbNAZZh6odN8nm+73W5
 okhELzcaNaoR8xX05F/pUP9xYwchiTa4PTNH5RSd8ultpeu/NBxeyB7U/
 qbmcdmSiPcBvilK7WzZ9L73GPtUHbT2Dy2xzC/8yIxzh+H76GoZ8kIAiZ
 eLdtOpXpSvVpvQZ/mqPnzKN0e2DNq7Ww7INOvsAVycmTepDB54Ttxpwzj
 MeOey7NRKSkw0/T/O0d+OOz8HJ/kEFORcG3xLcUdXtnZ0zHE144ZjNs2f Q==;
X-CSE-ConnectionGUID: Nq2BaDVGQwKUqW8n/ZKs7Q==
X-CSE-MsgGUID: 3eV5EQc+Tn2JXhEeT5rXOA==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="13251959"
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; d="scan'208";a="13251959"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 19:48:11 -0700
X-CSE-ConnectionGUID: FL1tGSn/SEya0OVl8qN9cg==
X-CSE-MsgGUID: 55MfEsFMSaa1naPUH44qBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; d="scan'208";a="67224677"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 19:48:11 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: airlied@gmail.com, christian.koenig@amd.com,
 thomas.hellstrom@linux.intel.com, matthew.auld@intel.com, daniel@ffwll.ch
Subject: [RFC PATCH 27/28] drm/xe: Add modparam for SVM prefault
Date: Tue, 27 Aug 2024 19:49:00 -0700
Message-Id: <20240828024901.2582335-28-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240828024901.2582335-1-matthew.brost@intel.com>
References: <20240828024901.2582335-1-matthew.brost@intel.com>
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

Useful to experiment with SVM prefault and how it affects performance.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_module.c | 3 +++
 drivers/gpu/drm/xe/xe_module.h | 1 +
 drivers/gpu/drm/xe/xe_svm.c    | 2 ++
 3 files changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
index 30cfb76344a1..edda9898f3cf 100644
--- a/drivers/gpu/drm/xe/xe_module.c
+++ b/drivers/gpu/drm/xe/xe_module.c
@@ -29,6 +29,9 @@ struct xe_modparam xe_modparam = {
 module_param_named(svm_notifier_size, xe_modparam.svm_notifier_size, uint, 0600);
 MODULE_PARM_DESC(svm_notifier_size, "Set the svm notifier size(in MiB), must be pow2");
 
+module_param_named(svm_prefault, xe_modparam.svm_prefault, bool, 0444);
+MODULE_PARM_DESC(svm_prefault, "SVM prefault CPU pages upon range allocation");
+
 module_param_named_unsafe(force_execlist, xe_modparam.force_execlist, bool, 0444);
 MODULE_PARM_DESC(force_execlist, "Force Execlist submission");
 
diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/xe_module.h
index 5a3bfea8b7b4..c1571cd8f9fe 100644
--- a/drivers/gpu/drm/xe/xe_module.h
+++ b/drivers/gpu/drm/xe/xe_module.h
@@ -12,6 +12,7 @@
 struct xe_modparam {
 	bool force_execlist;
 	bool probe_display;
+	bool svm_prefault;
 	u32 force_vram_bar_size;
 	int guc_log_level;
 	char *guc_firmware_path;
diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 5e2ec25c3cb2..8e80e8704534 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -645,9 +645,11 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 	if (err)
 		return err;
 
+	ctx.prefault = xe_modparam.svm_prefault;
 	r = drm_gpusvm_range_find_or_insert(&vm->svm.gpusvm, fault_addr,
 					    xe_vma_start(vma), xe_vma_end(vma),
 					    &ctx);
+	ctx.prefault = false;
 	if (IS_ERR(r))
 		return PTR_ERR(r);
 
-- 
2.34.1

