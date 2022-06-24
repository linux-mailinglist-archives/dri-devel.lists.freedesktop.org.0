Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26D6155A2BE
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 22:33:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5391310F4AE;
	Fri, 24 Jun 2022 20:33:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C0C210F4A6
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 20:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1656102823;
 bh=8JIx/om8Mb8BZ/R3vYisik36DVhTHvjM1c8sD+W9BTw=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=QIvu5EniUxnlYadfX1F137P4zZwJHxsO2iDStoqxcMjESlffb34HG/UrLocr/rRjs
 iX/yUN2NET+T6SmUaJzz7uTgAa9pEFtDJEZ2kbbg2XyYSQpKUnfVNiXbXKL5EYyhdj
 456fuBwzJSqEkq6M4gH/lT1ipUUHGT5F/tSmpwuM=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([174.250.50.5]) by mail.gmx.net
 (mrgmx004 [212.227.17.184]) with ESMTPSA (Nemesis) id
 1MkHQh-1nPTkQ1oev-00kezz; Fri, 24 Jun 2022 22:28:40 +0200
From: Kevin Brace <kevinbrace@gmx.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 17/28] drm/via: Add via_lvds.c
Date: Fri, 24 Jun 2022 15:26:22 -0500
Message-Id: <20220624202633.3978-18-kevinbrace@gmx.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220624202633.3978-1-kevinbrace@gmx.com>
References: <20220624202633.3978-1-kevinbrace@gmx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:oFYQsyzpS1DSrYWsQH9KqO/LmSSyf1xjCxaGRZ+zAlNGo3cH7NO
 fzbS0HyWPEBZ7TIiwdLwa9HOwjj4ea1cqZ/KSUN9zUHnwBgT0tROk+NPgKx50VkOftp6XCJ
 wXN0GU//LdWuYC9rDT0FVUA2TTTA3cD3wsswWzmNe/vICDlz8jMrYf4jAjW6SCsTtkywt1g
 qAy3bM7w7a4OWEwDdzx2w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:f8MmexuAd7s=:deraBKRQKArmFTOxeARgS+
 2zrLXZ/XzT9bgZrzjlibErBQaFSfBt6xlTFf8Q3Fjt282rql3g0pDquSUBe+D84W/krPQ71Eo
 DJn2phuPzO90B9f2x7v/Y9hk6OtMSnw83VLjf9JEpVJ1ME/SBK4JBC3l4R+oJxZAxA01+NJc9
 o3gSTUyMeR644np2yjHP3r0YwiVD/9H9nYCDLLN1Tce2gtIXg6SDNQrOE539OU4oOkiHx2bIq
 VvI77qc8PP8K487xyAdOR+3YZUq/7rtDrpAq+66WWqDivypGdMy9B2hPoPBzLatSOOTiFw9Wz
 OupQtAkZZ9XcSbyujuS8i/Zi+EqfHnIRvHDfRHtwGxlveeFRIV+sk4cOX1ZOSKYWQmXUpYQo+
 Q6v/dxl3VJ5ajitRAKMhlA8iZVgfOoefUGzWdHmE0mtHFDNepupukvGJwjPjJ/3H5Vda3nPpv
 2baf/wOWt5K5OyYND+AZr0ZD1SYYy+k0Lwr/D/uYWyvhuPiUISynxku5Im2PrLBCo0KHTUY9D
 FaH9AUakAsjnHNP+RC4HfRf0KDEPT9sE+lavz7BTtUlSGH1QiKj1uhTo4YJZOjWgn2zwOW30h
 Y9aLwfif1bcn6ESnmnYw46JqJj7cKjdN4THIf5LLDAdl+O/eiUXlaqO4N0Ua44fPwymsUKkqS
 oUKYL8LA7i3gDHbtDtiwB9fDJRBIOsscJxdzVqCwHb0qenFZaB73MRTUtlWxSoi+UUhkP8BGL
 s9Hkj0rgPrgcDQ64cEln9+ESJBzYPyzPApGLWAbePeMn+eIbNyxFKBHZ2ZNDFIvZSq9/lpQLL
 QUxPI4ks5iwMDSXxyX//VLwmsPWdsQP030RnljMi29z9YgfJLsdYfFweY35B/FBVF1Qh1bkti
 2QNv/bsbHRHkZSKh67vzNVciWINtFBpUjxHctAdYDEmXQW7ho6Di1qkfLivvYcAYf47o+Kuit
 cjVpvWP06+VzuwmENYae3W2Jq7C5tCm+cOa0bL6ePzuMfnyxdcwCMVY5j2EUsn6g/+7koXqn5
 bnOwyzN+R4R2kxJIVoinlUGoBtS6UO9n2AOEqlnszOEoui34xfQL+io3y5VOcN/d/awb0Kbp3
 ehJMqUAW9lIQKVQgCBmvbWOBY1dcIyUPMnD2jpmrWF3HzRwxUNAXhioXw==
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
 drivers/gpu/drm/via/via_lvds.c | 1420 ++++++++++++++++++++++++++++++++
 1 file changed, 1420 insertions(+)
 create mode 100644 drivers/gpu/drm/via/via_lvds.c

diff --git a/drivers/gpu/drm/via/via_lvds.c b/drivers/gpu/drm/via/via_lvds=
.c
new file mode 100644
index 000000000000..44f80cc0d6ef
=2D-- /dev/null
+++ b/drivers/gpu/drm/via/via_lvds.c
@@ -0,0 +1,1420 @@
+/*
+ * Copyright =C2=A9 2016-2018 Kevin Brace.
+ * Copyright 2012 James Simmons. All Rights Reserved.
+ * Copyright 1998-2008 VIA Technologies, Inc. All Rights Reserved.
+ * Copyright 2001-2008 S3 Graphics, Inc. All Rights Reserved.
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
+ * Kevin Brace <kevinbrace@bracecomputerlab.com>
+ * James Simmons <jsimmons@infradead.org>
+ */
+
+#include <linux/delay.h>
+#include <linux/pci.h>
+
+#include <asm/olpc.h>
+
+#include <drm/drm_atomic_state_helper.h>
+#include <drm/drm_probe_helper.h>
+
+#include "via_drv.h"
+
+#define TD0 200
+#define TD1 25
+#define TD2 0
+#define TD3 25
+
+/* Non-I2C bus FP native screen resolution information table.*/
+static via_lvds_info via_lvds_info_table[] =3D {
+	{ 640,  480},
+	{ 800,  600},
+	{1024,  768},
+	{1280,  768},
+	{1280, 1024},
+	{1400, 1050},
+	{1600, 1200},
+	{1280,  800},
+	{ 800,  480},
+	{1024,  768},
+	{1366,  768},
+	{1024,  768},
+	{1280,  768},
+	{1280, 1024},
+	{1400, 1050},
+	{1600, 1200}
+};
+
+/* Power sequence relations */
+struct td_timer {
+	struct vga_regset tdRegs[2];
+};
+
+static struct td_timer td_timer_regs[] =3D {
+	/* td_timer0 */
+	{ { { VGA_CRT_IC, 0x8B, 0, 7 }, { VGA_CRT_IC, 0x8F, 0, 3 } } },
+	/* td_timer1 */
+	{ { { VGA_CRT_IC, 0x8C, 0, 7 }, { VGA_CRT_IC, 0x8F, 4, 7 } } },
+	/* td_timer2 */
+	{ { { VGA_CRT_IC, 0x8D, 0, 7 }, { VGA_CRT_IC, 0x90, 0, 3 } } },
+	/* td_timer3 */
+	{ { { VGA_CRT_IC, 0x8E, 0, 7 }, { VGA_CRT_IC, 0x90, 4, 7 } } }
+};
+
+/*
+ * Function Name:  via_init_td_timing_regs
+ * Description: Init TD timing register (power sequence)
+ */
+static void via_init_td_timing_regs(struct drm_device *dev)
+{
+	struct pci_dev *pdev =3D to_pci_dev(dev->dev);
+	struct via_drm_priv *dev_priv =3D to_via_drm_priv(dev);
+	unsigned int td_timer[4] =3D { 500, 50, 0, 510 }, i;
+	struct vga_registers timings;
+	u32 reg_value;
+
+	/* Fill primary power sequence */
+	for (i =3D 0; i < 4; i++) {
+		/* Calculate TD Timer, every step is 572.1uSec */
+		reg_value =3D td_timer[i] * 10000 / 5721;
+
+		timings.count =3D ARRAY_SIZE(td_timer_regs[i].tdRegs);
+		timings.regs =3D td_timer_regs[i].tdRegs;
+		load_value_to_registers(VGABASE, &timings, reg_value);
+	}
+
+	/* Note: VT3353 have two hardware power sequences
+	 * other chips only have one hardware power sequence */
+	if (pdev->device =3D=3D PCI_DEVICE_ID_VIA_VT1122) {
+		/* set CRD4[0] to "1" to select 2nd LCD power sequence. */
+		svga_wcrt_mask(VGABASE, 0xD4, BIT(0), BIT(0));
+		/* Fill secondary power sequence */
+		for (i =3D 0; i < 4; i++) {
+			/* Calculate TD Timer, every step is 572.1uSec */
+			reg_value =3D td_timer[i] * 10000 / 5721;
+
+			timings.count =3D ARRAY_SIZE(td_timer_regs[i].tdRegs);
+			timings.regs =3D td_timer_regs[i].tdRegs;
+			load_value_to_registers(VGABASE, &timings, reg_value);
+		}
+	}
+}
+
+static bool via_fp_probe_edid(struct i2c_adapter *i2c_bus)
+{
+	u8 out =3D 0x0;
+	u8 buf[8];
+	struct i2c_msg msgs[] =3D {
+		{
+			.addr =3D DDC_ADDR,
+			.flags =3D 0,
+			.len =3D 1,
+			.buf =3D &out,
+		},
+		{
+			.addr =3D DDC_ADDR,
+			.flags =3D I2C_M_RD,
+			.len =3D 8,
+			.buf =3D buf,
+		}
+	};
+	int i2c_ret;
+	bool ret =3D false;
+
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	i2c_ret =3D i2c_transfer(i2c_bus, msgs, 2);
+	if (i2c_ret !=3D 2) {
+		goto exit;
+	}
+
+	if (drm_edid_header_is_valid(buf) < 6) {
+		goto exit;
+	}
+
+	ret =3D true;
+exit:
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+	return ret;
+}
+
+/* caculate the cetering timing using mode and adjusted_mode */
+static void via_centering_timing(const struct drm_display_mode *mode,
+				struct drm_display_mode *adjusted_mode)
+{
+	int panel_hsync_time =3D adjusted_mode->hsync_end -
+		adjusted_mode->hsync_start;
+	int panel_vsync_time =3D adjusted_mode->vsync_end -
+		adjusted_mode->vsync_start;
+	int panel_hblank_start =3D adjusted_mode->hdisplay;
+	int panel_vbank_start =3D adjusted_mode->vdisplay;
+	int hborder =3D (adjusted_mode->hdisplay - mode->hdisplay) / 2;
+	int vborder =3D (adjusted_mode->vdisplay - mode->vdisplay) / 2;
+	int new_hblank_start =3D hborder + mode->hdisplay;
+	int new_vblank_start =3D vborder + mode->vdisplay;
+
+	adjusted_mode->hdisplay =3D mode->hdisplay;
+	adjusted_mode->hsync_start =3D (adjusted_mode->hsync_start -
+		panel_hblank_start) + new_hblank_start;
+	adjusted_mode->hsync_end =3D adjusted_mode->hsync_start +
+		panel_hsync_time;
+	adjusted_mode->vdisplay =3D mode->vdisplay;
+	adjusted_mode->vsync_start =3D (adjusted_mode->vsync_start -
+		panel_vbank_start) + new_vblank_start;
+	adjusted_mode->vsync_end =3D adjusted_mode->vsync_start +
+		panel_vsync_time;
+	/* Adjust Crtc H and V */
+	adjusted_mode->crtc_hdisplay =3D adjusted_mode->hdisplay;
+	adjusted_mode->crtc_hblank_start =3D new_hblank_start;
+	adjusted_mode->crtc_hblank_end =3D adjusted_mode->crtc_htotal - hborder;
+	adjusted_mode->crtc_hsync_start =3D adjusted_mode->hsync_start;
+	adjusted_mode->crtc_hsync_end =3D adjusted_mode->hsync_end;
+	adjusted_mode->crtc_vdisplay =3D adjusted_mode->vdisplay;
+	adjusted_mode->crtc_vblank_start =3D new_vblank_start;
+	adjusted_mode->crtc_vblank_end =3D adjusted_mode->crtc_vtotal - vborder;
+	adjusted_mode->crtc_vsync_start =3D adjusted_mode->vsync_start;
+	adjusted_mode->crtc_vsync_end =3D adjusted_mode->vsync_end;
+}
+
+static void via_lvds_cle266_soft_power_seq(struct via_drm_priv *dev_priv,
+						bool power_state)
+{
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	if (power_state) {
+		/* Wait for 25 ms. */
+		mdelay(25);
+
+		/* Turn on FP VDD rail. */
+		via_lvds_set_primary_soft_vdd(VGABASE, true);
+
+		/* Wait for 510 ms. */
+		mdelay(510);
+
+		/* Turn on FP data transmission. */
+		via_lvds_set_primary_soft_data(VGABASE, true);
+
+		/* Wait for 1 ms. */
+		mdelay(1);
+
+		/* Turn on FP VEE rail. */
+		via_lvds_set_primary_soft_vee(VGABASE, true);
+
+		/* Turn on FP back light. */
+		via_lvds_set_primary_soft_back_light(VGABASE, true);
+	} else {
+		/* Wait for 1 ms. */
+		mdelay(1);
+
+		/* Turn off FP back light. */
+		via_lvds_set_primary_soft_back_light(VGABASE, false);
+
+		/* Turn off FP VEE rail. */
+		via_lvds_set_primary_soft_vee(VGABASE, false);
+
+		/* Wait for 510 ms. */
+		mdelay(510);
+
+		/* Turn off FP data transmission. */
+		via_lvds_set_primary_soft_data(VGABASE, false);
+
+		/* Wait for 25 ms. */
+		mdelay(25);
+
+		/* Turn off FP VDD rail. */
+		via_lvds_set_primary_soft_vdd(VGABASE, false);
+	}
+
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+}
+
+static void via_lvds_primary_soft_power_seq(struct via_drm_priv *dev_priv=
,
+						bool power_state)
+{
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	/* Turn off FP hardware power sequence. */
+	via_lvds_set_primary_hard_power(VGABASE, false);
+
+	/* Use software FP power sequence control. */
+	via_lvds_set_primary_power_seq_type(VGABASE, false);
+
+	if (power_state) {
+		/* Turn on FP display period. */
+		via_lvds_set_primary_direct_display_period(VGABASE, true);
+
+		/* Wait for TD0 ms. */
+		mdelay(TD0);
+
+		/* Turn on FP VDD rail. */
+		via_lvds_set_primary_soft_vdd(VGABASE, true);
+
+		/* Wait for TD1 ms. */
+		mdelay(TD1);
+
+		/* Turn on FP data transmission. */
+		via_lvds_set_primary_soft_data(VGABASE, true);
+
+		/* Wait for TD2 ms. */
+		mdelay(TD2);
+
+		/* Turn on FP VEE rail. */
+		via_lvds_set_primary_soft_vee(VGABASE, true);
+
+		/* Wait for TD3 ms. */
+		mdelay(TD3);
+
+		/* Turn on FP back light. */
+		via_lvds_set_primary_soft_back_light(VGABASE, true);
+	} else {
+		/* Turn off FP back light. */
+		via_lvds_set_primary_soft_back_light(VGABASE, false);
+
+		/* Wait for TD3 ms. */
+		mdelay(TD3);
+
+		/* Turn off FP VEE rail. */
+		via_lvds_set_primary_soft_vee(VGABASE, false);
+
+		/* Wait for TD2 ms. */
+		mdelay(TD2);
+
+		/* Turn off FP data transmission. */
+		via_lvds_set_primary_soft_data(VGABASE, false);
+
+		/* Wait for TD1 ms. */
+		mdelay(TD1);
+
+		/* Turn off FP VDD rail. */
+		via_lvds_set_primary_soft_vdd(VGABASE, false);
+
+		/* Turn off FP display period. */
+		via_lvds_set_primary_direct_display_period(VGABASE, false);
+	}
+
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+}
+
+static void via_lvds_secondary_soft_power_seq(struct via_drm_priv *dev_pr=
iv,
+						bool power_state)
+{
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	/* Turn off FP hardware power sequence. */
+	via_lvds_set_secondary_hard_power(VGABASE, false);
+
+	/* Use software FP power sequence control. */
+	via_lvds_set_secondary_power_seq_type(VGABASE, false);
+
+	if (power_state) {
+		/* Turn on FP display period. */
+		via_lvds_set_secondary_direct_display_period(VGABASE, true);
+
+		/* Wait for TD0 ms. */
+		mdelay(TD0);
+
+		/* Turn on FP VDD rail. */
+		via_lvds_set_secondary_soft_vdd(VGABASE, true);
+
+		/* Wait for TD1 ms. */
+		mdelay(TD1);
+
+		/* Turn on FP data transmission. */
+		via_lvds_set_secondary_soft_data(VGABASE, true);
+
+		/* Wait for TD2 ms. */
+		mdelay(TD2);
+
+		/* Turn on FP VEE rail. */
+		via_lvds_set_secondary_soft_vee(VGABASE, true);
+
+		/* Wait for TD3 ms. */
+		mdelay(TD3);
+
+		/* Turn on FP back light. */
+		via_lvds_set_secondary_soft_back_light(VGABASE, true);
+	} else {
+		/* Turn off FP back light. */
+		via_lvds_set_secondary_soft_back_light(VGABASE, false);
+
+		/* Wait for TD3 ms. */
+		mdelay(TD3);
+
+		/* Turn off FP VEE rail. */
+		via_lvds_set_secondary_soft_vee(VGABASE, false);
+
+		/* Wait for TD2 ms. */
+		mdelay(TD2);
+
+		/* Turn off FP data transmission. */
+		via_lvds_set_secondary_soft_data(VGABASE, false);
+
+		/* Wait for TD1 ms. */
+		mdelay(TD1);
+
+		/* Turn off FP VDD rail. */
+		via_lvds_set_secondary_soft_vdd(VGABASE, false);
+
+		/* Turn off FP display period. */
+		via_lvds_set_secondary_direct_display_period(VGABASE, false);
+	}
+
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+}
+
+static void via_lvds_primary_hard_power_seq(struct via_drm_priv *dev_priv=
,
+						bool power_state)
+{
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	/* Use hardware FP power sequence control. */
+	via_lvds_set_primary_power_seq_type(VGABASE, true);
+
+	if (power_state) {
+		/* Turn on FP display period. */
+		via_lvds_set_primary_direct_display_period(VGABASE, true);
+
+		/* Turn on FP hardware power sequence. */
+		via_lvds_set_primary_hard_power(VGABASE, true);
+
+		/* Turn on FP back light. */
+		via_lvds_set_primary_direct_back_light_ctrl(VGABASE, true);
+	} else {
+		/* Turn off FP back light. */
+		via_lvds_set_primary_direct_back_light_ctrl(VGABASE, false);
+
+		/* Turn off FP hardware power sequence. */
+		via_lvds_set_primary_hard_power(VGABASE, false);
+
+		/* Turn on FP display period. */
+		via_lvds_set_primary_direct_display_period(VGABASE, false);
+	}
+
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+}
+
+static void via_lvds_power(struct via_drm_priv *dev_priv,
+				unsigned short device,
+				u32 di_port, bool power_state)
+{
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	switch (device) {
+	case PCI_DEVICE_ID_VIA_CLE266:
+		via_lvds_cle266_soft_power_seq(dev_priv, power_state);
+		break;
+	case PCI_DEVICE_ID_VIA_KM400:
+	case PCI_DEVICE_ID_VIA_CN700:
+	case PCI_DEVICE_ID_VIA_PM800:
+	case PCI_DEVICE_ID_VIA_K8M800:
+	case PCI_DEVICE_ID_VIA_VT3343:
+	case PCI_DEVICE_ID_VIA_K8M890:
+	case PCI_DEVICE_ID_VIA_P4M900:
+		via_lvds_primary_hard_power_seq(dev_priv, power_state);
+		break;
+	case PCI_DEVICE_ID_VIA_VT3157:
+	case PCI_DEVICE_ID_VIA_VT1122:
+		if (di_port & VIA_DI_PORT_LVDS1) {
+			via_lvds_primary_soft_power_seq(dev_priv, power_state);
+			via_lvds1_set_power(VGABASE, power_state);
+		}
+
+		if (di_port & VIA_DI_PORT_LVDS2) {
+			via_lvds_secondary_soft_power_seq(dev_priv, power_state);
+			via_lvds2_set_power(VGABASE, power_state);
+		}
+
+		break;
+	case PCI_DEVICE_ID_VIA_VX875:
+	case PCI_DEVICE_ID_VIA_VX900_VGA:
+		via_lvds_primary_hard_power_seq(dev_priv, power_state);
+		via_lvds1_set_power(VGABASE, power_state);
+		break;
+	default:
+		DRM_DEBUG_KMS("VIA Technologies Chrome IGP "
+				"FP Power: Unrecognized "
+				"PCI Device ID.\n");
+		break;
+	}
+
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+}
+
+/*
+ * Sets flat panel I/O pad state.
+ */
+static void via_lvds_io_pad_setting(struct via_drm_priv *dev_priv,
+					u32 di_port, bool io_pad_on)
+{
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	switch(di_port) {
+	case VIA_DI_PORT_DVP0:
+		via_dvp0_set_io_pad_state(VGABASE, io_pad_on ? 0x03 : 0x00);
+		break;
+	case VIA_DI_PORT_DVP1:
+		via_dvp1_set_io_pad_state(VGABASE, io_pad_on ? 0x03 : 0x00);
+		break;
+	case VIA_DI_PORT_FPDPLOW:
+		via_fpdp_low_set_io_pad_state(VGABASE, io_pad_on ? 0x03 : 0x00);
+		break;
+	case VIA_DI_PORT_FPDPHIGH:
+		via_fpdp_high_set_io_pad_state(VGABASE, io_pad_on ? 0x03 : 0x00);
+		break;
+	case (VIA_DI_PORT_FPDPLOW |
+		VIA_DI_PORT_FPDPHIGH):
+		via_fpdp_low_set_io_pad_state(VGABASE, io_pad_on ? 0x03 : 0x00);
+		via_fpdp_high_set_io_pad_state(VGABASE, io_pad_on ? 0x03 : 0x00);
+		break;
+	case VIA_DI_PORT_LVDS1:
+		via_lvds1_set_io_pad_setting(VGABASE, io_pad_on ? 0x03 : 0x00);
+		break;
+	case VIA_DI_PORT_LVDS2:
+		via_lvds2_set_io_pad_setting(VGABASE, io_pad_on ? 0x03 : 0x00);
+		break;
+	case (VIA_DI_PORT_LVDS1 |
+		VIA_DI_PORT_LVDS2):
+		via_lvds1_set_io_pad_setting(VGABASE, io_pad_on ? 0x03 : 0x00);
+		via_lvds2_set_io_pad_setting(VGABASE, io_pad_on ? 0x03 : 0x00);
+		break;
+	default:
+		break;
+	}
+
+	DRM_DEBUG_KMS("FP I/O Pad: %s\n", io_pad_on ? "On": "Off");
+
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+}
+
+static void via_lvds_format(struct via_drm_priv *dev_priv,
+				u32 di_port, u8 format)
+{
+	u8 temp =3D format & 0x01;
+
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	switch(di_port) {
+	case VIA_DI_PORT_LVDS1:
+		via_lvds1_set_format(VGABASE, temp);
+		break;
+	case VIA_DI_PORT_LVDS2:
+		via_lvds2_set_format(VGABASE, temp);
+		break;
+	case (VIA_DI_PORT_LVDS1 |
+		VIA_DI_PORT_LVDS2):
+		via_lvds1_set_format(VGABASE, temp);
+		via_lvds2_set_format(VGABASE, temp);
+		break;
+	default:
+		break;
+	}
+
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+}
+
+static void via_lvds_output_format(struct via_drm_priv *dev_priv,
+					u32 di_port, u8 output_format)
+{
+	u8 temp =3D output_format & 0x01;
+
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	switch(di_port) {
+	case VIA_DI_PORT_LVDS1:
+		via_lvds1_set_output_format(VGABASE, temp);
+		break;
+	case VIA_DI_PORT_LVDS2:
+		via_lvds2_set_output_format(VGABASE, temp);
+		break;
+	case (VIA_DI_PORT_LVDS1 |
+		VIA_DI_PORT_LVDS2):
+		via_lvds1_set_output_format(VGABASE, temp);
+		via_lvds2_set_output_format(VGABASE, temp);
+		break;
+	default:
+		break;
+	}
+
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+}
+
+static void via_lvds_dithering(struct via_drm_priv *dev_priv,
+				u32 di_port, bool dithering)
+{
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	switch(di_port) {
+	case VIA_DI_PORT_LVDS1:
+		via_lvds1_set_dithering(VGABASE, dithering);
+		break;
+	case VIA_DI_PORT_LVDS2:
+		via_lvds2_set_dithering(VGABASE, dithering);
+		break;
+	case (VIA_DI_PORT_LVDS1 |
+		VIA_DI_PORT_LVDS2):
+		via_lvds1_set_dithering(VGABASE, dithering);
+		via_lvds2_set_dithering(VGABASE, dithering);
+		break;
+	default:
+		break;
+	}
+
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+}
+
+/*
+ * Sets flat panel display source.
+ */
+static void via_lvds_display_source(struct via_drm_priv *dev_priv,
+					u32 di_port, int index)
+{
+	u8 display_source =3D index & 0x01;
+
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	switch(di_port) {
+	case VIA_DI_PORT_DVP0:
+		via_dvp0_set_display_source(VGABASE, display_source);
+		break;
+	case VIA_DI_PORT_DVP1:
+		via_dvp1_set_display_source(VGABASE, display_source);
+		break;
+	case VIA_DI_PORT_FPDPLOW:
+		via_fpdp_low_set_display_source(VGABASE, display_source);
+		via_dvp1_set_display_source(VGABASE, display_source);
+		break;
+	case VIA_DI_PORT_FPDPHIGH:
+		via_fpdp_high_set_display_source(VGABASE, display_source);
+		via_dvp0_set_display_source(VGABASE, display_source);
+		break;
+	case (VIA_DI_PORT_FPDPLOW |
+		VIA_DI_PORT_FPDPHIGH):
+		via_fpdp_low_set_display_source(VGABASE, display_source);
+		via_fpdp_high_set_display_source(VGABASE, display_source);
+		break;
+	case VIA_DI_PORT_LVDS1:
+		via_lvds1_set_display_source(VGABASE, display_source);
+		break;
+	case VIA_DI_PORT_LVDS2:
+		via_lvds2_set_display_source(VGABASE, display_source);
+		break;
+	case (VIA_DI_PORT_LVDS1 |
+		VIA_DI_PORT_LVDS2):
+		via_lvds1_set_display_source(VGABASE, display_source);
+		via_lvds2_set_display_source(VGABASE, display_source);
+		break;
+	default:
+		break;
+	}
+
+	DRM_DEBUG_KMS("FP Display Source: IGA%d\n",
+			display_source + 1);
+
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+}
+
+static void via_lvds_dpms(struct drm_encoder *encoder, int mode)
+{
+	struct via_encoder *enc =3D container_of(encoder,
+					struct via_encoder, base);
+	struct drm_device *dev =3D encoder->dev;
+	struct pci_dev *pdev =3D to_pci_dev(dev->dev);
+	struct via_drm_priv *dev_priv =3D to_via_drm_priv(dev);
+
+	/* PCI Device ID */
+	u16 chipset =3D pdev->device;
+
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	switch (mode) {
+	case DRM_MODE_DPMS_ON:
+		via_lvds_power(dev_priv, chipset, enc->di_port, true);
+		via_lvds_io_pad_setting(dev_priv, enc->di_port, true);
+		break;
+	case DRM_MODE_DPMS_SUSPEND:
+	case DRM_MODE_DPMS_STANDBY:
+	case DRM_MODE_DPMS_OFF:
+		via_lvds_power(dev_priv, chipset, enc->di_port, false);
+		via_lvds_io_pad_setting(dev_priv, enc->di_port, false);
+		break;
+	default:
+		break;
+	}
+
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+}
+
+static bool via_lvds_mode_fixup(struct drm_encoder *encoder,
+				const struct drm_display_mode *mode,
+				struct drm_display_mode *adjusted_mode)
+{
+	struct drm_property *prop =3D encoder->dev->mode_config.scaling_mode_pro=
perty;
+	struct via_crtc *iga =3D container_of(encoder->crtc, struct via_crtc, ba=
se);
+	struct drm_display_mode *native_mode =3D NULL, *tmp, *t;
+	struct drm_connector *connector =3D NULL, *con;
+	u64 scale_mode =3D DRM_MODE_SCALE_CENTER;
+	struct drm_device *dev =3D encoder->dev;
+
+	list_for_each_entry(con, &dev->mode_config.connector_list, head) {
+		if (encoder =3D=3D con->encoder) {
+			connector =3D con;
+			break;
+		}
+	}
+
+	if (!connector) {
+		DRM_INFO("LVDS encoder is not used by any connector\n");
+		return false;
+	}
+
+	list_for_each_entry_safe(tmp, t, &connector->modes, head) {
+		if (tmp->type & (DRM_MODE_TYPE_PREFERRED | DRM_MODE_TYPE_DRIVER)) {
+			native_mode =3D tmp;
+			break;
+		}
+	}
+
+	if (!native_mode) {
+		DRM_INFO("No native mode for LVDS\n");
+		return false;
+	}
+
+	drm_object_property_get_value(&connector->base, prop, &scale_mode);
+
+	if ((mode->hdisplay !=3D native_mode->hdisplay) ||
+		(mode->vdisplay !=3D native_mode->vdisplay)) {
+		if (scale_mode =3D=3D DRM_MODE_SCALE_NONE)
+			return false;
+		drm_mode_copy(adjusted_mode, native_mode);
+	}
+	drm_mode_set_crtcinfo(adjusted_mode, 0);
+
+	iga->scaling_mode =3D VIA_NO_SCALING;
+	/* Take care of 410 downscaling */
+	if ((mode->hdisplay > native_mode->hdisplay) ||
+		(mode->vdisplay > native_mode->vdisplay)) {
+		iga->scaling_mode =3D VIA_SHRINK;
+	} else {
+		if (!iga->index || scale_mode =3D=3D DRM_MODE_SCALE_CENTER) {
+			/* Do centering according to mode and adjusted_mode */
+			via_centering_timing(mode, adjusted_mode);
+		} else {
+			if (mode->hdisplay < native_mode->hdisplay)
+				iga->scaling_mode |=3D VIA_HOR_EXPAND;
+			if (mode->vdisplay < native_mode->vdisplay)
+				iga->scaling_mode |=3D VIA_VER_EXPAND;
+		}
+	}
+	return true;
+}
+
+static void via_lvds_prepare(struct drm_encoder *encoder)
+{
+	struct via_encoder *enc =3D container_of(encoder,
+					struct via_encoder, base);
+	struct drm_device *dev =3D encoder->dev;
+	struct pci_dev *pdev =3D to_pci_dev(dev->dev);
+	struct via_drm_priv *dev_priv =3D to_via_drm_priv(dev);
+
+	/* PCI Device ID */
+	u16 chipset =3D pdev->device;
+
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	via_lvds_power(dev_priv, chipset, enc->di_port, false);
+	via_lvds_io_pad_setting(dev_priv, enc->di_port, false);
+
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+}
+
+static void via_lvds_commit(struct drm_encoder *encoder)
+{
+	struct via_encoder *enc =3D container_of(encoder,
+					struct via_encoder, base);
+	struct drm_device *dev =3D encoder->dev;
+	struct pci_dev *pdev =3D to_pci_dev(dev->dev);
+	struct via_drm_priv *dev_priv =3D to_via_drm_priv(dev);
+
+	/* PCI Device ID */
+	u16 chipset =3D pdev->device;
+
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	via_lvds_power(dev_priv, chipset, enc->di_port, true);
+	via_lvds_io_pad_setting(dev_priv, enc->di_port, true);
+
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+}
+
+static void
+via_lvds_mode_set(struct drm_encoder *encoder, struct drm_display_mode *m=
ode,
+		struct drm_display_mode *adjusted_mode)
+{
+	struct via_crtc *iga =3D container_of(encoder->crtc, struct via_crtc, ba=
se);
+	struct via_encoder *enc =3D container_of(encoder, struct via_encoder, ba=
se);
+	struct drm_device *dev =3D encoder->dev;
+	struct pci_dev *pdev =3D to_pci_dev(dev->dev);
+	struct via_drm_priv *dev_priv =3D to_via_drm_priv(dev);
+
+	/* PCI Device ID */
+	u16 chipset =3D pdev->device;
+
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	/* Temporary implementation.*/
+	switch (chipset) {
+	case PCI_DEVICE_ID_VIA_P4M900:
+		via_fpdp_low_set_adjustment(VGABASE, 0x08);
+		break;
+	default:
+		break;
+	}
+
+	switch (chipset) {
+	case PCI_DEVICE_ID_VIA_VT3157:
+	case PCI_DEVICE_ID_VIA_VT1122:
+	case PCI_DEVICE_ID_VIA_VX875:
+	case PCI_DEVICE_ID_VIA_VX900_VGA:
+		/* OPENLDI Mode */
+		via_lvds_format(dev_priv, enc->di_port, 0x01);
+
+		/* Sequential Mode */
+		via_lvds_output_format(dev_priv, enc->di_port, 0x01);
+
+		/* Turn on dithering. */
+		via_lvds_dithering(dev_priv, enc->di_port, true);
+		break;
+	default:
+		break;
+	}
+
+	via_lvds_display_source(dev_priv, enc->di_port, iga->index);
+
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+}
+
+static void via_lvds_disable(struct drm_encoder *encoder)
+{
+	struct via_encoder *enc =3D container_of(encoder,
+					struct via_encoder, base);
+	struct drm_device *dev =3D encoder->dev;
+	struct pci_dev *pdev =3D to_pci_dev(dev->dev);
+	struct via_drm_priv *dev_priv =3D to_via_drm_priv(dev);
+
+	/* PCI Device ID */
+	u16 chipset =3D pdev->device;
+
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	via_lvds_power(dev_priv, chipset, enc->di_port, false);
+	via_lvds_io_pad_setting(dev_priv, enc->di_port, false);
+
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+}
+
+const struct drm_encoder_helper_funcs via_lvds_helper_funcs =3D {
+	.dpms =3D via_lvds_dpms,
+	.prepare =3D via_lvds_prepare,
+	.commit =3D via_lvds_commit,
+	.mode_set =3D via_lvds_mode_set,
+	.disable =3D via_lvds_disable,
+};
+
+const struct drm_encoder_funcs via_lvds_enc_funcs =3D {
+	.destroy =3D via_encoder_cleanup,
+};
+
+/* Detect FP presence. */
+static enum drm_connector_status
+via_lvds_detect(struct drm_connector *connector, bool force)
+{
+	struct drm_device *dev =3D connector->dev;
+	struct pci_dev *pdev =3D to_pci_dev(dev->dev);
+	struct via_connector *con =3D container_of(connector,
+					struct via_connector, base);
+	struct via_drm_priv *dev_priv =3D to_via_drm_priv(dev);
+	enum drm_connector_status ret =3D connector_status_disconnected;
+	struct i2c_adapter *i2c_bus;
+	struct edid *edid =3D NULL;
+	u8 mask;
+	uint32_t i, i2c_bus_bit;
+
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	if (machine_is_olpc()) {
+		ret =3D connector_status_connected;
+		goto exit;
+	}
+
+	i2c_bus_bit =3D VIA_I2C_BUS2;
+	for (i =3D 0; i < 2; i++) {
+		if (con->i2c_bus & i2c_bus_bit) {
+			if (i2c_bus_bit & VIA_I2C_BUS2) {
+				i2c_bus =3D via_find_ddc_bus(0x31);
+			} else if (i2c_bus_bit & VIA_I2C_BUS3) {
+				i2c_bus =3D via_find_ddc_bus(0x2c);
+			} else {
+				i2c_bus =3D NULL;
+				i2c_bus_bit =3D i2c_bus_bit << 1;
+				continue;
+			}
+		} else {
+			i2c_bus =3D NULL;
+			i2c_bus_bit =3D i2c_bus_bit << 1;
+			continue;
+		}
+
+		if (!via_fp_probe_edid(i2c_bus)) {
+			i2c_bus_bit =3D i2c_bus_bit << 1;
+			continue;
+		}
+
+		edid =3D drm_get_edid(&con->base, i2c_bus);
+		if (edid) {
+			if (edid->input & DRM_EDID_INPUT_DIGITAL) {
+				ret =3D connector_status_connected;
+				kfree(edid);
+				DRM_DEBUG_KMS("FP detected.\n");
+				DRM_DEBUG_KMS("i2c_bus_bit: %x\n", i2c_bus_bit);
+				goto exit;
+			} else {
+				kfree(edid);
+			}
+		}
+
+		i2c_bus_bit =3D i2c_bus_bit << 1;
+	}
+
+	if (pdev->device =3D=3D PCI_DEVICE_ID_VIA_CLE266) {
+		mask =3D BIT(3);
+	} else {
+		mask =3D BIT(1);
+	}
+
+	if (vga_rcrt(VGABASE, 0x3B) & mask) {
+		ret =3D connector_status_connected;
+	}
+
+exit:
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+	return ret;
+}
+
+static int via_lvds_set_property(struct drm_connector *connector,
+				struct drm_property *property,
+				uint64_t val)
+{
+	struct drm_device *dev =3D connector->dev;
+	uint64_t orig;
+	int ret;
+
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	ret =3D drm_object_property_get_value(&connector->base, property, &orig)=
;
+	if (ret) {
+		DRM_ERROR("FP Property not found!\n");
+		ret =3D -EINVAL;
+		goto exit;
+	}
+
+	if (orig !=3D val) {
+		if (property =3D=3D dev->mode_config.scaling_mode_property) {
+			switch (val) {
+			case DRM_MODE_SCALE_NONE:
+				break;
+			case DRM_MODE_SCALE_CENTER:
+				break;
+			case DRM_MODE_SCALE_ASPECT:
+				break;
+			case DRM_MODE_SCALE_FULLSCREEN:
+				break;
+			default:
+				DRM_ERROR("Invalid FP property!\n");
+				ret =3D -EINVAL;
+				break;
+			}
+		}
+	}
+
+exit:
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+	return ret;
+}
+
+struct drm_connector_funcs via_lvds_connector_funcs =3D {
+	.dpms =3D drm_helper_connector_dpms,
+	.detect =3D via_lvds_detect,
+	.fill_modes =3D drm_helper_probe_single_connector_modes,
+	.destroy =3D via_connector_destroy,
+	.reset =3D drm_atomic_helper_connector_reset,
+	.atomic_duplicate_state =3D
+			drm_atomic_helper_connector_duplicate_state,
+	.atomic_destroy_state =3D
+			drm_atomic_helper_connector_destroy_state,
+};
+
+static int
+via_lvds_get_modes(struct drm_connector *connector)
+{
+	struct via_connector *con =3D container_of(connector, struct via_connect=
or, base);
+	struct drm_device *dev =3D connector->dev;
+	struct via_drm_priv *dev_priv =3D to_via_drm_priv(dev);
+	struct i2c_adapter *i2c_bus;
+	struct edid *edid =3D NULL;
+	struct drm_display_mode *native_mode =3D NULL;
+	u8 reg_value;
+	int hdisplay, vdisplay;
+	int count =3D 0;
+	uint32_t i, i2c_bus_bit;
+
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	/* OLPC is very special */
+	if (machine_is_olpc()) {
+		native_mode =3D drm_mode_create(dev);
+
+		native_mode->clock =3D 56519;
+		native_mode->hdisplay =3D 1200;
+		native_mode->hsync_start =3D 1211;
+		native_mode->hsync_end =3D 1243;
+		native_mode->htotal =3D 1264;
+		native_mode->hskew =3D 0;
+		native_mode->vdisplay =3D 900;
+		native_mode->vsync_start =3D 901;
+		native_mode->vsync_end =3D 911;
+		native_mode->vtotal =3D 912;
+		native_mode->vscan =3D 0;
+
+		native_mode->type =3D DRM_MODE_TYPE_PREFERRED |
+					DRM_MODE_TYPE_DRIVER;
+		drm_mode_set_name(native_mode);
+		drm_mode_probed_add(connector, native_mode);
+		count =3D 1;
+		goto exit;
+	}
+
+	i2c_bus_bit =3D VIA_I2C_BUS2;
+	for (i =3D 0; i < 2; i++) {
+		if (con->i2c_bus & i2c_bus_bit) {
+			if (i2c_bus_bit & VIA_I2C_BUS2) {
+				i2c_bus =3D via_find_ddc_bus(0x31);
+			} else if (i2c_bus_bit & VIA_I2C_BUS3) {
+				i2c_bus =3D via_find_ddc_bus(0x2c);
+			} else {
+				i2c_bus =3D NULL;
+				i2c_bus_bit =3D i2c_bus_bit << 1;
+				continue;
+			}
+		} else {
+			i2c_bus =3D NULL;
+			i2c_bus_bit =3D i2c_bus_bit << 1;
+			continue;
+		}
+
+		edid =3D drm_get_edid(&con->base, i2c_bus);
+		if (edid) {
+			if (edid->input & DRM_EDID_INPUT_DIGITAL) {
+				drm_connector_update_edid_property(connector, edid);
+				count =3D drm_add_edid_modes(connector, edid);
+				kfree(edid);
+				DRM_DEBUG_KMS("FP EDID information was obtained.\n");
+				DRM_DEBUG_KMS("i2c_bus_bit: %x\n", i2c_bus_bit);
+				break;
+			} else {
+				kfree(edid);
+			}
+		}
+
+		i2c_bus_bit =3D i2c_bus_bit << 1;
+	}
+
+	reg_value =3D (vga_rcrt(VGABASE, 0x3f) & 0x0f);
+	hdisplay =3D vdisplay =3D 0;
+	hdisplay =3D via_lvds_info_table[reg_value].x;
+	vdisplay =3D via_lvds_info_table[reg_value].y;
+
+	if (hdisplay && vdisplay) {
+		native_mode =3D drm_cvt_mode(dev, hdisplay, vdisplay,
+					60, false, false, false);
+	}
+
+	if (native_mode) {
+		native_mode->type =3D DRM_MODE_TYPE_PREFERRED |
+						DRM_MODE_TYPE_DRIVER;
+		drm_mode_set_name(native_mode);
+		drm_mode_probed_add(connector, native_mode);
+		count =3D 1;
+	}
+
+exit:
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+	return count;
+}
+
+static int via_lvds_mode_valid(struct drm_connector *connector,
+				struct drm_display_mode *mode)
+{
+	struct drm_property *prop =3D connector->dev->mode_config.scaling_mode_p=
roperty;
+	struct drm_display_mode *native_mode =3D NULL, *tmp, *t;
+	struct drm_device *dev =3D connector->dev;
+	struct pci_dev *pdev =3D to_pci_dev(dev->dev);
+	u64 scale_mode =3D DRM_MODE_SCALE_CENTER;
+
+	list_for_each_entry_safe(tmp, t, &connector->modes, head) {
+		if (tmp->type & (DRM_MODE_TYPE_PREFERRED | DRM_MODE_TYPE_DRIVER)) {
+			native_mode =3D tmp;
+			break;
+		}
+	}
+
+	drm_object_property_get_value(&connector->base, prop, &scale_mode);
+
+	if ((scale_mode =3D=3D DRM_MODE_SCALE_NONE) &&
+		((mode->hdisplay !=3D native_mode->hdisplay) ||
+		(mode->vdisplay !=3D native_mode->vdisplay)))
+		return MODE_PANEL;
+
+	/* Don't support mode larger than physical size */
+	if (pdev->device !=3D PCI_DEVICE_ID_VIA_VX900_VGA) {
+		if (mode->hdisplay > native_mode->hdisplay)
+			return MODE_PANEL;
+		if (mode->vdisplay > native_mode->vdisplay)
+			return MODE_PANEL;
+	} else {
+		/* HW limitation 410 only can
+		 * do <=3D 1.33 scaling */
+		if (mode->hdisplay * 100 > native_mode->hdisplay * 133)
+			return MODE_PANEL;
+		if (mode->vdisplay * 100 > native_mode->vdisplay * 133)
+			return MODE_PANEL;
+
+		/* Now we can not support H V different scale */
+		if ((mode->hdisplay > native_mode->hdisplay) &&
+			(mode->vdisplay < native_mode->vdisplay))
+			return MODE_PANEL;
+
+		if ((mode->hdisplay < native_mode->hdisplay) &&
+			(mode->vdisplay > native_mode->vdisplay))
+			return MODE_PANEL;
+	}
+	return MODE_OK;
+}
+
+struct drm_connector_helper_funcs via_lvds_connector_helper_funcs =3D {
+	.get_modes =3D via_lvds_get_modes,
+};
+
+/*
+ * Probe (pre-initialization detection) FP.
+ */
+void via_lvds_probe(struct drm_device *dev)
+{
+	struct pci_dev *pdev =3D to_pci_dev(dev->dev);
+	struct via_drm_priv *dev_priv =3D to_via_drm_priv(dev);
+	struct drm_connector connector;
+	struct i2c_adapter *i2c_bus;
+	struct edid *edid;
+	u16 chipset =3D pdev->device;
+	u8 sr12, sr13, sr5a;
+	u8 cr3b;
+
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	sr12 =3D vga_rseq(VGABASE, 0x12);
+	sr13 =3D vga_rseq(VGABASE, 0x13);
+	cr3b =3D vga_rcrt(VGABASE, 0x3b);
+
+	DRM_DEBUG_KMS("chipset: 0x%04x\n", chipset);
+	DRM_DEBUG_KMS("sr12: 0x%02x\n", sr12);
+	DRM_DEBUG_KMS("sr13: 0x%02x\n", sr13);
+	DRM_DEBUG_KMS("cr3b: 0x%02x\n", cr3b);
+
+	/* Detect the presence of FPs. */
+	switch (chipset) {
+	case PCI_DEVICE_ID_VIA_CLE266:
+		if ((sr12 & BIT(4)) || (cr3b & BIT(3))) {
+			dev_priv->int_fp1_presence =3D true;
+			dev_priv->int_fp1_di_port =3D VIA_DI_PORT_DIP0;
+		} else {
+			dev_priv->int_fp1_presence =3D false;
+			dev_priv->int_fp1_di_port =3D VIA_DI_PORT_NONE;
+		}
+
+		dev_priv->int_fp2_presence =3D false;
+		dev_priv->int_fp2_di_port =3D VIA_DI_PORT_NONE;
+		break;
+	case PCI_DEVICE_ID_VIA_KM400:
+	case PCI_DEVICE_ID_VIA_CN700:
+	case PCI_DEVICE_ID_VIA_PM800:
+	case PCI_DEVICE_ID_VIA_K8M800:
+		/* 3C5.13[3] - DVP0D8 pin strapping
+		 *             0: AGP pins are used for AGP
+		 *             1: AGP pins are used by FPDP
+		 *             (Flat Panel Display Port) */
+		if ((sr13 & BIT(3)) && (cr3b & BIT(1))) {
+			dev_priv->int_fp1_presence =3D true;
+			dev_priv->int_fp1_di_port =3D VIA_DI_PORT_FPDPHIGH |
+							VIA_DI_PORT_FPDPLOW;
+		} else {
+			dev_priv->int_fp1_presence =3D false;
+			dev_priv->int_fp1_di_port =3D VIA_DI_PORT_NONE;
+		}
+
+		dev_priv->int_fp2_presence =3D false;
+		dev_priv->int_fp2_di_port =3D VIA_DI_PORT_NONE;
+		break;
+	case PCI_DEVICE_ID_VIA_VT3343:
+	case PCI_DEVICE_ID_VIA_K8M890:
+	case PCI_DEVICE_ID_VIA_P4M900:
+		if (cr3b & BIT(1)) {
+			/* 3C5.12[4] - DVP0D4 pin strapping
+			 *             0: 12-bit FPDP (Flat Panel
+			 *                Display Port)
+			 *             1: 24-bit FPDP (Flat Panel
+			 *                Display Port) */
+			if (sr12 & BIT(4)) {
+				dev_priv->int_fp1_presence =3D true;
+				dev_priv->int_fp1_di_port =3D VIA_DI_PORT_FPDPLOW |
+							VIA_DI_PORT_FPDPHIGH;
+			} else {
+				dev_priv->int_fp1_presence =3D true;
+				dev_priv->int_fp1_di_port =3D
+						VIA_DI_PORT_FPDPLOW;
+			}
+		} else {
+			dev_priv->int_fp1_presence =3D false;
+			dev_priv->int_fp1_di_port =3D VIA_DI_PORT_NONE;
+		}
+
+		dev_priv->int_fp2_presence =3D false;
+		dev_priv->int_fp2_di_port =3D VIA_DI_PORT_NONE;
+		break;
+	case PCI_DEVICE_ID_VIA_VT3157:
+	case PCI_DEVICE_ID_VIA_VT1122:
+	case PCI_DEVICE_ID_VIA_VX875:
+	case PCI_DEVICE_ID_VIA_VX900_VGA:
+		/* Save SR5A. */
+		sr5a =3D vga_rseq(VGABASE, 0x5a);
+
+		DRM_DEBUG_KMS("sr5a: 0x%02x\n", sr5a);
+
+		/* Set SR5A[0] to 1.
+		 * This allows the read out of the alternative
+		 * pin strapping settings from SR12 and SR13. */
+		svga_wseq_mask(VGABASE, 0x5a, BIT(0), BIT(0));
+
+		sr13 =3D vga_rseq(VGABASE, 0x13);
+		if (cr3b & BIT(1)) {
+			if (dev_priv->is_via_nanobook) {
+				dev_priv->int_fp1_presence =3D false;
+				dev_priv->int_fp1_di_port =3D VIA_DI_PORT_NONE;
+				dev_priv->int_fp2_presence =3D true;
+				dev_priv->int_fp2_di_port =3D VIA_DI_PORT_LVDS2;
+			} else if (dev_priv->is_quanta_il1) {
+				/* From the Quanta IL1 schematic. */
+				dev_priv->int_fp1_presence =3D true;
+				dev_priv->int_fp1_di_port =3D VIA_DI_PORT_DVP1;
+				dev_priv->int_fp2_presence =3D false;
+				dev_priv->int_fp2_di_port =3D VIA_DI_PORT_NONE;
+
+			} else if (dev_priv->is_samsung_nc20) {
+				dev_priv->int_fp1_presence =3D false;
+				dev_priv->int_fp1_di_port =3D VIA_DI_PORT_NONE;
+				dev_priv->int_fp2_presence =3D true;
+				dev_priv->int_fp2_di_port =3D VIA_DI_PORT_LVDS2;
+
+			/* 3C5.13[7:6] - Integrated LVDS / DVI
+			 *               Mode Select (DVP1D15-14 pin
+			 *               strapping)
+			 *               00: LVDS1 + LVDS2
+			 *               01: DVI + LVDS2
+			 *               10: Dual LVDS Channel
+			 *                   (High Resolution Panel)
+			 *               11: One DVI only (decrease
+			 *                   the clock jitter) */
+			} else if ((!(sr13 & BIT(7))) &&
+					(!(sr13 & BIT(6)))) {
+				dev_priv->int_fp1_presence =3D true;
+				dev_priv->int_fp1_di_port =3D VIA_DI_PORT_LVDS1;
+
+				/*
+				 * For now, don't support the second
+				 * FP.
+				 */
+				dev_priv->int_fp2_presence =3D false;
+				dev_priv->int_fp2_di_port =3D VIA_DI_PORT_NONE;
+			} else if ((!(sr13 & BIT(7))) &&
+					(sr13 & BIT(6))) {
+				dev_priv->int_fp1_presence =3D false;
+				dev_priv->int_fp1_di_port =3D VIA_DI_PORT_NONE;
+				dev_priv->int_fp2_presence =3D true;
+				dev_priv->int_fp2_di_port =3D VIA_DI_PORT_LVDS2;
+			} else if ((sr13 & BIT(7)) &&
+					(!(sr13 & BIT(6)))) {
+				dev_priv->int_fp1_presence =3D true;
+				dev_priv->int_fp1_di_port =3D VIA_DI_PORT_LVDS1 |
+							VIA_DI_PORT_LVDS2;
+				dev_priv->int_fp2_presence =3D false;
+				dev_priv->int_fp2_di_port =3D VIA_DI_PORT_NONE;
+			} else {
+				dev_priv->int_fp1_presence =3D false;
+				dev_priv->int_fp1_di_port =3D VIA_DI_PORT_NONE;
+				dev_priv->int_fp2_presence =3D false;
+				dev_priv->int_fp2_di_port =3D VIA_DI_PORT_NONE;
+			}
+		} else {
+			dev_priv->int_fp1_presence =3D false;
+			dev_priv->int_fp1_di_port =3D VIA_DI_PORT_NONE;
+			dev_priv->int_fp2_presence =3D false;
+			dev_priv->int_fp2_di_port =3D VIA_DI_PORT_NONE;
+		}
+
+		/* Restore SR5A. */
+		vga_wseq(VGABASE, 0x5a, sr5a);
+		break;
+	default:
+		dev_priv->int_fp1_presence =3D false;
+		dev_priv->int_fp1_di_port =3D VIA_DI_PORT_NONE;
+		dev_priv->int_fp2_presence =3D false;
+		dev_priv->int_fp2_di_port =3D VIA_DI_PORT_NONE;
+		break;
+	}
+
+	dev_priv->int_fp1_i2c_bus =3D VIA_I2C_NONE;
+	dev_priv->int_fp2_i2c_bus =3D VIA_I2C_NONE;
+
+	/* Zero clear connector struct.
+	 * Not doing so leads to a crash. */
+	memset(&connector, 0, sizeof(connector));
+
+	/* Register a connector only for I2C bus probing. */
+	drm_connector_init(dev, &connector, &via_lvds_connector_funcs,
+				DRM_MODE_CONNECTOR_LVDS);
+	drm_connector_helper_add(&connector,
+					&via_lvds_connector_helper_funcs);
+	drm_connector_register(&connector);
+
+	if ((dev_priv->int_fp1_presence)
+		&& (!(dev_priv->mapped_i2c_bus & VIA_I2C_BUS2))) {
+		i2c_bus =3D via_find_ddc_bus(0x31);
+		edid =3D drm_get_edid(&connector, i2c_bus);
+		if (edid) {
+			dev_priv->int_fp1_i2c_bus =3D VIA_I2C_BUS2;
+			dev_priv->mapped_i2c_bus |=3D VIA_I2C_BUS2;
+			kfree(edid);
+		}
+	}
+
+	if ((dev_priv->int_fp2_presence)
+		&& (!(dev_priv->mapped_i2c_bus & VIA_I2C_BUS2))) {
+		i2c_bus =3D via_find_ddc_bus(0x31);
+		edid =3D drm_get_edid(&connector, i2c_bus);
+		if (edid) {
+			dev_priv->int_fp2_i2c_bus =3D VIA_I2C_BUS2;
+			dev_priv->mapped_i2c_bus |=3D VIA_I2C_BUS2;
+			kfree(edid);
+		}
+	}
+
+	/* Release the connector resource. */
+	drm_connector_unregister(&connector);
+	drm_connector_cleanup(&connector);
+
+	DRM_DEBUG_KMS("int_fp1_presence: %x\n",
+			dev_priv->int_fp1_presence);
+	DRM_DEBUG_KMS("int_fp1_di_port: 0x%08x\n",
+			dev_priv->int_fp1_di_port);
+	DRM_DEBUG_KMS("int_fp1_i2c_bus: 0x%08x\n",
+			dev_priv->int_fp1_i2c_bus);
+	DRM_DEBUG_KMS("int_fp2_presence: %x\n",
+			dev_priv->int_fp2_presence);
+	DRM_DEBUG_KMS("int_fp2_di_port: 0x%08x\n",
+			dev_priv->int_fp2_di_port);
+	DRM_DEBUG_KMS("int_fp2_i2c_bus: 0x%08x\n",
+			dev_priv->int_fp2_i2c_bus);
+	DRM_DEBUG_KMS("mapped_i2c_bus: 0x%08x\n",
+			dev_priv->mapped_i2c_bus);
+
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+}
+
+void via_lvds_init(struct drm_device *dev)
+{
+	struct via_drm_priv *dev_priv =3D to_via_drm_priv(dev);
+	struct via_connector *con;
+	struct via_encoder *enc;
+
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	if ((!(dev_priv->int_fp1_presence)) &&
+		(!(dev_priv->int_fp2_presence))) {
+		goto exit;
+	}
+
+	enc =3D kzalloc(sizeof(*enc) + sizeof(*con), GFP_KERNEL);
+	if (!enc) {
+		DRM_ERROR("Failed to allocate FP.\n");
+		goto exit;
+	}
+
+	con =3D &enc->cons[0];
+	INIT_LIST_HEAD(&con->props);
+
+	drm_connector_init(dev, &con->base, &via_lvds_connector_funcs,
+				DRM_MODE_CONNECTOR_LVDS);
+	drm_connector_helper_add(&con->base, &via_lvds_connector_helper_funcs);
+	drm_connector_register(&con->base);
+
+	if (dev_priv->int_fp1_presence) {
+		con->i2c_bus =3D dev_priv->int_fp1_i2c_bus;
+	} else if (dev_priv->int_fp2_presence) {
+		con->i2c_bus =3D dev_priv->int_fp2_i2c_bus;
+	} else {
+		con->i2c_bus =3D VIA_I2C_NONE;
+	}
+
+	con->base.doublescan_allowed =3D false;
+	con->base.interlace_allowed =3D false;
+
+	/* Now setup the encoder */
+	drm_encoder_init(dev, &enc->base, &via_lvds_enc_funcs,
+						DRM_MODE_ENCODER_LVDS, NULL);
+	drm_encoder_helper_add(&enc->base, &via_lvds_helper_funcs);
+
+	enc->base.possible_crtcs =3D BIT(1) | BIT(0);
+
+	if (dev_priv->int_fp1_presence) {
+		enc->di_port =3D dev_priv->int_fp1_di_port;
+	} else if (dev_priv->int_fp2_presence) {
+		enc->di_port =3D dev_priv->int_fp2_di_port;
+	} else {
+		enc->di_port =3D VIA_DI_PORT_NONE;
+	}
+
+	/* Put it all together */
+	drm_connector_attach_encoder(&con->base, &enc->base);
+
+	/* Init TD timing register (power sequence) */
+	via_init_td_timing_regs(dev);
+exit:
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+	return;
+}
=2D-
2.35.1

