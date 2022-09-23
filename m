Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 245DF5E7615
	for <lists+dri-devel@lfdr.de>; Fri, 23 Sep 2022 10:45:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C1768826D;
	Fri, 23 Sep 2022 08:45:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B29B8826D;
 Fri, 23 Sep 2022 08:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663922715; x=1695458715;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=DZnzTF9qxmFNw4wAeqJ0W3s2g+NF/LUslyQ99QQjtYw=;
 b=X0XyEmDsTFv//Fhm3ZSpUPB1dqwbUDrgdELFwOaSqU3ZP9uMqdwFeDS4
 MoP+iec4BBJIv2pPVg1crlAm50XMimU/ChA9OrgJXSiaF+qc29THJWOmH
 R5fN1nULyr7HV3rhXG0wCwSiDaKIkL8kjzdWBJDzD1oic17zEMK6GQpYs
 2WXFuDmSJSiI/HgVpp0RwjsNVmIFQFL+95U2eLvoEm+mvMrVspOtcrCR5
 kOd/hGHX5mWlM4WLJqN3wDD3IQlrysbTKuKys9vgmGNTn60jtC0dixLwY
 eH3kW6+iCrLWfYEBDmUImWIt66XmaMnceecavRKXJG8kkvlWHK1g4lF0H w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10478"; a="326877219"
X-IronPort-AV: E=Sophos;i="5.93,337,1654585200"; d="scan'208";a="326877219"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2022 01:45:14 -0700
X-IronPort-AV: E=Sophos;i="5.93,337,1654585200"; d="scan'208";a="620142997"
Received: from nirmoyda-desk.igk.intel.com ([10.102.13.19])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2022 01:45:13 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2] drm/i915: Improve debug print in vm_fault_ttm
Date: Fri, 23 Sep 2022 10:45:06 +0200
Message-Id: <20220923084506.11968-1-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.37.3
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
Cc: andrzej.hajda@intel.com, matthew.auld@intel.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Print the error code returned by __i915_ttm_migrate()
for better debuggability.

v2: Fix kernel test robot warning.

References: https://gitlab.freedesktop.org/drm/intel/-/issues/6889
Acked-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
index e3fc38dd5db0..55455321f652 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
@@ -1034,7 +1034,7 @@ static vm_fault_t vm_fault_ttm(struct vm_fault *vmf)
 		}
 
 		if (err) {
-			drm_dbg(dev, "Unable to make resource CPU accessible\n");
+			drm_dbg(dev, "Unable to make resource CPU accessible(err = %pe)\n", ERR_PTR(err));
 			dma_resv_unlock(bo->base.resv);
 			ret = VM_FAULT_SIGBUS;
 			goto out_rpm;
-- 
2.37.3

