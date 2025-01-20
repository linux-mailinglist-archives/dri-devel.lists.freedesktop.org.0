Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7D67A17151
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jan 2025 18:21:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A99DB10E45B;
	Mon, 20 Jan 2025 17:21:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="ArtyLtcj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7ED210E455
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jan 2025 17:21:44 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20250120172143euoutp01927d7350919ff2b65a887fa4544f67ac~cdl5OR3r72524325243euoutp01Q
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jan 2025 17:21:43 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20250120172143euoutp01927d7350919ff2b65a887fa4544f67ac~cdl5OR3r72524325243euoutp01Q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1737393703;
 bh=B4dK4Atttr0KNpdHrGjC9LuiMIpeHqhsWPufUim1dPk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ArtyLtcjcZZj6g2uSGFqeWVgDxgySfvQMxdYquTz8jttemi4AquhB0VaIkln2QRep
 oMcz72+qhRmO6QyfJ3iTcemmahu7EAl6+Wz8ZL2yJaEIXJRm5m3lAemyNIMQH6/8w3
 afjM80dM9+KqkWPPCGUvJx1g+s6JaaSxpPMaXDPc=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20250120172143eucas1p1e2291992562a703d82a7098b223b4db2~cdl4oBNA_1582415824eucas1p1X;
 Mon, 20 Jan 2025 17:21:43 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 95.8B.20821.6268E876; Mon, 20
 Jan 2025 17:21:42 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20250120172142eucas1p1028244022b09039f4cc9ce1235c5d80c~cdl3_fo_Q2183221832eucas1p1F;
 Mon, 20 Jan 2025 17:21:42 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20250120172142eusmtrp24edd85dc1fb7ffa80da9495079dcc0ba~cdl39wvE40490804908eusmtrp2N;
 Mon, 20 Jan 2025 17:21:42 +0000 (GMT)
X-AuditID: cbfec7f2-b11c470000005155-2c-678e8626854d
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 30.B5.19654.6268E876; Mon, 20
 Jan 2025 17:21:42 +0000 (GMT)
Received: from AMDC4942.home (unknown [106.210.136.40]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20250120172140eusmtip14b96f653172afd92586847c2fc504f27~cdl2mcYoy1070610706eusmtip17;
 Mon, 20 Jan 2025 17:21:40 +0000 (GMT)
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
Subject: [RFC v3 17/18] riscv: dts: thead: Introduce reset controller node
Date: Mon, 20 Jan 2025 18:21:10 +0100
Message-Id: <20250120172111.3492708-18-m.wilczynski@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250120172111.3492708-1-m.wilczynski@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA02Se0xTZxjG851zes4pS+FQdHyyAgMiRjOKEDM+M+PcNWfOP+bYBZBEmnks
 Rm5p6S7MZUKBWNaq4DpZBYtIBikiU6EDBpYhN4FVVy4iQiVbHZcUOiiIOIejHtz87/c97/Pm
 ed7ko3HxFTKAPpSWySnSZCmhpBdh7ly+ERGef1y+dVqNUPetcgzV/22g0IUWK4aM7VYBstvq
 MDSw6CLRxXs3KTTZkk2goapSCqk7a0k0ZbCTaE5rF6D+phISuXXtAJnduSSqaR+jUO2iEUPn
 5uoJVNHQBFC+5gcB+q3nLTRm7ybQVL8WR/kGH/S4uYFCK0OXCHRm1kKhOmehAHXVfIxyLd8S
 u4JY13AexTqnpgj22rEFim25X0awjYYxitU29gH2sklDsqNDzSR79vpe9u43XRh7peJrNrem
 E2NP/LOVdV0dJNnjdSbA2tS3qPfECV47DnAphz7lFJE7k7ySK5Y1WIad/PxUwwh+FHQICoCQ
 hsw2aB00Eh4WM1UAFtdl8rwA4IhpZwHwWmU3gDOFavB0odXtxvhBJYADRgvgN5wAVg/He5hk
 ouF4pVHgMa1j8giY15ENPA+cmQDQ7CghPS4/ZjesPm/FPUwwG6F6oIkqADQtYnbBnm6STwuG
 ll9+fWIRrspLgy2Uh0WML7z+veNJbXzVo64/g/P+S17QVP0Vz29Cm3VuTfeD0111FM8S+LjR
 iPGcDsfr59c8R2CjtmuNX4Gj1oekpw7ObIa1TZG8/Brsu2bDPDJkvOHwjC/fwBsWmU/jvCyC
 x/LFvDsc6rW6/0KtVea1UBZe/ENHngQhhmduMTxzi+H/3DKAm4A/p1KmyjllVBr3mVQpS1Wq
 0uTST9JTL4PVf9270jXfAEqn56RtAKNBG4A0HrpOtP4vrVwsOiD7IotTpO9XqFI4ZRt4gSZC
 /UXlljy5mJHLMrnDHJfBKZ5OMVoYcBSLqt5UplF577uxMS6rszdE1zPfLjwf82Wc88IHP65k
 OSRBUaOPgu7WbBD7Sn/aY4p4TqJ/lLhUODsmCRH6SW/bPgwwnZjdvr+i4/fbk4sJCd4xCQMT
 d2zv9E0Wh8UHCsn3CTgs0fua/Nz3R83yIqN0r88bjYbT/hKf0o7k6N6DJ4dUk66wj8IsY/hM
 TvlK+KY41duR4a7EhYxExcTLBxfTN9tjZ4ujHdsbgn/OjDfrYx+2Hi7CkpPOopy8wG1te9Lp
 lP6RiO80d5JyIl7c8uDcn0uVuuXxwvx4v9HXd2jePdWftT649dVAuvnmkZIHG2Id+EvZJc59
 s7YY/fMjinv47qutoYQyWRa1BVcoZf8CuKz5X0YEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrKKsWRmVeSWpSXmKPExsVy+t/xu7pqbX3pBp/OclmcuL6IyWLr71ns
 Fmv2nmOymH/kHKvFvUtbmCyufH3PZrHu6QV2ixd7G1ksrq2Yy27RfGw9m8XLWffYLD723GO1
 uLxrDpvF594jjBbbPrewWaw9cpfdYv3X+UwWCz9uZbFYsmMXo0Vb5zJWi4unXC3u3jvBYvHy
 cg+zRdssfov/e3awW/y7tpHFYva7/ewWW95MZLU4vjbcomX/FBYHOY/3N1rZPd68fMnicbjj
 C7vH3m8LWDx2zrrL7tGz8wyjx6ZVnWwed67tYfOYdzLQ4373cSaPzUvqPVrWHmPy6P9r4PF+
 31U2j74tqxg9LjVfZw8QitKzKcovLUlVyMgvLrFVija0MNIztLTQMzKx1DM0No+1MjJV0rez
 SUnNySxLLdK3S9DLWPKzk6ngHlvF5B23mBsYj7J2MXJySAiYSBz4/Jmpi5GLQ0hgKaNE/58L
 jBAJGYlr3S9ZIGxhiT/Xutggil4xSjR+O8YOkmATMJJ4sHw+2CQRgcUsEnv3VYIUMQu8ZZS4
 PnMjWLewgJfE6sXnmEFsFgFVieYru4CaOTh4BRwkTp1gg1ggL7H/4FmwEk6g8Pere8HmCwnY
 S9y52g12EK+AoMTJmU/ARjID1Tdvnc08gVFgFpLULCSpBYxMqxhFUkuLc9Nzi430ihNzi0vz
 0vWS83M3MQLTy7ZjP7fsYFz56qPeIUYmDsZDjBIczEoivKIfetKFeFMSK6tSi/Lji0pzUosP
 MZoCnT2RWUo0OR+Y4PJK4g3NDEwNTcwsDUwtzYyVxHnZrpxPExJITyxJzU5NLUgtgulj4uCU
 amBid7+27YLi2jrBXfkuH0RNJizv/RobsjqiPP9i934GhY78lcHL7d90Pn9r0hs03ac1w7ON
 L407WkhunbquiOCrx8+NCqcx3NR+Kd2y5ckt0WWBOzaXmNut/OJp81zwwMREb9+d6mZtTUv1
 fmivc9qxg/PeitIXuy22XTq4ddO1U9NULocstD7/0enZwl9OBq+CPjX98XM4JrDFdaqDtEDq
 hPWpXGf/crosmcL16KD/tcpVm/36lbjOpn64bfz/3jPrjqkSUu4yN19/q56zY/qE5odujHxW
 b3y4ypr/nph5VWTRlffLejtu7qsStu/Z19qxdvI/xWV5AgJiQlf3yk3V2ytdnJN64dave67X
 ToUbKrEUZyQaajEXFScCAIIYsuS4AwAA
X-CMS-MailID: 20250120172142eucas1p1028244022b09039f4cc9ce1235c5d80c
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250120172142eucas1p1028244022b09039f4cc9ce1235c5d80c
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20250120172142eucas1p1028244022b09039f4cc9ce1235c5d80c
References: <20250120172111.3492708-1-m.wilczynski@samsung.com>
 <CGME20250120172142eucas1p1028244022b09039f4cc9ce1235c5d80c@eucas1p1.samsung.com>
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

T-HEAD TH1520 SoC requires to put the GPU out of the reset state as part
of the power-up sequence.

Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 arch/riscv/boot/dts/thead/th1520.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
index d6af27cbb786..f2c6937341a5 100644
--- a/arch/riscv/boot/dts/thead/th1520.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520.dtsi
@@ -497,6 +497,12 @@ clk: clock-controller@ffef010000 {
 			#clock-cells = <1>;
 		};
 
+		rst: reset-controller@ffef528000 {
+			compatible = "thead,th1520-reset";
+			reg = <0xff 0xef528000 0x0 0x4f>;
+			#reset-cells = <0>;
+		};
+
 		clk_vo: clock-controller@ffef528050 {
 			compatible = "thead,th1520-clk-vo";
 			reg = <0xff 0xef528050 0x0 0xfb0>;
-- 
2.34.1

