Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6668BFC2E5
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 15:36:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 700D710E796;
	Wed, 22 Oct 2025 13:35:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iJ3mV7bu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6558B10E7AA;
 Wed, 22 Oct 2025 13:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761140118; x=1792676118;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rvq8S7Tm5qcOrmVwTnQP2K04nFjvwe8824uK1q80uXo=;
 b=iJ3mV7buOHW7AhkcEaKj6lxG3fDZr8rB7v1KFlJh0E6mNjXJIMO4zg0b
 ZUOVFWsakN+zQvZf+KVJVdR0SSly2IIMMO2dUCzm4ABAltSKuCRqwRSsk
 7aax6UfaA78OAcGK1fixZbGC+YnnN1436N5BSs1XXnLsCC1s2Rv6UsRhm
 uKdj2WYBiz3VLM6IRSJzcyogb1pyfiDVIoI4ti4Um1dti7ttvey4vLnCa
 eB3MafGm7MB+KmDIR2Ijqv1hYWN2jJEpDyB6ac4UwrpJzcn/WMK7++Tuf
 PI/6wjm8eHSK+ok3Prz4QUHCvgKGQqtg+DifnTDOYUvKhS65Rzo/17RIX A==;
X-CSE-ConnectionGUID: 7sdfomgNQ+C1WLrBZTF4YQ==
X-CSE-MsgGUID: Za69ePr9Tzy2xk/OuAZk3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="50862421"
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; d="scan'208";a="50862421"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 06:35:18 -0700
X-CSE-ConnectionGUID: RPKSY7fORVOxMOWhTAvOgA==
X-CSE-MsgGUID: ZvV9E3lTTNCHcTSI6lf9VQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; d="scan'208";a="184275109"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.82])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 06:35:10 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
 =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org,
 David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Simona Vetter <simona@ffwll.ch>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 "Michael J . Ruhl" <mjruhl@habana.ai>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH v3 07/11] drm/xe/vram: Use PCI rebar helpers in
 resize_vram_bar()
Date: Wed, 22 Oct 2025 16:33:27 +0300
Message-Id: <20251022133331.4357-8-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251022133331.4357-1-ilpo.jarvinen@linux.intel.com>
References: <20251022133331.4357-1-ilpo.jarvinen@linux.intel.com>
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

PCI core provides pci_rebar_size_supported() and
pci_rebar_size_to_bytes(), use them in resize_vram_bar() to simplify
code.

Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Acked-by: Christian König <christian.koenig@amd.com>
Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_vram.c | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
index b44ebf50fedb..9ac053bb0b2e 100644
--- a/drivers/gpu/drm/xe/xe_vram.c
+++ b/drivers/gpu/drm/xe/xe_vram.c
@@ -24,8 +24,6 @@
 #include "xe_vram.h"
 #include "xe_vram_types.h"
 
-#define BAR_SIZE_SHIFT 20
-
 static void
 _resize_bar(struct xe_device *xe, int resno, resource_size_t size)
 {
@@ -74,25 +72,22 @@ static void resize_vram_bar(struct xe_device *xe)
 
 	/* set to a specific size? */
 	if (force_vram_bar_size) {
-		u32 bar_size_bit;
-
-		rebar_size = force_vram_bar_size * (resource_size_t)SZ_1M;
+		rebar_size = pci_rebar_bytes_to_size(force_vram_bar_size *
+						     (resource_size_t)SZ_1M);
 
-		bar_size_bit = bar_size_mask & BIT(pci_rebar_bytes_to_size(rebar_size));
-
-		if (!bar_size_bit) {
+		if (!pci_rebar_size_supported(pdev, LMEM_BAR, rebar_size)) {
 			drm_info(&xe->drm,
 				 "Requested size: %lluMiB is not supported by rebar sizes: 0x%x. Leaving default: %lluMiB\n",
-				 (u64)rebar_size >> 20, bar_size_mask, (u64)current_size >> 20);
+				 (u64)pci_rebar_size_to_bytes(rebar_size) >> 20,
+				 bar_size_mask, (u64)current_size >> 20);
 			return;
 		}
 
-		rebar_size = 1ULL << (__fls(bar_size_bit) + BAR_SIZE_SHIFT);
-
+		rebar_size = pci_rebar_size_to_bytes(rebar_size);
 		if (rebar_size == current_size)
 			return;
 	} else {
-		rebar_size = 1ULL << (__fls(bar_size_mask) + BAR_SIZE_SHIFT);
+		rebar_size = pci_rebar_size_to_bytes(__fls(bar_size_mask));
 
 		/* only resize if larger than current */
 		if (rebar_size <= current_size)
-- 
2.39.5

