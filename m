Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 925545FD657
	for <lists+dri-devel@lfdr.de>; Thu, 13 Oct 2022 10:40:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BA7510E683;
	Thu, 13 Oct 2022 08:40:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2256D10E508;
 Thu, 13 Oct 2022 08:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665650425; x=1697186425;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=am6pf7jqcY2mDNCj1VrQ0Uc9A6Sn2Ck866wYuurd2ug=;
 b=X6FfOqW/e87dyqQL/QGBfkJhY4gxLKtyVQnhRkMXVmtf0zAlL2niW0b8
 0KGBCpKOaiWUZOUOuXTr01k7yhpiGV0fQL8fHp/BdMt8TM+69hqZPZFll
 xW11k9n8PqaGmmGghadyxEnf16wwRMqxsI+z2TJrsPJWoAsQOVz8gxyFo
 FJi8JdpEp0LJVPOrv1iEEgGabrJOBboc6AbwW3tC7kJocN8VV/eIqMbtF
 ldo0p/kUGZ4xSrQRTmI+9+HxjZeLa4Fq4NRhL5bPrXH2YjuqeTOWQtmke
 oto2tph45n3hHEHPr1a+R/LS0kl5PiJo0y/qe6ud8zRmPoIb9+CM7TDyd Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10498"; a="306655590"
X-IronPort-AV: E=Sophos;i="5.95,180,1661842800"; d="scan'208";a="306655590"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2022 01:40:24 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10498"; a="658098662"
X-IronPort-AV: E=Sophos;i="5.95,180,1661842800"; d="scan'208";a="658098662"
Received: from nirmoyda-desk.igk.intel.com ([10.102.13.19])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2022 01:40:22 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 2/2] drm/i915: Ratelimit debug log in vm_fault_ttm
Date: Thu, 13 Oct 2022 10:40:07 +0200
Message-Id: <20221013084007.19843-2-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221013084007.19843-1-nirmoy.das@intel.com>
References: <20221013084007.19843-1-nirmoy.das@intel.com>
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany,
 Commercial Register: Amtsgericht Muenchen HRB 186928 
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
Cc: Matthew Auld <matthew.auld@intel.com>, dri-devel@lists.freedesktop.org,
 Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Test like i915_gem_mman_live_selftests/igt_mmap_migrate can cause
dmesg spamming. Use ratelimit api to reduce log rate.

References: https://gitlab.freedesktop.org/drm/intel/-/issues/7038
Cc: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
index d63f30efd631..6b60b99461e2 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
@@ -1080,8 +1080,9 @@ static vm_fault_t vm_fault_ttm(struct vm_fault *vmf)
 		}
 
 		if (err) {
-			drm_dbg(dev, "Unable to make resource CPU accessible(err = %pe)\n",
-				ERR_PTR(err));
+			drm_dbg_ratelimited(dev,
+					    "Unable to make resource CPU accessible(err = %pe)\n",
+					    ERR_PTR(err));
 			dma_resv_unlock(bo->base.resv);
 			ret = VM_FAULT_SIGBUS;
 			goto out_rpm;
-- 
2.37.3

