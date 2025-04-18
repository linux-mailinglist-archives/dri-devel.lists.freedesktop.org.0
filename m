Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01B01A93673
	for <lists+dri-devel@lfdr.de>; Fri, 18 Apr 2025 13:23:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0133510E066;
	Fri, 18 Apr 2025 11:23:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="VrknImwW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 898AC10EB8B
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Apr 2025 11:23:01 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20250418112300euoutp02eff2a0a70c0363d018cf73660accc6f4~3Zdzx_tu50702707027euoutp02k
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Apr 2025 11:23:00 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20250418112300euoutp02eff2a0a70c0363d018cf73660accc6f4~3Zdzx_tu50702707027euoutp02k
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1744975380;
 bh=MPodoGkYgD+LDDjpcK9QQWYlA+NIEGfrgZ+qS1XcPAU=;
 h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
 b=VrknImwWzYK/oZuXjFzTl+K7cNa1l4rZJhsdu8w3NY1pwA0f+KwFoH35hxLsfAJQv
 cp0pj/igi68r32dED6RQP1jcn11fpgO+TSI4vXc7HFBWKgJRtTzzXwPwW2NUN6JjLX
 t8kjEzQKkmo3QzbfVPSkFG3S096D9CqaRQuUkbmw=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20250418112259eucas1p1a6626dd8eac8b929bc3ffe28ec9d3974~3ZdzS6BU60672806728eucas1p1J;
 Fri, 18 Apr 2025 11:22:59 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id B3.80.20397.31632086; Fri, 18
 Apr 2025 12:22:59 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20250418112259eucas1p14c8a04007b0e279b8e134db9e1502d7c~3Zdy0pq2o1923119231eucas1p1H;
 Fri, 18 Apr 2025 11:22:59 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20250418112259eusmtrp1c4563c242c38fbb0d4aafc9845af9d96~3Zdy0BbFg2607526075eusmtrp1r;
 Fri, 18 Apr 2025 11:22:59 +0000 (GMT)
X-AuditID: cbfec7f5-e59c770000004fad-d7-680236137e23
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id A5.98.19654.31632086; Fri, 18
 Apr 2025 12:22:59 +0100 (BST)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
 [106.210.136.40]) by eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20250418112258eusmtip296f42d06655dda5479fe46c400db9487~3ZdyF1NmM1751317513eusmtip2C;
 Fri, 18 Apr 2025 11:22:58 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Fri, 18 Apr 2025 13:22:49 +0200
Subject: [PATCH v6 2/2] drm/imagination: Add reset controller support for
 GPU initialization
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <20250418-apr_18_reset_img-v6-2-85a06757b698@samsung.com>
In-Reply-To: <20250418-apr_18_reset_img-v6-0-85a06757b698@samsung.com>
To: Frank Binns <frank.binns@imgtec.com>,  Matt Coster
 <matt.coster@imgtec.com>, David Airlie <airlied@gmail.com>,  Simona Vetter
 <simona@ffwll.ch>,  Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Marek Szyprowski <m.szyprowski@samsung.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Michal Wilczynski <m.wilczynski@samsung.com>
X-Mailer: b4 0.15-dev
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrMKsWRmVeSWpSXmKPExsWy7djPc7rCZkwZBvMOalicuL6IyWLN3nNM
 FvOPnGO1uPL1PZvFuqcX2C1ezrrHZnF51xw2i7VH7rJbrP86n8li4cetLBZLduxitGjrXMZq
 cffeCRaL/3t2sFvMfref3WLLm4msDgIee78tYPHYOesuu0fPzjOMHptWdbJ5zDsZ6HG/+ziT
 R/9fA4++LasYPTafrvb4vEkugCuKyyYlNSezLLVI3y6BK2POzsesBW/UKxraz7M0MC5Q7GLk
 5JAQMJHon3uGrYuRi0NIYAWjxKx7O5khnC+MEkvmHmIEqRIS+Mwo8e9AKEzHjU0TGCGKljNK
 rNv2mhXCaWOSOLX/NxNIFZuAkcSD5fNZQWwWAVWJ/XPfsIHYwgJxEisnHWMGsXkFBCVOznzC
 AmIzC8hLbH87ByruKjFzTy/YZk4BN4lJN5+xgywQEXjJLHFh3RKw1cwCvYwSt/++Z4O4SVTi
 9+RdLBD2dk6Jwx+AJnEA2S4SrWucIcLCEq+Ob2GHsGUkTk/ugSrPl3iw9RMzhF0jsbPnOJRt
 LXHn3C82kDHMApoS63fpQ4QdJa6fvMEIMZ1P4sZbQYjz+SQmbZsOtZRXoqNNCKJaTWJqTy/c
 0nMrtjFB2B4Sr7sWM05gVJyFFBCzkAJiFsLeBYzMqxjFU0uLc9NTi43zUsv1ihNzi0vz0vWS
 83M3MQLT3el/x7/uYFzx6qPeIUYmDsZDjBIczEoivNN1mDKEeFMSK6tSi/Lji0pzUosPMUpz
 sCiJ8y7a35ouJJCeWJKanZpakFoEk2Xi4JRqYGKWdN/9R6aopvjZ3vkHeeq10+YF/bVYpF8X
 7zK3qNbzw86qCPfbD9k+nrzgEbbz5bHyvzWdPG0inbyTfaXXtXdLna8IY2N3Pf7W9Fmo/a+J
 obcXrzHZr/VIOKeLVb5+4rJJq523tdYdvSWk+XO20tElga7B3yqsd+n92fzN9MibzM8iF22T
 v3ee4Hwwy43P5dqaGYErvvFwB19WuMbn+2Bb7LVTe14ft3eSDZ21TvXWjlR/h2sZPlfmPFyx
 dtlc2w18Gw8w6l02m78ttklH72zJjXx9013uJwrPzQk5wr/unIbxF58tjzoLl6x61/xrnWCP
 +g3215oBjzbOuFm47Ki8spnykadZL/J/ra746fZEiaU4I9FQi7moOBEAbqK8vuYDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrFIsWRmVeSWpSXmKPExsVy+t/xe7rCZkwZBisfcVqcuL6IyWLN3nNM
 FvOPnGO1uPL1PZvFuqcX2C1ezrrHZnF51xw2i7VH7rJbrP86n8li4cetLBZLduxitGjrXMZq
 cffeCRaL/3t2sFvMfref3WLLm4msDgIee78tYPHYOesuu0fPzjOMHptWdbJ5zDsZ6HG/+ziT
 R/9fA4++LasYPTafrvb4vEkugCtKz6Yov7QkVSEjv7jEVina0MJIz9DSQs/IxFLP0Ng81srI
 VEnfziYlNSezLLVI3y5BL2POzsesBW/UKxraz7M0MC5Q7GLk5JAQMJG4sWkCYxcjF4eQwFJG
 iQc/brBBJGQkrnW/ZIGwhSX+XOtigyhqYZI4++QQE0iCTcBI4sHy+awgNouAqsT+uW/AmoUF
 4iRWTjrGDGLzCghKnJz5BGgQBwezgKbE+l36IGFmAXmJ7W/nQJW4Sszc08sIUiIEZL/dWAsS
 5hRwk5h08xk7yFoRgTfMEisffAM7lFmgj1Gi/dRqJojjRCV+T97FMoFRcBaSdbMQ1s1Csm4B
 I/MqRpHU0uLc9NxiI73ixNzi0rx0veT83E2MwEjeduznlh2MK1991DvEyMTBeIhRgoNZSYR3
 ug5ThhBvSmJlVWpRfnxRaU5q8SFGU6CXJzJLiSbnA1NJXkm8oZmBqaGJmaWBqaWZsZI4L9uV
 82lCAumJJanZqakFqUUwfUwcnFINTPv15zuLy57QWWp29/PJtUat37xMO3a9CN7rMtV60ru+
 o/v/9i470H9kx+8VYm0VZi2T1kmwhe6+wGL240bGjxtZvEsidqgdaDa8wnj9L4P+t91blH/1
 K7/IS7iiuyEnKk7jaIb00s3Trbw783g2WcpdPZ80/S5jVnShXceNLwtnd4Y/mfb3heJugX8z
 ehnLvOYK3rV3OxvVZih+vCJl1byffN+X6W1pu/Mos+9O5733su35b8JmLYnyc9ZSTBZtS50Q
 Vv1IOqnhxcrFhXEfP/H+++U1w1CB+/7E1W/8ty/pYK24q8bZmle0VlXk/5U9zeel7/D8W/Zh
 ecqFxpt7+VlyRV/EaliefBjYfPOn9XIlluKMREMt5qLiRAAs+EdWbQMAAA==
X-CMS-MailID: 20250418112259eucas1p14c8a04007b0e279b8e134db9e1502d7c
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250418112259eucas1p14c8a04007b0e279b8e134db9e1502d7c
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20250418112259eucas1p14c8a04007b0e279b8e134db9e1502d7c
References: <20250418-apr_18_reset_img-v6-0-85a06757b698@samsung.com>
 <CGME20250418112259eucas1p14c8a04007b0e279b8e134db9e1502d7c@eucas1p1.samsung.com>
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

All IMG Rogue GPUs include a reset line that participates in the
power-up sequence. On some SoCs (e.g., T-Head TH1520 and Banana Pi
BPI-F3), this reset line is exposed and must be driven explicitly to
ensure proper initialization.  On others, such as the currently
supported TI SoC, the reset logic is handled in hardware or firmware
without exposing the line directly. In platforms where the reset line is
externally accessible, if it is not driven correctly, the GPU may remain
in an undefined state, leading to instability or performance issues.

This commit adds a dedicated reset controller to the drm/imagination
driver.  By managing the reset line (where applicable) as part of normal
GPU bring-up, the driver ensures reliable initialization across
platforms regardless of whether the reset is controlled externally or
handled internally.

Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 drivers/gpu/drm/imagination/pvr_device.c | 21 +++++++++++++++++++++
 drivers/gpu/drm/imagination/pvr_device.h |  9 +++++++++
 drivers/gpu/drm/imagination/pvr_power.c  | 22 +++++++++++++++++++++-
 3 files changed, 51 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/imagination/pvr_device.c b/drivers/gpu/drm/imagination/pvr_device.c
index 1704c0268589bdeb65fa6535f9ec63182b0a3e94..ef73e95157eeb127f3d7543d77f82242d01a2d43 100644
--- a/drivers/gpu/drm/imagination/pvr_device.c
+++ b/drivers/gpu/drm/imagination/pvr_device.c
@@ -25,6 +25,7 @@
 #include <linux/interrupt.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
+#include <linux/reset.h>
 #include <linux/slab.h>
 #include <linux/stddef.h>
 #include <linux/types.h>
@@ -120,6 +121,21 @@ static int pvr_device_clk_init(struct pvr_device *pvr_dev)
 	return 0;
 }
 
+static int pvr_device_reset_init(struct pvr_device *pvr_dev)
+{
+	struct drm_device *drm_dev = from_pvr_device(pvr_dev);
+	struct reset_control *reset;
+
+	reset = devm_reset_control_get_optional_exclusive(drm_dev->dev, NULL);
+	if (IS_ERR(reset))
+		return dev_err_probe(drm_dev->dev, PTR_ERR(reset),
+				     "failed to get gpu reset line\n");
+
+	pvr_dev->reset = reset;
+
+	return 0;
+}
+
 /**
  * pvr_device_process_active_queues() - Process all queue related events.
  * @pvr_dev: PowerVR device to check
@@ -509,6 +525,11 @@ pvr_device_init(struct pvr_device *pvr_dev)
 	if (err)
 		return err;
 
+	/* Get the reset line for the GPU */
+	err = pvr_device_reset_init(pvr_dev);
+	if (err)
+		return err;
+
 	/* Explicitly power the GPU so we can access control registers before the FW is booted. */
 	err = pm_runtime_resume_and_get(dev);
 	if (err)
diff --git a/drivers/gpu/drm/imagination/pvr_device.h b/drivers/gpu/drm/imagination/pvr_device.h
index 6d0dfacb677b46a880f37f419dfa7b67c68fe63d..f6576c08111c86f2a771dfe99b5518795b6aead7 100644
--- a/drivers/gpu/drm/imagination/pvr_device.h
+++ b/drivers/gpu/drm/imagination/pvr_device.h
@@ -131,6 +131,15 @@ struct pvr_device {
 	 */
 	struct clk *mem_clk;
 
+	/**
+	 * @reset: Optional reset line.
+	 *
+	 * This may be used on some platforms to provide a reset line that needs to be de-asserted
+	 * after power-up procedure. It would also need to be asserted after the power-down
+	 * procedure.
+	 */
+	struct reset_control *reset;
+
 	/** @irq: IRQ number. */
 	int irq;
 
diff --git a/drivers/gpu/drm/imagination/pvr_power.c b/drivers/gpu/drm/imagination/pvr_power.c
index ba7816fd28ec77e6ca5ce408302a413ce1afeb6e..5944645bf1b2f5ba6c954a841d85d043db171c4b 100644
--- a/drivers/gpu/drm/imagination/pvr_power.c
+++ b/drivers/gpu/drm/imagination/pvr_power.c
@@ -15,6 +15,7 @@
 #include <linux/mutex.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
+#include <linux/reset.h>
 #include <linux/timer.h>
 #include <linux/types.h>
 #include <linux/workqueue.h>
@@ -252,6 +253,8 @@ pvr_power_device_suspend(struct device *dev)
 	clk_disable_unprepare(pvr_dev->sys_clk);
 	clk_disable_unprepare(pvr_dev->core_clk);
 
+	err = reset_control_assert(pvr_dev->reset);
+
 err_drm_dev_exit:
 	drm_dev_exit(idx);
 
@@ -282,16 +285,33 @@ pvr_power_device_resume(struct device *dev)
 	if (err)
 		goto err_sys_clk_disable;
 
+	/*
+	 * According to the hardware manual, a delay of at least 32 clock
+	 * cycles is required between de-asserting the clkgen reset and
+	 * de-asserting the GPU reset. Assuming a worst-case scenario with
+	 * a very high GPU clock frequency, a delay of 1 microsecond is
+	 * sufficient to ensure this requirement is met across all
+	 * feasible GPU clock speeds.
+	 */
+	udelay(1);
+
+	err = reset_control_deassert(pvr_dev->reset);
+	if (err)
+		goto err_mem_clk_disable;
+
 	if (pvr_dev->fw_dev.booted) {
 		err = pvr_power_fw_enable(pvr_dev);
 		if (err)
-			goto err_mem_clk_disable;
+			goto err_reset_assert;
 	}
 
 	drm_dev_exit(idx);
 
 	return 0;
 
+err_reset_assert:
+	reset_control_assert(pvr_dev->reset);
+
 err_mem_clk_disable:
 	clk_disable_unprepare(pvr_dev->mem_clk);
 

-- 
2.34.1

