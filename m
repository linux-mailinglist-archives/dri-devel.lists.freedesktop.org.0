Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BD566E8321
	for <lists+dri-devel@lfdr.de>; Wed, 19 Apr 2023 23:11:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DA9A10EB1A;
	Wed, 19 Apr 2023 21:11:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C036710E23D;
 Wed, 19 Apr 2023 21:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681938668; x=1713474668;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=s4klNEl6ZXgcMz5lvaEb4iG5+b/X216MHmBJ62w7Yas=;
 b=QIyBXcAMmCiWR/hDaYaJSr+KoAh/NPmu/U7sXZeYfVN2vdo+39PLERhq
 GFNN7uT5GNbTE7df7rtDeY22oAc1m6PSa/4XpyB/UdF/8woQ1jxYHJP1C
 HVz22jvyPzY+4JrJR0h5k+WeqhGFc67fGSpaShEHVfDwvPlY+YRrZS7pr
 Q8c9hyg+623zp3C7WSRReG8Ptzl5rBYltVl91pakb98freVnrCRvGf5LG
 NnPrf9dbTiv3vEDl6T4yGk4CthqWLIJ0jYYzYuHD85sSj/EmugpZ8XdI3
 DraVzZ0aweNEu2JYJiZE98ulPmVOXIOsZlyXDMK7ZzOKX9E21gvndaBM+ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="343042855"
X-IronPort-AV: E=Sophos;i="5.99,210,1677571200"; d="scan'208";a="343042855"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 14:11:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="685098936"
X-IronPort-AV: E=Sophos;i="5.99,210,1677571200"; d="scan'208";a="685098936"
Received: from fyang16-desk.jf.intel.com ([10.24.96.243])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 14:11:07 -0700
From: fei.yang@intel.com
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 1/8] drm/i915/mtl: Set has_llc=0
Date: Wed, 19 Apr 2023 14:12:12 -0700
Message-Id: <20230419211219.2574008-2-fei.yang@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230419211219.2574008-1-fei.yang@intel.com>
References: <20230419211219.2574008-1-fei.yang@intel.com>
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

On MTL, LLC is not shared between GT and CPU, set has_llc=0.

Signed-off-by: Fei Yang <fei.yang@intel.com>
---
 drivers/gpu/drm/i915/i915_pci.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
index d64e074d7457..272a8ba37b64 100644
--- a/drivers/gpu/drm/i915/i915_pci.c
+++ b/drivers/gpu/drm/i915/i915_pci.c
@@ -1147,6 +1147,7 @@ static const struct intel_device_info mtl_info = {
 	.has_flat_ccs = 0,
 	.has_gmd_id = 1,
 	.has_guc_deprivilege = 1,
+	.has_llc = 0,
 	.has_mslice_steering = 0,
 	.has_snoop = 1,
 	.__runtime.memory_regions = REGION_SMEM | REGION_STOLEN_LMEM,
-- 
2.25.1

