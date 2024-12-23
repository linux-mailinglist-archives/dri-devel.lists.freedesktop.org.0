Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CC549FB177
	for <lists+dri-devel@lfdr.de>; Mon, 23 Dec 2024 17:06:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFA0910E572;
	Mon, 23 Dec 2024 16:05:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="dH6IvgKD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC89510E155
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Dec 2024 12:56:24 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20241223125623euoutp02f372347126b472cde516d1616746be93~Tz6O1KLAa0962009620euoutp02y
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Dec 2024 12:56:23 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20241223125623euoutp02f372347126b472cde516d1616746be93~Tz6O1KLAa0962009620euoutp02y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1734958583;
 bh=p1/ZFiFlSghVE+8pmX2uMr25gmDdGG4t+JE+dFElHyM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dH6IvgKDhe1OtS9DgzRdtTOwCCo6l7ySw7cgVdLFLV+6kD4yGvTmjzqosiH061kmC
 fia+PKM8F5Wnw2bDMZbF55ybRm4ZxPlqEhJIbLa7Qm3550Ekjtedii56ox9WmUcvfo
 aGzMaLod0CPz8FO85ywmVTHPpIyYyFc6IqMz+jJI=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20241223125623eucas1p25e572e9642f80bfade7dd0fe164ac478~Tz6Ogrmid1673916739eucas1p2V;
 Mon, 23 Dec 2024 12:56:23 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id CE.C6.20821.7FD59676; Mon, 23
 Dec 2024 12:56:23 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20241223125622eucas1p18f67a49dd69b93f0e7770e12b95ceb77~Tz6OHU_xb2173221732eucas1p1r;
 Mon, 23 Dec 2024 12:56:22 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20241223125622eusmtrp1f824616c79aff9de864f8a534e5ada82~Tz6OGLQqA2059320593eusmtrp1S;
 Mon, 23 Dec 2024 12:56:22 +0000 (GMT)
X-AuditID: cbfec7f2-b11c470000005155-a3-67695df76685
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id CD.83.19654.6FD59676; Mon, 23
 Dec 2024 12:56:22 +0000 (GMT)
Received: from AMDC4942.home (unknown [106.210.136.40]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20241223125621eusmtip2ab474ef01d07e4fb27dbf0143b8163cb~Tz6MlUx6-2638026380eusmtip2m;
 Mon, 23 Dec 2024 12:56:21 +0000 (GMT)
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
 <m.wilczynski@samsung.com>, Drew Fustini <dfustini@tenstorrent.com>
Subject: [RFC PATCH v2 16/19] riscv: dts: thead: Add mailbox node
Date: Mon, 23 Dec 2024 13:55:50 +0100
Message-Id: <20241223125553.3527812-17-m.wilczynski@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241223125553.3527812-1-m.wilczynski@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA02SfUxTZxTG9957e++lruxSXHyHWxiNujgzkEXMm00XyNTczIThzOJkbtDJ
 TWmAgi0gY27A+Ah0lTEoMAqVigxIpSLIt1QmshZ04ETkY0LFTFZhVORzEzI2ysXN/57znN95
 n3OSl8bFl0kPWq6I5ZQKaaSEFBKNlic33/jzE7lsZ0kTgboGyzDUsKyjULW5F0Olnb0C9GNb
 LLL11WOof2GaRBfGf6HQQ3MKgQaq9BRKtdSQaEJnI9GMxiZAt1tLSDR3uhOgxrk0Epk6RylU
 s1CKobMzDQQqb24FKCOrQoBuXd+PRm1dBJq4rcFRhu4F9E9bM4VWBmoJVPyonUL1U98JkNV0
 BKW1awl/T3Z6KJ1ipyYmCPZa5jzFmhcNBNuiG6VYTcvPgK0zZpHsyEAbyZ7pPsTe+8aKsZfK
 k9g0kwVjv/17Jzt95Q7JZtcbAduXOkgFuQcL94RxkfJ4TunzTqgwPFv7FxHzWJiwUDgoSAZ2
 Wg1caMjsgsbxFEINhLSYqQLQPj2P88U8gN35VuCkxMwcgFdr/Z5OpI11rUOVAC7cKxDwxRSA
 5mw95qRI5k04Vlm61tjIpBMw/acU4CxwJgeDZQNncCflzgTAO9aCNU0wW+Fy93mBU4sYf9j8
 q4Xi8zxh+9WeNcZl1a9WDwGecYPdRQ8Ip8ZXmdSG4rWdINMihHrDBYIf3ge7ei4LeO0OJ631
 64++DG/kadaZaDjWMIvz+hRs0VjX9dtwpHeJVAN6NWA7rGn14e0A+CBLv2ZDxhUOOdz4FVxh
 bmMhztsimJkh5ultMF9z+r/Q3qpGjNcsnLCrsRzgpXvmGN0zx+j+zzUA3Ag2cXGqKBmn8lVw
 J71V0ihVnELmfTw6qg6s/u8bK9bZZqCfnPHuABgNOgCkcclGUYdYLhOLwqSfJ3LK6BBlXCSn
 6gCbaUKySbQ1zJMTMzJpLBfBcTGc8mkXo108krEi3fCOUOC9TZsQOhIkKri54cR4+dCe5fj7
 OWWld+tyYGrh9uQSxe6oLW7PXd/1xwcx7/82/kOp6KvAgC8SRhfJt7KncxP3fhSyHFgV/S5p
 OJo72/NZiO+B/g37qrmkWxWnEhw+lYGXmo69Gpp3McDvNV9z/0hbrDzx6xcX54OLVPbQc8XD
 PUGHLEsXa7RLpvYV48EIL4/K6i/TH/WnA2WFq6O497CWOvnerD3Q5kZr5U2bRXlhRJNfRMlM
 j6PvpcmHB5ryj0h8d+/PN2R5HfO8/3vezMePTXsZ/xyy9pUPmxVP0LXzJz4dtoZ9b7oSHP88
 d7TO/7j8sEd1/g4p7sgMP3c3qVBCqMKlvq/jSpX0X1usyE1OBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrFKsWRmVeSWpSXmKPExsVy+t/xe7rfYjPTDZauVrU4cX0Rk8XW37PY
 LdbsPcdkMf/IOVaLA3tKLO5d2sJkceXrezaLdU8vsFu82NvIYnFtxVx2i+Zj69ksXs66x2bx
 seceq8XlXXPYLD73HmG02Pa5hc1i7ZG77Bbrv85nslj4cSuLxZIduxgt2jqXsVpcPOVqcffe
 CRaLl5d7mC3aZvFb/N+zg93i37WNLBaz3+1nt9jyZiKrxfG14RYt+6ewOMh7vL/Ryu7x5uVL
 Fo/DHV/YPfZ+W8DisXPWXXaPnp1nGD02repk87hzbQ+bx7yTgR73u48zeWxeUu/RsvYYk0f/
 XwOP9/uusnn0bVnF6HGp+Tp7gHCUnk1RfmlJqkJGfnGJrVK0oYWRnqGlhZ6RiaWeobF5rJWR
 qZK+nU1Kak5mWWqRvl2CXkbflB8sBR+4Kr5Ov87awPico4uRk0NCwESi5cEJ5i5GLg4hgaWM
 EpfnHWSESMhIXOt+yQJhC0v8udbFBlH0ilHiwMmDTCAJNgEjiQfL57OC2CICi1kk9u6rBCli
 FpjBJLHn+RWwScICjhJXj09jBrFZBFQlfp9cDdbAK+AgsePWMXaIDfIS+w+eBavhBIqv6boB
 1iskYC/x79QHNoh6QYmTM5+AXcQMVN+8dTbzBEaBWUhSs5CkFjAyrWIUSS0tzk3PLTbSK07M
 LS7NS9dLzs/dxAhMNNuO/dyyg3Hlq496hxiZOBgPMUpwMCuJ8B4SykwX4k1JrKxKLcqPLyrN
 SS0+xGgKdPdEZinR5HxgqssriTc0MzA1NDGzNDC1NDNWEudlu3I+TUggPbEkNTs1tSC1CKaP
 iYNTqoGpSUM1d9H/2XmPnzdsZzpr9cKxX/LKLyfXHbcvOMQv0LoqqiL0735MYav3n5io8A7t
 DZFHK74xpabkPz0z27bm3QoXY63V3xbOfrN/9sN0tVzW5eaZrqbNV/bc1fP4cj2tN72ilOPn
 N243HrV327SWh6hL7/woy+u+7K9Q8IqTf/jMfq1f+fB8IdcJDfsL5ZEC1ZOXpT/kOPBh17uu
 ZfFmfhxf467EnNrTtnJ90+m2s+5nVs8VWbbr+5Oy35/TH3BNSy2MuzalZp/I8Xre/0pWrb/b
 tzz8tPHVn611cy2tp/1gm2p4fs+mo13zLfzufNnI9eBnWcmkLUsO/3wVNe30SUvpvQ9cYyTz
 OkvvHCya3qvEUpyRaKjFXFScCACbfIuSvQMAAA==
X-CMS-MailID: 20241223125622eucas1p18f67a49dd69b93f0e7770e12b95ceb77
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20241223125622eucas1p18f67a49dd69b93f0e7770e12b95ceb77
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20241223125622eucas1p18f67a49dd69b93f0e7770e12b95ceb77
References: <20241223125553.3527812-1-m.wilczynski@samsung.com>
 <CGME20241223125622eucas1p18f67a49dd69b93f0e7770e12b95ceb77@eucas1p1.samsung.com>
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

Add mailbox device tree node. This work is based on the vendor kernel [1].

Link: https://github.com/revyos/thead-kernel.git [1]

Reviewed-by: Drew Fustini <dfustini@tenstorrent.com>
Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 arch/riscv/boot/dts/thead/th1520.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
index d823b6da75df..0993de0cdd44 100644
--- a/arch/riscv/boot/dts/thead/th1520.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520.dtsi
@@ -601,6 +601,22 @@ timer7: timer@ffffc3303c {
 			status = "disabled";
 		};
 
+		mbox_910t: mailbox@ffffc38000 {
+			compatible = "thead,th1520-mbox";
+			reg = <0xff 0xffc38000 0x0 0x6000>,
+			      <0xff 0xffc40000 0x0 0x6000>,
+			      <0xff 0xffc4c000 0x0 0x2000>,
+			      <0xff 0xffc54000 0x0 0x2000>;
+			reg-names = "local", "remote-icu0", "remote-icu1", "remote-icu2";
+			clocks = <&clk CLK_MBOX0>, <&clk CLK_MBOX1>, <&clk CLK_MBOX2>,
+				 <&clk CLK_MBOX3>;
+			clock-names = "clk-local", "clk-remote-icu0", "clk-remote-icu1",
+				      "clk-remote-icu2";
+			interrupt-parent = <&plic>;
+			interrupts = <28 IRQ_TYPE_LEVEL_HIGH>;
+			#mbox-cells = <1>;
+		};
+
 		gpio@fffff41000 {
 			compatible = "snps,dw-apb-gpio";
 			reg = <0xff 0xfff41000 0x0 0x1000>;
-- 
2.34.1

