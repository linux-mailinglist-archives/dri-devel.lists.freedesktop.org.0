Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B02922E1B28
	for <lists+dri-devel@lfdr.de>; Wed, 23 Dec 2020 11:52:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED9FD6E041;
	Wed, 23 Dec 2020 10:51:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40E0F6E249
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Dec 2020 11:56:00 +0000 (UTC)
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4D0ZX46bZ1zM73H;
 Tue, 22 Dec 2020 19:55:00 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.498.0; Tue, 22 Dec 2020 19:55:51 +0800
From: Tian Tao <tiantao6@hisilicon.com>
To: <airlied@linux.ie>, <daniel@ffwll.ch>, <tzimmermann@suse.de>,
 <kraxel@redhat.com>, <alexander.deucher@amd.com>, <tglx@linutronix.de>
Subject: [PATCH] drm/hisilicon: Remove drm_dev_put in hibmc
Date: Tue, 22 Dec 2020 19:55:56 +0800
Message-ID: <1608638156-7879-1-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Wed, 23 Dec 2020 10:51:31 +0000
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hibmc use the devm_drm_dev_alloc function in hibmc_pci_probe, if
hibmc_pci_probe returns non-zero, devm_drm_dev_alloc will call
devm_drm_dev_init, which will call devm_drm_dev_init_release to
release drm_dev_put. There is no need for hibmc to call
drm_dev_put separately.

Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
---
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
index 7159018..0d4e902 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
@@ -332,13 +332,13 @@ static int hibmc_pci_probe(struct pci_dev *pdev,
 	ret = pcim_enable_device(pdev);
 	if (ret) {
 		drm_err(dev, "failed to enable pci device: %d\n", ret);
-		goto err_free;
+		goto err_return;
 	}
 
 	ret = hibmc_load(dev);
 	if (ret) {
 		drm_err(dev, "failed to load hibmc: %d\n", ret);
-		goto err_free;
+		goto err_return;
 	}
 
 	ret = drm_dev_register(dev, 0);
@@ -354,9 +354,7 @@ static int hibmc_pci_probe(struct pci_dev *pdev,
 
 err_unload:
 	hibmc_unload(dev);
-err_free:
-	drm_dev_put(dev);
-
+err_return:
 	return ret;
 }
 
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
