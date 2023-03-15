Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1998C6BA53A
	for <lists+dri-devel@lfdr.de>; Wed, 15 Mar 2023 03:27:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B64FD10E343;
	Wed, 15 Mar 2023 02:27:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5265910E1EA;
 Wed, 15 Mar 2023 02:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678847258; x=1710383258;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=CAa2oQq6HzFMCXp0yj0t4eJDP2jiBJ6Kf9DYNE1huOI=;
 b=f+0AQurYeHC7+RahjiWoJhz/tcJOSrXQlo0Phi9TKfGRjzqnyIGP88w2
 WH/7lve2ZXl362Ty8+6yMP9Co1GUNFSV1KRTuwzLnE+lIpM+5yOQ+A3o1
 pqdMttlCWAN9vVRygWcx4pEEqQWg8QBmMo3cjyjvcTDlebmbbcg91/aYw
 WrR2+CObx6TNoKKUIlqmFGD4hno+QeOLow6+YLKiyvzbRUHBcZClHRksE
 tEw6UC2OmFqCsogp9sWSJu4AH8HOlICWxsMAxZdahPTa+T8WzfKhMLxdx
 kCBQnC7O0X4j5hbTiH4V/BJRHMn5G99u+XVRW08/CpWKXD/W052bs3Fb4 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="336283532"
X-IronPort-AV: E=Sophos;i="5.98,261,1673942400"; d="scan'208";a="336283532"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2023 19:27:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="789616851"
X-IronPort-AV: E=Sophos;i="5.98,261,1673942400"; d="scan'208";a="789616851"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.27.27])
 by fmsmga002.fm.intel.com with ESMTP; 14 Mar 2023 19:27:37 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/i915: Fix format for perf_limit_reasons
Date: Tue, 14 Mar 2023 19:29:06 -0700
Message-Id: <20230315022906.2467408-1-vinay.belgaumkar@intel.com>
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

Use hex format so that it is easier to decode.

Fixes: fe5979665f64 ('Add perf_limit_reasons in debugfs')

Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c b/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c
index 83df4cd5e06c..80dbbef86b1d 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c
@@ -580,7 +580,7 @@ static bool perf_limit_reasons_eval(void *data)
 }
 
 DEFINE_SIMPLE_ATTRIBUTE(perf_limit_reasons_fops, perf_limit_reasons_get,
-			perf_limit_reasons_clear, "%llu\n");
+			perf_limit_reasons_clear, "0x%llx\n");
 
 void intel_gt_pm_debugfs_register(struct intel_gt *gt, struct dentry *root)
 {
-- 
2.38.1

