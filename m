Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE08595DB25
	for <lists+dri-devel@lfdr.de>; Sat, 24 Aug 2024 05:47:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C0D910E052;
	Sat, 24 Aug 2024 03:47:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="adOncbTw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C573210E052;
 Sat, 24 Aug 2024 03:47:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id E697FA40DFC;
 Sat, 24 Aug 2024 03:47:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A377EC32781;
 Sat, 24 Aug 2024 03:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1724471239;
 bh=9hvQeS0ngXVdosBqKG7tf+RduULcEVupa0NszXQJR7E=;
 h=From:Date:Subject:To:Cc:From;
 b=adOncbTwURvRgjY1LZgDiwhlMCAZV/hWtxyHUuLYbmNudJXeTYti7ELfIIj3rgNSG
 TrUdh43mvCLZQnroaA4BDSaymfdi4fFiWBnc6Sx+X1vloMhe2/tyChICI2ZVrWnckx
 QZP077mGelqsOESHNt1l/iYRjVuNAZ8JyOTiSwH+DjdXiAq0CejZFomv9e9eBhUZo6
 gcY8uOcGR9qCDbywgqxuwa5EfT4H2mWX6hus81z7p4wyV5ycKIx0uoTyr+owsCtL5r
 3Gj94NHyqCJzUeV/0M+qX7KsqrSV7JSrId+LnIPfWqiCD2NPqFuZl/7+zWShmgH2Jh
 bXPnXsona51mw==
From: Nathan Chancellor <nathan@kernel.org>
Date: Fri, 23 Aug 2024 20:47:13 -0700
Subject: [PATCH] drm/xe: Fix total initialization in xe_ggtt_print_holes()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240823-drm-xe-fix-total-in-xe_ggtt_print_holes-v1-1-12b02d079327@kernel.org>
X-B4-Tracking: v=1; b=H4sIAMBXyWYC/x3NQQqDMBCF4avIrDuQji60VyklhDjGAZvIJIgg3
 r1Dl9/if++Cyipc4dVdoHxIlZINz0cHcQ05McpsBnI0uJF6nPWLJ+MiJ7bSwoaSzT6l1vyukpt
 fy8YVXVwo9tMUAgWwtV3Zmv/T+3PfP+WWHHh5AAAA
To: Lucas De Marchi <lucas.demarchi@intel.com>, 
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>, 
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 llvm@lists.linux.dev, patches@lists.linux.dev, 
 Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2190; i=nathan@kernel.org;
 h=from:subject:message-id; bh=9hvQeS0ngXVdosBqKG7tf+RduULcEVupa0NszXQJR7E=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDGknw49prXzD4iFidfWUy5+3BzlrvVifzfv6oUksQHgLJ
 6fxxB+hHaUsDGJcDLJiiizVj1WPGxrOOct449QkmDmsTCBDGLg4BWAiZ10Z/hk/3OlUfbvLSSLE
 uf7jLLbpa7f9lng6b92knNd7Pui5S61j+Cs3ZdNeSa/vJz5IZTa7bT0/3e7pWZPP0/lX3+/cbnB
 rPg8/AA==
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
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

Clang warns (or errors with CONFIG_DRM_WERROR or CONFIG_WERROR):

  drivers/gpu/drm/xe/xe_ggtt.c:810:3: error: variable 'total' is uninitialized when used here [-Werror,-Wuninitialized]
    810 |                 total += hole_size;
        |                 ^~~~~
  drivers/gpu/drm/xe/xe_ggtt.c:798:11: note: initialize the variable 'total' to silence this warning
    798 |         u64 total;
        |                  ^
        |                   = 0
  1 error generated.

Move the zero initialization of total from
xe_gt_sriov_pf_config_print_available_ggtt() to xe_ggtt_print_holes() to
resolve the warning.

Fixes: 136367290ea5 ("drm/xe: Introduce xe_ggtt_print_holes")
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 drivers/gpu/drm/xe/xe_ggtt.c               | 2 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index a3ce91decdce..86fc6afa43bd 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -795,7 +795,7 @@ u64 xe_ggtt_print_holes(struct xe_ggtt *ggtt, u64 alignment, struct drm_printer
 	const struct drm_mm_node *entry;
 	u64 hole_min_start = xe_wopcm_size(tile_to_xe(ggtt->tile));
 	u64 hole_start, hole_end, hole_size;
-	u64 total;
+	u64 total = 0;
 	char buf[10];
 
 	mutex_lock(&ggtt->lock);
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index c8835d9eead6..41ed07b153b5 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -2110,7 +2110,7 @@ int xe_gt_sriov_pf_config_print_available_ggtt(struct xe_gt *gt, struct drm_prin
 {
 	struct xe_ggtt *ggtt = gt_to_tile(gt)->mem.ggtt;
 	u64 alignment = pf_get_ggtt_alignment(gt);
-	u64 spare, avail, total = 0;
+	u64 spare, avail, total;
 	char buf[10];
 
 	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));

---
base-commit: 66a0f6b9f5fc205272035b6ffa4830be51e3f787
change-id: 20240823-drm-xe-fix-total-in-xe_ggtt_print_holes-0cf2c399aa2a

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>

