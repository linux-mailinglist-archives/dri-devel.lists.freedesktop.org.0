Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B57E7B57459
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 11:15:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0736910E35C;
	Mon, 15 Sep 2025 09:15:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QLgWJkd1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51FD110E36D;
 Mon, 15 Sep 2025 09:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757927734; x=1789463734;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IA9+p8njPWcr/AaFFa7mSUDpekCTg6J2U5oEKAw5Oew=;
 b=QLgWJkd1MLIf1vQ6AjIRooDTBWWj7o4B+dq2U7cKS3C/E4w7gwkotBvM
 D4GbwLWHS+ZbclpK3S9esDizG2UabtVeYUlbqpmGwnm7iH4KU8xgAV0uu
 oeeSX/w4TzLAYO9Hij2TljCfE8njWYgJAWYIAGDEh1VM0+Wt6PZaIL0xF
 vS1rU4EerUshJuuxQadApbPDBJZlzdb8V7Fw5B+1cue+//bsI34xPb2dN
 W0ZYic1i4ZoF/xVrAO5znluiAId8wUZTCs7xTicEjvPKwNNA5Jn9jq1zM
 K6GJ/iFzEmAUZU/wh6gXMgU0NgBmh5Rg77DpfSuFMHhCotIfc7O8vmr2V w==;
X-CSE-ConnectionGUID: p04I5MmARWWWe8vgMJHjXQ==
X-CSE-MsgGUID: NmJH1Og4RsOngmlrTESnOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11553"; a="59870398"
X-IronPort-AV: E=Sophos;i="6.18,265,1751266800"; d="scan'208";a="59870398"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2025 02:15:34 -0700
X-CSE-ConnectionGUID: GF6ReKu6Q1KKqSpASPKvrQ==
X-CSE-MsgGUID: BiFXdMNEQxC1E0hLTTf4lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,265,1751266800"; d="scan'208";a="178917926"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.39])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2025 02:15:26 -0700
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
 ?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 "Michael J . Ruhl" <mjruhl@habana.ai>, linux-kernel@vger.kernel.org
Cc: linux-doc@vger.kernel.org,
 =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH v2 06/11] drm/i915/gt: Use pci_rebar_size_supported()
Date: Mon, 15 Sep 2025 12:13:53 +0300
Message-Id: <20250915091358.9203-7-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250915091358.9203-1-ilpo.jarvinen@linux.intel.com>
References: <20250915091358.9203-1-ilpo.jarvinen@linux.intel.com>
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
Acked-by: Christian König <christian.koenig@amd.com>
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

