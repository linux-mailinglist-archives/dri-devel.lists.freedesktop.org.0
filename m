Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 221E571FBA2
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jun 2023 10:14:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17E6210E0C2;
	Fri,  2 Jun 2023 08:14:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fd01.gateway.ufhost.com (fd01.gateway.ufhost.com
 [61.152.239.71])
 by gabe.freedesktop.org (Postfix) with ESMTP id 80D2410E630
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jun 2023 07:46:06 +0000 (UTC)
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
 by fd01.gateway.ufhost.com (Postfix) with ESMTP id AFC1D8102;
 Fri,  2 Jun 2023 15:40:48 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 2 Jun
 2023 15:40:48 +0800
Received: from xiaofei.localdomain (180.164.60.184) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 2 Jun
 2023 15:40:47 +0800
From: Keith Zhao <keith.zhao@starfivetech.com>
To: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <linux-media@vger.kernel.org>, <linaro-mm-sig@lists.linaro.org>
Subject: [PATCH 4/9] drm/verisilicon: Add gem driver for JH7110 SoC
Date: Fri, 2 Jun 2023 15:40:38 +0800
Message-ID: <20230602074043.33872-5-keith.zhao@starfivetech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230602074043.33872-1-keith.zhao@starfivetech.com>
References: <20230602074043.33872-1-keith.zhao@starfivetech.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [180.164.60.184]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Fri, 02 Jun 2023 08:14:07 +0000
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>,
 Shengyang Chen <shengyang.chen@starfivetech.com>,
 Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jagan Teki <jagan@edgeble.ai>, Rob
 Herring <robh+dt@kernel.org>, Chris Morgan <macromorgan@hotmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Keith Zhao <keith.zhao@starfivetech.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Changhuang Liang <changhuang.liang@starfivetech.com>,
 Jack Zhu <jack.zhu@starfivetech.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Shawn Guo <shawnguo@kernel.org>, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch implements gem related APIs for JH7100 SoC.

Signed-off-by: Keith Zhao <keith.zhao@starfivetech.com>
---
 drivers/gpu/drm/verisilicon/Makefile |   3 +-
 drivers/gpu/drm/verisilicon/vs_drv.c |   6 +
 drivers/gpu/drm/verisilicon/vs_gem.c | 372 +++++++++++++++++++++++++++
 drivers/gpu/drm/verisilicon/vs_gem.h |  72 ++++++
 4 files changed, 452 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/verisilicon/vs_gem.c
 create mode 100644 drivers/gpu/drm/verisilicon/vs_gem.h

diff --git a/drivers/gpu/drm/verisilicon/Makefile b/drivers/gpu/drm/veris=
ilicon/Makefile
index 64ce1b26546c..30360e370e47 100644
--- a/drivers/gpu/drm/verisilicon/Makefile
+++ b/drivers/gpu/drm/verisilicon/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
=20
-vs_drm-objs :=3D vs_drv.o
+vs_drm-objs :=3D vs_drv.o \
+		vs_gem.o
=20
 obj-$(CONFIG_DRM_VERISILICON) +=3D vs_drm.o
=20
diff --git a/drivers/gpu/drm/verisilicon/vs_drv.c b/drivers/gpu/drm/veris=
ilicon/vs_drv.c
index 24d333598477..e0a2fc43b55f 100644
--- a/drivers/gpu/drm/verisilicon/vs_drv.c
+++ b/drivers/gpu/drm/verisilicon/vs_drv.c
@@ -30,6 +30,7 @@
 #include <drm/drm_vblank.h>
=20
 #include "vs_drv.h"
+#include "vs_gem.h"
=20
 #define DRV_NAME	"starfive"
 #define DRV_DESC	"Starfive DRM driver"
@@ -47,6 +48,7 @@ static const struct file_operations fops =3D {
 	.compat_ioctl	=3D drm_compat_ioctl,
 	.poll			=3D drm_poll,
 	.read			=3D drm_read,
+	.mmap			=3D vs_gem_mmap,
 };
=20
 static struct drm_driver vs_drm_driver =3D {
@@ -54,6 +56,10 @@ static struct drm_driver vs_drm_driver =3D {
 	.lastclose		=3D drm_fb_helper_lastclose,
 	.prime_handle_to_fd =3D drm_gem_prime_handle_to_fd,
 	.prime_fd_to_handle =3D drm_gem_prime_fd_to_handle,
+	.gem_prime_import	=3D vs_gem_prime_import,
+	.gem_prime_import_sg_table =3D vs_gem_prime_import_sg_table,
+	.gem_prime_mmap		=3D vs_gem_prime_mmap,
+	.dumb_create		=3D vs_gem_dumb_create,
 	.fops			=3D &fops,
 	.name			=3D DRV_NAME,
 	.desc			=3D DRV_DESC,
diff --git a/drivers/gpu/drm/verisilicon/vs_gem.c b/drivers/gpu/drm/veris=
ilicon/vs_gem.c
new file mode 100644
index 000000000000..3f963471c1ab
--- /dev/null
+++ b/drivers/gpu/drm/verisilicon/vs_gem.c
@@ -0,0 +1,372 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2023 VeriSilicon Holdings Co., Ltd.
+ */
+
+#include <linux/dma-buf.h>
+#include <linux/of_reserved_mem.h>
+#include <drm/drm_gem_dma_helper.h>
+
+#include "vs_drv.h"
+#include "vs_gem.h"
+
+static const struct drm_gem_object_funcs vs_gem_default_funcs;
+
+static int vs_gem_alloc_buf(struct vs_gem_object *vs_obj)
+{
+	struct drm_device *dev =3D vs_obj->base.dev;
+	unsigned int nr_pages;
+	struct sg_table sgt;
+	int ret =3D -ENOMEM;
+
+	if (vs_obj->dma_addr) {
+		DRM_DEV_DEBUG_KMS(dev->dev, "already allocated.\n");
+		return 0;
+	}
+
+	vs_obj->dma_attrs =3D DMA_ATTR_WRITE_COMBINE | DMA_ATTR_FORCE_CONTIGUOU=
S
+			   | DMA_ATTR_NO_KERNEL_MAPPING;
+
+	nr_pages =3D vs_obj->size >> PAGE_SHIFT;
+
+	vs_obj->pages =3D kvmalloc_array(nr_pages, sizeof(struct page *),
+				       GFP_KERNEL | __GFP_ZERO);
+	if (!vs_obj->pages) {
+		DRM_DEV_ERROR(dev->dev, "failed to allocate pages.\n");
+		return -ENOMEM;
+	}
+
+	vs_obj->cookie =3D dma_alloc_attrs(to_dma_dev(dev), vs_obj->size,
+					 &vs_obj->dma_addr, GFP_KERNEL,
+					 vs_obj->dma_attrs);
+
+	if (!vs_obj->cookie) {
+		DRM_DEV_ERROR(dev->dev, "failed to allocate buffer.\n");
+		goto err_free;
+	}
+
+	vs_obj->iova =3D vs_obj->dma_addr;
+
+	ret =3D dma_get_sgtable_attrs(to_dma_dev(dev), &sgt,
+				    vs_obj->cookie, vs_obj->dma_addr,
+				    vs_obj->size, vs_obj->dma_attrs);
+	if (ret < 0) {
+		DRM_DEV_ERROR(dev->dev, "failed to get sgtable.\n");
+		goto err_mem_free;
+	}
+
+	if (drm_prime_sg_to_page_array(&sgt, vs_obj->pages, nr_pages)) {
+		DRM_DEV_ERROR(dev->dev, "invalid sgtable.\n");
+		ret =3D -EINVAL;
+		goto err_sgt_free;
+	}
+
+	sg_free_table(&sgt);
+
+	return 0;
+
+err_sgt_free:
+	sg_free_table(&sgt);
+err_mem_free:
+		dma_free_attrs(to_dma_dev(dev), vs_obj->size, vs_obj->cookie,
+			       vs_obj->dma_addr, vs_obj->dma_attrs);
+err_free:
+	kvfree(vs_obj->pages);
+
+	return ret;
+}
+
+static void vs_gem_free_buf(struct vs_gem_object *vs_obj)
+{
+	struct drm_device *dev =3D vs_obj->base.dev;
+
+	if (!vs_obj->dma_addr) {
+		DRM_DEV_DEBUG_KMS(dev->dev, "dma_addr is invalid.\n");
+		return;
+	}
+
+	dma_free_attrs(to_dma_dev(dev), vs_obj->size, vs_obj->cookie,
+		       (dma_addr_t)vs_obj->dma_addr,
+		       vs_obj->dma_attrs);
+
+	kvfree(vs_obj->pages);
+}
+
+static void vs_gem_free_object(struct drm_gem_object *obj)
+{
+	struct vs_gem_object *vs_obj =3D to_vs_gem_object(obj);
+
+	if (obj->import_attach)
+		drm_prime_gem_destroy(obj, vs_obj->sgt);
+	else
+		vs_gem_free_buf(vs_obj);
+
+	drm_gem_object_release(obj);
+
+	kfree(vs_obj);
+}
+
+static struct vs_gem_object *vs_gem_alloc_object(struct drm_device *dev,
+						 size_t size)
+{
+	struct vs_gem_object *vs_obj;
+	struct drm_gem_object *obj;
+	int ret;
+
+	vs_obj =3D kzalloc(sizeof(*vs_obj), GFP_KERNEL);
+	if (!vs_obj)
+		return ERR_PTR(-ENOMEM);
+
+	vs_obj->size =3D size;
+	obj =3D &vs_obj->base;
+
+	ret =3D drm_gem_object_init(dev, obj, size);
+	if (ret)
+		goto err_free;
+
+	vs_obj->base.funcs =3D &vs_gem_default_funcs;
+
+	ret =3D drm_gem_create_mmap_offset(obj);
+	if (ret) {
+		drm_gem_object_release(obj);
+		goto err_free;
+	}
+
+	return vs_obj;
+
+err_free:
+	kfree(vs_obj);
+	return ERR_PTR(ret);
+}
+
+struct vs_gem_object *vs_gem_create_object(struct drm_device *dev,
+					   size_t size)
+{
+	struct vs_gem_object *vs_obj;
+	int ret;
+
+	size =3D PAGE_ALIGN(size);
+
+	vs_obj =3D vs_gem_alloc_object(dev, size);
+	if (IS_ERR(vs_obj))
+		return vs_obj;
+
+	ret =3D vs_gem_alloc_buf(vs_obj);
+	if (ret) {
+		drm_gem_object_release(&vs_obj->base);
+		kfree(vs_obj);
+		return ERR_PTR(ret);
+	}
+
+	return vs_obj;
+}
+
+static struct vs_gem_object *vs_gem_create_with_handle(struct drm_device=
 *dev,
+						       struct drm_file *file,
+						       size_t size,
+						       unsigned int *handle)
+{
+	struct vs_gem_object *vs_obj;
+	struct drm_gem_object *obj;
+	int ret;
+
+	vs_obj =3D vs_gem_create_object(dev, size);
+	if (IS_ERR(vs_obj))
+		return vs_obj;
+
+	obj =3D &vs_obj->base;
+
+	ret =3D drm_gem_handle_create(file, obj, handle);
+
+	drm_gem_object_put(obj);
+
+	if (ret)
+		return ERR_PTR(ret);
+
+	return vs_obj;
+}
+
+static int vs_gem_mmap_obj(struct drm_gem_object *obj,
+			   struct vm_area_struct *vma)
+{
+	struct vs_gem_object *vs_obj =3D to_vs_gem_object(obj);
+	struct drm_device *drm_dev =3D vs_obj->base.dev;
+	unsigned long vm_size;
+	int ret =3D 0;
+
+	vm_size =3D vma->vm_end - vma->vm_start;
+	if (vm_size > vs_obj->size)
+		return -EINVAL;
+
+	vma->vm_pgoff =3D 0;
+
+	/*
+	 * We allocated a struct page table for starfive_obj, so clear
+	 * VM_PFNMAP flag that was set by drm_gem_mmap_obj()/drm_gem_mmap().
+	 */
+	vm_flags_mod(vma, VM_IO | VM_DONTEXPAND | VM_DONTDUMP, VM_PFNMAP);
+
+	vma->vm_page_prot =3D pgprot_writecombine(vm_get_page_prot(vma->vm_flag=
s));
+	vma->vm_page_prot =3D pgprot_decrypted(vma->vm_page_prot);
+
+	ret =3D dma_mmap_attrs(to_dma_dev(drm_dev), vma, vs_obj->cookie,
+			     vs_obj->dma_addr, vs_obj->size,
+			     vs_obj->dma_attrs);
+
+	if (ret)
+		drm_gem_vm_close(vma);
+
+	return ret;
+}
+
+struct sg_table *vs_gem_prime_get_sg_table(struct drm_gem_object *obj)
+{
+	struct vs_gem_object *vs_obj =3D to_vs_gem_object(obj);
+
+	return drm_prime_pages_to_sg(obj->dev, vs_obj->pages,
+					 vs_obj->size >> PAGE_SHIFT);
+}
+
+int vs_gem_prime_vmap(struct drm_gem_object *obj, struct iosys_map *map)
+{
+	struct vs_gem_object *vs_obj =3D to_vs_gem_object(obj);
+
+	void *vaddr =3D vs_obj->dma_attrs & DMA_ATTR_NO_KERNEL_MAPPING ?
+		       page_address(vs_obj->cookie) : vs_obj->cookie;
+
+	iosys_map_set_vaddr(map, vaddr);
+
+	return 0;
+}
+
+void vs_gem_prime_vunmap(struct drm_gem_object *obj, struct iosys_map *m=
ap)
+{
+	/* Nothing to do */
+}
+
+static const struct vm_operations_struct vs_vm_ops =3D {
+	.open  =3D drm_gem_vm_open,
+	.close =3D drm_gem_vm_close,
+};
+
+static const struct drm_gem_object_funcs vs_gem_default_funcs =3D {
+	.free =3D vs_gem_free_object,
+	.get_sg_table =3D vs_gem_prime_get_sg_table,
+	.vmap =3D vs_gem_prime_vmap,
+	.vunmap =3D vs_gem_prime_vunmap,
+	.vm_ops =3D &vs_vm_ops,
+};
+
+int vs_gem_dumb_create(struct drm_file *file,
+		       struct drm_device *dev,
+		       struct drm_mode_create_dumb *args)
+{
+	struct vs_drm_private *priv =3D dev->dev_private;
+	struct vs_gem_object *vs_obj;
+	unsigned int pitch =3D DIV_ROUND_UP(args->width * args->bpp, 8);
+
+	if (args->bpp % 10)
+		args->pitch =3D ALIGN(pitch, priv->pitch_alignment);
+	else
+		/* for costum 10bit format with no bit gaps */
+		args->pitch =3D pitch;
+	args->size =3D PAGE_ALIGN(args->pitch * args->height);
+	vs_obj =3D vs_gem_create_with_handle(dev, file, args->size,
+					   &args->handle);
+	return PTR_ERR_OR_ZERO(vs_obj);
+}
+
+struct drm_gem_object *vs_gem_prime_import(struct drm_device *dev,
+					   struct dma_buf *dma_buf)
+{
+	return drm_gem_prime_import_dev(dev, dma_buf, to_dma_dev(dev));
+}
+
+struct drm_gem_object *
+vs_gem_prime_import_sg_table(struct drm_device *dev,
+			     struct dma_buf_attachment *attach,
+			     struct sg_table *sgt)
+{
+	struct vs_gem_object *vs_obj;
+	int npages;
+	int ret;
+	struct scatterlist *s;
+	u32 i;
+	dma_addr_t expected;
+	size_t size =3D attach->dmabuf->size;
+
+	size =3D PAGE_ALIGN(size);
+
+	vs_obj =3D vs_gem_alloc_object(dev, size);
+	if (IS_ERR(vs_obj))
+		return ERR_CAST(vs_obj);
+
+	expected =3D sg_dma_address(sgt->sgl);
+	for_each_sg(sgt->sgl, s, sgt->nents, i) {
+		if (sg_dma_address(s) !=3D expected) {
+			DRM_ERROR("sg_table is not contiguous");
+			ret =3D -EINVAL;
+			goto err;
+		}
+		if (sg_dma_len(s) & (PAGE_SIZE - 1)) {
+			ret =3D -EINVAL;
+			goto err;
+		}
+		if (i =3D=3D 0)
+			vs_obj->iova =3D sg_dma_address(s);
+		expected =3D sg_dma_address(s) + sg_dma_len(s);
+	}
+
+	vs_obj->dma_addr =3D sg_dma_address(sgt->sgl);
+
+	npages =3D vs_obj->size >> PAGE_SHIFT;
+	vs_obj->pages =3D kvmalloc_array(npages, sizeof(struct page *),
+				       GFP_KERNEL);
+	if (!vs_obj->pages) {
+		ret =3D -ENOMEM;
+		goto err;
+	}
+
+	ret =3D drm_prime_sg_to_page_array(sgt, vs_obj->pages, npages);
+	if (ret)
+		goto err_free_page;
+
+	vs_obj->sgt =3D sgt;
+
+	return &vs_obj->base;
+
+err_free_page:
+	kvfree(vs_obj->pages);
+err:
+	vs_gem_free_object(&vs_obj->base);
+
+	return ERR_PTR(ret);
+}
+
+int vs_gem_prime_mmap(struct drm_gem_object *obj, struct vm_area_struct =
*vma)
+{
+	int ret =3D 0;
+
+	ret =3D drm_gem_mmap_obj(obj, obj->size, vma);
+	if (ret < 0)
+		return ret;
+
+	return vs_gem_mmap_obj(obj, vma);
+}
+
+int vs_gem_mmap(struct file *filp, struct vm_area_struct *vma)
+{
+	struct drm_gem_object *obj;
+	int ret;
+
+	ret =3D drm_gem_mmap(filp, vma);
+	if (ret)
+		return ret;
+
+	obj =3D vma->vm_private_data;
+
+	if (obj->import_attach)
+		return dma_buf_mmap(obj->dma_buf, vma, 0);
+
+	return vs_gem_mmap_obj(obj, vma);
+}
diff --git a/drivers/gpu/drm/verisilicon/vs_gem.h b/drivers/gpu/drm/veris=
ilicon/vs_gem.h
new file mode 100644
index 000000000000..3a6d7452cb06
--- /dev/null
+++ b/drivers/gpu/drm/verisilicon/vs_gem.h
@@ -0,0 +1,72 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2023 VeriSilicon Holdings Co., Ltd.
+ */
+
+#ifndef __VS_GEM_H__
+#define __VS_GEM_H__
+
+#include <linux/dma-buf.h>
+
+#include <drm/drm_gem.h>
+#include <drm/drm_prime.h>
+
+#include "vs_drv.h"
+/*
+ *
+ * @base: drm gem object.
+ * @size: size requested from user
+ * @cookie: cookie returned by dma_alloc_attrs
+ *	- not kernel virtual address with DMA_ATTR_NO_KERNEL_MAPPING
+ * @dma_addr: bus address(accessed by dma) to allocated memory region.
+ *	- this address could be physical address without IOMMU and
+ *	device address with IOMMU.
+ * @dma_attrs: attribute for DMA API
+ * @get_pages: flag for manually applying for non-contiguous memory.
+ * @pages: Array of backing pages.
+ * @sgt: Imported sg_table.
+ *
+ */
+struct vs_gem_object {
+	struct drm_gem_object	base;
+	size_t			size;
+	void			*cookie;
+	dma_addr_t		dma_addr;
+	u32				iova;
+	unsigned long	dma_attrs;
+	bool			get_pages;
+	struct page		**pages;
+	struct sg_table *sgt;
+};
+
+static inline
+struct vs_gem_object *to_vs_gem_object(struct drm_gem_object *obj)
+{
+	return container_of(obj, struct vs_gem_object, base);
+}
+
+struct vs_gem_object *vs_gem_create_object(struct drm_device *dev,
+					   size_t size);
+
+int vs_gem_prime_vmap(struct drm_gem_object *obj, struct iosys_map *map)=
;
+void vs_gem_prime_vunmap(struct drm_gem_object *obj, struct iosys_map *m=
ap);
+
+int vs_gem_prime_mmap(struct drm_gem_object *obj,
+		      struct vm_area_struct *vma);
+
+int vs_gem_dumb_create(struct drm_file *file_priv,
+		       struct drm_device *drm,
+		       struct drm_mode_create_dumb *args);
+
+int vs_gem_mmap(struct file *filp, struct vm_area_struct *vma);
+
+struct sg_table *vs_gem_prime_get_sg_table(struct drm_gem_object *obj);
+
+struct drm_gem_object *vs_gem_prime_import(struct drm_device *dev,
+					   struct dma_buf *dma_buf);
+struct drm_gem_object *
+vs_gem_prime_import_sg_table(struct drm_device *dev,
+			     struct dma_buf_attachment *attach,
+			     struct sg_table *sgt);
+
+#endif /* __VS_GEM_H__ */
--=20
2.34.1

