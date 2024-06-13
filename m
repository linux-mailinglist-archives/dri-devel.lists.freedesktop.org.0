Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 809709084A9
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2024 09:25:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B193D10EC54;
	Fri, 14 Jun 2024 07:25:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=habana.ai header.i=@habana.ai header.b="MrnOfBK+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail02.habana.ai (habanamailrelay.habana.ai [213.57.90.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ABF810E289
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 08:29:13 +0000 (UTC)
Received: internal info suppressed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=habana.ai; s=default;
 t=1718266950; bh=RpXpP5vOj6POu+u1JecNvlWflF+oAGFD4QIQMfqahKM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MrnOfBK+Sd/5NLeOC/9JZPR61dwHFDWXAmhM6nSsfLSOg59M62CHpE33D2VSmtrLH
 PO2yfHlwdWSXMKcHysc0CyHY4zul5OoHywm39z8f6owbvWMnVmfg/SS6IJ0OG65aYb
 uEZjwolHlSVMoFHolReTd8nqrBl7CstlcK83I8owyTNRVrvvTNcSoGtr0GWm5Qz+GN
 BLTeVU23mpxVJ7JHUAAOn9kt8DiIxNzcjhitRy7AlwxpeCAF/2DqdtBSVSFZHNCR47
 ko6B5ugGs5u/t5Jk7QAZOlpxAPXnCCRIqma797hwvA6XWhL9FskoVkXnGz9SwL0gJi
 FaLw8fjPEgZQg==
Received: from oshpigelman-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by oshpigelman-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with
 ESMTP id 45D8M8hh1440009; Thu, 13 Jun 2024 11:22:11 +0300
From: Omer Shpigelman <oshpigelman@habana.ai>
To: linux-kernel@vger.kernel.org, linux-rdma@vger.kernel.org,
 netdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: ogabbay@kernel.org, oshpigelman@habana.ai, zyehudai@habana.ai
Subject: [PATCH 12/15] RDMA/hbl: direct verbs support
Date: Thu, 13 Jun 2024 11:22:05 +0300
Message-Id: <20240613082208.1439968-13-oshpigelman@habana.ai>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240613082208.1439968-1-oshpigelman@habana.ai>
References: <20240613082208.1439968-1-oshpigelman@habana.ai>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 14 Jun 2024 07:24:52 +0000
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

Add direct verbs (DV) uAPI.
The added operations are:
query_port: query vendor specific port attributes.
set_port_ex: set port extended settings.
usr_fifo: set user FIFO object for triggering HW doorbells.
encap: set port encapsulation (UDP/IPv4).

Signed-off-by: Omer Shpigelman <oshpigelman@habana.ai>
Co-developed-by: Abhilash K V <kvabhilash@habana.ai>
Signed-off-by: Abhilash K V <kvabhilash@habana.ai>
Co-developed-by: Andrey Agranovich <aagranovich@habana.ai>
Signed-off-by: Andrey Agranovich <aagranovich@habana.ai>
Co-developed-by: Bharat Jauhari <bjauhari@habana.ai>
Signed-off-by: Bharat Jauhari <bjauhari@habana.ai>
Co-developed-by: David Meriin <dmeriin@habana.ai>
Signed-off-by: David Meriin <dmeriin@habana.ai>
Co-developed-by: Sagiv Ozeri <sozeri@habana.ai>
Signed-off-by: Sagiv Ozeri <sozeri@habana.ai>
Co-developed-by: Zvika Yehudai <zyehudai@habana.ai>
Signed-off-by: Zvika Yehudai <zyehudai@habana.ai>
---
 drivers/infiniband/hw/hbl/Kconfig           |   1 +
 drivers/infiniband/hw/hbl/Makefile          |   4 +
 drivers/infiniband/hw/hbl/hbl_encap.c       | 216 +++++++++++++++++
 drivers/infiniband/hw/hbl/hbl_main.c        |  15 ++
 drivers/infiniband/hw/hbl/hbl_query_port.c  |  96 ++++++++
 drivers/infiniband/hw/hbl/hbl_set_port_ex.c |  96 ++++++++
 drivers/infiniband/hw/hbl/hbl_usr_fifo.c    | 252 ++++++++++++++++++++
 7 files changed, 680 insertions(+)
 create mode 100644 drivers/infiniband/hw/hbl/hbl_encap.c
 create mode 100644 drivers/infiniband/hw/hbl/hbl_query_port.c
 create mode 100644 drivers/infiniband/hw/hbl/hbl_set_port_ex.c
 create mode 100644 drivers/infiniband/hw/hbl/hbl_usr_fifo.c

diff --git a/drivers/infiniband/hw/hbl/Kconfig b/drivers/infiniband/hw/hbl/Kconfig
index 90c865a82540..db09ecb3968a 100644
--- a/drivers/infiniband/hw/hbl/Kconfig
+++ b/drivers/infiniband/hw/hbl/Kconfig
@@ -6,6 +6,7 @@
 config INFINIBAND_HBL
 	tristate "HabanaLabs (an Intel Company) InfiniBand driver"
 	depends on NETDEVICES && ETHERNET && PCI && INET
+	depends on INFINIBAND_USER_ACCESS
 	select HABANA_CN
 	help
 	  This driver enables InfiniBand functionality for the network
diff --git a/drivers/infiniband/hw/hbl/Makefile b/drivers/infiniband/hw/hbl/Makefile
index 659d4bbfec0f..86f53ca6b9d5 100644
--- a/drivers/infiniband/hw/hbl/Makefile
+++ b/drivers/infiniband/hw/hbl/Makefile
@@ -6,3 +6,7 @@
 obj-$(CONFIG_INFINIBAND_HBL) := habanalabs_ib.o
 
 habanalabs_ib-y += hbl_main.o hbl_verbs.o
+
+habanalabs_ib-$(CONFIG_INFINIBAND_USER_ACCESS) += hbl_encap.o hbl_query_port.o \
+                                                  hbl_set_port_ex.o \
+                                                  hbl_usr_fifo.o
diff --git a/drivers/infiniband/hw/hbl/hbl_encap.c b/drivers/infiniband/hw/hbl/hbl_encap.c
new file mode 100644
index 000000000000..bcc198059664
--- /dev/null
+++ b/drivers/infiniband/hw/hbl/hbl_encap.c
@@ -0,0 +1,216 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright 2022-2024 HabanaLabs, Ltd.
+ * Copyright (C) 2023-2024, Intel Corporation.
+ * All Rights Reserved.
+ */
+
+#include "hbl.h"
+#include <rdma/ib_user_verbs.h>
+#include <rdma/ib_addr.h>
+#include <rdma/uverbs_ioctl.h>
+#include <linux/net/intel/cni.h>
+
+#include <rdma/uverbs_ioctl.h>
+#include <uapi/rdma/hbl_user_ioctl_cmds.h>
+
+#define UVERBS_MODULE_NAME hbl
+#include <rdma/uverbs_named_ioctl.h>
+
+struct hbl_encap {
+	u32 port_num;
+	u32 encap_num;
+};
+
+static int UVERBS_HANDLER(HBL_IB_METHOD_ENCAP_CREATE)(struct uverbs_attr_bundle *attrs)
+{
+	struct hbl_cni_user_encap_alloc_out alloc_encap_out = {};
+	struct hbl_cni_user_encap_alloc_in alloc_encap_in = {};
+	struct hbl_cni_user_encap_unset_in unset_encap_in = {};
+	struct hbl_cni_user_encap_set_in set_encap_in = {};
+	struct hbl_uapi_encap_create_out out = {};
+	struct hbl_uapi_encap_create_in in = {};
+	u32 port, tnl_hdr_size, encap_num;
+	struct hbl_ib_aux_ops *aux_ops;
+	struct hbl_encap *encap_pdata;
+	struct hbl_ib_ucontext *hctx;
+	struct hbl_aux_dev *aux_dev;
+	struct hbl_ib_device *hdev;
+	struct ib_device *ibdev;
+	struct ib_uobject *uobj;
+	u64 tnl_hdr_ptr;
+	u8 encap_type;
+	int rc;
+
+	hctx = to_hbl_ib_ucontext(ib_uverbs_get_ucontext(attrs));
+	if (IS_ERR(hctx))
+		return PTR_ERR(hctx);
+
+	uobj = uverbs_attr_get_uobject(attrs, HBL_IB_ATTR_ENCAP_CREATE_HANDLE);
+	hdev = to_hbl_ib_dev(hctx->ibucontext.device);
+	ibdev = &hdev->ibdev;
+	aux_dev = hdev->aux_dev;
+	aux_ops = aux_dev->aux_ops;
+
+	rc = uverbs_copy_from(&in, attrs, HBL_IB_ATTR_ENCAP_CREATE_IN);
+	if (rc)
+		return rc;
+
+	rc = ib_to_hbl_port_num(hdev, in.port_num, &port);
+	if (rc) {
+		hbl_ibdev_dbg(ibdev, "invalid IB port %u\n", in.port_num);
+		return rc;
+	}
+
+	if (!(hctx->ports_mask & BIT(port))) {
+		hbl_ibdev_dbg(ibdev, "port %d is not part of the context's ports mask 0x%llx\n",
+			      port, hctx->ports_mask);
+		return -EINVAL;
+	}
+
+	encap_pdata = kzalloc(sizeof(*encap_pdata), GFP_KERNEL);
+	if (!encap_pdata)
+		return -ENOMEM;
+
+	encap_type = in.encap_type;
+
+	alloc_encap_in.port = port;
+	rc = aux_ops->cmd_ctrl(aux_dev, hctx->cn_ctx, HBL_CNI_OP_USER_ENCAP_ALLOC, &alloc_encap_in,
+			       &alloc_encap_out);
+	if (rc) {
+		hbl_ibdev_dbg(ibdev, "failed to alloc encap for port %d\n", port);
+		goto err_free_pdata;
+	}
+
+	encap_num = alloc_encap_out.id;
+
+	if (encap_type != HBL_CNI_ENCAP_NONE) {
+		tnl_hdr_ptr = in.tnl_hdr_ptr;
+		tnl_hdr_size = in.tnl_hdr_size;
+	} else {
+		tnl_hdr_ptr = 0;
+		tnl_hdr_size = 0;
+	}
+
+	encap_pdata->port_num = port;
+	encap_pdata->encap_num = encap_num;
+
+	set_encap_in.tnl_hdr_ptr = tnl_hdr_ptr;
+	set_encap_in.tnl_hdr_size = tnl_hdr_size;
+	set_encap_in.port = port;
+	set_encap_in.id = encap_num;
+	set_encap_in.encap_type = encap_type;
+
+	switch (encap_type) {
+	case HBL_CNI_ENCAP_NONE:
+		set_encap_in.ipv4_addr = in.ipv4_addr;
+		break;
+	case HBL_CNI_ENCAP_OVER_UDP:
+		set_encap_in.udp_dst_port = in.udp_dst_port;
+		break;
+	case HBL_CNI_ENCAP_OVER_IPV4:
+		set_encap_in.ip_proto = in.ip_proto;
+		break;
+	default:
+		break;
+	}
+
+	rc = aux_ops->cmd_ctrl(aux_dev, hctx->cn_ctx, HBL_CNI_OP_USER_ENCAP_SET, &set_encap_in,
+			       NULL);
+	if (rc) {
+		hbl_ibdev_dbg(ibdev, "failed to set encap for port %d\n", port);
+		goto err_encap_unset;
+	}
+
+	out.encap_num = encap_num;
+	uobj->object = encap_pdata;
+
+	rc = uverbs_copy_to_struct_or_zero(attrs, HBL_IB_ATTR_ENCAP_CREATE_OUT, &out, sizeof(out));
+	if (rc)
+		goto err_encap_unset;
+
+	return 0;
+
+err_encap_unset:
+	unset_encap_in.port = port;
+	unset_encap_in.id = encap_num;
+
+	if (aux_ops->cmd_ctrl(aux_dev, hctx->cn_ctx, HBL_CNI_OP_USER_ENCAP_UNSET, &unset_encap_in,
+			      NULL))
+		hbl_ibdev_dbg(ibdev, "failed to unset encap for port %d, encap_num %d\n", port,
+			      encap_num);
+
+err_free_pdata:
+	kfree(encap_pdata);
+
+	return rc;
+}
+
+static int hbl_free_encap(struct ib_uobject *uobject, enum rdma_remove_reason why,
+			  struct uverbs_attr_bundle *attrs)
+{
+	struct hbl_cni_user_encap_unset_in unset_encap_in = {};
+	struct hbl_ib_aux_ops *aux_ops;
+	struct hbl_encap *encap_pdata;
+	struct hbl_ib_ucontext *hctx;
+	struct hbl_aux_dev *aux_dev;
+	struct hbl_ib_device *hdev;
+	struct ib_device *ibdev;
+	int rc;
+
+	hctx = to_hbl_ib_ucontext(ib_uverbs_get_ucontext(attrs));
+	if (IS_ERR(hctx))
+		return PTR_ERR(hctx);
+
+	encap_pdata = uobject->object;
+	hdev = to_hbl_ib_dev(hctx->ibucontext.device);
+	ibdev = &hdev->ibdev;
+	aux_dev = hdev->aux_dev;
+	aux_ops = aux_dev->aux_ops;
+
+	unset_encap_in.port = encap_pdata->port_num;
+	unset_encap_in.id = encap_pdata->encap_num;
+	if (aux_ops->device_operational(aux_dev)) {
+		rc = aux_ops->cmd_ctrl(aux_dev, hctx->cn_ctx, HBL_CNI_OP_USER_ENCAP_UNSET,
+				       &unset_encap_in, NULL);
+		if (rc) {
+			hbl_ibdev_dbg(ibdev, "failed to unset encap for port %d, id %d\n",
+				      unset_encap_in.port, unset_encap_in.id);
+			return rc;
+		}
+	}
+
+	kfree(encap_pdata);
+
+	return 0;
+}
+
+DECLARE_UVERBS_NAMED_METHOD(
+	HBL_IB_METHOD_ENCAP_CREATE,
+	UVERBS_ATTR_IDR(HBL_IB_ATTR_ENCAP_CREATE_HANDLE,
+			HBL_IB_OBJECT_ENCAP,
+			UVERBS_ACCESS_NEW,
+			UA_MANDATORY),
+	UVERBS_ATTR_PTR_IN(HBL_IB_ATTR_ENCAP_CREATE_IN,
+			   UVERBS_ATTR_STRUCT(struct hbl_uapi_encap_create_in, reserved),
+			   UA_MANDATORY),
+	UVERBS_ATTR_PTR_OUT(HBL_IB_ATTR_ENCAP_CREATE_OUT,
+			    UVERBS_ATTR_STRUCT(struct hbl_uapi_encap_create_out, reserved),
+			    UA_MANDATORY));
+
+DECLARE_UVERBS_NAMED_METHOD_DESTROY(
+	HBL_IB_METHOD_ENCAP_DESTROY,
+	UVERBS_ATTR_IDR(HBL_IB_ATTR_ENCAP_DESTROY_HANDLE,
+			HBL_IB_OBJECT_ENCAP,
+			UVERBS_ACCESS_DESTROY,
+			UA_MANDATORY));
+
+DECLARE_UVERBS_NAMED_OBJECT(HBL_IB_OBJECT_ENCAP,
+			    UVERBS_TYPE_ALLOC_IDR(hbl_free_encap),
+			    &UVERBS_METHOD(HBL_IB_METHOD_ENCAP_CREATE),
+			    &UVERBS_METHOD(HBL_IB_METHOD_ENCAP_DESTROY));
+
+const struct uapi_definition hbl_encap_defs[] = {
+	UAPI_DEF_CHAIN_OBJ_TREE_NAMED(HBL_IB_OBJECT_ENCAP),
+	{},
+};
diff --git a/drivers/infiniband/hw/hbl/hbl_main.c b/drivers/infiniband/hw/hbl/hbl_main.c
index 98d3ed46bfe2..6bee35695a06 100644
--- a/drivers/infiniband/hw/hbl/hbl_main.c
+++ b/drivers/infiniband/hw/hbl/hbl_main.c
@@ -22,6 +22,16 @@ MODULE_LICENSE("GPL");
 
 #define MTU_DEFAULT	SZ_4K
 
+static const struct uapi_definition hbl_defs[] = {
+#if IS_ENABLED(CONFIG_INFINIBAND_USER_ACCESS)
+	UAPI_DEF_CHAIN(hbl_usr_fifo_defs),
+	UAPI_DEF_CHAIN(hbl_set_port_ex_defs),
+	UAPI_DEF_CHAIN(hbl_query_port_defs),
+	UAPI_DEF_CHAIN(hbl_encap_defs),
+#endif
+	{}
+};
+
 static void hbl_ib_port_event(struct ib_device *ibdev, u32 port_num, enum ib_event_type reason)
 {
 	struct ib_event event;
@@ -166,6 +176,11 @@ static int hbl_ib_dev_init(struct hbl_ib_device *hdev)
 
 	ib_set_device_ops(ibdev, &hbl_ib_dev_ops);
 
+	if (IS_ENABLED(CONFIG_INFINIBAND_USER_ACCESS))
+		ibdev->driver_def = hbl_defs;
+	else
+		dev_info(hdev->dev, "IB user access is disabled\n");
+
 	/* The CN driver might start calling the aux functions after registering the device so set
 	 * the callbacks here.
 	 */
diff --git a/drivers/infiniband/hw/hbl/hbl_query_port.c b/drivers/infiniband/hw/hbl/hbl_query_port.c
new file mode 100644
index 000000000000..1882507b0b58
--- /dev/null
+++ b/drivers/infiniband/hw/hbl/hbl_query_port.c
@@ -0,0 +1,96 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright 2022-2024 HabanaLabs, Ltd.
+ * Copyright (C) 2023-2024, Intel Corporation.
+ * All Rights Reserved.
+ */
+
+#include "hbl.h"
+#include <rdma/ib_user_verbs.h>
+#include <rdma/ib_addr.h>
+#include <rdma/uverbs_ioctl.h>
+#include <linux/net/intel/cni.h>
+
+#include <rdma/uverbs_ioctl.h>
+#include <uapi/rdma/hbl_user_ioctl_cmds.h>
+#include <uapi/rdma/hbl_user_ioctl_verbs.h>
+
+#define UVERBS_MODULE_NAME hbl
+#include <rdma/uverbs_named_ioctl.h>
+
+static int UVERBS_HANDLER(HBL_IB_METHOD_QUERY_PORT)(struct uverbs_attr_bundle *attrs)
+{
+	struct hbl_cni_get_user_app_params_out app_params_out = {};
+	struct hbl_cni_get_user_app_params_in app_params_in = {};
+	struct hbl_uapi_query_port_out out = {};
+	struct hbl_uapi_query_port_in in = {};
+	struct hbl_ib_aux_ops *aux_ops;
+	struct hbl_ib_ucontext *hctx;
+	struct hbl_aux_dev *aux_dev;
+	struct hbl_ib_device *hdev;
+	struct ib_device *ibdev;
+	int rc;
+
+	hctx = to_hbl_ib_ucontext(ib_uverbs_get_ucontext(attrs));
+	if (IS_ERR(hctx))
+		return PTR_ERR(hctx);
+
+	hdev = to_hbl_ib_dev(hctx->ibucontext.device);
+	ibdev = &hdev->ibdev;
+	aux_dev = hdev->aux_dev;
+	aux_ops = aux_dev->aux_ops;
+
+	rc = uverbs_copy_from(&in, attrs, HBL_IB_ATTR_QUERY_PORT_IN);
+	if (rc)
+		return rc;
+
+	rc = ib_to_hbl_port_num(hdev, in.port_num, &app_params_in.port);
+	if (rc) {
+		hbl_ibdev_dbg(ibdev, "invalid IB port %u\n", in.port_num);
+		return rc;
+	}
+
+	if (!(hctx->ports_mask & BIT(app_params_in.port))) {
+		hbl_ibdev_dbg(ibdev, "port %d is not part of the context's ports mask 0x%llx\n",
+			      app_params_in.port, hctx->ports_mask);
+		return -EINVAL;
+	}
+
+	rc = aux_ops->cmd_ctrl(aux_dev, hctx->cn_ctx, HBL_CNI_OP_GET_USER_APP_PARAMS,
+			       &app_params_in, &app_params_out);
+	if (rc) {
+		hbl_ibdev_dbg(ibdev, "failed to get user params for port %d\n", app_params_in.port);
+		return rc;
+	}
+
+	out.max_num_of_qps = app_params_out.max_num_of_qps;
+	out.num_allocated_qps = app_params_out.num_allocated_qps;
+	out.max_allocated_qp_num = app_params_out.max_allocated_qp_idx;
+	out.max_cq_size = app_params_out.max_cq_size;
+	out.advanced = app_params_out.advanced;
+	out.max_num_of_cqs = app_params_out.max_num_of_cqs;
+	out.max_num_of_usr_fifos = app_params_out.max_num_of_db_fifos;
+	out.max_num_of_encaps = app_params_out.max_num_of_encaps;
+	out.nic_macro_idx = app_params_out.nic_macro_idx;
+	out.nic_phys_port_idx = app_params_out.nic_phys_port_idx;
+
+	rc = uverbs_copy_to_struct_or_zero(attrs, HBL_IB_ATTR_QUERY_PORT_OUT, &out, sizeof(out));
+
+	return rc;
+}
+
+DECLARE_UVERBS_NAMED_METHOD(
+	HBL_IB_METHOD_QUERY_PORT,
+	UVERBS_ATTR_PTR_IN(HBL_IB_ATTR_QUERY_PORT_IN,
+			   UVERBS_ATTR_STRUCT(struct hbl_uapi_query_port_in, reserved),
+			   UA_MANDATORY),
+	UVERBS_ATTR_PTR_OUT(HBL_IB_ATTR_QUERY_PORT_OUT,
+			    UVERBS_ATTR_STRUCT(struct hbl_uapi_query_port_out, reserved),
+			    UA_MANDATORY));
+
+DECLARE_UVERBS_GLOBAL_METHODS(HBL_IB_OBJECT_QUERY_PORT, &UVERBS_METHOD(HBL_IB_METHOD_QUERY_PORT));
+
+const struct uapi_definition hbl_query_port_defs[] = {
+	UAPI_DEF_CHAIN_OBJ_TREE_NAMED(HBL_IB_OBJECT_QUERY_PORT),
+	{},
+};
diff --git a/drivers/infiniband/hw/hbl/hbl_set_port_ex.c b/drivers/infiniband/hw/hbl/hbl_set_port_ex.c
new file mode 100644
index 000000000000..15b509506cca
--- /dev/null
+++ b/drivers/infiniband/hw/hbl/hbl_set_port_ex.c
@@ -0,0 +1,96 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright 2022-2024 HabanaLabs, Ltd.
+ * Copyright (C) 2023-2024, Intel Corporation.
+ * All Rights Reserved.
+ */
+
+#include "hbl.h"
+#include <rdma/ib_user_verbs.h>
+#include <rdma/ib_addr.h>
+#include <rdma/uverbs_ioctl.h>
+#include <linux/net/intel/cni.h>
+
+#include <rdma/uverbs_ioctl.h>
+#include <uapi/rdma/hbl_user_ioctl_cmds.h>
+#include <uapi/rdma/hbl_user_ioctl_verbs.h>
+
+#define UVERBS_MODULE_NAME hbl
+#include <rdma/uverbs_named_ioctl.h>
+
+static int UVERBS_HANDLER(HBL_IB_METHOD_SET_PORT_EX)(struct uverbs_attr_bundle *attrs)
+{
+	struct hbl_ib_port_init_params port_init_params = {};
+	struct hbl_uapi_set_port_ex_in in = {};
+	struct hbl_ib_ucontext *hctx;
+	struct hbl_ib_device *hdev;
+	struct ib_device *ibdev;
+	u32 hbl_port;
+	int rc, i;
+
+	hctx = to_hbl_ib_ucontext(ib_uverbs_get_ucontext(attrs));
+	if (IS_ERR(hctx))
+		return PTR_ERR(hctx);
+
+	hdev = to_hbl_ib_dev(hctx->ibucontext.device);
+	ibdev = &hdev->ibdev;
+
+	rc = uverbs_copy_from(&in, attrs, HBL_IB_ATTR_SET_PORT_EX_IN);
+	if (rc)
+		return rc;
+
+	rc = ib_to_hbl_port_num(hdev, in.port_num, &hbl_port);
+	if (rc) {
+		hbl_ibdev_dbg(ibdev, "invalid IB port %u\n", in.port_num);
+		return rc;
+	}
+
+	if (!(hctx->ports_mask & BIT(hbl_port))) {
+		hbl_ibdev_dbg(ibdev, "port %d is not part of the context's ports mask 0x%llx\n",
+			      hbl_port, hctx->ports_mask);
+		return -EINVAL;
+	}
+
+	if (!in.qp_wq_bp_offs && in.qp_wq_bp_offs_cnt > 0)
+		return -EINVAL;
+
+	port_init_params.hbl_port_num = hbl_port;
+
+	for (i = 0; i < HBL_IB_WQ_ARRAY_TYPE_MAX; i++) {
+		port_init_params.wq_arr_attr[i].max_num_of_wqs =
+						in.wq_arr_attr[i].max_num_of_wqs;
+		port_init_params.wq_arr_attr[i].max_num_of_wqes_in_wq =
+						in.wq_arr_attr[i].max_num_of_wqes_in_wq;
+		port_init_params.wq_arr_attr[i].mem_id = in.wq_arr_attr[i].mem_id;
+		port_init_params.wq_arr_attr[i].swq_granularity =
+						in.wq_arr_attr[i].swq_granularity;
+	}
+
+	if (copy_from_user(port_init_params.qp_wq_bp_offs, u64_to_user_ptr(in.qp_wq_bp_offs),
+			   sizeof(port_init_params.qp_wq_bp_offs[0]) *
+			   min((u32)HBL_IB_MAX_BP_OFFS, in.qp_wq_bp_offs_cnt)))
+		return -EFAULT;
+
+	port_init_params.advanced = in.advanced;
+	port_init_params.adaptive_timeout_en = in.adaptive_timeout_en;
+
+	rc = hbl_ib_port_init(hctx, &port_init_params);
+	if (rc)
+		hbl_ibdev_dbg(ibdev, "failed(%d) to set port %u extended params\n", rc, hbl_port);
+
+	return rc;
+}
+
+DECLARE_UVERBS_NAMED_METHOD(
+	HBL_IB_METHOD_SET_PORT_EX,
+	UVERBS_ATTR_PTR_IN(HBL_IB_ATTR_SET_PORT_EX_IN,
+			   UVERBS_ATTR_STRUCT(struct hbl_uapi_set_port_ex_in, reserved3),
+			   UA_MANDATORY));
+
+DECLARE_UVERBS_GLOBAL_METHODS(HBL_IB_OBJECT_SET_PORT_EX,
+			      &UVERBS_METHOD(HBL_IB_METHOD_SET_PORT_EX));
+
+const struct uapi_definition hbl_set_port_ex_defs[] = {
+	UAPI_DEF_CHAIN_OBJ_TREE_NAMED(HBL_IB_OBJECT_SET_PORT_EX),
+	{},
+};
diff --git a/drivers/infiniband/hw/hbl/hbl_usr_fifo.c b/drivers/infiniband/hw/hbl/hbl_usr_fifo.c
new file mode 100644
index 000000000000..37f387a99f40
--- /dev/null
+++ b/drivers/infiniband/hw/hbl/hbl_usr_fifo.c
@@ -0,0 +1,252 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright 2022-2024 HabanaLabs, Ltd.
+ * Copyright (C) 2023-2024, Intel Corporation.
+ * All Rights Reserved.
+ */
+
+#include "hbl.h"
+#include <rdma/ib_user_verbs.h>
+#include <rdma/ib_addr.h>
+#include <rdma/uverbs_ioctl.h>
+#include <linux/net/intel/cni.h>
+
+#include <rdma/uverbs_ioctl.h>
+#include <uapi/rdma/hbl_user_ioctl_cmds.h>
+#include <uapi/rdma/hbl_user_ioctl_verbs.h>
+
+#define UVERBS_MODULE_NAME hbl
+#include <rdma/uverbs_named_ioctl.h>
+
+/**
+ * struct hbl_usr_fifo - This structure will be stored inside the uobject.
+ * @ci_entry: The rdma_user_mmap_entry for the mapped ci.
+ * @regs_entry: The rdma_user_mmap_entry for the mapped registers.
+ * @port: The port of this fifo.
+ * @id: The id of this fifo.
+ */
+struct hbl_usr_fifo {
+	struct rdma_user_mmap_entry *ci_entry;
+	struct rdma_user_mmap_entry *regs_entry;
+	u32 port;
+	u32 id;
+};
+
+static void user_fifo_mmap_entry_remove(struct hbl_usr_fifo *usr_fifo)
+{
+	rdma_user_mmap_entry_remove(usr_fifo->regs_entry);
+	if (usr_fifo->ci_entry)
+		rdma_user_mmap_entry_remove(usr_fifo->ci_entry);
+}
+
+static int user_fifo_mmap_entry_setup(struct hbl_ib_device *dev, struct hbl_ib_ucontext *hctx,
+				      struct hbl_usr_fifo *usr_fifo,
+				      struct hbl_uapi_usr_fifo_create_out *out)
+{
+	if (out->ci_handle) {
+		usr_fifo->ci_entry = hbl_ib_user_mmap_entry_insert(&hctx->ibucontext,
+								   out->ci_handle,
+								   PAGE_SIZE, &out->ci_handle);
+		if (IS_ERR(usr_fifo->ci_entry))
+			return PTR_ERR(usr_fifo->ci_entry);
+	}
+
+	usr_fifo->regs_entry = hbl_ib_user_mmap_entry_insert(&hctx->ibucontext, out->regs_handle,
+							     PAGE_SIZE, &out->regs_handle);
+	if (IS_ERR(usr_fifo->regs_entry))
+		goto err_free_ci;
+
+	return 0;
+
+err_free_ci:
+	if (usr_fifo->ci_entry)
+		rdma_user_mmap_entry_remove(usr_fifo->ci_entry);
+
+	return PTR_ERR(usr_fifo->regs_entry);
+}
+
+static int UVERBS_HANDLER(HBL_IB_METHOD_USR_FIFO_OBJ_CREATE)(struct uverbs_attr_bundle *attrs)
+{
+	struct hbl_cni_alloc_user_db_fifo_out alloc_db_fifo_out = {};
+	struct hbl_cni_alloc_user_db_fifo_in alloc_db_fifo_in = {};
+	struct hbl_cni_user_db_fifo_unset_in db_fifo_unset_in = {};
+	struct hbl_cni_user_db_fifo_set_out db_fifo_set_out = {};
+	struct hbl_cni_user_db_fifo_set_in db_fifo_set_in = {};
+	struct hbl_uapi_usr_fifo_create_out out = {};
+	struct hbl_uapi_usr_fifo_create_in in = {};
+	struct hbl_usr_fifo *usr_fifo_pdata;
+	struct hbl_ib_aux_ops *aux_ops;
+	struct hbl_ib_ucontext *hctx;
+	struct hbl_aux_dev *aux_dev;
+	struct hbl_ib_device *hdev;
+	struct ib_device *ibdev;
+	struct ib_uobject *uobj;
+	u32 port, id;
+	u8 mode;
+	int rc;
+
+	hctx = to_hbl_ib_ucontext(ib_uverbs_get_ucontext(attrs));
+	if (IS_ERR(hctx))
+		return PTR_ERR(hctx);
+
+	uobj = uverbs_attr_get_uobject(attrs, HBL_IB_ATTR_USR_FIFO_CREATE_HANDLE);
+	hdev = to_hbl_ib_dev(hctx->ibucontext.device);
+	ibdev = &hdev->ibdev;
+	aux_dev = hdev->aux_dev;
+	aux_ops = aux_dev->aux_ops;
+
+	rc = uverbs_copy_from(&in, attrs, HBL_IB_ATTR_USR_FIFO_CREATE_IN);
+	if (rc)
+		return rc;
+
+	rc = ib_to_hbl_port_num(hdev, in.port_num, &port);
+	if (rc) {
+		hbl_ibdev_dbg(ibdev, "invalid IB port %u\n", in.port_num);
+		return rc;
+	}
+
+	if (!(hctx->ports_mask & BIT(port))) {
+		hbl_ibdev_dbg(ibdev, "port %d is not part of the context's ports mask 0x%llx\n",
+			      port, hctx->ports_mask);
+		return -EINVAL;
+	}
+
+	usr_fifo_pdata = kzalloc(sizeof(*usr_fifo_pdata), GFP_KERNEL);
+	if (!usr_fifo_pdata)
+		return -ENOMEM;
+
+	mode = in.mode;
+
+	alloc_db_fifo_in.port = port;
+	alloc_db_fifo_in.id_hint = in.usr_fifo_num_hint;
+
+	rc = aux_ops->cmd_ctrl(aux_dev, hctx->cn_ctx, HBL_CNI_OP_ALLOC_USER_DB_FIFO,
+			       &alloc_db_fifo_in, &alloc_db_fifo_out);
+	if (rc) {
+		hbl_ibdev_dbg(ibdev, "failed to alloc db fifo, port %d\n", port);
+		goto err_free_pdata;
+	}
+
+	id = alloc_db_fifo_out.id;
+
+	usr_fifo_pdata->port = port;
+	usr_fifo_pdata->id = id;
+
+	db_fifo_set_in.port = port;
+	db_fifo_set_in.id = id;
+	db_fifo_set_in.mode = mode;
+
+	rc = aux_ops->cmd_ctrl(aux_dev, hctx->cn_ctx, HBL_CNI_OP_USER_DB_FIFO_SET, &db_fifo_set_in,
+			       &db_fifo_set_out);
+	if (rc) {
+		hbl_ibdev_dbg(ibdev, "failed to set db fifo %d, port %d\n", id, port);
+		goto err_usr_fifo_unset;
+	}
+
+	out.usr_fifo_num = id;
+	out.ci_handle = db_fifo_set_out.ci_handle;
+	out.regs_handle = db_fifo_set_out.regs_handle;
+	out.regs_offset = db_fifo_set_out.regs_offset;
+	out.size = db_fifo_set_out.fifo_size;
+	out.bp_thresh = db_fifo_set_out.fifo_bp_thresh;
+
+	rc = user_fifo_mmap_entry_setup(hdev, hctx, usr_fifo_pdata, &out);
+	if (rc)
+		goto err_usr_fifo_unset;
+
+	uobj->object = usr_fifo_pdata;
+
+	rc = uverbs_copy_to_struct_or_zero(attrs, HBL_IB_ATTR_USR_FIFO_CREATE_OUT, &out,
+					   sizeof(out));
+	if (rc)
+		goto err_remove_mmap_entries;
+
+	return 0;
+
+err_remove_mmap_entries:
+	user_fifo_mmap_entry_remove(usr_fifo_pdata);
+
+err_usr_fifo_unset:
+	db_fifo_unset_in.port = port;
+	db_fifo_unset_in.id = id;
+
+	if (aux_ops->cmd_ctrl(aux_dev, hctx->cn_ctx, HBL_CNI_OP_USER_DB_FIFO_UNSET,
+			      &db_fifo_unset_in, NULL))
+		hbl_ibdev_dbg(ibdev, "failed to unset db fifo %d, port %d\n", id, port);
+
+err_free_pdata:
+	kfree(usr_fifo_pdata);
+	return rc;
+}
+
+static int hbl_free_usr_fifo(struct ib_uobject *uobject, enum rdma_remove_reason why,
+			     struct uverbs_attr_bundle *attrs)
+{
+	struct hbl_cni_user_db_fifo_unset_in db_fifo_unset_in = {};
+	struct hbl_usr_fifo *usr_fifo_pdata;
+	struct hbl_ib_aux_ops *aux_ops;
+	struct hbl_ib_ucontext *hctx;
+	struct hbl_aux_dev *aux_dev;
+	struct hbl_ib_device *hdev;
+	struct ib_device *ibdev;
+	int rc;
+
+	hctx = to_hbl_ib_ucontext(ib_uverbs_get_ucontext(attrs));
+	if (IS_ERR(hctx))
+		return PTR_ERR(hctx);
+
+	usr_fifo_pdata = uobject->object;
+	hdev = to_hbl_ib_dev(hctx->ibucontext.device);
+	ibdev = &hdev->ibdev;
+	aux_dev = hdev->aux_dev;
+	aux_ops = aux_dev->aux_ops;
+
+	db_fifo_unset_in.port = usr_fifo_pdata->port;
+	db_fifo_unset_in.id = usr_fifo_pdata->id;
+
+	user_fifo_mmap_entry_remove(usr_fifo_pdata);
+
+	if (aux_ops->device_operational(aux_dev)) {
+		rc = aux_ops->cmd_ctrl(aux_dev, hctx->cn_ctx, HBL_CNI_OP_USER_DB_FIFO_UNSET,
+				       &db_fifo_unset_in, NULL);
+		if (rc) {
+			hbl_ibdev_dbg(ibdev, "failed to unset db fifo %d, port %d\n",
+				      usr_fifo_pdata->id, usr_fifo_pdata->port);
+			return rc;
+		}
+	}
+
+	kfree(usr_fifo_pdata);
+
+	return 0;
+}
+
+DECLARE_UVERBS_NAMED_METHOD(
+	HBL_IB_METHOD_USR_FIFO_OBJ_CREATE,
+	UVERBS_ATTR_IDR(HBL_IB_ATTR_USR_FIFO_CREATE_HANDLE,
+			HBL_IB_OBJECT_USR_FIFO,
+			UVERBS_ACCESS_NEW,
+			UA_MANDATORY),
+	UVERBS_ATTR_PTR_IN(HBL_IB_ATTR_USR_FIFO_CREATE_IN,
+			   UVERBS_ATTR_STRUCT(struct hbl_uapi_usr_fifo_create_in, reserved3),
+			   UA_MANDATORY),
+	UVERBS_ATTR_PTR_OUT(HBL_IB_ATTR_USR_FIFO_CREATE_OUT,
+			    UVERBS_ATTR_STRUCT(struct hbl_uapi_usr_fifo_create_out, bp_thresh),
+			    UA_MANDATORY));
+
+DECLARE_UVERBS_NAMED_METHOD_DESTROY(
+	HBL_IB_METHOD_USR_FIFO_OBJ_DESTROY,
+	UVERBS_ATTR_IDR(HBL_IB_ATTR_USR_FIFO_DESTROY_HANDLE,
+			HBL_IB_OBJECT_USR_FIFO,
+			UVERBS_ACCESS_DESTROY,
+			UA_MANDATORY));
+
+DECLARE_UVERBS_NAMED_OBJECT(HBL_IB_OBJECT_USR_FIFO,
+			    UVERBS_TYPE_ALLOC_IDR(hbl_free_usr_fifo),
+			    &UVERBS_METHOD(HBL_IB_METHOD_USR_FIFO_OBJ_CREATE),
+			    &UVERBS_METHOD(HBL_IB_METHOD_USR_FIFO_OBJ_DESTROY));
+
+const struct uapi_definition hbl_usr_fifo_defs[] = {
+	UAPI_DEF_CHAIN_OBJ_TREE_NAMED(HBL_IB_OBJECT_USR_FIFO),
+	{},
+};
-- 
2.34.1

