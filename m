Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE489A17147
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jan 2025 18:21:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94BCA10E470;
	Mon, 20 Jan 2025 17:21:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="Ncbd0a/k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBEA310E470
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jan 2025 17:21:37 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20250120172136euoutp026632a839571ef13fef3ed4576eb95253~cdlykyjal1664816648euoutp02z
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jan 2025 17:21:36 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20250120172136euoutp026632a839571ef13fef3ed4576eb95253~cdlykyjal1664816648euoutp02z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1737393696;
 bh=nuwkiED4lPbpZKtXLcNkHTpLcBgX1IbFQaBo7zxmeMI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Ncbd0a/komMMaFPIL5gfXYx3ENroZwR+rbaJqffPRKS6EtBrfG4hjoId2CwKDgYUl
 j8NK60PIN6vtS/Ti6+1oFpOiwK5FbVYLxzzYSZxVySlH0VTM5GagVckKRlMVnZ0Kke
 7BE8cWvEwmemw0XDGjUY7vpBhsOCe4w2fvjS8M4s=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20250120172136eucas1p2f45e75bc4a379046a1dbdf76402b116c~cdlyNSo7J3178431784eucas1p2T;
 Mon, 20 Jan 2025 17:21:36 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 89.66.20397.0268E876; Mon, 20
 Jan 2025 17:21:36 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20250120172135eucas1p22f50d9db3fb656fbaf6ccc096dcb8c9f~cdlxzu3UW1088710887eucas1p2B;
 Mon, 20 Jan 2025 17:21:35 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20250120172135eusmtrp21c3eeefc05f360d12fd0707b075015f4~cdlxy7IGV0490804908eusmtrp27;
 Mon, 20 Jan 2025 17:21:35 +0000 (GMT)
X-AuditID: cbfec7f5-e59c770000004fad-61-678e862064ef
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 77.A5.19654.F168E876; Mon, 20
 Jan 2025 17:21:35 +0000 (GMT)
Received: from AMDC4942.home (unknown [106.210.136.40]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20250120172134eusmtip1538a3bfd29b585a5de5b7340c6e72a35~cdlwdp3Z-0819408194eusmtip1r;
 Mon, 20 Jan 2025 17:21:34 +0000 (GMT)
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
Subject: [RFC v3 12/18] drm/imagination: Add support for IMG BXM-4-64 GPU
Date: Mon, 20 Jan 2025 18:21:05 +0100
Message-Id: <20250120172111.3492708-13-m.wilczynski@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250120172111.3492708-1-m.wilczynski@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01SbUxTZxjNe+/l3kuTukuB8KKLmxXnWDJgDPGdMj+iS66Z2ebGNMoYdvOm
 CLSQFvzaDJBSRrFS0U2kyECGoysr+NEi7aiNgFQ3KSBSdIPCDxdoZSICuuEGo1zd/HfO857n
 OeckL42LzORieq88m1PIJRliUkA0dfzV9frLhSXSmEofjq7112DI8kRPoR/tLgxVtbsCkOem
 GUO3psdJ1PB7N4VG7fkEchsqKaTqaCSRV+8h0YTWE4B6badJNHm0HaCmyQISmdoHKdQ4XYWh
 MxMWAtU22wAq1HwfgHp+fgcNeq4RyNurxVGh/gU019JMoVn3eQJV3HdQyDxWGoCcph2owPE1
 sWEpO35bTbFjXi/BthVNUaz9UTXBWvWDFKu13gDsBaOGZAfcLST77fVt7NARJ8ZerM1lC0wd
 GKv7J4Ydv9xHsiVmI2BvqvqpD0S7BAl7uIy9+zhF9LrdglSHrRzLqqcPdLnqyDygoooBTUMm
 Dmp0qBgIaBFjALDuXB7JkykAe/ssRDEInCeTAPqOBfuxf6HUWRzAi+oAvHG/kuDJGICDVjPp
 V5FMLByuq1pQhTBqAqqv5gM/wZkRAJvunib95sHMFqh5tMa/QDAr4MjAyYVlIbMB5vdeBLzd
 S9BxpRP348D5+eM+O8VrguD18rsL8fB5jcpSgfvvQ8YkgGNuI8aX2wwrhln+TjD0Oc0Uj1+E
 c9YqjMeZcNjyEOfxl9CqdT7Fa+GAa2YhJs5EwkZbND/eCIe6y3D++iJ4+48gPsEieLzp2VgI
 iwpFvPoV+I326H+mLkPTU1MW1lfrsGNgmf65Lvrnuuj/960GuBGEcTlKmZRTvinn9kcpJTJl
 jlwa9Xmm7AKY/9i/zDqnm4HBNxHVCjAatAJI4+IQYegDrVQk3CM5eIhTZKYocjI4ZStYQhPi
 MGGNQy0VMVJJNpfOcVmc4tkrRgcuzsOsJ+M/2/auMbxWJD0U+9b0kbgS25MIphLlzqiSHs6E
 RgrfW34WtcV2m8p8gvg2Z3RjxKhGnbzS9NXyXeLElq65NctmZZfEZWHe7FzFWaWgPCbi4/gz
 q13rXl3fYOsZaNyUl/XdgwZ58hJ7X704nd4dq756vmLL7IfbHWn3dPvYpM0JBys6LW4QeQf/
 WzLy51bWF6JzDq5MuNTdGXrYUPR+qaw5f3j7r2lV1hObbq0KS/wo9wdp8lSQ7fGV9p92eE58
 URvXOmrcuPOTtjup6w8n2VIcSz8dYYp7wn/D3cTEqXOJ/UMRQJy8sz4zqCZ9ZP8kaU9722tY
 lbJaG741+8C9y2NrxYQyVfLGa7hCKfkXz7s3x0cEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrKKsWRmVeSWpSXmKPExsVy+t/xu7rybX3pBuebFC1OXF/EZLH19yx2
 izV7zzFZzD9yjtXi3qUtTBZXvr5ns1j39AK7xYu9jSwW11bMZbdoPraezeLlrHtsFh977rFa
 XN41h83ic+8RRottn1vYLNYeuctusf7rfCaLhR+3slgs2bGL0aKtcxmrxcVTrhZ3751gsXh5
 uYfZom0Wv8X/PTvYLf5d28hiMfvdfnaLLW8mslocXxtu0bJ/CouDnMf7G63sHm9evmTxONzx
 hd1j77cFLB47Z91l9+jZeYbRY9OqTjaPO9f2sHnMOxnocb/7OJPH5iX1Hi1rjzF59P818Hi/
 7yqbR9+WVYwel5qvswcIRenZFOWXlqQqZOQXl9gqRRtaGOkZWlroGZlY6hkam8daGZkq6dvZ
 pKTmZJalFunbJehl7N81k6lgNUfF+XPL2RoYm9m7GDk5JARMJCYe72LtYuTiEBJYyihx9usK
 RoiEjMS17pcsELawxJ9rXWwQRa8YJX713WIGSbAJGEk8WD6fFcQWEVjMIrF3XyVIEbPAW0aJ
 6zM3AnVzcAgLeEp0frMCqWERUJV4fmcaG4jNK+Ag0Xh5M9QyeYn9B8+CzeQEin+/uhfsOiEB
 e4k7V7sZIeoFJU7OfAJ2EDNQffPW2cwTGAVmIUnNQpJawMi0ilEktbQ4Nz232EivODG3uDQv
 XS85P3cTIzC9bDv2c8sOxpWvPuodYmTiYDzEKMHBrCTCK/qhJ12INyWxsiq1KD++qDQntfgQ
 oynQ3ROZpUST84EJLq8k3tDMwNTQxMzSwNTSzFhJnJftyvk0IYH0xJLU7NTUgtQimD4mDk6p
 Bia9/oLj23UTvfVDnFWXqAXMMLmx6GTa2ap3J9SLmFpiHsf+P6fxdELjrMKSHWY+nY+LLr71
 kL1jY831x8DhW1q7R8DDZYd3cN0RM/m3Ok/WtZmjKcDRTO3aS7s/qe/vZvTO2GD+QE40ssj6
 Qp5apf7hVJFQlzX/L69er32/6OXcFyv+pfM2OXKV3D2csi6zLvdaH89rj/BDC0rM5ey6eVzL
 xPZI2DJfmu945+z0Ncc+GtUvnXzn+fYDHM3OB2+Y3z7G3aNyK70+qMSr6M01K2POhfOPS0jU
 rYk1+LCgXnMR54XH+9Pv/lexvm8+73hMnXXmJI+jP0T11p651CArtCEwyZHLxZl366WlXJsl
 mZVYijMSDbWYi4oTATY/yji4AwAA
X-CMS-MailID: 20250120172135eucas1p22f50d9db3fb656fbaf6ccc096dcb8c9f
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250120172135eucas1p22f50d9db3fb656fbaf6ccc096dcb8c9f
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20250120172135eucas1p22f50d9db3fb656fbaf6ccc096dcb8c9f
References: <20250120172111.3492708-1-m.wilczynski@samsung.com>
 <CGME20250120172135eucas1p22f50d9db3fb656fbaf6ccc096dcb8c9f@eucas1p2.samsung.com>
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

The IMG BXM-4-64 GPU is integrated into the T-Head TH1520 SoC. This
commit adds the compatible string "img,img-bxm" to the device tree match
table in the drm/imagination driver, enabling support for this GPU.

By including this GPU in the compatible devices list, the driver can
initialize and manage the BXM-4-64 GPU on the TH1520 SoC, providing
graphics acceleration capabilities upstream.

Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 drivers/gpu/drm/imagination/pvr_drv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/imagination/pvr_drv.c b/drivers/gpu/drm/imagination/pvr_drv.c
index 85ee9abd1811..91af060bb3e0 100644
--- a/drivers/gpu/drm/imagination/pvr_drv.c
+++ b/drivers/gpu/drm/imagination/pvr_drv.c
@@ -1475,6 +1475,7 @@ static void pvr_remove(struct platform_device *plat_dev)
 
 static const struct of_device_id dt_match[] = {
 	{ .compatible = "img,img-axe", .data = NULL },
+	{ .compatible = "img,img-bxm", .data = NULL },
 	{}
 };
 MODULE_DEVICE_TABLE(of, dt_match);
-- 
2.34.1

