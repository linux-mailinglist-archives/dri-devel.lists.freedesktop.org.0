Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A4156C44BF
	for <lists+dri-devel@lfdr.de>; Wed, 22 Mar 2023 09:20:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4533010E03E;
	Wed, 22 Mar 2023 08:20:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 635 seconds by postgrey-1.36 at gabe;
 Tue, 21 Mar 2023 10:04:36 UTC
Received: from hust.edu.cn (unknown [202.114.0.240])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A94C510E085
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Mar 2023 10:04:36 +0000 (UTC)
Received: from liber-MS-7D42.. ([10.12.190.56])
 (user=gangecen@hust.edu.cn mech=LOGIN bits=0)
 by mx1.hust.edu.cn  with ESMTP id 32L9rEfp018165-32L9rEfq018165
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Tue, 21 Mar 2023 17:53:19 +0800
From: Gencen Gan <gangecen@hust.edu.cn>
To: Gerd Hoffmann <kraxel@redhat.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/bochs: replace ioremap with devm_ioremap to avoid immo
 leak
Date: Tue, 21 Mar 2023 17:52:16 +0800
Message-Id: <20230321095216.1306555-1-gangecen@hust.edu.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-FEAS-AUTH-USER: gangecen@hust.edu.cn
X-Mailman-Approved-At: Wed, 22 Mar 2023 08:20:06 +0000
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
Cc: linux-kernel@vger.kernel.org, Gan Gecen <gangecen@hust.edu.cn>,
 Dongliang Mu <dzm91@hust.edu.cn>, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org
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
Reviewed-by: Dongliang Mu <dzm91@hust.edu.cn>
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

