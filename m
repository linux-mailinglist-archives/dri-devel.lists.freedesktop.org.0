Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E7DA36BFCC8
	for <lists+dri-devel@lfdr.de>; Sat, 18 Mar 2023 21:37:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59CEC10E498;
	Sat, 18 Mar 2023 20:37:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A400910E155;
 Sat, 18 Mar 2023 20:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679171829; x=1710707829;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QFW7NvHsex5CUEwIUQdst0wKn6UH1KJMTYxvrBhZKzo=;
 b=QvLj+TibZcdLbu66nxI9Wxq/PUFhswlHpVXcxlm7sj4qYHWlivZ0tjT0
 8kBuPiHqlSviGyPNdPQURSTBpdqpZGsfPCG9ev+V0rqjASqBRjw1GqW8b
 9bRmThKO2uDHAPMTuNB8h52eoB27cD8Ob08S0Idv3fLowfm5Eo0QfKuUW
 CT34ZjKhMPoSNX6LTmBDDbaltgfn7fYCuv5srUnfXD+xoLR45O3flZQVM
 OlKnL4Qa54T32xQbgfM9F3/Ym8Sb1+Rk7YA4EHoV/nU2TcLkIWTTml6l8
 uOSKoPWHB0IazZNkRx4aNNSH8hb0pcTnQpnXjOfS0UOEFy8AhsJ75aBiy g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10653"; a="424738784"
X-IronPort-AV: E=Sophos;i="5.98,272,1673942400"; d="scan'208";a="424738784"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2023 13:37:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10653"; a="744905084"
X-IronPort-AV: E=Sophos;i="5.98,272,1673942400"; d="scan'208";a="744905084"
Received: from rmanole-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.252.34.109])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2023 13:37:06 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v3 2/2] drm/i915/debugfs: Enable upper layer interfaces to act
 on all gt's
Date: Sat, 18 Mar 2023 21:36:16 +0100
Message-Id: <20230318203616.183765-4-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230318203616.183765-1-andi.shyti@linux.intel.com>
References: <20230318203616.183765-1-andi.shyti@linux.intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Andi Shyti <andi.shyti@kernel.org>,
 Radhakrishna Sripada <radhakrishna.sripada@intel.com>,
 Maciej Patelczyk <maciej.patelczyk@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The commit 82a149a62b6b5 ('drm/i915/gt: move remaining debugfs
interfaces into gt') moved gt-related debugfs files in the gtX/
directories to operate on individual gt's.

However, the original files were only functioning on the root
GT (GT 0) and have been left in the same location to maintain
compatibility with userspace users.

Add multiplexing functionality to the higher directories' files.
This enables the operations to be performed on all the GTs with
a single write. In the case of reads, the files provide an or'ed
value across all the tiles.

Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
Cc: Maciej Patelczyk <maciej.patelczyk@intel.com>
Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/i915/i915_debugfs.c | 36 +++++++++++++++++++++++++----
 1 file changed, 32 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_debugfs.c b/drivers/gpu/drm/i915/i915_debugfs.c
index 16011c0286ada..80c2bf98e341c 100644
--- a/drivers/gpu/drm/i915/i915_debugfs.c
+++ b/drivers/gpu/drm/i915/i915_debugfs.c
@@ -574,14 +574,34 @@ static int i915_wa_registers(struct seq_file *m, void *unused)
 static int i915_wedged_get(void *data, u64 *val)
 {
 	struct drm_i915_private *i915 = data;
+	struct intel_gt *gt;
+	unsigned int i;
 
-	return intel_gt_debugfs_reset_show(to_gt(i915), val);
+	*val = 0;
+
+	for_each_gt(gt, i915, i) {
+		int ret;
+
+		ret = intel_gt_debugfs_reset_show(gt, val);
+		if (ret)
+			return ret;
+
+		/* at least one tile should be wedged */
+		if (*val)
+			break;
+	}
+
+	return 0;
 }
 
 static int i915_wedged_set(void *data, u64 val)
 {
 	struct drm_i915_private *i915 = data;
-	intel_gt_debugfs_reset_store(to_gt(i915), val);
+	struct intel_gt *gt;
+	unsigned int i;
+
+	for_each_gt(gt, i915, i)
+		intel_gt_debugfs_reset_store(gt, val);
 
 	return 0;
 }
@@ -732,7 +752,11 @@ static int i915_sseu_status(struct seq_file *m, void *unused)
 static int i915_forcewake_open(struct inode *inode, struct file *file)
 {
 	struct drm_i915_private *i915 = inode->i_private;
-	intel_gt_pm_debugfs_forcewake_user_open(to_gt(i915));
+	struct intel_gt *gt;
+	unsigned int i;
+
+	for_each_gt(gt, i915, i)
+		intel_gt_pm_debugfs_forcewake_user_open(gt);
 
 	return 0;
 }
@@ -740,7 +764,11 @@ static int i915_forcewake_open(struct inode *inode, struct file *file)
 static int i915_forcewake_release(struct inode *inode, struct file *file)
 {
 	struct drm_i915_private *i915 = inode->i_private;
-	intel_gt_pm_debugfs_forcewake_user_release(to_gt(i915));
+	struct intel_gt *gt;
+	unsigned int i;
+
+	for_each_gt(gt, i915, i)
+		intel_gt_pm_debugfs_forcewake_user_release(gt);
 
 	return 0;
 }
-- 
2.39.2

