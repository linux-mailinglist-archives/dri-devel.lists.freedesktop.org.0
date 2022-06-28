Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70A2955F09D
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 23:54:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35BB010F449;
	Tue, 28 Jun 2022 21:54:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 653D310E4D5
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 21:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1656453256;
 bh=tmsg0U7s2Ayr2ezAuXpMITZ8PKrawfxOyaDVMh+Y1nM=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=I5AvMrBt++xcYZAoYXzg5sPXRlMgt5NJaO9MQGnAOHy831T36ZmeFepgGpsk1UmyU
 qww5xRghK/epcljAbVxVp5+6Ydj+L10jfbBYV52ThFOWAlOz2c+uzhnT5+SHa6QwrX
 +Wf9Mbg8ES5Gqxr5rDeGT9T/B+RtyVTHTS+lb96A=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([174.250.0.5]) by mail.gmx.net (mrgmx005
 [212.227.17.184]) with ESMTPSA (Nemesis) id 1MmUHj-1nO8ik1UsT-00iTyr; Tue, 28
 Jun 2022 23:54:16 +0200
From: Kevin Brace <kevinbrace@gmx.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 12/32] drm/via: Add via_drv.c
Date: Tue, 28 Jun 2022 16:52:26 -0500
Message-Id: <20220628215246.19706-13-kevinbrace@gmx.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220628215246.19706-1-kevinbrace@gmx.com>
References: <20220628215246.19706-1-kevinbrace@gmx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Cyo5f7vZ4DB33TTJIXdzPHsRo/Le1+L0wCAQbxzK+XixEWu5UBs
 c8pVcezhdJIjlWHpsPk20VX4+ZxadoNbjRdJEvsWtFV6EQyNnM55uD/ypCQPjYX68LgyxBg
 3OlSJDEdzS0abWYNicLAOSi6o1U9dBsrrfQZgNru18su3eykbGX4Ej/H5sPJhGAu8GvhwP3
 q6b+g1Ly/piSvi2QuLwDA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:OpxFaPFrrv4=:CqDuMAyrvIwJem6FtjR9lW
 G0Ht4XUOG0RaWZ3xRpGMid9K3Ww3YidnJEs17kpsR/86gVUbGo16YlgEzz9UtepCGx+g8S8pR
 x1kUY7LpQFAzcNlOi7qs4M3+dKHDrStYTQ6j99MUTdZP6pn4T80DvBKt20HeoENknOQHRDzkW
 oSTJFTL9j+hn9a+DG4EVS1PSK94/eCbjaErKNj0OnqaAtBhE+2ryxXwCU1kV0hcZiplB3fbiu
 zOcfVcSxG0SOR+uzPqripzsZ3PejFN9P8FL1Jq+NrUSHZQgPIBoRodp28FSgaTPdVHaBl2Nqd
 59QvDTjkAufeLQkTV8k8bE7g8bty2/FOc5T/2eGy3wJQ0QsAHDp//St216L6X0onW+Cqni/Z5
 FWYPTXGmT9ZkB7jP75gbNkUYES/u8tU8/UKjxnNtUonRCnV/YeOJicweFqD/sR/Q7hOCqNoMG
 0hQEafOVLU+ivfWt+Zxi04ithVAXbvaHV2v8zL4OKA5TeF11XnTZiaFxt0AXbRCVh3guUWHpg
 zuqybLXin9d5ErZ6lG+KnngkcJwcvN0inTH1zZXZzvLud9jElkPtTP5CdmtCanWAVkonFu0re
 uxxqGxPfPbwNkv1o/wGRYfPSqK9qv+9AgTePRnbklFuhdLGvTviMGyHpEo8S5Na3Vadks5uo8
 U0sGalM1A/6EGJyhbR6OPu2wKN6TMlWFwef6cj+LWVSYtxYmzSxqGJMA/fgHC2W0oZP0ttvI+
 keFI7a0j1w8IUPVVKO2GHc1MnorLmz6H+E6A3OylhNQsQrCY15YrGqnHDiKYp8RAkJ16nXDUt
 5Dh3Byb7ZVYzwkAyuParYKzwM6xGl+3mE3ONww8DFwc8OP6aSTDcawIK8GjLUNv1KDmPqSXWr
 8eC5+R4WL/7p+q7HC7pUVIYaTms/A6JhHvKfLsyUm1fGv+9OkNhBzBoxUSUyknmi067y7aydy
 m6yMg3NfiTkd2a+mxg2CJclXkUyZSl8aBycCCDcqKegQdyVJRU07zk5zCpIyLywKm/If9j6Ep
 C1pD6JZ5olSAV/ML1G27iZfCRriU8F3NnULg1XX5TVFSL8J+GyTY2djRkgWGSyGI6uAFd1bs6
 3Pc48flY3i1Jm+IaK+WbyrkfrzfryVzKnNLWeeBpgXJFqgk8Lv8rqnRyg==
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

Note that GPL is chosen as a license type.  This is due to via_i2c.c
being GPL based.  Everything else is MIT license based.

Signed-off-by: Kevin Brace <kevinbrace@bracecomputerlab.com>
=2D--
 drivers/gpu/drm/via/via_drv.c | 313 ++++++++++++++++++++++++++++++++++
 1 file changed, 313 insertions(+)
 create mode 100644 drivers/gpu/drm/via/via_drv.c

diff --git a/drivers/gpu/drm/via/via_drv.c b/drivers/gpu/drm/via/via_drv.c
new file mode 100644
index 000000000000..25d7967c938b
=2D-- /dev/null
+++ b/drivers/gpu/drm/via/via_drv.c
@@ -0,0 +1,313 @@
+/*
+ * Copyright =C2=A9 2019-2021 Kevin Brace.
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
+ * Kevin Brace <kevinbrace@bracecomputerlab.com>
+ * James Simmons <jsimmons@infradead.org>
+ */
+
+#include <linux/pci.h>
+
+#include <drm/drm_aperture.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_fb_helper.h>
+#include <drm/drm_file.h>
+#include <drm/drm_gem.h>
+#include <drm/drm_ioctl.h>
+#include <drm/drm_pciids.h>
+#include <drm/drm_prime.h>
+
+#include <drm/ttm/ttm_bo_api.h>
+
+#include "via_drv.h"
+
+
+extern const struct drm_ioctl_desc via_driver_ioctls[];
+
+/*
+ * For now, this device driver will be disabled, unless the
+ * user decides to enable it.
+ */
+int via_modeset =3D 0;
+
+MODULE_PARM_DESC(modeset, "Enable DRM device driver "
+				"(Default: Disabled, "
+				"0 =3D Disabled,"
+				"1 =3D Enabled)");
+module_param_named(modeset, via_modeset, int, 0400);
+
+static int via_driver_open(struct drm_device *dev,
+					struct drm_file *file_priv)
+{
+	int ret =3D 0;
+
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+	return ret;
+}
+
+static void via_driver_postclose(struct drm_device *dev,
+					struct drm_file *file_priv)
+{
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+}
+
+static void via_driver_lastclose(struct drm_device *dev)
+{
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	drm_fb_helper_lastclose(dev);
+
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+}
+
+static int via_driver_dumb_create(struct drm_file *file_priv,
+					struct drm_device *dev,
+					struct drm_mode_create_dumb *args)
+{
+	struct ttm_buffer_object *ttm_bo;
+	struct via_drm_priv *dev_priv =3D to_via_drm_priv(dev);
+	struct via_bo *bo;
+	uint32_t handle, pitch;
+	uint64_t size;
+	int ret;
+
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	/*
+	 * Calculate the parameters for the dumb buffer.
+	 */
+	pitch =3D args->width * ((args->bpp + 7) >> 3);
+	size =3D pitch * args->height;
+
+	ret =3D via_bo_create(dev, &dev_priv->bdev, size,
+				ttm_bo_type_device, TTM_PL_VRAM, false, &bo);
+	if (ret) {
+		goto exit;
+	}
+
+	ttm_bo =3D &bo->ttm_bo;
+
+	ret =3D drm_gem_handle_create(file_priv, &ttm_bo->base, &handle);
+	drm_gem_object_put(&ttm_bo->base);
+	if (ret) {
+		via_bo_destroy(bo, false);
+		goto exit;
+	}
+
+	args->handle =3D handle;
+	args->pitch =3D pitch;
+	args->size =3D size;
+exit:
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+	return ret;
+}
+
+static int via_driver_dumb_map_offset(struct drm_file *file_priv,
+						struct drm_device *dev,
+						uint32_t handle,
+						uint64_t *offset)
+{
+	struct drm_gem_object *gem;
+	struct ttm_buffer_object *ttm_bo;
+	struct via_bo *bo;
+	int ret =3D 0;
+
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	gem =3D drm_gem_object_lookup(file_priv, handle);
+	if (!gem) {
+		ret =3D -ENOENT;
+		goto exit;
+	}
+
+	ttm_bo =3D container_of(gem, struct ttm_buffer_object, base);
+	bo =3D to_ttm_bo(ttm_bo);
+	*offset =3D drm_vma_node_offset_addr(&ttm_bo->base.vma_node);
+
+	drm_gem_object_put(gem);
+exit:
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+	return ret;
+}
+
+static const struct file_operations via_driver_fops =3D {
+	.owner		=3D THIS_MODULE,
+	.open		=3D drm_open,
+	.release	=3D drm_release,
+	.unlocked_ioctl =3D drm_ioctl,
+	.mmap		=3D drm_gem_mmap,
+	.poll		=3D drm_poll,
+	.llseek		=3D noop_llseek,
+};
+
+static struct drm_driver via_driver =3D {
+	.driver_features =3D DRIVER_GEM |
+				DRIVER_MODESET |
+				DRIVER_ATOMIC,
+	.open =3D via_driver_open,
+	.postclose =3D via_driver_postclose,
+	.lastclose =3D via_driver_lastclose,
+	.gem_prime_mmap =3D drm_gem_prime_mmap,
+	.dumb_create =3D via_driver_dumb_create,
+	.dumb_map_offset =3D via_driver_dumb_map_offset,
+	.ioctls =3D via_driver_ioctls,
+	.fops =3D &via_driver_fops,
+	.name =3D DRIVER_NAME,
+	.desc =3D DRIVER_DESC,
+	.date =3D DRIVER_DATE,
+	.major =3D DRIVER_MAJOR,
+	.minor =3D DRIVER_MINOR,
+	.patchlevel =3D DRIVER_PATCHLEVEL,
+};
+
+static struct pci_device_id via_pci_table[] =3D {
+	viadrv_PCI_IDS,
+};
+
+MODULE_DEVICE_TABLE(pci, via_pci_table);
+
+static int via_pci_probe(struct pci_dev *pdev,
+				const struct pci_device_id *ent)
+{
+	struct drm_device *dev;
+	struct via_drm_priv *dev_priv;
+	int ret;
+
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	ret =3D drm_aperture_remove_conflicting_pci_framebuffers(pdev,
+								&via_driver);
+	if (ret) {
+		goto exit;
+	}
+
+	ret =3D pci_enable_device(pdev);
+	if (ret) {
+		goto exit;
+	}
+
+	dev_priv =3D devm_drm_dev_alloc(&pdev->dev,
+					&via_driver,
+					struct via_drm_priv,
+					dev);
+	if (IS_ERR(dev_priv)) {
+		ret =3D PTR_ERR(dev_priv);
+		goto exit;
+	}
+
+	dev =3D &dev_priv->dev;
+
+	pci_set_drvdata(pdev, dev);
+
+	ret =3D via_drm_init(dev);
+	if (ret) {
+		goto error_disable_pci;
+	}
+
+	ret =3D drm_dev_register(dev, ent->driver_data);
+	if (ret) {
+		goto error_disable_pci;
+	}
+
+	drm_fbdev_generic_setup(dev, 32);
+	goto exit;
+error_disable_pci:
+	pci_disable_device(pdev);
+exit:
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+	return ret;
+}
+
+static void via_pci_remove(struct pci_dev *pdev)
+{
+	struct drm_device *dev =3D pci_get_drvdata(pdev);
+
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	via_drm_fini(dev);
+	drm_dev_unregister(dev);
+
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+}
+
+static const struct dev_pm_ops via_dev_pm_ops =3D {
+	.suspend	=3D via_dev_pm_ops_suspend,
+	.resume		=3D via_dev_pm_ops_resume,
+};
+
+static struct pci_driver via_pci_driver =3D {
+	.name		=3D DRIVER_NAME,
+	.id_table	=3D via_pci_table,
+	.probe		=3D via_pci_probe,
+	.remove		=3D via_pci_remove,
+	.driver.pm	=3D &via_dev_pm_ops,
+};
+
+static int __init via_init(void)
+{
+	int ret =3D 0;
+
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	if ((via_modeset =3D=3D -1) &&
+		(drm_firmware_drivers_only())) {
+		via_modeset =3D 0;
+	}
+
+	if (!via_modeset) {
+		ret =3D -EINVAL;
+		goto exit;
+	}
+
+	via_driver.num_ioctls =3D via_driver_num_ioctls;
+
+	ret =3D pci_register_driver(&via_pci_driver);
+
+exit:
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+	return ret;
+}
+
+static void __exit via_exit(void)
+{
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	if (!via_modeset) {
+		goto exit;
+	}
+
+	pci_unregister_driver(&via_pci_driver);
+exit:
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+}
+
+module_init(via_init);
+module_exit(via_exit);
+
+MODULE_AUTHOR(DRIVER_AUTHOR);
+MODULE_DESCRIPTION(DRIVER_DESC);
+MODULE_LICENSE("GPL");
=2D-
2.35.1

