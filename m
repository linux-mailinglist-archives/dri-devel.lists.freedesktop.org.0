Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 456CE55F099
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 23:54:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB0B610E2BA;
	Tue, 28 Jun 2022 21:54:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03F1D10E4C6
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 21:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1656453240;
 bh=JYmN/df28yY4gLXLIhAX5mM+5FlGHKS7OLg9tWNIxgU=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=gvDnKhuq+xDkdbLzjGHIR0u2i1bT+zlfgO2S65HJ4qm5hNytgSVYat1i7fakunC9H
 DY/i8r8r/TjCDXrpocA5EKDpUqMJHOBor1YkJ+WMcmJSICvB6o16cKTb9450qGBHfG
 YQSZj7/CoC0ocdBaG0QMroTZ2eMhP2zzxuqDQk7Y=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([174.250.0.5]) by mail.gmx.net (mrgmx005
 [212.227.17.184]) with ESMTPSA (Nemesis) id 1M3DJv-1o4viF3BWv-003gar; Tue, 28
 Jun 2022 23:54:00 +0200
From: Kevin Brace <kevinbrace@gmx.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 08/32] drm/via: Add via_crtc_hw.c
Date: Tue, 28 Jun 2022 16:52:22 -0500
Message-Id: <20220628215246.19706-9-kevinbrace@gmx.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220628215246.19706-1-kevinbrace@gmx.com>
References: <20220628215246.19706-1-kevinbrace@gmx.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:YkN5/m8tagqJ61mM3Bk1flvmFRf9ZduiCCSPn+iJUdraJJ5wbMV
 IgMTV9M7y6jOAYr/D3BKKZhAnUIHU/Ei4KQZCQxTT62d4TkhMNC1SyLO4d/lcsVQraTuCp5
 sDS6CSm4bwVnsiHoEl3dDlfVbSNcqa2P2O4gLLme6viprr/qB+eHsQlTlGYcMp18qhJoIRH
 Wb1/wIijAhWX47JaU1kPg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:nJ3W5BPFtMc=:jm2qUEUktXlnq4LEpDdpaW
 4H5g5G7/ERN0EYjgYoILUngsQ6rNXITe34/AacZFeZIqPIXUjjv5btOazeNQanHNxt7faCXEX
 0Aul2biQiA4ESAKtu9SSX2sWC+lzqtpqEYe9vxcw09RoFLDI3H+mVASUgcFo0CAjUT2cZE3Z9
 yfFIN+Ii/iqhc4zqxGd7TWSKMcgsfKY35ptfbF/iy1ykhlWtQnw4KkLWLwgeYVsNZe0wKO9lz
 NwIyI1pxg046uxmnbyv5/FSb5Bm+obMn4YvMmHY36LaXZidWNZtiM7cTNZu/ChoAPv0IlL957
 VZUvyn9aA5pVQftqnKv8WNrkFei7/flpO0xpXpkVGyjkdjNUj+jdp4h4CK8NenRqkPKGUlSwJ
 zSpSovZtLwxX6r2OLo4R62XpdlWi6KXjMEBWKfG8U32KYhZL/QNLLSBcLKnx5ERevIrlXw36p
 N/DhZPmd9sE3dyb6otB42K7+zFO9laOMwRGyG9FZHFE3Wqi7QEuEwYLK/A3HuZSlwtlGbJXKr
 FeAoGvPlsoQhD/M9y5qM7oT0OM6Gw1/nQKk0hbJZ3h1IkTyrfl+uz2GVmMxFUOWwajJNmO8eQ
 9LDbCWEHrxH2mkTRoHenKZhwgpDfLP7QULiol+ZvZ+MdElKhtHbey04hOl+EgDaToFnNX9UQY
 vlCYIPyVxY2MRdd25O4cE9v2TXcSYodp+aum8x4PFkGHw8w45WSdra90Cf2Q5nG8WQNQJGRR0
 YyhvjPCviGr65BlgdTYe3QHX6Db7qGSAsosnw2ISwMLLKVquDHUbJyo7brHGsxpYnF2BH7MSM
 2H3Sm1yCJBGXjgqXmysl68Dbxm0VCRDzmP0ZBbzn90Uw8y/j87D/OrxlotbV2sJf8V3gOM+Qo
 3bOSafRfsIxdegBM1MKaGg3vC3lRMw7LqpT3AwWN9y/Z1+vDIobEUP1Gcx1DECruiLOUSDf1F
 nTcN8kFW00BFgyHTdicXu7KzKO97xjETUFUwb414upLLz5OU2XHzt+X3zo7ZpWQtvyH6fO9D9
 txliA+cue0Uu+Yd1LQI9oUzOPPTXuXkAHc6TLmKLu2gGzhw0+HC98egAiDuWiMAyy85oVni5Q
 8NnY/TsgdMr95w6p2MwxXRmPpxl+iaW6xgdtG2MZP/IPAvpQxXpqC8bDQ==
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
 drivers/gpu/drm/via/via_crtc_hw.c | 91 +++++++++++++++++++++++++++++++
 1 file changed, 91 insertions(+)
 create mode 100644 drivers/gpu/drm/via/via_crtc_hw.c

diff --git a/drivers/gpu/drm/via/via_crtc_hw.c b/drivers/gpu/drm/via/via_c=
rtc_hw.c
new file mode 100644
index 000000000000..f5446da52c0f
=2D-- /dev/null
+++ b/drivers/gpu/drm/via/via_crtc_hw.c
@@ -0,0 +1,91 @@
+/*
+ * Copyright 2012 James Simmons. All Rights Reserved.
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
+#include <video/vga.h>
+
+#include "via_crtc_hw.h"
+
+/*
+ * load_register_table enables the ability to set entire
+ * tables of registers. For each register defined by the
+ * port and the index for that register is programmed
+ * with a masked value.
+ */
+void
+load_register_tables(void __iomem *regbase, struct vga_registers *regs)
+{
+	u8 cr_index, orig, reg_mask, data;
+	unsigned int i;
+	u16 port;
+
+	for (i =3D 0; i < regs->count; i++) {
+		reg_mask =3D regs->regs[i].start_bit;
+		data =3D regs->regs[i].end_bit;
+		cr_index =3D regs->regs[i].io_addr;
+		port =3D regs->regs[i].ioport;
+
+		vga_w(regbase, port, cr_index);
+		orig =3D (vga_r(regbase, port + 1) & ~reg_mask);
+		vga_w(regbase, port + 1, ((data & reg_mask) | orig));
+	}
+}
+
+/*
+ * Due to the limitation of how much data you can write to a single
+ * register we run into data that can't be written in only one register.
+ * So load_value_to_register was developed to be able to define register
+ * tables that can load different bit ranges of the data to different
+ * registers.
+ */
+void
+load_value_to_registers(void __iomem *regbase, struct vga_registers *regs=
,
+			unsigned int value)
+{
+	unsigned int bit_num =3D 0, shift_next_reg, reg_mask;
+	u8 start_index, end_index, cr_index, orig;
+	unsigned int data, i, j;
+	u16 get_bit, port;
+
+	for (i =3D 0; i < regs->count; i++) {
+		start_index =3D regs->regs[i].start_bit;
+		end_index =3D regs->regs[i].end_bit;
+		cr_index =3D regs->regs[i].io_addr;
+		port =3D regs->regs[i].ioport;
+		reg_mask =3D data =3D 0;
+
+		shift_next_reg =3D bit_num;
+		for (j =3D start_index; j <=3D end_index; j++) {
+			reg_mask =3D reg_mask | (1 << j);
+			get_bit =3D (value & (1 << bit_num));
+			data |=3D ((get_bit >> shift_next_reg) << start_index);
+			bit_num++;
+		}
+
+		vga_w(regbase, port, cr_index);
+		orig =3D (vga_r(regbase, port + 1) & ~reg_mask);
+		vga_w(regbase, port + 1, ((data & reg_mask) | orig));
+	}
+}
=2D-
2.35.1

