Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B6676082BC
	for <lists+dri-devel@lfdr.de>; Sat, 22 Oct 2022 02:09:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B43510E497;
	Sat, 22 Oct 2022 00:08:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1929410E298;
 Sat, 22 Oct 2022 00:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666397269; x=1697933269;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kb6QBtYgghQMOg9kLkXFzqq8DbkGx7E3SBhDT5OFy0c=;
 b=h9RXSKbImT+IXfX7Hrr8dTlLDLlXLYw+Q4BwT/VkiFCKUzr0BL/Vq5Yz
 yp5eRatkpQ6ahg+FRdXzOK2WLnW0BGmTvVyeiF2gJE5XNtQ4w2DyglF53
 7cxfTeCoYeRCgV9u0wpvIcJUXDmHPwzkq9YA8fS2ypu9yDHyBy4kAtibO
 FHegWSPDtTZZ6uCxtNEqcgfOCzUd6yJYW1P86dLNcbjd3jlds4vqn4ElI
 dNFY2Os7zhbOFJB+Pj4/OFc+kUqiMXhBRSXL9bP1Eb6j2ji6Hq8fr3G68
 DYlHNbHM91fSjJkA0VN9cNxAJA64gDBIwNAprvSVrpm0z8AxE7azirsbz A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10507"; a="371354927"
X-IronPort-AV: E=Sophos;i="5.95,203,1661842800"; d="scan'208";a="371354927"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2022 17:07:48 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10507"; a="693917238"
X-IronPort-AV: E=Sophos;i="5.95,203,1661842800"; d="scan'208";a="693917238"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2022 17:07:48 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 4/7] drm/i915/guc: Add GuC deprivilege feature to MTL
Date: Fri, 21 Oct 2022 17:10:05 -0700
Message-Id: <20221022001008.2340224-5-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221022001008.2340224-1-daniele.ceraolospurio@intel.com>
References: <20221022001008.2340224-1-daniele.ceraolospurio@intel.com>
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
Cc: Stuart Summers <stuart.summers@intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>, dri-devel@lists.freedesktop.org,
 Radhakrishna Sripada <radhakrishna.sripada@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Stuart Summers <stuart.summers@intel.com>

MTL supports GuC deprivilege. Add the feature flag to this platform.

Signed-off-by: Stuart Summers <stuart.summers@intel.com>
Cc: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
Cc: John Harrison <john.c.harrison@intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/i915_pci.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
index 496df0f547f4..05645984dd05 100644
--- a/drivers/gpu/drm/i915/i915_pci.c
+++ b/drivers/gpu/drm/i915/i915_pci.c
@@ -1143,6 +1143,7 @@ static const struct intel_device_info mtl_info = {
 	.extra_gt_list = xelpmp_extra_gt,
 	.has_flat_ccs = 0,
 	.has_gmd_id = 1,
+	.has_guc_deprivilege = 1,
 	.has_mslice_steering = 0,
 	.has_snoop = 1,
 	.__runtime.memory_regions = REGION_SMEM | REGION_STOLEN_LMEM,
-- 
2.37.3

