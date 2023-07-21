Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB07975C5DB
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jul 2023 13:28:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7D5610E657;
	Fri, 21 Jul 2023 11:28:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F49E10E658
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jul 2023 11:28:45 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20230721112843euoutp011b2b9f67e752f19452102671ca635575~z3n9YfpUI1907519075euoutp01L
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jul 2023 11:28:43 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20230721112843euoutp011b2b9f67e752f19452102671ca635575~z3n9YfpUI1907519075euoutp01L
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1689938923;
 bh=IQ043OEurud0+gvH+yRscrI4GAiKGvwDZ/BhQEd7gGA=;
 h=From:To:Cc:Subject:Date:References:From;
 b=tZs+g5U4Scp2LNC3TuVt2w+KyqOlwDb3jciTJDF0NgAyPtcUlp3l2d0p+UpC/dEp9
 BG2P1V6eR1whvwEN6VVtlMH+oB5eERTkeJ26K+SxRWqysVVuaM73k01vv+kWRfFBvg
 RdcyOqz6qp7+Euo9k7s+QKHIrgHQ8X+kZv/p5OVA=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20230721112843eucas1p27bb2702982eb9b7e5c043e41f1cf5051~z3n9Dy3OJ1162011620eucas1p2m;
 Fri, 21 Jul 2023 11:28:43 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 18.1A.42423.BEB6AB46; Fri, 21
 Jul 2023 12:28:43 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20230721112842eucas1p2071651599fd2b86792b84aa3770fba67~z3n8mno_H1162011620eucas1p2l;
 Fri, 21 Jul 2023 11:28:42 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20230721112842eusmtrp1d4d4d54e7f7e49570fce8ad28fba9254~z3n8l_kWR2971729717eusmtrp1V;
 Fri, 21 Jul 2023 11:28:42 +0000 (GMT)
X-AuditID: cbfec7f2-a3bff7000002a5b7-ad-64ba6beb3dda
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id C1.CA.10549.AEB6AB46; Fri, 21
 Jul 2023 12:28:42 +0100 (BST)
Received: from AMDC4653.eu.corp.samsungelectronics.net (unknown
 [106.120.51.32]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20230721112842eusmtip13ae7603ecc127760410db400046750f1~z3n76JZTc1394613946eusmtip1M;
 Fri, 21 Jul 2023 11:28:42 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2] drm: bridge: samsung-dsim: Fix waiting for empty cmd
 transfer FIFO on older Exynos
Date: Fri, 21 Jul 2023 13:28:32 +0200
Message-Id: <20230721112832.2273167-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA02SbUxTZxTH89yXcu0sXCqOMzEBMSw6HIhx5pqB1qjhJvswzDLNNKjVXgtS
 EHrBTiUNgrxVggUUpFVRgbkURYeIWmGkBLxUMjeRoXRgEzbX6ERgFEOrEinXt2+/8z9v//Pk
 oXD5HXIBlZyWyWnTlJpwiZRoue35/cv/Uqyq5cbcAMZZO0EwfZOjEqbcaSQYd5NRwrhqGhFj
 f/YnwRSX1fkxlzqH/JhnBYcRM3rTgZjyMwMkM5E/LVHMZS+NO0nWnHOPYM+Yugn2pmnIjzUX
 VZNsbesTjG2yFEvYbmMvxg72t0pY51EBY0ubLSjhk63SWBWnSd7PaaPX7JQm9dcXEemNQT/2
 eTvIHDREG9AcCuiV4Kq5jgxISsnpnxHcPZVHiIEbwfPhc5gYTCC476nD3rWMjY6RYuICgsc/
 TeC+hJzOx2C4d72PJXQMGEYMEh8H0YvhdZkF+Rinb+HQeT3bx/PoJCgcEGZrCDoCSiqOzM6R
 0WvBUdBKiMtCod3221s9EOzV/xDinFDIu2bGfSaAHqOgotz71t0G+NU0RYo8D54KzX4iL4Se
 ihJCbChEcPalExMDI4IclwOJVV/D4F3vjCVqZsVSuGyNFuV1cON+6awMtD88HAkUTfhDeUsV
 LsoyKCqQi9Wfg0lofL/W9kcvLjILV/OdpPhWiXDeO44ZUZjpo9NMH51m+uDhLMItKJjL4lPV
 HB+TxumieGUqn5Wmjtq9L7UJzXy3nmnh/xvo9NPxqA6EUagDAYWHB8nUaqtKLlMpDxzktPt2
 aLM0HN+BQigiPFgWGWffLafVykwuhePSOe27LEbNWZCDlUCzDg9bOXAhd/1Rze0XXckbhV/y
 aotPqB6ygoPvMth11oj0rIs/lCyyb65ttx3fq4/f6z54qmvZk4uOmsrPBvG2rpGMVR4h/fV2
 WdmaTVUNiYqB+syexvadCVXuwThqWj/3r/4HqvGkVynz6eGQjapqvevkd/V93d9Y9bdibNa2
 3OXfX16tydBGN6zAQ/0f2b41WxRXpHznJmHL37rJSl19g2vHkubs2NGoV3HbQgLMnpO4NJ78
 Fw3Jww7hiegrdWGsom/P6tLC6oa6wweUuf0KfcJUtiN+SYvbEzAldx03DX8a+Bi9DM54UfDg
 2GTiroh45f7IrZF72oxqu5cMJ/gkZcwXuJZXvgEDPMr33QMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprPIsWRmVeSWpSXmKPExsVy+t/xu7qvsnelGFw5pWdxf/FnFosrX9+z
 WUy6P4HF4sumCWwWz+evY7Q4+eYqi0XnxCXsFmuP3GW3eNPWyGjxfuctRotJ826yWnxu/cfm
 wOOx9uN9Vo/ZDRdZPObNOsHisXPWXXaP2R0zWT0W73nJ5LFpVSebx4kJl5g87lzbw+Zxv/s4
 k0ffllWMAdxRejZF+aUlqQoZ+cUltkrRhhZGeoaWFnpGJpZ6hsbmsVZGpkr6djYpqTmZZalF
 +nYJehnXlnawFKwTqbjy6xBrA+NdgS5GTg4JAROJD+8/sHYxcnEICSxllNi4YB8LREJG4uS0
 BlYIW1jiz7UuNoiiZiaJc++usoEk2AQMJbredoHZIgLKEn8nrmIEsZkFDjNLrGkr7GLk4BAW
 SJOY9VwQJMwioCrRM7mFGcTmFbCXuNW2B2qXvMT+g2eh4oISJ2c+YYEYIy/RvHU28wRGvllI
 UrOQpBYwMq1iFEktLc5Nzy021CtOzC0uzUvXS87P3cQIjKltx35u3sE479VHvUOMTByMhxgl
 OJiVRHjT03elCPGmJFZWpRblxxeV5qQWH2I0BbpvIrOUaHI+MKrzSuINzQxMDU3MLA1MLc2M
 lcR5PQs6EoUE0hNLUrNTUwtSi2D6mDg4pRqYjuz9tCgn5WXIkUMBk8/JzIyyMF2zuO3T+Wve
 MmXnHV7Pb6jOdxMz3S/+97mlWVH+55NxRzdr7bO7vfe5dadhldjF0Mfh4ptDFqzUC3vx3XOy
 yR5RB/H9W5Pf/vdrL73H/13FttCAvXUHg8tvwaVadatSP5Vt4xWV1E954Ccg9/J9spwwzzuN
 R0EXDt4+qGJvlRD14Zr1rAs/uO6fDgkv533IbiEoa2w2dc9Fv09NujyHpxtUJWRuWWxSvM0x
 LUr4ucLNKRpb10xeX+RZ0ljx5v8np/nnT0WcP8fCHfHvOf8+kb7NhQoy6VNvvLnS+iVFcU70
 7DWyNndf5yuG7mZuu7KwN2ke7wz9vPB/EYx/lViKMxINtZiLihMBUgvkJzIDAAA=
X-CMS-MailID: 20230721112842eucas1p2071651599fd2b86792b84aa3770fba67
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20230721112842eucas1p2071651599fd2b86792b84aa3770fba67
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20230721112842eucas1p2071651599fd2b86792b84aa3770fba67
References: <CGME20230721112842eucas1p2071651599fd2b86792b84aa3770fba67@eucas1p2.samsung.com>
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
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Tomasz Figa <tfiga@chromium.org>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Samsung DSIM used in older Exynos SoCs (like Exynos 4210, 4x12, 3250)
doesn't report empty level of packer header FIFO. In case of those SoCs,
use the old way of waiting for empty command tranfsfer FIFO, removed
recently by commit 14806c641582 ("Drain command transfer FIFO before
transfer").

Fixes: 14806c641582 ("Drain command transfer FIFO before transfer")
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
v2:
- added additional delay when workaround is used as suggested by Marek Vasut

v1: https://lore.kernel.org/all/20230718131859.3114135-1-m.szyprowski@samsung.com/
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 18 ++++++++++++++++--
 include/drm/bridge/samsung-dsim.h     |  1 +
 2 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index 9b7a00bafeaa..d06401de637c 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -412,6 +412,7 @@ static const struct samsung_dsim_driver_data exynos3_dsi_driver_data = {
 	.m_min = 41,
 	.m_max = 125,
 	.min_freq = 500,
+	.has_broken_fifoctrl_emptyhdr = 1,
 };
 
 static const struct samsung_dsim_driver_data exynos4_dsi_driver_data = {
@@ -428,6 +429,7 @@ static const struct samsung_dsim_driver_data exynos4_dsi_driver_data = {
 	.m_min = 41,
 	.m_max = 125,
 	.min_freq = 500,
+	.has_broken_fifoctrl_emptyhdr = 1,
 };
 
 static const struct samsung_dsim_driver_data exynos5_dsi_driver_data = {
@@ -1009,8 +1011,20 @@ static int samsung_dsim_wait_for_hdr_fifo(struct samsung_dsim *dsi)
 	do {
 		u32 reg = samsung_dsim_read(dsi, DSIM_FIFOCTRL_REG);
 
-		if (reg & DSIM_SFR_HEADER_EMPTY)
-			return 0;
+		if (!dsi->driver_data->has_broken_fifoctrl_emptyhdr) {
+			if (reg & DSIM_SFR_HEADER_EMPTY)
+				return 0;
+		} else {
+			if (!(reg & DSIM_SFR_HEADER_FULL)) {
+				/*
+				 * Wait a little bit, so the pending data can
+				 * actually leave the FIFO to avoid overflow.
+				 */
+				if (!cond_resched())
+					usleep_range(950, 1050);
+				return 0;
+			}
+		}
 
 		if (!cond_resched())
 			usleep_range(950, 1050);
diff --git a/include/drm/bridge/samsung-dsim.h b/include/drm/bridge/samsung-dsim.h
index 05100e91ecb9..18017b3e5d9e 100644
--- a/include/drm/bridge/samsung-dsim.h
+++ b/include/drm/bridge/samsung-dsim.h
@@ -62,6 +62,7 @@ struct samsung_dsim_driver_data {
 	const unsigned int *reg_values;
 	u16 m_min;
 	u16 m_max;
+	unsigned int has_broken_fifoctrl_emptyhdr;
 };
 
 struct samsung_dsim_host_ops {
-- 
2.34.1

