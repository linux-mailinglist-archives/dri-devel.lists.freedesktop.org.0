Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C868252C4
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jan 2024 12:26:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38D5410E5A5;
	Fri,  5 Jan 2024 11:26:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1C2410E5A5;
 Fri,  5 Jan 2024 11:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704453988; x=1735989988;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Tt0hr44xsfolQHhOcEQ5H8NjkPqTdHCgyfspbkFMmI0=;
 b=RNE4iCV7IEw98jRXZAb5aRjNIh22GdRvaZ2HFow+ovEtdIr1QEPnSVJj
 9Sl5P53e0iBC9TOjOQ6KSntaFhHZ3Zm2wf/5h6CZKm5KgZSOJxhzbFS/M
 ZTQAl/I096KbWtTXxcK4Y1RwC02dLeaqNZQ2bn0vBZ0os9UJGdDFGyp8e
 nhvKSBiUKJmVOw21KIFKND1lH7yeSvtKiKx/z5PZUWH2SPkRURC6ELb3A
 AuG9GcdPUceceLuyMev1ds9MgKT08KtJc/nXDRiwve1iInWOMZLebIwc6
 Sc4RiUpZZqBJoc/BO5yeYGf5m8YwWmwl1m3k26BRdRHZQXU0bjuxQEgbx w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="483662421"
X-IronPort-AV: E=Sophos;i="6.04,333,1695711600"; d="scan'208";a="483662421"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2024 03:26:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="730447507"
X-IronPort-AV: E=Sophos;i="6.04,333,1695711600"; d="scan'208";a="730447507"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost)
 ([10.246.32.38])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2024 03:26:19 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Rob Herring <robh@kernel.org>,
 =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
 Lukas Wunner <lukas@wunner.de>, Alexandru Gagniuc <mr.nuke.me@gmail.com>,
 Krishna chaitanya chundru <quic_krichai@quicinc.com>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-pm@vger.kernel.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/8] drm/radeon: Use RMW accessors for changing LNKCTL2
Date: Fri,  5 Jan 2024 13:25:41 +0200
Message-Id: <20240105112547.7301-3-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240105112547.7301-1-ilpo.jarvinen@linux.intel.com>
References: <20240105112547.7301-1-ilpo.jarvinen@linux.intel.com>
MIME-Version: 1.0
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
Cc: Alex Deucher <alexdeucher@gmail.com>,
 =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Zhang Rui <rui.zhang@intel.com>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Amit Kucheria <amitk@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Don't assume that only the driver would be accessing LNKCTL2. In the
case of upstream (parent), the driver does not even own the device it's
changing the registers for.

Use RMW capability accessors which do proper locking to avoid losing
concurrent updates to the register value. This change is also useful as
a cleanup.

Suggested-by: Lukas Wunner <lukas@wunner.de>
Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
 drivers/gpu/drm/radeon/cik.c | 40 ++++++++++++++----------------------
 drivers/gpu/drm/radeon/si.c  | 40 ++++++++++++++----------------------
 2 files changed, 30 insertions(+), 50 deletions(-)

diff --git a/drivers/gpu/drm/radeon/cik.c b/drivers/gpu/drm/radeon/cik.c
index 10be30366c2b..b5e96a8fc2c1 100644
--- a/drivers/gpu/drm/radeon/cik.c
+++ b/drivers/gpu/drm/radeon/cik.c
@@ -9592,28 +9592,18 @@ static void cik_pcie_gen3_enable(struct radeon_device *rdev)
 								   PCI_EXP_LNKCTL_HAWD);
 
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
+				pcie_capability_clear_and_set_word(root, PCI_EXP_LNKCTL2,
+								   PCI_EXP_LNKCTL2_ENTER_COMP |
+								   PCI_EXP_LNKCTL2_TX_MARGIN,
+								   bridge_cfg2 |
+								   (PCI_EXP_LNKCTL2_ENTER_COMP |
+								    PCI_EXP_LNKCTL2_TX_MARGIN));
+				pcie_capability_clear_and_set_word(rdev->pdev, PCI_EXP_LNKCTL2,
+								   PCI_EXP_LNKCTL2_ENTER_COMP |
+								   PCI_EXP_LNKCTL2_TX_MARGIN,
+								   gpu_cfg2 |
+								   (PCI_EXP_LNKCTL2_ENTER_COMP |
+								    PCI_EXP_LNKCTL2_TX_MARGIN));
 
 				tmp = RREG32_PCIE_PORT(PCIE_LC_CNTL4);
 				tmp &= ~LC_SET_QUIESCE;
@@ -9627,15 +9617,15 @@ static void cik_pcie_gen3_enable(struct radeon_device *rdev)
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
+	pcie_capability_clear_and_set_word(rdev->pdev, PCI_EXP_LNKCTL2,
+					   PCI_EXP_LNKCTL2_TLS, tmp16);
 
 	speed_cntl = RREG32_PCIE_PORT(PCIE_LC_SPEED_CNTL);
 	speed_cntl |= LC_INITIATE_LINK_SPEED_CHANGE;
diff --git a/drivers/gpu/drm/radeon/si.c b/drivers/gpu/drm/radeon/si.c
index a91012447b56..32871ca09a0f 100644
--- a/drivers/gpu/drm/radeon/si.c
+++ b/drivers/gpu/drm/radeon/si.c
@@ -7189,28 +7189,18 @@ static void si_pcie_gen3_enable(struct radeon_device *rdev)
 								   PCI_EXP_LNKCTL_HAWD);
 
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
+				pcie_capability_clear_and_set_word(root, PCI_EXP_LNKCTL2,
+								   PCI_EXP_LNKCTL2_ENTER_COMP |
+								   PCI_EXP_LNKCTL2_TX_MARGIN,
+								   bridge_cfg2 &
+								   (PCI_EXP_LNKCTL2_ENTER_COMP |
+								    PCI_EXP_LNKCTL2_TX_MARGIN));
+				pcie_capability_clear_and_set_word(rdev->pdev, PCI_EXP_LNKCTL2,
+								   PCI_EXP_LNKCTL2_ENTER_COMP |
+								   PCI_EXP_LNKCTL2_TX_MARGIN,
+								   gpu_cfg2 &
+								   (PCI_EXP_LNKCTL2_ENTER_COMP |
+								    PCI_EXP_LNKCTL2_TX_MARGIN));
 
 				tmp = RREG32_PCIE_PORT(PCIE_LC_CNTL4);
 				tmp &= ~LC_SET_QUIESCE;
@@ -7224,15 +7214,15 @@ static void si_pcie_gen3_enable(struct radeon_device *rdev)
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
+	pcie_capability_clear_and_set_word(rdev->pdev, PCI_EXP_LNKCTL2,
+					   PCI_EXP_LNKCTL2_TLS, tmp16);
 
 	speed_cntl = RREG32_PCIE_PORT(PCIE_LC_SPEED_CNTL);
 	speed_cntl |= LC_INITIATE_LINK_SPEED_CHANGE;
-- 
2.39.2

