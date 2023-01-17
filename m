Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEAC966DCE5
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jan 2023 12:54:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7406110E1BD;
	Tue, 17 Jan 2023 11:54:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 251F410E4A7;
 Tue, 17 Jan 2023 11:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673956440; x=1705492440;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=a2PrZR1jiz8LYR3o3jCE3Q/50K+woVErDZP+Cs7VUzU=;
 b=PyfTk47CdGaWTnM1v0FiTDb8+EkZl1aiCgSJTVCAGArFWmyRyoZqIUps
 n3mcCclDLHAgNNQKksnEm3SLsCcrc/1xaWshePiCJiToFpheMldNxkQf2
 HLXJJawtyneIqgmSGj87hlZwzDMXepOMMiuNe14bgkMPSRCmj6tu7HCVO
 0nEyi2wtyZlFDfLF9Yt+UJupdbpamcSrcqVWRN8oiTbEQgW0Lj2bO4iSN
 xQQ/YOU4nWvjrC7FaKfTbkMjH5pnqLJX32QyNvuf6OszdaVU0bCtk7ILq
 7nS1tV27WzoKMeXjQCZdDzBuGHLm+eha47YwUaQYTecZGF8/2q11vS3iY Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="326744753"
X-IronPort-AV: E=Sophos;i="5.97,222,1669104000"; d="scan'208";a="326744753"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2023 03:53:59 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="767251903"
X-IronPort-AV: E=Sophos;i="5.97,222,1669104000"; d="scan'208";a="767251903"
Received: from nirmoyda-desk.igk.intel.com ([10.102.42.231])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2023 03:53:58 -0800
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 2/2] drm/i915: Ratelimit debug log in vm_fault_ttm
Date: Tue, 17 Jan 2023 12:53:50 +0100
Message-Id: <20230117115350.1071-2-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230117115350.1071-1-nirmoy.das@intel.com>
References: <20230117115350.1071-1-nirmoy.das@intel.com>
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

Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
index 8cfed1bef629..25294ddbee46 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
@@ -1077,8 +1077,9 @@ static vm_fault_t vm_fault_ttm(struct vm_fault *vmf)
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
2.39.0

