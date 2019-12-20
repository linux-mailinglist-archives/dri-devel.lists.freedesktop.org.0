Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DAEE41292C3
	for <lists+dri-devel@lfdr.de>; Mon, 23 Dec 2019 09:11:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DFC86E1F8;
	Mon, 23 Dec 2019 08:10:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 958 seconds by postgrey-1.36 at gabe;
 Fri, 20 Dec 2019 14:21:56 UTC
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F6FD6EC34;
 Fri, 20 Dec 2019 14:21:56 +0000 (UTC)
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 1E4A9BC1327BD4EB006A;
 Fri, 20 Dec 2019 22:05:54 +0800 (CST)
Received: from huawei.com (10.175.127.16) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.439.0; Fri, 20 Dec 2019
 22:05:46 +0800
From: wuxu.wu <wuxu.wu@huawei.com>
To: <airlied@linux.ie>, <daniel@ffwll.ch>, <dri-devel@lists.freedesktop.org>, 
 <bskeggs@redhat.com>
Subject: [PATCH] drm/nouveau/bios: fix incorrect kfree in platform_init
Date: Fri, 20 Dec 2019 22:05:26 +0800
Message-ID: <1576850726-5684-1-git-send-email-wuxu.wu@huawei.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.175.127.16]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Mon, 23 Dec 2019 08:10:46 +0000
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
Cc: hushiyuan@huawei.com, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, wuxu.wu@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

priv porinter could be free only when priv != null and priv->rom is null.
---
 drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowpci.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowpci.c b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowpci.c
index 9b91da0..d776e01 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowpci.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowpci.c
@@ -70,8 +70,9 @@ pcirom_init(struct nvkm_bios *bios, const char *name)
 			    (priv->rom = pci_map_rom(pdev, &priv->size))) {
 				priv->pdev = pdev;
 				return priv;
+			} else {
+			    kfree(priv);
 			}
-			kfree(priv);
 		}
 		pci_disable_rom(pdev);
 	}
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
