Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D362C580877
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jul 2022 01:53:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1AA210F5AE;
	Mon, 25 Jul 2022 23:53:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 165CC10F4D4
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jul 2022 23:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1658793178;
 bh=JYmN/df28yY4gLXLIhAX5mM+5FlGHKS7OLg9tWNIxgU=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=OngbSH7Nn5arAHAFtbHHY0vB12ygIVcOECBGGDtNk/OqvUdhXa1aKStJooisrJVA+
 Y/73UX7MPHeLxHDj4WRGRJQoqfEn6lfq75Ww5GRUFSEqNgePqfaUsejzUfBrr/7uVo
 jVyTgfRKZ9RSY8UIbZwya25gi0l3SjJUeJ+pUffY=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([108.233.15.105]) by mail.gmx.net
 (mrgmx005 [212.227.17.184]) with ESMTPSA (Nemesis) id
 1M2f5Z-1oBzXy0jxH-004E6Z; Tue, 26 Jul 2022 01:52:58 +0200
From: Kevin Brace <kevinbrace@gmx.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 08/32] drm/via: Add via_crtc_hw.c
Date: Mon, 25 Jul 2022 16:51:03 -0700
Message-Id: <20220725235127.20433-9-kevinbrace@gmx.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220725235127.20433-1-kevinbrace@gmx.com>
References: <20220725235127.20433-1-kevinbrace@gmx.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:+Ob0kho/3gC0Em+3G8zim0Gwehjzd7sPEruAg9qtdvDrthnF12s
 CP1JdfpUX+vuDtvBSIpkqvcZ4XSuaO/PPBLGeHRkDPRsAjnawJjIHv/AMcsmzBkw5rbo/fs
 5AAMCwpQt3DgJOTr8pj05OVB7FS1XN5UpCQNNT59RNZnMUQxaye18NrsCHcWeK068oruVG0
 kmVdFZu9DCcfAvfdIUlWA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:VIuC+di56pQ=:funAve30AtsvjXRlDxQ4GX
 E3TUvxOg9HXSfUS3QmjuCiizck31I//KZuVyENhwLYUuBdvbD17rJlreFiLZEPufVn5yQFQAS
 e9Mw06frcJBSTLBWOeyhYcYJdRcfvp17V8qtsxTgtoQyB2jefOlaoU1ml+STAliknMNJOPNFt
 PTlDwbfg3YIeBCvUKDcQ0rkKgjuKsF+CvRrCooC3ItVbvRWCE0pJuu+l1mYcDsu3DpBQpRWbT
 DbCdenwJ2hM+kPhU6lMdvqZy/yjzmXLQFD7FMW4Fl9KboLnOTvh4raV6DS34Scpf+y68oWxX7
 QQczN8q16KJ9w7zpswBp9n0jib19QyEcXmsKOE7V5HcZZnj8V5TShqtPldyHYvLisI91YRUoI
 8GIyOHt227ZMHHe5X6p8Rpm4Irl05iU+L8GMFkmPSS5QaDd6/iJ4jkDtPldgBGaDipUA0Gcc3
 MEMtONT6m5ancJBqKnW8C/QfbHdXN39q6HIWAZbHrR/vl/hrqbNOHmClv9dygFFo9OAcbVmBe
 s2MCkOmKkY3nSdTHdSXpe9K8lVXLwIzvTG4XoZNWPCE/vjvn1SLGICRmnDbAcDJQ3c8IVSUPV
 heVdfAIsS6b8nF4gESEj7zQ+7m6KZBko1vL3PcDob5PlW7zfpD2E/voPFMrBPAXae+JrDQqZY
 tmUOw9PZtW9ZYrlIJAvQP5aEFvOKPwvkDKj7JxbU3Sp8m8DrGPgAokXKfOCd8K1eHyq8G4OL9
 eRQzj5kowDH8hb6CZRwZ+D2RA6wkFBPPFjSLdksqW/lJpfPQmR2GtZyowogPDZvdVRum0IBEU
 epF850mGx/PVUS0p2ii7RlnfTWdlzbhO8XDzZTZkBCaeY4f9N+kFbuW04rC1KDw68PSmuYBzH
 u/z2/wqVE3cnyqRNodcyR2I8auHQYvYqd1GV2eJcPFXrjW6GE/VZGZFQCNawReUSby0tcERYW
 AsSaIByjALsZfDVYhcluK0hS16gN++DyhSqKrFuCyAtPmshbRkMrnv6jlgQqBVq1cAl8QXC5h
 +EOFXqyYZ+wm/pVhgKAO0eNXgiuNmxJM4euHQZsYOKP6lr8mjM4H+skVp6cK+P4/vrkAt0Asx
 77E+9Vr7SR/FieQipyljnGr8DgUE2w97q+jC9okcLCP1tonB5vavizbNA==
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

