Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F02396D3342
	for <lists+dri-devel@lfdr.de>; Sat,  1 Apr 2023 20:57:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33F3710E05C;
	Sat,  1 Apr 2023 18:57:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hust.edu.cn (unknown [202.114.0.240])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE3D010E05C
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Apr 2023 18:57:06 +0000 (UTC)
Received: from liber-MS-7D42.. ([10.12.190.56])
 (user=gangecen@hust.edu.cn mech=LOGIN bits=0)
 by mx1.hust.edu.cn  with ESMTP id 331ItuHl030779-331ItuHm030779
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Sun, 2 Apr 2023 02:56:01 +0800
From: Gencen Gan <gangecen@hust.edu.cn>
To: Gerd Hoffmann <kraxel@redhat.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2] drm/bochs: fix ioremap leak of mmio in bochs
Date: Sun,  2 Apr 2023 02:55:43 +0800
Message-Id: <20230401185544.3027703-1-gangecen@hust.edu.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-FEAS-AUTH-USER: gangecen@hust.edu.cn
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
Cc: Gan Gecen <gangecen@hust.edu.cn>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Gan Gecen <gangecen@hust.edu.cn>

Smatch reports:

	drivers/gpu/drm/tiny/bochs.c:290 bochs_hw_init()
	warn: 'bochs->mmio' from ioremap() not released on
	lines: 246,250,254.

In the function bochs_load() that calls bochs_hw_init()
only, if bochs_hw_init(dev) returns -ENODEV(-19), it
will jumps to err_free_dev instead of err_hw_fini, so
bochs->mmio won't be freed.

We just need to release mmio in the corresponding error
handling.

Signed-off-by: Gan Gecen <gangecen@hust.edu.cn>
---
v1->v2: Change the strategy for fixing this
issue to manually release mmio by iounmap 
instead of changing ioremap to devm_ioremap.
 drivers/gpu/drm/tiny/bochs.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tiny/bochs.c b/drivers/gpu/drm/tiny/bochs.c
index 024346054c70..46abed11c163 100644
--- a/drivers/gpu/drm/tiny/bochs.c
+++ b/drivers/gpu/drm/tiny/bochs.c
@@ -243,15 +243,20 @@ static int bochs_hw_init(struct drm_device *dev)
 		* 64 * 1024;
 	if ((id & 0xfff0) != VBE_DISPI_ID0) {
 		DRM_ERROR("ID mismatch\n");
+		iounmap(bochs->mmio);
 		return -ENODEV;
 	}
 
-	if ((pdev->resource[0].flags & IORESOURCE_MEM) == 0)
+	if ((pdev->resource[0].flags & IORESOURCE_MEM) == 0) {
+		iounmap(bochs->mmio);
 		return -ENODEV;
+	}
 	addr = pci_resource_start(pdev, 0);
 	size = pci_resource_len(pdev, 0);
-	if (addr == 0)
+	if (addr == 0) {
+		iounmap(bochs->mmio);
 		return -ENODEV;
+	}
 	if (size != mem) {
 		DRM_ERROR("Size mismatch: pci=%ld, bochs=%ld\n",
 			size, mem);
-- 
2.34.1

