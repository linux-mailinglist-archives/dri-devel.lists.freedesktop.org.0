Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 437C7807A28
	for <lists+dri-devel@lfdr.de>; Wed,  6 Dec 2023 22:10:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5412510E78F;
	Wed,  6 Dec 2023 21:10:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E02010E78F;
 Wed,  6 Dec 2023 21:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701897016; x=1733433016;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=V99BWq/BClbvoctYkxrVbW5ahi33E7ki9yPATHuwTws=;
 b=WIeTQ0UtCL2r0PeEJJ8eT+vQBqn9Mcs6mtEe4bQxqrFoh9MyXIsGOiZY
 mGjaTkQ1AcOv3yclycmEASCzLNDV0YFsPZQ+rSHpXi4tBnZax37yoZ2CJ
 DHuc4798xqthQIE1NHjsQLbl4Nu3Hn94bBMJgqS6jLGINYjubpoUgAd9F
 GuL7+lL+6ee5ynLqpIbV08swbzO13dTYwE8sc3zwubmJ62WDh33dng21J
 tr9LHrsPHrFx1q9DcrOrdPtnim38wCQx8tMLZd5fdpAK+dEV92tXeoqIh
 M5a/AhUAoF0BKxLHjxUlInikJ/IgpL0wsxwnHS1fhc1lUzggjeQW763B0 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="396917288"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="396917288"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2023 13:10:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="894879986"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="894879986"
Received: from karthik-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.252.46.178])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2023 13:10:12 -0800
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH RESEND AGAIN v2 2/2] drm/i915: Ratelimit debug log in
 vm_fault_ttm
Date: Wed,  6 Dec 2023 22:09:48 +0100
Message-ID: <20231206210948.106238-3-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231206210948.106238-1-andi.shyti@linux.intel.com>
References: <20231206210948.106238-1-andi.shyti@linux.intel.com>
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
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>,
 Maxime Ripard <mripard@kernel.org>, Matthew Auld <matthew.auld@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 John Harrison <John.C.Harrison@Intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Nirmoy Das <nirmoy.das@intel.com>

Test like i915_gem_mman_live_selftests/igt_mmap_migrate can cause
dmesg spamming. Use ratelimit api to reduce log rate.

References: https://gitlab.freedesktop.org/drm/intel/-/issues/7038
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
index 9227f8146a58..6b69ef0cdbb4 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
@@ -1101,8 +1101,9 @@ static vm_fault_t vm_fault_ttm(struct vm_fault *vmf)
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
2.43.0

