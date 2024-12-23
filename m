Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99AAE9FB14C
	for <lists+dri-devel@lfdr.de>; Mon, 23 Dec 2024 17:05:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 765FE10E560;
	Mon, 23 Dec 2024 16:04:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="ni6qYVMT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9184610E155
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Dec 2024 12:56:20 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20241223125619euoutp0237c4249960e06978b5f099e80540c767~Tz6K-cQg-1111211112euoutp02C
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Dec 2024 12:56:19 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20241223125619euoutp0237c4249960e06978b5f099e80540c767~Tz6K-cQg-1111211112euoutp02C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1734958579;
 bh=nuwkiED4lPbpZKtXLcNkHTpLcBgX1IbFQaBo7zxmeMI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ni6qYVMTUYdSTJ/IBBTcsYUh+xyMzvqrcR6OLSaDF0IUXPLiCVvacUKMmMnxY1sQG
 E2Op7OkNs0dkbreKQGbVC8SgX8O5RQ/6PSynSGJDtftZgkmPSZioBns6wDX4JcTABL
 gLWUcNEkjyK6EpzHgu8Xs5ov0f/jtljJ3nZcaGIo=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20241223125618eucas1p2f8a172811e17e89c2823310441f50f7d~Tz6KlYoEZ1761017610eucas1p2Q;
 Mon, 23 Dec 2024 12:56:18 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 78.C6.20821.2FD59676; Mon, 23
 Dec 2024 12:56:18 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20241223125618eucas1p2ad4887b41bb99a9ebbd0b8c2e2aa4af4~Tz6KIBSf_0550705507eucas1p2u;
 Mon, 23 Dec 2024 12:56:18 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20241223125618eusmtrp13abc2d87fa4ff22ee885e3e20ea6c671~Tz6KG99-F2059320593eusmtrp19;
 Mon, 23 Dec 2024 12:56:18 +0000 (GMT)
X-AuditID: cbfec7f2-4fd7024000005155-94-67695df261d0
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id B0.04.19920.2FD59676; Mon, 23
 Dec 2024 12:56:18 +0000 (GMT)
Received: from AMDC4942.home (unknown [106.210.136.40]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20241223125616eusmtip2fa38fe9c5a1f5b4707663101a15171a8~Tz6IvQ0vv3149631496eusmtip2F;
 Mon, 23 Dec 2024 12:56:16 +0000 (GMT)
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
Subject: [RFC PATCH v2 13/19] drm/imagination: Add support for IMG BXM-4-64 GPU
Date: Mon, 23 Dec 2024 13:55:47 +0100
Message-Id: <20241223125553.3527812-14-m.wilczynski@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241223125553.3527812-1-m.wilczynski@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01Se0xTZxzdd+/tvaVJ4VJ8fAGn2KVONkUgZH4Zm2HZMDd7OPljw2nIVuVa
 mRRMC2wSN2EFprXgdDBrwVHQ0AqUR6E8ukIdQqmgHag8zKCgwiasijzUMCMbpXXzv3N+5/x+
 5zvJx8UFTWQgNzE5lZUli5OEJI9otC04Ns/GJ0rCfjdEIvtgGYZMTzUUqmp1YKikw8FBzusN
 GLr5aJpE1RO9FLrXmkWgAf05CilsNSSa1DhJNKNyctANczGJ5vI6AGqcyyaRoWOEQjWPSjBU
 OmMi0IVmM0C5x8s5qK87Bo047QSavKHCUa7GD/1jaabQ4kAdgYoeWCnU4DrFQV2GOJRtLSCi
 1zLTQzkU45qcJJjLx+YppvWxlmBaNCMUo2q5ChhjxXGSGR6wkMzPV2KZ0RNdGFN/4SiTbbBh
 zMlnYcx0Wz/J5DdUAOa6YpDaKdjNeyuBTUpMZ2Vbtn3BO2A1n8UOVXK//s2hIzOBglICHy6k
 I+F87hlMCXhcAa0HsP/xUy+ZB3BhoJv0kDkAZwq0+POV3gkl8Ag6ADO7n3hXXABWNv1CuF0k
 HQHHdCUct7CCziFgTmfW8gpO/wlg43gx6XYF0LHw0pwRuDFBi6Cx1raM+XQ0HK+yefPWQeuv
 15axz9K8Sjnk9fjDK2fHl9PwJY/CVIS7AyBt4MGbhd1L/bhL5D3YZE333AmAU10N3tprYM+P
 KsKDU+CYadabdQS2qLq8OAoOO/4m3WdwOgTWmLd4xu9A7YgaeK77wqH7/p4X+MLTjWdwz5gP
 j+UKPO4NsFCV91+oQ9+IeTADrcoJ8gewXvNCF80LXTT/52oBXgFWs2lyqYSVhyezX4XKxVJ5
 WrIkdF+K1AiW/nbPYtdsMzg3NRPaDjAuaAeQiwtX8NsFiRIBP0F8OIOVpXwuS0ti5e0giEsI
 V/NFCetYAS0Rp7IHWfYQK3uuYlyfwExsa1n53er0E30zaYMZ25yrtu9XfFreEfx25sffxp3/
 pMw3+9bl+nb7qD7M1ma5uNh5XvDN3rEnkUF15ZvyTOUnR0Wczr6Q08aivIyYuvqIh/v3KOem
 aj8I6lkZpO4XajYFxvxRm2/cdVt4Z2rYsi8ty2+hz/pGvP+9HSN/VQ69bI7I/zIu6Frp2of5
 /Xxn8Yd2i1Wh3rn51mctr8t3iw/roieiwkNElwrf33G14OBG7Mgu/bvSN7cPfvTK3l5NTupQ
 9dZSKe/O9/cvLh4de+kns+5BVuEGNTZ7uyI+nPcdUouiVxW8Ot+mD1jpivKrkmyMXWNdb6+P
 CnS5gu9iBK3Nexa8R4J6hIT8gDj8NVwmF/8LFwOxyEoEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrGKsWRmVeSWpSXmKPExsVy+t/xe7qfYjPTDbofCFmcuL6IyWLr71ns
 Fmv2nmOymH/kHKvFvUtbmCyufH3PZrHu6QV2ixd7G1ksrq2Yy27RfGw9m8XLWffYLD723GO1
 uLxrDpvF594jjBbbPrewWaw9cpfdYv3X+UwWCz9uZbFYsmMXo0Vb5zJWi4unXC3u3jvBYvHy
 cg+zRdssfov/e3awW/y7tpHFYva7/ewWW95MZLU4vjbcomX/FBYHOY/3N1rZPd68fMnicbjj
 C7vH3m8LWDx2zrrL7tGz8wyjx6ZVnWwed67tYfOYdzLQ4373cSaPzUvqPVrWHmPy6P9r4PF+
 31U2j74tqxg9LjVfZw8QitKzKcovLUlVyMgvLrFVija0MNIztLTQMzKx1DM0No+1MjJV0rez
 SUnNySxLLdK3S9DL2L9rJlPBao6K8+eWszUwNrN3MXJySAiYSFx42sXYxcjFISSwlFGi/0w/
 G0RCRuJa90sWCFtY4s+1LjaIoleMEi8+zGAFSbAJGEk8WD4fzBYRWMwisXdfJUgRs8BbRonr
 MzeCdQsL+EscnvuTEcRmEVCV2LThGJjNK+Ag8WTNMWaIDfIS+w+eBbM5geJrum6A1QgJ2Ev8
 O/WBDaJeUOLkzCdgM5mB6pu3zmaewCgwC0lqFpLUAkamVYwiqaXFuem5xYZ6xYm5xaV56XrJ
 +bmbGIEJZtuxn5t3MM579VHvECMTB+MhRgkOZiUR3kNCmelCvCmJlVWpRfnxRaU5qcWHGE2B
 7p7ILCWanA9McXkl8YZmBqaGJmaWBqaWZsZK4rxul8+nCQmkJ5akZqemFqQWwfQxcXBKNTCZ
 O7nN3fHBf3KFzOtsr5NvC0Lb/6312DDn1xZ91w0T37MU7tIS2/3KuK/3g+zautropNU1W1dy
 9+QG7VLdzhLS0y76JOldHEPr/otS1zeF7ltesl4yaZEPq6DF5kkHJOw73hjN+hY4M5bLZ451
 5cQ8pUynCX+c3f/ItzFmXbI5XrjS117vEMOZ5zfuLVZ22S1zNLasuecQ3/nnJ/tzG93CnN4L
 7vWcxH2Bc1dKy27HpzL79FMyhBkfTFBd+HnthdsnWG+FWjw7m+QVc5Dt1fJNGzcnTmqMZYnq
 2ixt2TVxXtleCf2tW/91LJdx8JqZrntMz3Xh2y1HmwM8pH/9iBR6ULvizppU+9P//svsL1VT
 YinOSDTUYi4qTgQAOKNO7LkDAAA=
X-CMS-MailID: 20241223125618eucas1p2ad4887b41bb99a9ebbd0b8c2e2aa4af4
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20241223125618eucas1p2ad4887b41bb99a9ebbd0b8c2e2aa4af4
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20241223125618eucas1p2ad4887b41bb99a9ebbd0b8c2e2aa4af4
References: <20241223125553.3527812-1-m.wilczynski@samsung.com>
 <CGME20241223125618eucas1p2ad4887b41bb99a9ebbd0b8c2e2aa4af4@eucas1p2.samsung.com>
X-Mailman-Approved-At: Mon, 23 Dec 2024 16:04:53 +0000
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

