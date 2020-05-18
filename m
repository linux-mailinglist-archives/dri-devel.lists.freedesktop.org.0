Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A482C1D9095
	for <lists+dri-devel@lfdr.de>; Tue, 19 May 2020 09:01:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C58D76E51B;
	Tue, 19 May 2020 07:00:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 552 seconds by postgrey-1.36 at gabe;
 Mon, 18 May 2020 17:50:37 UTC
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2B076E452
 for <dri-devel@lists.freedesktop.org>; Mon, 18 May 2020 17:50:37 +0000 (UTC)
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20200518174123epoutp0382cdebc05c50f6245aad072ecae22424~QMDdwma7V2512925129epoutp03q
 for <dri-devel@lists.freedesktop.org>; Mon, 18 May 2020 17:41:23 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20200518174123epoutp0382cdebc05c50f6245aad072ecae22424~QMDdwma7V2512925129epoutp03q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1589823683;
 bh=SJvqKP/iDeqX2YV6Q0c1S/r1bKd4wjPJEQwBKJ5VINg=;
 h=From:To:Cc:Subject:Date:References:From;
 b=VmATcE7EzbzcY1B5/ioEm96WjeulrU7tGA+eP6nRfh6VMDSlnNxPzfAMBFEu2fKWQ
 gqjDi892sEsJPzdh8HHzYuc6rYKuvESqeJLlBkRVigM2pD6cTqAqLAJD6iYkPGhgxl
 ytS+6iwy2Q+hPJCr6g6jmrJZW8sJAtZvSwHIBWmU=
Received: from epsmges5p2new.samsung.com (unknown [182.195.42.74]) by
 epcas5p3.samsung.com (KnoxPortal) with ESMTP id
 20200518174121epcas5p38e466287a78b4c98792b9905f52e503b~QMDcsQqxY1819018190epcas5p3j;
 Mon, 18 May 2020 17:41:21 +0000 (GMT)
Received: from epcas5p4.samsung.com ( [182.195.41.42]) by
 epsmges5p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
 A5.19.23569.1C8C2CE5; Tue, 19 May 2020 02:41:21 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
 20200518174120epcas5p1fb5f832c7874a9d367eb9c9ea4e69d53~QMDbdakZB0533905339epcas5p1Z;
 Mon, 18 May 2020 17:41:20 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200518174120epsmtrp2ee3087f08d21bb7d3fd24bd1d5550f5a~QMDbckrWw0707307073epsmtrp2L;
 Mon, 18 May 2020 17:41:20 +0000 (GMT)
X-AuditID: b6c32a4a-3b1ff70000005c11-52-5ec2c8c11014
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 F6.2E.18461.0C8C2CE5; Tue, 19 May 2020 02:41:20 +0900 (KST)
Received: from Jaguar.sa.corp.samsungelectronics.net (unknown
 [107.108.73.139]) by epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200518174118epsmtip16ef36e2887700870b6687cebc78bf266~QMDZbPpKN0547805478epsmtip1C;
 Mon, 18 May 2020 17:41:18 +0000 (GMT)
From: Tamseel Shams <m.shams@samsung.com>
To: inki.dae@samsung.com, jy0922.shim@samsung.com, sw0312.kim@samsung.com,
 kyungmin.park@samsung.com, airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH] drm/exynos: Remove dev_err() on platform_get_irq() failure
Date: Mon, 18 May 2020 22:57:08 +0530
Message-Id: <20200518172708.48600-1-m.shams@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrBIsWRmVeSWpSXmKPExsWy7bCmlu7BE4fiDN4eMLHoPXeSyeLBvG1s
 Fv+3TWS2uPL1PZvFpPsTWCxe3LvIYnH+/AZ2i7NNb9gtNj2+xmpxedccNosZ5/cxWdxtXcxu
 ceThbnaLGZNfsjnweez9toDFY9OqTjaP7d8esHrc7z7O5LF5Sb1H35ZVjB6fN8kFsEdx2aSk
 5mSWpRbp2yVwZcx/t4Sl4JFgxeetK1kbGNv5uxg5OSQETCTWHlrD3MXIxSEksJtRYsKMOywQ
 zidGiXU7PkNlvjFKrGjrZ4JpuXV+BiNEYi+jROuMLjYIp4VJ4tfc70BVHBxsApoSx89zg8RF
 BDoZJXpu/2YFcZgFfjBKvFm5jhmkSFjAW+Lj9RqQqSwCqhIr/k5lBbF5BSwkHu17wAyxTV5i
 9YYDYGdICHxllzh0DOYMF4k7169AFQlLvDq+hR3ClpL4/G4vG4SdLzF/3iqomgqJlRfeQNn2
 EgeuzGEBuYEZ6ND1u/RBwswCfBK9v5+A3S8hwCvR0SYEUa0o8X93P9R0cYl3K6awQtgeEoe+
 Hge7RkggVmLbu73sExhlZiEMXcDIuIpRMrWgODc9tdi0wCgvtVyvODG3uDQvXS85P3cTIzhx
 aHntYHz44IPeIUYmDsZDjBIczEoivJGf98UJ8aYkVlalFuXHF5XmpBYfYpTmYFES501q3BIn
 JJCeWJKanZpakFoEk2Xi4JRqYArs+rO9XUi1qnptpfz/m08ak33tZ7pXql8/GMJenTCl/17Z
 oru7DCP3tSWuenagxlH/bYzeNSnL2syLGzTXs1maaRaw9k1fty6L9+Td+bwpfSd3P1h/6EmV
 pfjXHPMNv5fz9s3dcYj13oct61h2n/5z+sebpYW6j7eFmoovfCHJwfPx9ORpJlPXOrvp/ftg
 HRr71T4+5sZsvZ0KL9g8ypbk/uCxepArzLtzXWHxiw/qjQ+efDi95ueM/29q/5ROP60WsjWh
 /OmL728OabBNVYtp1ovYe9jbhjHW2NQrRsnldu/kOwyT43/NvncnzdG4Y8cMTuZw9e+r8xvr
 Jxfy/n5y8urJ1Tem/DY33y1+4w6vEktxRqKhFnNRcSIAKu+FYYsDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrNLMWRmVeSWpSXmKPExsWy7bCSnO6BE4fiDN7cULToPXeSyeLBvG1s
 Fv+3TWS2uPL1PZvFpPsTWCxe3LvIYnH+/AZ2i7NNb9gtNj2+xmpxedccNosZ5/cxWdxtXcxu
 ceThbnaLGZNfsjnweez9toDFY9OqTjaP7d8esHrc7z7O5LF5Sb1H35ZVjB6fN8kFsEdx2aSk
 5mSWpRbp2yVwZcx/t4Sl4JFgxeetK1kbGNv5uxg5OSQETCRunZ/B2MXIxSEksJtR4u35JiaI
 hLjEtF/7GSFsYYmV/56zQxQ1MUmca9nJ0sXIwcEmoClx/Dw3SFxEYCKjxJz2VSwgDrNAA5PE
 ipW/GUGKhAW8JT5erwEZxCKgKrHi71RWEJtXwELi0b4HzBAL5CVWbzjAPIGRZwEjwypGydSC
 4tz03GLDAsO81HK94sTc4tK8dL3k/NxNjODw1NLcwbh91Qe9Q4xMHIyHGCU4mJVEeCM/74sT
 4k1JrKxKLcqPLyrNSS0+xCjNwaIkznujcGGckEB6YklqdmpqQWoRTJaJg1OqgSl8rVx/qOgZ
 2xNLHhYpGOT+OtVnNy+o/kCtyeepz+QOlZnat9+8oXJlsfzPby+b+X8InXFaviu1SmStFGc3
 s8kF6Wf71nTUt+kVxMRP2PnWI2nvxtDyfCWL4uoZsT0cNRMOH1krUpDgZ2gY8SqTQVNbU2QD
 s/vaGxftfe05JhiF+ssG3Ftoxy10vPjTAxemVmWdrj2RLbvvXq684B1Tcibkwd6l3gLxSh2v
 xB6y1xROCVkxxbeZV0xJ/qVLaoWo9YMHGd9X1s6dO1s4P5W7f0mRlIuJxdQ3Lf5F3+5+srp2
 v/qJrfe24kgWDbalerv/ugRGSCZLLZj9wcbv/FOxl5Fqie8TZXkr1p9cq39GiaU4I9FQi7mo
 OBEAcBf7hL4CAAA=
X-CMS-MailID: 20200518174120epcas5p1fb5f832c7874a9d367eb9c9ea4e69d53
X-Msg-Generator: CA
CMS-TYPE: 105P
X-CMS-RootMailID: 20200518174120epcas5p1fb5f832c7874a9d367eb9c9ea4e69d53
References: <CGME20200518174120epcas5p1fb5f832c7874a9d367eb9c9ea4e69d53@epcas5p1.samsung.com>
X-Mailman-Approved-At: Tue, 19 May 2020 07:00:27 +0000
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

Signed-off-by: Tamseel Shams <m.shams@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_dsi.c     | 1 -
 drivers/gpu/drm/exynos/exynos_drm_g2d.c     | 1 -
 drivers/gpu/drm/exynos/exynos_drm_rotator.c | 1 -
 drivers/gpu/drm/exynos/exynos_drm_scaler.c  | 1 -
 4 files changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index 902938d2568f..df2e14b19fbf 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -1810,7 +1810,6 @@ static int exynos_dsi_probe(struct platform_device *pdev)
 
 	dsi->irq = platform_get_irq(pdev, 0);
 	if (dsi->irq < 0) {
-		dev_err(dev, "failed to request dsi irq resource\n");
 		return dsi->irq;
 	}
 
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
index dafa87b82052..0edf7950a3fe 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_rotator.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_rotator.c
@@ -294,7 +294,6 @@ static int rotator_probe(struct platform_device *pdev)
 
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0) {
-		dev_err(dev, "failed to get irq\n");
 		return irq;
 	}
 
diff --git a/drivers/gpu/drm/exynos/exynos_drm_scaler.c b/drivers/gpu/drm/exynos/exynos_drm_scaler.c
index 93c43c8d914e..4e33d5661eef 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_scaler.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_scaler.c
@@ -503,7 +503,6 @@ static int scaler_probe(struct platform_device *pdev)
 
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0) {
-		dev_err(dev, "failed to get irq\n");
 		return irq;
 	}
 
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
