Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0DE65B5E0F
	for <lists+dri-devel@lfdr.de>; Mon, 12 Sep 2022 18:21:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E41C510E5F8;
	Mon, 12 Sep 2022 16:20:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1C3710E5F1;
 Mon, 12 Sep 2022 16:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662999624; x=1694535624;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=niNImBTtpSxt6JFXuws5dL0ftMzK5MUa/Iyfl/MkPCM=;
 b=bnORxLzNQVvjYkDnFdtBn91y4W3l6qLEtUjUS9N2rErkGsuYSX/huW3j
 hS3o4dIvUnt6mXstzQFdcxfXJclEW5GcyYt8a/nMNbsWq7tZhwBM4izB+
 rrVWnXJQJso9SdkgYGfD3xRWfPzrzHF9F65fca9JCIxCOQVrBTsRCO6IC
 ZyWgPb+I4fiUUQGA1UCTyKxE3sB+afo1dHQ6OfVA3JZx8LukAnrz8NgPK
 2bunJbXKIN+UzYI6qJqJQwQUmL9EEF9ba6vqhPl/3zUHkszl4Ch0PE+l9
 bz0u3qkfDxQY7Z5HNO67PtZlUt+G2zCmGRn/ZSbFL/ryO7/ybGFzrWLiP w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10468"; a="299248378"
X-IronPort-AV: E=Sophos;i="5.93,310,1654585200"; d="scan'208";a="299248378"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2022 09:20:23 -0700
X-IronPort-AV: E=Sophos;i="5.93,310,1654585200"; d="scan'208";a="646528976"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.143])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2022 09:20:23 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v1 1/1] drm/i915: Skip applying copy engine fuses
Date: Mon, 12 Sep 2022 09:19:38 -0700
Message-Id: <20220912-copy-engine-v1-1-ef92fd81758d@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220912-copy-engine-v1-0-ef92fd81758d@intel.com>
References: <20220912-copy-engine-v1-0-ef92fd81758d@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.10.0-dev-df873
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Support for reading the fuses to check what are the Link Copy engines
was added in commit ad5f74f34201 ("drm/i915/pvc: read fuses for link
copy engines"). However they were added unconditionally because the
FUSE3 register is present since graphics version 10.

However the bitfield with meml3 fuses only exists since graphics version
12. Moreover, Link Copy engines are currently only available in PVC.
Tying additional copy engines to the meml3 fuses is not correct for
other platforms.

Make sure there is a check for  `12.60 <= ver < 12.70`. Later platforms
may extend this function later if it's needed to fuse off copy engines.

Currently it's harmless as the Link Copy engines are still not exported:
info->engine_mask only has BCS0 set and the register is only read for
platforms that do have it.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
index 814f83b5fe59..1f7188129cd1 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
@@ -764,6 +764,10 @@ static void engine_mask_apply_copy_fuses(struct intel_gt *gt)
 	unsigned long meml3_mask;
 	unsigned long quad;
 
+	if (!(GRAPHICS_VER_FULL(i915) >= IP_VER(12, 60) &&
+	      GRAPHICS_VER_FULL(i915) < IP_VER(12, 70)))
+		return;
+
 	meml3_mask = intel_uncore_read(gt->uncore, GEN10_MIRROR_FUSE3);
 	meml3_mask = REG_FIELD_GET(GEN12_MEML3_EN_MASK, meml3_mask);
 

-- 
b4 0.10.0-dev-df873
