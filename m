Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2F947002EF
	for <lists+dri-devel@lfdr.de>; Fri, 12 May 2023 10:48:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1E1E10E620;
	Fri, 12 May 2023 08:48:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE10C10E1F6;
 Thu, 11 May 2023 13:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683810912; x=1715346912;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=d9xIs54oQTWCvDEA+EMA/CdJ+mLbvY7fU4ZQGfXX7Vs=;
 b=JeedUOQ7uoeKjgk43DUQDTehORE7Q5ooQPz8dSmJG+bUENcKpY3jvTZQ
 D1X9OWpcvmLSUIwcvhSkqvW0r9ELHu8by+C/DsF2WRVKwpp0jtvnLTaN4
 PuAA9FKK0gRAcsvWTYWBqf6fD3ujnANXaQaz0AVLZXUKVrmlM7apd5hFS
 pvUwajXRym0i/qsXzCO6MxOw4/4oT8zmkmWc0/l3maCf7qR2YAo8I7BQP
 U1t2aOVcbPd9VEM4XYdp2Jte9mMoBeKp3fF0YXo1dnRtC0566Ui/82UIc
 yGSR2Ed7QTk2mpDszbD622Upbz2VKRLrdrWoRWC/yyjninsWsqpnqwdgl w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="378619402"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; d="scan'208";a="378619402"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2023 06:15:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="650169622"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; d="scan'208";a="650169622"
Received: from jsanche3-mobl1.ger.corp.intel.com (HELO
 ijarvine-MOBL2.ger.corp.intel.com) ([10.252.39.112])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2023 06:15:07 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: linux-pci@vger.kernel.org, Bjorn Helgaas <helgaas@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
 Lukas Wunner <lukas@wunner.de>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH 05/17] drm/radeon: Use pcie_lnkctl{,
 2}_clear_and_set() for changing LNKCTL{, 2}
Date: Thu, 11 May 2023 16:14:29 +0300
Message-Id: <20230511131441.45704-6-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230511131441.45704-1-ilpo.jarvinen@linux.intel.com>
References: <20230511131441.45704-1-ilpo.jarvinen@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 12 May 2023 08:48:34 +0000
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
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Don't assume that only the driver would be accessing LNKCTL/LNKCTL2.
ASPM policy changes can trigger write to LNKCTL outside of driver's
control. And in the case of upstream (parent), the driver does not even
own the device it's changing the registers for.

Use pcie_lnkctl_clear_and_set() and pcie_lnkctl2_clear_and_set() which
do proper locking to avoid losing concurrent updates to the register
value.

Suggested-by: Lukas Wunner <lukas@wunner.de>
Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
 drivers/gpu/drm/radeon/cik.c | 71 ++++++++++-------------------------
 drivers/gpu/drm/radeon/si.c  | 72 ++++++++++--------------------------
 2 files changed, 40 insertions(+), 103 deletions(-)

diff --git a/drivers/gpu/drm/radeon/cik.c b/drivers/gpu/drm/radeon/cik.c
index 5819737c21c6..c592b3d68ae6 100644
--- a/drivers/gpu/drm/radeon/cik.c
+++ b/drivers/gpu/drm/radeon/cik.c
@@ -9534,17 +9534,8 @@ static void cik_pcie_gen3_enable(struct radeon_device *rdev)
 			u16 bridge_cfg2, gpu_cfg2;
 			u32 max_lw, current_lw, tmp;
 
-			pcie_capability_read_word(root, PCI_EXP_LNKCTL,
-						  &bridge_cfg);
-			pcie_capability_read_word(rdev->pdev, PCI_EXP_LNKCTL,
-						  &gpu_cfg);
-
-			tmp16 = bridge_cfg | PCI_EXP_LNKCTL_HAWD;
-			pcie_capability_write_word(root, PCI_EXP_LNKCTL, tmp16);
-
-			tmp16 = gpu_cfg | PCI_EXP_LNKCTL_HAWD;
-			pcie_capability_write_word(rdev->pdev, PCI_EXP_LNKCTL,
-						   tmp16);
+			pcie_lnkctl_clear_and_set(root, 0, PCI_EXP_LNKCTL_HAWD);
+			pcie_lnkctl_clear_and_set(rdev->pdev, 0, PCI_EXP_LNKCTL_HAWD);
 
 			tmp = RREG32_PCIE_PORT(PCIE_LC_STATUS1);
 			max_lw = (tmp & LC_DETECTED_LINK_WIDTH_MASK) >> LC_DETECTED_LINK_WIDTH_SHIFT;
@@ -9591,45 +9582,24 @@ static void cik_pcie_gen3_enable(struct radeon_device *rdev)
 				msleep(100);
 
 				/* linkctl */
-				pcie_capability_read_word(root, PCI_EXP_LNKCTL,
-							  &tmp16);
-				tmp16 &= ~PCI_EXP_LNKCTL_HAWD;
-				tmp16 |= (bridge_cfg & PCI_EXP_LNKCTL_HAWD);
-				pcie_capability_write_word(root, PCI_EXP_LNKCTL,
-							   tmp16);
-
-				pcie_capability_read_word(rdev->pdev,
-							  PCI_EXP_LNKCTL,
-							  &tmp16);
-				tmp16 &= ~PCI_EXP_LNKCTL_HAWD;
-				tmp16 |= (gpu_cfg & PCI_EXP_LNKCTL_HAWD);
-				pcie_capability_write_word(rdev->pdev,
-							   PCI_EXP_LNKCTL,
-							   tmp16);
+				pcie_lnkctl_clear_and_set(root, PCI_EXP_LNKCTL_HAWD,
+							 bridge_cfg & PCI_EXP_LNKCTL_HAWD);
+				pcie_lnkctl_clear_and_set(rdev->pdev, PCI_EXP_LNKCTL_HAWD,
+							 gpu_cfg & PCI_EXP_LNKCTL_HAWD);
 
 				/* linkctl2 */
-				pcie_capability_read_word(root, PCI_EXP_LNKCTL2,
-							  &tmp16);
-				tmp16 &= ~(PCI_EXP_LNKCTL2_ENTER_COMP |
-					   PCI_EXP_LNKCTL2_TX_MARGIN);
-				tmp16 |= (bridge_cfg2 &
-					  (PCI_EXP_LNKCTL2_ENTER_COMP |
-					   PCI_EXP_LNKCTL2_TX_MARGIN));
-				pcie_capability_write_word(root,
-							   PCI_EXP_LNKCTL2,
-							   tmp16);
-
-				pcie_capability_read_word(rdev->pdev,
-							  PCI_EXP_LNKCTL2,
-							  &tmp16);
-				tmp16 &= ~(PCI_EXP_LNKCTL2_ENTER_COMP |
-					   PCI_EXP_LNKCTL2_TX_MARGIN);
-				tmp16 |= (gpu_cfg2 &
-					  (PCI_EXP_LNKCTL2_ENTER_COMP |
-					   PCI_EXP_LNKCTL2_TX_MARGIN));
-				pcie_capability_write_word(rdev->pdev,
-							   PCI_EXP_LNKCTL2,
-							   tmp16);
+				pcie_lnkctl2_clear_and_set(root,
+							   PCI_EXP_LNKCTL2_ENTER_COMP |
+							   PCI_EXP_LNKCTL2_TX_MARGIN,
+							   bridge_cfg2 |
+							   (PCI_EXP_LNKCTL2_ENTER_COMP |
+							    PCI_EXP_LNKCTL2_TX_MARGIN));
+				pcie_lnkctl2_clear_and_set(rdev->pdev,
+							   PCI_EXP_LNKCTL2_ENTER_COMP |
+							   PCI_EXP_LNKCTL2_TX_MARGIN,
+							   gpu_cfg2 |
+							   (PCI_EXP_LNKCTL2_ENTER_COMP |
+							    PCI_EXP_LNKCTL2_TX_MARGIN));
 
 				tmp = RREG32_PCIE_PORT(PCIE_LC_CNTL4);
 				tmp &= ~LC_SET_QUIESCE;
@@ -9643,15 +9613,14 @@ static void cik_pcie_gen3_enable(struct radeon_device *rdev)
 	speed_cntl &= ~LC_FORCE_DIS_SW_SPEED_CHANGE;
 	WREG32_PCIE_PORT(PCIE_LC_SPEED_CNTL, speed_cntl);
 
-	pcie_capability_read_word(rdev->pdev, PCI_EXP_LNKCTL2, &tmp16);
-	tmp16 &= ~PCI_EXP_LNKCTL2_TLS;
+	tmp16 = 0;
 	if (speed_cap == PCIE_SPEED_8_0GT)
 		tmp16 |= PCI_EXP_LNKCTL2_TLS_8_0GT; /* gen3 */
 	else if (speed_cap == PCIE_SPEED_5_0GT)
 		tmp16 |= PCI_EXP_LNKCTL2_TLS_5_0GT; /* gen2 */
 	else
 		tmp16 |= PCI_EXP_LNKCTL2_TLS_2_5GT; /* gen1 */
-	pcie_capability_write_word(rdev->pdev, PCI_EXP_LNKCTL2, tmp16);
+	pcie_lnkctl2_clear_and_set(rdev->pdev, PCI_EXP_LNKCTL2_TLS, tmp16);
 
 	speed_cntl = RREG32_PCIE_PORT(PCIE_LC_SPEED_CNTL);
 	speed_cntl |= LC_INITIATE_LINK_SPEED_CHANGE;
diff --git a/drivers/gpu/drm/radeon/si.c b/drivers/gpu/drm/radeon/si.c
index 8d5e4b25609d..769464e34f9f 100644
--- a/drivers/gpu/drm/radeon/si.c
+++ b/drivers/gpu/drm/radeon/si.c
@@ -7131,17 +7131,8 @@ static void si_pcie_gen3_enable(struct radeon_device *rdev)
 			u16 bridge_cfg2, gpu_cfg2;
 			u32 max_lw, current_lw, tmp;
 
-			pcie_capability_read_word(root, PCI_EXP_LNKCTL,
-						  &bridge_cfg);
-			pcie_capability_read_word(rdev->pdev, PCI_EXP_LNKCTL,
-						  &gpu_cfg);
-
-			tmp16 = bridge_cfg | PCI_EXP_LNKCTL_HAWD;
-			pcie_capability_write_word(root, PCI_EXP_LNKCTL, tmp16);
-
-			tmp16 = gpu_cfg | PCI_EXP_LNKCTL_HAWD;
-			pcie_capability_write_word(rdev->pdev, PCI_EXP_LNKCTL,
-						   tmp16);
+			pcie_lnkctl_clear_and_set(root, 0, PCI_EXP_LNKCTL_HAWD);
+			pcie_lnkctl_clear_and_set(rdev->pdev, 0, PCI_EXP_LNKCTL_HAWD);
 
 			tmp = RREG32_PCIE(PCIE_LC_STATUS1);
 			max_lw = (tmp & LC_DETECTED_LINK_WIDTH_MASK) >> LC_DETECTED_LINK_WIDTH_SHIFT;
@@ -7188,46 +7179,24 @@ static void si_pcie_gen3_enable(struct radeon_device *rdev)
 				msleep(100);
 
 				/* linkctl */
-				pcie_capability_read_word(root, PCI_EXP_LNKCTL,
-							  &tmp16);
-				tmp16 &= ~PCI_EXP_LNKCTL_HAWD;
-				tmp16 |= (bridge_cfg & PCI_EXP_LNKCTL_HAWD);
-				pcie_capability_write_word(root,
-							   PCI_EXP_LNKCTL,
-							   tmp16);
-
-				pcie_capability_read_word(rdev->pdev,
-							  PCI_EXP_LNKCTL,
-							  &tmp16);
-				tmp16 &= ~PCI_EXP_LNKCTL_HAWD;
-				tmp16 |= (gpu_cfg & PCI_EXP_LNKCTL_HAWD);
-				pcie_capability_write_word(rdev->pdev,
-							   PCI_EXP_LNKCTL,
-							   tmp16);
+				pcie_lnkctl_clear_and_set(root, PCI_EXP_LNKCTL_HAWD,
+							  bridge_cfg & PCI_EXP_LNKCTL_HAWD);
+				pcie_lnkctl_clear_and_set(rdev->pdev, PCI_EXP_LNKCTL_HAWD,
+							  gpu_cfg & PCI_EXP_LNKCTL_HAWD);
 
 				/* linkctl2 */
-				pcie_capability_read_word(root, PCI_EXP_LNKCTL2,
-							  &tmp16);
-				tmp16 &= ~(PCI_EXP_LNKCTL2_ENTER_COMP |
-					   PCI_EXP_LNKCTL2_TX_MARGIN);
-				tmp16 |= (bridge_cfg2 &
-					  (PCI_EXP_LNKCTL2_ENTER_COMP |
-					   PCI_EXP_LNKCTL2_TX_MARGIN));
-				pcie_capability_write_word(root,
-							   PCI_EXP_LNKCTL2,
-							   tmp16);
-
-				pcie_capability_read_word(rdev->pdev,
-							  PCI_EXP_LNKCTL2,
-							  &tmp16);
-				tmp16 &= ~(PCI_EXP_LNKCTL2_ENTER_COMP |
-					   PCI_EXP_LNKCTL2_TX_MARGIN);
-				tmp16 |= (gpu_cfg2 &
-					  (PCI_EXP_LNKCTL2_ENTER_COMP |
-					   PCI_EXP_LNKCTL2_TX_MARGIN));
-				pcie_capability_write_word(rdev->pdev,
-							   PCI_EXP_LNKCTL2,
-							   tmp16);
+				pcie_lnkctl2_clear_and_set(root,
+							   PCI_EXP_LNKCTL2_ENTER_COMP |
+							   PCI_EXP_LNKCTL2_TX_MARGIN,
+							   bridge_cfg2 &
+							  (PCI_EXP_LNKCTL2_ENTER_COMP |
+							   PCI_EXP_LNKCTL2_TX_MARGIN));
+				pcie_lnkctl2_clear_and_set(rdev->pdev,
+							   PCI_EXP_LNKCTL2_ENTER_COMP |
+							   PCI_EXP_LNKCTL2_TX_MARGIN,
+							   gpu_cfg2 &
+							  (PCI_EXP_LNKCTL2_ENTER_COMP |
+							   PCI_EXP_LNKCTL2_TX_MARGIN));
 
 				tmp = RREG32_PCIE_PORT(PCIE_LC_CNTL4);
 				tmp &= ~LC_SET_QUIESCE;
@@ -7241,15 +7210,14 @@ static void si_pcie_gen3_enable(struct radeon_device *rdev)
 	speed_cntl &= ~LC_FORCE_DIS_SW_SPEED_CHANGE;
 	WREG32_PCIE_PORT(PCIE_LC_SPEED_CNTL, speed_cntl);
 
-	pcie_capability_read_word(rdev->pdev, PCI_EXP_LNKCTL2, &tmp16);
-	tmp16 &= ~PCI_EXP_LNKCTL2_TLS;
+	tmp16 = 0;
 	if (speed_cap == PCIE_SPEED_8_0GT)
 		tmp16 |= PCI_EXP_LNKCTL2_TLS_8_0GT; /* gen3 */
 	else if (speed_cap == PCIE_SPEED_5_0GT)
 		tmp16 |= PCI_EXP_LNKCTL2_TLS_5_0GT; /* gen2 */
 	else
 		tmp16 |= PCI_EXP_LNKCTL2_TLS_2_5GT; /* gen1 */
-	pcie_capability_write_word(rdev->pdev, PCI_EXP_LNKCTL2, tmp16);
+	pcie_lnkctl2_clear_and_set(rdev->pdev, PCI_EXP_LNKCTL2_TLS, tmp16);
 
 	speed_cntl = RREG32_PCIE_PORT(PCIE_LC_SPEED_CNTL);
 	speed_cntl |= LC_INITIATE_LINK_SPEED_CHANGE;
-- 
2.30.2

