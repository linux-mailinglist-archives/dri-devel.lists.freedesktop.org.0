Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA236DD0CE
	for <lists+dri-devel@lfdr.de>; Tue, 11 Apr 2023 06:25:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5050910E483;
	Tue, 11 Apr 2023 04:24:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DC5210E480;
 Tue, 11 Apr 2023 04:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681187095; x=1712723095;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SDHuEPcEXdLDsVw9K+vj1s8Qu77K7boBIbICDO11yRY=;
 b=NfOI+FDJ3RVBa8oUcXBCIRf0KfVdn7Z4GKaHdO3PLnen/ZCTC75Kom+0
 vEhXerBCtQ8ZdQU3CP8V/6uYzx+HP+4Hx6b4vYOtgn3HliwXXNvmSsAKz
 61RaM6u81+bmJ/SrnzyuzI+NqDuEEMG4Y9ivPfKSyvgyjwg6JD/DF9HgE
 CJmKfoQB4gbBN4V2xAPmvskMPZXyTOUt94L1krcKe+/NyXD94zCMl6KcP
 e8zlxWxJTyMdagtCEeaN3uR4qsq7IdPXWSfRJXkruMHyo4hJ3MUem+g3k
 1dsbt0UdjiFXOXBDvgddAd5KI/OFJppqXitXlXgJ0QUT2t/MnYADPIsa5 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="343524155"
X-IronPort-AV: E=Sophos;i="5.98,335,1673942400"; d="scan'208";a="343524155"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2023 21:24:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="777763900"
X-IronPort-AV: E=Sophos;i="5.98,335,1673942400"; d="scan'208";a="777763900"
Received: from fyang16-desk.jf.intel.com ([10.24.96.243])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2023 21:24:53 -0700
From: fei.yang@intel.com
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 1/9] drm/i915/mtl: Set has_llc=0
Date: Mon, 10 Apr 2023 21:26:05 -0700
Message-Id: <20230411042613.3178711-2-fei.yang@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230411042613.3178711-1-fei.yang@intel.com>
References: <20230411042613.3178711-1-fei.yang@intel.com>
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

