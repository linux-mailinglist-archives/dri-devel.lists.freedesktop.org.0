Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 342547BFB09
	for <lists+dri-devel@lfdr.de>; Tue, 10 Oct 2023 14:17:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1785110E1E7;
	Tue, 10 Oct 2023 12:17:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A42410E1E7;
 Tue, 10 Oct 2023 12:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696940233; x=1728476233;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=z0Tza+/umRIrseJOU8xgUOGIETM+RdAwkixwca8zxlg=;
 b=eqmiAO6BACZxi7wsT0P21A2UoCRXS6lm9cGkAwGE2X75l8XnOCwDNNI3
 DA//HLxlh+1i824hSwwi74pIAGCMenTQ5ScWDRGEabu1XstYldn5xscD3
 mL6Ifm96uiKMJczeXmjg/LzNqiiltuSAMBp9IhF7ZrfEk3BcRwg24k2ti
 1wg/TUngOt1L6KZzKx4nzVbi1JKYrdJ2mzJqraLBbSIzOfsjafK0ql276
 YMm+OoTZyM29xUaa0F1Bh0/5c5FjEeU/3co4binI+Z2nxNyY7mgpTyztG
 7aGLL1RD9x0jCF06QnE8mv+YcrFDsz+FiSDeEe2exINZQJbWlT39yxk8T w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="369442282"
X-IronPort-AV: E=Sophos;i="6.03,212,1694761200"; d="scan'208";a="369442282"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2023 05:16:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="897168803"
X-IronPort-AV: E=Sophos;i="6.03,212,1694761200"; d="scan'208";a="897168803"
Received: from ppalanyk-mobl.gar.corp.intel.com (HELO intel.com)
 ([10.213.148.82])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2023 05:15:06 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH RESEND v2 2/2] drm/i915: Ratelimit debug log in vm_fault_ttm
Date: Tue, 10 Oct 2023 14:15:45 +0200
Message-Id: <20231010121545.1046793-3-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231010121545.1046793-1-andi.shyti@linux.intel.com>
References: <20231010121545.1046793-1-andi.shyti@linux.intel.com>
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
2.40.1

