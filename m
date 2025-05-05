Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FCE3AAA00C
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 00:31:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9834A10E4A5;
	Mon,  5 May 2025 22:31:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="EXSvnC8G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68A5510E4A4;
 Mon,  5 May 2025 22:31:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 39EEBA4CD51;
 Mon,  5 May 2025 22:25:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43441C4CEED;
 Mon,  5 May 2025 22:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746484264;
 bh=kadxP6WANXnFgGHhpgdEJ1JC4CJv8Ro89kYhIKY7X9g=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=EXSvnC8GHe5Dz2wRbxXRQc5U/bCCs8sKGBPGP/kzz1am2ZZSn/NPk0MRYnyxzA1Ue
 UQVpryQrnlhTDl22357u+neG/gtxZJUSUlblvhNAPZVPeFCNq8Hf57tO1Cx3aWqrRN
 M7HWZ/pEi3e9ij7NO4dSj+HFiPCGGpnCvzJlZrBaOPFT0/+sq3Hl5AInbC1FybACue
 ES2jE6QBiK2G8HUBGC58GhCaHBlU+fagxJAHgtTFUyVhiCM/xFpmtSNvhPtr5h377V
 h8IXtpT7TK2qqXrup/3zlq/Vqn0sjuoFKDZ+kiFqAXRe8j/5tp1kh+Wlwlex8HFUH+
 ngfAXggh4G9DQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Sasha Levin <sashal@kernel.org>, lucas.demarchi@intel.com,
 thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com,
 airlied@gmail.com, simona@ffwll.ch, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.14 421/642] drm/xe/pf: Release all VFs configs on
 device removal
Date: Mon,  5 May 2025 18:10:37 -0400
Message-Id: <20250505221419.2672473-421-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505221419.2672473-1-sashal@kernel.org>
References: <20250505221419.2672473-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.5
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

From: Michal Wajdeczko <michal.wajdeczko@intel.com>

[ Upstream commit 611160b02a40ce3f60ab94eea85b394dca1cafd2 ]

If we try to manually provision VFs using debugfs and then we
try to unload the driver, we will see complains like:

 [ ] Memory manager not clean during takedown.
 [ ] RIP: 0010:drm_mm_takedown+0x3f/0x100
 [ ] [drm:drm_mm_takedown] *ERROR* node [fedff000 + 00001000]: inserted at
      drm_mm_insert_node_in_range+0x2bd/0x520
      xe_ggtt_node_insert+0x52/0x90 [xe]
      pf_provision_vf_ggtt+0x1fa/0xac0 [xe]
      xe_gt_sriov_pf_config_set_ggtt+0x79/0x7a0 [xe]
      ggtt_set+0x53/0x80 [xe]
      simple_attr_write_xsigned.isra.0+0xd2/0x150
      simple_attr_write+0x14/0x30
      debugfs_attr_write+0x4e/0x80

 [ ] xe 0000:00:02.0: [drm] *ERROR* GT0: GUC ID manager unclean (1/65535)
 [ ] xe 0000:00:02.0: [drm] GT0:      total 65535
 [ ] xe 0000:00:02.0: [drm] GT0:      used 1
 [ ] xe 0000:00:02.0: [drm] GT0:      range 65534..65534 (1)

 [ ] xe 0000:00:02.0: [drm] *ERROR* GT0: GuC doorbells manager unclean (1/256)
 [ ] xe 0000:00:02.0: [drm] GT0:      count: 256
 [ ] xe 0000:00:02.0: [drm] GT0:      available range: 1..255 (255)
 [ ] xe 0000:00:02.0: [drm] GT0:      available total: 255
 [ ] xe 0000:00:02.0: [drm] GT0:      reserved range: 0..0 (1)
 [ ] xe 0000:00:02.0: [drm] GT0:      reserved total: 1

This could be easily fixed by adding config release action.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20250211155034.1028-1-michal.wajdeczko@intel.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf.c        |  6 +++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 29 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h |  1 +
 3 files changed, 36 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
index 6f906c8e8108b..b80930a6bc1a2 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
@@ -78,6 +78,12 @@ int xe_gt_sriov_pf_init_early(struct xe_gt *gt)
  */
 int xe_gt_sriov_pf_init(struct xe_gt *gt)
 {
+	int err;
+
+	err = xe_gt_sriov_pf_config_init(gt);
+	if (err)
+		return err;
+
 	return xe_gt_sriov_pf_migration_init(gt);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index 4bd255adfb401..aaca54b40091f 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -2320,6 +2320,35 @@ int xe_gt_sriov_pf_config_restore(struct xe_gt *gt, unsigned int vfid,
 	return err;
 }
 
+static void fini_config(void *arg)
+{
+	struct xe_gt *gt = arg;
+	struct xe_device *xe = gt_to_xe(gt);
+	unsigned int n, total_vfs = xe_sriov_pf_get_totalvfs(xe);
+
+	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
+	for (n = 1; n <= total_vfs; n++)
+		pf_release_vf_config(gt, n);
+	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
+}
+
+/**
+ * xe_gt_sriov_pf_config_init - Initialize SR-IOV configuration data.
+ * @gt: the &xe_gt
+ *
+ * This function can only be called on PF.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_gt_sriov_pf_config_init(struct xe_gt *gt)
+{
+	struct xe_device *xe = gt_to_xe(gt);
+
+	xe_gt_assert(gt, IS_SRIOV_PF(xe));
+
+	return devm_add_action_or_reset(xe->drm.dev, fini_config, gt);
+}
+
 /**
  * xe_gt_sriov_pf_config_restart - Restart SR-IOV configurations after a GT reset.
  * @gt: the &xe_gt
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
index f894e9d4abba2..513e6512a575b 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
@@ -63,6 +63,7 @@ int xe_gt_sriov_pf_config_restore(struct xe_gt *gt, unsigned int vfid,
 
 bool xe_gt_sriov_pf_config_is_empty(struct xe_gt *gt, unsigned int vfid);
 
+int xe_gt_sriov_pf_config_init(struct xe_gt *gt);
 void xe_gt_sriov_pf_config_restart(struct xe_gt *gt);
 
 int xe_gt_sriov_pf_config_print_ggtt(struct xe_gt *gt, struct drm_printer *p);
-- 
2.39.5

