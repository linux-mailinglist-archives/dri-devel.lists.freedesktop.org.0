Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E031ACD6DBA
	for <lists+dri-devel@lfdr.de>; Mon, 22 Dec 2025 18:50:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D750D10E700;
	Mon, 22 Dec 2025 17:50:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C0MMT+dh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55D0810E6F9;
 Mon, 22 Dec 2025 17:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766425827; x=1797961827;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GWWAnqN0uGYavfxwwa55LC2DzlmhXspgcWDn/lAsiUI=;
 b=C0MMT+dhYiOhrdjGca5cyELsv8/iT04YWGzboqSmeK/wCkFELJLOCBMp
 JruWqcavdMkuc1VrwjPz+fsFRDh8ShoRO1kAoiG0V8MGLaE6mYaJM1FMR
 b5GfbKZRTVHxJcMDEVnfh2UJnLU9ynoorK27Hsoe3fEjstOQTvEbOD7MV
 /G/Du6mKL6p2mZ+kauRkBV6nOdkAaIiet/DDP7qBs1HswSLrpkwNnpQw/
 Q7P+4jf1yRo1KI8sDIwpvK947A2iQPzkPYgSg+qWsIFH2Y6djOB05dLmF
 ucDDhK08hgQlIxR5NGdme/vw0gPOk5FRjUXl2g0kjbd6BJ7HbIQrC9L3Z A==;
X-CSE-ConnectionGUID: bIf6CyBjQSGn8Togv2MwKw==
X-CSE-MsgGUID: uw6i80oESGGRSNG29ed4iA==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="90943537"
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; d="scan'208";a="90943537"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2025 09:50:27 -0800
X-CSE-ConnectionGUID: A0qqC2P7QXWum6ovJMZqAQ==
X-CSE-MsgGUID: vwjzHdtQSIeLyAU7NKYwew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; d="scan'208";a="203706051"
Received: from mrbroom-desk1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.246.20.17])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2025 09:50:23 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 kernel test robot <lkp@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>, Riana Tauro <riana.tauro@intel.com>
Subject: [PATCH 2/2] drm/xe/configfs: Fix 'undefined reference to
 xe_configfs_...' errors
Date: Mon, 22 Dec 2025 18:50:06 +0100
Message-ID: <20251222175006.9706-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251222175006.9706-1-michal.wajdeczko@intel.com>
References: <20251222175006.9706-1-michal.wajdeczko@intel.com>
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

On configs where Xe is built-in (DRM_XE=y) but configfs is defined
as a module (CONFIGFS=m), we were not enabling our configfs stubs,
which might lead to the following build errors:

   powerpc64-linux-ld: drivers/gpu/drm/xe/xe_guc.o: in function `xe_guc_init_post_hwconfig':
   xe_guc.c:(.text+0x2f08): undefined reference to `xe_configfs_get_psmi_enabled'
   powerpc64-linux-ld: drivers/gpu/drm/xe/xe_hw_engine.o: in function `xe_hw_engines_init_early':
   xe_hw_engine.c:(.text+0xedc): undefined reference to `xe_configfs_get_engines_allowed'
   powerpc64-linux-ld: drivers/gpu/drm/xe/xe_lrc.o: in function `setup_configfs_post_ctx_restore_bb':
   xe_lrc.c:(.text+0xb30): undefined reference to `xe_configfs_get_ctx_restore_post_bb'
   powerpc64-linux-ld: drivers/gpu/drm/xe/xe_lrc.o: in function `setup_configfs_mid_ctx_restore_bb':
   xe_lrc.c:(.text+0xbc0): undefined reference to `xe_configfs_get_ctx_restore_mid_bb'
   powerpc64-linux-ld: drivers/gpu/drm/xe/xe_lrc.o: in function `xe_lrc_init':
   xe_lrc.c:(.text+0x32fc): undefined reference to `xe_configfs_get_ctx_restore_mid_bb'
   powerpc64-linux-ld: drivers/gpu/drm/xe/xe_module.o:(.data.rel.ro+0x10): undefined reference to `xe_configfs_init'
   powerpc64-linux-ld: drivers/gpu/drm/xe/xe_module.o:(.data.rel.ro+0x18): undefined reference to `xe_configfs_exit'
   powerpc64-linux-ld: drivers/gpu/drm/xe/xe_pci.o: in function `xe_pci_probe':
   xe_pci.c:(.text+0x1514): undefined reference to `xe_configfs_check_device'
   powerpc64-linux-ld: drivers/gpu/drm/xe/xe_psmi.o: in function `xe_psmi_debugfs_register':
   xe_psmi.c:(.text+0x508): undefined reference to `xe_configfs_get_psmi_enabled'
   powerpc64-linux-ld: drivers/gpu/drm/xe/xe_psmi.o: in function `xe_psmi_init':
   xe_psmi.c:(.text+0x5c4): undefined reference to `xe_configfs_get_psmi_enabled'
   powerpc64-linux-ld: drivers/gpu/drm/xe/xe_rtp.o: in function `xe_rtp_match_psmi_enabled':
   xe_rtp.c:(.text+0xba0): undefined reference to `xe_configfs_get_psmi_enabled'
   powerpc64-linux-ld: drivers/gpu/drm/xe/xe_survivability_mode.o: in function `xe_survivability_mode_is_requested':
   xe_survivability_mode.c:(.text+0x434): undefined reference to `xe_configfs_get_survivability_mode'
   powerpc64-linux-ld: drivers/gpu/drm/xe/xe_sriov_pf.o: in function `xe_sriov_pf_readiness':
   xe_sriov_pf.c:(.text+0x2a0): undefined reference to `xe_configfs_get_max_vfs'

Fix that by using IS_REACHABLE check instead of IS_ENABLED when
deciding whether to stub variant or not.

Fixes: 16280ded45fb ("drm/xe: Add configfs to enable survivability mode")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202512190407.CcUFXX2F-lkp@intel.com/
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/xe_configfs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_configfs.h b/drivers/gpu/drm/xe/xe_configfs.h
index 9998ec7c9956..ab75485b08b6 100644
--- a/drivers/gpu/drm/xe/xe_configfs.h
+++ b/drivers/gpu/drm/xe/xe_configfs.h
@@ -12,7 +12,7 @@
 
 struct pci_dev;
 
-#if IS_ENABLED(CONFIG_CONFIGFS_FS)
+#if IS_REACHABLE(CONFIG_CONFIGFS_FS)
 int xe_configfs_init(void);
 void xe_configfs_exit(void);
 void xe_configfs_check_device(struct pci_dev *pdev);
-- 
2.47.1

