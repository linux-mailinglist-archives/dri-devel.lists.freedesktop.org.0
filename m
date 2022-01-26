Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C89D49CDF8
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jan 2022 16:22:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5827410E91C;
	Wed, 26 Jan 2022 15:22:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75B0210E8F7;
 Wed, 26 Jan 2022 15:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643210536; x=1674746536;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=d/dJyJfJHyoFjHHsYcxW6VfzFlORPetb+CPpCXnBDQI=;
 b=QTvsv/MLNkZxmvO5ds6KRW3SJC908B7Cje7QoA8sC/7+fnrKuyafWnoP
 QZStBJQaFkYG1YQVZo5yT4GMSGa8o1/z2cBXlvDJtiUjc4fm+tdvoEVrn
 1DvU1LiFrEgcJLhPocjG55TUFVKfm/eTD0/x4MGK4zeAOF39LVVNqSF+g
 rF7SqunsfYmofNmdkMmgKoAm1x6mxfcHBR+nKwrhI7PbZkjrNB1WLb+Ro
 OIosTGbuEb6hkYQvlDIvBVmA1cdUbaJ+DEReUosaVQkcNoQRyP0MDymNq
 ni7kliXiqFyOszLvyAyb41dQh673TDLBx/KBnmRIb8yZLaIwOLIs3Af5w A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10238"; a="309885234"
X-IronPort-AV: E=Sophos;i="5.88,318,1635231600"; d="scan'208";a="309885234"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 07:22:16 -0800
X-IronPort-AV: E=Sophos;i="5.88,318,1635231600"; d="scan'208";a="674386264"
Received: from jamesstx-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.213.247.182])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 07:22:15 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 09/20] drm/i915/buddy: tweak 2big check
Date: Wed, 26 Jan 2022 15:21:44 +0000
Message-Id: <20220126152155.3070602-10-matthew.auld@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220126152155.3070602-1-matthew.auld@intel.com>
References: <20220126152155.3070602-1-matthew.auld@intel.com>
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Otherwise we get -EINVAL, instead of the more useful -E2BIG if the
allocation doesn't fit within the pfn range, like with mappable lmem.
The hugepages selftest, for example, needs this to know if a smaller
size is needed.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/i915/i915_ttm_buddy_manager.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
index bc725a92fc5c..7c24cc6608e3 100644
--- a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
+++ b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
@@ -81,7 +81,7 @@ static int i915_ttm_buddy_man_alloc(struct ttm_resource_manager *man,
 			lpfn = pages;
 	}
 
-	if (size > mm->size) {
+	if (size > lpfn << PAGE_SHIFT) {
 		err = -E2BIG;
 		goto err_free_res;
 	}
-- 
2.34.1

