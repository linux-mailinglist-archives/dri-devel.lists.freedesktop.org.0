Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA828AF85B
	for <lists+dri-devel@lfdr.de>; Tue, 23 Apr 2024 22:51:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E4EC1136C1;
	Tue, 23 Apr 2024 20:51:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="u4BXH/sY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 419 seconds by postgrey-1.36 at gabe;
 Tue, 23 Apr 2024 20:51:38 UTC
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A34C1136C0
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Apr 2024 20:51:37 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20240423204436euoutp0104bdcb9bd073874a7a7ecc063e928881~JA5YZyt7t0994209942euoutp01J
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Apr 2024 20:44:36 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20240423204436euoutp0104bdcb9bd073874a7a7ecc063e928881~JA5YZyt7t0994209942euoutp01J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1713905076;
 bh=h8e/uzOGG9alR5TqJbZSWl8yJHNgm6AunoUkZ/Nzuu0=;
 h=From:To:Cc:Subject:Date:References:From;
 b=u4BXH/sYksXWEhePjFRpWaLdoCLyCrf619SXauvKBLUcAuvDYjlK2O8iapqj/Reri
 CJHb5csnZfyOM8TndRNc38jRQFJNyjERmpbPBec1t504BfciLL1WFK0NAkEzf+KRf4
 1V9M2N98muVLRw/ue5GBRsraZD/wYEkbb4Axpb/4=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20240423204435eucas1p1928c6bb8134fd2ad904072aa6bab0d1f~JA5XvLNvI1155811558eucas1p1Q;
 Tue, 23 Apr 2024 20:44:35 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 7A.E9.09875.3BD18266; Tue, 23
 Apr 2024 21:44:35 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20240423204435eucas1p2c0a9a75f87b31d11faa59fec40878f23~JA5XY1WfI2538925389eucas1p2N;
 Tue, 23 Apr 2024 20:44:35 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20240423204435eusmtrp1084d009601a002a5424fd1c0951acf7b~JA5XYTFma1907419074eusmtrp19;
 Tue, 23 Apr 2024 20:44:35 +0000 (GMT)
X-AuditID: cbfec7f4-11bff70000002693-44-66281db3355c
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 93.07.08810.3BD18266; Tue, 23
 Apr 2024 21:44:35 +0100 (BST)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20240423204434eusmtip179b0bdf8e6cafaadec2530490ede99de~JA5W6SNte0260002600eusmtip1J;
 Tue, 23 Apr 2024 20:44:34 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Inki Dae
 <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Krzysztof
 Kozlowski <krzk@kernel.org>, stable@vger.kernel.org
Subject: [PATCH] drm/exynos: fix .get_modes return value in case of errors
Date: Tue, 23 Apr 2024 22:44:31 +0200
Message-Id: <20240423204431.3288578-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprGKsWRmVeSWpSXmKPExsWy7djPc7qbZTXSDE5OVLK48vU9m8Wk+xNY
 LM6f38BusenxNVaLGef3MVmsPXKX3WLBxkeMFjMmv2Rz4PDYtKqTzeN+93Emj81L6j36tqxi
 9Pi8SS6ANYrLJiU1J7MstUjfLoEr43erXUEPf8WxvoNsDYx3eboYOTkkBEwk9q9vZe9i5OIQ
 EljBKNF08T+U84VRYunXJkYI5zOjxJ1vm9lhWr7vXsIGkVjOKLH92BKEls41x1hBqtgEDCW6
 3naxgdgiAnkSV6e1s4IUMQvsZpTYNm8+C0hCWMBLYkf/HbCxLAKqEosf9gLFOTh4Bewlbqyw
 h9gmL7H/4FlmEJtXQFDi5MwnYK3MQPHmrbOZQWZKCKzkkFj+4TkLRIOLxJn7MxghbGGJV8e3
 QJ0tI3F6cg8LREM7o8SC3/eZIJwJjBINz29BdVhL3Dn3iw3kCmYBTYn1u/Qhwo4SU68fBAtL
 CPBJ3HgrCHEEn8SkbdOZIcK8Eh1tQhDVahKzjq+DW3vwwiVmCNtD4u3jG2C2kECsxM6+c2wT
 GBVmIXltFpLXZiHcsICReRWjeGppcW56arFRXmq5XnFibnFpXrpecn7uJkZg0jn97/iXHYzL
 X33UO8TIxMF4iFGCg1lJhPfXH5U0Id6UxMqq1KL8+KLSnNTiQ4zSHCxK4ryqKfKpQgLpiSWp
 2ampBalFMFkmDk6pBqbe10ybVs/KvMR2OmVypfwu6T9P2OWO2FzwlXT/zGJe9mbVcS6evMtG
 v2Vm3NrmXCCXef96oXtWjaLMHG4GNZsOYRE5OdPFWtFz7m4S7TKeOPVDWPx+RlsOyU62ok7x
 qqUeD7sKq9RWFL1dz3VSzWu2/MYvy1inZBpfnbj+mZX9I/upHCw3lkm+ym6oWP6Lz6hn5fHe
 xiWC186JN+7b5+xssOzRhKWmUyNX/6+9P1ucqUy1/nuf+K1798ITWHp33Hm8+7UO24OQLXvt
 F/i+iGU+uauhiun4sp9qrClPk05n8mp+mrxscxz7pAdSW2N3rZvqbjnLYmfkv/xXr5ivK6xP
 fF4/S7h5+dfWCPFFgb+UWIozEg21mIuKEwFs25eHqQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrFLMWRmVeSWpSXmKPExsVy+t/xu7qbZTXSDNb85Le48vU9m8Wk+xNY
 LM6f38BusenxNVaLGef3MVmsPXKX3WLBxkeMFjMmv2Rz4PDYtKqTzeN+93Emj81L6j36tqxi
 9Pi8SS6ANUrPpii/tCRVISO/uMRWKdrQwkjP0NJCz8jEUs/Q2DzWyshUSd/OJiU1J7MstUjf
 LkEv43erXUEPf8WxvoNsDYx3eboYOTkkBEwkvu9ewtbFyMUhJLCUUWL/pf+MEAkZiZPTGlgh
 bGGJP9e62EBsIYFPjBInf1mC2GwChhJdbyHiIgIFEn+XHmECGcQssJ9R4ve1m2DNwgJeEjv6
 77CD2CwCqhKLH/aydDFycPAK2EvcWGEPMV9eYv/Bs8wgNq+AoMTJmU9YQGxmoHjz1tnMExj5
 ZiFJzUKSWsDItIpRJLW0ODc9t9hQrzgxt7g0L10vOT93EyMw0Lcd+7l5B+O8Vx/1DjEycTAe
 YpTgYFYS4f31RyVNiDclsbIqtSg/vqg0J7X4EKMp0HkTmaVEk/OBsZZXEm9oZmBqaGJmaWBq
 aWasJM7rWdCRKCSQnliSmp2aWpBaBNPHxMEp1cBUuLs97s2nz+6XZyiLbrd5mvFtg8qTP0c3
 dS84UstdOSvq3YPaltB9nRPNdUQ+xl25JcBfLMt77Zoyq2zis/Pym2cmVQd98uY9/v3b1Lep
 tcUb/K8U6Wyb7HxyQWvs8fhdPWKT9EpUlk/66czF82oxz7+47uW2cmGxftFXn0xf8TAreGlV
 dWCx072XJ6t5RA/c5W5+xOzYXDz/zNbk1H9zX0dERN/+I6katvINxzu3NcbX3E7WF3I7+s/Z
 dClWT6aW17rIM3oGy7wgyXCxxrDlTZo7mNmUin+In5q7YfnUdPkNqr5lTLM229/Vv1PsYrbJ
 5+yUBy/fdDz7bcTmY+hVU+2/PD/v25IJE5u/JtYrsRRnJBpqMRcVJwIA7MECf/0CAAA=
X-CMS-MailID: 20240423204435eucas1p2c0a9a75f87b31d11faa59fec40878f23
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20240423204435eucas1p2c0a9a75f87b31d11faa59fec40878f23
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20240423204435eucas1p2c0a9a75f87b31d11faa59fec40878f23
References: <CGME20240423204435eucas1p2c0a9a75f87b31d11faa59fec40878f23@eucas1p2.samsung.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Commit 7af03e688792 ("drm/probe-helper: warn about negative
.get_modes()") clarified, that .get_modes callback must not return
negative values on failure, so fix sub-drivers to return 0 in case of
errors. This fixes strange Exynos DRM initialization failure on boot
(timeout waiting for VSYNC) observed on Trats2 board.

Cc: stable@vger.kernel.org
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_vidi.c | 4 ++--
 drivers/gpu/drm/exynos/exynos_hdmi.c     | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_vidi.c b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
index e5662bdcbbde..e3868956eb88 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_vidi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
@@ -315,14 +315,14 @@ static int vidi_get_modes(struct drm_connector *connector)
 	 */
 	if (!ctx->raw_edid) {
 		DRM_DEV_DEBUG_KMS(ctx->dev, "raw_edid is null.\n");
-		return -EFAULT;
+		return 0;
 	}
 
 	edid_len = (1 + ctx->raw_edid->extensions) * EDID_LENGTH;
 	edid = kmemdup(ctx->raw_edid, edid_len, GFP_KERNEL);
 	if (!edid) {
 		DRM_DEV_DEBUG_KMS(ctx->dev, "failed to allocate edid\n");
-		return -ENOMEM;
+		return 0;
 	}
 
 	drm_connector_update_edid_property(connector, edid);
diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index c5ba32fca5f3..603d8bb0b03a 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -878,11 +878,11 @@ static int hdmi_get_modes(struct drm_connector *connector)
 	int ret;
 
 	if (!hdata->ddc_adpt)
-		return -ENODEV;
+		return 0;
 
 	edid = drm_get_edid(connector, hdata->ddc_adpt);
 	if (!edid)
-		return -ENODEV;
+		return 0;
 
 	hdata->dvi_mode = !drm_detect_hdmi_monitor(edid);
 	DRM_DEV_DEBUG_KMS(hdata->dev, "%s : width[%d] x height[%d]\n",
-- 
2.34.1

