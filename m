Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A2FDC5953F
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 19:02:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F02A10E914;
	Thu, 13 Nov 2025 18:02:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PR1/2e/6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8FFA10E909;
 Thu, 13 Nov 2025 18:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763056950; x=1794592950;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tU/J1tX3a72T+YWqA/boOC5A3Zuht7ZcD75sw3KGowE=;
 b=PR1/2e/6bxldZFmbhUikOdvFRHJ1oYN8o11gYOixeAGPB0Ay5zDejcil
 4PiCpKUFOCdo8U2uWb1CDIyypqTqipofvB1ga5hiTP2g0ZXk+kwonnO4W
 IcnRApl5fhEXFJGkoCajMpp+hGTdU9bPnrH+kM44nxBux2qfswDBo2Zd0
 Bsa75dojNrXEJB9ZICFXOrkEx6V77w8ui1bkQNn3C6tD8L+SvgV3qO+hQ
 x7dzwGD57AhfJwSfYq1iWjeFqa6uod+h6+j4FNOmkxbqthUevE9dmLm1g
 +qUGFLtCLf22JNVL+MUF5/h3rCRpRvPfu3T8NcU60YnwH7SOsz+FaciC3 Q==;
X-CSE-ConnectionGUID: 5MpopdOLTQ2reZUleZ0VtA==
X-CSE-MsgGUID: rf4eWc+HT/qGI5ubRMEzQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="75827007"
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; d="scan'208";a="75827007"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 10:02:30 -0800
X-CSE-ConnectionGUID: 3gCQltuSQIWFjZjk/WOJOg==
X-CSE-MsgGUID: 8fBEWK1RT2ucYsWBKxt8SQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; d="scan'208";a="188823131"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.164])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 10:02:22 -0800
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
Subject: [PATCH v4 06/11] drm/i915/gt: Use pci_rebar_size_supported()
Date: Thu, 13 Nov 2025 20:00:48 +0200
Message-Id: <20251113180053.27944-7-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251113180053.27944-1-ilpo.jarvinen@linux.intel.com>
References: <20251113180053.27944-1-ilpo.jarvinen@linux.intel.com>
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

PCI core provides pci_rebar_size_supported() that helps in checking if an
encoded BAR Size is supported for the BAR or not. Use it in
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
index c37a0560ebe0..15e83ce00eff 100644
--- a/drivers/gpu/drm/i915/gt/intel_region_lmem.c
+++ b/drivers/gpu/drm/i915/gt/intel_region_lmem.c
@@ -49,16 +49,12 @@ static void i915_resize_lmem_bar(struct drm_i915_private *i915, resource_size_t
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

