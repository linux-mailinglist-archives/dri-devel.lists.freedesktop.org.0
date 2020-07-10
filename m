Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78B2F21B98D
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jul 2020 17:30:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57AA86EC78;
	Fri, 10 Jul 2020 15:30:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDEEE6EC7C
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 15:30:27 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200710153026euoutp0129aae9c7f0e8b5b24ae7eddd7e4189e3~gbdRD699N2103621036euoutp01G
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 15:30:26 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200710153026euoutp0129aae9c7f0e8b5b24ae7eddd7e4189e3~gbdRD699N2103621036euoutp01G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1594395026;
 bh=ldZknbF9TPUSQxdpO3ouuzcL7PaF+JDqisngEE3mM30=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UbVqW0Z+DfvX7F4yzUW7F+pfK1zS7ZvvTBXGktbYbi0yDkqWqL8m69UwY0lcDzRxe
 Q689JeWOYkn9qjiQ+kEi2h9VVRha9G8F3NEl+Do8viPDQZ5Pj77v8ryK2xXQ4+qQPa
 R7nEmXoz+B3a3/qGAL2GJBwCV5gnjipsDW5E+iWc=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200710153026eucas1p2c477ee612f0115d6510dba2551bd36f0~gbdQumKX_2486024860eucas1p2Z;
 Fri, 10 Jul 2020 15:30:26 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 3F.16.06318.299880F5; Fri, 10
 Jul 2020 16:30:26 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200710153025eucas1p141ae47938b5f41c835759e7345f0e625~gbdQLBvef2844728447eucas1p1l;
 Fri, 10 Jul 2020 15:30:25 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200710153025eusmtrp18c1927a42a089179b4e68f175bda4aa4~gbdQFKxpk2243522435eusmtrp1t;
 Fri, 10 Jul 2020 15:30:25 +0000 (GMT)
X-AuditID: cbfec7f5-38bff700000018ae-d4-5f0889920cc0
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id EE.38.06017.199880F5; Fri, 10
 Jul 2020 16:30:25 +0100 (BST)
Received: from AMDC3748.digital.local (unknown [106.120.51.74]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200710153024eusmtip15e7120f4c2f4cb71eb78a470c482f9c8~gbdPUZxoN1261412614eusmtip1X;
 Fri, 10 Jul 2020 15:30:24 +0000 (GMT)
From: Andrzej Hajda <a.hajda@samsung.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v8 3/5] drm/bridge/sii8620: fix resource acquisition error
 handling
Date: Fri, 10 Jul 2020 17:30:16 +0200
Message-Id: <20200710153018.12226-4-a.hajda@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200710153018.12226-1-a.hajda@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA0VSa0hTYRjm2zk75zhcHae4D5XEhZBWmij0RfcMOkFQfyrQ0lae1PK6eSu6
 aBfzVi5tmavIpqZtlndxkrdpm7qm5Q0TRbtALFIJtXJU5i7Vv+d93ufy/ngpTDDAdaOi45JY
 SZw4RkTw8Cbd0sDGgmwqfFPGYxKNP+/nIpOsC6Dae9VcJH/3kUDLTbcxNLw4R6CrpdUEGvlu
 wlDvlxEcZd8uI1Hdh1EuGmp5QCCtvBWgZ92TJNLeCkUPF+TYLpoZGn2DMXNj10mm9VsJzmgU
 kyRzP6uYy9SpsgmmRzbIYdofVpHMVK6ew9SXXWZuNagA03GzEGfm69Yc4ofwtkWwMdEprMR/
 xwlelEqn4ySUrk5T1Oo56aDHMQc4UJAOgq/M38kcwKMEdCWAJR9V9mEBwJ+Gu/ZhHsCqtlns
 ryVHMwhsiwoAR/JNxD9LhtxIWlQE7QN/1b8lLNiFDoT5RoU1CqPNOBy5kcm1LJzpw7D06bg1
 Fqe9YXv9Iyvm0wgqy7oIW50nVNd0WHkHegucleda2yA9Q8Jh2TRuE+2FxT/67fc5w8/6BtKG
 PaChMM+uuQynKq9hNnMWgI01GrthK5zoN6+kUivn+cDqFn8bvRsWGRdwCw3pVXBsxslCYyuw
 oKkIs9F8mJUpsKm94JSx0R4ohOWvF+3nM3D+Ti/HggV0HoA56n0y4Kn431UCgAoI2WRpbCQr
 DYxjU/2k4lhpclyk36n42Dqw8maG3/rFZtD286QW0BQQOfJLxFS4gCtOkZ6L1QJIYSIX/h6j
 IUzAjxCfO89K4sMlyTGsVAvcKVwk5AcqTccFdKQ4iT3Lsgms5O+WQzm4pYNOTffglfyjS0G+
 wR2czgs9GjZsbv3OHQ+UKaEHXdce0Lx0DNCpj/nrGn3G0z6Ylw949y0JZwwsVx59qS95+NOR
 6dRmvdd7pcfX8iehpyvWBQQnVnq4Ji7jo7J3DsEbeHsu/lJnTmS+iN9ftH04IETHGAuU7lWb
 PcYqO5JCzvgiJxEujRIH+GISqfgP25M+D2IDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrIIsWRmVeSWpSXmKPExsVy+t/xu7oTOzniDeY0SlncWneO1eLlhMOM
 FhtnrGe1mPrwCZvF/20TmS2ufH3PZtG8eD2bxdXvL5ktTr65ymLROXEJu8Wmx9dYLS7vmsNm
 cWjqXkaLtUfuslsc6ou2mPtlKrODgMflaxeZPd7faGX32PttAYvHzll32T1md8xk9di0qpPN
 48SES0we++euYfe4332cyWPzknqPvi2rGD0O9E5m8fi8SS6AN0rPpii/tCRVISO/uMRWKdrQ
 wkjP0NJCz8jEUs/Q2DzWyshUSd/OJiU1J7MstUjfLkEvY9WxY0wFi/krZm08ztTAeIKni5GT
 Q0LARKJr5yXGLkYuDiGBpYwS836fYIFIiEvsnv+WGcIWlvhzrYsNougTo8SWz0fAEmwCmhJ/
 N99kA7FFBIwl+s/OYgcpYhZoY5WYe/4JO0hCWCBY4v6CnUwgNouAqsT+zfPBmnkFLCQWLTnM
 BrFBXmL1hgNgcU4BS4l3U7vB4kJANbeXfWedwMi3gJFhFaNIamlxbnpusZFecWJucWleul5y
 fu4mRmB0bTv2c8sOxq53wYcYBTgYlXh4FyRyxAuxJpYVV+YeYpTgYFYS4XU6ezpOiDclsbIq
 tSg/vqg0J7X4EKMp0FETmaVEk/OBkZ9XEm9oamhuYWlobmxubGahJM7bIXAwRkggPbEkNTs1
 tSC1CKaPiYNTqoHRWcN6m7q5/sKt5SbqZyXWs7/qC1GzuHB69YQao7OeYQy/Y4usjrt9udi5
 YIdicGHSIne/GYL/OMpjrl64LKB9+bwv53p7Uxf/XzwG+9p3H1Wfb8n8YP0py3X3wzjZ1Ffv
 XL/s1jLDpd/WVnnZ3/FZ4cby9qd7yO6MlhPubK3tRzV2817+fG61EktxRqKhFnNRcSIAIDy9
 T8QCAAA=
X-CMS-MailID: 20200710153025eucas1p141ae47938b5f41c835759e7345f0e625
X-Msg-Generator: CA
X-RootMTR: 20200710153025eucas1p141ae47938b5f41c835759e7345f0e625
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200710153025eucas1p141ae47938b5f41c835759e7345f0e625
References: <20200710153018.12226-1-a.hajda@samsung.com>
 <CGME20200710153025eucas1p141ae47938b5f41c835759e7345f0e625@eucas1p1.samsung.com>
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
