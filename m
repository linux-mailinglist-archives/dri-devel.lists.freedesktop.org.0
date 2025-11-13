Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 464C7C58B7B
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 17:28:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D3DD10E8C2;
	Thu, 13 Nov 2025 16:28:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OqwrCDYC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AC4D10E8C1;
 Thu, 13 Nov 2025 16:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763051304; x=1794587304;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3gicyKIAp5+Tdg6fbzRkVNCgC4gW75kbXan2uC1VABk=;
 b=OqwrCDYC3ygRHG2Yg/6xbE0U0S0d2B+grAEnKSMyKzhk6xAktqerUQMd
 wvXAt1sWjG90XA0hvvg1ES7ux+eKhfCxeA8EulGaqrcRU7Q4nEtCf/Veq
 GZo8mpLoBzKrf26h+5HepRc1tkUBmyflIqtu0XnYH53iIb5ciyLk/p5fU
 WkArLVOvGFtIDVyA0Lg1Xnjx3daUkb7saKw0xaap+up3IGwcntA4b6blk
 3uQlSUz4OT7ygCgYdO8EObfufnl35LmBS/29The29K77/r/ZNDIu9efnz
 GFelHJSD2U/VsLxicogQu+2razaNX4qLGD/U3pM23Y6NRib+SGHwF7GkI g==;
X-CSE-ConnectionGUID: zv0fKE4STiu8p6VeFvUOFw==
X-CSE-MsgGUID: CqFYVmXlTj+3HB84USwt5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="69002408"
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; d="scan'208";a="69002408"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 08:28:24 -0800
X-CSE-ConnectionGUID: C/EHdc1NRPKGwQO++diRyw==
X-CSE-MsgGUID: o9z4l7s6QOGbq2peue/4vA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; d="scan'208";a="194699530"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.164])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 08:28:16 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Simon Richter <Simon.Richter@hogyros.de>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org,
 Bjorn Helgaas <bhelgaas@google.com>, David Airlie <airlied@gmail.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 linux-pci@vger.kernel.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Simona Vetter <simona@ffwll.ch>, Tvrtko Ursulin <tursulin@ursulin.net>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH v2 09/11] drm/i915: Remove driver side BAR release before
 resize
Date: Thu, 13 Nov 2025 18:26:26 +0200
Message-Id: <20251113162628.5946-10-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251113162628.5946-1-ilpo.jarvinen@linux.intel.com>
References: <20251113162628.5946-1-ilpo.jarvinen@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

PCI core handles releasing device's resources and their rollback in
case of failure of a BAR resizing operation. Releasing resource prior
to calling pci_resize_resource() prevents PCI core from restoring the
BARs as they were.

Remove driver-side release of BARs from the i915 driver.

Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
 drivers/gpu/drm/i915/gt/intel_region_lmem.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_region_lmem.c b/drivers/gpu/drm/i915/gt/intel_region_lmem.c
index 7699e8fcf5ed..c37a0560ebe0 100644
--- a/drivers/gpu/drm/i915/gt/intel_region_lmem.c
+++ b/drivers/gpu/drm/i915/gt/intel_region_lmem.c
@@ -18,16 +18,6 @@
 #include "gt/intel_gt_regs.h"
 
 #ifdef CONFIG_64BIT
-static void _release_bars(struct pci_dev *pdev)
-{
-	int resno;
-
-	for (resno = PCI_STD_RESOURCES; resno < PCI_STD_RESOURCE_END; resno++) {
-		if (pci_resource_len(pdev, resno))
-			pci_release_resource(pdev, resno);
-	}
-}
-
 static void
 _resize_bar(struct drm_i915_private *i915, int resno, resource_size_t size)
 {
@@ -35,8 +25,6 @@ _resize_bar(struct drm_i915_private *i915, int resno, resource_size_t size)
 	int bar_size = pci_rebar_bytes_to_size(size);
 	int ret;
 
-	_release_bars(pdev);
-
 	ret = pci_resize_resource(pdev, resno, bar_size, 0);
 	if (ret) {
 		drm_info(&i915->drm, "Failed to resize BAR%d to %dM (%pe)\n",
-- 
2.39.5

