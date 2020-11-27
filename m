Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3F2D2C6560
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 13:13:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A4C56ED1B;
	Fri, 27 Nov 2020 12:11:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C3D66ED1A;
 Fri, 27 Nov 2020 12:11:45 +0000 (UTC)
IronPort-SDR: iO9K7P0VhsYmfWZuQgkq4qweqFaPIA11yJ3I/sFuBy/KqVDhFeexQc2bQAyMy99WM9MCGktX2Q
 ckgkbrdzpovQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9817"; a="257092938"
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="257092938"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:11:45 -0800
IronPort-SDR: Y9tn7tk3blS+fjhY4PCHLt8YiNQgylZ0En+LPLHNjgWtFVI7t0uvmT8VK6F1m1S6jVthQbVjA1
 tqeTSVx6rcXQ==
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="548029872"
Received: from mjgleeso-mobl.ger.corp.intel.com (HELO
 mwauld-desk1.ger.corp.intel.com) ([10.251.85.2])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:11:43 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [RFC PATCH 132/162] drm/i915/dg1: Add lmem_size modparam
Date: Fri, 27 Nov 2020 12:06:48 +0000
Message-Id: <20201127120718.454037-133-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201127120718.454037-1-matthew.auld@intel.com>
References: <20201127120718.454037-1-matthew.auld@intel.com>
MIME-Version: 1.0
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
Cc: CQ Tang <cq.tang@intel.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: CQ Tang <cq.tang@intel.com>

lmem_size is used to limit the amount of lmem_size. Default is to
use hardware available lmem size, when setting this modpraram
which is in MB unit.

Signed-off-by: CQ Tang <cq.tang@intel.com>
---
 drivers/gpu/drm/i915/i915_params.c       | 3 +++
 drivers/gpu/drm/i915/i915_params.h       | 1 +
 drivers/gpu/drm/i915/intel_region_lmem.c | 4 ++++
 3 files changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/i915/i915_params.c b/drivers/gpu/drm/i915/i915_params.c
index bb1ebb6ece95..264de32f3d6a 100644
--- a/drivers/gpu/drm/i915/i915_params.c
+++ b/drivers/gpu/drm/i915/i915_params.c
@@ -200,6 +200,9 @@ i915_param_named_unsafe(fake_lmem_start, ulong, 0400,
 i915_param_named_unsafe(enable_eviction, bool, 0600,
 	"Enable memcpy based eviction which does not rely on DMA resv refactoring)");
 
+i915_param_named_unsafe(lmem_size, uint, 0400,
+	"Change lmem size for each region. (default: 0, all memory)");
+
 static __always_inline void _print_param(struct drm_printer *p,
 					 const char *name,
 					 const char *type,
diff --git a/drivers/gpu/drm/i915/i915_params.h b/drivers/gpu/drm/i915/i915_params.h
index 87df407d9afb..be6979e7feda 100644
--- a/drivers/gpu/drm/i915/i915_params.h
+++ b/drivers/gpu/drm/i915/i915_params.h
@@ -71,6 +71,7 @@ struct drm_printer;
 	param(int, enable_dpcd_backlight, -1, 0600) \
 	param(char *, force_probe, CONFIG_DRM_I915_FORCE_PROBE, 0400) \
 	param(unsigned long, fake_lmem_start, 0, 0400) \
+	param(unsigned int, lmem_size, 0, 0400) \
 	/* leave bools at the end to not create holes */ \
 	param(bool, enable_eviction, true, 0600) \
 	param(bool, enable_hangcheck, true, 0600) \
diff --git a/drivers/gpu/drm/i915/intel_region_lmem.c b/drivers/gpu/drm/i915/intel_region_lmem.c
index eafef7034680..1cdb6354b968 100644
--- a/drivers/gpu/drm/i915/intel_region_lmem.c
+++ b/drivers/gpu/drm/i915/intel_region_lmem.c
@@ -196,6 +196,10 @@ setup_lmem(struct drm_i915_private *dev_priv)
 
 	io_start = pci_resource_start(pdev, 2);
 
+	if (dev_priv->params.lmem_size > 0)
+		lmem_size = min_t(resource_size_t, lmem_size,
+				  mul_u32_u32(dev_priv->params.lmem_size, SZ_1M));
+
 	mem = intel_memory_region_create(dev_priv,
 					 0,
 					 lmem_size,
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
