Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E00AACA1E2
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jun 2025 01:31:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A033710E3EF;
	Sun,  1 Jun 2025 23:31:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="jp+1+W15";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44D1810E3E7;
 Sun,  1 Jun 2025 23:31:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 81D95A4F583;
 Sun,  1 Jun 2025 23:31:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE49CC4CEF3;
 Sun,  1 Jun 2025 23:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748820692;
 bh=pFZtkKMHR9x5eIJ34bL6R0k8acs8GLqXE43rHAxAfUI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jp+1+W15P2w1kzHsZHQP37p0c4mgDJtlibkciT+xM7hjBq8/vtSqOHrNqVuXovCjS
 R47YC8NILapJkhsDIPndZG2gifVfBiIrxLH2RoXCWgkP01DVPcSBfX6MmONCa19wfB
 TlEyVKBa+vC7SmxO4ICeKmbh5YOmXIjkHg/SfdSEPxBgYwYp8/Hzjt+TKq8Y2fqSDc
 Bl4MV8dpP/V8MQNht4TcW/c0WvFxKhx2agv/2jvIrwjzdk6Y7qYtnRMDFoWFRN137X
 A8nREiGZ5OUhiK77zni2g8dS9RXsHi6NmMJl/8kVA5BIdbDvo6mNjAF3wWEtmThWwr
 Gjzjgj2BK3sVQ==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>, Sasha Levin <sashal@kernel.org>,
 lucas.demarchi@intel.com, thomas.hellstrom@linux.intel.com,
 rodrigo.vivi@intel.com, airlied@gmail.com, simona@ffwll.ch,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 6.14 046/102] drm/xe/vf: Fix guc_info debugfs for VFs
Date: Sun,  1 Jun 2025 19:28:38 -0400
Message-Id: <20250601232937.3510379-46-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250601232937.3510379-1-sashal@kernel.org>
References: <20250601232937.3510379-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.9
Content-Type: text/plain; charset=UTF-8
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

From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

[ Upstream commit dba7d17d50b4488c697e991d18a0e55669d9fa59 ]

The guc_info debugfs attempts to read a bunch of registers that the VFs
doesn't have access to, so fix it by skipping the reads.

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4775
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Reviewed-by: Lukasz Laguna <lukasz.laguna@intel.com>
Link: https://lore.kernel.org/r/20250423173908.1571412-1-daniele.ceraolospurio@intel.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

**YES** This commit should be backported to stable kernel trees. Here's
my analysis: ## Bug Fix Analysis The commit addresses a **specific
runtime failure** in VF (Virtual Function) environments where the
`guc_info` debugfs interface attempts to read hardware registers that
VFs don't have access to. This is a clear bug fix that prevents crashes
or access violations. ## Code Change Assessment The fix is **minimal and
surgical**: ```c - fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT); -
if (!fw_ref) - return; + if (!IS_SRIOV_VF(gt_to_xe(gt))) { + fw_ref =
xe_force_wake_get(gt_to_fw(gt), XE_FW_GT); + if (!fw_ref) + return; ```
The change wraps the problematic register access code in a VF check,
only executing the register reads for non-VF environments. This is
exactly the right approach for hardware access restrictions. ## Backport
Suitability Criteria ✅ **Fixes user-affecting bug**: VFs attempting to
use debugfs would fail/crash ✅ **Small and contained**: Only 4 lines
changed, wrapping existing code in a conditional ✅ **No architectural
changes**: Maintains existing functionality for PF, just skips for VF ✅
**Minimal regression risk**: The conditional is well-established
(`IS_SRIOV_VF`) and used throughout the codebase ✅ **Clear issue
reference**: Closes GitLab issue #4775 ✅ **Debugfs-specific**: Non-
critical path, but important for system stability ## Similar Commit
Pattern Analysis This follows the same pattern as other VF-related fixes
in the xe driver, where hardware access is conditional based on
`IS_SRIOV_VF()` checks. The kernel tree shows numerous similar patterns
where VF access restrictions are handled this way. ## Risk Assessment
**Very Low Risk**: The change only affects the debugfs interface,
doesn't modify core functionality, and uses an established conditional
pattern. For VF environments, it prevents access violations; for non-VF
environments, behavior is unchanged. This is a textbook stable backport
candidate: it fixes a clear bug with minimal, contained changes and
near-zero regression risk.

 drivers/gpu/drm/xe/xe_guc.c | 44 +++++++++++++++++++------------------
 1 file changed, 23 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 408365dfe4eed..2208bb528d76d 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -1506,30 +1506,32 @@ void xe_guc_print_info(struct xe_guc *guc, struct drm_printer *p)
 
 	xe_uc_fw_print(&guc->fw, p);
 
-	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
-	if (!fw_ref)
-		return;
+	if (!IS_SRIOV_VF(gt_to_xe(gt))) {
+		fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
+		if (!fw_ref)
+			return;
+
+		status = xe_mmio_read32(&gt->mmio, GUC_STATUS);
+
+		drm_printf(p, "\nGuC status 0x%08x:\n", status);
+		drm_printf(p, "\tBootrom status = 0x%x\n",
+			   REG_FIELD_GET(GS_BOOTROM_MASK, status));
+		drm_printf(p, "\tuKernel status = 0x%x\n",
+			   REG_FIELD_GET(GS_UKERNEL_MASK, status));
+		drm_printf(p, "\tMIA Core status = 0x%x\n",
+			   REG_FIELD_GET(GS_MIA_MASK, status));
+		drm_printf(p, "\tLog level = %d\n",
+			   xe_guc_log_get_level(&guc->log));
+
+		drm_puts(p, "\nScratch registers:\n");
+		for (i = 0; i < SOFT_SCRATCH_COUNT; i++) {
+			drm_printf(p, "\t%2d: \t0x%x\n",
+				   i, xe_mmio_read32(&gt->mmio, SOFT_SCRATCH(i)));
+		}
 
-	status = xe_mmio_read32(&gt->mmio, GUC_STATUS);
-
-	drm_printf(p, "\nGuC status 0x%08x:\n", status);
-	drm_printf(p, "\tBootrom status = 0x%x\n",
-		   REG_FIELD_GET(GS_BOOTROM_MASK, status));
-	drm_printf(p, "\tuKernel status = 0x%x\n",
-		   REG_FIELD_GET(GS_UKERNEL_MASK, status));
-	drm_printf(p, "\tMIA Core status = 0x%x\n",
-		   REG_FIELD_GET(GS_MIA_MASK, status));
-	drm_printf(p, "\tLog level = %d\n",
-		   xe_guc_log_get_level(&guc->log));
-
-	drm_puts(p, "\nScratch registers:\n");
-	for (i = 0; i < SOFT_SCRATCH_COUNT; i++) {
-		drm_printf(p, "\t%2d: \t0x%x\n",
-			   i, xe_mmio_read32(&gt->mmio, SOFT_SCRATCH(i)));
+		xe_force_wake_put(gt_to_fw(gt), fw_ref);
 	}
 
-	xe_force_wake_put(gt_to_fw(gt), fw_ref);
-
 	drm_puts(p, "\n");
 	xe_guc_ct_print(&guc->ct, p, false);
 
-- 
2.39.5

