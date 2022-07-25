Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E020B58087F
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jul 2022 01:53:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A52E310F6C5;
	Mon, 25 Jul 2022 23:53:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18A4F10F5F9
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jul 2022 23:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1658793189;
 bh=hMeOCWphjQeObF3V1YMNvWAuoTjvHYd8qwuMXp20+5U=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=k5GLvOkpf8Sh0DONZES5/XL+qGxM+a27T3WT1oHC6l8MEX883Uvlz9eaohS+5477+
 vYU6DopmDeqwp/5vRO8Okrpcf31MCbQPFgrov4HlOEDVpgnjDj7xW/54UnOs/zVqZe
 Qa56f2cuFscgharG36dGlGiry6WlYalB/NkPuSuU=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([108.233.15.105]) by mail.gmx.net
 (mrgmx005 [212.227.17.184]) with ESMTPSA (Nemesis) id
 1MBDnI-1oL1xa0z0w-00Cmg2; Tue, 26 Jul 2022 01:53:09 +0200
From: Kevin Brace <kevinbrace@gmx.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 13/32] drm/via: Add via_encoder.c
Date: Mon, 25 Jul 2022 16:51:08 -0700
Message-Id: <20220725235127.20433-14-kevinbrace@gmx.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220725235127.20433-1-kevinbrace@gmx.com>
References: <20220725235127.20433-1-kevinbrace@gmx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:UWJ3Cmg27xThZ88uvTGuFPhMzy2LqEBP46FRTvuKvq5UG6jgdjy
 MqfUoR4NmgIQ9PgjFtdojAbSfrJnxqwSioRaGwIYN3aBi0Wmn2PsKEu3K2rAccAj8ggRTj8
 Kh1FdDo8ajn40bjgKV/h+zQ/skpmPa6CUmNOXgi19RYNqe2M3OHnax1xlcHXT/u66XdqFqU
 UIp/dJ8OXrtuZVczDhujA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:aeiDt0PximM=:PVwUUUO1lutkeK5yZPNphV
 C2axUNeIbxXw6EMMByTIW1lkbgipaEonNl1jN51rFyNoqs96BPsJQ/SPiZgAvNRMoBA0xsdSw
 xCU86rMJllxANSaYlbgFAsCvln5xkJFEbFSvjfv8SZxzSR+FxLNKz/+os7Yrd2+tYgGDa92eX
 vD7/WuhhTIOXmEqmI1kUXnKgSG9ob0IimHlA66YlWd0rkTugwucNdcJFHH7zmc3zQQFznkONt
 hqjjnSsIFA12mNGSJLIQyw085pO54rtgY5ZYvFmNDXsx4vTsMO23SneCXJCdgG1cIwPDZMie5
 hszpuBPCa7v4NTm2tQu0oo19f93j1ASwm73m0JVLVpE2gS2jltK9WJqlWtPrI3yZXQChVowus
 XTu4v+kR8dSs31tXzE32Q0n+TH7zBrv9BgWZoN8vmLo6czGJvnux9DQ0Tk+GY8QSZMlGpwfzz
 IFWokkmSNqeweEWArmDuNx+RWriaKWG4YRiHWajuqmmD+MQaw5uFoXvQfXshbp7zhxOizj4Lw
 LpZbPRZ8LjSWE2YmdUhqjlwyFhPA68tH+Cxm+FaLT2jVCJW5UN/I+fJFF9Fbtkf/AHUZ3V0M6
 4VMghbuuIm95P+2CaavMT+fGYnp04UlXXrFPjYXk55LEoMQ3b8IPTr25s2jtwJ0hEBSpn+GPI
 aZ7xRsGarzqgHClIuQN+bLLnmXmq553hf+GXnbJe+Jme90pD4zapWLkv1wNx7ZLaVeCy0RyD5
 1mgRMqh4PkFvdIPCPRldw4xOC3fFfg1cwbugoQ13BXJCcc4Jd2OznRXnbi+sOD7WGdmV4wiBc
 dAcQXoXUSDz3DSsv1RyukTBIdZh1/FHtsvgqXPOyDf2yRecYy5T4R2yDlp4ZWX9fWWCefTvrB
 8Q5Ss5omK9Fw04sSO73TuZDkQRPf8skZz578wfONK0oUfqmnyQLgnuYSgbFA7b6C7/7AY2Oav
 f96dCzr8J4kJtldDCW8OrVYwwYROb+3uV+ctwW2OjSAqoGvPRfK+zTva9c2Jp+zkZS4zS9HZ8
 TQ19znWm2o1HCt2Yda81VVrJzSWZQBMIXfJUEpuwdZNWfldL2MTPAjYHL3pXTVDb3NVvgmwXn
 cqNB+kMbIdJ0bbpAgvcyW1PcRijQjw8OAuR4HjoL+mXPOciN1iL/Ha9oA==
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
 drivers/gpu/drm/via/via_encoder.c | 224 ++++++++++++++++++++++++++++++
 1 file changed, 224 insertions(+)
 create mode 100644 drivers/gpu/drm/via/via_encoder.c

diff --git a/drivers/gpu/drm/via/via_encoder.c b/drivers/gpu/drm/via/via_e=
ncoder.c
new file mode 100644
index 000000000000..32602136c170
=2D-- /dev/null
+++ b/drivers/gpu/drm/via/via_encoder.c
@@ -0,0 +1,224 @@
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
+	case VIA_DI_PORT_DIP0:
+		via_dip0_set_io_pad_state(VGABASE,
+					io_pad_on ? 0x03 : 0x00);
+		break;
+	case VIA_DI_PORT_DIP1:
+		via_dip1_set_io_pad_state(VGABASE,
+					io_pad_on ? 0x03 : 0x00);
+		break;
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
+void via_output_enable(struct via_drm_priv *dev_priv, uint32_t di_port,
+			bool output_enable)
+{
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	switch(di_port) {
+	case VIA_DI_PORT_DIP0:
+		via_dip0_set_output_enable(VGABASE, output_enable);
+		break;
+	case VIA_DI_PORT_DIP1:
+		via_dip1_set_output_enable(VGABASE, output_enable);
+		break;
+	default:
+		break;
+	}
+
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+}
+
+void via_clock_source(struct via_drm_priv *dev_priv, uint32_t di_port,
+			bool clock_source)
+{
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	switch(di_port) {
+	case VIA_DI_PORT_DIP0:
+		via_dip0_set_clock_source(VGABASE, clock_source);
+		break;
+	case VIA_DI_PORT_DIP1:
+		via_dip1_set_clock_source(VGABASE, clock_source);
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
+	case VIA_DI_PORT_DIP0:
+		via_dip0_set_display_source(VGABASE, display_source);
+		break;
+	case VIA_DI_PORT_DIP1:
+		via_dip1_set_display_source(VGABASE, display_source);
+		break;
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
=2D-
2.35.1

