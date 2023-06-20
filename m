Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C9B297385F4
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 15:58:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3C2610E486;
	Wed, 21 Jun 2023 13:58:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m12.mail.163.com (m12.mail.163.com [220.181.12.214])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7F11F10E2AA;
 Tue, 20 Jun 2023 10:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=fMpVZ
 gPH13LrQj2/yL5QuaQCk1eUSXIciYTrYInC9Vk=; b=OzXo/M9STVDoO1tVerLvg
 q0rQABHDcUa+9BuqHqqudo/he1OA5RA5OWn4bwvUgGoqnT8CPJlS/kTQXVBiS+Yv
 aWkv27fjVEUoBYSBWydonC6LWQyTNMel4fCCUnc7QrkHwW9JHHNNf8LJjhUvpqyX
 jXXw2pFQRpqFOsMR7Lre20=
Received: from openarena.loongson.cn (unknown [114.242.206.180])
 by zwqz-smtp-mta-g4-0 (Coremail) with SMTP id
 _____wAXg3CldZFkB8yiAQ--.11241S10; 
 Tue, 20 Jun 2023 17:47:19 +0800 (CST)
From: Sui Jingfeng <18949883232@163.com>
To: Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v10 08/11] drm/etnaviv: Add a dedicated function to create the
 virtual master
Date: Tue, 20 Jun 2023 17:47:13 +0800
Message-Id: <20230620094716.2231414-9-18949883232@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230620094716.2231414-1-18949883232@163.com>
References: <20230620094716.2231414-1-18949883232@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wAXg3CldZFkB8yiAQ--.11241S10
X-Coremail-Antispam: 1Uf129KBjvJXoW7Cw1UWFyxJw13tw4rtrW7XFb_yoW8tF15pF
 43GFyYkry8uFyUKw48JF15AFW5Ga1S934Svr9rAwnY9ws8AryrXryrtF1kAFnxJFWrCa1Y
 qw1jyryxuF45ZrJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j9VycUUUUU=
X-Originating-IP: [114.242.206.180]
X-CM-SenderInfo: jprymkizyyjjits6il2tof0z/1tbiEwiU0WE17eMXfgAAst
X-Mailman-Approved-At: Wed, 21 Jun 2023 13:58:32 +0000
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
Cc: Sui Jingfeng <suijingfeng@loongson.cn>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
 Bjorn Helgaas <bhelgaas@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sui Jingfeng <suijingfeng@loongson.cn>

After introducing the etnaviv_of_first_available_node() helper, the
creation of the virtual master platform device can also be simplified.
So, switch to etnaviv_create_virtual_master() function.

Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Christian Gmeiner <christian.gmeiner@gmail.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
---
 drivers/gpu/drm/etnaviv/etnaviv_drv.c | 43 ++++++++++++++++-----------
 1 file changed, 26 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
index d8e788aa16cb..47b2cdbb53e2 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
@@ -767,10 +767,32 @@ static void etnaviv_destroy_platform_device(struct platform_device **ppdev)
 	*ppdev = NULL;
 }
 
+static int etnaviv_create_virtual_master(void)
+{
+	struct platform_device **master = &etnaviv_platform_device;
+	struct device_node *np;
+
+	/*
+	 * If the DT contains at least one available GPU device, instantiate
+	 * the DRM platform device.
+	 */
+	np = etnaviv_of_first_available_node();
+	if (np) {
+		int ret;
+
+		of_node_put(np);
+
+		ret = etnaviv_create_platform_device("etnaviv", master);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
 static int __init etnaviv_init(void)
 {
 	int ret;
-	struct device_node *np;
 
 	etnaviv_validate_init();
 
@@ -786,22 +808,9 @@ static int __init etnaviv_init(void)
 	if (ret != 0)
 		goto unregister_platform_driver;
 
-	/*
-	 * If the DT contains at least one available GPU device, instantiate
-	 * the DRM platform device.
-	 */
-	for_each_compatible_node(np, NULL, "vivante,gc") {
-		if (!of_device_is_available(np))
-			continue;
-		of_node_put(np);
-
-		ret = etnaviv_create_platform_device("etnaviv",
-						     &etnaviv_platform_device);
-		if (ret)
-			goto unregister_platform_driver;
-
-		break;
-	}
+	ret = etnaviv_create_virtual_master();
+	if (ret)
+		goto unregister_platform_driver;
 
 	return ret;
 
-- 
2.25.1

