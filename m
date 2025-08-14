Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9B32B26C07
	for <lists+dri-devel@lfdr.de>; Thu, 14 Aug 2025 18:11:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9CE410E8AB;
	Thu, 14 Aug 2025 16:11:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="tydm61H8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0FB910E8AC
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 16:11:00 +0000 (UTC)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
 by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57EGAq8q1916363;
 Thu, 14 Aug 2025 11:10:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1755187852;
 bh=zNxFBetvcy3aVTCoqvvC2GPeFMAlHszkPcmJmnZNL2U=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=tydm61H8/ZRDrdubLCHh+jz62yx6nUrLynUbWBpiV+QyoDpR8mA/PRpJAdi7GgsGP
 NRcsMHCa7oaYauG1Q56ewVBoIn6c3F/LXHPJy4irNk877td5QfE8Zta0iPgYKsVWii
 aJ3bZaaelJPT+8uECJL5bE3rHL7II/P3ihVoD8k0=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
 by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57EGAqLh1823425
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
 Thu, 14 Aug 2025 11:10:52 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 14
 Aug 2025 11:10:51 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 14 Aug 2025 11:10:51 -0500
Received: from lelvem-mr06.itg.ti.com ([10.249.42.149])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57EGAndn4172380;
 Thu, 14 Aug 2025 11:10:51 -0500
From: Andrew Davis <afd@ti.com>
To: Gerd Hoffmann <kraxel@redhat.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Paul Cercueil <paul@crapouillou.net>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>, Daniel
 Vetter <daniel@ffwll.ch>
CC: <dri-devel@lists.freedesktop.org>, <linux-media@vger.kernel.org>,
 <linaro-mm-sig@lists.linaro.org>, <linux-kernel@vger.kernel.org>, Andrew
 Davis <afd@ti.com>
Subject: [PATCH v2 3/3] udmabuf: Use module_misc_device() to register this
 device
Date: Thu, 14 Aug 2025 11:10:49 -0500
Message-ID: <20250814161049.678672-4-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250814161049.678672-1-afd@ti.com>
References: <20250814161049.678672-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Now that we do not need to call dma_coerce_mask_and_coherent() on our
miscdevice device, use the module_misc_device() helper for registering
and module init/exit.

While here, add module description and license, modules built with W=1
warn if built without these.

Signed-off-by: Andrew Davis <afd@ti.com>
Acked-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 drivers/dma-buf/udmabuf.c | 24 +++---------------------
 1 file changed, 3 insertions(+), 21 deletions(-)

diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
index 8d71c3d72eb5e..d888e4d667c67 100644
--- a/drivers/dma-buf/udmabuf.c
+++ b/drivers/dma-buf/udmabuf.c
@@ -566,26 +566,8 @@ static struct miscdevice udmabuf_misc = {
 	.name           = "udmabuf",
 	.fops           = &udmabuf_fops,
 };
-
-static int __init udmabuf_dev_init(void)
-{
-	int ret;
-
-	ret = misc_register(&udmabuf_misc);
-	if (ret < 0) {
-		pr_err("Could not initialize udmabuf device\n");
-		return ret;
-	}
-
-	return 0;
-}
-
-static void __exit udmabuf_dev_exit(void)
-{
-	misc_deregister(&udmabuf_misc);
-}
-
-module_init(udmabuf_dev_init)
-module_exit(udmabuf_dev_exit)
+module_misc_device(udmabuf_misc);
 
 MODULE_AUTHOR("Gerd Hoffmann <kraxel@redhat.com>");
+MODULE_DESCRIPTION("Userspace memfd to DMA-BUF misc Driver");
+MODULE_LICENSE("GPL");
-- 
2.39.2

