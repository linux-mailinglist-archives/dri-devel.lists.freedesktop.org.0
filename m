Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F4436A6B54
	for <lists+dri-devel@lfdr.de>; Wed,  1 Mar 2023 12:03:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D7F810E242;
	Wed,  1 Mar 2023 11:03:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D44F10E238;
 Wed,  1 Mar 2023 11:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677668600; x=1709204600;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4I0JF5lu2iFONCYFQiTlA+PXZFz3AZZnwjeiDKgiv88=;
 b=mJmzEyBK1PwCyDYEjSfcB6EownuWXUb0M8WQhbzUoSZQXTfnzZoBg6LT
 SS9o4G555UUHY2R7b5GuibOXbNW/jhba9nVP/3VWjEWipebZZ0tyejNRO
 mtS8XHLKGLETccb+oSfH6+JwFvHHfenlstgCEN2vbfkxLD+b/UgS+/txS
 Urat9j5YgF5fI6vIatzEECgoIHe2sUddfxN6n5VzbumnntocaDLUrb//W
 KbdYdNVCPNC3b0etMFHrEGrb/LOTA2ViBTpVrQrFMr3OTKbZDVCCsCNsV
 g/sLdT4kmJw2ZrjDPY6pVgD9RG2IfxelEqum3xz4lrx5P3TqlpHSKm8ba w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10635"; a="331859897"
X-IronPort-AV: E=Sophos;i="5.98,224,1673942400"; d="scan'208";a="331859897"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2023 03:03:20 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10635"; a="676715052"
X-IronPort-AV: E=Sophos;i="5.98,224,1673942400"; d="scan'208";a="676715052"
Received: from unknown (HELO intel.com) ([10.252.57.78])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2023 03:03:18 -0800
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 2/2] drm/i915/debugfs: Enable upper layer interfaces to act
 on all gt's
Date: Wed,  1 Mar 2023 12:02:58 +0100
Message-Id: <20230301110258.2140955-3-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230301110258.2140955-1-andi.shyti@linux.intel.com>
References: <20230301110258.2140955-1-andi.shyti@linux.intel.com>
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
 Andi Shyti <andi@etezian.org>, Maciej Patelczyk <maciej.patelczyk@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The commit 82a149a62b6b5 ('drm/i915/gt: move remaining debugfs
interfaces into gt') moved gt-related debugfs files in the gtX/
directories to operate on individual gt's.

However, the original files were only functioning on the root
tile (tile 0) and have been left in the same location to maintain
compatibility with userspace users.

Add multiplexing functionality to the higher directories' files.
This enables the operations to be performed on all the tiles with
a single write. In the case of reads, the files provide an or'ed
value across all the tiles.

Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
Cc: Maciej Patelczyk <maciej.patelczyk@intel.com>
---
 drivers/gpu/drm/i915/i915_debugfs.c | 38 ++++++++++++++++++++++++++---
 1 file changed, 34 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_debugfs.c b/drivers/gpu/drm/i915/i915_debugfs.c
index 45773ce1deac2..90663f251fd10 100644
--- a/drivers/gpu/drm/i915/i915_debugfs.c
+++ b/drivers/gpu/drm/i915/i915_debugfs.c
@@ -575,14 +575,36 @@ static int i915_wa_registers(struct seq_file *m, void *unused)
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
+		u64 v;
+
+		ret = intel_gt_debugfs_reset_show(gt, &v);
+		if (ret)
+			return ret;
+
+		/* at least one tile should be wedged */
+		*val |= !!v;
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
@@ -733,7 +755,11 @@ static int i915_sseu_status(struct seq_file *m, void *unused)
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
@@ -741,7 +767,11 @@ static int i915_forcewake_open(struct inode *inode, struct file *file)
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
2.39.1

