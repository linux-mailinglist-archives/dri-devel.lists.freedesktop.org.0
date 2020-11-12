Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A10C2B0751
	for <lists+dri-devel@lfdr.de>; Thu, 12 Nov 2020 15:11:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F184D6E2A3;
	Thu, 12 Nov 2020 14:11:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01AD26E249
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Nov 2020 14:11:11 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20201112141059euoutp028690ddcd1eeb7b997a1dc6d160392cff~GyAlV6dEe1436014360euoutp025
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Nov 2020 14:10:59 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20201112141059euoutp028690ddcd1eeb7b997a1dc6d160392cff~GyAlV6dEe1436014360euoutp025
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1605190259;
 bh=6lyGsyIQRnO1IuwTnq84kfoSzkYQ7Jyzkt3YSw6gXik=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VlJSJPFNEQhXzLBOiQNgj3NigY9rllVCwK1WKmPr/CJfnEznva8pUHuYs1Ot5d2dj
 sLwf7xaAEsgJFEOcj3aNQiyNj0kXLA4NNYaHQoBZkTIowrWa0DrN41iZ+SUBUHpFyW
 leHi/scb2myZuEi7Cg1Yuuu746nBHBauoC6yrq0g=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20201112141054eucas1p11b681db57da737607808876e69a9be7e~GyAgIlRlc1698416984eucas1p1p;
 Thu, 12 Nov 2020 14:10:54 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 0E.B9.44805.D624DAF5; Thu, 12
 Nov 2020 14:10:53 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20201112141053eucas1p1acf592a7ece14104a408b77afebb9eed~GyAfrs9KX2134621346eucas1p1v;
 Thu, 12 Nov 2020 14:10:53 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20201112141053eusmtrp17516099eb5d554838d6d8ee262db638c~GyAfq1Cbo1178311783eusmtrp1C;
 Thu, 12 Nov 2020 14:10:53 +0000 (GMT)
X-AuditID: cbfec7f4-b37ff7000000af05-6b-5fad426dfb5f
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 89.0F.16282.D624DAF5; Thu, 12
 Nov 2020 14:10:53 +0000 (GMT)
Received: from AMDC3061.digital.local (unknown [106.120.51.75]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20201112141052eusmtip2ccc917644c7d599c11291d61b2753502~GyAe7MJLF2828528285eusmtip2s;
 Thu, 12 Nov 2020 14:10:52 +0000 (GMT)
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
To: georgi.djakov@linaro.org, cw00.choi@samsung.com, inki.dae@samsung.com
Subject: [PATCH v9 4/5] PM / devfreq: exynos-bus: Add registration of
 interconnect child device
Date: Thu, 12 Nov 2020 15:09:30 +0100
Message-Id: <20201112140931.31139-5-s.nawrocki@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201112140931.31139-1-s.nawrocki@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrKKsWRmVeSWpSXmKPExsWy7djPc7q5TmvjDS4ct7C4P6+V0WLjjPWs
 Fte/PGe1mH/kHKvFla/v2Sym793EZjHp/gQWi/PnN7BbbHp8jdXi8q45bBafe48wWsw4v4/J
 Yu2Ru+wWtxtXsFm07j3CbnH4TTurxYzJL9kcBD02repk87hzbQ+bx/3u40wem5fUe/RtWcXo
 8XmTXABbFJdNSmpOZllqkb5dAlfGr7332QoeCFbsn7GBuYHxCl8XIyeHhICJxIL3i1m6GLk4
 hARWMEqcWLACyvnCKNHbtp0RwvnMKLG68TQTTMv3hpPsEInljBL7uhYwwbWs37GdBaSKTcBQ
 ovdoH1A7B4eIgKfEyQZ9kBpmgWZmiYbmTYwgNcICiRK3JjwHm8oioCrR8u4TG4jNK2AtcWD5
 ZnaIbfISqzccYAaxOQVsJOY+bWUDGSQh8IZDYtXtF6wQRS4SB2bdYYGwhSVeHd8C1SwjcXpy
 DwtEQzOjRM/u2+wQzgRGifvHFzBCVFlL3Dn3iw3kVGYBTYn1u/Qhwo4Sb5o3s4KEJQT4JG68
 FQQJMwOZk7ZNZ4YI80p0tAlBVKtI/F41HRpCUhLdT/6zQJR4SCy5kwkJn35GiXPr/jBPYJSf
 hbBrASPjKkbx1NLi3PTUYqO81HK94sTc4tK8dL3k/NxNjMCUdPrf8S87GJe/+qh3iJGJg/EQ
 owQHs5IIr7LDmngh3pTEyqrUovz4otKc1OJDjNIcLErivElbgFIC6YklqdmpqQWpRTBZJg5O
 qQam4p/Kq5W0G9Q+M01cGrFt2gKtjisHXxad2frGNH4b01WTt94FVk6ilhKWFyazri5mOesa
 v+Ttm4Nmb/1LX59qXlBZ4Hkn688Z9giTWsc3K6Sf/3N8mTx9d4fmLpkVJ6WPbTr75vTGF7Yp
 RjXL7PfwPGArDK2uFBLsjHUtOpu/6rL8H44FufZl/KrhBQJHLyfczYpZ9nv+GrbSL0XT/v06
 HXJ8wccT1o6XLh9xeH7g7tmUcJ56Fa+JXzfKmGybFeXTO1N+Ue31rodP+FJefA/Zutl+oV+u
 ffe72/NTJMpzT/yvbHxfsJ9L9mxj+fm119IZHiU+5ZM9om7f35xRLd25by+bVsZJoQ3/DsuG
 SRxsV2Ipzkg01GIuKk4EAC+nHnO4AwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmplkeLIzCtJLcpLzFFi42I5/e/4Pd1cp7XxBv9mSFvcn9fKaLFxxnpW
 i+tfnrNazD9yjtXiytf3bBbT925is5h0fwKLxfnzG9gtNj2+xmpxedccNovPvUcYLWac38dk
 sfbIXXaL240r2Cxa9x5htzj8pp3VYsbkl2wOgh6bVnWyedy5tofN4373cSaPzUvqPfq2rGL0
 +LxJLoAtSs+mKL+0JFUhI7+4xFYp2tDCSM/Q0kLPyMRSz9DYPNbKyFRJ384mJTUnsyy1SN8u
 QS/j1977bAUPBCv2z9jA3MB4ha+LkZNDQsBE4nvDSfYuRi4OIYGljBL350xn7mLkAEpIScxv
 UYKoEZb4c62LDcQWEvjEKNHeIgJiswkYSvQe7WMEsUUEfCVWn5zEAjKHWWAys8Sj2y1gDcIC
 8RL75pxhB7FZBFQlWt59AovzClhLHFi+mR1igbzE6g0HmEFsTgEbiblPW6GWWUvs725jmsDI
 t4CRYRWjSGppcW56brGRXnFibnFpXrpecn7uJkZgfGw79nPLDsaVrz7qHWJk4mA8xCjBwawk
 wqvssCZeiDclsbIqtSg/vqg0J7X4EKMp0B0TmaVEk/OBEZpXEm9oZmBqaGJmaWBqaWasJM5r
 cgSoSSA9sSQ1OzW1ILUIpo+Jg1OqgWl5+MrfJ6pvT1u5UehBzaWYexIxTLPM52pevrOU2ZW3
 WaD9LTPbErdecae/919t3touLjrTd/6yNL76iPRPx1vtIz4XJetE7bK4/rRS7sYZtcwPfznq
 Z67cwd4weZ/ko7bza2Y4Fl8J8pzEaqivuWbO0dNu7dvzf76fdDxylbtspuQRVY0nG5/3C0V3
 x1ROv1I/7/WRXQVp3vmW0UKLdP9YiLd3Zu7U67l+oV9FbKble63lT36s8HjlljSR6W0a87Zk
 51KHwOs8+87/dr619biG7Zv95du+3Vn7wTq9Oen98qTdonNXr5j36eK3ZbH61ge6bgZt+/p+
 x+KNq/ll3V/qLt3T4nWoZs4GOa6DM9zClViKMxINtZiLihMBWxn57hgDAAA=
X-CMS-MailID: 20201112141053eucas1p1acf592a7ece14104a408b77afebb9eed
X-Msg-Generator: CA
X-RootMTR: 20201112141053eucas1p1acf592a7ece14104a408b77afebb9eed
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20201112141053eucas1p1acf592a7ece14104a408b77afebb9eed
References: <20201112140931.31139-1-s.nawrocki@samsung.com>
 <CGME20201112141053eucas1p1acf592a7ece14104a408b77afebb9eed@eucas1p1.samsung.com>
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
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 b.zolnierkie@samsung.com, dri-devel@lists.freedesktop.org,
 linux-pm@vger.kernel.org, sw0312.kim@samsung.com, a.swigon@samsung.com,
 robh+dt@kernel.org, linux-kernel@vger.kernel.org, myungjoo.ham@samsung.com,
 krzk@kernel.org, s.nawrocki@samsung.com, linux-arm-kernel@lists.infradead.org,
 m.szyprowski@samsung.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch adds registration of a child platform device for the exynos
interconnect driver. It is assumed that the interconnect provider will
only be needed when #interconnect-cells property is present in the bus
DT node, hence the child device will be created only when such a property
is present.

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
Acked-by: Chanwoo Choi <cw00.choi@samsung.com>
Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
Changes for v9:
 - whitespace (indentation) corrections.

Changes for v8...v6:
 - none.

Changes for v5:
 - new patch.
---
 drivers/devfreq/exynos-bus.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/devfreq/exynos-bus.c b/drivers/devfreq/exynos-bus.c
index 1e684a4..20447a4 100644
--- a/drivers/devfreq/exynos-bus.c
+++ b/drivers/devfreq/exynos-bus.c
@@ -24,6 +24,7 @@
 
 struct exynos_bus {
 	struct device *dev;
+	struct platform_device *icc_pdev;
 
 	struct devfreq *devfreq;
 	struct devfreq_event_dev **edev;
@@ -156,6 +157,8 @@ static void exynos_bus_exit(struct device *dev)
 	if (ret < 0)
 		dev_warn(dev, "failed to disable the devfreq-event devices\n");
 
+	platform_device_unregister(bus->icc_pdev);
+
 	dev_pm_opp_of_remove_table(dev);
 	clk_disable_unprepare(bus->clk);
 	if (bus->opp_table) {
@@ -168,6 +171,8 @@ static void exynos_bus_passive_exit(struct device *dev)
 {
 	struct exynos_bus *bus = dev_get_drvdata(dev);
 
+	platform_device_unregister(bus->icc_pdev);
+
 	dev_pm_opp_of_remove_table(dev);
 	clk_disable_unprepare(bus->clk);
 }
@@ -432,6 +437,18 @@ static int exynos_bus_probe(struct platform_device *pdev)
 	if (ret < 0)
 		goto err;
 
+	/* Create child platform device for the interconnect provider */
+	if (of_get_property(dev->of_node, "#interconnect-cells", NULL)) {
+		bus->icc_pdev = platform_device_register_data(
+						dev, "exynos-generic-icc",
+						PLATFORM_DEVID_AUTO, NULL, 0);
+
+		if (IS_ERR(bus->icc_pdev)) {
+			ret = PTR_ERR(bus->icc_pdev);
+			goto err;
+		}
+	}
+
 	max_state = bus->devfreq->profile->max_state;
 	min_freq = (bus->devfreq->profile->freq_table[0] / 1000);
 	max_freq = (bus->devfreq->profile->freq_table[max_state - 1] / 1000);
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
