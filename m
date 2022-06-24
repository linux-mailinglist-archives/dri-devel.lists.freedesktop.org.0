Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED90E55A2B3
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 22:33:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B591110F31E;
	Fri, 24 Jun 2022 20:33:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93A7E10F2DA
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 20:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1656102797;
 bh=RauvbjralAhedQxMyQAvoPaL4iQcHmvh7l0ySXEbhE8=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=ht5gpJTKFtfNimJxG/E4rSzaoHIqiCET9i+KWpXqhZ+Ko+CNnII8xQGDe5opyUvVy
 fYfmA9X25PpJDOH3YH25TkZQ1bxoeoDKkFJ6snZl+P4YuNmP+ZgTaDhB8ISbHSNHlH
 ZZCHGcknDLJVPXySEup9Wf95Qm6SO/i5eKoL3dGk=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([174.250.50.2]) by mail.gmx.net
 (mrgmx004 [212.227.17.184]) with ESMTPSA (Nemesis) id
 1MUGi9-1oDSiu3I95-00RMJB; Fri, 24 Jun 2022 22:33:17 +0200
From: Kevin Brace <kevinbrace@gmx.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 20/28] drm/via: Add via_pm.c
Date: Fri, 24 Jun 2022 15:32:51 -0500
Message-Id: <20220624203259.4051-1-kevinbrace@gmx.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:OsLoPjVsztA23hzi46Z9DqTAclNnKc94IP5lo9/1CoBlVcxOoW0
 4IrbqKHM0WYLMQRaajPxRKwhWl/j11dGVIsATLFE4+7jaKfYFQBcFbf0H9Sa6zVzcgaej+U
 YeCnfqOxbcPr+GIyI0VoBZfn8XDm4KM4ikDfmxbMuaO15Zh119efRVpZ93ZYo8xVyTY+SpW
 cIEns9h61YDBRYvT7XVvw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Kr0UdFG0BqU=:w9OHx/CwHwOHS28Z+U0G4C
 o4oX5dSrZFVULkNVoe9P86udc8PamoRBYDdMng4OqwPnSXXLezmQneL++/qfL208TuxZrdVJh
 q6UTEQLV+l73YyhD2REyZq6jlw8UBZSEMSs+/I8Ad+dh6oqlscqgE+O1EeMY8AdrULXYfcugt
 58XlZondEC5Oll7IrHX0x+7cn9ssH5erR/+q8Jzj8VytgduI5XVAAn1NmikncsVcywDJxokRN
 td+hBCDoisMw7/FX0l+wPRUAl3ZctR7BK42Pr9YUbayaNz9n/jiX7Cx+KDB1S596WNoffEAv3
 vzL0v2KXQkzerEQlRA5FGkeUq0Ws47cs8aqXcdBbc6ad48kYpT36c/zPTxjXXiIRJuGr+XDiU
 il9+xX/qXxSt2Q1t0jUdkg3KSlun24FoD7GiT3YoaOB94xMQ4/tvm974IBV6jQCidtJowEt6r
 OBD4Nixo1S1YXoTDt2NqEt6g8yaxtprHxX2Q8bzWHk98ZFv/M+Zg6lwct+3WTuD7Q56CF3L+I
 0VKTE+OX56KPDnnrcll4YOH4rrsfcULxupYJrPdY302YMnt6CGJ6M/XtaUWjx7TKkh9LQqLud
 tHycm4PyPBFlCe3utfZ0so/Ro5SqKwJXAbkNpVO5m8C+8yam1pecmu3B4bM/DrIjYyxb16acy
 AbCZJlP8ZgPvYVzO9CdQXZEMjPRmpPn90adiZlx+FVekIuPZ6kyqfkC2fk7xQ1msbGJUemqcU
 L+9Q3TUJy/sJ2yTDNM45aaRU7v/Vf3BmFRcPdHO//VVt2ajXLN0JVZaHqCVRnD5vKmTaETJDR
 h8nuxczLulLK1uanFiRmlm0t9yxpOvAov5XOk6LCk2EcnkwJBeVS8Rl+LkHCsE+NWlEeScavT
 PBeidFtvAUkXP0gkkxX1FpjcH4S0wku4UYXC3dHImS1QN4j+1G1Yxt1AE9kYc3OsJs2y998lp
 1aZe9yx4ytUuEWuvC9FFPJyrD8DHAzM+3C0Ac1ulrK8dq4TQ1ucXnDAFdainm0bPKjF/yvRCH
 I2ADOxzES7ODqsWyFD0e2Z4wi9IZ0Oww/Rah/nUP5JskMnBoSSUw6CIqcfyUyO8AAM91KzyxV
 M6Xf37SSdDyN/WmJgi/hOMbri1rFtUA7X47sMxcr1Gcqo2B5NmM9X9Seg==
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

