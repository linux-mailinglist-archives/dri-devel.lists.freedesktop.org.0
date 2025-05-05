Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D6E5AAA105
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 00:42:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67FAC10E51B;
	Mon,  5 May 2025 22:42:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="n86hZJU4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40DEE10E51A;
 Mon,  5 May 2025 22:42:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 59A9E443C8;
 Mon,  5 May 2025 22:42:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4824EC4CEE4;
 Mon,  5 May 2025 22:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746484936;
 bh=JQgySx1ZAiBLcZYCPGWNau41QHc0ukZYtN/IvnH6UNk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=n86hZJU4jrMnIncrlX9+Gxiy+mNEmoNyKZZJTiTR3aB0rGQbR6QhUwcBsP97b3s6r
 xXkx/v0g/rS4Xii/19PXwWnwLMoVsM5unRZ6wG6X9ew+Vo8J5gELHrpJSa8CZtEoI3
 6qOq0jpVH1uHCbnPqu4SpXxGZstBZG8rnOWZEtv8OL3XXYBcEhENnfSUyEL94i3hXd
 oMANG3ZRADO2QSDyum3gf96g0BmoLcH7VuJORakxWb3QVuKuMKuCG7L3kz56RDg691
 YvaCvHYL/4AhcfQPQbdaVK36s9m4lrbhv2hcSIFFMeowKobt1ptxTLc1GVzq6IcYfj
 3meTPZFQsP4Dw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Kent Russell <kent.russell@amd.com>, Sasha Levin <sashal@kernel.org>,
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch,
 lijo.lazar@amd.com, mario.limonciello@amd.com, marek.olsak@amd.com,
 rajneesh.bhardwaj@amd.com, tzimmermann@suse.de, Ramesh.Errabolu@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.12 084/486] drm/amdgpu: adjust
 drm_firmware_drivers_only() handling
Date: Mon,  5 May 2025 18:32:40 -0400
Message-Id: <20250505223922.2682012-84-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505223922.2682012-1-sashal@kernel.org>
References: <20250505223922.2682012-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.26
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

From: Alex Deucher <alexander.deucher@amd.com>

[ Upstream commit e00e5c223878a60e391e5422d173c3382d378f87 ]

Move to probe so we can check the PCI device type and
only apply the drm_firmware_drivers_only() check for
PCI DISPLAY classes.  Also add a module parameter to
override the nomodeset kernel parameter as a workaround
for platforms that have this hardcoded on their kernel
command lines.

Reviewed-by: Kent Russell <kent.russell@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index a9eb0927a7664..e1d26a479ed87 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -172,6 +172,7 @@ uint amdgpu_sdma_phase_quantum = 32;
 char *amdgpu_disable_cu;
 char *amdgpu_virtual_display;
 bool enforce_isolation;
+int amdgpu_modeset = -1;
 
 /* Specifies the default granularity for SVM, used in buffer
  * migration and restoration of backing memory when handling
@@ -1037,6 +1038,13 @@ module_param_named(user_partt_mode, amdgpu_user_partt_mode, uint, 0444);
 module_param(enforce_isolation, bool, 0444);
 MODULE_PARM_DESC(enforce_isolation, "enforce process isolation between graphics and compute . enforce_isolation = on");
 
+/**
+ * DOC: modeset (int)
+ * Override nomodeset (1 = override, -1 = auto). The default is -1 (auto).
+ */
+MODULE_PARM_DESC(modeset, "Override nomodeset (1 = enable, -1 = auto)");
+module_param_named(modeset, amdgpu_modeset, int, 0444);
+
 /**
  * DOC: seamless (int)
  * Seamless boot will keep the image on the screen during the boot process.
@@ -2248,6 +2256,12 @@ static int amdgpu_pci_probe(struct pci_dev *pdev,
 	int ret, retry = 0, i;
 	bool supports_atomic = false;
 
+	if ((pdev->class >> 8) == PCI_CLASS_DISPLAY_VGA ||
+	    (pdev->class >> 8) == PCI_CLASS_DISPLAY_OTHER) {
+		if (drm_firmware_drivers_only() && amdgpu_modeset == -1)
+			return -EINVAL;
+	}
+
 	/* skip devices which are owned by radeon */
 	for (i = 0; i < ARRAY_SIZE(amdgpu_unsupported_pciidlist); i++) {
 		if (amdgpu_unsupported_pciidlist[i] == pdev->device)
-- 
2.39.5

