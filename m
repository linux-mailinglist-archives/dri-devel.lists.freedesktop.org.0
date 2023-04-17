Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7720D6E3FAE
	for <lists+dri-devel@lfdr.de>; Mon, 17 Apr 2023 08:23:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BCB110E26F;
	Mon, 17 Apr 2023 06:23:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EED710E122;
 Mon, 17 Apr 2023 06:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681712630; x=1713248630;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SDHuEPcEXdLDsVw9K+vj1s8Qu77K7boBIbICDO11yRY=;
 b=JfSRMXTDyVkxJCB0xpZbMv9A20vVj2j168GJ/IzS8yrkw3Q1kn6pMr5g
 wInhRyTGJ5X1m7YnbLbkRh3pCSkVLKUdj3CRSOEVaf/sniT5y9wtkFrtL
 +XiaulEQkYG0gC1V3pE2Ilp9vwQq1lFjhgVeaCw3fSE7MHdb2/T8phgdB
 FsXiwISMpk+7i22KUhPLLjQYSVaZ6f5CXvcTb5V4WrkZX08AzAqjbYYEp
 qfgbTUzGx7TWaS0lARgjI8QW4hORRNkw82M7LbudmaQBgacwmLTCBNmD2
 UCCv2966syfCJA3YOD2JnVR4FJq6feR7KUh8dUrkSebIovznRDaoqCedz Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10682"; a="347552374"
X-IronPort-AV: E=Sophos;i="5.99,203,1677571200"; d="scan'208";a="347552374"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2023 23:23:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10682"; a="721007603"
X-IronPort-AV: E=Sophos;i="5.99,203,1677571200"; d="scan'208";a="721007603"
Received: from fyang16-desk.jf.intel.com ([10.24.96.243])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2023 23:23:47 -0700
From: fei.yang@intel.com
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 1/8] drm/i915/mtl: Set has_llc=0
Date: Sun, 16 Apr 2023 23:24:56 -0700
Message-Id: <20230417062503.1884465-2-fei.yang@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230417062503.1884465-1-fei.yang@intel.com>
References: <20230417062503.1884465-1-fei.yang@intel.com>
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
Cc: Fei Yang <fei.yang@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Fei Yang <fei.yang@intel.com>

On MTL, GT is no longer allocated on LLC, set has_llc=0.

Signed-off-by: Fei Yang <fei.yang@intel.com>
---
 drivers/gpu/drm/i915/i915_pci.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
index cddb6e197972..025d32c0b161 100644
--- a/drivers/gpu/drm/i915/i915_pci.c
+++ b/drivers/gpu/drm/i915/i915_pci.c
@@ -1146,6 +1146,7 @@ static const struct intel_device_info mtl_info = {
 	.has_flat_ccs = 0,
 	.has_gmd_id = 1,
 	.has_guc_deprivilege = 1,
+	.has_llc = 0,
 	.has_mslice_steering = 0,
 	.has_snoop = 1,
 	.__runtime.memory_regions = REGION_SMEM | REGION_STOLEN_LMEM,
-- 
2.25.1

