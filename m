Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16215757D28
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 15:19:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7857110E129;
	Tue, 18 Jul 2023 13:19:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE7F010E129
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 13:19:24 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20230718131921euoutp01c89f55325e56da07078f80d62ad9f6f0~y_MstlBou1974719747euoutp01V
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 13:19:21 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20230718131921euoutp01c89f55325e56da07078f80d62ad9f6f0~y_MstlBou1974719747euoutp01V
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1689686361;
 bh=5SNmMp9eKDjetlMDcZ5YKQyIg9nPbHnUMUn5LGNutgA=;
 h=From:To:Cc:Subject:Date:References:From;
 b=SqznQBSBoDQfC0UyoQW7M90xCDPc919cm+qbJPEJ/9yeam9gE2YJr0dHv98U1UQCB
 MRB6BFKkUAZNJP1MpH+fvert7cw8O1WRDkN9uPOvLYafO1gcaYwXolBhZhgNYq618y
 zQO10uvATr7D231vgOtJXVNzZBSpY6/VCEiVl79c=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20230718131921eucas1p12b307c2ae3de4ef79f8faf9dcbcb8f23~y_MsR20-d2531625316eucas1p1J;
 Tue, 18 Jul 2023 13:19:21 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id DD.6C.11320.95196B46; Tue, 18
 Jul 2023 14:19:21 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20230718131920eucas1p2741bb07ea78b94afed99b8e5b74acee3~y_Mr6WqYJ2936229362eucas1p26;
 Tue, 18 Jul 2023 13:19:20 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20230718131920eusmtrp2897fa606340b1b28e0039ec13f01c610~y_Mr5oVYE1680016800eusmtrp2m;
 Tue, 18 Jul 2023 13:19:20 +0000 (GMT)
X-AuditID: cbfec7f4-993ff70000022c38-1d-64b691595cdc
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 7A.7E.14344.85196B46; Tue, 18
 Jul 2023 14:19:20 +0100 (BST)
Received: from AMDC4653.eu.corp.samsungelectronics.net (unknown
 [106.120.51.32]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20230718131920eusmtip1407229563ad483621535005531498115~y_MrQi23n1184611846eusmtip1i;
 Tue, 18 Jul 2023 13:19:20 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm: bridge: samsung-dsim: Fix waiting for empty cmd
 transfer FIFO on older Exynos
Date: Tue, 18 Jul 2023 15:18:59 +0200
Message-Id: <20230718131859.3114135-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sf0wTdxTP9+56PdGao5DxIssgiC6sEcHhvOnY1CzbiSPZzBwRYqSTkzZA
 KS34K2TWMRA7R0oVTI+lVbpYVmaHTNE6ArRBWzQObZwpprV/IBAYFRmYZRJg3g43//u8z/u8
 9/m85FG43C9ZRak1lZxOoyxNIWOIrpt/D67b09hVlFE/t4KJ2GcI5v6zKZIxR0wEM9tpIpkx
 mwsxA5O/E8zJxh+kzMX+sJSZrDuOmCn3Q8SYrUMSZqZ2gdy6gr04HZGwLYZ7BGvl/QTr5sNS
 tqXeImHt3eMY2+k8SbJ+UwBjQw+6STbyrQ9jGy470afL82PeK+JK1Qc53fr3C2NUtwbNSBuN
 P+yxuAgDssUa0TIK6Czo458TRhRDyek2BE3fnZeKxSwC61MLKRYzCE57QsTLkdqadkzActqB
 IGjfKYpqMXAHekihQdKZYIwa/8Xx9GqYb3QiAeP0rzj0X60WcBzNwZDR8WIRRRH0GugJZAm0
 jP4A7OeduOiVBL2eO7jIx8KA5TEhrkmCmistuOAL9CwFl75xYOLAh/AsGl0KGgcTvstSEb8O
 i24bJg6cQHBuLrJUmBAYxh4iUbUFQr89J4VEOJ0GP19fL9LbwHCmTSLQQK+EYDRWDLESzF1n
 cZGWQX2dXFSvBd7n+s/WczewdAsLHv4mIcjl9F64/X2ZCSXzr1zGv3IZ/3+Ecwh3ogSuSl9W
 zOk3aLhD6Xplmb5KU5y+v7ysE714ttsLvtlryDExne5FGIW8CCg8JV72l7OzSC4rUh45yunK
 9+mqSjm9FyVSREqCTJE9sF9OFysruRKO03K6l12MWrbKgOUwc8FTHfcK23JuFeSN5P5CWc4M
 b27If3PXR7nXyzfK1Oo7Yc3aigPv7v4q5Lo0ZnqD4j+pfHK2Ny1jUdVccWDr4OSDnz7vK/BW
 j7aON605vCPbP9xDu/LcM7K3R2yvKSG1aSJDX2K9cELrVVTY3xk6tN3xR1dqvFcW2xFSNH9t
 /dLGti6Yk5MK8611UcVexTiX0FFtbp1IJJW+kmtTiRXNqv6aj0cPbpueH9buDmbVj/Y+Srpi
 awhn+gM3gnzqsSOcu3Z18tXGH9v3dWuOfdb2KI7ckHtqcZNlqM5VrGlVL7bf+CJi845ENx5P
 y9E+DfuXj6qy87fn9d0PFtyd/9OdQuhVysy3cJ1e+Q/GO+PN2wMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprPIsWRmVeSWpSXmKPExsVy+t/xu7oRE7elGKx+YmBxf/FnFosrX9+z
 WUy6P4HF4sumCWwWz+evY7Q4+eYqi0XnxCXsFmuP3GW3eNPWyGjxfuctRotJ826yWnxu/cfm
 wOOx9uN9Vo/ZDRdZPObNOsHisXPWXXaP2R0zWT0W73nJ5LFpVSebx4kJl5g87lzbw+Zxv/s4
 k0ffllWMAdxRejZF+aUlqQoZ+cUltkrRhhZGeoaWFnpGJpZ6hsbmsVZGpkr6djYpqTmZZalF
 +nYJehmnzk9iLHgrUnFw5jqWBsb5gl2MnBwSAiYSrc2rmboYuTiEBJYySqyY8JIVIiEjcXJa
 A5QtLPHnWhcbRFEzk8SSuS1sIAk2AUOJrrddYLaIgLLE34mrGEFsZoHDzBJr2gpBbGGBZIm/
 s04CxTk4WARUJfZdMgEJ8wrYSyxeuIoZYr68xP6DZ5kh4oISJ2c+YYEYIy/RvHU28wRGvllI
 UrOQpBYwMq1iFEktLc5Nzy020itOzC0uzUvXS87P3cQIjKltx35u2cG48tVHvUOMTByMhxgl
 OJiVRHi/r9qUIsSbklhZlVqUH19UmpNafIjRFOi8icxSosn5wKjOK4k3NDMwNTQxszQwtTQz
 VhLn9SzoSBQSSE8sSc1OTS1ILYLpY+LglGpgcjuZemG3jfGVhEtqoS5HpVtN/qzQZO+oNeW4
 c2xCR5VN0+6b8Qry07NTzh8wVLuu98LjxJ59dicM7j7fuGzCqZ6pdW/2GB4qM5gaWnJc76jf
 Z9+Mjd/k723UbopLCNjK9/DLqwkiiw/tFHhdvPPD/M2cJT9NWZZ7zk+fenJdvaV6fNH/FX/n
 X72+4HTEoZvyFceLyydd+hVR+GtR7qSK16qtatyzJ2z5dPZn4uZVPEXzNr8O/TMlde9hMd3t
 2a/1D+9xZwpI7Nr6bqbLI8svIbaMd19mHvwQemnNCod/O38fe+Ny+GjRnyf8EmobzgqKXu3+
 7n1X0uZ41PVZ4n53D3DUVrw9ulWp+uil6N1uFopZSizFGYmGWsxFxYkAIIYV0jIDAAA=
X-CMS-MailID: 20230718131920eucas1p2741bb07ea78b94afed99b8e5b74acee3
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20230718131920eucas1p2741bb07ea78b94afed99b8e5b74acee3
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20230718131920eucas1p2741bb07ea78b94afed99b8e5b74acee3
References: <CGME20230718131920eucas1p2741bb07ea78b94afed99b8e5b74acee3@eucas1p2.samsung.com>
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
If I remember right, the problem with waiting for the empty command
transfer FIFO was there from the begging of the Exynos DSI driver and
Tomash Figa and Andrzej Hajda used a workaround based on waiting until
the DSIM_SFR_HEADER_FULL bit gets cleared. So far it worked well enough
on the older Exynos SoCs, but indeed there is no point using it on the
properly working hardware, like Exynos 5433 or IMX.

Marek Szyprowski
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 11 +++++++++--
 include/drm/bridge/samsung-dsim.h     |  1 +
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index 9b7a00bafeaa..80eb268d5868 100644
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
@@ -1009,8 +1011,13 @@ static int samsung_dsim_wait_for_hdr_fifo(struct samsung_dsim *dsi)
 	do {
 		u32 reg = samsung_dsim_read(dsi, DSIM_FIFOCTRL_REG);
 
-		if (reg & DSIM_SFR_HEADER_EMPTY)
-			return 0;
+		if (!dsi->driver_data->has_broken_fifoctrl_emptyhdr) {
+			if (reg & DSIM_SFR_HEADER_EMPTY)
+				return 0;
+		} else {
+			if (!(reg & DSIM_SFR_HEADER_FULL))
+				return 0;
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

