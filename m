Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D92BF7002F5
	for <lists+dri-devel@lfdr.de>; Fri, 12 May 2023 10:49:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3124A10E641;
	Fri, 12 May 2023 08:48:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F2C810E1F6;
 Thu, 11 May 2023 13:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683810908; x=1715346908;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=u7xUvlsA5P4gtzwST7F7+pgPTnNFMN6i6koTFJ8FbGY=;
 b=fIZJrdBLWVZPpgkIsbuyVh99dM4yLfse4B22ald60HYCawk+TctBhAYP
 /7jMI/tmyfF26J8cyWcT+Tw2Gi8x3X50xCvAX2He7XGiScZ/kmcrOVixu
 yRhI+CRP/6EKI5fJHgBqUecIZg1FD250ozUSMYvSeyqywjbw7SHUZ00Hy
 tJ5BPvAZX2EQAobIeOvj0F2Wp10jlhLsQSxz+mL1J+Ctp4BcrOhZmSNYN
 fZaZY7EmRn7TltKYb1emO6gQqu5O+1K4M9KhFm9RnHHTmptkbnbePowBV
 UYzUDUU+b/Ds2A9flpH1dj7YJQoUpdpMnQ9aZDL4Ey0qsDCW7Y66OLXUl Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="378619380"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; d="scan'208";a="378619380"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2023 06:15:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="650169558"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; d="scan'208";a="650169558"
Received: from jsanche3-mobl1.ger.corp.intel.com (HELO
 ijarvine-MOBL2.ger.corp.intel.com) ([10.252.39.112])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2023 06:15:02 -0700
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
Subject: [PATCH 04/17] drm/amdgpu: Use pcie_lnkctl{,
 2}_clear_and_set() for changing LNKCTL{, 2}
Date: Thu, 11 May 2023 16:14:28 +0300
Message-Id: <20230511131441.45704-5-ilpo.jarvinen@linux.intel.com>
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
 drivers/gpu/drm/amd/amdgpu/cik.c | 72 +++++++++----------------------
 drivers/gpu/drm/amd/amdgpu/si.c  | 74 +++++++++-----------------------
 2 files changed, 41 insertions(+), 105 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/cik.c b/drivers/gpu/drm/amd/amdgpu/cik.c
index de6d10390ab2..f9f2c28c7125 100644
--- a/drivers/gpu/drm/amd/amdgpu/cik.c
+++ b/drivers/gpu/drm/amd/amdgpu/cik.c
@@ -1574,17 +1574,8 @@ static void cik_pcie_gen3_enable(struct amdgpu_device *adev)
 			u16 bridge_cfg2, gpu_cfg2;
 			u32 max_lw, current_lw, tmp;
 
-			pcie_capability_read_word(root, PCI_EXP_LNKCTL,
-						  &bridge_cfg);
-			pcie_capability_read_word(adev->pdev, PCI_EXP_LNKCTL,
-						  &gpu_cfg);
-
-			tmp16 = bridge_cfg | PCI_EXP_LNKCTL_HAWD;
-			pcie_capability_write_word(root, PCI_EXP_LNKCTL, tmp16);
-
-			tmp16 = gpu_cfg | PCI_EXP_LNKCTL_HAWD;
-			pcie_capability_write_word(adev->pdev, PCI_EXP_LNKCTL,
-						   tmp16);
+			pcie_lnkctl_clear_and_set(root, 0, PCI_EXP_LNKCTL_HAWD);
+			pcie_lnkctl_clear_and_set(adev->pdev, 0, PCI_EXP_LNKCTL_HAWD);
 
 			tmp = RREG32_PCIE(ixPCIE_LC_STATUS1);
 			max_lw = (tmp & PCIE_LC_STATUS1__LC_DETECTED_LINK_WIDTH_MASK) >>
@@ -1637,45 +1628,24 @@ static void cik_pcie_gen3_enable(struct amdgpu_device *adev)
 				msleep(100);
 
 				/* linkctl */
-				pcie_capability_read_word(root, PCI_EXP_LNKCTL,
-							  &tmp16);
-				tmp16 &= ~PCI_EXP_LNKCTL_HAWD;
-				tmp16 |= (bridge_cfg & PCI_EXP_LNKCTL_HAWD);
-				pcie_capability_write_word(root, PCI_EXP_LNKCTL,
-							   tmp16);
-
-				pcie_capability_read_word(adev->pdev,
-							  PCI_EXP_LNKCTL,
-							  &tmp16);
-				tmp16 &= ~PCI_EXP_LNKCTL_HAWD;
-				tmp16 |= (gpu_cfg & PCI_EXP_LNKCTL_HAWD);
-				pcie_capability_write_word(adev->pdev,
-							   PCI_EXP_LNKCTL,
-							   tmp16);
+				pcie_lnkctl_clear_and_set(root, PCI_EXP_LNKCTL_HAWD,
+							  bridge_cfg & PCI_EXP_LNKCTL_HAWD);
+				pcie_lnkctl_clear_and_set(adev->pdev, PCI_EXP_LNKCTL_HAWD,
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
-				pcie_capability_read_word(adev->pdev,
-							  PCI_EXP_LNKCTL2,
-							  &tmp16);
-				tmp16 &= ~(PCI_EXP_LNKCTL2_ENTER_COMP |
-					   PCI_EXP_LNKCTL2_TX_MARGIN);
-				tmp16 |= (gpu_cfg2 &
-					  (PCI_EXP_LNKCTL2_ENTER_COMP |
-					   PCI_EXP_LNKCTL2_TX_MARGIN));
-				pcie_capability_write_word(adev->pdev,
-							   PCI_EXP_LNKCTL2,
-							   tmp16);
+				pcie_lnkctl2_clear_and_set(root,
+							   PCI_EXP_LNKCTL2_ENTER_COMP |
+							   PCI_EXP_LNKCTL2_TX_MARGIN,
+							   bridge_cfg2 &
+							   (PCI_EXP_LNKCTL2_ENTER_COMP |
+							    PCI_EXP_LNKCTL2_TX_MARGIN));
+				pcie_lnkctl2_clear_and_set(adev->pdev,
+							   PCI_EXP_LNKCTL2_ENTER_COMP |
+							   PCI_EXP_LNKCTL2_TX_MARGIN,
+							   gpu_cfg2 &
+							   (PCI_EXP_LNKCTL2_ENTER_COMP |
+							    PCI_EXP_LNKCTL2_TX_MARGIN));
 
 				tmp = RREG32_PCIE(ixPCIE_LC_CNTL4);
 				tmp &= ~PCIE_LC_CNTL4__LC_SET_QUIESCE_MASK;
@@ -1690,16 +1660,14 @@ static void cik_pcie_gen3_enable(struct amdgpu_device *adev)
 	speed_cntl &= ~PCIE_LC_SPEED_CNTL__LC_FORCE_DIS_SW_SPEED_CHANGE_MASK;
 	WREG32_PCIE(ixPCIE_LC_SPEED_CNTL, speed_cntl);
 
-	pcie_capability_read_word(adev->pdev, PCI_EXP_LNKCTL2, &tmp16);
-	tmp16 &= ~PCI_EXP_LNKCTL2_TLS;
-
+	tmp16 = 0;
 	if (adev->pm.pcie_gen_mask & CAIL_PCIE_LINK_SPEED_SUPPORT_GEN3)
 		tmp16 |= PCI_EXP_LNKCTL2_TLS_8_0GT; /* gen3 */
 	else if (adev->pm.pcie_gen_mask & CAIL_PCIE_LINK_SPEED_SUPPORT_GEN2)
 		tmp16 |= PCI_EXP_LNKCTL2_TLS_5_0GT; /* gen2 */
 	else
 		tmp16 |= PCI_EXP_LNKCTL2_TLS_2_5GT; /* gen1 */
-	pcie_capability_write_word(adev->pdev, PCI_EXP_LNKCTL2, tmp16);
+	pcie_lnkctl2_clear_and_set(adev->pdev, PCI_EXP_LNKCTL2_TLS, tmp16);
 
 	speed_cntl = RREG32_PCIE(ixPCIE_LC_SPEED_CNTL);
 	speed_cntl |= PCIE_LC_SPEED_CNTL__LC_INITIATE_LINK_SPEED_CHANGE_MASK;
diff --git a/drivers/gpu/drm/amd/amdgpu/si.c b/drivers/gpu/drm/amd/amdgpu/si.c
index 7f99e130acd0..e60174d0dfb8 100644
--- a/drivers/gpu/drm/amd/amdgpu/si.c
+++ b/drivers/gpu/drm/amd/amdgpu/si.c
@@ -2276,17 +2276,8 @@ static void si_pcie_gen3_enable(struct amdgpu_device *adev)
 			u16 bridge_cfg2, gpu_cfg2;
 			u32 max_lw, current_lw, tmp;
 
-			pcie_capability_read_word(root, PCI_EXP_LNKCTL,
-						  &bridge_cfg);
-			pcie_capability_read_word(adev->pdev, PCI_EXP_LNKCTL,
-						  &gpu_cfg);
-
-			tmp16 = bridge_cfg | PCI_EXP_LNKCTL_HAWD;
-			pcie_capability_write_word(root, PCI_EXP_LNKCTL, tmp16);
-
-			tmp16 = gpu_cfg | PCI_EXP_LNKCTL_HAWD;
-			pcie_capability_write_word(adev->pdev, PCI_EXP_LNKCTL,
-						   tmp16);
+			pcie_lnkctl_clear_and_set(root, 0, PCI_EXP_LNKCTL_HAWD);
+			pcie_lnkctl_clear_and_set(adev->pdev, 0, PCI_EXP_LNKCTL_HAWD);
 
 			tmp = RREG32_PCIE(PCIE_LC_STATUS1);
 			max_lw = (tmp & LC_DETECTED_LINK_WIDTH_MASK) >> LC_DETECTED_LINK_WIDTH_SHIFT;
@@ -2331,44 +2322,23 @@ static void si_pcie_gen3_enable(struct amdgpu_device *adev)
 
 				mdelay(100);
 
-				pcie_capability_read_word(root, PCI_EXP_LNKCTL,
-							  &tmp16);
-				tmp16 &= ~PCI_EXP_LNKCTL_HAWD;
-				tmp16 |= (bridge_cfg & PCI_EXP_LNKCTL_HAWD);
-				pcie_capability_write_word(root, PCI_EXP_LNKCTL,
-							   tmp16);
-
-				pcie_capability_read_word(adev->pdev,
-							  PCI_EXP_LNKCTL,
-							  &tmp16);
-				tmp16 &= ~PCI_EXP_LNKCTL_HAWD;
-				tmp16 |= (gpu_cfg & PCI_EXP_LNKCTL_HAWD);
-				pcie_capability_write_word(adev->pdev,
-							   PCI_EXP_LNKCTL,
-							   tmp16);
-
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
-				pcie_capability_read_word(adev->pdev,
-							  PCI_EXP_LNKCTL2,
-							  &tmp16);
-				tmp16 &= ~(PCI_EXP_LNKCTL2_ENTER_COMP |
-					   PCI_EXP_LNKCTL2_TX_MARGIN);
-				tmp16 |= (gpu_cfg2 &
-					  (PCI_EXP_LNKCTL2_ENTER_COMP |
-					   PCI_EXP_LNKCTL2_TX_MARGIN));
-				pcie_capability_write_word(adev->pdev,
-							   PCI_EXP_LNKCTL2,
-							   tmp16);
+				pcie_lnkctl_clear_and_set(root, PCI_EXP_LNKCTL_HAWD,
+							  bridge_cfg & PCI_EXP_LNKCTL_HAWD);
+				pcie_lnkctl_clear_and_set(adev->pdev, PCI_EXP_LNKCTL_HAWD,
+							  gpu_cfg & PCI_EXP_LNKCTL_HAWD);
+
+				pcie_lnkctl2_clear_and_set(root,
+							   PCI_EXP_LNKCTL2_ENTER_COMP |
+							   PCI_EXP_LNKCTL2_TX_MARGIN,
+							   bridge_cfg2 &
+							   (PCI_EXP_LNKCTL2_ENTER_COMP |
+							    PCI_EXP_LNKCTL2_TX_MARGIN));
+				pcie_lnkctl2_clear_and_set(adev->pdev,
+							   PCI_EXP_LNKCTL2_ENTER_COMP |
+							   PCI_EXP_LNKCTL2_TX_MARGIN,
+							   gpu_cfg2 &
+							   (PCI_EXP_LNKCTL2_ENTER_COMP |
+							    PCI_EXP_LNKCTL2_TX_MARGIN));
 
 				tmp = RREG32_PCIE_PORT(PCIE_LC_CNTL4);
 				tmp &= ~LC_SET_QUIESCE;
@@ -2381,16 +2351,14 @@ static void si_pcie_gen3_enable(struct amdgpu_device *adev)
 	speed_cntl &= ~LC_FORCE_DIS_SW_SPEED_CHANGE;
 	WREG32_PCIE_PORT(PCIE_LC_SPEED_CNTL, speed_cntl);
 
-	pcie_capability_read_word(adev->pdev, PCI_EXP_LNKCTL2, &tmp16);
-	tmp16 &= ~PCI_EXP_LNKCTL2_TLS;
-
+	tmp16 = 0;
 	if (adev->pm.pcie_gen_mask & CAIL_PCIE_LINK_SPEED_SUPPORT_GEN3)
 		tmp16 |= PCI_EXP_LNKCTL2_TLS_8_0GT; /* gen3 */
 	else if (adev->pm.pcie_gen_mask & CAIL_PCIE_LINK_SPEED_SUPPORT_GEN2)
 		tmp16 |= PCI_EXP_LNKCTL2_TLS_5_0GT; /* gen2 */
 	else
 		tmp16 |= PCI_EXP_LNKCTL2_TLS_2_5GT; /* gen1 */
-	pcie_capability_write_word(adev->pdev, PCI_EXP_LNKCTL2, tmp16);
+	pcie_lnkctl2_clear_and_set(adev->pdev, PCI_EXP_LNKCTL2_TLS, tmp16);
 
 	speed_cntl = RREG32_PCIE_PORT(PCIE_LC_SPEED_CNTL);
 	speed_cntl |= LC_INITIATE_LINK_SPEED_CHANGE;
-- 
2.30.2

