Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16641792F15
	for <lists+dri-devel@lfdr.de>; Tue,  5 Sep 2023 21:38:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5113910E4B8;
	Tue,  5 Sep 2023 19:38:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38AF310E1AE;
 Tue,  5 Sep 2023 19:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693942729; x=1725478729;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=UhvgFEm6UyiK4bEr3ZPxGzwMC7S3fNzkTt2gStFiObU=;
 b=kehWQSlDaSPPIdlBbiUVfgMmKcocYZZ85v7ZQw0ercsQaG6z6rsiEe0b
 iCAMOWW8ve6AiOxx/gIRC4hUHbQnvzXhhL1i5rQEqQfjvJD3yMAQjZjCL
 fdX885Vm3SbqbGbrhCOhE/HnIULgSlD6EDArHqUeyUEZz+nWjKGgmrxmC
 3P6s5LVJYfHz3p0qIzPk5yMmkRNghmxPxL6CC8MuJI/QRcUltkM1+30UF
 f4m1wBaEC7MSdsLq4qX2BArHjTRPRsSdmSzPK0BMjguZ9brEsajKKXjA+
 OFbb5hCu4kjKkDkdiL/Qd56FhOu4sbfyBMIsPy5wM+K6HiuSYyXhQHHsO A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="375783683"
X-IronPort-AV: E=Sophos;i="6.02,229,1688454000"; d="scan'208";a="375783683"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2023 12:38:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="776305620"
X-IronPort-AV: E=Sophos;i="6.02,229,1688454000"; d="scan'208";a="776305620"
Received: from invictus.jf.intel.com ([10.165.21.201])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2023 12:38:48 -0700
From: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915/mtl: Drop force_probe requirement
Date: Tue,  5 Sep 2023 12:36:24 -0700
Message-Id: <20230905193624.525020-1-radhakrishna.sripada@intel.com>
X-Mailer: git-send-email 2.34.1
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Radhakrishna Sripada <radhakrishna.sripada@intel.com>,
 dri-devel@lists.freedesktop.org, rodrigo.vivi@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Meteorlake has been very usable for a while now, all of uapi changes
related to fundamental platform usage have been finalized and all
required firmware blobs are available. Recent CI results have also
been healthy, so we're ready to drop the force_probe requirement and
enable the platform by default.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Signed-off-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
---
 drivers/gpu/drm/i915/i915_pci.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
index df7c261410f7..fe748906c06f 100644
--- a/drivers/gpu/drm/i915/i915_pci.c
+++ b/drivers/gpu/drm/i915/i915_pci.c
@@ -836,7 +836,6 @@ static const struct intel_device_info mtl_info = {
 	.has_pxp = 1,
 	.memory_regions = REGION_SMEM | REGION_STOLEN_LMEM,
 	.platform_engine_mask = BIT(RCS0) | BIT(BCS0) | BIT(CCS0),
-	.require_force_probe = 1,
 	MTL_CACHELEVEL,
 };
 
-- 
2.34.1

