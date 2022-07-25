Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7676C58088B
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jul 2022 01:55:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2754110F828;
	Mon, 25 Jul 2022 23:55:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D02610F764
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jul 2022 23:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1658793282;
 bh=I0dm5++dA+KwP+P2CbnSIyqr6Q+Si6imI79Kn2Wsbs4=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=CydG5iSHjQJrtM9slKX+HSIiSSbUQo4FHkUqWQ8JSVkqIMMuEmwUdbdwL1C2hLp0a
 ZL7nHdxfsK1vHjdso0mnlkcwJSkfLEkUHBV0Gi6ImPZW7pPGYxBQQG+9oE8u7PxBWJ
 Avnr490EkgOANZkYzzV7yMEE+m3YY+il2mscYHWI=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([108.233.15.105]) by mail.gmx.net
 (mrgmx105 [212.227.17.174]) with ESMTPSA (Nemesis) id
 1MWASY-1o0Drn0tq6-00XZ9n; Tue, 26 Jul 2022 01:54:42 +0200
From: Kevin Brace <kevinbrace@gmx.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 21/32] drm/via: Add via_pm.c
Date: Mon, 25 Jul 2022 16:53:48 -0700
Message-Id: <20220725235359.20516-2-kevinbrace@gmx.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220725235359.20516-1-kevinbrace@gmx.com>
References: <20220725235359.20516-1-kevinbrace@gmx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:P9bf878HtIassVlJ34a5pfD9S3WvG3mgUTQz/YBZ7BGFFjV+L6W
 iR8eAku49AWmTAGU0BQoMHMSBW/MQnLLDyTjuhVnmzen3/do6sEJ6M5Cdgzj67dOTG5JTsa
 gZUD9WYIqADyupHay56rI9a3SR7RdttZVMiutnIoxxL856EzPNDR93+1IayXLtoDKq7qKQC
 fsTyKu34yyCQUW+AnPCGg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:4dP3yq1yHSw=:Z6YU3cmUbXldxtddui+T5A
 oNlwAnBMHrAiX+16xBF5OboSvpEnygweY7lq/B31lcnG9ZzeqVOLoGPORo4ec8mhVQOZ9lkjv
 HzUJG9Bj+ETnKKtvJmluzoPTQEZB+2iFs8nzyqkrFlvg/cyzyTX492EZT6NT1300LnrmLXp5P
 1A88GGYQ31oOEAE5FUktrhpCFenkGBD8kD0r7ig2oHR9FtrPatE3OO0eqbVPZL6EORmeSuBJW
 wgGPiqYkn33PyP6azRrZ49lrM3MvUka6Vr9tZP7hGajol0vS/uNfNiVbxJTKCXLVrCx5M//RE
 afh/vPHJzO/6+sJHe2wHe8OBikVN352+PwWDZFB+c4KtikrcarfT2/N6f8BcYXGW94cDA+UhL
 OnnarUroW1YySRIyvpR3mejIKttHag3KXDvDAkFKWFmi1TPqYb1mJt3IzDd/wuchFJQ3v8UtA
 pNCl1Ni+eNvk6M//53ab0LQ+0J2lGbSresQjNc0PsgOtg02ZfQpoCcmoJ/QFZNFNWjcpzw9Xw
 YrgIIwyS594czJ619vVBhvAiEtq9Y7Pm6J120qqayANuTrsRbx7s59TptjFGPgAe4Tv3YExTm
 uA4hrTnfgiSAU0RAMk+rTycV6to8bOiGIHZeHuFzHeNjfCYVGLdl79kyCdenjJLrWrV0vP6ON
 ElfoAdRUTcHLD4qLWeF6qRyPMwmNOdznnJdM0Z6NQnfA7CXPm2vMJ9UeLdejpr5yR8l1eXv/6
 JRnPiFZQHuypZfJ6dRZgazBeJ8DzxuP1hD8hcBW1B2VD8Y8pIP3MJQh4HoM1kF+3ZdqM79KDG
 h5LL8qOsCyeZ4B2GTnqgEvbT5bsilpI3I4CQi78ZGnIhS8xeK06SNSYpfe68x1qsePXIaheuw
 OiwigHsd+6jNvTvZ0mm4Au2eHpMAMzni+Grq8fPBW11u0XbgDEjBbNsS/AKfo9MIWOKXGQqNM
 Q/5ePvyARW/Z/x/J8NKpzkocl8ybrB9rONE5mdC+Jej7krGUGuWov2sf5Tssu3K/c/h6cI/lY
 oV4Tj2eSw0GUePDysqcYcrMlhOkuRbu+MzqR3YzKDU2Ryc6DWmasvlO8TkfTfr5EV35gUUh2N
 LNyepBp8ndg+IxH/KDyc5kR+32XY9ymGN3+ZVIyeLMk6XSO9sLdu8m0mw==
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
index 000000000000..5fad01447eed
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
+	if ((pdev->device =3D=3D PCI_DEVICE_ID_VIA_CHROME9_HC3) ||
+		(pdev->device =3D=3D PCI_DEVICE_ID_VIA_CHROME9_HCM) ||
+		(pdev->device =3D=3D PCI_DEVICE_ID_VIA_CHROME9_HD)) {
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
+	if ((pdev->device =3D=3D PCI_DEVICE_ID_VIA_CHROME9_HC3) ||
+		(pdev->device =3D=3D PCI_DEVICE_ID_VIA_CHROME9_HCM) ||
+		(pdev->device =3D=3D PCI_DEVICE_ID_VIA_CHROME9_HD)) {
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

