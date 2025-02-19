Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C395A3C11B
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 15:03:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E860610E810;
	Wed, 19 Feb 2025 14:03:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="hA43bPnS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17D9510E807
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 14:03:14 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20250219140312euoutp01104a2efd52748b1bdb4d1e9ff263fdd6~loPIhXqul1474214742euoutp01f
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 14:03:12 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20250219140312euoutp01104a2efd52748b1bdb4d1e9ff263fdd6~loPIhXqul1474214742euoutp01f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1739973792;
 bh=cK8knrHIi4/lY6BD8KZcVTKMN8gTk1ruHsI3tUZU9iI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hA43bPnSNbNzT14y4id55JwVqBEtFFQUKexcmA2LuBwbAQf5LNq2jRWdffviZPtux
 YwqHGA6zc/d7QUCScs6OuIwLO9+45ellh74a4W+OpjKIfDw8tkeSDqxi0UcyuuCubC
 MAozI6OA8OckG5EJ7FckOWlwNL1J1V2tYAfzzZss=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20250219140312eucas1p17867cca41ab6e0b80e747aad5dc71e44~loPIE2ptw1247112471eucas1p1W;
 Wed, 19 Feb 2025 14:03:12 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id DF.83.20821.0A4E5B76; Wed, 19
 Feb 2025 14:03:12 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20250219140311eucas1p24ef4a7a95abdb527c2bd305f3ed51674~loPHmt5pF2656126561eucas1p2_;
 Wed, 19 Feb 2025 14:03:11 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20250219140311eusmtrp2d431462d3b4ef21ff91db998b2f784d2~loPHl0XEP2432224322eusmtrp2W;
 Wed, 19 Feb 2025 14:03:11 +0000 (GMT)
X-AuditID: cbfec7f2-b11c470000005155-72-67b5e4a0ac7b
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 25.62.19654.F94E5B76; Wed, 19
 Feb 2025 14:03:11 +0000 (GMT)
Received: from AMDC4942.home (unknown [106.210.136.40]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20250219140310eusmtip250965c3cbba74aa97a083b540660e2c8~loPGWiOI00642206422eusmtip2Q;
 Wed, 19 Feb 2025 14:03:10 +0000 (GMT)
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
Subject: [PATCH v5 16/21] drm/imagination: Add support for IMG BXM-4-64 GPU
Date: Wed, 19 Feb 2025 15:02:34 +0100
Message-Id: <20250219140239.1378758-17-m.wilczynski@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250219140239.1378758-1-m.wilczynski@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA02SfVBUZRTG57337r2XHRcvqxPvkFMKYSHJRzHN28g4OJPNLYYZ+6PILGSF
 26LxNbssllkuwiIICCKbsysEAgqsEUHsxqKwIxALmhSsrF8sH4Z8bm4rkkGIsXux/O85z/md
 9zln5qVx8U+kD70/OY2TJUsSfUkhYehe+HVrxbheGvLo+lrUc6MSQ/p/tBT6rq0PQ+VdfQI0
 PNCMoevzDhJ9f+83Ck21ZRDIWltGoczuBhJNa4dJ5MwfFiBLaymJ5gq6ADLMZZGovstGoYb5
 cgyddeoJVN3SClB27nkB6r+yE9mGewg0bcnHUbZ2LXpyqYVCy9ZGAp25b6JQs/2kAJnro1GW
 qYSIeIF13FRRrH16mmA7cx5SbNtfFQRr1NooNt/4C2CbdLkkO2S9RLLf9r7HjuSZMfbH6iNs
 Vn03xhY+DmEd7YMke6JZB9iBzBvULvFHwvB4LnF/OicL3h4rTKhbGiVTTws/v3vVAJTARh8H
 HjRkwqDzgp04DoS0mKkF0Pp7nYAvHgJ4tn12tZgD8O5gGfl05JTSivONGgB7bxcBvrAD2Kmq
 Ay6KZF6DozXl7vH1jIqAqp8z3BTOTAJoGC91v7WOiYS36tS4SxOMP7RYLZRLi5gIWKoeI/i8
 F6Hp8rUVhqY9Vvz2fh8e8YK9mnE3gq8gmfoz7pUgUy+ExZUanJ99CyqvDQBer4Mz5maK1xvg
 E2M5xusUOKp/sMofhsZ886reBof6FklXLs4EwIbWYN7eAatGZoHLhownvPmHF7+CJyw2nMZ5
 WwRzssU8vRmq8wv+C+2rNayGsvAb9TlBEdikfeYY7TPHaP/PrQC4DnhzCnmSlJOHJnMHg+SS
 JLkiWRoUl5LUBFb+9tVl84MWUDbjDOoAGA06AKRx3/Wi7CPNUrEoXvLFIU6WslemSOTkHeB5
 mvD1FlWaVFIxI5WkcZ9xXCone9rFaA8fJcalhQw7unLo1JLI21OVprQ1Jf7WsLE3HmN34ufv
 TNzbHc8FTG4e2fmmRddf8/GG57LVHROzasfBzoWufZjl/L6M2DivPSPWT3t07+vxPe+E523R
 NH6ibfkbm8kdHNNKAtcUeXMHgk/8kLrRPn+gYO/FjTHvbr8SqfA5mmgd8Uy/T+nCD33wUvjb
 lvEw3I+tenTSHjKlVSvTF6N205OhF6PEHxp92saa1IvRC43UkvVyXuCtpcLYw2FR0V/7RXgU
 054xpk1fkhmFpZYmx7Tq9a+ocza1JmZiedsujkGvOhW2HYF/HotLqHEaA4aOTVV11m3112QU
 mY/O+IVFvZx84ZVqhS8hT5CEbsFlcsm/syouk0oEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrKKsWRmVeSWpSXmKPExsVy+t/xe7rzn2xNN9h/QdfixPVFTBZbf89i
 t1iz9xyTxfwj51gt7l3awmRx5et7Not1Ty+wW7zY28hicW3FXHaL5mPr2SxezrrHZvGx5x6r
 xeVdc9gsPvceYbTY9rmFzWLtkbvsFuu/zmeyWPhxK4vFkh27GC3aOpexWlw85Wpx994JFouX
 l3uYLdpm8Vv837OD3eLftY0sFrPf7We32PJmIqvF8bXhFi37p7A4yHm8v9HK7vHm5UsWj8Md
 X9g99n5bwOKxc9Zddo+enWcYPTat6mTzuHNtD5vHvJOBHve7jzN5bF5S79Gy9hiTR/9fA4/3
 +66yefRtWcXocan5OnuAUJSeTVF+aUmqQkZ+cYmtUrShhZGeoaWFnpGJpZ6hsXmslZGpkr6d
 TUpqTmZZapG+XYJexso/D9gKpnNVPDq9jbGB8S5HFyMnh4SAicTkhmvMXYxcHEICSxkl/r9o
 YIJIyEhc637JAmELS/y51sUGUfSKUeLghZtsIAk2ASOJB8vns4LYIgKLWST27qsEKWIWeMso
 cX3mRrBuYQFviZsrpzKD2CwCqhKXr11mB7F5BRwk5kx9CLVBXmL/wbNANRwcnEDxfRelQMJC
 AvYS5/rus0KUC0qcnPkErJwZqLx562zmCYwCs5CkZiFJLWBkWsUoklpanJueW2ykV5yYW1ya
 l66XnJ+7iRGYXrYd+7llB+PKVx/1DjEycTAeYpTgYFYS4W2r35IuxJuSWFmVWpQfX1Sak1p8
 iNEU6OyJzFKiyfnABJdXEm9oZmBqaGJmaWBqaWasJM7LduV8mpBAemJJanZqakFqEUwfEwen
 VANTUufs24/Z/I3/fgiyT7bglj8t/cOJWyHAbrNEekpBQqpt7U/umlk/j0gcMN5idenO2VVl
 +VpTpZIKT1dkv8p1Mv1x7vMWk9D+0qSIBK0FPZvCz+nd2yHwhSPaVrBta0h3xY6MhMAXjbo6
 d+ZEMYTHeqa1H+zRMc1nrVNnirwuVpSeMGPPSc7IhekO/YnVrxPW3Hm+v0x566YVFw6Xb84I
 UyhVvZbFqCkkXJxhfiGjcLpsRSKL3KH5p1/Pjfk+zdhv/+WoKY6F2iFy/AknHBUe3uivzH3M
 pte48afTf28JA8d14tOTjIITZc/57bKYsMKx9P3X60J/tuzPzDbh8Tv8km3Rfelvm786Z74+
 pMRSnJFoqMVcVJwIAEdJFBy4AwAA
X-CMS-MailID: 20250219140311eucas1p24ef4a7a95abdb527c2bd305f3ed51674
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250219140311eucas1p24ef4a7a95abdb527c2bd305f3ed51674
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20250219140311eucas1p24ef4a7a95abdb527c2bd305f3ed51674
References: <20250219140239.1378758-1-m.wilczynski@samsung.com>
 <CGME20250219140311eucas1p24ef4a7a95abdb527c2bd305f3ed51674@eucas1p2.samsung.com>
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
 drivers/gpu/drm/imagination/pvr_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/imagination/pvr_drv.c b/drivers/gpu/drm/imagination/pvr_drv.c
index 0639502137b4..2776de095439 100644
--- a/drivers/gpu/drm/imagination/pvr_drv.c
+++ b/drivers/gpu/drm/imagination/pvr_drv.c
@@ -1474,6 +1474,7 @@ static void pvr_remove(struct platform_device *plat_dev)
 
 static const struct of_device_id dt_match[] = {
 	{ .compatible = "img,img-axe", .data = NULL },
+	{ .compatible = "img,img-bxm", .data = NULL },
 	{}
 };
 MODULE_DEVICE_TABLE(of, dt_match);
@@ -1498,3 +1499,4 @@ MODULE_DESCRIPTION(PVR_DRIVER_DESC);
 MODULE_LICENSE("Dual MIT/GPL");
 MODULE_IMPORT_NS("DMA_BUF");
 MODULE_FIRMWARE("powervr/rogue_33.15.11.3_v1.fw");
+MODULE_FIRMWARE("powervr/rogue_36.52.104.182_v1.fw");
-- 
2.34.1

