Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEFBF9FB13F
	for <lists+dri-devel@lfdr.de>; Mon, 23 Dec 2024 17:04:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 730A210E1F1;
	Mon, 23 Dec 2024 16:04:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="Wea6sPp7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F0CB10E155
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Dec 2024 12:56:26 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20241223125625euoutp02ab72fda6086707e7b16dddc4a50de218~Tz6QcEaBG0908409084euoutp02G
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Dec 2024 12:56:25 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20241223125625euoutp02ab72fda6086707e7b16dddc4a50de218~Tz6QcEaBG0908409084euoutp02G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1734958585;
 bh=UkOa5ub55Y+sppguReXcx8kJcahAC3gAcuff/0f+bMQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Wea6sPp7FaO72rR9kfp2l8iLCDoFQo+D4PM6XjD6h47OSCjf4xq5QHvU7L46QVeKh
 ywpGB7KgPWB+Xiq3BgdPg6kFDsnDznTZiiGc/5HGMNTRjVpEW78GoqsC7uH5wkBXpc
 nxBZeqqfYYWvI+ClDTc8gN5ItE/97WR2QPcf/S6g=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20241223125624eucas1p274c9aaae2d44aefce4df4c758431eed4~Tz6QAiMdZ2931129311eucas1p2V;
 Mon, 23 Dec 2024 12:56:24 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id C4.D6.20821.8FD59676; Mon, 23
 Dec 2024 12:56:24 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20241223125624eucas1p217e1756d45cfb39429c7a4543a84d7f2~Tz6PmN8Y80563605636eucas1p2G;
 Mon, 23 Dec 2024 12:56:24 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20241223125624eusmtrp1124a03bf8da2633b53cbea692959bcef~Tz6Pg-og12059320593eusmtrp1X;
 Mon, 23 Dec 2024 12:56:24 +0000 (GMT)
X-AuditID: cbfec7f2-b09c370000005155-ae-67695df8b0f6
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 08.04.19920.8FD59676; Mon, 23
 Dec 2024 12:56:24 +0000 (GMT)
Received: from AMDC4942.home (unknown [106.210.136.40]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20241223125622eusmtip2fbbb647a5c6dde66ff718aa7a1fd23f6~Tz6OE7vgZ3149631496eusmtip2H;
 Mon, 23 Dec 2024 12:56:22 +0000 (GMT)
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
Subject: [RFC PATCH v2 17/19] riscv: dts: thead: Introduce power domain
 nodes with aon firmware
Date: Mon, 23 Dec 2024 13:55:51 +0100
Message-Id: <20241223125553.3527812-18-m.wilczynski@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241223125553.3527812-1-m.wilczynski@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA02Se1BUZRjG5zvn7Dlnt8DDyug3xGXaJGed4uLUzEdaUWN1bDTULMcmrR04
 7iK3nV0JdKxALiIuN5PbggJKgbRAwLIBcYmNq8AmSy5MyuI4oguRtAKFGUssB8v/fs/7Pu/3
 Pu/MR+NiA+lBh0cf41TRskgJKSIMPQ9NLy4eCpcHTJukqG/0EoYaH2kppGszYaikyyRAVrMe
 Q78szJKoZvIahWxtiQSyVF6gUFJPLYmmtFYS2TVWARppKSbRXEYXQIa5ZBJVd41TqHahBENl
 9kYClTe1AJR65hsBGr76Fhq39hFoakSDo1TtOrTc2kQhh6WOQEX3Oyikn8kRoN7qAyi54zwR
 7M3OjqVQ7MzUFMH+lDZPsW1/lhJss3acYjXNg4CtrzpDsjctrSR7sX8vO3G2F2Mbyr9kk6t7
 MDZrKYCdbb9Ospn6KsCak0apPeKPRNvDuMjwzziV/2ufihTdN7IoZb0ovqjHRiWANjodCGnI
 vAQH6yxUOhDRYqYSwInlBJwX8wAW1+hIXsytiByD4PFIck/RWqMCwLMaHeDFDIBXrK2U00Uy
 W+GtihKBs+HOpBAwpTtx1YUz9wA03Clemafp9YwMpuVvdg4QjC8svHYKONmFCYbduaM4v84H
 dnQOrbJwpa5LH1vzuMH+wjuEk/EVT1Jj0WpwyFwRwc6lH0l+eAdcGk5Zy70eTvfqKZ494cBX
 GoLnGHir8cHaspOwWdO7xtvgTdPfqzlxRgprW/ydCJk3YJ8tnkdXOPa7G5/AFZ4z5ON82QWm
 pYr5N56HuZqM/3aaKg0Yzyw0J47i2eBZ7RO3aJ+4Rfv/2lKAV4GNXKw6Ss6pA6O5OD+1LEod
 Gy33C42JqgcrX3vA0fugCVyYtvsZAUYDI4A0LnF3MYrD5WKXMNnxE5wq5hNVbCSnNoJnaEKy
 0cU3zIcTM3LZMS6C45Sc6nEXo4UeCdiBI1tvpGyP+22/zaPGzVGomvCweGe8sHenktzT9749
 e520dH+q8dLBqWD1kd1BxsH7QQGfKySNVo/MhMlmL2UoF75Bcfvl9IK8d/0fFQY8fUKaYC/n
 jPu+9fLVO4YbovQ7KtSbfGotcVl1fzzVfrtAGD/06ndBwo+F0D2k7/DuH67eFRREFmlaL/+T
 nbtYGtKvZrZtiPTURTiW648WHH949y86hys/WLNo+9Vc9nreF/T8wMK5Vw59ELxJEdi86+t7
 32OHA99W6vKHylwjTiqljGfmc3nZpyeXduWyXm+GhiiouIb2zvNWyVHv61vsI66O9+I/3Bcz
 nJ/XNaww234+ffHUznckhFohC9yCq9SyfwEtFZeKSQQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrGKsWRmVeSWpSXmKPExsVy+t/xe7o/YjPTDd7M57A4cX0Rk8XW37PY
 LdbsPcdkMf/IOVaLe5e2MFlc+fqezWLd0wvsFi/2NrJYXFsxl92i+dh6NouXs+6xWXzsucdq
 cXnXHDaLz71HGC22fW5hs1h75C67xfqv85ksFn7cymKxZMcuRou2zmWsFhdPuVrcvXeCxeLl
 5R5mi7ZZ/Bb/9+xgt/h3bSOLxex3+9kttryZyGpxfG24Rcv+KSwOch7vb7Sye7x5+ZLF43DH
 F3aPvd8WsHjsnHWX3aNn5xlGj02rOtk87lzbw+Yx72Sgx/3u40wem5fUe7SsPcbk0f/XwOP9
 vqtsHn1bVjF6XGq+zh4gFKVnU5RfWpKqkJFfXGKrFG1oYaRnaGmhZ2RiqWdobB5rZWSqpG9n
 k5Kak1mWWqRvl6CXcfR2P3vBJq6K2cdesDcw7uXoYuTkkBAwkWg5Nputi5GLQ0hgKaPEhx9n
 GSESMhLXul+yQNjCEn+udUEVvWKUWHNsMStIgk3ASOLB8vlgtojAYhaJvfsqQYqYBd4ySlyf
 uRGsW1ggXmLb4itgU1kEVCVmXmgCs3kFHCSOTr3ODLFBXmL/wbNgNidQfE3XDbAaIQF7iX+n
 PrBB1AtKnJz5BGwmM1B989bZzBMYBWYhSc1CklrAyLSKUSS1tDg3PbfYUK84Mbe4NC9dLzk/
 dxMjMMFsO/Zz8w7Gea8+6h1iZOJgPMQowcGsJMJ7SCgzXYg3JbGyKrUoP76oNCe1+BCjKdDd
 E5mlRJPzgSkuryTe0MzA1NDEzNLA1NLMWEmc1+3y+TQhgfTEktTs1NSC1CKYPiYOTqkGpuRr
 sn07HC76tOwIsecqTTob+UJl+5MNW16bVqctd59veS5MMrSCh7OXaZ9S9sa5ro7e31XV3XLP
 v5RS/FK9SfWX4s6pb5w2ea9k+bOJnan+1BW5KaJcSdEz135XuMPAfFFxqliS1JQDGX7V56Ji
 Xu94V2j4y1vR1MDp55Rm0469Im3FNxk/6bJKOen+0vg3+2HzTFbh+8tMVYRfRZ09+bxp4qqd
 ieZldzInnT1SwbPjaWRot5TYuhmNXL/WsfQlylWttdss0qXbZRTYYbGwlFFcRla/ZqNBWNa7
 E5O8TA33VXZ/NbCUcdp58o7H1AtGh09vuBj/6cx99wTvxuIT3/fHXJCLOFBqrBt84edDJZbi
 jERDLeai4kQA3Yth+7kDAAA=
X-CMS-MailID: 20241223125624eucas1p217e1756d45cfb39429c7a4543a84d7f2
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20241223125624eucas1p217e1756d45cfb39429c7a4543a84d7f2
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20241223125624eucas1p217e1756d45cfb39429c7a4543a84d7f2
References: <20241223125553.3527812-1-m.wilczynski@samsung.com>
 <CGME20241223125624eucas1p217e1756d45cfb39429c7a4543a84d7f2@eucas1p2.samsung.com>
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

The DRM Imagination GPU requires a power-domain driver. In the T-HEAD
TH1520 SoC implements power management capabilities through the E902
core, which can be communicated with through the mailbox, using firmware
protocol.

Add AON node, as a parent for the power-domain controller.

Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 arch/riscv/boot/dts/thead/th1520.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
index 0993de0cdd44..d4090074fd27 100644
--- a/arch/riscv/boot/dts/thead/th1520.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520.dtsi
@@ -6,6 +6,7 @@
 
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/clock/thead,th1520-clk-ap.h>
+#include <dt-bindings/power/thead,th1520-power.h>
 
 / {
 	compatible = "thead,th1520";
@@ -229,6 +230,19 @@ stmmac_axi_config: stmmac-axi-config {
 		snps,blen = <0 0 64 32 0 0 0>;
 	};
 
+	firmware {
+		aon: aon {
+			compatible = "thead,th1520-aon";
+			mboxes = <&mbox_910t 1>;
+			mbox-names = "aon";
+
+			pd: power-domain {
+				compatible = "thead,th1520-pd";
+				#power-domain-cells = <1>;
+			};
+		};
+	};
+
 	soc {
 		compatible = "simple-bus";
 		interrupt-parent = <&plic>;
-- 
2.34.1

