Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD5B7378CD
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 03:43:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00EDA10E3A2;
	Wed, 21 Jun 2023 01:43:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E214810E39F;
 Wed, 21 Jun 2023 01:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687311811; x=1718847811;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=aB/M3UQ834Fhfjfdo8glqMohyce10p7/5ngnqjpbj4Q=;
 b=V34xzrE5KKRopw4k7icNb9/GzL976K6qX0DUoRGEC660mK0YXHACILTO
 4GQ0p4rmd6a/g4CVOF6xTpjHJC6FD4sojoa/XfnxT3ZyuByjW1r9QObf5
 0YPVzNGSjmRj5pjNBJ4cCVxsH3Nk5tuaP2EFRRFkDgr1liQ7npwqV/te6
 0DuvHnyU5iGlRRk/1VnNsjrPsxUfGISb9Q/q4nfV/nwEFWyH5XHGY9eRv
 K3MpIjDDDs4bAep87ynb2B/DXoRLVzigh7L30gxJ1e2Iv6M+xP2LVGSm0
 0ptTun9dVjr+uURlZV8UaUL0Wgd5aWe4zD8R3Bjn2PwyotFZo7wxh6rSB g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="423699190"
X-IronPort-AV: E=Sophos;i="6.00,258,1681196400"; d="scan'208";a="423699190"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2023 18:43:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="838435884"
X-IronPort-AV: E=Sophos;i="6.00,258,1681196400"; d="scan'208";a="838435884"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.27.27])
 by orsmga004.jf.intel.com with ESMTP; 20 Jun 2023 18:43:30 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2] drm/i915/guc/slpc: Apply min softlimit correctly
Date: Tue, 20 Jun 2023 18:42:57 -0700
Message-Id: <20230621014257.1769564-1-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.38.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The scenario being fixed here is depicted in the following sequence-

modprobe i915
echo 1 > /sys/class/drm/card0/gt/gt0/slpc_ignore_eff_freq
echo 300 > /sys/class/drm/card0/gt_min_freq_mhz (RPn)
cat /sys/class/drm/card0/gt_cur_freq_mhz --> cur == RPn as expected
echo 1 > /sys/kernel/debug/dri/0/gt0/reset --> reset
cat /sys/class/drm/card0/gt_min_freq_mhz --> cached freq is RPn
cat /sys/class/drm/card0/gt_cur_freq_mhz --> it's not RPn, but RPe!!

When SLPC reinitializes, it sets SLPC min freq to efficient frequency.
Even if we disable efficient freq post that, we should restore the cached
min freq (via H2G) for it to take effect.

v2: Clarify commit message (Ashutosh)

Fixes: 95ccf312a1e4 ("drm/i915/guc/slpc: Allow SLPC to use efficient frequency")
Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
index 01b75529311c..ee9f83af7cf6 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
@@ -606,7 +606,7 @@ static int slpc_set_softlimits(struct intel_guc_slpc *slpc)
 		if (unlikely(ret))
 			return ret;
 		slpc_to_gt(slpc)->defaults.min_freq = slpc->min_freq_softlimit;
-	} else if (slpc->min_freq_softlimit != slpc->min_freq) {
+	} else {
 		return intel_guc_slpc_set_min_freq(slpc,
 						   slpc->min_freq_softlimit);
 	}
-- 
2.38.1

