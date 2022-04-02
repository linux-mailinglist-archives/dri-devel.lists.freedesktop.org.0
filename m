Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 42ECB4F0484
	for <lists+dri-devel@lfdr.de>; Sat,  2 Apr 2022 17:44:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AC2F10E1B9;
	Sat,  2 Apr 2022 15:44:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 189.cn (ptr.189.cn [183.61.185.102])
 by gabe.freedesktop.org (Postfix) with ESMTP id EBF2A10E1B9
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Apr 2022 15:44:02 +0000 (UTC)
HMM_SOURCE_IP: 10.64.8.41:52718.1890659392
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.41])
 by 189.cn (HERMES) with SMTP id 2FF30100207;
 Sat,  2 Apr 2022 23:43:59 +0800 (CST)
Received: from  ([172.27.8.53])
 by gateway-151646-dep-b7fbf7d79-9vctg with ESMTP id
 2c45fadbd282437a80b064d873909b86 for l.stach@pengutronix.de; 
 Sat, 02 Apr 2022 23:44:01 CST
X-Transaction-ID: 2c45fadbd282437a80b064d873909b86
X-Real-From: 15330273260@189.cn
X-Receive-IP: 172.27.8.53
X-MEDUSA-Status: 0
From: Sui Jingfeng <15330273260@189.cn>
To: Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/etnaviv: introduce a function to create etnaviv platform
 device
Date: Sat,  2 Apr 2022 23:43:58 +0800
Message-Id: <20220402154358.1708299-1-15330273260@189.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

 This patch make the code more clear, call of_node_put(np) only once
 in for_each_compatible_node(np, NULL, "vivante,gc") loop instead of
 three.

Signed-off-by: Sui Jingfeng <15330273260@189.cn>
---
 drivers/gpu/drm/etnaviv/etnaviv_drv.c | 36 +++++++++++++++++----------
 1 file changed, 23 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
index 0b756ecb1bc2..42cb624cf1ae 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
@@ -659,6 +659,26 @@ static struct platform_driver etnaviv_platform_driver = {
 
 static struct platform_device *etnaviv_drm;
 
+static int etnaviv_create_platform_device(const char *name)
+{
+	struct platform_device *pdev;
+	int ret;
+
+	pdev = platform_device_alloc(name, PLATFORM_DEVID_NONE);
+	if (!pdev)
+		return -ENOMEM;
+
+	ret = platform_device_add(pdev);
+	if (ret) {
+		platform_device_put(pdev);
+		return ret;
+	}
+
+	etnaviv_drm = pdev;
+
+	return 0;
+}
+
 static int __init etnaviv_init(void)
 {
 	struct platform_device *pdev;
@@ -683,22 +703,12 @@ static int __init etnaviv_init(void)
 		if (!of_device_is_available(np))
 			continue;
 
-		pdev = platform_device_alloc("etnaviv", PLATFORM_DEVID_NONE);
-		if (!pdev) {
-			ret = -ENOMEM;
-			of_node_put(np);
-			goto unregister_platform_driver;
-		}
+		of_node_put(np);
 
-		ret = platform_device_add(pdev);
-		if (ret) {
-			platform_device_put(pdev);
-			of_node_put(np);
+		ret = etnaviv_create_platform_device("etnaviv");
+		if (ret)
 			goto unregister_platform_driver;
-		}
 
-		etnaviv_drm = pdev;
-		of_node_put(np);
 		break;
 	}
 
-- 
2.25.1

