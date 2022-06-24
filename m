Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D40C55A29F
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 22:28:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 467C410F26C;
	Fri, 24 Jun 2022 20:28:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A03F10F26C
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 20:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1656102532;
 bh=5B2DG+yoDk7eNL27AETxkQEHSlS9ljT6DPSAkzlfqEA=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=dmwAui4N5C9RPu+pjJ19PTAPoxRoApPdSZCzB6RLhAVVo0SVQ1ZbrCOaWbQuAXWEz
 c4H45r8EASdtACBhXBNWTfJcF92mGdg3oC6/gWJ2v+tDCeAVY6rjv+pDMvlVITR8sx
 XNMpp7zeHKxJOG35Nhh5IYMuJuo5HeahhfGN8lOo=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([174.250.50.5]) by mail.gmx.net
 (mrgmx004 [212.227.17.184]) with ESMTPSA (Nemesis) id
 1N1Obh-1ngasd2LF5-012sdd; Fri, 24 Jun 2022 22:28:52 +0200
From: Kevin Brace <kevinbrace@gmx.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 19/28] drm/via: Add via_pll.c
Date: Fri, 24 Jun 2022 15:26:24 -0500
Message-Id: <20220624202633.3978-20-kevinbrace@gmx.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220624202633.3978-1-kevinbrace@gmx.com>
References: <20220624202633.3978-1-kevinbrace@gmx.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ps5HuaIKPRJ97+vC2OKYXPbnTqJbCuI1yVGsbdbfk+NLPaB3hb9
 cI7N6mCchlmr9fjLcHtnyzIX9bjHDE1ulWTqPFdh0KCOI1fDjApJpoOeEJFodegqJ+YMTRU
 RHHCAlYEC8eaOAjFsb92Ylwp+d3zAm6/13Ls9BkDbbdHul6JEVUOJncdLV9DkqpVE+B+Ceq
 oV7gsvaLG7VrBagp6UqxQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:vNxIPjLRB4E=:IQ9ktHFWP7QqR6Zch1f2EV
 4E4F25UPBz4xfS1Ya8Ykl+IyKqBqutfM+TVoToeuoLS9Y3qC3TrnBzFuakyoiyn6cZenAZFhO
 fveWU0QC+KEwLh6C14HIwP9hYQzTSPewz34D3x2phc0Bkn7sW83Nr7LZUCXNLtvqAFtIrBhzy
 rCWruxwqZJQSOLcu0xkEgUEUoY8rxBrLMlp8H+m/JR8mCqSt+ALln38Nnmydy9khU80dBtNyi
 z09ljf+husAZr/SOJzMAL+vSCXHgE9KSxR7+WK+aRW3UUML8gSMfRjiTO4F6aSVNbukhsc93s
 H9WLmWnK3EIXET6teie0TOyUPbOgU5+Vff7BMTmMe96oyp3HmLunWQs8Zm3ifEaBo1RrKmwN6
 wV3YCjr+Ai/fyX+s01cQbW0ygi1cnp+6T11TKwB8PRThS9bd3hrT57xd5akvPX4rMRwU0EqVk
 X+6Vkc8l6R74WuHcvDYSZ/3JZtxdSMCZ/aFoCHIV8cVP+eWQIDnHUsUwIEjLLxAnmy0Ebfo9V
 3oAalQnlTpTulZsmHeobAEevR963FOhUF58ahru/UI7hBNgwuFhdkDGGdNiyCpBHPskZCPefq
 n2JWwjc2mjAei5ouQmTMdk98RA63/ww87j/+kiKsba01dCEj/S5CI71YmueSFH4i8/dQWPD6o
 PQg50QfsJ4FaOH5lBJtGmIxKVd7Bu9zkskAVuOBJc9NQIsAlZEacYy8JSPkX+sHK18xkol5aE
 +w3cAxNfV2che1LXVxPgPmhpwBaD57ZqSVuxnbuiCXoVe2dlskUWqnkMT6lr+omlqmus1UPu0
 U74lOkmj/eI3xXeZuSSs8TQ4ssf/uwUpD25Pc44UMbDhOWRrPj8umwH5VmS8qPUGjmNGkxAVY
 qrYXqeiQofbBF281RxGx+SWKsTsY4bpiKTqknulaw3LW5A2raOnJuNQcLoMjnDoqA0R4OSpio
 rRFXw1dS0m+bjEXoHkh0Plc9vw/re7jy7oIyKkcTRzB/o29gEGQG+DrjjwcS0SNwnLxBZGsF8
 M0aFwEZkP3kPTzFcNbPNYPQni4yv+jbQB61f+WIpsCgq2DylV18FiQaA5xjQ7IBUTqNiYEU2B
 QYOXOvPBcN9L/tlP/6TsLqbfyr/mCeJUmhshfDaTFf06qZElJJ3ypAyjg==
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
Cc: Kevin Brace <kevinbrace@bracecomputerlab.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Kevin Brace <kevinbrace@bracecomputerlab.com>

Signed-off-by: Kevin Brace <kevinbrace@bracecomputerlab.com>
=2D--
 drivers/gpu/drm/via/via_pll.c | 263 ++++++++++++++++++++++++++++++++++
 1 file changed, 263 insertions(+)
 create mode 100644 drivers/gpu/drm/via/via_pll.c

diff --git a/drivers/gpu/drm/via/via_pll.c b/drivers/gpu/drm/via/via_pll.c
new file mode 100644
index 000000000000..ec61d044504d
=2D-- /dev/null
+++ b/drivers/gpu/drm/via/via_pll.c
@@ -0,0 +1,263 @@
+/*
+ * Copyright 2012 James Simmons. All Rights Reserved.
+ * Copyright 1998-2009 VIA Technologies, Inc. All Rights Reserved.
+ * Copyright 2001-2009 S3 Graphics, Inc. All Rights Reserved.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining =
a
+ * copy of this software and associated documentation files (the "Softwar=
e"),
+ * to deal in the Software without restriction, including without limitat=
ion
+ * the rights to use, copy, modify, merge, publish, distribute, sub licen=
se,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the
+ * next paragraph) shall be included in all copies or substantial portion=
s
+ * of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRES=
S OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILIT=
Y,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHA=
LL
+ * THE AUTHOR(S) OR COPYRIGHT HOLDER(S) BE LIABLE FOR ANY CLAIM, DAMAGES =
OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR =
OTHER
+ * DEALINGS IN THE SOFTWARE.
+ *
+ * Author(s):
+ * James Simmons <jsimmons@infradead.org>
+ */
+
+#include <linux/delay.h>
+#include <linux/pci.h>
+#include <linux/pci_ids.h>
+
+#include "via_drv.h"
+
+
+#define CSR_VCO_UP	600000000
+#define CSR_VCO_DOWN	300000000
+
+#define PLL_DTZ_DEFAULT		(BIT(0) | BIT(1))
+
+#define VIA_CLK_REFERENCE	14318180
+
+struct pll_mrn_value {
+	u32 pll_m;
+	u32 pll_r;
+	u32 pll_n;
+	u32 diff_clk;
+	u32 pll_fout;
+};
+
+/*
+ * This function first gets the best frequency M, R, N value
+ * to program the PLL according to the supplied frequence
+ * passed in. After we get the MRN values the results are
+ * formatted to fit properly into the PLL clock registers.
+ *
+ * PLL registers M, R, N value
+ * [31:16]  DM[7:0]
+ * [15:8 ]  DR[2:0]
+ * [7 :0 ]  DN[6:0]
+ */
+u32 via_get_clk_value(struct drm_device *dev, u32 freq)
+{
+	struct pci_dev *pdev =3D to_pci_dev(dev->dev);
+	u32 best_pll_n =3D 2, best_pll_r =3D 0, best_pll_m =3D 2, best_clk_diff =
=3D freq;
+	u32 pll_fout, pll_fvco, pll_mrn =3D 0;
+	u32 pll_n, pll_r, pll_m, clk_diff;
+	struct pll_mrn_value pll_tmp[5] =3D {
+		{ 0, 0, 0, 0, 0 },
+		{ 0, 0, 0, 0, 0 },
+		{ 0, 0, 0, 0, 0 },
+		{ 0, 0, 0, 0, 0 },
+		{ 0, 0, 0, 0, 0 } };
+	int count;
+
+	if ((pdev->device !=3D PCI_DEVICE_ID_VIA_CLE266) &&
+		(pdev->device !=3D PCI_DEVICE_ID_VIA_KM400)) {
+		/* DN[6:0] */
+		for (pll_n =3D 2; pll_n < 6; pll_n++) {
+			/* DR[2:0] */
+			for (pll_r =3D 0; pll_r < 6; pll_r++) {
+				/* DM[9:0] */
+				for (pll_m =3D 2; pll_m < 512; pll_m++) {
+					/* first divide pll_n then multiply
+					 * pll_m. We have to reduce pll_m
+					 * to 512 to get rid of the overflow */
+					pll_fvco =3D (VIA_CLK_REFERENCE / pll_n) * pll_m;
+					if ((pll_fvco >=3D CSR_VCO_DOWN) && (pll_fvco <=3D CSR_VCO_UP)) {
+						pll_fout =3D pll_fvco >> pll_r;
+						if (pll_fout < freq)
+							clk_diff =3D freq - pll_fout;
+						else
+							clk_diff =3D pll_fout - freq;
+
+						/* if frequency (which is the PLL we want
+						 * to set) > 150MHz, the MRN value we
+						 * write in register must < frequency, and
+						 * get MRN value whose M is the largeset */
+						if (freq >=3D 150000000) {
+							if ((clk_diff <=3D pll_tmp[0].diff_clk) || pll_tmp[0].pll_fout =3D=
=3D 0) {
+								for (count =3D ARRAY_SIZE(pll_tmp) - 1; count >=3D 1; count--)
+									pll_tmp[count] =3D pll_tmp[count - 1];
+
+								pll_tmp[0].pll_m =3D pll_m;
+								pll_tmp[0].pll_r =3D pll_r;
+								pll_tmp[0].pll_n =3D pll_n;
+								pll_tmp[0].diff_clk =3D clk_diff;
+								pll_tmp[0].pll_fout =3D pll_fout;
+							}
+						}
+
+						if (clk_diff < best_clk_diff) {
+							best_clk_diff =3D clk_diff;
+							best_pll_m =3D pll_m;
+							best_pll_n =3D pll_n;
+							best_pll_r =3D pll_r;
+						}
+					} /* if pll_fvco in VCO range */
+				} /* for PLL M */
+			} /* for PLL R */
+		} /* for PLL N */
+
+		/* if frequency(which is the PLL we want to set) > 150MHz,
+		 * the MRN value we write in register must < frequency,
+		 * and get MRN value whose M is the largeset */
+		if (freq > 150000000) {
+			best_pll_m =3D pll_tmp[0].pll_m;
+			best_pll_r =3D pll_tmp[0].pll_r;
+			best_pll_n =3D pll_tmp[0].pll_n;
+		}
+	/* UniChrome IGP (CLE266, KM400(A), KN400, and P4M800 chipsets)
+	 * requires a different formula for calculating the PLL parameters.
+	 * The code was borrowed from OpenChrome DDX device driver UMS
+	 * (User Mode Setting) section, but was modified to not use float type
+	 * variables. */
+	} else {
+		for (pll_r =3D 0; pll_r < 4; ++pll_r) {
+			for (pll_n =3D (pll_r =3D=3D 0) ? 2 : 1; pll_n <=3D 7; ++pll_n) {
+				for (pll_m =3D 1; pll_m <=3D 127; ++pll_m) {
+					pll_fout =3D VIA_CLK_REFERENCE * pll_m;
+					pll_fout /=3D (pll_n << pll_r);
+					if (pll_fout < freq)
+						clk_diff =3D freq - pll_fout;
+					else
+						clk_diff =3D pll_fout - freq;
+
+					if (clk_diff < best_clk_diff) {
+						best_clk_diff =3D clk_diff;
+						best_pll_m =3D pll_m & 0x7F;
+						best_pll_n =3D pll_n & 0x1F;
+						best_pll_r =3D pll_r & 0x03;
+					}
+				}
+			}
+		}
+	}
+
+	switch (pdev->device) {
+	case PCI_DEVICE_ID_VIA_CLE266:
+	case PCI_DEVICE_ID_VIA_KM400:
+		/* Clock Synthesizer Value 0[7:6]: DR[1:0]
+		 * Clock Synthesizer Value 0[5:0]: DN[5:0] */
+		pll_mrn =3D ((best_pll_r & 0x3) << 14 |
+				(best_pll_n & 0x1F) << 8);
+		/* Clock Synthesizer Value 1[6:0]: DM[6:0] */
+		pll_mrn |=3D (best_pll_m & 0x7F);
+		break;
+	case PCI_DEVICE_ID_VIA_VX875:
+	case PCI_DEVICE_ID_VIA_VX900_VGA:
+		/* Clock Synthesizer Value 0 : DM[7:0] */
+		pll_mrn =3D (best_pll_m & 0xFF) << 16;
+		/* Clock Synthesizer Value 1[1:0] : DM[9:8]
+		 * Clock Synthesizer Value 1[4:2] : DR[2:0]
+		 * Clock Synthesizer Value 1[7] : DTZ[0] */
+		pll_mrn |=3D (((PLL_DTZ_DEFAULT & 0x1) << 7) |
+				((best_pll_r & 0x7) << 2) |
+				(((best_pll_m) >> 8) & 0x3)) << 8;
+		/* Clock Synthesizer Value 2[6:0] : DN[6:0]
+		 * Clock Synthesizer Value 2[7] : DTZ[1] */
+		pll_mrn |=3D (((PLL_DTZ_DEFAULT >> 1) & 0x1) << 7) |
+				((best_pll_n) & 0x7F);
+		break;
+	default:
+		/* Clock Synthesizer Value 0 : DM[7:0] */
+		pll_mrn =3D ((best_pll_m - 2) & 0xFF) << 16;
+		/* Clock Synthesizer Value 1[1:0] : DM[9:8]
+		 * Clock Synthesizer Value 1[4:2] : DR[2:0]
+		 * Clock Synthesizer Value 1[7] : DTZ[0] */
+		pll_mrn |=3D (((PLL_DTZ_DEFAULT & 0x1) << 7) |
+				((best_pll_r & 0x7) << 2) |
+				(((best_pll_m - 2) >> 8) & 0x3)) << 8;
+		/* Clock Synthesizer Value 2[6:0] : DN[6:0]
+		 * Clock Synthesizer Value 2[7] : DTZ[1] */
+		pll_mrn |=3D (((PLL_DTZ_DEFAULT >> 1) & 0x1) << 7) |
+				((best_pll_n - 2) & 0x7F);
+		break;
+	}
+	return pll_mrn;
+}
+
+/* Set VCLK */
+void via_set_vclock(struct drm_crtc *crtc, u32 clk)
+{
+	struct via_crtc *iga =3D container_of(crtc, struct via_crtc, base);
+	struct drm_device *dev =3D crtc->dev;
+	struct pci_dev *pdev =3D to_pci_dev(dev->dev);
+	struct via_drm_priv *dev_priv =3D to_via_drm_priv(dev);
+	unsigned long max_loop =3D 50, i =3D 0;
+
+	if (!iga->index) {
+		/* IGA1 HW Reset Enable */
+		svga_wcrt_mask(VGABASE, 0x17, 0x00, BIT(7));
+
+		/* set clk */
+		if ((pdev->device =3D=3D PCI_DEVICE_ID_VIA_CLE266) ||
+			(pdev->device =3D=3D PCI_DEVICE_ID_VIA_KM400)) {
+			vga_wseq(VGABASE, 0x46, (clk & 0xFF00) >> 8);	/* rshift + divisor */
+			vga_wseq(VGABASE, 0x47, (clk & 0x00FF));	/* multiplier */
+		} else {
+			vga_wseq(VGABASE, 0x44, (clk & 0xFF0000) >> 16);
+			vga_wseq(VGABASE, 0x45, (clk & 0x00FF00) >> 8);
+			vga_wseq(VGABASE, 0x46, (clk & 0x0000FF));
+		}
+		/* Fire */
+		svga_wmisc_mask(VGABASE, BIT(3) | BIT(2), BIT(3) | BIT(2));
+
+		/* reset pll */
+		svga_wseq_mask(VGABASE, 0x40, 0x02, 0x02);
+		svga_wseq_mask(VGABASE, 0x40, 0x00, 0x02);
+
+		/* exit hw reset */
+		while ((vga_rseq(VGABASE, 0x3C) & BIT(3)) =3D=3D 0 && i++ < max_loop)
+			udelay(20);
+
+		/* IGA1 HW Reset Disable */
+		svga_wcrt_mask(VGABASE, 0x17, BIT(7), BIT(7));
+	} else {
+		/* IGA2 HW Reset Enable */
+		svga_wcrt_mask(VGABASE, 0x6A, 0x00, BIT(6));
+
+		/* set clk */
+		if ((pdev->device =3D=3D PCI_DEVICE_ID_VIA_CLE266) ||
+			(pdev->device =3D=3D PCI_DEVICE_ID_VIA_KM400)) {
+			vga_wseq(VGABASE, 0x44, (clk & 0xFF00) >> 8);
+			vga_wseq(VGABASE, 0x45, (clk & 0x00FF));
+		} else {
+			vga_wseq(VGABASE, 0x4A, (clk & 0xFF0000) >> 16);
+			vga_wseq(VGABASE, 0x4B, (clk & 0x00FF00) >> 8);
+			vga_wseq(VGABASE, 0x4C, (clk & 0x0000FF));
+		}
+
+		/* reset pll */
+		svga_wseq_mask(VGABASE, 0x40, 0x04, 0x04);
+		svga_wseq_mask(VGABASE, 0x40, 0x00, 0x04);
+
+		/* exit hw reset */
+		while ((vga_rseq(VGABASE, 0x3C) & BIT(2)) =3D=3D 0 && i++ < max_loop)
+			udelay(20);
+
+		/* IGA2 HW Reset Disble, CR6A[6] =3D 1 */
+		svga_wcrt_mask(VGABASE, 0x6A, BIT(6), BIT(6));
+	}
+}
=2D-
2.35.1

