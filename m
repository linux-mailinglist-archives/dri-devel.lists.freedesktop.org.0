Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CAF41ECEDF
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jun 2020 13:48:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7711F89938;
	Wed,  3 Jun 2020 11:48:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C313589938;
 Wed,  3 Jun 2020 11:48:08 +0000 (UTC)
IronPort-SDR: xNKwsja4vozUUtkmwms539Ykofmbu6aAfbgntSU0u1mp4lSU4UMVdCM4BKQuMVvMga2Eb9jax0
 4ECw+9Mvs7jA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2020 04:48:08 -0700
IronPort-SDR: xXYWtr/kEXDZu+jrLaPS+U4SfPyMrwiW2AyCAfH434gXKsVZc5Pcqvl1FGLYNTu8aFWuS3ueXz
 /+5EBJfP76eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,467,1583222400"; d="scan'208";a="416537955"
Received: from gklab-125-110.igk.intel.com ([10.91.125.110])
 by orsmga004.jf.intel.com with ESMTP; 03 Jun 2020 04:48:04 -0700
From: Piotr Stankiewicz <piotr.stankiewicz@intel.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
	linux-pci@vger.kernel.org
Subject: [PATCH v2 07/15] drm/amdgpu: Use PCI_IRQ_MSI_TYPES where appropriate
Date: Wed,  3 Jun 2020 13:47:56 +0200
Message-Id: <20200603114758.13295-1-piotr.stankiewicz@intel.com>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20200603114212.12525-1-piotr.stankiewicz@intel.com>
References: <20200603114212.12525-1-piotr.stankiewicz@intel.com>
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Emily Deng <Emily.Deng@amd.com>,
 Piotr Stankiewicz <piotr.stankiewicz@intel.com>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 shaoyunl <shaoyun.liu@amd.com>, Sam Ravnborg <sam@ravnborg.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Seeing as there is shorthand available to use when asking for any type
of interrupt, or any type of message signalled interrupt, leverage it.

Signed-off-by: Piotr Stankiewicz <piotr.stankiewicz@intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c
index 5ed4227f304b..2588dd1015db 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c
@@ -249,15 +249,10 @@ int amdgpu_irq_init(struct amdgpu_device *adev)
 
 	if (amdgpu_msi_ok(adev)) {
 		int nvec = pci_msix_vec_count(adev->pdev);
-		unsigned int flags;
 
-		if (nvec <= 0) {
-			flags = PCI_IRQ_MSI;
-		} else {
-			flags = PCI_IRQ_MSI | PCI_IRQ_MSIX;
-		}
 		/* we only need one vector */
-		nvec = pci_alloc_irq_vectors(adev->pdev, 1, 1, flags);
+		nvec = pci_alloc_irq_vectors(adev->pdev, 1, 1,
+					     PCI_IRQ_MSI_TYPES);
 		if (nvec > 0) {
 			adev->irq.msi_enabled = true;
 			dev_dbg(adev->dev, "amdgpu: using MSI/MSI-X.\n");
-- 
2.17.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
