Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 584B120CE2D
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jun 2020 13:23:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8278B6E170;
	Mon, 29 Jun 2020 11:22:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2338A6E170
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jun 2020 11:22:52 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200629112250euoutp0232bc43a2714d2905fba676d95068fdee~c-_8hoRn_1879918799euoutp02U
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jun 2020 11:22:50 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200629112250euoutp0232bc43a2714d2905fba676d95068fdee~c-_8hoRn_1879918799euoutp02U
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1593429770;
 bh=ldZknbF9TPUSQxdpO3ouuzcL7PaF+JDqisngEE3mM30=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CvYNjDi7vD5kVixtnoYzJ5QHtkc5b0JLF38t3tzPF5vMfbZ+XPjnc2pNFcgqmO3yN
 F9qwv2bSLt0xS8tfzQjD38ikhJxnqBoCOHjlSe4c9Pmj1XfaLE1161KFR1d6SQgctp
 qvdXaHDv6pUkxrjwiDyFMSp9XCn/KBd9paM9tIdg=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200629112250eucas1p207dd9dd07c8d2b62bce2b9d6ec01e958~c-_8MJKeT2471224712eucas1p2X;
 Mon, 29 Jun 2020 11:22:50 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id AF.A7.06456.A0FC9FE5; Mon, 29
 Jun 2020 12:22:50 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200629112249eucas1p12fc95f88729c12c78b1a5bfe32afad8f~c-_7wyhDZ0555905559eucas1p1Q;
 Mon, 29 Jun 2020 11:22:49 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200629112249eusmtrp24df70e7112ccbe125aeb79667a9e74b2~c-_7wDt6k1939019390eusmtrp2f;
 Mon, 29 Jun 2020 11:22:49 +0000 (GMT)
X-AuditID: cbfec7f2-7efff70000001938-c7-5ef9cf0aab3b
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 4E.0F.06314.90FC9FE5; Mon, 29
 Jun 2020 12:22:49 +0100 (BST)
Received: from AMDC3748.digital.local (unknown [106.120.51.74]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200629112249eusmtip169921d0a84a53bece075ad7bc3dcd372~c-_69HRf-2279622796eusmtip1I;
 Mon, 29 Jun 2020 11:22:48 +0000 (GMT)
From: Andrzej Hajda <a.hajda@samsung.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v7 3/4] drm/bridge/sii8620: fix resource acquisition error
 handling
Date: Mon, 29 Jun 2020 13:22:41 +0200
Message-Id: <20200629112242.18380-4-a.hajda@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200629112242.18380-1-a.hajda@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA0VSWUwTURT1daYzQ0N1KCo3aCRW/YAEKlHjMxKjSOIk/vihidGIFJkAKZsd
 qmJiJK5ABQElCkhFxYgFpC2bYECshoKVgkUaXHGNYsStLEJEpEyNf+eec+695748hlA4pIFM
 Yko6r01RJykpGdnYMeEIlfVMRK9srpyLn91ySPFQ/n2EzRdrpbjozXsKTzcWEPjJ6DcKH79W
 S+H+8SECd33pJ3F2QQWNLe9cUtzXconC1qJWhGsevKSxNW83LhspIjayXJ/rMcF9GzhJc61j
 5STXXPKS5kqziqWcxZhNcZ35Tgl3t6ya5gb1NglXV3GUy6s3Iq499xzJuS1Ltsl3ySLi+KTE
 A7xWtSFGlmDs6JCkXZt3qMRsk2SiTt8c5MMAuxpyDBVEDpIxCrYSwfmxY0gsRhBceddLi4Ub
 gdFgkv5rMQ9MSkThBgLnWOb/lvsGN+VxUWwwTNU9ncXz2VVwtrtkdhTBTpLQf/rUzCiG8Wd3
 wO+2NR4Pya6AOlfhrF/OYujIekiJ24KgytROeLAPuw76eouRyA/TkFsTIuIomCo3e9P5w2db
 PS3ixTDdfFki4qMwWHli9lBgsxA0mJoJUVgPLxyTlCcPMRO6tkUl0pug546b8NDAzoWBYT8P
 TczAwsYLXloOWacUonspDHY3eAcGwPXeUW96Dp6/MpHi85xBcO+jnspHQSX/l5UjZEQBvE5I
 jueF8BT+YJigThZ0KfFh+1KTLWjml9n/2H7eRqPOWCtiGaT0lcc4JqIVUvUBISPZioAhlPPl
 kd32aIU8Tp1xmNem7tXqknjBihYxpDJAvurq0B4FG69O5zU8n8Zr/6kSxicwE52TNyWunxOb
 +T3Dzz+o62bT6+qVbUm791SFT3zasiUqJttgW1g6Z2lxyM4F9tjxD4sSt9M63/w05QlXaV5a
 pP66ukFZbdNkpycUPlBtWu4KPnu5s1T16+rXTv28ZYYIN8Rofqwb/xKqcU6O6R2Va7fqIvof
 RR75ur/M+DZ4yg7CZiUpJKjDQwitoP4Lj50BDmEDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrIIsWRmVeSWpSXmKPExsVy+t/xu7qc53/GGSzYqGdxa905VouXEw4z
 WmycsZ7VYurDJ2wW/7dNZLa48vU9m0Xz4vVsFle/v2S2OPnmKotF58Ql7BabHl9jtbi8aw6b
 xaGpexkt1h65y25xqC/aYu6XqcwOAh6Xr11k9nh/o5XdY++3BSweO2fdZfeY3TGT1WPTqk42
 jxMTLjF57J+7ht3jfvdxJo/NS+o9+rasYvQ40DuZxePzJrkA3ig9m6L80pJUhYz84hJbpWhD
 CyM9Q0sLPSMTSz1DY/NYKyNTJX07m5TUnMyy1CJ9uwS9jFXHjjEVLOavmLXxOFMD4wmeLkZO
 DgkBE4mNN34xdTFycQgJLGWU+LqohRUiIS6xe/5bZghbWOLPtS42iKJPjBIr181nAUmwCWhK
 /N18kw3EFhEwlug/O4sdpIhZoI1VYu75J+wgCWGBYInrC+eATWIRUJXYfG0SWAOvgIXEsY5T
 bBAb5CVWbzgAVsMpYClx+cJMRhBbCKjmwtFO9gmMfAsYGVYxiqSWFuem5xYb6hUn5haX5qXr
 JefnbmIERte2Yz8372C8tDH4EKMAB6MSD2/CuZ9xQqyJZcWVuYcYJTiYlUR4nc6ejhPiTUms
 rEotyo8vKs1JLT7EaAp01ERmKdHkfGDk55XEG5oamltYGpobmxubWSiJ83YIHIwREkhPLEnN
 Tk0tSC2C6WPi4JRqYAy04etaYaPrdlN87dtPq5qOhnF5MDNVvpsrve1H54Pfgb//y5YUZ9qU
 VfFIurEoul78MOdx8B+jONdTfFVGsuUfdlkvWTO56fibquy9ny1KtxzT3uLIFXvkTo6k1Nvw
 STc3nmiLOnexx7vn9re+81uMM34+PFNR3dDzqO5lr3eZ+9W1VQ2hgUosxRmJhlrMRcWJAPqX
 CKDEAgAA
X-CMS-MailID: 20200629112249eucas1p12fc95f88729c12c78b1a5bfe32afad8f
X-Msg-Generator: CA
X-RootMTR: 20200629112249eucas1p12fc95f88729c12c78b1a5bfe32afad8f
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200629112249eucas1p12fc95f88729c12c78b1a5bfe32afad8f
References: <20200629112242.18380-1-a.hajda@samsung.com>
 <CGME20200629112249eucas1p12fc95f88729c12c78b1a5bfe32afad8f@eucas1p1.samsung.com>
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
