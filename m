Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38A84A1714A
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jan 2025 18:21:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3905A10E471;
	Mon, 20 Jan 2025 17:21:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="XDHXYLHm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13DC810E45A
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jan 2025 17:21:34 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20250120172132euoutp02f609c675af40f8f7f791232fdf8aed60~cdlvG0dTB1548115481euoutp027
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jan 2025 17:21:32 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20250120172132euoutp02f609c675af40f8f7f791232fdf8aed60~cdlvG0dTB1548115481euoutp027
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1737393692;
 bh=eAUbvgl5eQMBrf9ryB0lP3G/PfW+DJVxnTJGj8UoOkg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XDHXYLHmDzEqAdtM6wiFdtQdVYy750FtJdMIYisQWNvEdUF4qgCrm8mOKrjSYk9IR
 Z45tf7piayvfycVP5AMDb+oR2YW/gNPE3V8PARaC4SL0p1jlph9J8DrLz6s6ZjVZa5
 fGyf1uq5Ttn2rWyR8FnHGtOaJJiMRofBeGzmbA/0=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20250120172132eucas1p29c22e3d03335c9f36df4d00f91513eaf~cdluqMSF51091910919eucas1p2n;
 Mon, 20 Jan 2025 17:21:32 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 45.66.20397.C168E876; Mon, 20
 Jan 2025 17:21:32 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20250120172131eucas1p1ed7fc14a96c66b1dc9e14e9fc7cbb2b7~cdluQRW3i2183221832eucas1p16;
 Mon, 20 Jan 2025 17:21:31 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20250120172131eusmtrp2a05c411a15dc9b6135052d16733e0584~cdluPge950490804908eusmtrp2z;
 Mon, 20 Jan 2025 17:21:31 +0000 (GMT)
X-AuditID: cbfec7f5-ed1d670000004fad-58-678e861c8d56
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 41.A5.19654.B168E876; Mon, 20
 Jan 2025 17:21:31 +0000 (GMT)
Received: from AMDC4942.home (unknown [106.210.136.40]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20250120172129eusmtip17f46b2682e54a873c44b285b8e3661cc~cdlsNFnYN1070610706eusmtip14;
 Mon, 20 Jan 2025 17:21:29 +0000 (GMT)
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
Subject: [RFC v3 09/18] drm/imagination: Add reset controller support for
 GPU initialization
Date: Mon, 20 Jan 2025 18:21:02 +0100
Message-Id: <20250120172111.3492708-10-m.wilczynski@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250120172111.3492708-1-m.wilczynski@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sf0xbVRj1vvf6XlstPAqTKxDGmogZicA2TW7iVEy27CU6dZhoxERXx7Ms
 QGEt4BibtmlhWykTxha0MIoDoRCBgbThR7GIQFec1YFlNRvd5nBYVtcx6ABxIOWh7r/zfefc
 c76TXD4uNpNR/IPyPFYhl2ZJSCFhGVlyPhtTckqWPKYWoYtXzmPIvGyg0Nf9TgwZh5w85Bnr
 wtAvAT+J2n7/mUJ/9KsJNGE6RyHNSDuJvAYPiWb1Hh4a760h0VzZEECWOS2JWocmKdQeMGLo
 y1kzgRq6ewEqOdnIQ5dHd6NJz0UCecf1OCoxhKJVazeFViY6CFR910ahLl8FD9lb30Fa2xki
 JZbxu4spxuf1Esz3J+Yppv9BHcH0GCYpRt9zCTCdLSdJ5tqElWRqHfuY66V2jPmm4VNG2zqC
 MZ89TGb837pI5lRXC2DGNFeoN8Vpwp3pbNbBAlaR9NJ+YUaTaZLIdWw5PKfdowKr0TrA50P6
 Obhy/CMdEPLFtAlAx1UPwQ3zAC5qvwLcMLfG1NdSOiBYf/Gr48yGqgnApalKiht8AN7pLOcF
 VSS9Hd5oMvKCRARdTMDiYfW6F05PA2iZqiGDqnD6fVjReXXdl6CfhvPVViyIRXQKbFb3AS5v
 M7R99yMexIK1/YKrn+I0YdDxxRQRxPiaRmOuxoMBkG4VQtN8G4+rtwv+XS7ifMLhjL1ro0MM
 XO0xYhzOgTfM93EOH4U9evsGfgFec/5FBm1weits703i1q/Aqt+uU5x7CHT/GcZdEAJPW6pw
 bi2CJ0rEnDoentWX/RfqNFk2Qhl4tu4yXg62GB7pYniki+H/3DqAt4BINl+ZLWOVO+Tsx4lK
 abYyXy5LPJCT3QnWfvYPK/ZANzDNzCYOAowPBgHk45II0aZ7eplYlC4tPMIqcj5Q5GexykEQ
 zSckkaLztmKZmJZJ89hMls1lFf+yGF8QpcIaCwIDTzZPE9apXmeH6Pat6KLM0/EL7Z8f2prp
 2u41ZKTEPdSNp0elWS7scEqwviRRc+NwpTm1eUFWL5xTVRS920fulh2z7ZzpyGOGPZFFYYcj
 kv3uu7xxOrS3sT7Vtdftzl6+0FYfHuJ6am/svVzNh1aQOVMW6xPEx+GV594YaHiw6jI+rkB3
 bt1Pf97wcnRi3wE1kRP6etM2VcIz6vIXS30ltYs3w0Uxs098ctPGHHIWCtkVVxkh5useK51W
 DSRkb56tmU99u8p2bHCTNU35XmFN/B7/voD/UtztfPHk8qtHCgRHh/fv0hiiLZik6CfXqFzu
 fksVtpSTd3x08TUJocyQbkvAFUrpP6TLE1JIBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrKKsWRmVeSWpSXmKPExsVy+t/xu7rSbX3pBtd26FqcuL6IyWLr71ns
 Fmv2nmOymH/kHKvFvUtbmCyufH3PZrHu6QV2ixd7G1ksrq2Yy27RfGw9m8XLWffYLD723GO1
 uLxrDpvF594jjBbbPrewWaw9cpfdYv3X+UwWCz9uZbFYsmMXo0Vb5zJWi4unXC3u3jvBYvHy
 cg+zRdssfov/e3awW/y7tpHFYva7/ewWW95MZLU4vjbcomX/FBYHOY/3N1rZPd68fMnicbjj
 C7vH3m8LWDx2zrrL7tGz8wyjx6ZVnWwed67tYfOYdzLQ4373cSaPzUvqPVrWHmPy6P9r4PF+
 31U2j74tqxg9LjVfZw8QitKzKcovLUlVyMgvLrFVija0MNIztLTQMzKx1DM0No+1MjJV0rez
 SUnNySxLLdK3S9DLWL7iLkvBScWKzy3uDYz/pbsYOTkkBEwkbp6cwtLFyMUhJLCUUeL24Ufs
 EAkZiWvdL1kgbGGJP9e62CCKXjFKXF6zhxEkwSZgJPFg+XxWEFtEYDGLxN59lSBFzAJvGSWu
 z9wI1i0sECNxuOEd2FQWAVWJL7P3MIHYvAIOEisbdzNCbJCX2H/wLDOIzQkU/351L1i9kIC9
 xJ2r3YwQ9YISJ2c+AZvJDFTfvHU28wRGgVlIUrOQpBYwMq1iFEktLc5Nzy020itOzC0uzUvX
 S87P3cQITC/bjv3csoNx5auPeocYmTgYDzFKcDArifCKfuhJF+JNSaysSi3Kjy8qzUktPsRo
 CnT3RGYp0eR8YILLK4k3NDMwNTQxszQwtTQzVhLnZbtyPk1IID2xJDU7NbUgtQimj4mDU6qB
 aVfd7kn9Mv15J82WmJ++dPmqxjwpxp6e/P+JawWblk3/5Pl267V3lvNULk1VKXbWtb7dKlFv
 voI/eJ3F7Mp6Ro4+E+mtrRHSdReN3PyncnpJyyiLCTuIWF2Y6nEt0f6r9o9T9Zcn31j9sHar
 XN2SH98exJc9WRzPfT9BfuaLsO6MN/PNjY9PY9+rE/jows7tGrs+1Ll/TrvSITljR3/UZIb+
 81YWX/lqGGs3KFRVvJ8UJhe/WGKzxlGjb2JfV3j87bWbe9NSQbx/0+JSfb72g5ldDB8q2zpt
 Lk6ZG7aCYcsRW6vJNleXRHPNT1g0b3P9wxrfFQl5PadvHtn6L6Im+khBR+P31sXHve60Hmt4
 ocRSnJFoqMVcVJwIAP0TrMa4AwAA
X-CMS-MailID: 20250120172131eucas1p1ed7fc14a96c66b1dc9e14e9fc7cbb2b7
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250120172131eucas1p1ed7fc14a96c66b1dc9e14e9fc7cbb2b7
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20250120172131eucas1p1ed7fc14a96c66b1dc9e14e9fc7cbb2b7
References: <20250120172111.3492708-1-m.wilczynski@samsung.com>
 <CGME20250120172131eucas1p1ed7fc14a96c66b1dc9e14e9fc7cbb2b7@eucas1p1.samsung.com>
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
 drivers/gpu/drm/imagination/pvr_power.c  | 15 ++++++++++++++-
 3 files changed, 44 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/imagination/pvr_device.c b/drivers/gpu/drm/imagination/pvr_device.c
index 1704c0268589..7ae9875d8d74 100644
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
+	reset = devm_reset_control_get_exclusive_by_index(drm_dev->dev, 0);
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
index ba7816fd28ec..87a955600d8b 100644
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
@@ -252,6 +253,9 @@ pvr_power_device_suspend(struct device *dev)
 	clk_disable_unprepare(pvr_dev->sys_clk);
 	clk_disable_unprepare(pvr_dev->core_clk);
 
+	if (pvr_dev->reset)
+		err = reset_control_assert(pvr_dev->reset);
+
 err_drm_dev_exit:
 	drm_dev_exit(idx);
 
@@ -282,16 +286,25 @@ pvr_power_device_resume(struct device *dev)
 	if (err)
 		goto err_sys_clk_disable;
 
+	if (pvr_dev->reset) {
+		err = reset_control_deassert(pvr_dev->reset);
+		if (err)
+			goto err_mem_clk_disable;
+	}
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

