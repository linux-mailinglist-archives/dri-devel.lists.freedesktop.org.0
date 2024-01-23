Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1F5C839BEE
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jan 2024 23:13:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFF5610E49A;
	Tue, 23 Jan 2024 22:12:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7F0710E52F
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jan 2024 22:12:37 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 40NMCUrm016652;
 Tue, 23 Jan 2024 16:12:30 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1706047950;
 bh=sknuwzcV0wPaLHOK1zr7w6OmYOJwUVklzNLaSRJo1ZQ=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=p2IuT1J44N91rtMKoKXS2hMU8xPdWjDirWcLgVWfPPoBCLE8OfzpWJecTPL6kleDL
 fmfJ7ZfEyGcsBR7f8SIa5yd+Gn05Nj76Ujr9VdRG4CAwCCDaVKM9I5COFWjVx0InjB
 WK5h3efgJwLsSrz8usrwjOjK24LYwrnkovFdtkpA=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 40NMCUcx077867
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 23 Jan 2024 16:12:30 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 23
 Jan 2024 16:12:30 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 23 Jan 2024 16:12:29 -0600
Received: from lelvsmtp6.itg.ti.com ([10.249.42.149])
 by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 40NMCSuU068795;
 Tue, 23 Jan 2024 16:12:29 -0600
From: Andrew Davis <afd@ti.com>
To: Gerd Hoffmann <kraxel@redhat.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 3/3] udmabuf: Use module_misc_device() to register this device
Date: Tue, 23 Jan 2024 16:12:27 -0600
Message-ID: <20240123221227.868341-3-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240123221227.868341-1-afd@ti.com>
References: <20240123221227.868341-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: linaro-mm-sig@lists.linaro.org, Andrew Davis <afd@ti.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Now that we do not need to call dma_coerce_mask_and_coherent() on our
miscdevice device, use the module_misc_device() helper for registering
and module init/exit.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 drivers/dma-buf/udmabuf.c | 30 +-----------------------------
 1 file changed, 1 insertion(+), 29 deletions(-)

diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
index ab6764322523c..3028ac3fd9f6a 100644
--- a/drivers/dma-buf/udmabuf.c
+++ b/drivers/dma-buf/udmabuf.c
@@ -392,34 +392,6 @@ static struct miscdevice udmabuf_misc = {
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
-	ret = dma_coerce_mask_and_coherent(udmabuf_misc.this_device,
-					   DMA_BIT_MASK(64));
-	if (ret < 0) {
-		pr_err("Could not setup DMA mask for udmabuf device\n");
-		misc_deregister(&udmabuf_misc);
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
-- 
2.39.2

