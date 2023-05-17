Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3867706BB6
	for <lists+dri-devel@lfdr.de>; Wed, 17 May 2023 16:53:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60F0710E437;
	Wed, 17 May 2023 14:53:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FCAA10E435
 for <dri-devel@lists.freedesktop.org>; Wed, 17 May 2023 14:52:52 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3093a7b71fbso825654f8f.2
 for <dri-devel@lists.freedesktop.org>; Wed, 17 May 2023 07:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1684335170; x=1686927170; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gDAViNn0OrgwOgKdIFqM87DFD/WIAZjGkg0w/gGFC28=;
 b=b495HJazHg0Ng27LlsAm3lPCnV9VhpPRLWdZE53fQIFVlD4GU+RbhZ1cJxnPFSwNdA
 HcaYLSCPi8KOFmOurLVZGHGjMdxvn88lPghdx5er/Cbi80/umddsZ7zO7m2tfEKWAhHc
 Rqe1i2VZkgTZsDe+1kw0bFvr6vSS0qmPSkat6oGaCBi2YGGwpbLADvUKY5s+nOHaRvu1
 +EOiiQJVgnUepfVjzu0RsyNAp0X31Wa1aYGegDiRLMw1IcY0tpQwpSvMMS9BhqIuQHi/
 NhnXfgb2H6jxdQcJSlExIsKcli4wUAZtwv/AwuTZ9eaOWwnCkE7hpmg7NpPu/uYhFXMz
 nqew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684335170; x=1686927170;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gDAViNn0OrgwOgKdIFqM87DFD/WIAZjGkg0w/gGFC28=;
 b=Rsy3hm6TU1hK9fZitLWpk+22+Rgh7oeJHfwPrVuRvFplHpO4TwTviBPTFnh2YCKBnt
 TZjgPCl7pYuvxZqrLfkKgNnYtB/NgwXyCCE7XXYUNCFYWZhjq55xfe2wWwrDyquHK/ft
 5mBOQqH089lMeb0pTjgXmvHwIZXVclsnk/+PMeMBKEY75z8zlqKPq3FAm/l5Sz79OVYq
 LQDwC5ZER/QSk0Whr2NqaConXw0Df9MbPmlLg/Ll00+x6URLYS0MUDTBmi0BibzD3WEC
 QZLH5dfdzRdSeMwVHKy9tvlHOnHHQ2CdIIl/e7j1ITqh3w6IoCTnxgNPEVO9Uw7GEc+8
 Bzyg==
X-Gm-Message-State: AC+VfDynG8ZHqlCwaQ2h9RnzSGoM3kpu4KlvLNLh7xTvXHt3sihspVZl
 o51RpFZdO3iEXa7OdlrHE8IMhw==
X-Google-Smtp-Source: ACHHUZ6w4HWznKUY4Y6qU6rnRMXtzFEUnhSSv/0/k9+B8KB7LLKW0IPbU1ofdiJQhKloHX5gMjZa9w==
X-Received: by 2002:a5d:5445:0:b0:306:2bb6:c7c3 with SMTP id
 w5-20020a5d5445000000b003062bb6c7c3mr921325wrv.6.1684335170471; 
 Wed, 17 May 2023 07:52:50 -0700 (PDT)
Received: from blaptop.baylibre
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id
 v11-20020a5d678b000000b002f7780eee10sm2979098wru.59.2023.05.17.07.52.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 May 2023 07:52:49 -0700 (PDT)
From: Alexandre Bailon <abailon@baylibre.com>
To: airlied@gmail.com, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de
Subject: [PATCH 6/7] drm/apu: Add support for a simulated APU
Date: Wed, 17 May 2023 16:52:36 +0200
Message-Id: <20230517145237.295461-7-abailon@baylibre.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230517145237.295461-1-abailon@baylibre.com>
References: <20230517145237.295461-1-abailon@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, bero@baylibre.com,
 khilman@baylibre.com, jstephan@baylibre.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, christian.koenig@amd.com,
 linaro-mm-sig@lists.linaro.org, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, nbelin@baylibre.com,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 linux-media@vger.kernel.org, sumit.semwal@linaro.org,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Julien Stephan <jstephan@baylibre.com>

This implements a driver to use with a simulation APU.

This is useful for testing purpose and can be used as a basis to
implement real platform driver.
Communication between the simulated APU and the driver is done
using netlink socket.

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 drivers/gpu/drm/apu/Kconfig    |   9 +
 drivers/gpu/drm/apu/Makefile   |   3 +
 drivers/gpu/drm/apu/simu_apu.c | 313 +++++++++++++++++++++++++++++++++
 3 files changed, 325 insertions(+)
 create mode 100644 drivers/gpu/drm/apu/simu_apu.c

diff --git a/drivers/gpu/drm/apu/Kconfig b/drivers/gpu/drm/apu/Kconfig
index a769df42091c..e0ffc166497c 100644
--- a/drivers/gpu/drm/apu/Kconfig
+++ b/drivers/gpu/drm/apu/Kconfig
@@ -11,3 +11,12 @@ config DRM_APU
 	  communicate with an AI Processor Unit (APU).
 	  The driver intends to provide a common infrastructure that may be
 	  used to support many different APU.
+
+config DRM_SIMU_APU
+	tristate "SIMULATION APU DRM driver"
+	depends on DRM_APU
+	default n
+	help
+	  This provides a driver using netlink socket to communicate
+	  with a simu APU.
+	  This is useful for simulation and testing of libAPU stack.
diff --git a/drivers/gpu/drm/apu/Makefile b/drivers/gpu/drm/apu/Makefile
index fc8d6380fc38..0b007854a07f 100644
--- a/drivers/gpu/drm/apu/Makefile
+++ b/drivers/gpu/drm/apu/Makefile
@@ -4,4 +4,7 @@ drm_apu-y += apu_drv.o
 drm_apu-y += apu_gem.o
 drm_apu-y += apu_sched.o
 
+drm_simu_apu-y += simu_apu.o
+
 obj-$(CONFIG_DRM_APU) += drm_apu.o
+obj-$(CONFIG_DRM_SIMU_APU) += drm_simu_apu.o
diff --git a/drivers/gpu/drm/apu/simu_apu.c b/drivers/gpu/drm/apu/simu_apu.c
new file mode 100644
index 000000000000..5557f8b78a83
--- /dev/null
+++ b/drivers/gpu/drm/apu/simu_apu.c
@@ -0,0 +1,313 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// Copyright 2023 BayLibre SAS
+
+#include <linux/module.h>
+#include <linux/netlink.h>
+#include <linux/platform_device.h>
+#include <linux/skbuff.h>
+
+#include <net/sock.h>
+
+#include <drm/apu_drm.h>
+
+#include "apu_internal.h"
+
+
+#define MYPROTO 17
+#define MYGRP 17
+
+#define DRIVER_NAME "SIMU APU DRIVER"
+
+/*
+ * Firmware request, must be aligned with the one defined in firmware.
+ * @id: Request id, used in the case of reply, to find the pending request
+ * @cmd: The command id to execute in the firmware
+ * @result: The result of the command executed on the firmware
+ * @size: The size of the data available in this request
+ * @count: The number of shared buffer
+ * @data: Contains the data attached with the request if size is greater than
+ *	zero, and the addresses of shared buffers if count is greater than
+ *	zero. Both the data and the shared buffer could be read and write
+ *	by the APU.
+ */
+struct  apu_dev_request {
+	u16 id;
+	u16 cmd;
+	u16 result;
+	u16 size_in;
+	u16 size_out;
+	u16 count;
+	u8 data[0];
+} __packed;
+
+struct platform_device *platform;
+struct apu_core *apu_core;
+static int pid = -1;
+struct sock *nl_sock;
+
+static int apu_netlink_read(struct sk_buff *skb, struct apu_dev_request **msg_ptr, int *pid)
+{
+	struct nlmsghdr *nlh;
+
+	nlh = (struct nlmsghdr *)skb->data;
+	*pid = nlh->nlmsg_pid; /* pid of sending process */
+	*msg_ptr = nlmsg_data(nlh);
+
+	return nlh->nlmsg_len - NLMSG_HDRLEN;
+}
+
+static int apu_netlink_write(void *msg_ptr, int msg_size, int pid)
+{
+	struct sk_buff *skb_out;
+	struct nlmsghdr *nlh;
+	int res;
+
+	skb_out = nlmsg_new(msg_size, 0);
+	if (!skb_out)
+		return -ENOMEM;
+
+	nlh = nlmsg_put(skb_out, 0, 0, NLMSG_DONE, msg_size, 0);
+	NETLINK_CB(skb_out).dst_group = 0; /* not in multicast group */
+	memcpy(nlmsg_data(nlh), msg_ptr, msg_size);
+
+	res = nlmsg_unicast(nl_sock, skb_out, pid);
+
+	if (res < 0)
+		return res;
+	else
+		return nlh->nlmsg_len - NLMSG_HDRLEN;
+}
+
+static void netlink_recv_msg(struct sk_buff *skb)
+{
+	int msg_size;
+	struct apu_dev_request *hdr;
+	int nlmsg_pid;
+
+	msg_size = apu_netlink_read(skb, &hdr, &nlmsg_pid);
+
+	if (pid == -1) {
+		// No device registered yet, the first message should be
+		// "READY"
+		if (!strncmp((char *)hdr, "READY", strlen("READY"))) {
+
+			pid = nlmsg_pid;
+			if (apu_core_register(&platform->dev, apu_core, apu_core->apu))
+				pr_err("cannot register SIMU APU\n");
+		}
+	} else if (pid == nlmsg_pid) {
+		if (!strncmp((char *)hdr, "STOP", strlen("STOP"))) {
+			pid = -1;
+			apu_core_remove(apu_core);
+		} else
+			apu_drm_callback(apu_core, hdr->id, hdr, msg_size);
+	} else {
+		pr_err("%s: Only one core is supported for now\n", DRIVER_NAME);
+	}
+}
+
+static int netlink_setup(void)
+{
+	int ret = 0;
+	struct netlink_kernel_cfg cfg = {
+		.input = netlink_recv_msg,
+	};
+
+	nl_sock = netlink_kernel_create(&init_net, MYPROTO, &cfg);
+	if (!nl_sock)
+		ret = -ENOMEM;
+
+	return ret;
+}
+
+static int simu_apu_send(struct apu_job *job)
+{
+	return apu_netlink_write((void *)(job->request_data), job->request_len, pid);
+}
+
+static int simu_apu_handle_request(struct apu_job *job, void *data, int len)
+{
+	struct apu_dev_request *hdr = data;
+
+	job->result = hdr->result;
+	if (job->size_out)
+		memcpy(job->data_out, hdr->data + job->size_in,
+			min(job->size_out, hdr->size_out));
+	job->size_out = hdr->size_out;
+	return 0;
+}
+
+static int simu_apu_alloc_request(struct apu_job *job)
+{
+	struct apu_dev_request *dev_req;
+
+	int size;
+	u64 *dev_req_da;
+	u32 *dev_req_buffer_size;
+	int i;
+
+	size = sizeof(*dev_req) + (sizeof(u64) + sizeof(u32)) * job->bo_count * 2 +
+		job->size_in + job->size_out;
+	dev_req = kmalloc(size, GFP_KERNEL);
+	if (!dev_req)
+		return -ENOMEM;
+
+	dev_req->cmd = job->cmd;
+	dev_req->size_in = job->size_in;
+	dev_req->size_out = job->size_out;
+	dev_req->count = job->bo_count;
+	dev_req_da =
+	    (u64 *) (dev_req->data + dev_req->size_in + dev_req->size_out);
+	dev_req_buffer_size = (u32 *) (dev_req_da + dev_req->count);
+	memcpy(dev_req->data, job->data_in, job->size_in);
+
+	for (i = 0; i < job->bo_count; i++) {
+		struct apu_gem_object *obj = to_apu_bo(job->bos[i]);
+
+		dev_req_da[i] = drm_vma_node_offset_addr(&obj->base.base.vma_node);
+		dev_req_buffer_size[i] = obj->size;
+	}
+
+	dev_req->id = job->id;
+
+	job->request_data = dev_req;
+	job->request_len = size;
+	return 0;
+}
+
+static int simu_apu_ready(struct apu_core *core)
+{
+	if (pid == -1)
+		return 0;
+
+	return 1;
+}
+
+/**
+ * simu_apu_gem_mmap
+ *
+ * this is directly based on drm_gem_mmap() function but removing the permission
+ * check before mapping a buffer. This is useful here to be able to easily
+ * share buffers between libapu host application and libapu device application
+ * (simulation use case)
+ *
+ */
+static int simu_apu_gem_mmap(struct file *filp, struct vm_area_struct *vma)
+{
+	struct drm_file *priv = filp->private_data;
+	struct drm_device *dev = priv->minor->dev;
+	struct drm_gem_object *obj = NULL;
+	struct drm_vma_offset_node *node;
+	int ret;
+
+	if (drm_dev_is_unplugged(dev))
+		return -ENODEV;
+
+	drm_vma_offset_lock_lookup(dev->vma_offset_manager);
+	node = drm_vma_offset_exact_lookup_locked(dev->vma_offset_manager,
+						  vma->vm_pgoff,
+						  vma_pages(vma));
+	if (likely(node)) {
+		obj = container_of(node, struct drm_gem_object, vma_node);
+		/*
+		 * When the object is being freed, after it hits 0-refcnt it
+		 * proceeds to tear down the object. In the process it will
+		 * attempt to remove the VMA offset and so acquire this
+		 * mgr->vm_lock.  Therefore if we find an object with a 0-refcnt
+		 * that matches our range, we know it is in the process of being
+		 * destroyed and will be freed as soon as we release the lock -
+		 * so we have to check for the 0-refcnted object and treat it as
+		 * invalid.
+		 */
+		if (!kref_get_unless_zero(&obj->refcount)) {
+			obj = NULL;
+			pr_err("DTC: %s: %d\n", __func__, __LINE__);
+		}
+	}
+	drm_vma_offset_unlock_lookup(dev->vma_offset_manager);
+
+	if (!obj)
+		return -EINVAL;
+
+	ret = drm_gem_mmap_obj(obj, drm_vma_node_size(node) << PAGE_SHIFT,
+			       vma);
+
+	drm_gem_object_put(obj);
+
+	return ret;
+}
+
+static struct apu_core_ops simu_apu_ops = {
+	.alloc_prepare_request = simu_apu_alloc_request,
+	.send_request = simu_apu_send,
+	.handle_request = simu_apu_handle_request,
+	.is_ready = simu_apu_ready,
+};
+
+static int __init apu_platform_init(void)
+{
+	int ret;
+	struct apu_drm *apu;
+
+	platform = platform_device_register_simple(DRIVER_NAME, -1, NULL, 0);
+	if (IS_ERR(platform))
+		return PTR_ERR(platform);
+
+	if (!devres_open_group(&platform->dev, NULL, GFP_KERNEL)) {
+		ret = -ENOMEM;
+		goto out_unregister;
+	}
+
+	apu = apu_dev_alloc(&platform->dev);
+	if (!apu) {
+		ret = -ENOMEM;
+		goto out_devres;
+	}
+
+	apu_core = apu_core_alloc(apu, &simu_apu_ops, apu);
+	if (!apu_core) {
+		ret = -ENOMEM;
+		goto out_devres;
+	}
+
+	ret = apu_dev_register(apu);
+	if (ret)
+		goto out_apu_core_free;
+
+	apu->mmap = simu_apu_gem_mmap;
+
+	ret = netlink_setup();
+	if (ret)
+		goto out_apu_dev_unregister;
+
+	return 0;
+
+out_apu_dev_unregister:
+	apu_dev_unregister(apu);
+out_apu_core_free:
+	apu_core_free(apu_core);
+out_devres:
+	devres_release_group(&platform->dev, NULL);
+out_unregister:
+	platform_device_unregister(platform);
+	return ret;
+}
+
+static void __exit apu_platform_exit(void)
+{
+	netlink_kernel_release(nl_sock);
+	apu_core_remove(apu_core);
+	apu_core_free(apu_core);
+	apu_dev_unregister((struct apu_drm *)apu_core->apu);
+	devres_release_group(&platform->dev, NULL);
+	platform_device_unregister(platform);
+}
+
+
+module_init(apu_platform_init);
+module_exit(apu_platform_exit);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Julien Stephan");
+MODULE_DESCRIPTION(DRIVER_NAME);
-- 
2.39.2

