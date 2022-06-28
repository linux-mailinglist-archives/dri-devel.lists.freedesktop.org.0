Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD8E855F09E
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 23:54:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6887510F539;
	Tue, 28 Jun 2022 21:54:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B27B10E4D5
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 21:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1656453260;
 bh=O5yYZO94aw8iZ1BGipv/5FMHgPIAwWzYXkpT0AopObY=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=N/WI+ROc3Fi5eBufUMLG1zqiGQWwi2jy5UKxeckIErj4uzBrsI0xAYKzRwcuV6IId
 GlesUPnFSDKMH/1fCVSZEG99njmA1BNjjKqzwtggWGRsJzdMGbq7Gt2il1Ve7M7XH/
 8Evutivwzsg5Dugcc//Alprlncm//WQ9kPnYfqMY=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([174.250.0.5]) by mail.gmx.net (mrgmx005
 [212.227.17.184]) with ESMTPSA (Nemesis) id 1M9nxn-1o2inX3WJJ-005tVl; Tue, 28
 Jun 2022 23:54:20 +0200
From: Kevin Brace <kevinbrace@gmx.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 13/32] drm/via: Add via_encoder.c
Date: Tue, 28 Jun 2022 16:52:27 -0500
Message-Id: <20220628215246.19706-14-kevinbrace@gmx.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220628215246.19706-1-kevinbrace@gmx.com>
References: <20220628215246.19706-1-kevinbrace@gmx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:t4DUa/rwPWsXwPipQHw8fcvZ21appNqwxXTiu9tBow4N/p2QlBK
 +1FdHn3dbLNliHowQNqYhkvgeRX53Is1/7M2sHQteaJRCkZ74NUI+VZd1eR0zK69FordVOj
 8b6Ng+wMMgyT5PRha9gaelMa0cwKOBV+416QTEykyYI18ViEZ6QrbA2zCIddaiNEZ4h1TEY
 YdXTG4DJaI2CV/iGcvJQw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:qfDUwEySKXw=:x6W3k9GPkcQDT4iUNAoDo8
 u+3GLmxjzv/baNnwPz9Mca5KZXEwqb1Pzw51hRhXKZ/BthiST4LzRy29BIZxjo67e1phW7f2u
 0cagzc0jwL0UQDfU19Gu/q6WFPVx7YMlxHe3kcdufRgasPLbstNklWaiQ8i47DqR/s3Z34V2E
 89KcGsz2dJWEhlr8CDsjhriD69Z/Jp0LBZn2jjjDdAPUwMV3QJVSgKyCQr/PiQ/GJ1o37alx1
 U9DJ5+FxqwZ8wOg3I0Xaj3veo/ShKTHRJN9xURtkSHwdpq+vlSE436ZccnH0LLrmFU1/BPZ63
 M9rY5Gqcdp4aUrFY6UBAOWKnOIeT1Zsex6T0c4W+HCjbQW9VfTIFRX8Xrg89+BhA9IZWLCg7l
 akgJt9UZMb7DfXxc+lCAM895/VS/2n8D1r4iT3xerGg6p4v4AL6e6URyjHdXg2d+UTntZ97Hf
 jRSN03BWMEqf+jV/fe1raB7nK5m/nyIRRuaz4qqJ1pArf7yqFSBMObg7yt34Ru3Vqx00IV3v8
 n7rKNjZK4h5mVUy7L/pniizTRmgJkI/mm8jtyulen/JbUuXAYkxb9vvItXqirWvmLDKY/Y6YH
 443WGcBL6TJklFQXUsURRn6nDV8YsGSUxGfqwLeORlG4Y3PWQ96cY1k037YpeuZVQ0FdqxhAv
 CAAtOarAE26LTd9V5Jrepa01z5Jr1+77n96TFmPBOet9gnNBdcIcELyZPwFT8/9wMHubJ5gB4
 IPB+wuv/VD7Z1p/9MaAB/g+ubdnCHLt9NrfXLULzp/HP1rvqcs7fO+GYeP88844WTQloYUuq0
 qJYOzDK1NaivjWErO3Ak3KctM0gA30cCp/C5MH1wGxATHAHM7LrYyc2aR8X/xcQ+BWcf04wtJ
 CZgcvYMpJkjx8h2tSTn98SS2WyuboLHC068S8HvaHx3cUSZ157S+O7Bo46Lvx7FE5CSaYm60x
 ZPqQVWmG8ZwrzCgFPu/PF52E5et8ti57jWq9AzsgV7A4qnS+fYWf56Qv4TU5nfVdG8WA5L1XW
 /h6zywr5fA1rTKnmG07c/9iQqqrgOEFPEzQ6vsDBD34J/Z5DyfvrYLPd7DRY5fSeUzDYaJKTc
 3DtDKXLHCUmTpmjBk3ZZjcR0LPG8oQTTL7XoxQ/E1unv+cSmJL2XQPuHA==
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
 drivers/gpu/drm/via/via_encoder.c | 173 ++++++++++++++++++++++++++++++
 1 file changed, 173 insertions(+)
 create mode 100644 drivers/gpu/drm/via/via_encoder.c

diff --git a/drivers/gpu/drm/via/via_encoder.c b/drivers/gpu/drm/via/via_e=
ncoder.c
new file mode 100644
index 000000000000..eae693fc5141
=2D-- /dev/null
+++ b/drivers/gpu/drm/via/via_encoder.c
@@ -0,0 +1,173 @@
+/*
+ * Copyright =C2=A9 2017-2018 Kevin Brace.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining =
a
+ * copy of this software and associated documentation files (the "Softwar=
e"),
+ * to deal in the Software without restriction, including without limitat=
ion
+ * the rights to use, copy, modify, merge, publish, distribute, sublicens=
e,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the n=
ext
+ * paragraph) shall be included in all copies or substantial portions of =
the
+ * Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRES=
S OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILIT=
Y,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHA=
LL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR O=
THER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISIN=
G
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+ * DEALINGS IN THE SOFTWARE.
+ *
+ * Author(s):
+ * Kevin Brace <kevinbrace@bracecomputerlab.com>
+ */
+
+#include <linux/pci.h>
+#include <linux/pci_ids.h>
+
+#include "via_drv.h"
+
+
+void via_transmitter_io_pad_state(struct via_drm_priv *dev_priv,
+						uint32_t di_port,
+						bool io_pad_on)
+{
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	switch(di_port) {
+	case VIA_DI_PORT_DVP0:
+		via_dvp0_set_io_pad_state(VGABASE,
+					io_pad_on ? 0x03 : 0x00);
+		break;
+	case VIA_DI_PORT_DVP1:
+		via_dvp1_set_io_pad_state(VGABASE,
+					io_pad_on ? 0x03 : 0x00);
+		break;
+	case VIA_DI_PORT_FPDPLOW:
+		via_fpdp_low_set_io_pad_state(VGABASE,
+					io_pad_on ? 0x03 : 0x00);
+		break;
+	case VIA_DI_PORT_FPDPHIGH:
+		via_fpdp_high_set_io_pad_state(VGABASE,
+					io_pad_on ? 0x03 : 0x00);
+		break;
+	case (VIA_DI_PORT_FPDPLOW |
+		VIA_DI_PORT_FPDPHIGH):
+		via_fpdp_low_set_io_pad_state(VGABASE,
+					io_pad_on ? 0x03 : 0x00);
+		via_fpdp_high_set_io_pad_state(VGABASE,
+					io_pad_on ? 0x03 : 0x00);
+		break;
+	case VIA_DI_PORT_LVDS1:
+		via_lvds1_set_io_pad_setting(VGABASE,
+					io_pad_on ? 0x03 : 0x00);
+		break;
+	case VIA_DI_PORT_LVDS2:
+		via_lvds2_set_io_pad_setting(VGABASE,
+					io_pad_on ? 0x03 : 0x00);
+		break;
+	case (VIA_DI_PORT_LVDS1 |
+		VIA_DI_PORT_LVDS2):
+		via_lvds1_set_io_pad_setting(VGABASE,
+					io_pad_on ? 0x03 : 0x00);
+		via_lvds2_set_io_pad_setting(VGABASE,
+					io_pad_on ? 0x03 : 0x00);
+		break;
+	default:
+		break;
+	}
+
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+}
+
+void via_transmitter_clock_drive_strength(
+					struct via_drm_priv *dev_priv,
+					u32 di_port, u8 drive_strength)
+{
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	switch(di_port) {
+	case VIA_DI_PORT_DVP0:
+		via_dvp0_set_clock_drive_strength(VGABASE,
+						drive_strength);
+		break;
+	case VIA_DI_PORT_DVP1:
+		via_dvp1_set_clock_drive_strength(VGABASE,
+						drive_strength);
+		break;
+	default:
+		break;
+	}
+
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+}
+
+void via_transmitter_data_drive_strength(
+					struct via_drm_priv *dev_priv,
+					u32 di_port, u8 drive_strength)
+{
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	switch(di_port) {
+	case VIA_DI_PORT_DVP0:
+		via_dvp0_set_data_drive_strength(VGABASE,
+						drive_strength);
+		break;
+	case VIA_DI_PORT_DVP1:
+		via_dvp1_set_data_drive_strength(VGABASE,
+						drive_strength);
+		break;
+	default:
+		break;
+	}
+
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+}
+
+void via_transmitter_display_source(struct via_drm_priv *dev_priv,
+						u32 di_port, int index)
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
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+}
+
=2D-
2.35.1

