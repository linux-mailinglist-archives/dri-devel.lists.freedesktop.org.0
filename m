Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B508A21274
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jan 2025 20:48:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5211D10E701;
	Tue, 28 Jan 2025 19:48:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="VAmp3YGt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F62A10E6FE
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jan 2025 19:48:41 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20250128194840euoutp011158f280822ab3b70fbcf617540f92b6~e8wedwrcW0285702857euoutp01P
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jan 2025 19:48:40 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20250128194840euoutp011158f280822ab3b70fbcf617540f92b6~e8wedwrcW0285702857euoutp01P
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1738093720;
 bh=ZYBRmW5t2GpCZtOdW6RPCwHBIk2zBYiTkDA13XDEtW4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VAmp3YGtt/afem4W6kd0GjProjMLNMmADbZE7lu1Zhf7gd/kT3Pzm1aZQiILNsAK/
 N2ylkXQro3hHI//fBpXxw8hb/8nK4h2cFBnsCECFln6I8hRmbGvjEY8K2ZSWhEzD0R
 AzuecuN/yU+FQzyLpf7Ctzby8GCrZBLJRWy65OEA=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20250128194838eucas1p2d1c38c43bb0dbc2368835a9b395f43c6~e8wdOwKIM2210922109eucas1p2-;
 Tue, 28 Jan 2025 19:48:38 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 1D.F8.20821.69439976; Tue, 28
 Jan 2025 19:48:38 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20250128194838eucas1p1829115b2b05d209a7c277eccf56e0b90~e8wcpMNv41988619886eucas1p10;
 Tue, 28 Jan 2025 19:48:38 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20250128194838eusmtrp2c4b9da3b48e09b6efa5f6cbe0f24fd16~e8wcoeocA3008430084eusmtrp2f;
 Tue, 28 Jan 2025 19:48:38 +0000 (GMT)
X-AuditID: cbfec7f2-b11c470000005155-99-67993496f2fe
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id E7.BB.19654.69439976; Tue, 28
 Jan 2025 19:48:38 +0000 (GMT)
Received: from AMDC4942.home (unknown [106.210.136.40]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20250128194836eusmtip17d32b73588c20ebc10d406239e436948~e8wbTFR8q0756107561eusmtip1Q;
 Tue, 28 Jan 2025 19:48:36 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
To: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, drew@pdp7.com, guoren@kernel.org,
 wefu@redhat.com, jassisinghbrar@gmail.com, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, frank.binns@imgtec.com,
 matt.coster@imgtec.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 ulf.hansson@linaro.org, jszhang@kernel.org, p.zabel@pengutronix.de,
 m.szyprowski@samsung.com
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-pm@vger.kernel.org, Michal Wilczynski
 <m.wilczynski@samsung.com>
Subject: [PATCH v4 10/18] drm/imagination: Add reset controller support for
 GPU initialization
Date: Tue, 28 Jan 2025 20:48:08 +0100
Message-Id: <20250128194816.2185326-11-m.wilczynski@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250128194816.2185326-1-m.wilczynski@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA02SfUxTZxTG9957e2/bWHYpJr6TiZFEN52r0BD3bjpSJyx3mjRuzkxdzOzm
 XXWjlLQw1LhY+WgAwekGAkUKOIKVjTE+2lFGYWClIFgYdC1h8pEpsjJchxSCbMgoFzf/+z3P
 eU7OOW9ePi62kGv5J+ITWU28Ii6cFBKW9kfOly9HFSojeh9EoA7PVQyZ/zZQ6FubE0MldicP
 DffVY8g14yPRd2O9FPrddo5AblMxhVLbq0nkNQyTaCp7mIf6G6+QaDrHDpBlOo1EVfYhClXP
 lGCobMpMoPKGRoD0mRU89POtWDQ03EEgb382jvSGZ9FiUwOFHrtrCFT0ZwuF6icv8ZCj6j2U
 1pJLyMIY30A6xUx6vQRzI8NPMbbZUoKxGoYoJtvaDZjaykySueNuIhlj59vMyHkHxtSVn2XS
 qtox5ouFCMbX/AvJXKivBExfqofaJz4s3HmMjTvxGavZFn1UeLx7/gaWcHHDSYtuhtABd2gW
 4PMhHQV78iOygJAvpk0AmuwjJCf8AI7n3KQ4MQ2gb3ia96TDeOsg518D8O4fZTgnJgF0jxUs
 dQj4JC2Fo9dKeIHCajqdgOk3z4GAwOlxAC33rpCBVAh9FNr017EAE/RGeH0ilwiwiJZBy1zB
 MkN6PWxpvY0HWLDk1y6YVjLBsLPw3jLjS5lUc9HyGpCuEkLvYAnONcfA3PuNPI5D4ISjnuL4
 ebhoLcE4VsNR88OV/BlozXas8A54xzlPBm7G6c2wunEbZ++CxVl6inuKIDjwIJhbIQh+acnH
 OVsEM/RiLr0J5mXn/DfUabKsDGVga0oqfhFsMDx1jOGpYwz/zy0FeCVYwyZpVUpWGxnPJku0
 CpU2KV4p+UitqgVLX7vrseNhAyiemJK0AYwP2gDk4+GrRUecBUqx6Jji1GlWo/5AkxTHattA
 KJ8IXyO62pKuFNNKRSL7KcsmsJonVYwvWKvD8hIzuwefaUr2Kx1eVVeYxJ9s3ZvvevWT817U
 lKDuvCwb3L5JZjCLxqWgWRcs73ju/QjxdultU8xvJ/s9MV0HpOpDzO7W1y+ddo0OGCvmJKe+
 iv1RkCpf/GlHef3eXF3G57tVoYf2H17XE/R1u++FxZZX5rLWbe2NvXtWVlF75pt8qeygXPbx
 Iq1P0b+j7ra4XhyfTdylMeYF75ndl1lnXBjxVGf1VRm3FnkM97FH0ZM+VVTSlkjHXIPhyPrY
 jqhV0j01P6REMe+q5w+4Cv7ayDb4d3rLknI+XHWhnXhp/1vRpc1v9IRsrpHHy3rHmn8tjJSn
 2LttItv3/wjm36zzhRW+Fk5ojysit+AareJfcH0YuUkEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrKKsWRmVeSWpSXmKPExsVy+t/xu7rTTGamG1zbzGNx4voiJoutv2ex
 W6zZe47JYv6Rc6wW9y5tYbK48vU9m8W6pxfYLV7sbWSxuLZiLrtF87H1bBYvZ91js/jYc4/V
 4vKuOWwWn3uPMFps+9zCZrH2yF12i/Vf5zNZLPy4lcViyY5djBZtnctYLS6ecrW4e+8Ei8XL
 yz3MFm2z+C3+79nBbvHv2kYWi9nv9rNbbHkzkdXi+Npwi5b9U1gc5Dze32hl93jz8iWLx+GO
 L+wee78tYPHYOesuu0fPzjOMHptWdbJ53Lm2h81j3slAj/vdx5k8Ni+p92hZe4zJo/+vgcf7
 fVfZPPq2rGL0uNR8nT1AKErPpii/tCRVISO/uMRWKdrQwkjP0NJCz8jEUs/Q2DzWyshUSd/O
 JiU1J7MstUjfLkEv48yvw0wFExQrtjV8ZWlgvCbdxcjBISFgIjHvVEQXIxeHkMBSRonWLxeZ
 uhg5geIyEte6X7JA2MISf651sUEUvWKU2DRlOyNIgk3ASOLB8vmsILaIwGIWib37KkGKmAXe
 Mkpcn7kRrFtYIE6isWkKmM0ioCqx8hWEzSvgILHtxwyoDfIS+w+eZQaxOYHim/6uAIsLCdhL
 PHo7gw2iXlDi5MwnYHFmoPrmrbOZJzAKzEKSmoUktYCRaRWjSGppcW56brGRXnFibnFpXrpe
 cn7uJkZgetl27OeWHYwrX33UO8TIxMF4iFGCg1lJhDf23Ix0Id6UxMqq1KL8+KLSnNTiQ4ym
 QHdPZJYSTc4HJri8knhDMwNTQxMzSwNTSzNjJXFetivn04QE0hNLUrNTUwtSi2D6mDg4pRqY
 TJ89u37EOOz+19abq5sEMgU+aysc1u1L4e7/uzVceHX377V1UXOdhcq/vOPv9w5KV35nFtMT
 e3xNT2pZT9bbPPnMVsO425mFzyxTuviZTD/kf8y7xDfH/6KGYL7r35u+p0oeZj7N2vOizrvf
 wcreieP1u8MuQbkv5JmuPOXKad5Z9FPYe8431pApaawv1RYu+G/n/i6IdWNig2Wj1o8wmSvm
 U/s1hC/Xsv3z+GYWpL6z4/bDzKKLsVVbWjy+xURFhn1/tHyhU/r/9LSTR3/teFwmuFu3IFo+
 Kc+1XOhyImNYUH/1lCk3Ds4U5AwwvV0475fbmUzpDXvyDxyuXH565e3Die5rUp8wGzJ4rldi
 Kc5INNRiLipOBABUgEkKuAMAAA==
X-CMS-MailID: 20250128194838eucas1p1829115b2b05d209a7c277eccf56e0b90
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250128194838eucas1p1829115b2b05d209a7c277eccf56e0b90
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20250128194838eucas1p1829115b2b05d209a7c277eccf56e0b90
References: <20250128194816.2185326-1-m.wilczynski@samsung.com>
 <CGME20250128194838eucas1p1829115b2b05d209a7c277eccf56e0b90@eucas1p1.samsung.com>
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

Certain platforms, such as the T-Head TH1520 and Banana Pi BPI-F3,
require a controlled GPU reset sequence during the power-up procedure
to ensure proper initialization. Without this reset, the GPU may remain
in an undefined state, potentially leading to stability or performance
issues.

This commit integrates a dedicated reset controller within the
drm/imagination driver. By doing so, the driver can coordinate the
necessary reset operations as part of the normal GPU bring-up process,
improving reliability and ensuring that the hardware is ready for
operation.

Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 drivers/gpu/drm/imagination/pvr_device.c | 21 +++++++++++++++++++++
 drivers/gpu/drm/imagination/pvr_device.h |  9 +++++++++
 drivers/gpu/drm/imagination/pvr_power.c  | 12 +++++++++++-
 3 files changed, 41 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/imagination/pvr_device.c b/drivers/gpu/drm/imagination/pvr_device.c
index 1704c0268589..ef73e95157ee 100644
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
index 6d0dfacb677b..f6576c08111c 100644
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
index ba7816fd28ec..e39460d594bd 100644
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
 
@@ -282,16 +285,23 @@ pvr_power_device_resume(struct device *dev)
 	if (err)
 		goto err_sys_clk_disable;
 
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

