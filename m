Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD2805E61F8
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 14:09:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5578810EADF;
	Thu, 22 Sep 2022 12:09:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5946010EAD1;
 Thu, 22 Sep 2022 12:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663848559; x=1695384559;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7FdX578UUU5m3CSYnxKJcN+R1Dxna5pqmhRa5tFoP6A=;
 b=gwdbBaft3io1Liigc6aHiaXndmd3UJdmfUkXEJaRZtG6es42lO9OaiCU
 oGF/XxBXB2ev8qWIllei/i525qu+oWJXeGSNb9d8itnd/mVoM0YgrcFFc
 T3Nr3Xe6kjgjITczeJnkaoYhn5Q22YNKXjIOPh94f0XSBJm4NThLl4oIu
 bsahkt7WffCt4na5Ucj58E0TAYhglZKCrkSRdw73NjTBrHjWoSGS/Sj5Q
 iSg7CqXSRUZihepNHEyp31VHrKqUYkDBjEq22U1dXhGIcWkGRDyeCip0T
 JCzxTTrs0DCxhVZAIOAYjz8caoMx31zHleVdYnCIu46uNGCbKR59mIGCE g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10477"; a="279998131"
X-IronPort-AV: E=Sophos;i="5.93,335,1654585200"; d="scan'208";a="279998131"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2022 05:09:18 -0700
X-IronPort-AV: E=Sophos;i="5.93,335,1654585200"; d="scan'208";a="570937360"
Received: from nirmoyda-desk.igk.intel.com ([10.102.13.19])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2022 05:09:17 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915: Improve debug print in vm_fault_ttm
Date: Thu, 22 Sep 2022 14:09:08 +0200
Message-Id: <20220922120908.10352-1-nirmoy.das@intel.com>
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
Cc: matthew.auld@intel.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Print the error code returned by __i915_ttm_migrate()
for better debuggability.

References: https://gitlab.freedesktop.org/drm/intel/-/issues/6889
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
index e3fc38dd5db0..9619c0fe1025 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
@@ -1034,7 +1034,7 @@ static vm_fault_t vm_fault_ttm(struct vm_fault *vmf)
 		}
 
 		if (err) {
-			drm_dbg(dev, "Unable to make resource CPU accessible\n");
+			drm_dbg(dev, "Unable to make resource CPU accessible(err = %pe)\n", err);
 			dma_resv_unlock(bo->base.resv);
 			ret = VM_FAULT_SIGBUS;
 			goto out_rpm;
-- 
2.37.3

