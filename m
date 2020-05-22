Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A8971DDFA6
	for <lists+dri-devel@lfdr.de>; Fri, 22 May 2020 08:04:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8718A6E0E7;
	Fri, 22 May 2020 06:04:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51B726E0E7
 for <dri-devel@lists.freedesktop.org>; Fri, 22 May 2020 06:04:12 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200522060410euoutp01aeaf9640f418ada5d6df2b86fae38d07~RRH2z55EY1372913729euoutp01E
 for <dri-devel@lists.freedesktop.org>; Fri, 22 May 2020 06:04:10 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200522060410euoutp01aeaf9640f418ada5d6df2b86fae38d07~RRH2z55EY1372913729euoutp01E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1590127450;
 bh=92IO08N+pw0wmAN078aoUzG3I8fLWWm/tioApQecsJU=;
 h=From:To:Cc:Subject:Date:References:From;
 b=lypVMFm+1qJj5C1ccuC64iJK+CmwV+eFK3nKgGOtxAbmbTziCdm7h/WxYm5J+39jE
 ju0SPTPN6KhTX0ifVCLgRFdQTbmSA2NZnndWIRlUzbnmDCTGTdB4WzY1Otx7CENksh
 3sf2gVwqnRHVosD75RBPlRWhRDqyfGcs6xBW3bN4=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200522060409eucas1p1a6e6352e8abaf393769afcaa76551ee3~RRH2i49oy2554125541eucas1p1G;
 Fri, 22 May 2020 06:04:09 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id FE.AA.61286.95B67CE5; Fri, 22
 May 2020 07:04:09 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200522060409eucas1p1cf023d2be5b8c30da32354262a829de0~RRH2NyU5w2271722717eucas1p1U;
 Fri, 22 May 2020 06:04:09 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200522060409eusmtrp11e776683e254955720bb38a6f9d2258e~RRH2NC1Hk2001720017eusmtrp1H;
 Fri, 22 May 2020 06:04:09 +0000 (GMT)
X-AuditID: cbfec7f2-ef1ff7000001ef66-3d-5ec76b5971f7
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id D1.B0.08375.95B67CE5; Fri, 22
 May 2020 07:04:09 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200522060409eusmtip1232ed069ab72b3bbe1a72cd76c5fed33~RRH11mpGC2453524535eusmtip1b;
 Fri, 22 May 2020 06:04:09 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Subject: [PATCH] drm/exynos: Properly propagate return value in
 drm_iommu_attach_device()
Date: Fri, 22 May 2020 08:03:56 +0200
Message-Id: <20200522060356.25153-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrMIsWRmVeSWpSXmKPExsWy7djP87qR2cfjDC7u1bO4te4cq8XGGetZ
 La58fc9mMen+BBaLGef3MVmsPXKX3WLG5JdsDuwe97uPM3n0bVnF6PF5k1wAcxSXTUpqTmZZ
 apG+XQJXxszdM5gLbnBUnJqf2sC4gr2LkZNDQsBEYv7dNyxdjFwcQgIrGCVmfF/MBpIQEvjC
 KLFliTdE4jOjxLRv65hgOg6umMkEkVjOKLHow3QmuI7G/5YgNpuAoUTX2y6wSSICbhJNh2ey
 gjQwC1xnlPj2YxHYbmGBaIlFR5cDFXFwsAioSly76AcS5hWwldh36hUzxDJ5idUbDjCD9EoI
 nGCTeNf0DirhIrFh33EoW1ji1fEtUP/ISJye3MMC0dDMKPHw3Fp2CKeHUeJy0wxGiCpriTvn
 foFtZhbQlFi/Sx8i7CixaGIbK0hYQoBP4sZbQZAwM5A5adt0Zogwr0RHmxBEtZrErOPr4NYe
 vHAJ6hwPiSdTmqFhEitxf8kNtgmMcrMQdi1gZFzFKJ5aWpybnlpsmJdarlecmFtcmpeul5yf
 u4kRGPWn/x3/tIPx66WkQ4wCHIxKPLwPko/FCbEmlhVX5h5ilOBgVhLhXch/NE6INyWxsiq1
 KD++qDQntfgQozQHi5I4r/Gil7FCAumJJanZqakFqUUwWSYOTqkGxtBnh3IFJaOrHjGsOdTm
 3X94WbZKgZ3KuzOzBWf8UGJfeDWscJKDWFDIQxuj2F/HXFTLtW2M9ntoxCboWzRZ2++IYy1c
 ysJ0cqOBSHonA+eiV/yt7qw++RXFc5gPsD6JjC+9vbMzZsvzpa5aM3Tt8iW11sms2cfztiX5
 0rzl4qGhGdKzuKuVWIozEg21mIuKEwF6Q4rT9gIAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrFLMWRmVeSWpSXmKPExsVy+t/xu7qR2cfjDL7fkLa4te4cq8XGGetZ
 La58fc9mMen+BBaLGef3MVmsPXKX3WLG5JdsDuwe97uPM3n0bVnF6PF5k1wAc5SeTVF+aUmq
 QkZ+cYmtUrShhZGeoaWFnpGJpZ6hsXmslZGpkr6dTUpqTmZZapG+XYJexszdM5gLbnBUnJqf
 2sC4gr2LkZNDQsBE4uCKmUxdjFwcQgJLGSXeHL3GCpGQkTg5rQHKFpb4c62LDaLoE6PE5CX/
 WUASbAKGEl1vQRKcHCICHhLN346zgxQxC9xmlFj6YR5YkbBApMTdu41ARRwcLAKqEtcu+oGE
 eQVsJfadesUMsUBeYvWGA8wTGHkWMDKsYhRJLS3OTc8tNtQrTswtLs1L10vOz93ECAy3bcd+
 bt7BeGlj8CFGAQ5GJR7eB8nH4oRYE8uKK3MPMUpwMCuJ8C7kPxonxJuSWFmVWpQfX1Sak1p8
 iNEUaPdEZinR5HxgLOSVxBuaGppbWBqaG5sbm1koifN2CByMERJITyxJzU5NLUgtgulj4uCU
 amCcqyh/RbPh0ouLnVfjfC7Ytm6dXzjBQMtx0bqaZauzv/59/bjU7k3sht0O/f6TNZe92euf
 79rFvafqdZ2LuVX5XmvF8uT0usUq6XPMf6bJv48JnfN6+bqSNW82199Qi2q8tUjqgHmE376w
 fO1k9ysSAseNZ1yIDlj7prH72xrvJVvC1y+aNHehEktxRqKhFnNRcSIAv818AE0CAAA=
X-CMS-MailID: 20200522060409eucas1p1cf023d2be5b8c30da32354262a829de0
X-Msg-Generator: CA
X-RootMTR: 20200522060409eucas1p1cf023d2be5b8c30da32354262a829de0
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200522060409eucas1p1cf023d2be5b8c30da32354262a829de0
References: <CGME20200522060409eucas1p1cf023d2be5b8c30da32354262a829de0@eucas1p1.samsung.com>
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
Cc: Andrzej Hajda <a.hajda@samsung.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Propagate the proper error codes from the called functions instead of
unconditionally returning 0.

Reported-by: kbuild test robot <lkp@intel.com>
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_dma.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dma.c b/drivers/gpu/drm/exynos/exynos_drm_dma.c
index d3fe6c1e6688..5887f7f52f96 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dma.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dma.c
@@ -44,7 +44,7 @@ static int drm_iommu_attach_device(struct drm_device *drm_dev,
 				struct device *subdrv_dev, void **dma_priv)
 {
 	struct exynos_drm_private *priv = drm_dev->dev_private;
-	int ret;
+	int ret = 0;
 
 	if (get_dma_ops(priv->dma_dev) != get_dma_ops(subdrv_dev)) {
 		DRM_DEV_ERROR(subdrv_dev, "Device %s lacks support for IOMMU\n",
@@ -69,7 +69,7 @@ static int drm_iommu_attach_device(struct drm_device *drm_dev,
 		ret = iommu_attach_device(priv->mapping, subdrv_dev);
 	}
 
-	return 0;
+	return ret;
 }
 
 /*
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
