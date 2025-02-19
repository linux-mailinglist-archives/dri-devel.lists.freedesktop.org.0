Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04C6FA3C11F
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 15:03:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49A7110E815;
	Wed, 19 Feb 2025 14:03:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="c16n98TI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 925D610E7FC
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 14:03:15 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20250219140314euoutp01798cd0c30860529496885ba0bc01484f~loPJ6tHnp1494614946euoutp01U
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 14:03:14 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20250219140314euoutp01798cd0c30860529496885ba0bc01484f~loPJ6tHnp1494614946euoutp01U
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1739973794;
 bh=DgeFHCAIbeFBF+0nDHhjAGX/VqaqfX2KAeQLuxONDpc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=c16n98TIf//XNh8rWVGoarSI6CARsX2UNLfuMwJsap86+gPx7Ycncey7H9J6SRzEs
 HfNvLebLza3Afbw8KBOh7L+lwgzuxm88qoRVAJiQ7BEttnV7vv94PPnS8fNctCQYNj
 BsuEuW/rntvnnfL1PxgRdLyUDckEYpvPqWR4HDc8=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20250219140313eucas1p1077709b710c963a15cea56572384c758~loPJYor3j2960029600eucas1p16;
 Wed, 19 Feb 2025 14:03:13 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id F1.93.20821.1A4E5B76; Wed, 19
 Feb 2025 14:03:13 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20250219140313eucas1p211517932c3cd45ca8c843840ccd42c1e~loPI70rWV1970819708eucas1p2E;
 Wed, 19 Feb 2025 14:03:13 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20250219140313eusmtrp1442006a89f55b5c31e4d6f48469ec6eb~loPIwkrjV2415024150eusmtrp1v;
 Wed, 19 Feb 2025 14:03:13 +0000 (GMT)
X-AuditID: cbfec7f2-b09c370000005155-75-67b5e4a1f4c4
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id B5.96.19920.0A4E5B76; Wed, 19
 Feb 2025 14:03:12 +0000 (GMT)
Received: from AMDC4942.home (unknown [106.210.136.40]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20250219140311eusmtip248fd2213985c852a66a868ac09f9dd7b~loPHgdSUa0094500945eusmtip28;
 Wed, 19 Feb 2025 14:03:11 +0000 (GMT)
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
Subject: [PATCH v5 17/21] drm/imagination: Enable PowerVR driver for RISC-V
Date: Wed, 19 Feb 2025 15:02:35 +0100
Message-Id: <20250219140239.1378758-18-m.wilczynski@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250219140239.1378758-1-m.wilczynski@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01SbUxTZxTee+/tvZdi4VqMvGPLiMQRJaMCg+VFlwXmdHfRHxBnSCSZ1Hkp
 yJe2gG5IkPExlCpDHGaFCrhGa7U0Y6VAB3awQhVYEXTFjM8ZNsGUYfnYJg63loub/57znPOc
 5znJoXGxkQygUzOzOXmmND2IFBKmnif20IapZlmY4a9gdGv4Moaan6oodKPDjqE6q12AxoeM
 GLq3NEeixl/vUGi6o5BADq2aQkU9BhLNqMZJ5FKOC9Bdcy2JFs5aATItFJNIbx2jkGGpDkMN
 rmYCaVrNAJWeviJAg7270Nj4LQLN3FXiqFTli/5pb6XQM8c3BKr53UIho7NSgGz6BFRsuUDE
 vMbO3S+hWOfMDMH+ULZIsR1/1BNsm2qMYpVt/YBt0p0m2VFHO8leuh3PTpTbMPZbTQFbrO/B
 2IqVMHbu5k8ke86oA+xQ0TAVJz4gfPswl56ay8m3vZMkTPnePI8dNdMnKqdW8FPgc+oM8KIh
 EwkvDTzBzgAhLWa0AF6YuiLgi0UAG4cLSb5YAPDepBE8l1ic19YaVwG0TX692hAzTrdEHe3B
 JBMBJ6/Wra7awJQQsKS7EHgKnHkIoGmq1i2naT9mD7xTHuIREMzrsHW5CnhoERMDKy0f8GaB
 0NL5I+6hvdz0zcEADy1i1sPbX00RHoy7R4qaa3DPdsjohfDPwREBr30Pni/XrIX2g49sxrWb
 X4V9VUqCx1lwsnke5/FJ2Ka0reEdcNS+vJoSZ7ZCg3kbT8dC6+LAakrI+MD7s+v5CD7wvOki
 ztMiWFYq5qeD4ZfKs/+Z2rUmjMcs7CpeEnwBNqleOEb1wjGq/33rAa4D/lyOIkPGKcIzueMS
 hTRDkZMpk3ycldEE3I/d98w23wrUj1ySLoDRoAtAGg/aICotMMrEosPSTz7l5FkH5TnpnKIL
 vEITQf6iy5YSmZiRSbO5NI47ysmfdzHaK+AUlt/PRmQnhKlr9tlInaq9uKZa+cb1G8n5R1ra
 Q60FnZvyy7g3mYf96vzGfb9pXC09JqVvpGakczBuMvc74fbu6QqxTTK4Z3eA9/ShlUPRkeFb
 jqS8bP9Q07duh6T2rdyB0ePGlwIPhBnM/qERgV71EkHaOUdkTHxcJkg+NmvqHSs64Y1d+9nk
 yuv+6DNC+NhRuhxRNz+tPnax+kF8lneFbsvmpz3rDAnB786RXL5eH7td+6DXuXFWNDuWp+kN
 8tm1+5eJjJ0jwb5VfyfL0vbv1Ubtj6qe2NttShKl2RNj8yIfK7mGGdn7SaM7N29sisoiD56U
 trQMJaYl0tGUX0iqsySIUKRIw0NwuUL6L0qI9SNHBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrEKsWRmVeSWpSXmKPExsVy+t/xe7oLn2xNN/jubXHi+iImi62/Z7Fb
 rNl7jsli/pFzrBb3Lm1hsrjy9T2bxbqnF9gtXuxtZLG4tmIuu0XzsfVsFi9n3WOz+Nhzj9Xi
 8q45bBafe48wWmz73MJmsfbIXXaL9V/nM1ks/LiVxWLJjl2MFm2dy1gtLp5ytbh77wSLxcvL
 PcwWbbP4Lf7v2cFu8e/aRhaL2e/2s1tseTOR1eL42nCLlv1TWBzkPN7faGX3ePPyJYvH4Y4v
 7B57vy1g8dg56y67R8/OM4wem1Z1snncubaHzWPeyUCP+93HmTw2L6n3aFl7jMmj/6+Bx/t9
 V9k8+rasYvS41HydPUAoSs+mKL+0JFUhI7+4xFYp2tDCSM/Q0kLPyMRSz9DYPNbKyFRJ384m
 JTUnsyy1SN8uQS/jwK5PTAW7OComPvnL3MDYzt7FyMkhIWAisf/NSrYuRi4OIYGljBLrX3Sz
 QiRkJK51v2SBsIUl/lzrgip6xShx59wDsASbgJHEg+XzwRpEBBazSOzdVwlSxCzwllHi+syN
 QEUcHMIC3hIXurVAalgEVCV2/JrMCBLmFXCQmLjfE2K+vMT+g2eZQcKcQOF9F6VAwkIC9hLn
 +u6DTecVEJQ4OfMJ2FZmoPLmrbOZJzAKzEKSmoUktYCRaRWjSGppcW56brGhXnFibnFpXrpe
 cn7uJkZgYtl27OfmHYzzXn3UO8TIxMF4iFGCg1lJhLetfku6EG9KYmVValF+fFFpTmrxIUZT
 oKsnMkuJJucDU1teSbyhmYGpoYmZpYGppZmxkjiv2+XzaUIC6YklqdmpqQWpRTB9TBycUg1M
 R98+eb7aM+3BLX6G5Mfzaxp3+B9fIPT+2cOK0ysufNZJ1mEQveeYwNmfuG5TSeEm7+/PZm7d
 bhaqzub2yuD4/WWsngzXHzyZsaKpR/fBti+zbr4NWao0I+RQaNQHadGcs8XrtA3+s/NbRnMI
 lbbMOxb1721uz+a++63SRSI+2bnsK803HH2byrshofvvjLL8TQ23Ui522ch8VjnVPOHn4/mS
 1/+c+Wpbw39W/nsUdwLvfK3EhJNvc5Kf3PB+sq5IwnmreYeP1o7Xui92Rry8/teB80zC1OCA
 v4bm5h/0t/px/IlT/2/Nee7Bz1DJ9ed9F20M7Jadu0/VgPVU/Cyzc6UttcmcLBeVS/4sMn9w
 WomlOCPRUIu5qDgRALnJxLm1AwAA
X-CMS-MailID: 20250219140313eucas1p211517932c3cd45ca8c843840ccd42c1e
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250219140313eucas1p211517932c3cd45ca8c843840ccd42c1e
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20250219140313eucas1p211517932c3cd45ca8c843840ccd42c1e
References: <20250219140239.1378758-1-m.wilczynski@samsung.com>
 <CGME20250219140313eucas1p211517932c3cd45ca8c843840ccd42c1e@eucas1p2.samsung.com>
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

Several RISC-V boards feature Imagination GPUs that are compatible with
the PowerVR driver. An example is the IMG BXM-4-64 GPU on the Lichee Pi
4A board. This commit adjusts the driver's Kconfig dependencies to allow
the PowerVR driver to be compiled on the RISC-V architecture.

By enabling compilation on RISC-V, we expand support for these GPUs,
providing graphics acceleration capabilities and enhancing hardware
compatibility on RISC-V platforms.

Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 drivers/gpu/drm/imagination/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/imagination/Kconfig b/drivers/gpu/drm/imagination/Kconfig
index 3bfa2ac212dc..5f218896114c 100644
--- a/drivers/gpu/drm/imagination/Kconfig
+++ b/drivers/gpu/drm/imagination/Kconfig
@@ -3,7 +3,7 @@
 
 config DRM_POWERVR
 	tristate "Imagination Technologies PowerVR (Series 6 and later) & IMG Graphics"
-	depends on ARM64
+	depends on (ARM64 || RISCV)
 	depends on DRM
 	depends on PM
 	select DRM_EXEC
-- 
2.34.1

