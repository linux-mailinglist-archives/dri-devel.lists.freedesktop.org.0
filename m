Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC38700FCE
	for <lists+dri-devel@lfdr.de>; Fri, 12 May 2023 22:37:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 227E510E2B5;
	Fri, 12 May 2023 20:37:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF1FE10E051;
 Fri, 12 May 2023 20:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683923865; x=1715459865;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=5/MaZSgJAiT3p7GSdAVXvj97prsUNp4udMgt7GN8OUU=;
 b=XaLGrrLegjwgX1n0FzNJ69PoWT2M32nNqtXISKj7BSGNBThsAzX2XslV
 fPMhlfYI+FVe2tbD/gbP4L7qNiu4U97aU5POtV3Rt8A/s8EjCgAqtcnF5
 Nrd9VIYcAlbQS06Mq6hMBBBSNfj6dnF2Ii4uF8d0oBBqHuNbSMyxnBays
 PfFkPpfKP9WkxrC5ZBLWR71/qlKYSBvEe9cY+jVqOUFooz6sC0egjRzwY
 UI6XML/n4/PUL88lH46E62o5f+ics0bZPkZm/tqZDODRoJtbde4qlkXdE
 RvRc0Ep53pl1a7LvH43etgkssobPE1C9B5Z9K80yG7TuTyynUfqxyRahz A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="353134699"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; d="scan'208";a="353134699"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2023 13:37:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="946749740"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; d="scan'208";a="946749740"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2023 13:37:40 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2] drm/i915/hwmon: Silence UBSAN uninitialized bool variable
 warning
Date: Fri, 12 May 2023 13:37:35 -0700
Message-Id: <20230512203735.2635237-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.38.0
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
Cc: Andi Shyti <andi.shyti@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Loading i915 on UBSAN enabled kernels (CONFIG_UBSAN/CONFIG_UBSAN_BOOL)
causes the following warning:

  UBSAN: invalid-load in drivers/gpu/drm/i915/gt/uc/intel_uc.c:558:2
  load of value 255 is not a valid value for type '_Bool'
  Call Trace:
   dump_stack_lvl+0x57/0x7d
   ubsan_epilogue+0x5/0x40
   __ubsan_handle_load_invalid_value.cold+0x43/0x48
   __uc_init_hw+0x76a/0x903 [i915]
   ...
   i915_driver_probe+0xfb1/0x1eb0 [i915]
   i915_pci_probe+0xbe/0x2d0 [i915]

The warning happens because during probe i915_hwmon is still not available
which results in the output boolean variable *old remaining
uninitialized. Silence the warning by initializing the variable to an
arbitrary value.

v2: Move variable initialization to the declaration (Andi)

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_uc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
index 1381943b8973d..c8b9cbb7ba3a9 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
@@ -465,7 +465,7 @@ static int __uc_init_hw(struct intel_uc *uc)
 	struct intel_guc *guc = &uc->guc;
 	struct intel_huc *huc = &uc->huc;
 	int ret, attempts;
-	bool pl1en;
+	bool pl1en = false;
 
 	GEM_BUG_ON(!intel_uc_supports_guc(uc));
 	GEM_BUG_ON(!intel_uc_wants_guc(uc));
-- 
2.38.0

