Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D47A207253
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jun 2020 13:41:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E9006EB0A;
	Wed, 24 Jun 2020 11:41:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 916096EB07
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jun 2020 11:41:39 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200624114138euoutp02776c32c01ef40418520612ad69e4899e~beA7YDpqo1752317523euoutp02F
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jun 2020 11:41:38 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200624114138euoutp02776c32c01ef40418520612ad69e4899e~beA7YDpqo1752317523euoutp02F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1592998898;
 bh=PLcfbVbE8i4C8d+Nje5jm1KODRXZ6RkpBF4pFp7dgN0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Gz061wWwnckgFshr7IHV/S56brednP/fCQN2DoCvt+lOLedpHvoWuBZeA3A9KsT3g
 YoA4EdOZ3Kab191G9YTSBCBfdMshslJW5od/RbI36r4UDd0Iz6ivjUmvsvNkR8UjIB
 sBtr/mLupNn0hGQfZWMj8+FCaH4cd42c3YYFkHGU=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200624114137eucas1p23e078ad0759d9748c9282f41addeff25~beA7CGXw43078130781eucas1p2-;
 Wed, 24 Jun 2020 11:41:37 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 08.5A.06318.1FB33FE5; Wed, 24
 Jun 2020 12:41:37 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200624114137eucas1p13599d33a0c4a9abf7708bf8c8e77264b~beA6t-j1g1213312133eucas1p1o;
 Wed, 24 Jun 2020 11:41:37 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200624114137eusmtrp10d73154fb2485ece760b250727d8f1fe~beA6tUGSX0702007020eusmtrp1Q;
 Wed, 24 Jun 2020 11:41:37 +0000 (GMT)
X-AuditID: cbfec7f5-371ff700000018ae-3c-5ef33bf187fe
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 74.74.06314.1FB33FE5; Wed, 24
 Jun 2020 12:41:37 +0100 (BST)
Received: from AMDC3748.digital.local (unknown [106.120.51.74]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200624114136eusmtip2e30c14611d99889046fee0d88d874173~beA6ExH1q1775617756eusmtip2L;
 Wed, 24 Jun 2020 11:41:36 +0000 (GMT)
From: Andrzej Hajda <a.hajda@samsung.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [RESEND PATCH v5 4/5] drm/bridge/sii8620: fix resource acquisition
 error handling
Date: Wed, 24 Jun 2020 13:41:26 +0200
Message-Id: <20200624114127.3016-5-a.hajda@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200624114127.3016-1-a.hajda@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA0WSWUxTQRiFM70r1eqlJWGCW6wxcQVMiY5KFI0mN5oYt/hQFa1ygyitpAXc
 HhCpCAhYqo2IYoiiVUSBsigIgmWppAFFBAEh1YhLq7KEUhFFbXtd3r6c/5zzz0yGxsRWIoCO
 UsVyapUiWkoK8Yqmb62Lh1eOhAfrbq9APfdaCWTX1QNUkl1EIMObfhL9qsjC0IvRQRIlXS8i
 UcdXO4aaP3fgKDUrn0Kmt50Eaq+6QiKzoQaguw19FDJn7kS5TgMWxrDtnW0YO9h1mmJrXHk4
 W5nTR7GXUy4RrKkglWSf6J4L2NrcQoq1nbUI2NL8BDazrACwdRnncXbENHOzSC4MjeCio+I5
 ddCqvcIDje12MubmlKOtn6qpk2BgUhrwoSETAhsHywgPi5lbACa6Qnh2AjiQGpYGhG4eAbDg
 ewn4G6juOYXzAyOAd7Va8l8iL93XwyQzH06Udnt1P0YGz7XkUJ4AxozjsONMsnedhNkFHfde
 eVtxZi6s7//hNtG0iFkGJ57K+WWz4J3iOszDPgyCem0b8PRAZpiC+RdbCI8fMuvg2KiE90ug
 w1JG8TwdWs+n4zwnQNstLcZnUwAsL67E+MFK2Ns6Tnp6MPehi6qCeHkNvJDdA/j6KbDri/da
 mBv1FRcxXhbBlGQx754NbS3lfwr94Y1noyTPLLx2P0XAP9VZAEuM9ykdmJXzf1keAAXAn4vT
 KCM5jUzFHQnUKJSaOFVk4P7DShNwfzHrT8voA/Doxz4zYGggnSwqfj0cLiYU8ZpjSjOANCb1
 E61tsYaLRRGKY8c59eE96rhoTmMG02hc6i+SXbPvFjORiljuEMfFcOq/UwHtE3ASHFEOBCw3
 GuW1WSNbYra3vc9+s1H2bsbVtvFP4Z22apXO2WwAsvpM1Yp9J/rSH0s+mPTbbB8zXjY+JIYc
 iS56tXzOKWeMpVewY3HhJkfHmHxq9/SN4q3JG/S1Q0mrhXOWLgqUZoZaytc3PXsslexpSsv4
 vHBef4PLN+Fn6cFgv0Q/Ka45oFiyAFNrFL8BSXvZ814DAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrAIsWRmVeSWpSXmKPExsVy+t/xe7ofrT/HGdx4rmpxa905VouXEw4z
 WmycsZ7VYurDJ2wW/7dNZLa48vU9m0Xz4vVsFle/v2S2OPnmKotF58Ql7BabHl9jtbi8aw6b
 xaGpexkt1h65y25xqC/aYu6XqcwOAh6Xr11k9nh/o5XdY++3BSweO2fdZfeY3TGT1WPTqk42
 jxMTLjF57J+7ht3jfvdxJo/NS+o9+rasYvQ40DuZxePzJrkA3ig9m6L80pJUhYz84hJbpWhD
 CyM9Q0sLPSMTSz1DY/NYKyNTJX07m5TUnMyy1CJ9uwS9jKOXX7IVLOOrOPd6D3sD4zvuLkZO
 DgkBE4k9t5pYuhi5OIQEljJK7Lp7mxUiIS6xe/5bZghbWOLPtS42iKJPjBLz2reCJdgENCX+
 br7JBmKLCBhL9J+dxQ5SxCzQxiox9/wTdpCEsECUxPU5D8GmsgioShx+8gcozsHBK2Au8fd8
 FMQCeYnVGw6AzeQUsJCY1HKREcQWAio5dH0x6wRGvgWMDKsYRVJLi3PTc4sN9YoTc4tL89L1
 kvNzNzECY2vbsZ+bdzBe2hh8iFGAg1GJh3fDg49xQqyJZcWVuYcYJTiYlUR4nc6ejhPiTUms
 rEotyo8vKs1JLT7EaAp000RmKdHkfGDc55XEG5oamltYGpobmxubWSiJ83YIHIwREkhPLEnN
 Tk0tSC2C6WPi4JRqYEzZe8Q4eu8nrqd1WpEmE1N8z54Wa39usfpn6/nT6wW/V7K5dzj/NErb
 Knlu5ZRPh9q72suuf7Jzmz3D/7hy5eOdDScOXfHbVJjYt91ku3Hi9lsrp35OsWH/NK1LwfeN
 23a7LzlMUbFRSVzHj0yS2zbviVSAeOf5KY45rTv3Sf/Z57zIsumZ0QElluKMREMt5qLiRAAc
 CbrgwwIAAA==
X-CMS-MailID: 20200624114137eucas1p13599d33a0c4a9abf7708bf8c8e77264b
X-Msg-Generator: CA
X-RootMTR: 20200624114137eucas1p13599d33a0c4a9abf7708bf8c8e77264b
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200624114137eucas1p13599d33a0c4a9abf7708bf8c8e77264b
References: <20200624114127.3016-1-a.hajda@samsung.com>
 <CGME20200624114137eucas1p13599d33a0c4a9abf7708bf8c8e77264b@eucas1p1.samsung.com>
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
message only in case it is not deferred probe, using probe_err helper
solves the issue. Moreover it records defer probe reason for debugging.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/gpu/drm/bridge/sil-sii8620.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/bridge/sil-sii8620.c b/drivers/gpu/drm/bridge/sil-sii8620.c
index 92acd336aa89..2f825b2d0098 100644
--- a/drivers/gpu/drm/bridge/sil-sii8620.c
+++ b/drivers/gpu/drm/bridge/sil-sii8620.c
@@ -2299,10 +2299,8 @@ static int sii8620_probe(struct i2c_client *client,
 	INIT_LIST_HEAD(&ctx->mt_queue);
 
 	ctx->clk_xtal = devm_clk_get(dev, "xtal");
-	if (IS_ERR(ctx->clk_xtal)) {
-		dev_err(dev, "failed to get xtal clock from DT\n");
-		return PTR_ERR(ctx->clk_xtal);
-	}
+	if (IS_ERR(ctx->clk_xtal))
+		return probe_err(dev, ctx->clk_xtal, "failed to get xtal clock from DT\n");
 
 	if (!client->irq) {
 		dev_err(dev, "no irq provided\n");
@@ -2313,16 +2311,12 @@ static int sii8620_probe(struct i2c_client *client,
 					sii8620_irq_thread,
 					IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
 					"sii8620", ctx);
-	if (ret < 0) {
-		dev_err(dev, "failed to install IRQ handler\n");
-		return ret;
-	}
+	if (ret < 0)
+		return probe_err(dev, ret, "failed to install IRQ handler\n");
 
 	ctx->gpio_reset = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
-	if (IS_ERR(ctx->gpio_reset)) {
-		dev_err(dev, "failed to get reset gpio from DT\n");
-		return PTR_ERR(ctx->gpio_reset);
-	}
+	if (IS_ERR(ctx->gpio_reset))
+		return probe_err(dev, ctx->gpio_reset, "failed to get reset gpio from DT\n");
 
 	ctx->supplies[0].supply = "cvcc10";
 	ctx->supplies[1].supply = "iovcc18";
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
