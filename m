Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE8286CD186
	for <lists+dri-devel@lfdr.de>; Wed, 29 Mar 2023 07:27:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6609B10E16F;
	Wed, 29 Mar 2023 05:27:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hust.edu.cn (unknown [202.114.0.240])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29BD110E16F
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Mar 2023 05:27:49 +0000 (UTC)
Received: from liber-MS-7D42.. ([10.12.190.56])
 (user=gangecen@hust.edu.cn mech=LOGIN bits=0)
 by mx1.hust.edu.cn  with ESMTP id 32T5R4WY022782-32T5R4WZ022782
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Wed, 29 Mar 2023 13:27:10 +0800
From: Gencen Gan <gangecen@hust.edu.cn>
To: Gerd Hoffmann <kraxel@redhat.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PING PATCH] drm/bochs: replace ioremap with devm_ioremap to avoid
 immo leak
Date: Wed, 29 Mar 2023 13:26:55 +0800
Message-Id: <20230329052655.3487616-1-gangecen@hust.edu.cn>
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
bochs->immo won't be freed.

We would prefer to replace ioremap with devm_ioremap
to avoid adding lengthy error handling. The function 
`devm_ioremap` will automatically release the allocated
resources after use.

Signed-off-by: Gan Gecen <gangecen@hust.edu.cn>
---
 drivers/gpu/drm/tiny/bochs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tiny/bochs.c b/drivers/gpu/drm/tiny/bochs.c
index 024346054c70..0d7e119a732f 100644
--- a/drivers/gpu/drm/tiny/bochs.c
+++ b/drivers/gpu/drm/tiny/bochs.c
@@ -223,7 +223,7 @@ static int bochs_hw_init(struct drm_device *dev)
 		}
 		ioaddr = pci_resource_start(pdev, 2);
 		iosize = pci_resource_len(pdev, 2);
-		bochs->mmio = ioremap(ioaddr, iosize);
+		bochs->mmio = devm_ioremap(&pdev->dev, ioaddr, iosize);
 		if (bochs->mmio == NULL) {
 			DRM_ERROR("Cannot map mmio region\n");
 			return -ENOMEM;
-- 
2.34.1

