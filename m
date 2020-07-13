Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF45821D8D0
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jul 2020 16:43:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB0106E0FE;
	Mon, 13 Jul 2020 14:43:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2175589FA7
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jul 2020 14:43:35 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200713144333euoutp028eca90962f1f8719f7071ed5a6dcebc4~hVwMYLHXb2797427974euoutp02K
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jul 2020 14:43:33 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200713144333euoutp028eca90962f1f8719f7071ed5a6dcebc4~hVwMYLHXb2797427974euoutp02K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1594651413;
 bh=ldZknbF9TPUSQxdpO3ouuzcL7PaF+JDqisngEE3mM30=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UvmIywVy7PH0VtWUpGVHrrsKV0jPUT2V7MtpgEDbsSwYg/m4EzvQtWNmUx1/7z20U
 A3rCcHoacTOJWZJhMzU5YZEVcAnwrDK+/GEXKfRoP6IKdu0gsdD/+XuHK/GCaLfgSd
 8iscvrxs39vD0uNs12ExMvq1jgcFMhcCQKcwPRps=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200713144333eucas1p2554697096c3ff0d9fa576d0bf15c4fb6~hVwMAqfWU0720407204eucas1p2v;
 Mon, 13 Jul 2020 14:43:33 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 1D.E5.06456.5137C0F5; Mon, 13
 Jul 2020 15:43:33 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200713144333eucas1p127c600faa8a7416d89f0d84681c73ab9~hVwLrh6O21041510415eucas1p1x;
 Mon, 13 Jul 2020 14:43:33 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200713144333eusmtrp1ebd47862f33d49c25a5e985aa2fd0160~hVwLqzCMj0993509935eusmtrp1Z;
 Mon, 13 Jul 2020 14:43:33 +0000 (GMT)
X-AuditID: cbfec7f2-809ff70000001938-b7-5f0c7315974e
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 45.5A.06017.4137C0F5; Mon, 13
 Jul 2020 15:43:32 +0100 (BST)
Received: from AMDC3748.digital.local (unknown [106.120.51.74]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200713144332eusmtip17eed23fae87263527c6711746e549ad4~hVwK82OmS2060420604eusmtip1I;
 Mon, 13 Jul 2020 14:43:32 +0000 (GMT)
From: Andrzej Hajda <a.hajda@samsung.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v9 3/4] drm/bridge/sii8620: fix resource acquisition error
 handling
Date: Mon, 13 Jul 2020 16:43:23 +0200
Message-Id: <20200713144324.23654-4-a.hajda@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200713144324.23654-1-a.hajda@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA0VSaUhUURjtzlsdnLxNll+2SANRRmlRP277QtHDgjYkyMpe+TJJJ5uXLQYW
 raOVaSbV2IYaU6Omjgs5JNlUOjU45tZmJqE/mhZs07Aom9fT+ne+853vnMPl8pTewwTzccbd
 kskoxhtYLV1Z29cwdYTsHz3tZQuQl7c8DPFm3Eek9EIxQ7LfdLGkvzKTIi093Sw5klfMktbv
 Xoo8+tBKk9TMfI7YO58ypNlxiSXO7GpEih60c8SZHkUuf8umFmKh+WkjJXQ/P8YJ1b3XaKHK
 0s4JOeaLjGC3pbKCK6NJI9y9XMgJHSfrNEJZ/kEhvdyGhJrTWbTw1T5ulW69dm6MFB+3RzKF
 z9+s3W6rrdUk5gXss5TWaQ4hl38a8uMBzwRP1REqDWl5Pb6BwPrQrVGHbwhuNpQy6vAVQX5a
 IRo8MT+zDaisCNq8VubfSU35F1pRsTgUfpW9YBUciGfAmXoLp4go/IOG1hPHGWUxHEeC1dX+
 15bGE6C72UEpWIcJfGjtp9W4ECgoqfHxPO+HZ8HV9HWKD2AvB1lFLQOVlkClw8qoeDi8qyvn
 VDwG3FmnBnwOQseNo5R6bEZQUVJFqYs58Mrzg1UCKF/rYke4Si+CipxuWqEBD4XnH4cpNOWD
 ZyvPUyqtA/NxvaoeDx31FQOGQXD9SQ+rYgGOvmn720aPT/neNz8iA4VY/mddQ8iGgqQkOSFW
 kqcbpb1hspggJxljw7buTLAj3y9z/677chv1NG1xIswjg78OVvpH6xlxj7w/wYmApwyBusX1
 7k16XYy4P1ky7Yw2JcVLshON5mlDkG5GrnejHseKu6UdkpQomQa3Gt4v+BDa1/KiMyW1rK+v
 I/OeJeLwz7s5s2etd73O/fzeOYVLdDdEFq6ZZ9G+DU8S8YKwmF+BDXErgj2xoWOru0aWu5Pj
 bmsdnviVrx6nBCRfKcCjT09avnRp8AaHLav/gOtiY1uxoXDbOZhqh9Xm3qhPbOSW8DtGzdYh
 E9f+LFgmuu+MGrfLQMvbxemTKZMs/gG5+MSHYQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHIsWRmVeSWpSXmKPExsVy+t/xu7qixTzxBn94LW6tO8dq8XLCYUaL
 jTPWs1pMffiEzeL/tonMFle+vmezaF68ns3i6veXzBYn31xlseicuITdYtPja6wWl3fNYbM4
 NHUvo8XaI3fZLQ71RVvM/TKV2UHA4/K1i8we72+0snvs/baAxWPnrLvsHrM7ZrJ6bFrVyeZx
 YsIlJo/9c9ewe9zvPs7ksXlJvUffllWMHgd6J7N4fN4kF8AbpWdTlF9akqqQkV9cYqsUbWhh
 pGdoaaFnZGKpZ2hsHmtlZKqkb2eTkpqTWZZapG+XoJex6tgxpoLF/BWzNh5namA8wdPFyMkh
 IWAi0XF9FVMXIxeHkMBSRonp95+wQyTEJXbPf8sMYQtL/LnWxQZR9IlRYvGXhSwgCTYBTYm/
 m2+ygdgiAsYS/WdnsYMUMQu0sUrMPQ8xSVggWGLXkgZGEJtFQFXi/eVdYFN5BSwk3lz9zwKx
 QV5i9YYDQHEODk4BS4n5feEgphBQyYm3nhMY+RYwMqxiFEktLc5Nzy020itOzC0uzUvXS87P
 3cQIjKttx35u2cHY9S74EKMAB6MSD6+EP0+8EGtiWXFl7iFGCQ5mJRFep7On44R4UxIrq1KL
 8uOLSnNSiw8xmgKdNJFZSjQ5HxjzeSXxhqaG5haWhubG5sZmFkrivB0CB2OEBNITS1KzU1ML
 Uotg+pg4OKUaGNeUqyzks5wz6/3K+z2WfZ1Vl7okLtjlOgcxzbZwShF40OF72+OJU+G1ugWy
 Mzst27793ij1aGWUZaBLIQtH+Qw5Vq34e5O/1vgwyv283eoy0fXd7g7+0GMrohnm/C3eP3fa
 0kDp9DNW/EU7599blSmguFpss4T+3Nr3LZUNkn7vPLdZnxA/rsRSnJFoqMVcVJwIAJkG1LzB
 AgAA
X-CMS-MailID: 20200713144333eucas1p127c600faa8a7416d89f0d84681c73ab9
X-Msg-Generator: CA
X-RootMTR: 20200713144333eucas1p127c600faa8a7416d89f0d84681c73ab9
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200713144333eucas1p127c600faa8a7416d89f0d84681c73ab9
References: <20200713144324.23654-1-a.hajda@samsung.com>
 <CGME20200713144333eucas1p127c600faa8a7416d89f0d84681c73ab9@eucas1p1.samsung.com>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 linux-kernel@vger.kernel.org,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Neil Armstrong <narmstrong@baylibre.com>, Andrzej Hajda <a.hajda@samsung.com>,
 andy.shevchenko@gmail.com, Mark Brown <broonie@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In case of error during resource acquisition driver should print error
message only in case it is not deferred probe, using dev_err_probe helper
solves the issue. Moreover it records defer probe reason for debugging.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/bridge/sil-sii8620.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/bridge/sil-sii8620.c b/drivers/gpu/drm/bridge/sil-sii8620.c
index 92acd336aa89..389c1f029774 100644
--- a/drivers/gpu/drm/bridge/sil-sii8620.c
+++ b/drivers/gpu/drm/bridge/sil-sii8620.c
@@ -2299,10 +2299,9 @@ static int sii8620_probe(struct i2c_client *client,
 	INIT_LIST_HEAD(&ctx->mt_queue);
 
 	ctx->clk_xtal = devm_clk_get(dev, "xtal");
-	if (IS_ERR(ctx->clk_xtal)) {
-		dev_err(dev, "failed to get xtal clock from DT\n");
-		return PTR_ERR(ctx->clk_xtal);
-	}
+	if (IS_ERR(ctx->clk_xtal))
+		return dev_err_probe(dev, PTR_ERR(ctx->clk_xtal),
+				     "failed to get xtal clock from DT\n");
 
 	if (!client->irq) {
 		dev_err(dev, "no irq provided\n");
@@ -2313,16 +2312,14 @@ static int sii8620_probe(struct i2c_client *client,
 					sii8620_irq_thread,
 					IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
 					"sii8620", ctx);
-	if (ret < 0) {
-		dev_err(dev, "failed to install IRQ handler\n");
-		return ret;
-	}
+	if (ret < 0)
+		return dev_err_probe(dev, ret,
+				     "failed to install IRQ handler\n");
 
 	ctx->gpio_reset = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
-	if (IS_ERR(ctx->gpio_reset)) {
-		dev_err(dev, "failed to get reset gpio from DT\n");
-		return PTR_ERR(ctx->gpio_reset);
-	}
+	if (IS_ERR(ctx->gpio_reset))
+		return dev_err_probe(dev, PTR_ERR(ctx->gpio_reset),
+				     "failed to get reset gpio from DT\n");
 
 	ctx->supplies[0].supply = "cvcc10";
 	ctx->supplies[1].supply = "iovcc18";
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
