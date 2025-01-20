Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 272E0A17153
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jan 2025 18:21:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0504D10E468;
	Mon, 20 Jan 2025 17:21:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="YM1YPDPL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8721C10E45B
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jan 2025 17:21:39 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20250120172138euoutp014e6250ed88ab4d481ff345b7ba7ce11a~cdl0PRX2t2911329113euoutp01J
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jan 2025 17:21:38 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20250120172138euoutp014e6250ed88ab4d481ff345b7ba7ce11a~cdl0PRX2t2911329113euoutp01J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1737393698;
 bh=DgeFHCAIbeFBF+0nDHhjAGX/VqaqfX2KAeQLuxONDpc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YM1YPDPLsXBTD6TLQRpQ9dF/7fGO4BX7zSv+Mfum6NsK4cQBzNu8tI4f/0NGn5LaJ
 fOCtQiQ/A/yuBSKtmnuKsav5iYYcIucyUF92Jp3u+m2GRQYHRITjK4wcICiaj+BidI
 8SmpG9ogkxNBDBC+RJbZFxm2IlwsTKjuCEOK/7d0=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20250120172137eucas1p2816a41e029cd0736f688b818382cb354~cdlzg-vLo1088710887eucas1p2D;
 Mon, 20 Jan 2025 17:21:37 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id CC.66.20397.1268E876; Mon, 20
 Jan 2025 17:21:37 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20250120172136eucas1p2a8348fbcfdf42efa8c130d558381f599~cdly_ozja3181531815eucas1p2i;
 Mon, 20 Jan 2025 17:21:36 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20250120172136eusmtrp24b6c13d605134fee3e3dcaac7a00a88d~cdly91R020490804908eusmtrp2_;
 Mon, 20 Jan 2025 17:21:36 +0000 (GMT)
X-AuditID: cbfec7f5-ed1d670000004fad-66-678e86212fb4
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id E2.D8.19920.0268E876; Mon, 20
 Jan 2025 17:21:36 +0000 (GMT)
Received: from AMDC4942.home (unknown [106.210.136.40]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20250120172135eusmtip1a3bbf8b8e44cde18b4db74e4cde13572~cdlxq3Mr00819408194eusmtip1s;
 Mon, 20 Jan 2025 17:21:35 +0000 (GMT)
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
Subject: [RFC v3 13/18] drm/imagination: Enable PowerVR driver for RISC-V
Date: Mon, 20 Jan 2025 18:21:06 +0100
Message-Id: <20250120172111.3492708-14-m.wilczynski@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250120172111.3492708-1-m.wilczynski@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01Se0xTZxzdd+/tvZdmhWuV+A2ZhiZCJBFQXPIle0EyyF2yP2Axmpllrspd
 ZfKyFWWoAwZFkOKADQgFpQpBAhSClAqdBeVVwFEmjMc2XtvQ8RyFtqIu1lFu2fzvnN853+/8
 TvLRuPgO6UVHx53l5HHSGAkpJPQ9z8z7fTKvyoJs2W+g3rGbGGr+R02hOqMZQ+VdZgGaGtJh
 6Gf7ConqH/1EoTljGoFGq69RKL2ngUTz6ikSraqmBGjYUEYia24XQHprBom0XZMUarCXY+jG
 ajOBKlsMAGVmVwnQw/4wNDnVS6D5YRWOMtUe6OXdFgo5RhsJVPp3O4V0S/kCZNIeRRnt3xMh
 u9mVcSXFLs3PE2xnlo1ijU80BNuqnqRYVeuPgL1dk02yE6N3SfZ6XyQ7nWPC2KbKFDZD24Ox
 374IYlfaRkj2qq4GsEPpY1SE+JjwnSguJvocJw9873PhqXuGNSzBQCflz77AU8Fl6gpwoyFz
 CNY2TWBXgJAWM9UAquuGSJ7YAKzNaaN4YgWwWFeIbz0xpD0geOEWgN3FjwQ8WQJwZGFa4HSR
 zEE4c6t8U9jBKAmo7E4DToIzfwGony0jna7tzIdQM9C4uZdg9kKN4TnhxCImBOY3WAV83h7Y
 fn9g0+O2MV8fMVK8ZxvsK5nd9OMbnvTmUtwZAJlGIbTYtvp9AC1PJl2LtsMFk84194YvW8sx
 HsfDmeY1V7mLsFVlcuG34YT5+cah9EbAPthgCHRCyIRCR044D93h+PI2/gJ3WKAvxvmxCGZl
 ivkdvrBQlftfprla78pkoaX9GyoP+Khf6aJ+pYv6/1gNwGvATi5RESvjFMFx3PkAhTRWkRgn
 CzgZH3sbbPztBw6TvQVUL6wGdACMBh0A0rhkh8jTopKJRVHSr5I5efxxeWIMp+gAu2hCslN0
 s10pEzMy6VnuNMclcPItFaPdvFIxTe7+3H32CtrviH+tR+ruQ/Xhpm5d9pspniWP798IPP3b
 x5fmzoQ6jL1zpdLlcz5H++nIgcVCvK7Nr1HFRKWEv98Zqb30VonjXtJ6WVHnUAh62hz5w0d2
 zzOVzz6ZDhlfjj7vd9CqtQX/GuKLDH2Wx9e/CC27YxvzTpUY/vzO/V3vlOKngxHaw1WiwfE8
 VdFnypz8a/Xre37xEg0E095WwiOD9hXmKtHKZfuiZ5Youcr/4WFj8qekZtYCl18roGfc+/E/
 mvZGrHnIC76uCTpQpLwIEv3DBlv0i8WloV++bh3WTKljREUVu/ovJA2eiGv8vTBsRgMvDB9L
 WImoOO6F5UkIxSnpAX9crpD+Cxl3GstKBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrGKsWRmVeSWpSXmKPExsVy+t/xu7oKbX3pBtv+G1ucuL6IyWLr71ns
 Fmv2nmOymH/kHKvFvUtbmCyufH3PZrHu6QV2ixd7G1ksrq2Yy27RfGw9m8XLWffYLD723GO1
 uLxrDpvF594jjBbbPrewWaw9cpfdYv3X+UwWCz9uZbFYsmMXo0Vb5zJWi4unXC3u3jvBYvHy
 cg+zRdssfov/e3awW/y7tpHFYva7/ewWW95MZLU4vjbcomX/FBYHOY/3N1rZPd68fMnicbjj
 C7vH3m8LWDx2zrrL7tGz8wyjx6ZVnWwed67tYfOYdzLQ4373cSaPzUvqPVrWHmPy6P9r4PF+
 31U2j74tqxg9LjVfZw8QitKzKcovLUlVyMgvLrFVija0MNIztLTQMzKx1DM0No+1MjJV0rez
 SUnNySxLLdK3S9DLOLDrE1PBLo6KiU/+MjcwtrN3MXJySAiYSOxqPM3SxcjFISSwlFHi7L35
 jBAJGYlr3S9ZIGxhiT/Xutggil4xSsxomMwMkmATMJJ4sHw+K4gtIrCYRWLvvkqQImaBt4wS
 12duBOsWFvCUWHB2I1gDi4CqxIJdv8DivAIOEhPXf2aF2CAvsf/gWbAaTqD496t7wc4TErCX
 uHO1mxGiXlDi5MwnYL3MQPXNW2czT2AUmIUkNQtJagEj0ypGkdTS4tz03GJDveLE3OLSvHS9
 5PzcTYzABLPt2M/NOxjnvfqod4iRiYPxEKMEB7OSCK/oh550Id6UxMqq1KL8+KLSnNTiQ4ym
 QHdPZJYSTc4Hpri8knhDMwNTQxMzSwNTSzNjJXFet8vn04QE0hNLUrNTUwtSi2D6mDg4pRqY
 +G95/v7+M2GN7N4jc0T6JvAt//nVMD0j8Ebnw69OTcx/7u6YyV/nuEXWaMu7iocC3H01y56p
 Hb5WknxpsXhi62qNh7vbjzjUvm554bjj2XuPh75VH4oqbe3eTsuf9HLPz5qHFdHLOHIZ3e+V
 6EqbbFmdEKBq2ct8oOp7sO17zQc9G7/LFi47GuMVLPR8n8tbgweccwSXLq1aXPpp+syLbzk8
 Y5duilrT1ZfrvF5UjWHC+d+LE34yW1cXP90+5a5GwWKuqQZZx249/FKeyu53/OAyl/8LdwTc
 XvPr3ZTd7xq/ClyV73r0/fNr1SDrN+yP9v/Zq37s9PXyoLVOBzgSit/r6C5562Jyu/KxgEzb
 fA0lluKMREMt5qLiRACZNBB7uQMAAA==
X-CMS-MailID: 20250120172136eucas1p2a8348fbcfdf42efa8c130d558381f599
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250120172136eucas1p2a8348fbcfdf42efa8c130d558381f599
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20250120172136eucas1p2a8348fbcfdf42efa8c130d558381f599
References: <20250120172111.3492708-1-m.wilczynski@samsung.com>
 <CGME20250120172136eucas1p2a8348fbcfdf42efa8c130d558381f599@eucas1p2.samsung.com>
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

