Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84578CD6DB7
	for <lists+dri-devel@lfdr.de>; Mon, 22 Dec 2025 18:50:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B37DA10E6FD;
	Mon, 22 Dec 2025 17:50:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QxdtXEl+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5C5210E6FC;
 Mon, 22 Dec 2025 17:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766425823; x=1797961823;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=F2ztYk3EUgybty0BnGsJ9rWPRgorcR7owyAhjrpa/E0=;
 b=QxdtXEl+8XZGTabkeol139fWhU0DaGON6yQeFxxj/hxuNfvTUeqhrCTt
 g/BVO12QuOCYZyc1nGROO+K1qdmy8Ufz2tb8q4gaLV0Ra5/wQMQON5zGj
 Pc2xGgjosZVW1+e5nUOXVCNWOaLwouM3M5vVX5GLj3erNGHUEaEFE2i6e
 rN508X4gMPAgoV+KnwGLRieTrLwNCcVDCe5I9kWQYl5tmqw0TQZucp3Ha
 1+ON2bUGrTTr/fzYF0bdO8oT7k1aw960p4ML+WQoDxytg5r678L9i3Oym
 O9ioDZs7EKI4CnQLpn+ljGeM0OnxmayC6KOOT6Ly18lXDgygyRXUAjU/U A==;
X-CSE-ConnectionGUID: WC9ZdmL2SLyRMmLiEHUe0A==
X-CSE-MsgGUID: X0Np2iWFS7uCtpHiiqgaPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="90943521"
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; d="scan'208";a="90943521"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2025 09:50:23 -0800
X-CSE-ConnectionGUID: 8oOVAvMDQzi3skO56qaRfg==
X-CSE-MsgGUID: cr4wOgxETACoaM2jf+Uubg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; d="scan'208";a="203706039"
Received: from mrbroom-desk1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.246.20.17])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2025 09:50:21 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 1/2] drm/xe/configfs: Fix 'parameter name omitted' errors
Date: Mon, 22 Dec 2025 18:50:05 +0100
Message-ID: <20251222175006.9706-2-michal.wajdeczko@intel.com>
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

On some configs and old compilers we can get following build errors:

  ../drivers/gpu/drm/xe/xe_configfs.h: In function 'xe_configfs_get_ctx_restore_mid_bb':
  ../drivers/gpu/drm/xe/xe_configfs.h:40:76: error: parameter name omitted
   static inline u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev, enum xe_engine_class,
                                                                            ^~~~~~~~~~~~~~~~~~~~
  ../drivers/gpu/drm/xe/xe_configfs.h: In function 'xe_configfs_get_ctx_restore_post_bb':
  ../drivers/gpu/drm/xe/xe_configfs.h:42:77: error: parameter name omitted
   static inline u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev, enum xe_engine_class,
                                                                             ^~~~~~~~~~~~~~~~~~~~
when trying to define our configfs stub functions. Fix that.

Fixes: 7a4756b2fd04 ("drm/xe/lrc: Allow to add user commands mid context switch")
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_configfs.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_configfs.h b/drivers/gpu/drm/xe/xe_configfs.h
index fed57be0b90e..9998ec7c9956 100644
--- a/drivers/gpu/drm/xe/xe_configfs.h
+++ b/drivers/gpu/drm/xe/xe_configfs.h
@@ -37,9 +37,9 @@ static inline bool xe_configfs_primary_gt_allowed(struct pci_dev *pdev) { return
 static inline bool xe_configfs_media_gt_allowed(struct pci_dev *pdev) { return true; }
 static inline u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev) { return U64_MAX; }
 static inline bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev) { return false; }
-static inline u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev, enum xe_engine_class,
+static inline u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev, enum xe_engine_class c,
 						     const u32 **cs) { return 0; }
-static inline u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev, enum xe_engine_class,
+static inline u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev, enum xe_engine_class c,
 						      const u32 **cs) { return 0; }
 static inline unsigned int xe_configfs_get_max_vfs(struct pci_dev *pdev) { return UINT_MAX; }
 #endif
-- 
2.47.1

