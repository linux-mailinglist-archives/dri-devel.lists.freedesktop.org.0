Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C76A61D3F
	for <lists+dri-devel@lfdr.de>; Fri, 14 Mar 2025 21:52:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4592C10E2F7;
	Fri, 14 Mar 2025 20:52:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g5k/CoF7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (unknown [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2471410E266;
 Fri, 14 Mar 2025 20:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741985552; x=1773521552;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=euQ1uz41Dg9KJ2DaehE2ohgTznSqzybbxeicRNvhh8g=;
 b=g5k/CoF7pZS02+j4HTKNSEivpbdaAkdW4fYuEacNBadwid3DTvisJMlm
 IlMsNcalAmGOT646w+yGzth3jiuwN0oT++WKe6kf68LcPLxu7vAGpVhOv
 zaQExfBWpZ9lLopxLZ/16D7KDCs4KwbG4j93k3YQBauj8IS2jtgAOtGmv
 OMv3nyddUZgTOHjIr050x/3CVanjkBhGBSPCZG9BxaOW0KgPgBNk41HY+
 UUzaYfzHl53OTD9k9MTxtQe6lkHcrsnk22F46MnWboPPDJkR7UQ65rAkP
 fqVzPrN1VhpmS0bbAxdGZpuFmiXaOMT9LDDK+2f80BR3jzg0/N6EFc0Ul Q==;
X-CSE-ConnectionGUID: 5dnxziPGQ5+zz0DtNL6Iow==
X-CSE-MsgGUID: 61JA2ClJSOGPGijSPsJDZw==
X-IronPort-AV: E=McAfee;i="6700,10204,11373"; a="43284799"
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="43284799"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2025 13:52:28 -0700
X-CSE-ConnectionGUID: NDEca4VbQ3WLcspaAXUYOw==
X-CSE-MsgGUID: mU7d1/gBS5adoJZnQZlF/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="121578447"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO
 jkrzyszt-mobl2.intranet) ([10.245.246.206])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2025 13:52:25 -0700
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: intel-gfx@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: [PATCH v5 2/3] drm/i915: Fix PXP cleanup missing from probe error
 rewind
Date: Fri, 14 Mar 2025 21:38:34 +0100
Message-ID: <20250314205202.809563-7-janusz.krzysztofik@linux.intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250314205202.809563-5-janusz.krzysztofik@linux.intel.com>
References: <20250314205202.809563-5-janusz.krzysztofik@linux.intel.com>
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

Commit f67986b0119c04 ("drm/i915/pxp: Promote pxp subsystem to top-level
of i915") added PXP initialization to driver probe path, but didn't add a
respective PXP cleanup on probe error.  That lack of cleanup seems
harmless as long as PXP is still unused and idle when a probe failure
occurs and error rewind path is entered, but as soon as PXP starts
consuming device and driver resources keeping them busy, kernel warnings
may be triggered when cleaning up resources provided by memory regions,
GGTT, GEM and/or VMA cache from the probe error rewind and/or module
unload paths because of missing PXP cleanup.  That scenario was observed
on attempts to fail the probe and enter the rewind path on injection of
now ignored error in device registration path.

Fix it.

Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
---
 drivers/gpu/drm/i915/i915_driver.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
index e0dde7c0fa9c5..10d1d4f3c11c4 100644
--- a/drivers/gpu/drm/i915/i915_driver.c
+++ b/drivers/gpu/drm/i915/i915_driver.c
@@ -845,6 +845,7 @@ int i915_driver_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	return 0;
 
 out_cleanup_gem:
+	intel_pxp_fini(i915);
 	i915_gem_suspend(i915);
 	i915_gem_driver_remove(i915);
 	i915_gem_driver_release(i915);
-- 
2.48.1

