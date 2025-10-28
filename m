Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB8ADC16355
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 18:37:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F39710E63B;
	Tue, 28 Oct 2025 17:37:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jEDnLZpM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 218CC10E639;
 Tue, 28 Oct 2025 17:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761673059; x=1793209059;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=p0wHURDhEqxjdHQHtDybrhCJVt2NJrZ5/+N6qg46xHM=;
 b=jEDnLZpMAA9V7AKokdNYQuOS/qnD9RHMHjpKuiXtpkOJ50f6tuYNyr7w
 hsMk1tpiQsQogi9jJQ14k49AYtsdGywB5W+06lCVqIcZoV7M1qg8JuvRy
 WCKIAcHzxTFG91wS/5zcSjbc4iCqfK4Vc0/QrSn3DKrdE2NozTiY08oZ7
 RH3ZbBxK1y953HKeuGt5vfrbMPR1QwxzeW8JuMGcDEAMUSIn6wuo10+gV
 9kw+ptAc5LgPd/PvUdPKZ05+ggKUK8tCrq3Vmf/+sD3mXvvnEnWzqivWq
 WRC73TKwxRdRj2ut8ycOO0zMm1KVN5W1kK1m0y3Kqu62EvER6YMMYOtya w==;
X-CSE-ConnectionGUID: LISu3geLQnGZ9skIkKoSUg==
X-CSE-MsgGUID: hqRoGMlgTwSBnm0gzZDbQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63485044"
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="63485044"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 10:37:38 -0700
X-CSE-ConnectionGUID: aXywd5SLRtOwizDbGtwfqQ==
X-CSE-MsgGUID: eG48uwFjQWGOxO2mxr2acw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="185746898"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.182])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 10:37:30 -0700
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
Subject: [PATCH 7/9] drm/i915: Remove driver side BAR release before resize
Date: Tue, 28 Oct 2025 19:35:49 +0200
Message-Id: <20251028173551.22578-8-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251028173551.22578-1-ilpo.jarvinen@linux.intel.com>
References: <20251028173551.22578-1-ilpo.jarvinen@linux.intel.com>
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
index 51bb27e10a4f..ca3de61451a3 100644
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
 	ret = pci_resize_resource(pdev, resno, bar_size);
 	if (ret) {
 		drm_info(&i915->drm, "Failed to resize BAR%d to %dM (%pe)\n",
-- 
2.39.5

