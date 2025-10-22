Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C920BFC306
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 15:36:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A99E10E7AC;
	Wed, 22 Oct 2025 13:36:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nh6nOirL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A40110E79C;
 Wed, 22 Oct 2025 13:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761140103; x=1792676103;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aCwA/8AZ/Dd5HOdjKbrsatAkfmOoCAgd0CW7fUArQ8g=;
 b=nh6nOirLGLcZ8awRVuIsM0A2FBjrIk7hWVCXoI4vt7N+Q4nWjO9E9r44
 d79+dEo6nxNW7WtZPrp31c4JXIuFBl/hmxxuPikJhJAexFEV79KWe7UK7
 OQWTdHWxS1tV5CUHtNNnXArpaCAQZjkarwfoUoVIiby2UZ0/m/8TLzH+U
 GEOSF1/eDg0+2t+5kA2g3gbHr3DU3mBxSo5DYXAbODsTfoNgYnIcQtiQd
 tT17R4ZDMLzGIQSd2EXKsL68JIrMZ59bC8a+LwNWhJ0bFVkKtnkRnkMr4
 rKopIsoV6TABHLwYQRUgcs8sHJzr9Vg+QFWV810QOs7OxOJ9OwCCYXK// A==;
X-CSE-ConnectionGUID: T23rId3HSp2x+WN0HUNgeA==
X-CSE-MsgGUID: f6LfEStDRgysntWeJOKayA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63327778"
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; d="scan'208";a="63327778"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 06:35:03 -0700
X-CSE-ConnectionGUID: bGduhRuoR0qJ2P5vHudHmQ==
X-CSE-MsgGUID: sE6i9QM9Q6C1+bj0uMZWxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; d="scan'208";a="221065052"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.82])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 06:34:56 -0700
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
 Andi Shyti <andi.shyti@linux.intel.com>, linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH v3 06/11] drm/i915/gt: Use pci_rebar_size_supported()
Date: Wed, 22 Oct 2025 16:33:26 +0300
Message-Id: <20251022133331.4357-7-ilpo.jarvinen@linux.intel.com>
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

PCI core provides pci_rebar_size_supported() that helps in checking if
a BAR Size is supported for the BAR or not. Use it in
i915_resize_lmem_bar() to simplify code.

Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Reviewed-by: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
Acked-by: Christian König <christian.koenig@amd.com>
Acked-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_region_lmem.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_region_lmem.c b/drivers/gpu/drm/i915/gt/intel_region_lmem.c
index 51bb27e10a4f..69c65fc8a72d 100644
--- a/drivers/gpu/drm/i915/gt/intel_region_lmem.c
+++ b/drivers/gpu/drm/i915/gt/intel_region_lmem.c
@@ -61,16 +61,12 @@ static void i915_resize_lmem_bar(struct drm_i915_private *i915, resource_size_t
 	current_size = roundup_pow_of_two(pci_resource_len(pdev, GEN12_LMEM_BAR));
 
 	if (i915->params.lmem_bar_size) {
-		u32 bar_sizes;
-
-		rebar_size = i915->params.lmem_bar_size *
-			(resource_size_t)SZ_1M;
-		bar_sizes = pci_rebar_get_possible_sizes(pdev, GEN12_LMEM_BAR);
-
+		rebar_size = i915->params.lmem_bar_size * (resource_size_t)SZ_1M;
 		if (rebar_size == current_size)
 			return;
 
-		if (!(bar_sizes & BIT(pci_rebar_bytes_to_size(rebar_size))) ||
+		if (!pci_rebar_size_supported(pdev, GEN12_LMEM_BAR,
+					      pci_rebar_bytes_to_size(rebar_size)) ||
 		    rebar_size >= roundup_pow_of_two(lmem_size)) {
 			rebar_size = lmem_size;
 
-- 
2.39.5

