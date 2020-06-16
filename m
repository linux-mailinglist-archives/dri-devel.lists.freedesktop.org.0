Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A76F1FAB86
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jun 2020 10:43:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 743BE6E064;
	Tue, 16 Jun 2020 08:43:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2123F6E064;
 Tue, 16 Jun 2020 08:43:02 +0000 (UTC)
IronPort-SDR: ZJv6PeF/YEzzIA35Y9XP0xhbscEpQZOXQUSCSdg/RVO+V0z2AuMRsBtmYncI10HAFMUpD7ncjW
 kLVVopJ8COHA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2020 01:43:00 -0700
IronPort-SDR: ESwecSLyQfPyKt5v+QA7YVSN7oPk6dEwv7A7LD3l65xfCRDTw98JDvGguFbLjsPh4m0pT64k9+
 4LLFQ1luX1oA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,518,1583222400"; d="scan'208";a="449726556"
Received: from gklab-125-110.igk.intel.com ([10.91.125.110])
 by orsmga005.jf.intel.com with ESMTP; 16 Jun 2020 01:42:57 -0700
From: Piotr Stankiewicz <piotr.stankiewicz@intel.com>
To: Alex Deucher <alexander.deucher@amd.com>
Subject: [PATCH] drm/amdgpu: Simplify IRQ vector request logic
Date: Tue, 16 Jun 2020 10:42:41 +0200
Message-Id: <20200616084243.18544-1-piotr.stankiewicz@intel.com>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <CADnq5_N95PjqU4nMgZBL_PoNKk8ourb_k9HLGvR_RN5FeZ3tkg@mail.gmail.com>
References: <CADnq5_N95PjqU4nMgZBL_PoNKk8ourb_k9HLGvR_RN5FeZ3tkg@mail.gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, Aurabindo Pillai <mail@aurabindo.in>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Emily Deng <Emily.Deng@amd.com>,
 Piotr Stankiewicz <piotr.stankiewicz@intel.com>,
 dri-devel@lists.freedesktop.org, shaoyunl <shaoyun.liu@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

pci_alloc_irq_vectors() will handle fallback from MSI-X to MSI
internally, if necessary. So remove checks which determine if we are
dealing with MSI or MSI-X and rely on pci_alloc_irq_vectors() to do the
right thing.

Signed-off-by: Piotr Stankiewicz <piotr.stankiewicz@intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c
index 0cc4c67f95f7..2d68ad7d45d4 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c
@@ -248,17 +248,8 @@ int amdgpu_irq_init(struct amdgpu_device *adev)
 	adev->irq.msi_enabled = false;
 
 	if (amdgpu_msi_ok(adev)) {
-		int nvec = pci_msix_vec_count(adev->pdev);
-		unsigned int flags;
-
-		if (nvec <= 0) {
-			flags = PCI_IRQ_MSI;
-		} else {
-			flags = PCI_IRQ_MSI | PCI_IRQ_MSIX;
-		}
 		/* we only need one vector */
-		nvec = pci_alloc_irq_vectors(adev->pdev, 1, 1, flags);
-		if (nvec > 0) {
+		if (pci_alloc_irq_vectors(adev->pdev, 1, 1, PCI_IRQ_MSI | PCI_IRQ_MSIX) > 0) {
 			adev->irq.msi_enabled = true;
 			dev_dbg(adev->dev, "using MSI/MSI-X.\n");
 		}
-- 
2.17.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
