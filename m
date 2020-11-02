Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D4272A3E79
	for <lists+dri-devel@lfdr.de>; Tue,  3 Nov 2020 09:15:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 683256EC07;
	Tue,  3 Nov 2020 08:14:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED3516E50B
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Nov 2020 14:31:04 +0000 (UTC)
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4CPwM54XZtzhff0;
 Mon,  2 Nov 2020 22:30:57 +0800 (CST)
Received: from localhost (10.174.176.180) by DGGEMS404-HUB.china.huawei.com
 (10.3.19.204) with Microsoft SMTP Server id 14.3.487.0; Mon, 2 Nov 2020
 22:30:50 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <a.hajda@samsung.com>, <narmstrong@baylibre.com>,
 <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@siol.net>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <tomi.valkeinen@ti.com>, <yuehaibing@huawei.com>,
 <sebastian.reichel@collabora.com>, <sam@ravnborg.org>
Subject: [PATCH v2] drm/bridge: tpd12s015: Fix irq registering in
 tpd12s015_probe
Date: Mon, 2 Nov 2020 22:30:24 +0800
Message-ID: <20201102143024.26216-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
In-Reply-To: <20201031031648.42368-1-yuehaibing@huawei.com>
References: <20201031031648.42368-1-yuehaibing@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.174.176.180]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Tue, 03 Nov 2020 08:14:25 +0000
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

gpiod_to_irq() return negative value in case of error,
the existing code doesn't handle negative error codes.
If the HPD gpio supports IRQs (gpiod_to_irq returns a
valid number), we use the IRQ. If it doesn't (gpiod_to_irq
returns an error), it gets polled via detect(). 

Fixes: cff5e6f7e83f ("drm/bridge: Add driver for the TI TPD12S015 HDMI level shifter")
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
v2: Add checking for >= 0 and update commit message
---
 drivers/gpu/drm/bridge/ti-tpd12s015.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/ti-tpd12s015.c b/drivers/gpu/drm/bridge/ti-tpd12s015.c
index 514cbf0eac75..e0e015243a60 100644
--- a/drivers/gpu/drm/bridge/ti-tpd12s015.c
+++ b/drivers/gpu/drm/bridge/ti-tpd12s015.c
@@ -160,7 +160,7 @@ static int tpd12s015_probe(struct platform_device *pdev)
 
 	/* Register the IRQ if the HPD GPIO is IRQ-capable. */
 	tpd->hpd_irq = gpiod_to_irq(tpd->hpd_gpio);
-	if (tpd->hpd_irq) {
+	if (tpd->hpd_irq >= 0) {
 		ret = devm_request_threaded_irq(&pdev->dev, tpd->hpd_irq, NULL,
 						tpd12s015_hpd_isr,
 						IRQF_TRIGGER_RISING |
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
