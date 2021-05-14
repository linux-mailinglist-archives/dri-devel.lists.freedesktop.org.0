Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 247F8380535
	for <lists+dri-devel@lfdr.de>; Fri, 14 May 2021 10:28:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 712BB89D66;
	Fri, 14 May 2021 08:28:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A78D589D66
 for <dri-devel@lists.freedesktop.org>; Fri, 14 May 2021 08:28:22 +0000 (UTC)
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FhM6T6wQYz1BMBS;
 Fri, 14 May 2021 16:25:37 +0800 (CST)
Received: from DESKTOP-EFRLNPK.china.huawei.com (10.174.176.189) by
 DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server id
 14.3.498.0; Fri, 14 May 2021 16:28:12 +0800
From: Qiheng Lin <linqiheng@huawei.com>
To: <linqiheng@huawei.com>, VMware Graphics
 <linux-graphics-maintainer@vmware.com>, Roland Scheidegger
 <sroland@vmware.com>, Zack Rusin <zackr@vmware.com>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH -next] drm/vmwgfx: Fix return value check in
 vmw_setup_pci_resources()
Date: Fri, 14 May 2021 16:28:12 +0800
Message-ID: <20210514082812.1697-1-linqiheng@huawei.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.176.189]
X-CFilter-Loop: Reflected
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
Cc: Hulk Robot <hulkci@huawei.com>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In case of error, the function devm_ioremap() returns NULL pointer not ERR_PTR().
The IS_ERR() test in the return value check should be replaced with NULL test.
After that, the error code -ENOMEM should be returned.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Qiheng Lin <linqiheng@huawei.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
index 5cf3a5bf539f..6f5ea00973e0 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
@@ -719,10 +719,10 @@ static int vmw_setup_pci_resources(struct vmw_private *dev,
 		dev->rmmio = devm_ioremap(dev->drm.dev,
 					  rmmio_start,
 					  rmmio_size);
-		if (IS_ERR(dev->rmmio)) {
+		if (!dev->rmmio) {
 			DRM_ERROR("Failed mapping registers mmio memory.\n");
 			pci_release_regions(pdev);
-			return PTR_ERR(dev->rmmio);
+			return -ENOMEM;
 		}
 	} else if (pci_id == VMWGFX_PCI_ID_SVGA2) {
 		dev->io_start = pci_resource_start(pdev, 0);

