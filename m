Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E95B33B1FA
	for <lists+dri-devel@lfdr.de>; Mon, 15 Mar 2021 13:02:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF9F68961D;
	Mon, 15 Mar 2021 12:02:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 482FC8961D
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Mar 2021 12:02:45 +0000 (UTC)
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4DzZkv3BqHzkZSK;
 Mon, 15 Mar 2021 20:01:11 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.498.0; Mon, 15 Mar 2021 20:02:39 +0800
From: Tian Tao <tiantao6@hisilicon.com>
To: <a.hajda@samsung.com>, <narmstrong@baylibre.com>, <airlied@linux.ie>,
 <daniel@ffwll.ch>
Subject: [PATCH v2] drm/bridge: sii9234: sil-sii8620.c: move to use
 request_irq by IRQF_NO_AUTOEN flag
Date: Mon, 15 Mar 2021 20:03:21 +0800
Message-ID: <1615809801-36857-1-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.69.192.56]
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

After this patch cbe16f35bee68 genirq: Add IRQF_NO_AUTOEN for
request_irq/nmi() is merged. request_irq() after setting
IRQ_NOAUTOEN as below

irq_set_status_flags(irq, IRQ_NOAUTOEN);
request_irq(dev, irq...);
can be replaced by request_irq() with IRQF_NO_AUTOEN flag.

v2:
Fix the problem of using wrong flags

Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
---
 drivers/gpu/drm/bridge/sii9234.c     | 4 ++--
 drivers/gpu/drm/bridge/sil-sii8620.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/sii9234.c b/drivers/gpu/drm/bridge/sii9234.c
index 15c98a7..54b5097 100644
--- a/drivers/gpu/drm/bridge/sii9234.c
+++ b/drivers/gpu/drm/bridge/sii9234.c
@@ -911,10 +911,10 @@ static int sii9234_probe(struct i2c_client *client,
 		return -EINVAL;
 	}
 
-	irq_set_status_flags(client->irq, IRQ_NOAUTOEN);
 	ret = devm_request_threaded_irq(dev, client->irq, NULL,
 					sii9234_irq_thread,
-					IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
+					IRQF_TRIGGER_HIGH | IRQF_ONESHOT |
+					IRQF_NO_AUTOEN,
 					"sii9234", ctx);
 	if (ret < 0) {
 		dev_err(dev, "failed to install IRQ handler\n");
diff --git a/drivers/gpu/drm/bridge/sil-sii8620.c b/drivers/gpu/drm/bridge/sil-sii8620.c
index 843265d..4133f6e 100644
--- a/drivers/gpu/drm/bridge/sil-sii8620.c
+++ b/drivers/gpu/drm/bridge/sil-sii8620.c
@@ -2308,10 +2308,10 @@ static int sii8620_probe(struct i2c_client *client,
 		dev_err(dev, "no irq provided\n");
 		return -EINVAL;
 	}
-	irq_set_status_flags(client->irq, IRQ_NOAUTOEN);
 	ret = devm_request_threaded_irq(dev, client->irq, NULL,
 					sii8620_irq_thread,
-					IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
+					IRQF_TRIGGER_HIGH | IRQF_ONESHOT |
+					IRQF_NO_AUTOEN,
 					"sii8620", ctx);
 	if (ret < 0)
 		return dev_err_probe(dev, ret,
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
