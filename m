Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E0F255F0AC
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 23:55:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08AD6112D05;
	Tue, 28 Jun 2022 21:55:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B40B112D05
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 21:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1656453340;
 bh=RauvbjralAhedQxMyQAvoPaL4iQcHmvh7l0ySXEbhE8=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=iaPdSTu13f5Difs/6Q3loHCAmlPZDBV/reDYTPHanze5xWThgCD+k42+MZqSsnN5o
 63LSQx/0nxf1p5ftnzULEwAgVTp/o2XGMwvTd/kq7EFVuBrs6viu3vBEE/b3AC8wUM
 r7rKQfMuR73Ca9vub3Hnd6uTPMbAfC+DMIxLo+zs=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([174.250.0.2]) by mail.gmx.net (mrgmx005
 [212.227.17.184]) with ESMTPSA (Nemesis) id 1M1psI-1o46Fu2w0m-002Jgy; Tue, 28
 Jun 2022 23:55:40 +0200
From: Kevin Brace <kevinbrace@gmx.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 21/32] drm/via: Add via_pm.c
Date: Tue, 28 Jun 2022 16:55:09 -0500
Message-Id: <20220628215520.20674-2-kevinbrace@gmx.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220628215520.20674-1-kevinbrace@gmx.com>
References: <20220628215520.20674-1-kevinbrace@gmx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:fa+5QOaBdlgXna4sILXSvb+FDV6mMRbm8H0oV233DnkhvSYUaKR
 v12QLtgOng1IMzFQK4tz2Qhc/zjBefG9b5bY0jpqtlCzzrV8/aXeSNj74J/oIRiIXfx0av3
 63CI6JX9Ijkws515/mZWrrb5HCk9yyqwiJ9Uzq0bNUX1N0O0SHWq1hars0ODmPnYYfM8+lN
 YUcIiQMql3+wzqfJSvCfw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:NlRXBTemZhM=:IqAJErNlfLbJ0QRaiyHGIq
 UIAJdh7LYH1JUS4xMKN4lBoC7fCNhDJaRaNe0BuuhPBVySR81J5PMLPh4fcyGtLPYGtX/8M6x
 Ax3dXCWW9N/9zz1/wJWNPTLDXMg2kOLPw9NB5uO/0S149DIGPXCv0C4DJ+p6h+9tY9QOpCRlW
 Xu8ROcZfm3+SjjCyJbDrvzogpTpzGzAIJiQfDeWTV1XsYf6HMSGSA3HYQc5NoUDjV49Qa5nK1
 Brmt3aWbMv8cRei9HOOcO1NjNSGY+COwO8VXQPv5F/+5Ha6uXaqNzcz3X0+sfI2eUU8Z2cIsE
 j1bvQw++Pz/SlCHB6em/4Ba/2G/7a5aVEf3LAo6hTpp95uoATEguKrBiOKlPJuRTPrEQ/220D
 n0hq+vV8f/RYj46qndJfBgCf4F170x8YLnkiBQPx3TNW730JCShVtQsIBBRF9Q3tmPl/vE8ap
 qn4Q9dlKG6w3OigD1YyKTjocrpPPxB+48c/BybtTeIQ1poeLMyV2o7DjLz9wMwkUMK6/Kv3R7
 ysGl49+ialNiEmyQK8YIwMS6KwEtSKxqeyznMi84Tb8dqTdFpiiyvvF9iRzwtHdLdITdqqalD
 /pIcJhtgUtBXlXMZM+i2FAIjp3UINkhIoHLrMfGfjS7SLycwsZEi6aRrsWT77x6PTfW1Ny5fi
 FZ6ge3VlN6yn4HUL6Tq2tAa50QurE5om77K92QwVOjmGw58rorQ/3yr/gu5Tv5+29IG+fcEnN
 X40rH9Q3NquwAKW8tkVkci8GcySIWFsHYrtikg/bb6cna0RJYb2m3B3j4IeiXmfowovXiN5VL
 b9lcSucwCoY6pY3R2spiwd+ibqJUUq97YoWf220JM8/lH/UgANSJiZ/JavTWaYwNUhsH0RdX2
 h7VI1i/Hdwwh0HbgqCzePLuGpSUQSaV4cjwsx6dWPHi6qvleQjK1VAr0l/+jUuZ8kmIyMXGFh
 pQ6lf5jJNCKNflaN61hcwJDoxM0n1JakaOLYhMkqkQvMQbVs9ZmOmqxeov537xblhM9CKrOz6
 QebFTnFayvXEIGMFUQnBRb3jfSGcz0WUhbnJiwwdnifhAbbZIn98A0SUBiyDpEb6WOx93wiYF
 XUrNtjQErRPR4cF+HWwugZTwEXhdvqaRRQnuWNgCqBv/lAr+e4/WWYBNw==
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
 drivers/gpu/drm/via/via_pm.c | 187 +++++++++++++++++++++++++++++++++++
 1 file changed, 187 insertions(+)
 create mode 100644 drivers/gpu/drm/via/via_pm.c

diff --git a/drivers/gpu/drm/via/via_pm.c b/drivers/gpu/drm/via/via_pm.c
new file mode 100644
index 000000000000..9b80886ab06a
=2D-- /dev/null
+++ b/drivers/gpu/drm/via/via_pm.c
@@ -0,0 +1,187 @@
+/*
+ * Copyright =C2=A9 2017-2020 Kevin Brace.
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
+ */
+
+
+#include <linux/console.h>
+#include <linux/pci.h>
+
+#include "via_drv.h"
+
+
+int via_dev_pm_ops_suspend(struct device *dev)
+{
+	struct pci_dev *pdev =3D to_pci_dev(dev);
+	struct drm_device *drm_dev =3D pci_get_drvdata(pdev);
+	struct via_drm_priv *dev_priv =3D to_via_drm_priv(drm_dev);
+	int ret =3D 0;
+
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	console_lock();
+
+	/*
+	 * Frame Buffer Size Control register (SR14) and GTI registers
+	 * (SR66 through SR6F) need to be saved and restored upon standby
+	 * resume or can lead to a display corruption issue. These registers
+	 * are only available on VX800, VX855, and VX900 chipsets. This bug
+	 * was observed on VIA Embedded EPIA-M830 mainboard.
+	 */
+	if ((pdev->device =3D=3D PCI_DEVICE_ID_VIA_VT1122) ||
+		(pdev->device =3D=3D PCI_DEVICE_ID_VIA_VX875) ||
+		(pdev->device =3D=3D PCI_DEVICE_ID_VIA_VX900_VGA)) {
+		dev_priv->saved_sr14 =3D vga_rseq(VGABASE, 0x14);
+
+		dev_priv->saved_sr66 =3D vga_rseq(VGABASE, 0x66);
+		dev_priv->saved_sr67 =3D vga_rseq(VGABASE, 0x67);
+		dev_priv->saved_sr68 =3D vga_rseq(VGABASE, 0x68);
+		dev_priv->saved_sr69 =3D vga_rseq(VGABASE, 0x69);
+		dev_priv->saved_sr6a =3D vga_rseq(VGABASE, 0x6a);
+		dev_priv->saved_sr6b =3D vga_rseq(VGABASE, 0x6b);
+		dev_priv->saved_sr6c =3D vga_rseq(VGABASE, 0x6c);
+		dev_priv->saved_sr6d =3D vga_rseq(VGABASE, 0x6d);
+		dev_priv->saved_sr6e =3D vga_rseq(VGABASE, 0x6e);
+		dev_priv->saved_sr6f =3D vga_rseq(VGABASE, 0x6f);
+	}
+
+	/*
+	 * 3X5.3B through 3X5.3F are scratch pad registers.
+	 * They are important for FP detection.
+	 * Their values need to be saved because they get lost
+	 * when resuming from standby.
+	 */
+	dev_priv->saved_cr3b =3D vga_rcrt(VGABASE, 0x3b);
+	dev_priv->saved_cr3c =3D vga_rcrt(VGABASE, 0x3c);
+	dev_priv->saved_cr3d =3D vga_rcrt(VGABASE, 0x3d);
+	dev_priv->saved_cr3e =3D vga_rcrt(VGABASE, 0x3e);
+	dev_priv->saved_cr3f =3D vga_rcrt(VGABASE, 0x3f);
+
+	console_unlock();
+
+	ret =3D drm_mode_config_helper_suspend(drm_dev);
+	if (ret) {
+		DRM_ERROR("Failed to prepare for suspend.\n");
+		goto exit;
+	}
+
+	pci_save_state(pdev);
+	pci_disable_device(pdev);
+exit:
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+	return ret;
+}
+
+int via_dev_pm_ops_resume(struct device *dev)
+{
+	struct pci_dev *pdev =3D to_pci_dev(dev);
+	struct drm_device *drm_dev =3D pci_get_drvdata(pdev);
+	struct via_drm_priv *dev_priv =3D to_via_drm_priv(drm_dev);
+	void __iomem *regs =3D ioport_map(0x3c0, 100);
+	u8 val;
+	int ret =3D 0;
+
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	if (pci_enable_device(pdev)) {
+		DRM_ERROR("Failed to initialize a PCI "
+				"after resume.\n");
+		ret =3D -EIO;
+		goto exit;
+	}
+
+	console_lock();
+
+	val =3D ioread8(regs + 0x03);
+	iowrite8(val | 0x1, regs + 0x03);
+	val =3D ioread8(regs + 0x0C);
+	iowrite8(val | 0x1, regs + 0x02);
+
+	/*
+	 * Unlock Extended IO Space.
+	 */
+	iowrite8(0x10, regs + 0x04);
+	iowrite8(0x01, regs + 0x05);
+
+	/*
+	 * Unlock CRTC register protect.
+	 */
+	iowrite8(0x47, regs + 0x14);
+
+	/*
+	 * Enable MMIO.
+	 */
+	iowrite8(0x1a, regs + 0x04);
+	val =3D ioread8(regs + 0x05);
+	iowrite8(val | 0x38, regs + 0x05);
+
+	/*
+	 * Frame Buffer Size Control register (SR14) and GTI registers
+	 * (SR66 through SR6F) need to be saved and restored upon standby
+	 * resume or can lead to a display corruption issue. These registers
+	 * are only available on VX800, VX855, and VX900 chipsets. This bug
+	 * was observed on VIA Embedded EPIA-M830 mainboard.
+	 */
+	if ((pdev->device =3D=3D PCI_DEVICE_ID_VIA_VT1122) ||
+		(pdev->device =3D=3D PCI_DEVICE_ID_VIA_VX875) ||
+		(pdev->device =3D=3D PCI_DEVICE_ID_VIA_VX900_VGA)) {
+		vga_wseq(VGABASE, 0x14, dev_priv->saved_sr14);
+
+		vga_wseq(VGABASE, 0x66, dev_priv->saved_sr66);
+		vga_wseq(VGABASE, 0x67, dev_priv->saved_sr67);
+		vga_wseq(VGABASE, 0x68, dev_priv->saved_sr68);
+		vga_wseq(VGABASE, 0x69, dev_priv->saved_sr69);
+		vga_wseq(VGABASE, 0x6a, dev_priv->saved_sr6a);
+		vga_wseq(VGABASE, 0x6b, dev_priv->saved_sr6b);
+		vga_wseq(VGABASE, 0x6c, dev_priv->saved_sr6c);
+		vga_wseq(VGABASE, 0x6d, dev_priv->saved_sr6d);
+		vga_wseq(VGABASE, 0x6e, dev_priv->saved_sr6e);
+		vga_wseq(VGABASE, 0x6f, dev_priv->saved_sr6f);
+	}
+
+	/*
+	 * 3X5.3B through 3X5.3F are scratch pad registers.
+	 * They are important for FP detection.
+	 * Their values need to be restored because they are undefined
+	 * after resuming from standby.
+	 */
+	vga_wcrt(VGABASE, 0x3b, dev_priv->saved_cr3b);
+	vga_wcrt(VGABASE, 0x3c, dev_priv->saved_cr3c);
+	vga_wcrt(VGABASE, 0x3d, dev_priv->saved_cr3d);
+	vga_wcrt(VGABASE, 0x3e, dev_priv->saved_cr3e);
+	vga_wcrt(VGABASE, 0x3f, dev_priv->saved_cr3f);
+
+	console_unlock();
+
+	ret =3D drm_mode_config_helper_resume(drm_dev);
+	if (ret) {
+		DRM_ERROR("Failed to perform a modeset "
+				"after resume.\n");
+		goto exit;
+	}
+
+exit:
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+	return ret;
+}
=2D-
2.35.1

