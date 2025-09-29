Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BAF0BAA2B1
	for <lists+dri-devel@lfdr.de>; Mon, 29 Sep 2025 19:28:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A7BC10E470;
	Mon, 29 Sep 2025 17:28:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="X5vFgjR2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 625F110E214
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Sep 2025 04:38:04 +0000 (UTC)
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20250929042918epoutp0121eb14d352bd7b645fe2073f73d96bec~ppnbOidbF0608906089epoutp01H
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Sep 2025 04:29:18 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20250929042918epoutp0121eb14d352bd7b645fe2073f73d96bec~ppnbOidbF0608906089epoutp01H
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1759120158;
 bh=YSVaMtuyuSZZ1up/bnEVaaqJsX9Frjk4SuqMGWpTs64=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=X5vFgjR2l4L6b7NiucO1Gnr+xHkgGl7MZYoIVi7/uLllwe5iBIprnPGKf3ll2Zguf
 cu/LtcY53z+eZg9Xst/Aoi8cRnWVpdkmvD5DBBITb7R9hDBy8Enyynq0XV1LVBLCjD
 2aLer6162rjBn6jLXpdKON84Mub2r+6cUmDCEtGU=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
 epcas2p3.samsung.com (KnoxPortal) with ESMTPS id
 20250929042918epcas2p389736ec498c2e1e07be26be0e12c7636~ppna6NSXN1841018410epcas2p3d;
 Mon, 29 Sep 2025 04:29:18 +0000 (GMT)
Received: from epcas2p3.samsung.com (unknown [182.195.38.205]) by
 epsnrtp01.localdomain (Postfix) with ESMTP id 4cZp9p0SkJz6B9mG; Mon, 29 Sep
 2025 04:29:18 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
 epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
 20250929042917epcas2p2569e213500997dfa6ba43c8f361f50f7~ppnZ_6lVS1831418314epcas2p2O;
 Mon, 29 Sep 2025 04:29:17 +0000 (GMT)
Received: from tayo (unknown [10.229.9.198]) by epsmtip1.samsung.com
 (KnoxPortal) with ESMTPA id
 20250929042917epsmtip1cd0804751a75e6720cbf5da675545d7a~ppnZ5hi7v2403224032epsmtip1i;
 Mon, 29 Sep 2025 04:29:17 +0000 (GMT)
From: Hoyoung Lee <hy_fifty.lee@samsung.com>
To: Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Krzysztof Kozlowski <krzk@kernel.org>, Alim
 Akhtar <alim.akhtar@samsung.com>
Cc: Hoyoung Lee <hy_fifty.lee@samsung.com>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] drm/exynos: Convert to drmm_mode_config_init() and drop
 manual cleanup
Date: Mon, 29 Sep 2025 13:31:09 +0900
Message-ID: <20250929043110.3631025-3-hy_fifty.lee@samsung.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250929043110.3631025-1-hy_fifty.lee@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250929042917epcas2p2569e213500997dfa6ba43c8f361f50f7
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250929042917epcas2p2569e213500997dfa6ba43c8f361f50f7
References: <20250929043110.3631025-1-hy_fifty.lee@samsung.com>
 <CGME20250929042917epcas2p2569e213500997dfa6ba43c8f361f50f7@epcas2p2.samsung.com>
X-Mailman-Approved-At: Mon, 29 Sep 2025 17:28:00 +0000
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

Switch mode-config initialization to drmm_mode_config_init() so that the
lifetime is tied to drm_device. Remove explicit drm_mode_config_cleanup()
from error and unbind paths since cleanup is now managed by DRM.

No functional change intended.

Signed-off-by: Hoyoung Lee <hy_fifty.lee@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_drv.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm/exynos/exynos_drm_drv.c
index 6cc7bf77bcac..1aea71778ab1 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
@@ -257,7 +257,7 @@ static int exynos_drm_bind(struct device *dev)
 	dev_set_drvdata(dev, drm);
 	drm->dev_private = (void *)private;
 
-	drm_mode_config_init(drm);
+	drmm_mode_config_init(drm);
 
 	exynos_drm_mode_config_init(drm);
 
@@ -297,7 +297,6 @@ static int exynos_drm_bind(struct device *dev)
 err_unbind_all:
 	component_unbind_all(drm->dev, drm);
 err_mode_config_cleanup:
-	drm_mode_config_cleanup(drm);
 	exynos_drm_cleanup_dma(drm);
 	kfree(private);
 	dev_set_drvdata(dev, NULL);
@@ -317,7 +316,6 @@ static void exynos_drm_unbind(struct device *dev)
 	drm_atomic_helper_shutdown(drm);
 
 	component_unbind_all(drm->dev, drm);
-	drm_mode_config_cleanup(drm);
 	exynos_drm_cleanup_dma(drm);
 
 	kfree(drm->dev_private);
-- 
2.34.1

