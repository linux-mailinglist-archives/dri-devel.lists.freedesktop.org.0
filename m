Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A7A6C77631C
	for <lists+dri-devel@lfdr.de>; Wed,  9 Aug 2023 16:56:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F29110E0B4;
	Wed,  9 Aug 2023 14:56:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CCFC10E0B4
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Aug 2023 14:56:52 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20230809145650euoutp02bbcb17067c15690b995ca3817af1dcf9~5vuFrVfWa1155811558euoutp02p
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Aug 2023 14:56:50 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20230809145650euoutp02bbcb17067c15690b995ca3817af1dcf9~5vuFrVfWa1155811558euoutp02p
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1691593010;
 bh=HAlAesE0BjCgDLJLgmI4YUdhZFr0SXUgrtK+H7JNwHE=;
 h=From:To:Cc:Subject:Date:References:From;
 b=RzwGFFBeR+FFZg1+OQyLWm4AVPIwaWIiLWbx2pq042H19KxM83ghc148mt0NpmSDw
 venvNHC8ezTH3Zw9393Xsx6i+AOZkyBGSMTY93am6p4+2cx/cfL+oEDDuTevC1aMhT
 E+3PHA7aXjyDDKHEZoP990H3qEZCKQJcbgnHJnAw=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20230809145650eucas1p17429ab1a944b18adadc94ee2a4c988a3~5vuFUgJD82459124591eucas1p1S;
 Wed,  9 Aug 2023 14:56:50 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id CA.98.37758.139A3D46; Wed,  9
 Aug 2023 15:56:49 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20230809145649eucas1p1bb67f98aa4b2987b263b0fd84204d8a2~5vuE2M7EC2458724587eucas1p1H;
 Wed,  9 Aug 2023 14:56:49 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20230809145649eusmtrp1830cc2870bfc058afaa91d3481262bf8~5vuE1XSZL2119721197eusmtrp1u;
 Wed,  9 Aug 2023 14:56:49 +0000 (GMT)
X-AuditID: cbfec7f5-7ffff7000002937e-c6-64d3a931be73
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 33.B3.10549.139A3D46; Wed,  9
 Aug 2023 15:56:49 +0100 (BST)
Received: from AMDC4653.eu.corp.samsungelectronics.net (unknown
 [106.120.51.32]) by eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20230809145648eusmtip26efa07886556648f91b57bab35a8d9cd~5vuEKWJ-D0445804458eusmtip2e;
 Wed,  9 Aug 2023 14:56:48 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4] drm: bridge: samsung-dsim: Fix waiting for empty cmd
 transfer FIFO on older Exynos
Date: Wed,  9 Aug 2023 16:56:41 +0200
Message-Id: <20230809145641.3213210-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrDKsWRmVeSWpSXmKPExsWy7djP87qGKy+nGCydaWVxf/FnFosrX9+z
 WTy86m8x6f4EFosvmyawWTyfv47R4uSbqywWnROXsFusPXKX3eJNWyOjxfudtxgtJs27yWrx
 ufUfmwOvx9qP91k9ZjdcZPGYN+sEi8fOWXfZPWZ3zGT1WLznJZPHplWdbB4nJlxi8rhzbQ+b
 x/3u40wefVtWMQZwR3HZpKTmZJalFunbJXBldM0WL1gtWfH55WqmBsZPIl2MHBwSAiYSp58o
 djFycQgJrGCUaDw8kwXC+QLkzH7K2sXICeR8ZpTobHAGsUEafrx+wA4RX84o8fkaG0RDK5PE
 5s8/wRJsAoYSXW+72EBsEQFlib8TVzGCFDEL3GeW6Jh8mxEkISyQIfHvWSdYEYuAqsTk7SvA
 mnkF7CUWLZ/GCrFNXmL/wbPMEHFBiZMzn7CA2MxA8eats5lBhkoIfOGQ6NnxnAmiwUXi0eV7
 bBC2sMSr41vYIWwZidOTe1ggGtoZJRb8vs8E4UxglGh4fosRospa4s65X2ygkGEW0JRYv0sf
 Iuwo8WjzD3ZIgPFJ3HgrCHEEn8SkbdOZIcK8Eh1tQhDVahKzjq+DW3vwwiVmCNtDYu3TjUyQ
 kIuVmPf1G+sERoVZSF6bheS1WQg3LGBkXsUonlpanJueWmycl1quV5yYW1yal66XnJ+7iRGY
 4E7/O/51B+OKVx/1DjEycTAeYpTgYFYS4bUNvpQixJuSWFmVWpQfX1Sak1p8iFGag0VJnFfb
 9mSykEB6YklqdmpqQWoRTJaJg1OqgYmXR7HPYZL7ySuR3AJTwlk+S/1f2ZDYNmnv0vlsay7/
 C/Jc7Kz8ctEMLTGRRh355n1umlZRM1+5RuVKer/lnDo1xzC18Fu359dGjWxVVT/uugN+ZWsW
 XwpcoRjt0XLnPYO0neDTC12GDwPcf4klrcyu1Cxx+l30cf3kxFox2e8seWtuc6T/PXjzY+IN
 drOdvTGnazXqNmTZ76ot+5R47ysbe8fcFcXbs3R6VdY8+PshT3jRiqtTX9w1Ez4dG8VWxZQf
 Elbe4i6ZIhgq8Uav6sXka7GXXzNsdDSL9tbmYjefztAeU3eX7VzMzwNel/6p5c1qX6SisKfh
 daitTPZCfteEdo51ZqxXvsecvfFOiaU4I9FQi7moOBEAKUZQUt8DAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrMIsWRmVeSWpSXmKPExsVy+t/xe7qGKy+nGLx7LmNxf/FnFosrX9+z
 WTy86m8x6f4EFosvmyawWTyfv47R4uSbqywWnROXsFusPXKX3eJNWyOjxfudtxgtJs27yWrx
 ufUfmwOvx9qP91k9ZjdcZPGYN+sEi8fOWXfZPWZ3zGT1WLznJZPHplWdbB4nJlxi8rhzbQ+b
 x/3u40wefVtWMQZwR+nZFOWXlqQqZOQXl9gqRRtaGOkZWlroGZlY6hkam8daGZkq6dvZpKTm
 ZJalFunbJehldM0WL1gtWfH55WqmBsZPIl2MnBwSAiYSP14/YAexhQSWMkrs3p0EEZeRODmt
 gRXCFpb4c62LrYuRC6immUli4f7pTCAJNgFDia63IAlODhEBZYm/E1cxghQxC7xkltj2+RQj
 SEJYIE1iy5oVYA0sAqoSk7evANvGK2AvsWj5NKgN8hL7D55lhogLSpyc+YQFxGYGijdvnc08
 gZFvFpLULCSpBYxMqxhFUkuLc9Nziw31ihNzi0vz0vWS83M3MQJja9uxn5t3MM579VHvECMT
 B+MhRgkOZiURXtvgSylCvCmJlVWpRfnxRaU5qcWHGE2B7pvILCWanA+M7rySeEMzA1NDEzNL
 A1NLM2MlcV7Pgo5EIYH0xJLU7NTUgtQimD4mDk6pBqYNgZvv/rBquHCt55rXrGtPGDpnOj5t
 yprHor5qe0L5MkebL5s7+8rVU1ncRc9zK1xl/VQa8lDe8b2Nj2jm/2937s+ySzVwz3NZkyWl
 o3PaxibeWsbK5SOLXPj/naY1bZVfpZYfa+kR2SHTG229+pdOk+PxvVWdyVFzDOfasp2uUz7z
 XSKV9SfrKn+lU/s3K72y2/xg+eOgHzJqm1dvrCvdFnfnhtena/dss2RenXxUqrzM0dJoixzb
 8gSjCYki96M8zJle5CR/6mrZfH6uz9rOW/88D/16xhYiKNNx4ejTkK1fO4usrJyieazWK5g9
 FZsfFr+s+ntjrqi14okuCf3ZfwO++Lz+3/Zt9Qv2e0osxRmJhlrMRcWJAHsWAqM2AwAA
X-CMS-MailID: 20230809145649eucas1p1bb67f98aa4b2987b263b0fd84204d8a2
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20230809145649eucas1p1bb67f98aa4b2987b263b0fd84204d8a2
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20230809145649eucas1p1bb67f98aa4b2987b263b0fd84204d8a2
References: <CGME20230809145649eucas1p1bb67f98aa4b2987b263b0fd84204d8a2@eucas1p1.samsung.com>
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

Fixes: 14806c641582 ("drm: bridge: samsung-dsim: Drain command transfer FIFO before transfer")
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
v4:
- made has_broken_fifoctrl_emptyhdr a bitfield

v3:
- fixed 'fixes' tag, added reviewed-by

v2:
- added additional delay when workaround is used as suggested by Marek Vasut

v1: https://lore.kernel.org/all/20230718131859.3114135-1-m.szyprowski@samsung.com/
---

Samsung DSIM used in older Exynos SoCs (like Exynos 4210, 4x12, 3250)
doesn't report empty level of packer header FIFO. In case of those SoCs,
use the old way of waiting for empty command tranfsfer FIFO, removed
recently by commit 14806c641582 ("Drain command transfer FIFO before
transfer").

Fixes: 14806c641582 ("Drain command transfer FIFO before transfer")
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 18 ++++++++++++++++--
 include/drm/bridge/samsung-dsim.h     |  1 +
 2 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index c49091691ab1..35d29f6cd3e2 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -413,6 +413,7 @@ static const struct samsung_dsim_driver_data exynos3_dsi_driver_data = {
 	.m_min = 41,
 	.m_max = 125,
 	.min_freq = 500,
+	.has_broken_fifoctrl_emptyhdr = 1,
 };
 
 static const struct samsung_dsim_driver_data exynos4_dsi_driver_data = {
@@ -429,6 +430,7 @@ static const struct samsung_dsim_driver_data exynos4_dsi_driver_data = {
 	.m_min = 41,
 	.m_max = 125,
 	.min_freq = 500,
+	.has_broken_fifoctrl_emptyhdr = 1,
 };
 
 static const struct samsung_dsim_driver_data exynos5_dsi_driver_data = {
@@ -1010,8 +1012,20 @@ static int samsung_dsim_wait_for_hdr_fifo(struct samsung_dsim *dsi)
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
index 05100e91ecb9..6fc9bb2979e4 100644
--- a/include/drm/bridge/samsung-dsim.h
+++ b/include/drm/bridge/samsung-dsim.h
@@ -53,6 +53,7 @@ struct samsung_dsim_driver_data {
 	unsigned int plltmr_reg;
 	unsigned int has_freqband:1;
 	unsigned int has_clklane_stop:1;
+	unsigned int has_broken_fifoctrl_emptyhdr:1;
 	unsigned int num_clks;
 	unsigned int min_freq;
 	unsigned int max_freq;
-- 
2.34.1

