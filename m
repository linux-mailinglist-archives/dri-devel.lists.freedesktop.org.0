Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88EC71DAC56
	for <lists+dri-devel@lfdr.de>; Wed, 20 May 2020 09:35:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCCAD6E595;
	Wed, 20 May 2020 07:35:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FEDB6E311
 for <dri-devel@lists.freedesktop.org>; Tue, 19 May 2020 11:03:28 +0000 (UTC)
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20200519110324epoutp01a31dcec10afc354da48411d3b7f2f051~QaRRp0B__0110001100epoutp01V
 for <dri-devel@lists.freedesktop.org>; Tue, 19 May 2020 11:03:24 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20200519110324epoutp01a31dcec10afc354da48411d3b7f2f051~QaRRp0B__0110001100epoutp01V
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1589886204;
 bh=jtbuuFtZlbJS1Rib4iwMtJsZO8dvhf0tQbfEwjEMKcI=;
 h=From:To:Cc:Subject:Date:References:From;
 b=bRCzjA2TMcQwbnNHODvPIK3e7xJE5UnhLVa2FjwzoQlr4Sbp4uzzkXVqwtuXBVmrB
 d0dBxiVRQSHtOI1G2G/2A++m0tROM1m7lu5mD4r1SLk7YuRSIcZJzfSNfuemVAexQb
 D/HRrKTv6CN9I8QiIMpeGCHffjYeILuS4sr4IrD8=
Received: from epsmges5p2new.samsung.com (unknown [182.195.42.74]) by
 epcas5p3.samsung.com (KnoxPortal) with ESMTP id
 20200519110323epcas5p36ea804ed6aebd41f27c2537c5a760db2~QaRQyYdyY2376823768epcas5p3L;
 Tue, 19 May 2020 11:03:23 +0000 (GMT)
Received: from epcas5p4.samsung.com ( [182.195.41.42]) by
 epsmges5p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
 98.27.23569.BFCB3CE5; Tue, 19 May 2020 20:03:23 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
 20200519110323epcas5p23b9472d505f5ba58d033fa468cb9969d~QaRQNMuVy2317723177epcas5p2k;
 Tue, 19 May 2020 11:03:23 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200519110323epsmtrp276c59ad1c0e6fd16f337e1281a352759~QaRQMRz0R1333213332epsmtrp2Y;
 Tue, 19 May 2020 11:03:23 +0000 (GMT)
X-AuditID: b6c32a4a-3c7ff70000005c11-91-5ec3bcfbe0ce
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 0F.33.25866.BFCB3CE5; Tue, 19 May 2020 20:03:23 +0900 (KST)
Received: from Jaguar.sa.corp.samsungelectronics.net (unknown
 [107.108.73.139]) by epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200519110320epsmtip25e01f7118dfeee6021f3ae7e652d5047~QaRODaRmj1826618266epsmtip2o;
 Tue, 19 May 2020 11:03:20 +0000 (GMT)
From: Tamseel Shams <m.shams@samsung.com>
To: inki.dae@samsung.com, jy0922.shim@samsung.com, sw0312.kim@samsung.com,
 kyungmin.park@samsung.com, airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH v2] drm/exynos: Remove dev_err() on platform_get_irq() failure
Date: Tue, 19 May 2020 16:19:04 +0530
Message-Id: <20200519104904.59246-1-m.shams@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrOIsWRmVeSWpSXmKPExsWy7bCmlu7vPYfjDE4sNLXoPXeSyeLBvG1s
 Fv+3TWS2uPL1PZvFpPsTWCxe3LvIYnH+/AZ2i7NNb9gtNj2+xmpxedccNosZ5/cxWdxtXcxu
 ceThbnaLGZNfsjnweez9toDFY9OqTjaP7d8esHrc7z7O5LF5Sb1H35ZVjB6fN8kFsEdx2aSk
 5mSWpRbp2yVwZaz5+JqtYKFYxb1JR1kaGO8KdTFyckgImEis/TGXqYuRi0NIYDejxKFD71kg
 nE+MEue/bGSDcD4zSqy+foUZpuXZny1gtpDALkaJR918EEUtTBIXL+8EaufgYBPQlDh+nhsk
 LiLQySjRc/s3K4jDLPCDUeLNynVg3cICARIb92xnArFZBFQl+r+uYQWxeQUsJCbOuMUKsU1e
 YvWGA8wgzRICP9klNvz/CZVwkTh0ZBUThC0s8er4FnYIW0ri87u9bBB2vsT8eaugzq6QWHnh
 DZRtL3HgyhywS5mBLl2/Sx8kzCzAJ9H7+wkTSFhCgFeiow0aRooS/3f3Q00Xl3i3YgrUBR4S
 X28vYwMpFxKIlVgxJ2ECo8wshJkLGBlXMUqmFhTnpqcWmxYY5aWW6xUn5haX5qXrJefnbmIE
 pw0trx2MDx980DvEyMTBeIhRgoNZSYR3wotDcUK8KYmVValF+fFFpTmpxYcYpTlYlMR5kxq3
 xAkJpCeWpGanphakFsFkmTg4pRqY9t30uOe8+uwNO3ntWRlrTx13UZrMwuq8+veFF2xfzJkK
 2XxOzFqmO+Ph5tWFX02lCncZ5a9K7Bbb+Zqp4bahvJWZb8eUVc6z/nx5+k7gycmvSw9/UN48
 NerYw52Z/+bXHPQ6frH25FWHpyJpyybPYZ639KjH03P7tya4B4t4l9W0in1OkIre11F+TZ6x
 clKp+c1lasFpnxdmS2Uq7zSd9Yt/4hrRkx/SHs/M71eayrsu/HKlof3Jsn2vFI6tkpHjefJe
 N+rosaVWs921tynF1fc82Kf4LXX97NV7JS/GJDZNCbj+iaHH4c3ZW1+DpZ63mOZk+c7MnHP5
 iOiPebr8TAdd82Z9uJxYx+XUWrdM6aYSS3FGoqEWc1FxIgAbhtUCigMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrNLMWRmVeSWpSXmKPExsWy7bCSvO7vPYfjDI5f4LHoPXeSyeLBvG1s
 Fv+3TWS2uPL1PZvFpPsTWCxe3LvIYnH+/AZ2i7NNb9gtNj2+xmpxedccNosZ5/cxWdxtXcxu
 ceThbnaLGZNfsjnweez9toDFY9OqTjaP7d8esHrc7z7O5LF5Sb1H35ZVjB6fN8kFsEdx2aSk
 5mSWpRbp2yVwZaz5+JqtYKFYxb1JR1kaGO8KdTFyckgImEg8+7OFuYuRi0NIYAejxNU1G5gh
 EuIS037tZ4SwhSVW/nvODlHUxCSx4OQmpi5GDg42AU2J4+e5QeIiAhMZJea0r2IBcZgFGpgk
 Vqz8zQhSJCzgJzHvYCHIIBYBVYn+r2tYQWxeAQuJiTNusUIskJdYveEA8wRGngWMDKsYJVML
 inPTc4sNC4zyUsv1ihNzi0vz0vWS83M3MYLDU0trB+OeVR/0DjEycTAeYpTgYFYS4Z3w4lCc
 EG9KYmVValF+fFFpTmrxIUZpDhYlcd6vsxbGCQmkJ5akZqemFqQWwWSZODilGpgW7ThQKa7w
 KO/Oq9NCSsbv7lfUsPhfn56m539wwp7DP6UWinn6vtvnvPqt5h0PhtxDSulfGza/85X7OYlN
 4MbJv9HHdjzYuHnC/6nHrvHF/pN69CRNhHGXY9nqtiMsyVqh513jbW8anaxJ/f7V6tHZ1wY/
 Oc9HpJ2e7n9u8Q7jeX+qljfvnPDQNLbZYMaBJeI3XqVz5WpMWLhbovSV4+lr593CFzfpcX/N
 OLrw7K9ffW6nbB1+xBbliei823RzWWlH7fVSu5W6jp8+XHUpLV9ottWXWeJk+6sHqtfuvv/Q
 aBtT/V7betNp8YaOpTP7vL02lAnNT/T+lcly8UFfil87j0ih6EnmsHjJ9tZZkjtjlViKMxIN
 tZiLihMBcX9v1b4CAAA=
X-CMS-MailID: 20200519110323epcas5p23b9472d505f5ba58d033fa468cb9969d
X-Msg-Generator: CA
CMS-TYPE: 105P
X-CMS-RootMailID: 20200519110323epcas5p23b9472d505f5ba58d033fa468cb9969d
References: <CGME20200519110323epcas5p23b9472d505f5ba58d033fa468cb9969d@epcas5p2.samsung.com>
X-Mailman-Approved-At: Wed, 20 May 2020 07:34:33 +0000
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
Cc: linux-samsung-soc@vger.kernel.org, shaik.ameer@samsung.com,
 linux-kernel@vger.kernel.org, krzk@kernel.org, dri-devel@lists.freedesktop.org,
 alim.akhtar@samsung.com, Tamseel Shams <m.shams@samsung.com>,
 linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

platform_get_irq() will call dev_err() itself on failure,
so there is no need for the driver to also do this.
This is detected by coccinelle.

Also removing unnecessary curly braces around if () statement.

Signed-off-by: Tamseel Shams <m.shams@samsung.com>
---
Fixed review comment by joe@perches.com

 drivers/gpu/drm/exynos/exynos_drm_dsi.c     | 4 +---
 drivers/gpu/drm/exynos/exynos_drm_g2d.c     | 1 -
 drivers/gpu/drm/exynos/exynos_drm_rotator.c | 4 +---
 drivers/gpu/drm/exynos/exynos_drm_scaler.c  | 4 +---
 4 files changed, 3 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index 902938d2568f..958e2c6a6702 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -1809,10 +1809,8 @@ static int exynos_dsi_probe(struct platform_device *pdev)
 	}
 
 	dsi->irq = platform_get_irq(pdev, 0);
-	if (dsi->irq < 0) {
-		dev_err(dev, "failed to request dsi irq resource\n");
+	if (dsi->irq < 0)
 		return dsi->irq;
-	}
 
 	irq_set_status_flags(dsi->irq, IRQ_NOAUTOEN);
 	ret = devm_request_threaded_irq(dev, dsi->irq, NULL,
diff --git a/drivers/gpu/drm/exynos/exynos_drm_g2d.c b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
index fcee33a43aca..03be31427181 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_g2d.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
@@ -1498,7 +1498,6 @@ static int g2d_probe(struct platform_device *pdev)
 
 	g2d->irq = platform_get_irq(pdev, 0);
 	if (g2d->irq < 0) {
-		dev_err(dev, "failed to get irq\n");
 		ret = g2d->irq;
 		goto err_put_clk;
 	}
diff --git a/drivers/gpu/drm/exynos/exynos_drm_rotator.c b/drivers/gpu/drm/exynos/exynos_drm_rotator.c
index dafa87b82052..2d94afba031e 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_rotator.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_rotator.c
@@ -293,10 +293,8 @@ static int rotator_probe(struct platform_device *pdev)
 		return PTR_ERR(rot->regs);
 
 	irq = platform_get_irq(pdev, 0);
-	if (irq < 0) {
-		dev_err(dev, "failed to get irq\n");
+	if (irq < 0)
 		return irq;
-	}
 
 	ret = devm_request_irq(dev, irq, rotator_irq_handler, 0, dev_name(dev),
 			       rot);
diff --git a/drivers/gpu/drm/exynos/exynos_drm_scaler.c b/drivers/gpu/drm/exynos/exynos_drm_scaler.c
index 93c43c8d914e..ce1857138f89 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_scaler.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_scaler.c
@@ -502,10 +502,8 @@ static int scaler_probe(struct platform_device *pdev)
 		return PTR_ERR(scaler->regs);
 
 	irq = platform_get_irq(pdev, 0);
-	if (irq < 0) {
-		dev_err(dev, "failed to get irq\n");
+	if (irq < 0)
 		return irq;
-	}
 
 	ret = devm_request_threaded_irq(dev, irq, NULL,	scaler_irq_handler,
 					IRQF_ONESHOT, "drm_scaler", scaler);
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
