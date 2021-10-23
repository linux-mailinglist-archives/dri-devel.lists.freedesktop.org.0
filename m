Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB251438488
	for <lists+dri-devel@lfdr.de>; Sat, 23 Oct 2021 19:36:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B2FA6E438;
	Sat, 23 Oct 2021 17:36:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E270B6E826
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Oct 2021 11:15:03 +0000 (UTC)
X-UUID: d7668a2186b14b8f9c68f1d933320653-20211023
X-UUID: d7668a2186b14b8f9c68f1d933320653-20211023
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by
 mailgw01.mediatek.com (envelope-from <flora.fu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1126739553; Sat, 23 Oct 2021 19:14:59 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Sat, 23 Oct 2021 19:14:57 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 23 Oct 2021 19:14:57 +0800
From: Flora Fu <flora.fu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Mark Brown
 <broonie@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-media@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linaro-mm-sig@lists.linaro.org>, Flora Fu
 <flora.fu@mediatek.com>, Yong Wu <yong.wu@mediatek.com>, Pi-Cheng Chen
 <pi-cheng.chen@mediatek.com>, JB Tsai <jb.tsai@mediatek.com>
Subject: [RFC 09/13] soc: mediatek: apu: Add middleware driver
Date: Sat, 23 Oct 2021 19:14:05 +0800
Message-ID: <20211023111409.30463-10-flora.fu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20211023111409.30463-1-flora.fu@mediatek.com>
References: <20211023111409.30463-1-flora.fu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-Mailman-Approved-At: Sat, 23 Oct 2021 17:35:54 +0000
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

APU middleware is responsible to receive all user's requests
and control command and device related flow.
In Kernel side, the middleware use the IPI to send command
to remote tinysys to dispatch commands to AI engines in APU.

Signed-off-by: JB Tsai <jb.tsai@mediatek.com>
Signed-off-by: Flora Fu <flora.fu@mediatek.com>
---
 drivers/soc/mediatek/apusys/Makefile     |   9 +
 drivers/soc/mediatek/apusys/apu-core.c   |   2 +
 drivers/soc/mediatek/apusys/apu-core.h   |   2 +
 drivers/soc/mediatek/apusys/apu-device.h |  39 +
 drivers/soc/mediatek/apusys/mdw-cmd.c    | 618 +++++++++++++++
 drivers/soc/mediatek/apusys/mdw-drv.c    | 211 +++++
 drivers/soc/mediatek/apusys/mdw-ioctl.c  | 331 ++++++++
 drivers/soc/mediatek/apusys/mdw-ioctl.h  | 256 +++++++
 drivers/soc/mediatek/apusys/mdw-mem.c    | 938 +++++++++++++++++++++++
 drivers/soc/mediatek/apusys/mdw-mem.h    |  23 +
 drivers/soc/mediatek/apusys/mdw-rv-cmd.c | 158 ++++
 drivers/soc/mediatek/apusys/mdw-rv-dev.c | 386 ++++++++++
 drivers/soc/mediatek/apusys/mdw-rv-msg.h |  90 +++
 drivers/soc/mediatek/apusys/mdw-rv.c     | 131 ++++
 drivers/soc/mediatek/apusys/mdw-rv.h     |  98 +++
 drivers/soc/mediatek/apusys/mdw-sysfs.c  | 200 +++++
 drivers/soc/mediatek/apusys/mdw.h        | 208 +++++
 17 files changed, 3700 insertions(+)
 create mode 100644 drivers/soc/mediatek/apusys/apu-device.h
 create mode 100644 drivers/soc/mediatek/apusys/mdw-cmd.c
 create mode 100644 drivers/soc/mediatek/apusys/mdw-drv.c
 create mode 100644 drivers/soc/mediatek/apusys/mdw-ioctl.c
 create mode 100644 drivers/soc/mediatek/apusys/mdw-ioctl.h
 create mode 100644 drivers/soc/mediatek/apusys/mdw-mem.c
 create mode 100644 drivers/soc/mediatek/apusys/mdw-mem.h
 create mode 100644 drivers/soc/mediatek/apusys/mdw-rv-cmd.c
 create mode 100644 drivers/soc/mediatek/apusys/mdw-rv-dev.c
 create mode 100644 drivers/soc/mediatek/apusys/mdw-rv-msg.h
 create mode 100644 drivers/soc/mediatek/apusys/mdw-rv.c
 create mode 100644 drivers/soc/mediatek/apusys/mdw-rv.h
 create mode 100644 drivers/soc/mediatek/apusys/mdw-sysfs.c
 create mode 100644 drivers/soc/mediatek/apusys/mdw.h

diff --git a/drivers/soc/mediatek/apusys/Makefile b/drivers/soc/mediatek/apusys/Makefile
index 490de0ee4727..dee3b1f0a1e7 100644
--- a/drivers/soc/mediatek/apusys/Makefile
+++ b/drivers/soc/mediatek/apusys/Makefile
@@ -13,3 +13,12 @@ apu-objs += apu-ipi.o
 apu-objs += apu-mbox.o
 apu-objs += mt81xx-plat.o
 apu-$(CONFIG_DEBUG_FS) += apu-sw-logger.o
+
+apu-objs += mdw-drv.o
+apu-objs += mdw-ioctl.o
+apu-objs += mdw-mem.o
+apu-objs += mdw-cmd.o
+apu-objs += mdw-rv.o
+apu-objs += mdw-rv-cmd.o
+apu-objs += mdw-rv-dev.o
+apu-$(CONFIG_DEBUG_FS) += mdw-sysfs.o
diff --git a/drivers/soc/mediatek/apusys/apu-core.c b/drivers/soc/mediatek/apusys/apu-core.c
index 80652b1d056e..ecad5660ee18 100644
--- a/drivers/soc/mediatek/apusys/apu-core.c
+++ b/drivers/soc/mediatek/apusys/apu-core.c
@@ -19,6 +19,7 @@ static struct apusys_core_info g_core_info;
  */
 static int (*apusys_init_func[])(struct apusys_core_info *) = {
 	apu_power_drv_init,
+	mdw_init,
 	apu_rproc_init,
 };
 
@@ -28,6 +29,7 @@ static int (*apusys_init_func[])(struct apusys_core_info *) = {
  */
 static void (*apusys_exit_func[])(void) = {
 	apu_rproc_exit,
+	mdw_exit,
 	apu_power_drv_exit,
 };
 
diff --git a/drivers/soc/mediatek/apusys/apu-core.h b/drivers/soc/mediatek/apusys/apu-core.h
index b47d95f0a1ae..7d8d6033ab07 100644
--- a/drivers/soc/mediatek/apusys/apu-core.h
+++ b/drivers/soc/mediatek/apusys/apu-core.h
@@ -11,6 +11,8 @@ struct apusys_core_info {
 
 int apu_power_drv_init(struct apusys_core_info *info);
 void apu_power_drv_exit(void);
+int mdw_init(struct apusys_core_info *info);
+void mdw_exit(void);
 int apu_rproc_init(struct apusys_core_info *info);
 void apu_rproc_exit(void);
 #endif
diff --git a/drivers/soc/mediatek/apusys/apu-device.h b/drivers/soc/mediatek/apusys/apu-device.h
new file mode 100644
index 000000000000..dddd8a3ddf8d
--- /dev/null
+++ b/drivers/soc/mediatek/apusys/apu-device.h
@@ -0,0 +1,39 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2021 MediaTek Inc.
+ */
+
+#ifndef APUSYS_DEVICE_H
+#define APUSYS_DEVICE_H
+
+#include <linux/dma-buf.h>
+
+/* device type */
+enum {
+	APUSYS_DEVICE_NONE,
+
+	APUSYS_DEVICE_SAMPLE,
+	APUSYS_DEVICE_MDLA,
+	APUSYS_DEVICE_VPU,
+	APUSYS_DEVICE_EDMA,
+	APUSYS_DEVICE_RT = 32,
+	APUSYS_DEVICE_SAMPLE_RT,
+	APUSYS_DEVICE_MDLA_RT,
+	APUSYS_DEVICE_VPU_RT,
+
+	APUSYS_DEVICE_MAX = 64,
+};
+
+/* device definition */
+#define APUSYS_DEVICE_META_SIZE (32)
+
+struct apusys_device {
+	int dev_type;
+	int idx;
+	int preempt_type;
+	u8 preempt_level;
+	char meta_data[APUSYS_DEVICE_META_SIZE];
+	void *private;
+	int (*send_cmd)(int type, void *hnd, struct apusys_device *dev);
+};
+#endif
diff --git a/drivers/soc/mediatek/apusys/mdw-cmd.c b/drivers/soc/mediatek/apusys/mdw-cmd.c
new file mode 100644
index 000000000000..231a82b4ba0e
--- /dev/null
+++ b/drivers/soc/mediatek/apusys/mdw-cmd.c
@@ -0,0 +1,618 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2021 MediaTek Inc.
+ */
+
+#include <linux/uaccess.h>
+#include <linux/slab.h>
+#include <linux/sync_file.h>
+
+#include "mdw.h"
+#include "mdw-mem.h"
+
+static struct mdw_mem *mdw_cmd_get_mem(u64 handle)
+{
+	struct mdw_mem *m = NULL;
+
+	m = mdw_mem_get(handle);
+	if (!m)
+		return NULL;
+
+	mdw_mem_dma_map(m);
+
+	return m;
+}
+
+static int mdw_cmd_put_mem(struct mdw_mem *m)
+{
+	return mdw_mem_dma_unmap(m);
+}
+
+static void mdw_cmd_put_cmdbufs(struct mdw_fpriv *mpriv, struct mdw_cmd *c)
+{
+	struct mdw_subcmd_kinfo *ksubcmd = NULL;
+	unsigned int i = 0, j = 0;
+
+	if (!c->cmdbufs)
+		return;
+
+	/* flush cmdbufs and execinfos */
+	apusys_mem_invalidate_kva(c->cmdbufs->vaddr, c->cmdbufs->size);
+
+	for (i = 0; i < c->num_subcmds; i++) {
+		ksubcmd = &c->ksubcmds[i];
+		for (j = 0; j < ksubcmd->info->num_cmdbufs; j++) {
+			if (!ksubcmd->ori_cbs[j])
+				continue;
+
+			/* cmdbuf copy out */
+			if (ksubcmd->cmdbufs[j].direction != MDW_CB_IN)
+				memcpy
+				(ksubcmd->ori_cbs[j]->vaddr,
+				(void *)ksubcmd->kvaddrs[j],
+				ksubcmd->ori_cbs[j]->size
+				);
+
+			mdw_cmd_put_mem(ksubcmd->ori_cbs[j]);
+			ksubcmd->ori_cbs[j] = NULL;
+		}
+	}
+	mdw_mem_unmap(c->cmdbufs);
+	mdw_mem_free(c->cmdbufs);
+
+	c->cmdbufs = NULL;
+}
+
+static int mdw_cmd_get_cmdbufs(struct mdw_fpriv *mpriv, struct mdw_cmd *c)
+{
+	unsigned int i = 0, j = 0, ofs = 0;
+	int ret = -EINVAL;
+	struct mdw_subcmd_kinfo *ksubcmd = NULL;
+	struct mdw_mem *m = NULL;
+	struct device *dev = mpriv->mdev->dev;
+
+	if (!c->size_cmdbufs || c->cmdbufs)
+		goto out;
+
+	/* alloc cmdbuf by dmabuf */
+	c->cmdbufs = mdw_mem_alloc
+		(mpriv, c->size_cmdbufs, MDW_DEFAULT_ALIGN,
+		(1ULL << MDW_MEM_IOCTL_ALLOC_CACHEABLE |
+		1ULL << MDW_MEM_IOCTL_ALLOC_32BIT),
+		MDW_MEM_TYPE_INTERNAL);
+	if (!c->cmdbufs) {
+		dev_err(dev, "mem alloc fail\n");
+		ret = -ENOMEM;
+		goto out;
+	}
+
+	ret = mdw_mem_map(c->cmdbufs);
+	if (ret) {
+		dev_err(dev, "mem map fail\n");
+		mdw_mem_free(c->cmdbufs);
+		ret = -ENOMEM;
+		goto out;
+	}
+
+	/* alloc mem for duplicated cmdbuf */
+	for (i = 0; i < c->num_subcmds; i++) {
+		ksubcmd = &c->ksubcmds[i];
+		for (j = 0; j < ksubcmd->info->num_cmdbufs; j++) {
+			/* calc align */
+			if (ksubcmd->cmdbufs[j].align)
+				ofs = MDW_ALIGN(ofs, ksubcmd->cmdbufs[j].align);
+			else
+				ofs = MDW_ALIGN(ofs, MDW_DEFAULT_ALIGN);
+
+			/* get mem from handle */
+			m = mdw_cmd_get_mem(ksubcmd->cmdbufs[j].handle);
+			if (!m) {
+				dev_err(dev, "cmd get mem fail\n");
+				goto free_cmdbufs;
+			}
+			/* check mem boundary */
+			if (!m->vaddr || ksubcmd->cmdbufs[j].size != m->size) {
+				dev_err(dev, "size of cmdbuf is invalid\n");
+				goto free_cmdbufs;
+			}
+
+			/* cmdbuf copy in */
+			if (ksubcmd->cmdbufs[j].direction != MDW_CB_OUT)
+				memcpy(c->cmdbufs->vaddr + ofs,
+				       m->vaddr,
+				       ksubcmd->cmdbufs[j].size);
+
+			/* record buffer info */
+			ksubcmd->ori_cbs[j] = m;
+			ksubcmd->kvaddrs[j] =
+				(u64)(c->cmdbufs->vaddr + ofs);
+			ksubcmd->daddrs[j] =
+				(u64)(c->cmdbufs->device_va + ofs);
+			ofs += ksubcmd->cmdbufs[j].size;
+		}
+	}
+	/* flush cmdbufs */
+	apusys_mem_flush_kva(c->cmdbufs->vaddr, c->cmdbufs->size);
+
+	ret = 0;
+	goto out;
+
+free_cmdbufs:
+	mdw_cmd_put_cmdbufs(mpriv, c);
+out:
+	return ret;
+}
+
+static unsigned int mdw_cmd_create_infos(struct mdw_fpriv *mpriv,
+					 struct mdw_cmd *c)
+{
+	unsigned int i = 0, j = 0, total_size = 0;
+	struct mdw_subcmd_exec_info *sc_einfo = NULL;
+	int ret = -ENOMEM;
+
+	c->einfos = c->exec_infos->vaddr;
+	if (!c->einfos) {
+		dev_err(mpriv->mdev->dev, "invalid exec info addr\n");
+		return -EINVAL;
+	}
+	sc_einfo = &c->einfos->sc;
+
+	for (i = 0; i < c->num_subcmds; i++) {
+		c->ksubcmds[i].info = &c->subcmds[i];
+
+		c->ksubcmds[i].ori_cbs = kvzalloc(c->subcmds[i].num_cmdbufs *
+			sizeof(c->ksubcmds[i].ori_cbs), GFP_KERNEL);
+		if (!c->ksubcmds[i].ori_cbs)
+			goto free_cmdbufs;
+
+		c->ksubcmds[i].kvaddrs = kvzalloc(c->subcmds[i].num_cmdbufs *
+			sizeof(*c->ksubcmds[i].kvaddrs), GFP_KERNEL);
+		if (!c->ksubcmds[i].kvaddrs)
+			goto free_cmdbufs;
+
+		c->ksubcmds[i].daddrs = kvzalloc(c->subcmds[i].num_cmdbufs *
+			sizeof(*c->ksubcmds[i].daddrs), GFP_KERNEL);
+		if (!c->ksubcmds[i].daddrs)
+			goto free_cmdbufs;
+
+		c->ksubcmds[i].cmdbufs = kvzalloc(c->subcmds[i].num_cmdbufs *
+			sizeof(*c->ksubcmds[i].cmdbufs), GFP_KERNEL);
+		if (!c->ksubcmds[i].cmdbufs)
+			goto free_cmdbufs;
+
+		if (copy_from_user(c->ksubcmds[i].cmdbufs,
+				   (void __user *)c->subcmds[i].cmdbufs,
+				   c->subcmds[i].num_cmdbufs *
+				   sizeof(*c->ksubcmds[i].cmdbufs)))
+			goto free_cmdbufs;
+
+		c->ksubcmds[i].sc_einfo = &sc_einfo[i];
+
+		/* accumulate cmdbuf size with alignment */
+		for (j = 0; j < c->subcmds[i].num_cmdbufs; j++) {
+			c->num_cmdbufs++;
+			if (c->ksubcmds[i].cmdbufs[j].align)
+				total_size =
+				MDW_ALIGN(total_size,
+					  c->ksubcmds[i].cmdbufs[j].align) +
+					  c->ksubcmds[i].cmdbufs[j].size;
+			else
+				total_size += c->ksubcmds[i].cmdbufs[j].size;
+		}
+	}
+	c->size_cmdbufs = total_size;
+
+	ret = mdw_cmd_get_cmdbufs(mpriv, c);
+	if (ret)
+		goto free_cmdbufs;
+
+	goto out;
+
+free_cmdbufs:
+	for (i = 0; i < c->num_subcmds; i++) {
+		/* free dvaddrs */
+		if (c->ksubcmds[i].daddrs) {
+			kvfree(c->ksubcmds[i].daddrs);
+			c->ksubcmds[i].daddrs = NULL;
+		}
+		/* free kvaddrs */
+		if (c->ksubcmds[i].kvaddrs) {
+			kvfree(c->ksubcmds[i].kvaddrs);
+			c->ksubcmds[i].kvaddrs = NULL;
+		}
+		/* free ori kvas */
+		if (c->ksubcmds[i].ori_cbs) {
+			kvfree(c->ksubcmds[i].ori_cbs);
+			c->ksubcmds[i].ori_cbs = NULL;
+		}
+		/* free cmdbufs */
+		if (c->ksubcmds[i].cmdbufs) {
+			kvfree(c->ksubcmds[i].cmdbufs);
+			c->ksubcmds[i].cmdbufs = NULL;
+		}
+	}
+
+out:
+	return ret;
+}
+
+static void mdw_cmd_delete_infos(struct mdw_fpriv *mpriv, struct mdw_cmd *c)
+{
+	unsigned int i = 0;
+
+	mdw_cmd_put_cmdbufs(mpriv, c);
+
+	for (i = 0; i < c->num_subcmds; i++) {
+		/* free dvaddrs */
+		if (c->ksubcmds[i].daddrs) {
+			kvfree(c->ksubcmds[i].daddrs);
+			c->ksubcmds[i].daddrs = NULL;
+		}
+		/* free kvaddrs */
+		if (c->ksubcmds[i].kvaddrs) {
+			kvfree(c->ksubcmds[i].kvaddrs);
+			c->ksubcmds[i].kvaddrs = NULL;
+		}
+		/* free ori kvas */
+		if (c->ksubcmds[i].ori_cbs) {
+			kvfree(c->ksubcmds[i].ori_cbs);
+			c->ksubcmds[i].ori_cbs = NULL;
+		}
+		/* free cmdbufs */
+		if (c->ksubcmds[i].cmdbufs) {
+			kvfree(c->ksubcmds[i].cmdbufs);
+			c->ksubcmds[i].cmdbufs = NULL;
+		}
+	}
+}
+
+static const char *mdw_fence_get_driver_name(struct dma_fence *fence)
+{
+	return "apu_mdw";
+}
+
+static const char *mdw_fence_get_timeline_name(struct dma_fence *fence)
+{
+	struct mdw_fence *f =
+		container_of(fence, struct mdw_fence, base_fence);
+
+	return dev_name(f->mdev->misc_dev.this_device);
+}
+
+static bool mdw_fence_enable_signaling(struct dma_fence *fence)
+{
+	return true;
+}
+
+static void mdw_fence_release(struct dma_fence *fence)
+{
+	struct mdw_fence *mf =
+		container_of(fence, struct mdw_fence, base_fence);
+
+	kvfree(mf);
+}
+
+static const struct dma_fence_ops mdw_fence_ops = {
+	.get_driver_name =  mdw_fence_get_driver_name,
+	.get_timeline_name =  mdw_fence_get_timeline_name,
+	.enable_signaling =  mdw_fence_enable_signaling,
+	.wait = dma_fence_default_wait,
+	.release =  mdw_fence_release,
+};
+
+static int mdw_fence_init(struct mdw_cmd *c)
+{
+	int ret = 0;
+
+	c->fence = kvzalloc(sizeof(*c->fence), GFP_KERNEL);
+	if (!c->fence)
+		return -ENOMEM;
+
+	c->fence->mdev = c->mpriv->mdev;
+	dma_fence_init(&c->fence->base_fence, &mdw_fence_ops,
+		       &c->fence->lock, 0, 0);
+	spin_lock_init(&c->fence->lock);
+
+	return ret;
+}
+
+static int mdw_cmd_run(struct mdw_fpriv *mpriv, struct mdw_cmd *c)
+{
+	struct mdw_device *mdev = mpriv->mdev;
+	int ret = 0;
+
+	ktime_get_ts64(&c->start_ts);
+	ret = mdev->dev_funcs->run_cmd(mpriv, c);
+	if (ret) {
+		dev_err(mpriv->mdev->dev, "run cmd(0x%llx/0x%llx) fail(%d)\n",
+			(u64)c->mpriv, c->kid, ret);
+
+		dma_fence_set_error(&c->fence->base_fence, ret);
+		dma_fence_signal(&c->fence->base_fence);
+		dma_fence_put(&c->fence->base_fence);
+	}
+
+	return ret;
+}
+
+static void mdw_cmd_delete(struct mdw_cmd *c)
+{
+	struct mdw_fpriv *mpriv = c->mpriv;
+
+	mdw_cmd_delete_infos(c->mpriv, c);
+	mdw_cmd_put_mem(c->exec_infos);
+	kvfree(c->adj_matrix);
+	kvfree(c->ksubcmds);
+	kvfree(c->subcmds);
+	mutex_lock(&mpriv->mtx);
+	list_del(&c->u_item);
+	mutex_unlock(&mpriv->mtx);
+	kvfree(c);
+
+	mpriv->put(mpriv);
+}
+
+static int mdw_cmd_complete(struct mdw_cmd *c, int ret)
+{
+	struct dma_fence *f = &c->fence->base_fence;
+
+	ktime_get_ts64(&c->end_ts);
+	c->einfos->c.total_us =
+		(c->end_ts.tv_sec - c->start_ts.tv_sec) * 1000000;
+	c->einfos->c.total_us +=
+		((c->end_ts.tv_nsec - c->start_ts.tv_nsec) / 1000);
+
+	/* check subcmds return value */
+	if (c->einfos->c.sc_rets)
+		if (!ret)
+			ret = -EIO;
+
+	c->einfos->c.ret = ret;
+
+	if (ret)
+		pr_debug("cmd(%p/0x%llx) ret(%d/0x%llx) time(%llu) pid(%d/%d)\n",
+			 c->mpriv, c->kid, ret, c->einfos->c.sc_rets,
+			 c->einfos->c.total_us, c->pid, c->tgid);
+
+	mdw_cmd_put_cmdbufs(c->mpriv, c);
+	if (ret)
+		dma_fence_set_error(&c->fence->base_fence, ret);
+
+	dma_fence_signal(f);
+	mdw_cmd_delete(c);
+	dma_fence_put(f);
+
+	return 0;
+}
+
+static void mdw_cmd_trigger_func(struct work_struct *wk)
+{
+	struct mdw_cmd *c =
+		container_of(wk, struct mdw_cmd, t_wk);
+
+	if (c->wait_fence) {
+		dma_fence_wait(c->wait_fence, false);
+		dma_fence_put(c->wait_fence);
+	}
+
+	mdw_cmd_run(c->mpriv, c);
+}
+
+static int mdw_cmd_sanity_check(struct mdw_cmd *c)
+{
+	if (c->priority >= MDW_PRIORITY_MAX ||
+	    c->num_subcmds > MDW_SUBCMD_MAX) {
+		pr_err("cmd invalid (0x%llx/0x%llx/0x%llx)(%u/%u)\n",
+		       c->uid, (u64)c->mpriv, c->kid,
+		       c->priority, c->num_subcmds);
+		return -EINVAL;
+	}
+
+	if (c->exec_infos->size != sizeof(struct mdw_cmd_exec_info) +
+		c->num_subcmds * sizeof(struct mdw_subcmd_exec_info)) {
+		pr_err("cmd invalid (0x%llx/0x%llx/0x%llx) einfo(%u/%lu)\n",
+		       c->uid, (u64)c->mpriv, c->kid,
+		       c->exec_infos->size,
+		       sizeof(struct mdw_cmd_exec_info) +
+		       c->num_subcmds * sizeof(struct mdw_subcmd_exec_info));
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int mdw_cmd_sc_sanity_check(struct mdw_cmd *c)
+{
+	unsigned int i = 0;
+
+	for (i = 0; i < c->num_subcmds; i++) {
+		if (c->subcmds[i].type >= MDW_DEV_MAX ||
+		    c->subcmds[i].vlm_ctx_id >= MDW_SUBCMD_MAX ||
+		    c->subcmds[i].boost > MDW_BOOST_MAX ||
+		    c->subcmds[i].pack_id >= MDW_SUBCMD_MAX) {
+			pr_err("subcmd(%u) invalid (%u/%u/%u)\n",
+			       i, c->subcmds[i].type,
+			       c->subcmds[i].boost,
+			       c->subcmds[i].pack_id);
+			return -EINVAL;
+		}
+	}
+
+	return 0;
+}
+
+static struct mdw_cmd *mdw_cmd_create(struct mdw_fpriv *mpriv,
+				      union mdw_cmd_args *args)
+{
+	struct mdw_cmd_in *in = (struct mdw_cmd_in *)args;
+	struct mdw_cmd *c = NULL;
+
+	if (in->exec.num_subcmds > MDW_SUBCMD_MAX) {
+		dev_err(mpriv->mdev->dev, "too much subcmds(%u)\n",
+			in->exec.num_subcmds);
+		goto out;
+	}
+
+	c = kvzalloc(sizeof(*c), GFP_KERNEL);
+	if (!c)
+		goto out;
+
+	c->mpriv = mpriv;
+	c->pid = current->pid;
+	c->tgid = current->tgid;
+	c->kid = (u64)c;
+	c->uid = in->exec.uid;
+	c->usr_id = in->exec.usr_id;
+	c->priority = in->exec.priority;
+	c->hardlimit = in->exec.hardlimit;
+	c->softlimit = in->exec.softlimit;
+	c->power_save = in->exec.power_save;
+	c->power_plcy = in->exec.power_plcy;
+	c->power_dtime = in->exec.power_dtime;
+	c->app_type = in->exec.app_type;
+	c->num_subcmds = in->exec.num_subcmds;
+	c->exec_infos = mdw_cmd_get_mem(in->exec.exec_infos);
+	if (!c->exec_infos) {
+		dev_err(mpriv->mdev->dev, "get exec info fail\n");
+		goto free_cmd;
+	}
+
+	if (mdw_cmd_sanity_check(c)) {
+		dev_err(mpriv->mdev->dev, "cmd sanity check fail\n");
+		goto free_cmd;
+	}
+
+	c->subcmds = kvzalloc(c->num_subcmds * sizeof(*c->subcmds), GFP_KERNEL);
+	if (!c->subcmds)
+		goto free_cmd;
+	if (copy_from_user(c->subcmds, (void __user *)in->exec.subcmd_infos,
+			   c->num_subcmds * sizeof(*c->subcmds))) {
+		dev_err(mpriv->mdev->dev, "copy subcmds fail\n");
+		goto free_subcmds;
+	}
+	if (mdw_cmd_sc_sanity_check(c)) {
+		dev_err(mpriv->mdev->dev, "sc sanity check fail\n");
+		goto free_subcmds;
+	}
+
+	c->ksubcmds = kvzalloc(c->num_subcmds * sizeof(*c->ksubcmds),
+			       GFP_KERNEL);
+	if (!c->ksubcmds)
+		goto free_subcmds;
+
+	/* adj matrix */
+	c->adj_matrix = kvzalloc(c->num_subcmds *
+		c->num_subcmds * sizeof(u8), GFP_KERNEL);
+	if (!c->adj_matrix)
+		goto free_ksubcmds;
+	if (copy_from_user(c->adj_matrix, (void __user *)in->exec.adj_matrix,
+			   (c->num_subcmds * c->num_subcmds * sizeof(u8)))
+			   ) {
+		dev_err(mpriv->mdev->dev, "copy adj matrix fail\n");
+		goto free_adj;
+	}
+	if (mdw_cmd_create_infos(mpriv, c)) {
+		dev_err(mpriv->mdev->dev, "create cmd info fail\n");
+		goto put_execinfo;
+	}
+	if (mdw_fence_init(c)) {
+		dev_err(mpriv->mdev->dev, "cmd init fence fail\n");
+		goto delete_infos;
+	}
+
+	c->mpriv->get(c->mpriv);
+	c->complete = mdw_cmd_complete;
+	INIT_WORK(&c->t_wk, &mdw_cmd_trigger_func);
+	mutex_lock(&mpriv->mtx);
+	list_add_tail(&c->u_item, &mpriv->cmds);
+	mutex_unlock(&mpriv->mtx);
+
+	goto out;
+
+delete_infos:
+	mdw_cmd_delete_infos(mpriv, c);
+put_execinfo:
+	mdw_cmd_put_mem(c->exec_infos);
+free_adj:
+	kvfree(c->adj_matrix);
+free_ksubcmds:
+	kvfree(c->ksubcmds);
+free_subcmds:
+	kvfree(c->subcmds);
+free_cmd:
+	kvfree(c);
+	c = NULL;
+out:
+	return c;
+}
+
+static int mdw_cmd_ioctl_run(struct mdw_fpriv *mpriv, union mdw_cmd_args *args)
+{
+	struct mdw_cmd_in *in = (struct mdw_cmd_in *)args;
+	struct mdw_cmd *c = NULL;
+	struct sync_file *sync_file = NULL;
+	int ret = 0, fd = 0, wait_fd = 0;
+
+	wait_fd = in->exec.fence;
+
+	c = mdw_cmd_create(mpriv, args);
+	if (!c) {
+		dev_err(mpriv->mdev->dev, "create cmd fail\n");
+		ret = -EINVAL;
+		goto out;
+	}
+	memset(args, 0, sizeof(*args));
+
+	fd = get_unused_fd_flags(O_CLOEXEC);
+	if (fd < 0) {
+		dev_err(mpriv->mdev->dev, "get unused fd fail\n");
+		ret = -EINVAL;
+		goto delete_cmd;
+	}
+	sync_file = sync_file_create(&c->fence->base_fence);
+	if (!sync_file) {
+		dev_err(mpriv->mdev->dev, "create sync file fail\n");
+		ret = -ENOMEM;
+		goto put_file;
+	}
+
+	/* check wait fence from other module */
+	c->wait_fence = sync_file_get_fence(wait_fd);
+	if (!c->wait_fence)
+		ret = mdw_cmd_run(mpriv, c);
+	else
+		schedule_work(&c->t_wk);
+
+	if (ret)
+		goto put_file;
+
+	fd_install(fd, sync_file->file);
+	args->out.exec.fence = fd;
+	goto out;
+
+delete_cmd:
+	mdw_cmd_delete(c);
+put_file:
+	put_unused_fd(fd);
+out:
+
+	return ret;
+}
+
+int mdw_cmd_ioctl(struct mdw_fpriv *mpriv, void *data)
+{
+	union mdw_cmd_args *args = (union mdw_cmd_args *)data;
+	int ret = 0;
+
+	switch (args->in.op) {
+	case MDW_CMD_IOCTL_RUN:
+		ret = mdw_cmd_ioctl_run(mpriv, args);
+		break;
+
+	default:
+		ret = -EINVAL;
+		break;
+	}
+
+	return ret;
+}
diff --git a/drivers/soc/mediatek/apusys/mdw-drv.c b/drivers/soc/mediatek/apusys/mdw-drv.c
new file mode 100644
index 000000000000..9c01a383a080
--- /dev/null
+++ b/drivers/soc/mediatek/apusys/mdw-drv.c
@@ -0,0 +1,211 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2021 MediaTek Inc.
+ */
+
+#include <linux/dma-direct.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/rpmsg.h>
+#include <linux/slab.h>
+#include <linux/types.h>
+
+#include "apu-core.h"
+#include "mdw.h"
+#include "mdw-mem.h"
+
+int mdw_dev_init(struct mdw_device *mdev)
+{
+	int ret = -ENODEV;
+
+	mdw_rv_set_func(mdev);
+
+	if (mdev->dev_funcs)
+		ret = mdev->dev_funcs->late_init(mdev);
+
+	return ret;
+}
+
+void mdw_dev_deinit(struct mdw_device *mdev)
+{
+	if (mdev->dev_funcs) {
+		mdev->dev_funcs->late_deinit(mdev);
+		mdev->dev_funcs = NULL;
+	}
+}
+
+static void mdw_drv_priv_delete(struct kref *ref)
+{
+	struct mdw_fpriv *mpriv =
+			container_of(ref, struct mdw_fpriv, ref);
+
+	kfree(mpriv);
+}
+
+static void mdw_drv_priv_get(struct mdw_fpriv *mpriv)
+{
+	kref_get(&mpriv->ref);
+}
+
+static void mdw_drv_priv_put(struct mdw_fpriv *mpriv)
+{
+	kref_put(&mpriv->ref, mdw_drv_priv_delete);
+}
+
+static int mdw_drv_open(struct inode *inode, struct file *filp)
+{
+	struct mdw_device *mdev;
+	struct mdw_fpriv *mpriv = NULL;
+	int ret = 0;
+
+	mdev = container_of(filp->private_data, struct mdw_device, misc_dev);
+	if (!mdev) {
+		pr_warn("apusys/mdw: apu mdw no dev\n");
+		return -ENODEV;
+	}
+
+	if (!mdev->inited) {
+		dev_dbg(mdev->dev, "apu mdw dev not init");
+		return -EBUSY;
+	}
+
+	if (!atomic_read(&mdev->sw_inited)) {
+		ret = mdev->dev_funcs->sw_init(mdev);
+		if (ret) {
+			dev_err(mdev->dev, "mdw sw init fail(%d)\n", ret);
+			return -EFAULT;
+		}
+		atomic_inc(&mdev->sw_inited);
+	}
+
+	mpriv = kzalloc(sizeof(*mpriv), GFP_KERNEL);
+	if (!mpriv)
+		return -ENOMEM;
+
+	mpriv->mdev = mdev;
+	filp->private_data = mpriv;
+	mutex_init(&mpriv->mtx);
+	INIT_LIST_HEAD(&mpriv->mems);
+	INIT_LIST_HEAD(&mpriv->cmds);
+
+	mpriv->get = mdw_drv_priv_get;
+	mpriv->put = mdw_drv_priv_put;
+	kref_init(&mpriv->ref);
+
+	return ret;
+}
+
+static int mdw_drv_close(struct inode *inode, struct file *filp)
+{
+	struct mdw_fpriv *mpriv = NULL;
+
+	mpriv = filp->private_data;
+	mutex_lock(&mpriv->mtx);
+	mdw_mem_mpriv_release(mpriv);
+	mutex_unlock(&mpriv->mtx);
+	mpriv->put(mpriv);
+
+	return 0;
+}
+
+static const struct file_operations mdw_fops = {
+	.owner = THIS_MODULE,
+	.open = mdw_drv_open,
+	.release = mdw_drv_close,
+	.unlocked_ioctl = mdw_ioctl,
+	.compat_ioctl = mdw_ioctl,
+};
+
+static int mdw_rpmsg_probe(struct rpmsg_device *rpdev)
+{
+	struct device *dev = &rpdev->dev;
+	struct mdw_device *mdev = NULL;
+	int ret = 0;
+
+	mdev = kzalloc(sizeof(*mdev), GFP_KERNEL);
+	if (!mdev)
+		return -ENOMEM;
+
+	mdev->rpdev = rpdev;
+	mdev->dev = dev;
+	mdev->dma_dev = dev->parent;
+	mdev->misc_dev.minor = MISC_DYNAMIC_MINOR;
+	mdev->misc_dev.name = MDW_NAME;
+	mdev->misc_dev.fops = &mdw_fops;
+	ret = misc_register(&mdev->misc_dev);
+
+	if (ret)
+		goto out;
+
+	dev_set_drvdata(dev, mdev);
+
+	ret = mdw_mem_init(mdev);
+	if (ret)
+		goto misc_unreg;
+#ifdef CONFIG_DEBUG_FS
+	ret = mdw_sysfs_init(mdev);
+	if (ret)
+		goto deinit_mem;
+#endif
+	ret = mdw_dev_init(mdev);
+	if (ret)
+		goto deinit_dbg;
+
+	goto out;
+
+#ifdef CONFIG_DEBUG_FS
+deinit_dbg:
+	mdw_sysfs_deinit(mdev);
+#endif
+deinit_mem:
+	mdw_mem_deinit(mdev);
+misc_unreg:
+	misc_deregister(&mdev->misc_dev);
+out:
+	return ret;
+}
+
+static void mdw_rpmsg_remove(struct rpmsg_device *rpdev)
+{
+	struct mdw_device *mdev = dev_get_drvdata(&rpdev->dev);
+
+	mdev->dev_funcs->sw_deinit(mdev);
+	mdw_dev_deinit(mdev);
+#ifdef CONFIG_DEBUG_FS
+	mdw_sysfs_deinit(mdev);
+#endif
+	mdw_mem_deinit(mdev);
+	misc_deregister(&mdev->misc_dev);
+	kfree(mdev);
+}
+
+static const struct of_device_id mdw_rpmsg_of_match[] = {
+	{ .compatible = "mediatek,apu-mdw-rpmsg", },
+	{ },
+};
+
+static struct rpmsg_driver mdw_rpmsg_driver = {
+	.drv	= {
+		.name	= "apu-mdw-rpmsg",
+		.owner = THIS_MODULE,
+		.of_match_table = mdw_rpmsg_of_match,
+	},
+	.probe = mdw_rpmsg_probe,
+	.remove = mdw_rpmsg_remove,
+};
+
+int mdw_init(struct apusys_core_info *info)
+{
+	int ret = 0;
+
+	ret = register_rpmsg_driver(&mdw_rpmsg_driver);
+	if (ret)
+		pr_err("Failed to register apu mdw rpmsg driver\n");
+
+	return ret;
+}
+
+void mdw_exit(void)
+{
+	unregister_rpmsg_driver(&mdw_rpmsg_driver);
+}
diff --git a/drivers/soc/mediatek/apusys/mdw-ioctl.c b/drivers/soc/mediatek/apusys/mdw-ioctl.c
new file mode 100644
index 000000000000..4e543c257f1b
--- /dev/null
+++ b/drivers/soc/mediatek/apusys/mdw-ioctl.c
@@ -0,0 +1,331 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2021 MediaTek Inc.
+ */
+
+#include <linux/highmem.h>
+#include <linux/slab.h>
+#include <linux/uaccess.h>
+
+#include "mdw-ioctl.h"
+#include "mdw.h"
+#include "mdw-mem.h"
+
+static int mdw_mem_ioctl_alloc(struct mdw_fpriv *mpriv,
+			       union mdw_mem_args *args)
+{
+	struct mdw_mem_in *in = (struct mdw_mem_in *)args;
+	struct mdw_mem *m = NULL;
+	int ret = 0;
+
+	if (!in->alloc.size) {
+		dev_err(mpriv->mdev->dev, "invalid size(%u)\n", in->alloc.size);
+		return -EINVAL;
+	}
+
+	m = mdw_mem_alloc(mpriv, in->alloc.size, in->alloc.align,
+			  in->alloc.flags, MDW_MEM_TYPE_ALLOC);
+	memset(args, 0, sizeof(*args));
+	if (!m) {
+		dev_err(mpriv->mdev->dev, "mdw_mem_alloc fail\n");
+		return -ENOMEM;
+	}
+
+	args->out.alloc.handle = m->handle;
+
+	mutex_lock(&mpriv->mtx);
+	list_add_tail(&m->u_item, &mpriv->mems);
+	mutex_unlock(&mpriv->mtx);
+
+	return ret;
+}
+
+static int mdw_mem_ioctl_map(struct mdw_fpriv *mpriv,
+			     union mdw_mem_args *args)
+{
+	struct mdw_mem_in *in = (struct mdw_mem_in *)args;
+	struct mdw_mem *m = NULL;
+	int ret = -ENOMEM, handle = (int)in->map.handle;
+	u32 size = in->map.size;
+
+	memset(args, 0, sizeof(*args));
+
+	mutex_lock(&mpriv->mtx);
+	m = mdw_mem_get(handle);
+	if (!m) {
+		/* mem not alloc from apu, import buffer */
+		m = mdw_mem_import(mpriv, handle, size);
+		if (m)
+			ret = 0;
+		goto out;
+	}
+
+	/* already exist */
+	ret = mdw_mem_map(m);
+	if (ret)
+		dev_err(mpriv->mdev->dev, "map fail\n");
+
+out:
+	if (m)
+		args->out.map.device_va = m->device_va;
+	mutex_unlock(&mpriv->mtx);
+
+	return ret;
+}
+
+static int mdw_mem_ioctl_unmap(struct mdw_fpriv *mpriv,
+			       union mdw_mem_args *args)
+{
+	struct mdw_mem_in *in = (struct mdw_mem_in *)args;
+	struct mdw_mem *m = NULL;
+	int ret = -ENOMEM, handle = in->unmap.handle;
+
+	memset(args, 0, sizeof(*args));
+
+	mutex_lock(&mpriv->mtx);
+	m = mdw_mem_get(handle);
+	if (!m)
+		goto out;
+
+	ret = mdw_mem_unmap(m);
+
+out:
+	mutex_unlock(&mpriv->mtx);
+
+	return ret;
+}
+
+static int mdw_mem_ioctl_flush(struct mdw_fpriv *mpriv,
+			       union mdw_mem_args *args)
+{
+	struct mdw_mem_in *in = (struct mdw_mem_in *)args;
+	struct mdw_mem *m = NULL;
+	int ret = -ENOMEM, handle = in->flush.handle;
+
+	memset(args, 0, sizeof(*args));
+
+	mutex_lock(&mpriv->mtx);
+	m = mdw_mem_get(handle);
+	if (!m)
+		goto out;
+
+	ret = mdw_mem_flush(m);
+out:
+	mutex_unlock(&mpriv->mtx);
+	return ret;
+}
+
+static int mdw_mem_ioctl_invalidate(struct mdw_fpriv *mpriv,
+				    union mdw_mem_args *args)
+{
+	struct mdw_mem_in *in = (struct mdw_mem_in *)args;
+	struct mdw_mem *m = NULL;
+	int ret = -ENOMEM, handle = in->invalidate.handle;
+
+	memset(args, 0, sizeof(*args));
+
+	mutex_lock(&mpriv->mtx);
+	m = mdw_mem_get(handle);
+	if (!m)
+		goto out;
+
+	ret = mdw_mem_invalidate(m);
+out:
+	mutex_unlock(&mpriv->mtx);
+	return ret;
+}
+
+static int mdw_mem_ioctl(struct mdw_fpriv *mpriv, void *data)
+{
+	union mdw_mem_args *args = (union mdw_mem_args *)data;
+	int ret = 0;
+
+	switch (args->in.op) {
+	case MDW_MEM_IOCTL_ALLOC:
+		ret = mdw_mem_ioctl_alloc(mpriv, args);
+		break;
+
+	case MDW_MEM_IOCTL_MAP:
+		ret = mdw_mem_ioctl_map(mpriv, args);
+		break;
+
+	case MDW_MEM_IOCTL_FREE:
+		pr_warn("not suppot free\n");
+		ret = -EFAULT;
+		break;
+
+	case MDW_MEM_IOCTL_UNMAP:
+		ret = mdw_mem_ioctl_unmap(mpriv, args);
+		break;
+
+	case MDW_MEM_IOCTL_FLUSH:
+		ret = mdw_mem_ioctl_flush(mpriv, args);
+		break;
+
+	case MDW_MEM_IOCTL_INVALIDATE:
+		ret = mdw_mem_ioctl_invalidate(mpriv, args);
+		break;
+
+	default:
+		ret = -EINVAL;
+		break;
+	}
+
+	return ret;
+}
+
+static int mdw_hs_ioctl(struct mdw_fpriv *mpriv, void *data)
+{
+	union mdw_hs_args *args = (union mdw_hs_args *)data;
+	struct mdw_device *mdev = mpriv->mdev;
+	unsigned int type = 0;
+	int ret = 0;
+
+	switch (args->in.op) {
+	case MDW_HS_IOCTL_OP_BASIC:
+		memset(args, 0, sizeof(*args));
+		args->out.basic.version = mdev->uapi_ver;
+		memcpy(&args->out.basic.dev_bitmask,
+		       mdev->dev_mask, sizeof(args->out.basic.dev_bitmask));
+		args->out.basic.meta_size = MDW_DEV_META_SIZE;
+		args->out.basic.vlm_start = mdev->vlm_start;
+		args->out.basic.vlm_size = mdev->vlm_size;
+		break;
+
+	case MDW_HS_IOCTL_OP_DEV:
+		type = args->in.dev.type;
+		if (type >= MDW_DEV_MAX) {
+			ret = -EINVAL;
+			break;
+		}
+
+		if (!mdev->dinfos[type]) {
+			ret = -EINVAL;
+			break;
+		}
+
+		memset(args, 0, sizeof(*args));
+		args->out.dev.type = type;
+		args->out.dev.num = mdev->dinfos[type]->num;
+		memcpy(args->out.dev.meta, mdev->dinfos[type]->meta,
+		       sizeof(args->out.dev.meta));
+		break;
+
+	default:
+		dev_err(mpriv->mdev->dev,
+			"invalid handshake op code(%d)\n", args->in.op);
+		ret = -EINVAL;
+		break;
+	}
+
+	return ret;
+}
+
+static int mdw_util_ioctl(struct mdw_fpriv *mpriv, void *data)
+{
+	union mdw_util_args *args = (union mdw_util_args *)data;
+	struct mdw_util_in *in = (struct mdw_util_in *)args;
+	struct mdw_device *mdev = mpriv->mdev;
+	void *mem_ucmd = NULL;
+	int ret = 0;
+
+	switch (args->in.op) {
+	case MDW_UTIL_IOCTL_SETPOWER:
+		ret = mdev->dev_funcs->set_power(mdev, in->power.dev_type,
+			in->power.core_idx, in->power.boost);
+		break;
+
+	case MDW_UTIL_IOCTL_UCMD:
+		if (!in->ucmd.size || !in->ucmd.handle) {
+			dev_err(mpriv->mdev->dev, "invalid ucmd param\n");
+			ret = -EINVAL;
+			break;
+		}
+
+		mem_ucmd = vzalloc(args->in.ucmd.size);
+		if (!mem_ucmd) {
+			ret = -ENOMEM;
+			break;
+		}
+
+		if (copy_from_user(mem_ucmd,
+				   (void __user *)in->ucmd.handle,
+				   in->ucmd.size)) {
+			ret = -EFAULT;
+			goto free_ucmd;
+		}
+		ret = mdev->dev_funcs->ucmd(mdev, in->ucmd.dev_type,
+			mem_ucmd, in->ucmd.size);
+		if (ret) {
+			dev_err(mpriv->mdev->dev, "dev(%d) ucmd fail\n",
+				in->ucmd.dev_type);
+			goto free_ucmd;
+		}
+
+		if (copy_to_user((void __user *)in->ucmd.handle,
+				 mem_ucmd, in->ucmd.size))
+			ret = -EFAULT;
+
+free_ucmd:
+		vfree(mem_ucmd);
+		break;
+
+	default:
+		dev_err(mpriv->mdev->dev, "invalid util op code(%d)\n",
+			args->in.op);
+		ret = -EINVAL;
+		break;
+	}
+
+	return ret;
+}
+
+long mdw_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
+{
+	int ret = 0;
+	unsigned int usize = 0;
+	void *kdata = NULL;
+	struct mdw_fpriv *mpriv = filp->private_data;
+
+	usize = _IOC_SIZE(cmd);
+	kdata = kzalloc(usize, GFP_KERNEL);
+	if (!kdata)
+		return -ENOMEM;
+
+	if (cmd & IOC_IN) {
+		if (copy_from_user(kdata, (void __user *)arg, usize)) {
+			ret = -EFAULT;
+			goto out;
+		}
+	}
+
+	switch (cmd) {
+	case APU_MDW_IOCTL_HANDSHAKE:
+		ret = mdw_hs_ioctl(mpriv, kdata);
+		break;
+	case APU_MDW_IOCTL_MEM:
+		ret = mdw_mem_ioctl(mpriv, kdata);
+		break;
+	case APU_MDW_IOCTL_CMD:
+		ret = mdw_cmd_ioctl(mpriv, kdata);
+		break;
+	case APU_MDW_IOCTL_UTIL:
+		ret = mdw_util_ioctl(mpriv, kdata);
+		break;
+	default:
+		ret = -EFAULT;
+		goto out;
+	}
+
+	if (cmd & IOC_OUT) {
+		if (copy_to_user((void __user *)arg, kdata, usize)) {
+			ret = -EFAULT;
+			goto out;
+		}
+	}
+
+out:
+	kfree(kdata);
+
+	return ret;
+}
diff --git a/drivers/soc/mediatek/apusys/mdw-ioctl.h b/drivers/soc/mediatek/apusys/mdw-ioctl.h
new file mode 100644
index 000000000000..1f735b400f4b
--- /dev/null
+++ b/drivers/soc/mediatek/apusys/mdw-ioctl.h
@@ -0,0 +1,256 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2021 MediaTek Inc.
+ */
+
+#ifndef __MTK_APU_IOCTL_H__
+#define __MTK_APU_IOCTL_H__
+
+#include <linux/ioctl.h>
+#include <linux/types.h>
+
+#define APUSYS_MAGICNO 'A'
+
+enum mdw_hs_ioctl_op {
+	MDW_HS_IOCTL_OP_BASIC,
+	MDW_HS_IOCTL_OP_DEV,
+};
+
+struct mdw_hs_in {
+	enum mdw_hs_ioctl_op op;
+	u64 flags;
+	union {
+		struct {
+			u32 type;
+		} dev;
+	};
+};
+
+#define MDW_DEV_META_SIZE (32)
+
+struct mdw_hs_out {
+	union {
+		struct {
+			u64 version;
+			u64 dev_bitmask;
+			u64 flags;
+			u32 meta_size;
+			u64 vlm_start;
+			u32 vlm_size;
+		} basic;
+
+		struct {
+			u32 type;
+			u32 num;
+			char meta[MDW_DEV_META_SIZE];
+		} dev;
+	};
+};
+
+union mdw_hs_args {
+	struct mdw_hs_in in;
+	struct mdw_hs_out out;
+};
+
+#define APU_MDW_IOCTL_HANDSHAKE \
+	_IOWR(APUSYS_MAGICNO, 32, union mdw_hs_args)
+
+enum mdw_mem_ioctl_op {
+	MDW_MEM_IOCTL_ALLOC,
+	MDW_MEM_IOCTL_FREE,
+	MDW_MEM_IOCTL_MAP,
+	MDW_MEM_IOCTL_UNMAP,
+	MDW_MEM_IOCTL_FLUSH,
+	MDW_MEM_IOCTL_INVALIDATE,
+};
+
+enum MDW_MEM_IOCTL_ALLOC_BITMASK {
+	MDW_MEM_IOCTL_ALLOC_CACHEABLE,
+	MDW_MEM_IOCTL_ALLOC_32BIT,
+	MDW_MEM_IOCTL_ALLOC_HIGHADDR,
+};
+
+struct mdw_mem_in {
+	enum mdw_mem_ioctl_op op;
+	u64 flags;
+	union {
+		/* alloc */
+		struct {
+			u32 size;
+			u32 align;
+			u64 flags; /* enum MDW_MEM_IOCTL_ALLOC_BITMASK */
+		} alloc;
+		struct {
+			u64 handle;
+		} free;
+
+		/* map */
+		struct {
+			u64 handle;
+			u32 size;
+		} map;
+		struct {
+			u64 handle;
+		} unmap;
+
+		/* cache operation */
+		struct {
+			u64 handle;
+		} flush;
+		struct {
+			u64 handle;
+		} invalidate;
+	};
+};
+
+struct mdw_mem_out {
+	union {
+		struct {
+			u64 handle;
+		} alloc;
+		struct {
+			u64 device_va;
+		} map;
+		struct {
+			u64 device_va;
+			u32 size;
+		} import;
+	};
+};
+
+union mdw_mem_args {
+	struct mdw_mem_in in;
+	struct mdw_mem_out out;
+};
+
+#define APU_MDW_IOCTL_MEM \
+	_IOWR(APUSYS_MAGICNO, 33, union mdw_mem_args)
+
+enum mdw_cmd_ioctl_op {
+	MDW_CMD_IOCTL_RUN,
+};
+
+enum {
+	/* cmdbuf copy in before execution and copy out after exection */
+	MDW_CB_BIDIRECTIONAL,
+	/* cmdbuf copy in before execution */
+	MDW_CB_IN,
+	/* cmdbuf copy out after execution */
+	MDW_CB_OUT,
+};
+
+struct mdw_subcmd_exec_info {
+	u32 driver_time;
+	u32 ip_time;
+	u32 ip_start_ts;
+	u32 ip_end_ts;
+	u32 bw;
+	u32 boost;
+	u32 tcm_usage;
+	s32 ret;
+};
+
+struct mdw_cmd_exec_info {
+	u64 sc_rets;
+	s64 ret;
+	u64 total_us;
+	u64 reserved;
+};
+
+struct mdw_subcmd_cmdbuf {
+	u64 handle;
+	u32 size;
+	u32 align;
+	u32 direction;
+};
+
+struct mdw_subcmd_info {
+	u32 type;
+	u32 suggest_time;
+	u32 vlm_usage;
+	u32 vlm_ctx_id;
+	u32 vlm_force;
+	u32 boost;
+	u32 turbo_boost;
+	u32 min_boost;
+	u32 max_boost;
+	u32 hse_en;
+	u32 pack_id;
+	u32 driver_time;
+	u32 ip_time;
+	u32 bw;
+
+	u32 num_cmdbufs;
+	u64 cmdbufs;
+};
+
+struct mdw_cmd_in {
+	enum mdw_cmd_ioctl_op op;
+	union {
+		struct {
+			u64 usr_id;
+			u64 uid;
+			u32 priority;
+			u32 hardlimit;
+			u32 softlimit;
+			u32 power_save;
+			u32 power_plcy;
+			u32 power_dtime;
+			u32 app_type;
+			u32 flags;
+			u32 num_subcmds;
+			u64 subcmd_infos;
+			u64 adj_matrix;
+			u64 fence;
+			u64 exec_infos;
+		} exec;
+	};
+};
+
+struct mdw_cmd_out {
+	union {
+		struct {
+			u64 id;
+			u64 fence;
+		} exec;
+	};
+};
+
+union mdw_cmd_args {
+	struct mdw_cmd_in in;
+	struct mdw_cmd_out out;
+};
+
+#define APU_MDW_IOCTL_CMD \
+	_IOWR(APUSYS_MAGICNO, 34, union mdw_cmd_args)
+
+enum mdw_util_ioctl_op {
+	MDW_UTIL_IOCTL_SETPOWER,
+	MDW_UTIL_IOCTL_UCMD,
+};
+
+struct mdw_util_in {
+	enum mdw_util_ioctl_op op;
+	union {
+		struct {
+			u32 dev_type;
+			u32 core_idx;
+			u32 boost;
+			u64 reserve;
+		} power;
+		struct {
+			u32 dev_type;
+			u32 size;
+			u64 handle;
+		} ucmd;
+	};
+};
+
+union mdw_util_args {
+	struct mdw_util_in in;
+};
+
+#define APU_MDW_IOCTL_UTIL \
+	_IOWR(APUSYS_MAGICNO, 35, union mdw_util_args)
+
+#endif
diff --git a/drivers/soc/mediatek/apusys/mdw-mem.c b/drivers/soc/mediatek/apusys/mdw-mem.c
new file mode 100644
index 000000000000..c5aea746f6a8
--- /dev/null
+++ b/drivers/soc/mediatek/apusys/mdw-mem.c
@@ -0,0 +1,938 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2021 MediaTek Inc.
+ */
+
+#include <linux/dma-mapping.h>
+#include <linux/highmem.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/slab.h>
+
+#include "apu-device.h"
+#include "mdw.h"
+#include "mdw-mem.h"
+
+#define APU_MEM_DMA_MASK               0x00000003ffffffff
+
+struct mdw_mem_dma_attachment {
+	struct sg_table *sgt;
+	struct device *dev;
+	struct list_head node;
+	bool mapped;
+	bool uncached;
+};
+
+struct mdw_mem_dma {
+	struct dma_buf *dbuf;
+	dma_addr_t dma_addr;
+	u32 dma_size;
+	u32 size;
+	struct {
+		int handle;
+		void *vaddr;
+		struct list_head attachments;
+		struct sg_table sgt;
+		void *buf;
+	} a;
+	struct {
+		struct dma_buf_attachment *attach;
+		struct sg_table *sgt;
+	} m;
+	bool uncached;
+	struct kref attach_ref;
+
+	struct mutex mtx; /* protect attachments */
+
+	struct mdw_mem *mmem;
+	struct device *mem_dev;
+	struct list_head m_item;
+};
+
+struct mdw_mem_dma_mgr {
+	struct list_head mems;
+	struct mutex mtx; /* protect mems */
+};
+
+static struct mdw_mem_dma_mgr mdmgr;
+
+static struct sg_table *mdw_mem_dma_dup_sg(struct sg_table *table)
+{
+	struct sg_table *new_table;
+	int ret, i;
+	struct scatterlist *sg, *new_sg;
+
+	new_table = kzalloc(sizeof(*new_table), GFP_KERNEL);
+	if (!new_table)
+		return ERR_PTR(-ENOMEM);
+
+	ret = sg_alloc_table(new_table, table->orig_nents, GFP_KERNEL);
+	if (ret) {
+		kfree(new_table);
+		return ERR_PTR(-ENOMEM);
+	}
+
+	new_sg = new_table->sgl;
+	for_each_sgtable_sg(table, sg, i) {
+		sg_set_page(new_sg, sg_page(sg), sg->length, sg->offset);
+		new_sg = sg_next(new_sg);
+	}
+
+	return new_table;
+}
+
+static int mdw_mem_dma_allocate_sgt(const char *buf, size_t len,
+				    struct sg_table *sgt, bool uncached,
+				    void **vaddr)
+{
+	struct page **pages = NULL;
+	unsigned int nr_pages;
+	unsigned int index;
+	const char *p;
+	int ret;
+	pgprot_t pgprot = PAGE_KERNEL;
+	void *va;
+
+	nr_pages = DIV_ROUND_UP((unsigned long)buf + len, PAGE_SIZE)
+		- ((unsigned long)buf / PAGE_SIZE);
+	pages = kmalloc_array(nr_pages, sizeof(struct page *), GFP_KERNEL);
+
+	if (!pages)
+		return -ENOMEM;
+
+	p = buf - offset_in_page(buf);
+
+	for (index = 0; index < nr_pages; index++) {
+		if (is_vmalloc_addr(p))
+			pages[index] = vmalloc_to_page(p);
+		else
+			pages[index] = kmap_to_page((void *)p);
+		if (!pages[index]) {
+			kfree(pages);
+			return -EFAULT;
+		}
+		p += PAGE_SIZE;
+	}
+	if (uncached)
+		pgprot = pgprot_writecombine(PAGE_KERNEL);
+
+	va = vmap(pages, nr_pages, VM_MAP, pgprot);
+	ret = sg_alloc_table_from_pages(sgt, pages, index, offset_in_page(buf),
+					len, GFP_KERNEL);
+	kfree(pages);
+	if (ret)
+		return ret;
+
+	*vaddr = va;
+
+	return 0;
+}
+
+static int mdw_mem_dma_free_sgt(struct sg_table *sgt)
+{
+	int ret = 0;
+
+	sg_free_table(sgt);
+
+	return ret;
+}
+
+static int mdw_dmabuf_attach(struct dma_buf *dbuf,
+			     struct dma_buf_attachment *attach)
+{
+	struct mdw_mem_dma_attachment *a = NULL;
+	struct mdw_mem_dma *mdbuf = dbuf->priv;
+	int ret = 0;
+	struct sg_table *table;
+
+	a = kzalloc(sizeof(*a), GFP_KERNEL);
+	if (!a)
+		return -ENOMEM;
+
+	table = mdw_mem_dma_dup_sg(&mdbuf->a.sgt);
+	if (IS_ERR(table)) {
+		kfree(a);
+		return -ENOMEM;
+	}
+
+	a->sgt = table;
+	a->dev = attach->dev;
+	INIT_LIST_HEAD(&a->node);
+	a->mapped = false;
+	a->uncached = mdbuf->uncached;
+	attach->priv = a;
+
+	mutex_lock(&mdbuf->mtx);
+	list_add(&a->node, &mdbuf->a.attachments);
+	mutex_unlock(&mdbuf->mtx);
+
+	return ret;
+}
+
+static void mdw_dmabuf_detach(struct dma_buf *dbuf,
+			      struct dma_buf_attachment *attach)
+{
+	struct mdw_mem_dma_attachment *a = attach->priv;
+	struct mdw_mem_dma *mdbuf = dbuf->priv;
+
+	mutex_lock(&mdbuf->mtx);
+	list_del(&a->node);
+	mutex_unlock(&mdbuf->mtx);
+
+	sg_free_table(a->sgt);
+	kfree(a->sgt);
+	kfree(a);
+}
+
+static struct sg_table *mdw_dmabuf_map_dma(struct dma_buf_attachment *attach,
+					   enum dma_data_direction dir)
+{
+	struct mdw_mem_dma_attachment *a = attach->priv;
+	struct sg_table *table = NULL;
+	int attr = 0;
+	int ret = 0;
+
+	table = a->sgt;
+	if (a->uncached)
+		attr |= DMA_ATTR_SKIP_CPU_SYNC;
+
+	ret = dma_map_sgtable(attach->dev, table, dir, attr);
+	if (ret)
+		table = ERR_PTR(ret);
+
+	a->mapped = true;
+
+	return table;
+}
+
+static void mdw_dmabuf_unmap_dma(struct dma_buf_attachment *attach,
+				 struct sg_table *sgt,
+				 enum dma_data_direction dir)
+{
+	struct mdw_mem_dma_attachment *a = attach->priv;
+	int attr = 0;
+
+	if (a->uncached)
+		attr |= DMA_ATTR_SKIP_CPU_SYNC;
+
+	a->mapped = false;
+	dma_unmap_sgtable(attach->dev, sgt, dir, attr);
+}
+
+static int mdw_dmabuf_vmap(struct dma_buf *dbuf, struct dma_buf_map *dbuf_map)
+{
+	struct mdw_mem_dma *mdbuf = dbuf->priv;
+
+	dbuf_map->vaddr = mdbuf->a.vaddr;
+	return 0;
+}
+
+static void mdw_dmabuf_release(struct dma_buf *dbuf)
+{
+	struct mdw_mem_dma *mdbuf = dbuf->priv;
+	struct mdw_mem *m = mdbuf->mmem;
+
+	mutex_lock(&mdmgr.mtx);
+	list_del(&mdbuf->m_item);
+	mutex_unlock(&mdmgr.mtx);
+
+	if (m->type != MDW_MEM_TYPE_IMPORT) {
+		mdw_mem_dma_free_sgt(&mdbuf->a.sgt);
+		vunmap(mdbuf->a.vaddr);
+		kvfree(mdbuf->a.buf);
+	}
+
+	kfree(mdbuf);
+	m->release(m);
+}
+
+static int mdw_dmabuf_mmap(struct dma_buf *dbuf,
+			   struct vm_area_struct *vma)
+{
+	struct mdw_mem_dma *mdbuf = dbuf->priv;
+	struct sg_table *table = &mdbuf->a.sgt;
+	unsigned long addr = vma->vm_start;
+	struct sg_page_iter piter;
+	int ret = 0;
+
+	if (mdbuf->uncached)
+		vma->vm_page_prot = pgprot_writecombine(vma->vm_page_prot);
+
+	for_each_sgtable_page(table, &piter, vma->vm_pgoff) {
+		struct page *page = sg_page_iter_page(&piter);
+
+		ret = remap_pfn_range(vma, addr, page_to_pfn(page), PAGE_SIZE,
+				      vma->vm_page_prot);
+		if (ret)
+			return ret;
+		addr += PAGE_SIZE;
+		if (addr >= vma->vm_end)
+			return 0;
+	}
+	return ret;
+}
+
+static struct dma_buf_ops mdw_dmabuf_ops = {
+	.attach = mdw_dmabuf_attach,
+	.detach = mdw_dmabuf_detach,
+	.map_dma_buf = mdw_dmabuf_map_dma,
+	.unmap_dma_buf = mdw_dmabuf_unmap_dma,
+	.vmap = mdw_dmabuf_vmap,
+	.mmap = mdw_dmabuf_mmap,
+	.release = mdw_dmabuf_release,
+};
+
+static struct mdw_mem *mdw_mem_dma_get(int handle)
+{
+	struct dma_buf *dbuf = NULL;
+	struct mdw_mem_dma *m = NULL, *pos = NULL, *tmp = NULL;
+
+	dbuf = dma_buf_get(handle);
+	if (IS_ERR_OR_NULL(dbuf))
+		return NULL;
+
+	mutex_lock(&mdmgr.mtx);
+	list_for_each_entry_safe(pos, tmp, &mdmgr.mems, m_item) {
+		if (pos->dbuf == dbuf) {
+			m = pos;
+			break;
+		}
+	}
+	mutex_unlock(&mdmgr.mtx);
+
+	dma_buf_put(dbuf);
+	if (!m) {
+		pr_err("handle(%d) not belong to apu\n", handle);
+		return NULL;
+	}
+
+	return m->mmem;
+}
+
+static int mdw_mem_dma_alloc(struct mdw_mem *mem)
+{
+	struct mdw_mem_dma *mdbuf = NULL;
+	int ret = 0;
+	DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
+	struct device *dev;
+	void *kva;
+	bool uncached = true;
+
+	/* alloc mdw dma-buf container */
+	mdbuf = kzalloc(sizeof(*mdbuf), GFP_KERNEL);
+	if (!mdbuf)
+		return -ENOMEM;
+
+	mutex_init(&mdbuf->mtx);
+	INIT_LIST_HEAD(&mdbuf->a.attachments);
+
+	/* alloc buffer by dma */
+	mdbuf->dma_size = PAGE_ALIGN(mem->size);
+
+	dev = mem->mpriv->mdev->dma_dev;
+
+	if (!dev) {
+		pr_err("dev invalid\n");
+		ret = -ENOMEM;
+		goto free_mdw_dbuf;
+	}
+
+	kva = kvzalloc(mdbuf->dma_size, GFP_KERNEL);
+	if (!kva) {
+		ret = -ENOMEM;
+		goto free_mdw_dbuf;
+	}
+
+	mdbuf->a.buf = kva;
+
+	if (mdw_mem_dma_allocate_sgt(kva, mdbuf->dma_size, &mdbuf->a.sgt,
+				     uncached, &mdbuf->a.vaddr)) {
+		dev_err(dev, "get sgt: failed\n");
+		ret = -ENOMEM;
+		goto free_buf;
+	}
+
+	exp_info.ops = &mdw_dmabuf_ops;
+	exp_info.size = mdbuf->dma_size;
+	exp_info.flags = O_RDWR | O_CLOEXEC;
+	exp_info.priv = mdbuf;
+
+	mdbuf->dbuf = dma_buf_export(&exp_info);
+	if (IS_ERR(mdbuf->dbuf)) {
+		dev_err(dev, "dma_buf_export Fail\n");
+		ret = -ENOMEM;
+		goto free_sgt;
+	}
+
+	mdbuf->dbuf->priv = mdbuf;
+	mdbuf->mmem = mem;
+	mdbuf->mem_dev = dev;
+	mdbuf->size = mem->size;
+	mdbuf->uncached = uncached;
+	mem->device_va = mdbuf->dma_addr;
+	mem->vaddr = mdbuf->a.vaddr;
+	mem->priv = mdbuf;
+	mutex_lock(&mdmgr.mtx);
+	list_add_tail(&mdbuf->m_item, &mdmgr.mems);
+	mutex_unlock(&mdmgr.mtx);
+
+	dma_sync_sgtable_for_device(mdbuf->mem_dev, &mdbuf->a.sgt,
+				    DMA_TO_DEVICE);
+
+	/* internal use, don't export fd */
+	if (!mem->need_handle) {
+		mem->handle = -1;
+		goto out;
+	}
+
+	mdbuf->a.handle =  dma_buf_fd(mdbuf->dbuf,
+				      (O_RDWR | O_CLOEXEC) & ~O_ACCMODE);
+	if (mdbuf->a.handle < 0) {
+		ret = -EINVAL;
+		dev_err(dev, "dma_buf_fd Fail\n");
+		dma_buf_put(mdbuf->dbuf);
+		return ret;
+	}
+	mem->handle = mdbuf->a.handle;
+
+out:
+	return ret;
+
+free_sgt:
+	mdw_mem_dma_free_sgt(&mdbuf->a.sgt);
+free_buf:
+	kvfree(kva);
+free_mdw_dbuf:
+	kfree(mdbuf);
+
+	return ret;
+}
+
+static int mdw_mem_dma_free(struct mdw_mem *mem)
+{
+	struct mdw_mem_dma *mdbuf = mem->priv;
+
+	dma_buf_put(mdbuf->dbuf);
+
+	return 0;
+}
+
+int mdw_mem_dma_map(struct mdw_mem *mem)
+{
+	struct mdw_mem_dma *mdbuf = NULL;
+	int ret = 0;
+
+	mdbuf = (struct mdw_mem_dma *)mem->priv;
+
+	if (IS_ERR_OR_NULL(mdbuf->dbuf))
+		return -EINVAL;
+
+	get_dma_buf(mdbuf->dbuf);
+
+	/* Only Attach after First Map */
+	if (kref_read(&mdbuf->attach_ref)) {
+		kref_get(&mdbuf->attach_ref);
+		goto out;
+	} else {
+		kref_init(&mdbuf->attach_ref);
+	}
+
+	mdbuf->m.attach = dma_buf_attach(mdbuf->dbuf, mdbuf->mem_dev);
+	if (IS_ERR(mdbuf->m.attach)) {
+		ret = PTR_ERR(mdbuf->m.attach);
+		dev_err(mdbuf->mem_dev, "dma_buf_attach failed: %d\n", ret);
+		goto put_dbuf;
+	}
+
+	mdbuf->m.sgt = dma_buf_map_attachment(mdbuf->m.attach,
+					      DMA_BIDIRECTIONAL);
+	if (IS_ERR(mdbuf->m.sgt)) {
+		ret = PTR_ERR(mdbuf->m.sgt);
+		dev_err(mdbuf->mem_dev, "dma_buf_map_attachment failed: %d\n",
+			ret);
+		goto detach_dbuf;
+	}
+
+	mdbuf->dma_addr = sg_dma_address(mdbuf->m.sgt->sgl);
+	mdbuf->dma_size = sg_dma_len(mdbuf->m.sgt->sgl);
+	if (!mdbuf->dma_addr || !mdbuf->dma_size) {
+		dev_err(mdbuf->mem_dev, "can't get mem(0x%llx) dva(0x%llx/%u)\n",
+			(u64)mem, mdbuf->dma_addr, mdbuf->dma_size);
+		ret = -ENOMEM;
+		goto unmap_dbuf;
+	}
+
+	mem->device_va = mdbuf->dma_addr;
+	mem->dva_size = mdbuf->dma_size;
+out:
+	return ret;
+
+unmap_dbuf:
+	dma_buf_unmap_attachment(mdbuf->m.attach, mdbuf->m.sgt,
+				 DMA_BIDIRECTIONAL);
+detach_dbuf:
+	dma_buf_detach(mdbuf->dbuf, mdbuf->m.attach);
+put_dbuf:
+	dma_buf_put(mdbuf->dbuf);
+
+	return ret;
+}
+
+static void mdw_mem_dma_detach(struct kref *ref)
+{
+	struct mdw_mem_dma *mdbuf;
+
+	mdbuf =	container_of(ref, struct mdw_mem_dma, attach_ref);
+	dma_buf_unmap_attachment(mdbuf->m.attach, mdbuf->m.sgt,
+				 DMA_BIDIRECTIONAL);
+	dma_buf_detach(mdbuf->dbuf, mdbuf->m.attach);
+}
+
+int mdw_mem_dma_unmap(struct mdw_mem *mem)
+{
+	struct mdw_mem_dma *mdbuf = mem->priv;
+	int ret = 0;
+
+	/* Only Detach after last Map */
+	kref_put(&mdbuf->attach_ref, mdw_mem_dma_detach);
+
+	dma_buf_put(mdbuf->dbuf);
+
+	return ret;
+}
+
+static int mdw_mem_dma_import(struct mdw_mem *mem)
+{
+	int ret = 0;
+	struct mdw_mem_dma *mdbuf = NULL;
+	struct dma_buf *dbuf = NULL;
+	struct device *dev;
+
+	if (mem->device_va || mem->priv)
+		return -EINVAL;
+
+	dbuf = dma_buf_get(mem->handle);
+	if (IS_ERR_OR_NULL(dbuf))
+		return -ENOMEM;
+
+	/* Import Use 32 Bit Buffer */
+	dev = mem->mpriv->mdev->dma_dev;
+	if (!dev) {
+		pr_err("dev invalid\n");
+		ret = -ENOMEM;
+		goto put_dbuf;
+	}
+
+	mdbuf = kzalloc(sizeof(*mdbuf), GFP_KERNEL);
+	if (!mdbuf) {
+		ret = -ENOMEM;
+		goto put_dbuf;
+	}
+
+	mdbuf->mmem = mem;
+	mdbuf->dbuf = dbuf;
+	mdbuf->mem_dev = dev;
+	mdbuf->size = mem->size;
+
+	/* Only Attach after First Map */
+	if (kref_read(&mdbuf->attach_ref)) {
+		kref_get(&mdbuf->attach_ref);
+		goto out;
+	} else {
+		kref_init(&mdbuf->attach_ref);
+	}
+
+	mdbuf->m.attach = dma_buf_attach(mdbuf->dbuf, dev);
+	if (IS_ERR(mdbuf->m.attach)) {
+		ret = PTR_ERR(mdbuf->m.attach);
+		dev_err(dev, "dma_buf_attach failed: %d\n", ret);
+		goto free_mdbuf;
+	}
+
+	mdbuf->m.sgt = dma_buf_map_attachment(mdbuf->m.attach,
+					      DMA_BIDIRECTIONAL);
+	if (IS_ERR(mdbuf->m.sgt)) {
+		ret = PTR_ERR(mdbuf->m.sgt);
+		dev_err(dev, "dma_buf_map_attachment failed: %d\n", ret);
+		goto detach_dbuf;
+	}
+
+	mdbuf->dma_addr = sg_dma_address(mdbuf->m.sgt->sgl);
+	mdbuf->dma_size = sg_dma_len(mdbuf->m.sgt->sgl);
+	if (!mdbuf->dma_addr || !mdbuf->dma_size) {
+		dev_err(dev, "can't get mem(0x%llx) dva(0x%llx/%u)\n",
+			(u64)mem, mdbuf->dma_addr, mdbuf->dma_size);
+		ret = -ENOMEM;
+		goto unmap_dbuf;
+	}
+	mem->device_va = mdbuf->dma_addr;
+	mem->priv = mdbuf;
+	mutex_lock(&mdmgr.mtx);
+	list_add_tail(&mdbuf->m_item, &mdmgr.mems);
+	mutex_unlock(&mdmgr.mtx);
+
+out:
+	return ret;
+
+unmap_dbuf:
+	dma_buf_unmap_attachment(mdbuf->m.attach, mdbuf->m.sgt,
+				 DMA_BIDIRECTIONAL);
+detach_dbuf:
+	dma_buf_detach(mdbuf->dbuf, mdbuf->m.attach);
+free_mdbuf:
+	kfree(mdbuf);
+put_dbuf:
+	dma_buf_put(dbuf);
+
+	return ret;
+}
+
+static int mdw_mem_dma_unimport(struct mdw_mem *mem)
+{
+	struct mdw_mem_dma *mdbuf = NULL;
+	int ret = 0;
+
+	if (IS_ERR_OR_NULL(mem->priv))
+		return -EINVAL;
+
+	mdbuf = (struct mdw_mem_dma *)mem->priv;
+
+	if (IS_ERR_OR_NULL(mdbuf->m.attach) ||
+	    IS_ERR_OR_NULL(mdbuf->m.sgt))
+		return -EINVAL;
+
+	mutex_lock(&mdmgr.mtx);
+	list_del(&mdbuf->m_item);
+	mutex_unlock(&mdmgr.mtx);
+
+	/* Only Detach after last Map */
+	kref_put(&mdbuf->attach_ref, mdw_mem_dma_detach);
+
+	mem->device_va = 0;
+	mem->priv = NULL;
+
+	dma_buf_put(mdbuf->dbuf);
+	kfree(mdbuf);
+
+	return ret;
+}
+
+static int mdw_mem_dma_flush(struct mdw_mem *mem)
+{
+	int ret = 0;
+	struct mdw_mem_dma *mdbuf = mem->priv;
+
+	if (!mdbuf->a.vaddr) {
+		pr_warn("mdbuf vaddr NULL\n");
+		goto out;
+	}
+
+	if (!mdbuf->uncached)
+		dma_sync_sgtable_for_device(mdbuf->mem_dev, &mdbuf->a.sgt,
+					    DMA_TO_DEVICE);
+out:
+	return ret;
+}
+
+static int mdw_mem_dma_invalidate(struct mdw_mem *mem)
+{
+	int ret = 0;
+	struct mdw_mem_dma *mdbuf = mem->priv;
+
+	if (!mdbuf->a.vaddr) {
+		pr_warn("mdbuf vaddr NULL\n");
+		goto out;
+	}
+
+	if (!mdbuf->uncached)
+		dma_sync_sgtable_for_cpu(mdbuf->mem_dev, &mdbuf->a.sgt,
+					 DMA_FROM_DEVICE);
+
+out:
+	return ret;
+}
+
+static struct mdw_mem *mdw_mem_dma_query_mem(u64 kva)
+{
+	struct mdw_mem_dma *pos = NULL, *tmp = NULL;
+	struct mdw_mem *m = NULL;
+	struct mdw_mem *target = NULL;
+
+	mutex_lock(&mdmgr.mtx);
+	list_for_each_entry_safe(pos, tmp, &mdmgr.mems, m_item) {
+		m = pos->mmem;
+		if (kva >= (u64)m->vaddr &&
+		    kva < (u64)m->vaddr + m->size)
+			target = m;
+	}
+	mutex_unlock(&mdmgr.mtx);
+
+	return target;
+}
+
+static int mdw_mem_dma_init(void)
+{
+	mutex_init(&mdmgr.mtx);
+	INIT_LIST_HEAD(&mdmgr.mems);
+
+	return 0;
+}
+
+static void mdw_mem_dma_deinit(void)
+{
+}
+
+struct mdw_mem *mdw_mem_get(int handle)
+{
+	return mdw_mem_dma_get(handle);
+}
+
+static void mdw_mem_delete(struct mdw_mem *m)
+{
+	struct mdw_fpriv *mpriv = m->mpriv;
+
+	switch (m->type) {
+	case MDW_MEM_TYPE_ALLOC:
+		mutex_lock(&mpriv->mtx);
+		list_del(&m->u_item);
+		mutex_unlock(&mpriv->mtx);
+		break;
+	case MDW_MEM_TYPE_IMPORT:
+		list_del(&m->u_item);
+		break;
+	default:
+		break;
+	}
+
+	vfree(m);
+	mpriv->put(mpriv);
+}
+
+static struct mdw_mem *mdw_mem_create(struct mdw_fpriv *mpriv)
+{
+	struct mdw_mem *m = NULL;
+
+	m = vzalloc(sizeof(*m));
+	if (m) {
+		m->mpriv = mpriv;
+		m->release = mdw_mem_delete;
+		mpriv->get(mpriv);
+	}
+
+	return m;
+}
+
+static void mdw_mem_map_release(struct kref *ref)
+{
+	struct mdw_mem *m =
+			container_of(ref, struct mdw_mem, map_ref);
+
+	switch (m->type) {
+	case MDW_MEM_TYPE_INTERNAL:
+		mdw_mem_dma_unmap(m);
+		break;
+
+	case MDW_MEM_TYPE_ALLOC:
+		mdw_mem_dma_unmap(m);
+		break;
+
+	case MDW_MEM_TYPE_IMPORT:
+		mdw_mem_dma_unimport(m);
+		mdw_mem_delete(m);
+		break;
+
+	default:
+		break;
+	}
+}
+
+struct mdw_mem *mdw_mem_alloc(struct mdw_fpriv *mpriv, u32 size,
+			      u32 align, u64 flags,
+			      enum mdw_mem_type type)
+{
+	struct mdw_mem *m = NULL;
+	int ret = 0;
+
+	m = mdw_mem_create(mpriv);
+	if (!m)
+		goto out;
+
+	if (type == MDW_MEM_TYPE_INTERNAL)
+		m->need_handle = false;
+	else
+		m->need_handle = true;
+	m->size = size;
+	m->align = align;
+	m->flags = flags;
+	ret = mdw_mem_dma_alloc(m);
+	if (ret) {
+		dev_err(mpriv->mdev->dev, "mdw_mem_dma_alloc Fail (%d)\n", ret);
+		goto free_mem;
+	}
+	m->type = type;
+
+	goto out;
+
+free_mem:
+	mdw_mem_delete(m);
+	m = NULL;
+out:
+	return m;
+}
+
+int mdw_mem_free(struct mdw_mem *m)
+{
+	return mdw_mem_dma_free(m);
+}
+
+int mdw_mem_map(struct mdw_mem *m)
+{
+	int ret = 0;
+
+	if (kref_read(&m->map_ref)) {
+		kref_get(&m->map_ref);
+		ret = 0;
+	} else {
+		ret = mdw_mem_dma_map(m);
+		if (ret) {
+			dev_err(m->mpriv->mdev->dev, "map fail %d\n", ret);
+			goto out;
+		}
+		kref_init(&m->map_ref);
+	}
+out:
+	return ret;
+}
+
+int mdw_mem_unmap(struct mdw_mem *m)
+{
+	if (!kref_read(&m->map_ref)) {
+		dev_warn(m->mpriv->mdev->dev, "can't unmap mem\n");
+		return -EINVAL;
+	}
+	kref_put(&m->map_ref, mdw_mem_map_release);
+
+	return 0;
+}
+
+int mdw_mem_flush(struct mdw_mem *m)
+{
+	int ret = 0;
+
+	ret = mdw_mem_dma_flush(m);
+	if (ret) {
+		dev_err(m->mpriv->mdev->dev, "Flush Fail\n");
+		ret = -EINVAL;
+		goto out;
+	}
+out:
+	return ret;
+}
+
+int mdw_mem_invalidate(struct mdw_mem *m)
+{
+	int ret = 0;
+
+	ret = mdw_mem_dma_invalidate(m);
+	if (ret) {
+		dev_err(m->mpriv->mdev->dev, "Invalidate Fail\n");
+		ret = -EINVAL;
+		goto out;
+	}
+out:
+	return ret;
+}
+
+struct mdw_mem *mdw_mem_import(struct mdw_fpriv *mpriv, u64 handle, u32 size)
+{
+	struct mdw_mem *m = NULL;
+
+	m = mdw_mem_create(mpriv);
+	if (!m)
+		return NULL;
+
+	m->size = size;
+	m->handle = handle;
+	if (mdw_mem_dma_import(m)) {
+		dev_err(mpriv->mdev->dev, "import fail\n");
+		goto free_mem;
+	}
+
+	m->type = MDW_MEM_TYPE_IMPORT;
+	kref_init(&m->map_ref);
+	list_add_tail(&m->u_item, &mpriv->mems);
+
+	goto out;
+
+free_mem:
+	mdw_mem_delete(m);
+	m = NULL;
+out:
+	return m;
+}
+
+void mdw_mem_mpriv_release(struct mdw_fpriv *mpriv)
+{
+	struct mdw_mem *m = NULL, *tmp = NULL;
+	int i = 0, ref_cnt = 0;
+
+	list_for_each_entry_safe(m, tmp, &mpriv->mems, u_item) {
+		ref_cnt = kref_read(&m->map_ref);
+		for (i = 0; i < ref_cnt; i++)
+			kref_put(&m->map_ref, mdw_mem_map_release);
+	}
+}
+
+int mdw_mem_init(struct mdw_device *mdev)
+{
+	int ret = 0;
+
+	ret = dma_set_mask_and_coherent(mdev->dma_dev, APU_MEM_DMA_MASK);
+	if (ret) {
+		dev_info(mdev->dev, "unable to set DMA mask coherent: %d\n",
+			 ret);
+		return ret;
+	}
+
+	return mdw_mem_dma_init();
+}
+
+void mdw_mem_deinit(struct mdw_device *mdev)
+{
+	mdw_mem_dma_deinit();
+}
+
+int apusys_mem_flush_kva(void *kva, u32 size)
+{
+	struct mdw_mem *m = NULL;
+	int ret = 0;
+
+	m = mdw_mem_dma_query_mem((u64)kva);
+	if (!m) {
+		pr_err("No Mem\n");
+		ret = -ENOMEM;
+		goto out;
+	}
+
+	ret = mdw_mem_flush(m);
+
+out:
+	return ret;
+}
+
+int apusys_mem_invalidate_kva(void *kva, u32 size)
+{
+	struct mdw_mem *m = NULL;
+	int ret = 0;
+
+	m = mdw_mem_dma_query_mem((u64)kva);
+	if (!m) {
+		pr_err("No Mem\n");
+		ret = -ENOMEM;
+		goto out;
+	}
+
+	ret = mdw_mem_invalidate(m);
+out:
+	return ret;
+}
diff --git a/drivers/soc/mediatek/apusys/mdw-mem.h b/drivers/soc/mediatek/apusys/mdw-mem.h
new file mode 100644
index 000000000000..cb744f41d15e
--- /dev/null
+++ b/drivers/soc/mediatek/apusys/mdw-mem.h
@@ -0,0 +1,23 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2021 MediaTek Inc.
+ */
+
+#ifndef __MTK_APU_MDW_MEM_H__
+#define __MTK_APU_MDW_MEM_H__
+
+struct mdw_mem *mdw_mem_alloc(struct mdw_fpriv *mpriv, u32 size,
+			      u32 align, u64 flags,
+			      enum mdw_mem_type type);
+struct mdw_mem *mdw_mem_import(struct mdw_fpriv *mpriv, u64 handle, u32 size);
+struct mdw_mem *mdw_mem_get(int handle);
+int mdw_mem_map(struct mdw_mem *m);
+int mdw_mem_unmap(struct mdw_mem *m);
+int mdw_mem_init(struct mdw_device *mdev);
+void mdw_mem_deinit(struct mdw_device *mdev);
+int mdw_mem_free(struct mdw_mem *mem);
+int mdw_mem_dma_map(struct mdw_mem *mem);
+int mdw_mem_dma_unmap(struct mdw_mem *mem);
+int apusys_mem_flush_kva(void *kva, u32 size);
+int apusys_mem_invalidate_kva(void *kva, u32 size);
+#endif
diff --git a/drivers/soc/mediatek/apusys/mdw-rv-cmd.c b/drivers/soc/mediatek/apusys/mdw-rv-cmd.c
new file mode 100644
index 000000000000..13d5febf5b61
--- /dev/null
+++ b/drivers/soc/mediatek/apusys/mdw-rv-cmd.c
@@ -0,0 +1,158 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2021 MediaTek Inc.
+ */
+
+#include "mdw.h"
+#include "mdw-mem.h"
+#include "mdw-rv.h"
+
+#define MDW_IS_HIGHADDR(addr) (((addr) & 0xffffffff00000000) ? true : false)
+
+struct mdw_rv_cmd *mdw_rv_cmd_create(struct mdw_fpriv *mpriv, struct mdw_cmd *c)
+{
+	struct mdw_rv_cmd *rc = NULL;
+	u32 cb_size = 0, acc_cb = 0, i = 0, j = 0;
+	u32 subcmds_ofs = 0, cmdbuf_infos_ofs = 0, adj_matrix_ofs = 0;
+	struct mdw_rv_msg_cmd *rmc = NULL;
+	struct mdw_rv_msg_sc *rmsc = NULL;
+	struct mdw_rv_msg_cb *rmcb = NULL;
+	int ret = 0;
+
+	/* check mem address for rv */
+	if (MDW_IS_HIGHADDR(c->exec_infos->device_va) ||
+	    MDW_IS_HIGHADDR(c->cmdbufs->device_va)) {
+		dev_err(mpriv->mdev->dev, "rv dva high addr(0x%llx/0x%llx)\n",
+			c->cmdbufs->device_va, c->exec_infos->device_va);
+		goto out;
+	}
+
+	rc = vzalloc(sizeof(*rc));
+	if (!rc)
+		goto out;
+
+	init_completion(&rc->s_msg.cmplt);
+	/* set start timestamp */
+	rc->start_ts_ns = c->start_ts.tv_sec * 1000000000 + c->start_ts.tv_nsec;
+
+	/* calc size and offset */
+	rc->c = c;
+	cb_size += sizeof(struct mdw_rv_msg_cmd);
+	cb_size = MDW_ALIGN(cb_size, MDW_DEFAULT_ALIGN);
+	adj_matrix_ofs = cb_size;
+	cb_size += (c->num_subcmds * c->num_subcmds * sizeof(u8));
+	cb_size = MDW_ALIGN(cb_size, MDW_DEFAULT_ALIGN);
+	subcmds_ofs = cb_size;
+	cb_size += (c->num_subcmds * sizeof(struct mdw_rv_msg_sc));
+	cb_size = MDW_ALIGN(cb_size, MDW_DEFAULT_ALIGN);
+	cmdbuf_infos_ofs = cb_size;
+	cb_size += (c->num_cmdbufs * sizeof(struct mdw_rv_msg_cb));
+
+	/* allocate communicate buffer */
+	rc->cb = mdw_mem_alloc(mpriv, cb_size, MDW_DEFAULT_ALIGN,
+			       (1ULL << MDW_MEM_IOCTL_ALLOC_CACHEABLE |
+			       1ULL << MDW_MEM_IOCTL_ALLOC_32BIT),
+			       MDW_MEM_TYPE_INTERNAL);
+	if (!rc->cb) {
+		dev_err(mpriv->mdev->dev, "c(0x%llx) alloc cb size(%u) fail\n",
+			c->kid, cb_size);
+		goto free_rc;
+	}
+
+	ret = mdw_mem_map(rc->cb);
+	if (ret) {
+		dev_err(mpriv->mdev->dev, "c(0x%llx) map cb size(%u) fail\n",
+			c->kid, cb_size);
+		goto free_mem;
+	}
+
+	/* assign cmd info */
+	rmc = (struct mdw_rv_msg_cmd *)rc->cb->vaddr;
+	rmc->session_id = (u64)c->mpriv;
+	rmc->cmd_id = c->kid;
+	rmc->exec_infos = c->exec_infos->device_va;
+	rmc->exec_size = c->exec_infos->size;
+	rmc->priority = c->priority;
+	rmc->hardlimit = c->hardlimit;
+	rmc->softlimit = c->softlimit;
+	rmc->power_save = c->power_save;
+	rmc->power_plcy = c->power_plcy;
+	rmc->power_dtime = c->power_dtime;
+	rmc->app_type = c->app_type;
+	rmc->num_subcmds = c->num_subcmds;
+	rmc->num_cmdbufs = c->num_cmdbufs;
+	rmc->subcmds_offset = subcmds_ofs;
+	rmc->cmdbuf_infos_offset = cmdbuf_infos_ofs;
+	rmc->adj_matrix_offset = adj_matrix_ofs;
+
+	memcpy((void *)rmc + rmc->adj_matrix_offset, c->adj_matrix,
+	       c->num_subcmds * c->num_subcmds * sizeof(u8));
+
+	rmsc = (void *)rmc + rmc->subcmds_offset;
+	rmcb = (void *)rmc + rmc->cmdbuf_infos_offset;
+	for (i = 0; i < c->num_subcmds; i++) {
+		rmsc[i].type = c->subcmds[i].type;
+		rmsc[i].suggest_time = c->subcmds[i].suggest_time;
+		rmsc[i].vlm_usage = c->subcmds[i].vlm_usage;
+		rmsc[i].vlm_ctx_id = c->subcmds[i].vlm_ctx_id;
+		rmsc[i].vlm_force = c->subcmds[i].vlm_force;
+		rmsc[i].boost = c->subcmds[i].boost;
+		rmsc[i].ip_time = c->subcmds[i].ip_time;
+		rmsc[i].driver_time = c->subcmds[i].driver_time;
+		rmsc[i].bw = c->subcmds[i].bw;
+		rmsc[i].turbo_boost = c->subcmds[i].turbo_boost;
+		rmsc[i].min_boost = c->subcmds[i].min_boost;
+		rmsc[i].max_boost = c->subcmds[i].max_boost;
+		rmsc[i].hse_en = c->subcmds[i].hse_en;
+		rmsc[i].pack_id = c->subcmds[i].pack_id;
+		rmsc[i].num_cmdbufs = c->subcmds[i].num_cmdbufs;
+		rmsc[i].cmdbuf_start_idx = acc_cb;
+
+		for (j = 0; j < rmsc[i].num_cmdbufs; j++) {
+			rmcb[acc_cb + j].size =
+				c->ksubcmds[i].cmdbufs[j].size;
+			rmcb[acc_cb + j].device_va =
+				c->ksubcmds[i].daddrs[j];
+		}
+		acc_cb += c->subcmds[i].num_cmdbufs;
+	}
+
+	/* clear exec ret */
+	c->einfos->c.ret = 0;
+	c->einfos->c.sc_rets = 0;
+
+	apusys_mem_flush_kva(rc->cb->vaddr, rc->cb->size);
+	apusys_mem_flush_kva(c->exec_infos->vaddr, c->exec_infos->size);
+
+	goto out;
+
+free_mem:
+	mdw_mem_free(rc->cb);
+free_rc:
+	vfree(rc);
+	rc = NULL;
+out:
+	return rc;
+}
+
+int mdw_rv_cmd_delete(struct mdw_rv_cmd *rc)
+{
+	if (!rc)
+		return -EINVAL;
+	mdw_mem_unmap(rc->cb);
+	mdw_mem_free(rc->cb);
+	vfree(rc);
+
+	return 0;
+}
+
+void mdw_rv_cmd_done(struct mdw_rv_cmd *rc, int ret)
+{
+	struct mdw_cmd *c = rc->c;
+
+	apusys_mem_invalidate_kva(rc->cb->vaddr, rc->cb->size);
+	apusys_mem_invalidate_kva(c->exec_infos->vaddr, c->exec_infos->size);
+
+	mdw_rv_cmd_delete(rc);
+	c->complete(c, ret);
+}
diff --git a/drivers/soc/mediatek/apusys/mdw-rv-dev.c b/drivers/soc/mediatek/apusys/mdw-rv-dev.c
new file mode 100644
index 000000000000..3c708bda7249
--- /dev/null
+++ b/drivers/soc/mediatek/apusys/mdw-rv-dev.c
@@ -0,0 +1,386 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2021 MediaTek Inc.
+ */
+
+#include <linux/rpmsg.h>
+
+#include "mdw.h"
+#include "mdw-rv.h"
+#include "mdw-rv-msg.h"
+
+#define MDW_CMD_IPI_TIMEOUT (2 * 1000) /* ms */
+
+static struct mdw_ipi_msg_sync *mdw_rv_dev_get_msg(struct mdw_rv_dev *mrdev,
+						   u64 sync_id)
+{
+	struct mdw_ipi_msg_sync *s_msg = NULL;
+	struct list_head *tmp = NULL, *list_ptr = NULL;
+
+	mutex_lock(&mrdev->msg_mtx);
+	list_for_each_safe(list_ptr, tmp, &mrdev->s_list) {
+		s_msg = list_entry(list_ptr, struct mdw_ipi_msg_sync, ud_item);
+		if (s_msg->msg.sync_id == sync_id)
+			break;
+		s_msg = NULL;
+	}
+	mutex_unlock(&mrdev->msg_mtx);
+
+	return s_msg;
+}
+
+static int mdw_rv_dev_send_msg(struct mdw_rv_dev *mrdev,
+			       struct mdw_ipi_msg_sync *s_msg)
+{
+	int ret = 0;
+	u32 cnt = 50, i = 0;
+
+	s_msg->msg.sync_id = (u64)s_msg;
+
+	mutex_lock(&mrdev->msg_mtx);
+	list_add_tail(&s_msg->ud_item, &mrdev->s_list);
+	mutex_unlock(&mrdev->msg_mtx);
+
+	for (i = 0; i < cnt; i++) {
+		ret = rpmsg_send(mrdev->ept, &s_msg->msg, sizeof(s_msg->msg));
+
+		/* send busy, retry */
+		if (ret == -EBUSY) {
+			msleep(20);
+			continue;
+		}
+
+		break;
+	}
+
+	if (ret) {
+		dev_err(mrdev->mdev->dev, "send ipi msg(0x%llx) fail(%d)\n",
+			s_msg->msg.sync_id, ret);
+		mutex_lock(&mrdev->msg_mtx);
+		list_del(&s_msg->ud_item);
+		mutex_unlock(&mrdev->msg_mtx);
+	}
+
+	return ret;
+}
+
+static void mdw_rv_ipi_cmplt_sync(struct mdw_ipi_msg_sync *s_msg)
+{
+	complete(&s_msg->cmplt);
+}
+
+static int mdw_rv_dev_send_sync(struct mdw_rv_dev *mrdev,
+				struct mdw_ipi_msg *msg)
+{
+	int ret = 0;
+	struct mdw_ipi_msg_sync *s_msg = NULL;
+	unsigned long timeout = msecs_to_jiffies(MDW_CMD_IPI_TIMEOUT);
+
+	s_msg = vzalloc(sizeof(*s_msg));
+	if (!s_msg)
+		return -ENOMEM;
+
+	memcpy(&s_msg->msg, msg, sizeof(*msg));
+	init_completion(&s_msg->cmplt);
+	s_msg->complete = mdw_rv_ipi_cmplt_sync;
+
+	mutex_lock(&mrdev->mtx);
+	ret = mdw_rv_dev_send_msg(mrdev, s_msg);
+	if (ret) {
+		dev_err(mrdev->mdev->dev, "send msg fail\n");
+		goto fail_send_sync;
+	}
+	mutex_unlock(&mrdev->mtx);
+
+	if (!wait_for_completion_timeout(&s_msg->cmplt, timeout)) {
+		dev_err(mrdev->mdev->dev, "ipi no response\n");
+		mutex_lock(&mrdev->msg_mtx);
+		list_del(&s_msg->ud_item);
+		mutex_unlock(&mrdev->msg_mtx);
+		ret = -ETIME;
+	} else {
+		memcpy(msg, &s_msg->msg, sizeof(*msg));
+		ret = msg->ret;
+		if (ret)
+			dev_err(mrdev->mdev->dev, "up return fail(%d)\n", ret);
+	}
+
+	goto out;
+
+fail_send_sync:
+	mutex_unlock(&mrdev->mtx);
+out:
+	vfree(s_msg);
+
+	return ret;
+}
+
+static void mdw_rv_ipi_cmplt_cmd(struct mdw_ipi_msg_sync *s_msg)
+{
+	int ret = 0;
+	struct mdw_rv_cmd *rc =
+		container_of(s_msg, struct mdw_rv_cmd, s_msg);
+
+	switch (s_msg->msg.ret) {
+	case MDW_IPI_MSG_STATUS_BUSY:
+		ret = -EBUSY;
+		break;
+
+	case MDW_IPI_MSG_STATUS_ERR:
+		ret = -EREMOTEIO;
+		break;
+
+	case MDW_IPI_MSG_STATUS_TIMEOUT:
+		ret = -ETIME;
+		break;
+
+	default:
+		break;
+	}
+
+	mdw_rv_cmd_done(rc, ret);
+}
+
+static int mdw_rv_dev_send_cmd(struct mdw_rv_dev *mrdev, struct mdw_rv_cmd *rc)
+{
+	int ret = 0;
+
+	rc->s_msg.msg.id = MDW_IPI_APU_CMD;
+	rc->s_msg.msg.c.iova = rc->cb->device_va;
+	rc->s_msg.msg.c.size = rc->cb->size;
+	rc->s_msg.msg.c.start_ts_ns = rc->start_ts_ns;
+	rc->s_msg.complete = mdw_rv_ipi_cmplt_cmd;
+
+	ret = mdw_rv_dev_send_msg(mrdev, &rc->s_msg);
+	if (ret)
+		dev_err(mrdev->mdev->dev, "pid(%d) send msg fail\n",
+			current->pid);
+
+	return ret;
+}
+
+int mdw_rv_dev_run_cmd(struct mdw_fpriv *mpriv, struct mdw_cmd *c)
+{
+	struct mdw_rv_dev *mrdev =
+				(struct mdw_rv_dev *)mpriv->mdev->dev_specific;
+	struct mdw_rv_cmd *rc = NULL;
+	int ret = 0;
+
+	rc = mdw_rv_cmd_create(mpriv, c);
+	if (!rc) {
+		ret = -EINVAL;
+		goto out;
+	}
+
+	mutex_lock(&mrdev->mtx);
+	ret = mdw_rv_dev_send_cmd(mrdev, rc);
+	if (ret)
+		mdw_rv_cmd_delete(rc);
+	mutex_unlock(&mrdev->mtx);
+
+out:
+	return ret;
+}
+
+static int mdw_rv_callback(struct rpmsg_device *rpdev, void *data, int len,
+			   void *priv, u32 src)
+{
+	struct mdw_ipi_msg *msg = (struct mdw_ipi_msg *)data;
+	struct mdw_ipi_msg_sync *s_msg = NULL;
+	struct mdw_rv_dev *mrdev = (struct mdw_rv_dev *)priv;
+
+	s_msg = mdw_rv_dev_get_msg(mrdev, msg->sync_id);
+	if (s_msg) {
+		memcpy(&s_msg->msg, msg, sizeof(*msg));
+		mutex_lock(&mrdev->msg_mtx);
+		list_del(&s_msg->ud_item);
+		mutex_unlock(&mrdev->msg_mtx);
+		s_msg->complete(s_msg);
+	}
+
+	return 0;
+}
+
+int mdw_rv_dev_set_param(struct mdw_rv_dev *mrdev, enum mdw_info_type type,
+			 u32 val)
+{
+	struct mdw_ipi_msg msg;
+	int ret = 0;
+
+	memset(&msg, 0, sizeof(msg));
+	msg.id = MDW_IPI_PARAM;
+	memcpy(&msg.p, &mrdev->param, sizeof(msg.p));
+	switch (type) {
+	case MDW_INFO_ULOG:
+		msg.p.uplog = val;
+		break;
+	case MDW_INFO_PREEMPT_POLICY:
+		msg.p.preempt_policy = val;
+		break;
+	case MDW_INFO_SCHED_POLICY:
+		msg.p.sched_policy = val;
+		break;
+	default:
+		ret = -EINVAL;
+		goto out;
+	}
+	ret = mdw_rv_dev_send_sync(mrdev, &msg);
+	if (!ret)
+		memcpy(&mrdev->param, &msg.p, sizeof(msg.p));
+out:
+	return ret;
+}
+
+u32 mdw_rv_dev_get_param(struct mdw_rv_dev *mrdev, enum mdw_info_type type)
+{
+	u32 ret = 0;
+
+	switch (type) {
+	case MDW_INFO_ULOG:
+		ret = (int)mrdev->param.uplog;
+		break;
+	case MDW_INFO_PREEMPT_POLICY:
+		ret = (int)mrdev->param.preempt_policy;
+		break;
+	case MDW_INFO_SCHED_POLICY:
+		ret = (int)mrdev->param.sched_policy;
+		break;
+	case MDW_INFO_NORMAL_TASK_DLA:
+	case MDW_INFO_NORMAL_TASK_DSP:
+	case MDW_INFO_NORMAL_TASK_DMA:
+		dev_warn(mrdev->mdev->dev, "not support(%d)\n", type);
+		break;
+	default:
+		dev_warn(mrdev->mdev->dev, "unknown type(%d)\n", type);
+		ret = -EINVAL;
+		break;
+	}
+
+	return ret;
+}
+
+static int mdw_rv_dev_handshake(struct mdw_rv_dev *mrdev)
+{
+	struct mdw_ipi_msg msg;
+	int ret = 0, type = 0;
+
+	memset(&msg, 0, sizeof(msg));
+	msg.id = MDW_IPI_HANDSHAKE;
+	msg.h.h_id = MDW_IPI_HANDSHAKE_BASIC_INFO;
+	ret = mdw_rv_dev_send_sync(mrdev, &msg);
+	if (ret)
+		goto out;
+
+	if (msg.id != MDW_IPI_HANDSHAKE ||
+	    msg.h.h_id != MDW_IPI_HANDSHAKE_BASIC_INFO) {
+		ret = -EINVAL;
+		goto out;
+	}
+
+	memcpy(mrdev->dev_mask, &msg.h.basic.dev_bmp, sizeof(mrdev->dev_mask));
+	mrdev->rv_version = msg.h.basic.version;
+
+	do {
+		type = find_next_bit(mrdev->dev_mask, APUSYS_DEVICE_MAX, type);
+		if (type >= APUSYS_DEVICE_MAX)
+			break;
+
+		memset(&msg, 0, sizeof(msg));
+		msg.id = MDW_IPI_HANDSHAKE;
+		msg.h.h_id = MDW_IPI_HANDSHAKE_DEV_NUM;
+		msg.h.dev.type = type;
+		ret = mdw_rv_dev_send_sync(mrdev, &msg);
+		if (ret)
+			break;
+
+		if (msg.id != MDW_IPI_HANDSHAKE ||
+		    msg.h.h_id != MDW_IPI_HANDSHAKE_DEV_NUM) {
+			ret = -EINVAL;
+			break;
+		}
+
+		mrdev->dev_num[msg.h.dev.type] = msg.h.dev.num;
+		memcpy(&mrdev->meta_data[msg.h.dev.type][0],
+		       msg.h.dev.meta, sizeof(msg.h.dev.meta));
+		type++;
+	} while (type < APUSYS_DEVICE_MAX);
+
+out:
+	return ret;
+}
+
+static void mdw_rv_dev_init_func(struct work_struct *wk)
+{
+	struct mdw_rv_dev *mrdev = container_of(wk, struct mdw_rv_dev, init_wk);
+	struct mdw_device *mdev = mrdev->mdev;
+	int ret = 0;
+
+	ret = mdw_rv_dev_handshake(mrdev);
+	if (ret) {
+		pr_err("handshake fail(%d)\n", ret);
+		return;
+	}
+
+	memcpy(mdev->dev_mask, mrdev->dev_mask, sizeof(mrdev->dev_mask));
+	mdev->inited = true;
+}
+
+int mdw_rv_dev_init(struct mdw_device *mdev)
+{
+	struct rpmsg_channel_info chinfo = {};
+	struct mdw_rv_dev *mrdev = NULL;
+	int ret = 0;
+
+	if (!mdev->rpdev) {
+		dev_err(mdev->dev, "rpdev is NULL\n");
+		ret = -EINVAL;
+		goto out;
+	}
+
+	mrdev = kvzalloc(sizeof(*mrdev), GFP_KERNEL);
+	if (!mrdev)
+		return -ENOMEM;
+
+	mdev->dev_specific = mrdev;
+	mrdev->mdev = mdev;
+	mrdev->rpdev = mdev->rpdev;
+
+	strscpy(chinfo.name, mrdev->rpdev->id.name, RPMSG_NAME_SIZE);
+	chinfo.src = mrdev->rpdev->src;
+	chinfo.dst = RPMSG_ADDR_ANY;
+	mrdev->ept = rpmsg_create_ept(mrdev->rpdev, mdw_rv_callback, mrdev,
+				      chinfo);
+	if (!mrdev->ept) {
+		dev_err(mdev->dev, "create ept fail\n");
+		ret = -ENODEV;
+		goto free_mrdev;
+	}
+
+	/* init up dev */
+	mutex_init(&mrdev->msg_mtx);
+	mutex_init(&mrdev->mtx);
+	INIT_LIST_HEAD(&mrdev->s_list);
+	INIT_WORK(&mrdev->init_wk, &mdw_rv_dev_init_func);
+
+	schedule_work(&mrdev->init_wk);
+
+	goto out;
+
+free_mrdev:
+	kvfree(mrdev);
+	mdev->dev_specific = NULL;
+out:
+	return ret;
+}
+
+void mdw_rv_dev_deinit(struct mdw_device *mdev)
+{
+	struct mdw_rv_dev *mrdev = (struct mdw_rv_dev *)mdev->dev_specific;
+
+	if (!mrdev)
+		return;
+
+	rpmsg_destroy_ept(mrdev->ept);
+	kvfree(mrdev);
+	mdev->dev_specific = NULL;
+}
diff --git a/drivers/soc/mediatek/apusys/mdw-rv-msg.h b/drivers/soc/mediatek/apusys/mdw-rv-msg.h
new file mode 100644
index 000000000000..b0a21bd50060
--- /dev/null
+++ b/drivers/soc/mediatek/apusys/mdw-rv-msg.h
@@ -0,0 +1,90 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2021 MediaTek Inc.
+ */
+
+#ifndef __MTK_APU_MDW_RV_MSG__
+#define __MTK_APU_MDW_RV_MSG__
+
+/* mdw queue cmd type */
+enum {
+	MDW_IPI_NONE,
+	MDW_IPI_APU_CMD,
+	MDW_IPI_HANDSHAKE,
+	MDW_IPI_PARAM,
+	MDW_IPI_USER,
+	MDW_IPI_MAX = 0x20,
+};
+
+enum {
+	MDW_IPI_HANDSHAKE_BASIC_INFO,
+	MDW_IPI_HANDSHAKE_DEV_NUM,
+	MDW_IPI_HANDSHAKE_TASK_NUM,
+};
+
+enum {
+	MDW_IPI_MSG_STATUS_OK,
+	MDW_IPI_MSG_STATUS_BUSY,
+	MDW_IPI_MSG_STATUS_ERR,
+	MDW_IPI_MSG_STATUS_TIMEOUT,
+};
+
+struct mdw_ipi_ucmd {
+	u32 dev_type;
+	u32 dev_idx;
+	u64 iova;
+	u32 size;
+};
+
+struct mdw_ipi_apu_cmd {
+	u64 start_ts_ns; // cmd time
+	u64 iova;
+	u32 size;
+};
+
+struct mdw_ipi_handshake {
+	u32 h_id;
+	union {
+		struct {
+			u64 magic;
+			u32 version;
+			u64 dev_bmp;
+		} basic;
+		struct {
+			u32 type;
+			u32 num;
+			u8 meta[MDW_DEV_META_SIZE];
+		} dev;
+		struct {
+			u32 type;
+			u32 norm_task_num;
+			u32 deadline_task_num;
+		} task;
+	};
+};
+
+struct mdw_ipi_param {
+	u32 uplog;
+	u32 preempt_policy;
+	u32 sched_policy;
+};
+
+struct mdw_ipi_msg {
+	u64 sync_id;
+	u32 id; //ipi id
+	s32 ret;
+	union {
+		struct mdw_ipi_apu_cmd c;
+		struct mdw_ipi_handshake h;
+		struct mdw_ipi_param p;
+		struct mdw_ipi_ucmd u;
+	};
+} __packed;
+
+struct mdw_ipi_msg_sync {
+	struct mdw_ipi_msg msg;
+	struct list_head ud_item;
+	struct completion cmplt;
+	void (*complete)(struct mdw_ipi_msg_sync *s_msg);
+};
+#endif
diff --git a/drivers/soc/mediatek/apusys/mdw-rv.c b/drivers/soc/mediatek/apusys/mdw-rv.c
new file mode 100644
index 000000000000..3c825b89b3e9
--- /dev/null
+++ b/drivers/soc/mediatek/apusys/mdw-rv.c
@@ -0,0 +1,131 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2021 MediaTek Inc.
+ */
+
+#include "mdw.h"
+#include "mdw-rv.h"
+
+static int mdw_rv_sw_init(struct mdw_device *mdev)
+{
+	int ret = 0, i = 0;
+	struct mdw_rv_dev *rdev = (struct mdw_rv_dev *)mdev->dev_specific;
+	struct mdw_dinfo *d = NULL;
+
+	/* update device info */
+	for (i = 0; i < MDW_DEV_MAX; i++) {
+		if (!test_bit(i, rdev->dev_mask) || mdev->dinfos[i])
+			continue;
+
+		/* setup mdev's info */
+		d = kvzalloc(sizeof(*d), GFP_KERNEL);
+		if (!d)
+			goto free_dinfo;
+
+		d->num = rdev->dev_num[i];
+		d->type = i;
+
+		memcpy(d->meta, &rdev->meta_data[i][0], sizeof(d->meta));
+
+		mdev->dinfos[i] = d;
+		bitmap_set(mdev->dev_mask, i, 1);
+	}
+
+	goto out;
+
+free_dinfo:
+	for (i = 0; i < MDW_DEV_MAX; i++) {
+		if (mdev->dinfos[i]) {
+			kvfree(mdev->dinfos[i]);
+			mdev->dinfos[i] = NULL;
+		}
+	}
+	ret = -ENOMEM;
+out:
+	return ret;
+}
+
+static void mdw_rv_sw_deinit(struct mdw_device *mdev)
+{
+	unsigned int i = 0;
+
+	for (i = 0; i < MDW_DEV_MAX; i++) {
+		if (mdev->dinfos[i]) {
+			kvfree(mdev->dinfos[i]);
+			mdev->dinfos[i] = NULL;
+		}
+	}
+}
+
+static int mdw_rv_late_init(struct mdw_device *mdev)
+{
+	int ret = 0;
+
+	ret = mdw_rv_dev_init(mdev);
+	if (ret || !mdev->dev_specific) {
+		dev_err(mdev->dev, "init mdw rvdev fail(%d)\n", ret);
+		goto dev_deinit;
+	}
+
+	goto out;
+
+dev_deinit:
+	mdw_rv_dev_deinit(mdev);
+out:
+	return ret;
+}
+
+static void mdw_rv_late_deinit(struct mdw_device *mdev)
+{
+	mdw_rv_dev_deinit(mdev);
+}
+
+static int mdw_rv_run_cmd(struct mdw_fpriv *mpriv, struct mdw_cmd *c)
+{
+	return mdw_rv_dev_run_cmd(mpriv, c);
+}
+
+static int mdw_rv_set_power(struct mdw_device *mdev, u32 type, u32 idx,
+			    u32 boost)
+{
+	return -EINVAL;
+}
+
+static int mdw_rv_ucmd(struct mdw_device *mdev, u32 type, void *vaddr,
+		       u32 size)
+{
+	return -EINVAL;
+}
+
+static int mdw_rv_set_param(struct mdw_device *mdev, enum mdw_info_type type,
+			    u32 val)
+{
+	struct mdw_rv_dev *mrdev = (struct mdw_rv_dev *)mdev->dev_specific;
+
+	return mdw_rv_dev_set_param(mrdev, type, val);
+}
+
+static u32 mdw_rv_get_info(struct mdw_device *mdev, enum mdw_info_type type)
+{
+	struct mdw_rv_dev *mrdev = (struct mdw_rv_dev *)mdev->dev_specific;
+
+	return mdw_rv_dev_get_param(mrdev, type);
+}
+
+static const struct mdw_dev_func mdw_rv_func = {
+	.sw_init = mdw_rv_sw_init,
+	.sw_deinit = mdw_rv_sw_deinit,
+	.late_init = mdw_rv_late_init,
+	.late_deinit = mdw_rv_late_deinit,
+	.run_cmd = mdw_rv_run_cmd,
+	.set_power = mdw_rv_set_power,
+	.ucmd = mdw_rv_ucmd,
+	.set_param = mdw_rv_set_param,
+	.get_info = mdw_rv_get_info,
+};
+
+void mdw_rv_set_func(struct mdw_device *mdev)
+{
+	mdev->dev_funcs = &mdw_rv_func;
+	mdev->uapi_ver = MDW_UAPI_VERSION;
+}
diff --git a/drivers/soc/mediatek/apusys/mdw-rv.h b/drivers/soc/mediatek/apusys/mdw-rv.h
new file mode 100644
index 000000000000..dbaffc228091
--- /dev/null
+++ b/drivers/soc/mediatek/apusys/mdw-rv.h
@@ -0,0 +1,98 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2021 MediaTek Inc.
+ */
+
+#ifndef __MTK_APU_MDW_RV_H__
+#define __MTK_APU_MDW_RV_H__
+
+#include "mdw.h"
+#include "mdw-rv-msg.h"
+
+struct mdw_rv_dev {
+	struct rpmsg_device *rpdev;
+	struct rpmsg_endpoint *ept;
+	struct mdw_device *mdev;
+
+	struct mdw_ipi_param param;
+
+	struct list_head s_list; /* for sync msg */
+	struct mutex msg_mtx;
+	struct mutex mtx; /* protect send cmd */
+
+	struct work_struct init_wk;
+
+	/* rv information */
+	u32 rv_version;
+	unsigned long dev_mask[BITS_TO_LONGS(MDW_DEV_MAX)];
+	u8 dev_num[MDW_DEV_MAX];
+	u8 meta_data[MDW_DEV_MAX][MDW_DEV_META_SIZE];
+};
+
+struct mdw_rv_cmd {
+	struct mdw_cmd *c;
+	struct mdw_mem *cb;
+	struct list_head u_item; /* to usr list */
+	struct mdw_ipi_msg_sync s_msg; /* for ipi */
+	u64 start_ts_ns; /* create time at ap */
+};
+
+struct mdw_rv_msg_cmd {
+	/* ids */
+	u64 session_id;
+	u64 cmd_id;
+	/* exec infos */
+	u64 exec_infos;
+	u32 exec_size;
+	/* params */
+	u32 priority;
+	u32 hardlimit;
+	u32 softlimit;
+	u32 power_save;
+	u32 power_plcy;
+	u32 power_dtime;
+	u32 app_type;
+	u32 num_subcmds;
+	u32 subcmds_offset;
+	u32 num_cmdbufs;
+	u32 cmdbuf_infos_offset;
+	u32 adj_matrix_offset;
+} __packed;
+
+struct mdw_rv_msg_sc {
+	/* params */
+	u32 type;
+	u32 suggest_time;
+	u32 vlm_usage;
+	u32 vlm_ctx_id;
+	u32 vlm_force;
+	u32 boost;
+	u32 turbo_boost;
+	u32 min_boost;
+	u32 max_boost;
+	u32 hse_en;
+	u32 driver_time;
+	u32 ip_time;
+	u32 bw;
+	u32 pack_id;
+	/* cmdbufs info */
+	u32 cmdbuf_start_idx;
+	u32 num_cmdbufs;
+} __packed;
+
+struct mdw_rv_msg_cb {
+	u64 device_va;
+	u32 size;
+} __packed;
+
+int mdw_rv_dev_init(struct mdw_device *mdev);
+void mdw_rv_dev_deinit(struct mdw_device *mdev);
+int mdw_rv_dev_run_cmd(struct mdw_fpriv *mpriv, struct mdw_cmd *c);
+int mdw_rv_dev_set_param(struct mdw_rv_dev *mrdev, u32 idx, u32 val);
+u32 mdw_rv_dev_get_param(struct mdw_rv_dev *mrdev, u32 idx);
+
+struct mdw_rv_cmd *mdw_rv_cmd_create(struct mdw_fpriv *mpriv,
+				     struct mdw_cmd *c);
+int mdw_rv_cmd_delete(struct mdw_rv_cmd *rc);
+void mdw_rv_cmd_done(struct mdw_rv_cmd *rc, int ret);
+#endif
diff --git a/drivers/soc/mediatek/apusys/mdw-sysfs.c b/drivers/soc/mediatek/apusys/mdw-sysfs.c
new file mode 100644
index 000000000000..46538ab9c196
--- /dev/null
+++ b/drivers/soc/mediatek/apusys/mdw-sysfs.c
@@ -0,0 +1,200 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2021 MediaTek Inc.
+ */
+
+#include <linux/device.h>
+#include <linux/kernel.h>
+#include <linux/string.h>
+#include <linux/sysfs.h>
+#include <linux/uaccess.h>
+
+#include "mdw.h"
+
+static ssize_t dsp_task_num_show(struct device *dev,
+				 struct device_attribute *attr, char *buf)
+{
+	struct mdw_device *mdev = dev_get_drvdata(dev);
+	int ret = 0;
+	u32 num = 0;
+
+	num = mdev->dev_funcs->get_info(mdev, MDW_INFO_NORMAL_TASK_DSP);
+	ret = sprintf(buf, "%u\n", num);
+
+	return ret;
+}
+static DEVICE_ATTR_RO(dsp_task_num);
+
+static ssize_t dla_task_num_show(struct device *dev,
+				 struct device_attribute *attr, char *buf)
+{
+	struct mdw_device *mdev = dev_get_drvdata(dev);
+	int ret = 0;
+	u32 num = 0;
+
+	num = mdev->dev_funcs->get_info(mdev, MDW_INFO_NORMAL_TASK_DLA);
+	ret = sprintf(buf, "%u\n", num);
+
+	return ret;
+}
+static DEVICE_ATTR_RO(dla_task_num);
+
+static ssize_t dma_task_num_show(struct device *dev,
+				 struct device_attribute *attr, char *buf)
+{
+	struct mdw_device *mdev = dev_get_drvdata(dev);
+	int ret = 0;
+	u32 num = 0;
+
+	num = mdev->dev_funcs->get_info(mdev, MDW_INFO_NORMAL_TASK_DMA);
+	ret = sprintf(buf, "%u\n", num);
+
+	return ret;
+}
+static DEVICE_ATTR_RO(dma_task_num);
+
+static struct attribute *mdw_task_attrs[] = {
+	&dev_attr_dsp_task_num.attr,
+	&dev_attr_dla_task_num.attr,
+	&dev_attr_dma_task_num.attr,
+	NULL,
+};
+
+static struct attribute_group mdw_devinfo_attr_group = {
+	.name	= "queue",
+	.attrs	= mdw_task_attrs,
+};
+
+static ssize_t policy_show(struct device *dev,
+			   struct device_attribute *attr, char *buf)
+{
+	return -EINVAL;
+}
+
+static ssize_t policy_store(struct device *dev, struct device_attribute *attr,
+			    const char *buf, size_t count)
+{
+	return -EINVAL;
+}
+static DEVICE_ATTR_RW(policy);
+
+static struct attribute *mdw_sched_attrs[] = {
+	&dev_attr_policy.attr,
+	NULL,
+};
+
+static struct attribute_group mdw_sched_attr_group = {
+	.name	= "sched",
+	.attrs	= mdw_sched_attrs,
+};
+
+static ssize_t mem_statistics_show(struct device *dev,
+				   struct device_attribute *attr, char *buf)
+{
+	int n = 0;
+
+	return n;
+}
+static DEVICE_ATTR_RO(mem_statistics);
+
+static struct attribute *mdw_mem_attrs[] = {
+	&dev_attr_mem_statistics.attr,
+	NULL,
+};
+
+static struct attribute_group mdw_mem_attr_group = {
+	.name	= "memory",
+	.attrs	= mdw_mem_attrs,
+};
+
+static ssize_t ulog_show(struct device *dev, struct device_attribute *attr,
+			 char *buf)
+{
+	struct mdw_device *mdev = dev_get_drvdata(dev);
+	int ret = 0;
+	u32 log_lv = 0;
+
+	log_lv = mdev->dev_funcs->get_info(mdev, MDW_INFO_ULOG);
+	ret = sprintf(buf, "%u\n", log_lv);
+
+	return ret;
+}
+
+static ssize_t ulog_store(struct device *dev, struct device_attribute *attr,
+			  const char *buf,
+	size_t count)
+{
+	struct mdw_device *mdev = dev_get_drvdata(dev);
+	u32 val = 0;
+
+	if (!kstrtouint(buf, 10, &val))
+		mdev->dev_funcs->set_param(mdev, MDW_INFO_ULOG, val);
+
+	return count;
+}
+static DEVICE_ATTR_RW(ulog);
+
+static ssize_t klog_show(struct device *dev, struct device_attribute *attr,
+			 char *buf)
+{
+	struct mdw_device *mdev = dev_get_drvdata(dev);
+	int ret = 0;
+	u32 log_lv = 0;
+
+	log_lv = mdev->dev_funcs->get_info(mdev, MDW_INFO_KLOG);
+	ret = sprintf(buf, "%u\n", log_lv);
+
+	return ret;
+}
+
+static ssize_t klog_store(struct device *dev, struct device_attribute *attr,
+			  const char *buf, size_t count)
+{
+	struct mdw_device *mdev = dev_get_drvdata(dev);
+	u32 val = 0;
+
+	if (!kstrtouint(buf, 10, &val))
+		mdev->dev_funcs->set_param(mdev, MDW_INFO_KLOG, val);
+
+	return count;
+}
+static DEVICE_ATTR_RW(klog);
+
+static struct attribute *mdw_log_attrs[] = {
+	&dev_attr_ulog.attr,
+	&dev_attr_klog.attr,
+	NULL,
+};
+
+static struct attribute_group mdw_log_attr_group = {
+	.name	= "log",
+	.attrs	= mdw_log_attrs,
+};
+
+int mdw_sysfs_init(struct mdw_device *mdev)
+{
+	int ret = 0;
+
+	dev_set_drvdata(mdev->misc_dev.this_device, mdev);
+
+	ret = sysfs_create_group(&mdev->misc_dev.this_device->kobj,
+				 &mdw_devinfo_attr_group);
+	ret |= sysfs_create_group(&mdev->misc_dev.this_device->kobj,
+				 &mdw_sched_attr_group);
+	ret |= sysfs_create_group(&mdev->misc_dev.this_device->kobj,
+				 &mdw_log_attr_group);
+	ret |= sysfs_create_group(&mdev->misc_dev.this_device->kobj,
+				 &mdw_mem_attr_group);
+
+	return ret;
+}
+
+void mdw_sysfs_deinit(struct mdw_device *mdev)
+{
+	struct device *dev = mdev->misc_dev.this_device;
+
+	sysfs_remove_group(&dev->kobj, &mdw_mem_attr_group);
+	sysfs_remove_group(&dev->kobj, &mdw_log_attr_group);
+	sysfs_remove_group(&dev->kobj, &mdw_sched_attr_group);
+	sysfs_remove_group(&dev->kobj, &mdw_devinfo_attr_group);
+}
diff --git a/drivers/soc/mediatek/apusys/mdw.h b/drivers/soc/mediatek/apusys/mdw.h
new file mode 100644
index 000000000000..e65e246f6494
--- /dev/null
+++ b/drivers/soc/mediatek/apusys/mdw.h
@@ -0,0 +1,208 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2021 MediaTek Inc.
+ */
+
+#ifndef __MTK_APU_MDW_H__
+#define __MTK_APU_MDW_H__
+
+#include <linux/dma-direction.h>
+#include <linux/dma-fence.h>
+#include <linux/hashtable.h>
+#include <linux/iopoll.h>
+#include <linux/irqreturn.h>
+#include <linux/miscdevice.h>
+#include <linux/of_device.h>
+#include <linux/scatterlist.h>
+#include <linux/slab.h>
+#include <linux/types.h>
+
+#include "apu-core.h"
+#include "apu-device.h"
+#include "mdw-ioctl.h"
+
+#define MDW_NAME "apusys"
+#define MDW_DEV_MAX (APUSYS_DEVICE_MAX)
+#define MDW_SUBCMD_MAX (63)
+#define MDW_PRIORITY_MAX (32)
+#define MDW_BOOST_MAX (100)
+#define MDW_DEFAULT_ALIGN (16)
+#define MDW_UAPI_VERSION (2)
+
+#define MDW_ALIGN(x, align) (((x) + (align) - 1) & (~((align) - 1)))
+
+enum mdw_info_type {
+	MDW_INFO_KLOG,
+	MDW_INFO_ULOG,
+	MDW_INFO_PREEMPT_POLICY,
+	MDW_INFO_SCHED_POLICY,
+
+	MDW_INFO_NORMAL_TASK_DLA,
+	MDW_INFO_NORMAL_TASK_DSP,
+	MDW_INFO_NORMAL_TASK_DMA,
+
+	MDW_INFO_MAX,
+};
+
+struct mdw_fpriv;
+struct mdw_device;
+
+enum mdw_mem_type {
+	MDW_MEM_TYPE_NONE,
+	MDW_MEM_TYPE_INTERNAL,
+	MDW_MEM_TYPE_ALLOC,
+	MDW_MEM_TYPE_IMPORT,
+};
+
+struct mdw_mem {
+	/* in */
+	unsigned int size;
+	unsigned int align;
+	u64 flags;
+	struct mdw_fpriv *mpriv;
+	bool need_handle;
+
+	/* out */
+	int handle;
+	void *vaddr;
+	u64 device_va;
+	u32 dva_size;
+	void *priv;
+
+	/* control */
+	enum mdw_mem_type type;
+	struct list_head u_item;
+	struct list_head m_item;
+	struct kref map_ref;
+	void (*release)(struct mdw_mem *m);
+};
+
+struct mdw_dinfo {
+	u32 type;
+	u32 num;
+	u8 meta[MDW_DEV_META_SIZE];
+};
+
+struct mdw_device {
+	struct rpmsg_device *rpdev;
+	struct device *dev;
+	struct miscdevice misc_dev;
+	struct device *dma_dev;
+
+	bool inited;
+	atomic_t sw_inited;
+
+	u64 vlm_start;
+	u32 vlm_size;
+
+	u32 uapi_ver;
+
+	unsigned long dev_mask[BITS_TO_LONGS(MDW_DEV_MAX)];
+	struct mdw_dinfo *dinfos[MDW_DEV_MAX];
+
+	const struct mdw_dev_func *dev_funcs;
+	void *dev_specific;
+};
+
+struct mdw_fpriv {
+	struct mdw_device *mdev;
+
+	struct list_head mems;
+	struct list_head cmds;
+	struct mutex mtx; /* protect mems */
+
+	/* ref count for cmd/mem */
+	struct kref ref;
+	void (*get)(struct mdw_fpriv *mpriv);
+	void (*put)(struct mdw_fpriv *mpriv);
+};
+
+struct mdw_exec_info {
+	struct mdw_cmd_exec_info c;
+	struct mdw_subcmd_exec_info sc;
+};
+
+struct mdw_subcmd_kinfo {
+	struct mdw_subcmd_info *info; /* c->subcmds */
+	struct mdw_subcmd_cmdbuf *cmdbufs; /* from usr */
+	struct mdw_mem **ori_cbs; /* pointer to original cmdbuf */
+	struct mdw_subcmd_exec_info *sc_einfo;
+	u64 *kvaddrs; /* pointer to duplicated buf */
+	u64 *daddrs; /* pointer to duplicated buf */
+	void *priv; /* mdw_ap_sc */
+};
+
+struct mdw_fence {
+	struct dma_fence base_fence;
+	struct mdw_device *mdev;
+	spinlock_t lock; /* used by dma_fence_init */
+};
+
+struct mdw_cmd {
+	pid_t pid;
+	pid_t tgid;
+	u64 kid;
+	u64 uid;
+	u64 usr_id;
+	u32 priority;
+	u32 hardlimit;
+	u32 softlimit;
+	u32 power_save;
+	u32 power_plcy;
+	u32 power_dtime;
+	u32 app_type;
+	u32 num_subcmds;
+	struct mdw_subcmd_info *subcmds; /* from usr */
+	struct mdw_subcmd_kinfo *ksubcmds;
+	u32 num_cmdbufs;
+	u32 size_cmdbufs;
+	struct mdw_mem *cmdbufs;
+	struct mdw_mem *exec_infos;
+	struct mdw_exec_info *einfos;
+	u8 *adj_matrix;
+
+	struct list_head u_item;
+
+	struct timespec64 start_ts;
+	struct timespec64 end_ts;
+
+	struct mdw_fpriv *mpriv;
+	int (*complete)(struct mdw_cmd *c, int ret);
+
+	struct mdw_fence *fence;
+	struct work_struct t_wk;
+	struct dma_fence *wait_fence;
+};
+
+struct mdw_dev_func {
+	int (*late_init)(struct mdw_device *mdev);
+	void (*late_deinit)(struct mdw_device *mdev);
+	int (*sw_init)(struct mdw_device *mdev);
+	void (*sw_deinit)(struct mdw_device *mdev);
+
+	int (*run_cmd)(struct mdw_fpriv *mpriv, struct mdw_cmd *c);
+	int (*set_power)(struct mdw_device *mdev, u32 type, u32 idx, u32 boost);
+	int (*ucmd)(struct mdw_device *mdev, u32 type, void *vaddr, u32 size);
+	int (*set_param)(struct mdw_device *mdev, enum mdw_info_type type,
+			 u32 val);
+	u32 (*get_info)(struct mdw_device *mdev, enum mdw_info_type type);
+};
+
+void mdw_rv_set_func(struct mdw_device *mdev);
+
+long mdw_ioctl(struct file *filep, unsigned int cmd, unsigned long arg);
+int mdw_cmd_ioctl(struct mdw_fpriv *mpriv, void *data);
+
+void mdw_mem_mpriv_release(struct mdw_fpriv *mpriv);
+
+int mdw_mem_flush(struct mdw_mem *m);
+int mdw_mem_invalidate(struct mdw_mem *m);
+
+#ifdef CONFIG_DEBUG_FS
+int mdw_sysfs_init(struct mdw_device *mdev);
+void mdw_sysfs_deinit(struct mdw_device *mdev);
+#endif
+
+int mdw_dev_init(struct mdw_device *mdev);
+void mdw_dev_deinit(struct mdw_device *mdev);
+#endif
-- 
2.18.0

