Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D0A36B28C9
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 16:25:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1F0010E819;
	Thu,  9 Mar 2023 15:24:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24AA810E819
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Mar 2023 15:24:55 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20230309152454euoutp02b3b392eee6a48bc09aaeb1dcfce902e9~KyZ6jqamI3040530405euoutp02G
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Mar 2023 15:24:54 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20230309152454euoutp02b3b392eee6a48bc09aaeb1dcfce902e9~KyZ6jqamI3040530405euoutp02G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1678375494;
 bh=1faJVX5Kb2yIpI/XJhLzAq6nIArsD3/2jIyL3Bmnadk=;
 h=From:To:Cc:Subject:Date:References:From;
 b=QjUsqYzdG7A1ccT2lwgn563RaocmGY8vIV8F/dybIExFKHC3Fw/qzG0r8+JVueUH2
 hFSTCDCAIXlRvyA27uzVJRu6Ch2AKW8CUHIvq2GKBJ69te4R7avcBWtTPk1wZ01IsD
 beGKJWu7esd/hHmadXtxX6W51Zrw9h/uYeDt5uOo=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20230309152453eucas1p293142f0eadcb75bf2e31465ff1ab487d~KyZ6H4uNN0249702497eucas1p2N;
 Thu,  9 Mar 2023 15:24:53 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 8D.07.09503.54AF9046; Thu,  9
 Mar 2023 15:24:53 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20230309152453eucas1p28e1870593875304648243c9dead4b256~KyZ5yQBgG2942629426eucas1p2D;
 Thu,  9 Mar 2023 15:24:53 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20230309152453eusmtrp1165f6ce04162f3de2bc7626c34f181d1~KyZ5xoz8i2522825228eusmtrp1-;
 Thu,  9 Mar 2023 15:24:53 +0000 (GMT)
X-AuditID: cbfec7f2-e8fff7000000251f-0f-6409fa459bad
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 29.8E.09583.54AF9046; Thu,  9
 Mar 2023 15:24:53 +0000 (GMT)
Received: from AMDC2765.eu.corp.samsungelectronics.net (unknown
 [106.120.51.73]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20230309152452eusmtip1c87ad0d57cf96c16cc4c3d4c7e496311~KyZ5DA5uI0767807678eusmtip1B;
 Thu,  9 Mar 2023 15:24:52 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org
Subject: [PATCH] drm/meson: dw-hdmi: Fix devm_regulator_*get_enable*()
 conversion again
Date: Thu,  9 Mar 2023 16:24:46 +0100
Message-Id: <20230309152446.104913-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrCKsWRmVeSWpSXmKPExsWy7djP87quvzhTDD63GFqcuL6IyWLqwyds
 Fv+3TWS2uPL1PZvFm0dHmC1+tm9hslgwm9ti7ZG77BbHFp1ksZiz9ASLxfudtxgt/h39zuzA
 4/H+Riu7x467Sxg99n5bwOKxc9Zddo+nEyaze2xa1cnmcefaHjaP+93HmTw2L6n36NuyijGA
 K4rLJiU1J7MstUjfLoEr4+CvNywFrzgq3v1eytzAeI69i5GTQ0LARGLuzvXMXYxcHEICKxgl
 Ol//Z4dwvjBKNO7rY4RwPjNK/Jh8iA2m5XJ/P1TVcqCWlUug+luZJHbcaQAbzCZgKNH1tgus
 Q0TATeLHgclgo5gFDjBLHNn+HKiIg0NYIFLi4AI5kBoWAVWJ/d2rmEBsXgE7iZbJX6EOlJfY
 f/AsM0RcUOLkzCcsIDYzULx562ywxRICPzgkGluusUI0uEis3z8H6lRhiVfHt0ANkpE4PbmH
 BaKhnVFiwe/7TBDOBEaJhue3GCGqrCXunPvFBnIds4CmxPpd+hBhR4mfK7aDHS0hwCdx460g
 xBF8EpO2TWeGCPNKdLQJQVSrScw6vg5u7cELl5ghbA+JH3OPgJ0pJBArsXfPLPYJjAqzkLw2
 C8lrsxBuWMDIvIpRPLW0ODc9tdgwL7Vcrzgxt7g0L10vOT93EyMwoZ3+d/zTDsa5rz7qHWJk
 4mA8xCjBwawkwvtdiiNFiDclsbIqtSg/vqg0J7X4EKM0B4uSOK+27clkIYH0xJLU7NTUgtQi
 mCwTB6dUA5NM04mEpbP/LvarZmN61xtkxWIdpnlaXdZ/0xmTsGWZZkomoi+vlnPuPhC0k/Pi
 4oVc3hJuO/oul0WEbhNwuWG4ydjS/3zs6a8cv8TS/YwiUuLWCLbqJMeIXFY8en+Ns42oZLmV
 6JNrWzd5O9YpzVBf2ha8Xnm1z271R0ePn32ZLvW2ad/D7/HhDavEzzpe0EvcL938RuagyzvW
 6Yl22xtfHljwTpSjwYK1M3na+7xKBgG9I5ziNxM0ONbLFFzYZfEy2ajhR6OzIdOkc7ZWP70d
 nq/5IPpD8ciM7s8cmwSnPD8SUujzZWV7jcWFfXqMkqtqPvxR12+QsZ42zfLZrPjmqVo8GrwP
 v349eKNXRImlOCPRUIu5qDgRAN7QKHTXAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrPIsWRmVeSWpSXmKPExsVy+t/xu7quvzhTDH5vELU4cX0Rk8XUh0/Y
 LP5vm8hsceXrezaLN4+OMFv8bN/CZLFgNrfF2iN32S2OLTrJYjFn6QkWi/c7bzFa/Dv6ndmB
 x+P9jVZ2jx13lzB67P22gMVj56y77B5PJ0xm99i0qpPN4861PWwe97uPM3lsXlLv0bdlFWMA
 V5SeTVF+aUmqQkZ+cYmtUrShhZGeoaWFnpGJpZ6hsXmslZGpkr6dTUpqTmZZapG+XYJexsFf
 b1gKXnFUvPu9lLmB8Rx7FyMnh4SAicTl/n4gm4tDSGApo0THz05miISMxMlpDawQtrDEn2td
 bCC2kEAzk0TzC00Qm03AUKLrLURcRMBD4uLrBjaQQcwCx5gl9i3pB0sIC4RLtHZ+AxvKIqAq
 sb97FROIzStgJ9Ey+SvUFfIS+w+eZYaIC0qcnPmEpYuRA2iQusT6eUIgYWagkuats5knMPLP
 QlI1C6FqFpKqBYzMqxhFUkuLc9Nzi430ihNzi0vz0vWS83M3MQJjbtuxn1t2MK589VHvECMT
 B+MhRgkOZiUR3u9SHClCvCmJlVWpRfnxRaU5qcWHGE2Brp7ILCWanA+M+rySeEMzA1NDEzNL
 A1NLM2MlcV7Pgo5EIYH0xJLU7NTUgtQimD4mDk6pBqaQBfYLYoX5e4tmhTYa7S54cSXUadvV
 j9/jreQjwmOqeLbOj1wUXaGz+FTB5PO6u6NUZO7vTH0pkfNxZtK9A3ctjqyQ2D1/V1W/nVFV
 SQDLe4ugq2fC+Tymfn7xPSBA8bsbp+zljQs+nD3g16b57MOtdWHFIo9na+32lvZ8d+fhKjVr
 nmTL+ruzK24XXGTh0Lu49v9Pl6w4lY3BqVo8ptarbTSa1++L6pa877Veds6D8hs9u9+23tsn
 knxOti/F/o7Ii5nK9xe0v2j5k2LlqL1HoLD01vrn+7OfmrzQ9qpRWPzr9oaLwl0el7h51jVf
 W7Fi2b8lIYZvooK/Cj6xY2G1ls463SehWdB7Rcy1z1uJpTgj0VCLuag4EQACR+XWQgMAAA==
X-CMS-MailID: 20230309152453eucas1p28e1870593875304648243c9dead4b256
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20230309152453eucas1p28e1870593875304648243c9dead4b256
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20230309152453eucas1p28e1870593875304648243c9dead4b256
References: <CGME20230309152453eucas1p28e1870593875304648243c9dead4b256@eucas1p2.samsung.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 =?UTF-8?q?Ricardo=20Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>,
 Matti Vaittinen <mazziesaccount@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, Mark Brown <broonie@kernel.org>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

devm_regulator_get_enable_optional() returns -ENODEV if requested
optional regulator is not present. Adjust code for that, because in the
67d0a30128c9 I've incorrectly assumed that it also returns 0 when
regulator is not present.

Reported-by: Ricardo Cañuelo <ricardo.canuelo@collabora.com>
Fixes: 67d0a30128c9 ("drm/meson: dw-hdmi: Fix devm_regulator_*get_enable*() conversion")
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/gpu/drm/meson/meson_dw_hdmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
index 534621a13a34..3d046878ce6c 100644
--- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
@@ -718,7 +718,7 @@ static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
 	dw_plat_data = &meson_dw_hdmi->dw_plat_data;
 
 	ret = devm_regulator_get_enable_optional(dev, "hdmi");
-	if (ret < 0)
+	if (ret < 0 && ret != -ENODEV)
 		return ret;
 
 	meson_dw_hdmi->hdmitx_apb = devm_reset_control_get_exclusive(dev,
-- 
2.34.1

