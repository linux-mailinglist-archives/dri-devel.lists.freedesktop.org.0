Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0A249254D6
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2024 09:41:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85E2A10E0BA;
	Wed,  3 Jul 2024 07:41:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="cs3SLVd9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08F2710E732
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jul 2024 05:58:39 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 462HaBCa002759;
 Wed, 3 Jul 2024 05:58:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 rPRoCPJFc+0x80uwFNTtr9M/mgwl9rKjHwj15QO4+6k=; b=cs3SLVd9ZmKgg1CU
 nFr75EoYKqz+2AVFI5au6XolIRTafy/EBlk9frpM/12Lof5yCKGKH267+zbMqnEs
 dRplIz1lrMpvGavIMMgrfrEttXeywUbbVM6mDTVDgysVrpzcn0RSk6E7iOsxVLLr
 EuJsxV2uQIY/y22PUQOjVJtP6B7RVSEpbqzz0lfck1HLKp8IBxof/Iqp0QyK0uF+
 zdHAbtsXW7/NKeQ1HLeRElClwVBSBT4hsnQ45KUeihW1uPduPdGor1K4idQtMtNI
 qO7CTxEi4nd7R9Dtcb2C1epzdqVLrTUCjzvkkd1roxGVLLrmAAQPueaS09erZn8w
 IypVnQ==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4027yfaune-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 Jul 2024 05:58:33 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 4635wWVY007316
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 3 Jul 2024 05:58:32 GMT
Received: from hu-azarrabi-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 2 Jul 2024 22:58:31 -0700
From: Amirreza Zarrabi <quic_azarrabi@quicinc.com>
Date: Tue, 2 Jul 2024 22:57:37 -0700
Subject: [PATCH RFC 2/3] firmware: qcom: implement memory object support
 for TEE
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240702-qcom-tee-object-and-ioctls-v1-2-633c3ddf57ee@quicinc.com>
References: <20240702-qcom-tee-object-and-ioctls-v1-0-633c3ddf57ee@quicinc.com>
In-Reply-To: <20240702-qcom-tee-object-and-ioctls-v1-0-633c3ddf57ee@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio
 <konrad.dybcio@linaro.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 <srinivas.kandagatla@linaro.org>, <bartosz.golaszewski@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linaro-mm-sig@lists.linaro.org>,
 "Amirreza Zarrabi" <quic_azarrabi@quicinc.com>
X-Mailer: b4 0.13.0
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 0hTEDGqbCib0Zjg5vpzH-T-4ErEw10nx
X-Proofpoint-ORIG-GUID: 0hTEDGqbCib0Zjg5vpzH-T-4ErEw10nx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-03_02,2024-07-02_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 mlxlogscore=999 phishscore=0 impostorscore=0
 clxscore=1015 malwarescore=0 suspectscore=0 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407030042
X-Mailman-Approved-At: Wed, 03 Jul 2024 07:41:52 +0000
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

Allocating and sharing memory with TEE can happen using different
methods. To allocate a memory, a client may try to use part of its
address space, use a dma-heap to allocate a buffer, use a pre-defined
pool of memory that has already been shared with TEE, or if it is a
kernel client, it can allocate memory in kernel. To share the memory,
it can use FFA or SHM bridge (in case of Qualcomm TEE).

Using qcom_tee_object we implemented a nonsecure service as an extension
that is used to share dma-buf with TEE based on Qualcomm SHM bridge.
Any other form of memory allocation and sharing can be later on added
using separate extensions.

Signed-off-by: Amirreza Zarrabi <quic_azarrabi@quicinc.com>
---
 drivers/firmware/qcom/Kconfig                      |  10 +
 drivers/firmware/qcom/qcom_object_invoke/Makefile  |   5 +
 .../qcom/qcom_object_invoke/xts/mem_object.c       | 406 +++++++++++++++++++++
 3 files changed, 421 insertions(+)

diff --git a/drivers/firmware/qcom/Kconfig b/drivers/firmware/qcom/Kconfig
index 103ab82bae9f..f16fb7997595 100644
--- a/drivers/firmware/qcom/Kconfig
+++ b/drivers/firmware/qcom/Kconfig
@@ -98,4 +98,14 @@ config QCOM_OBJECT_INVOKE_CORE
 
 	  Select Y here to provide access to TEE.
 
+config QCOM_OBJECT_INVOKE_MEM_OBJECT
+	bool "Add support for memory object"
+	depends on QCOM_OBJECT_INVOKE_CORE
+	help
+	  This provide an interface to export or sharing memory with TEE.
+	  It allows kernel clients to create memory object and do the necessary
+	  mapping and unmapping using TZMEM allocator.
+
+	  Select Y here Enable support for memory object.
+
 endmenu
diff --git a/drivers/firmware/qcom/qcom_object_invoke/Makefile b/drivers/firmware/qcom/qcom_object_invoke/Makefile
index 6ef4d54891a5..1f7d43fa38db 100644
--- a/drivers/firmware/qcom/qcom_object_invoke/Makefile
+++ b/drivers/firmware/qcom/qcom_object_invoke/Makefile
@@ -2,3 +2,8 @@
 
 obj-$(CONFIG_QCOM_OBJECT_INVOKE_CORE) += object-invoke-core.o
 object-invoke-core-objs := qcom_scm_invoke.o release_wq.o async.o core.o
+
+# Add extenstions here.
+
+obj-$(CONFIG_QCOM_OBJECT_INVOKE_MEM_OBJECT) += mem-object.o
+mem-object-objs := xts/mem_object.o
diff --git a/drivers/firmware/qcom/qcom_object_invoke/xts/mem_object.c b/drivers/firmware/qcom/qcom_object_invoke/xts/mem_object.c
new file mode 100644
index 000000000000..5193f95536eb
--- /dev/null
+++ b/drivers/firmware/qcom/qcom_object_invoke/xts/mem_object.c
@@ -0,0 +1,406 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#define pr_fmt(fmt) "qcom-object-invoke-mo: %s: " fmt, __func__
+
+#include <linux/module.h>
+#include <linux/device.h>
+#include <linux/platform_device.h>
+#include <linux/dma-buf.h>
+#include <linux/of_platform.h>
+
+#include <linux/firmware/qcom/qcom_object_invoke.h>
+
+/* Memory object operations. */
+/* ... */
+
+/* 'Primordial Object' operations related to memory object. */
+#define QCOM_TEE_OBJECT_OP_MAP_REGION	0
+
+static struct platform_device *mem_object_pdev;
+
+static struct qcom_tee_object primordial_object;
+
+struct mem_object {
+	struct qcom_tee_object object;
+
+	struct dma_buf *dma_buf;
+
+	union {
+		/* SHMBridge information. */
+		struct {
+			struct map {
+				struct dma_buf_attachment *buf_attach;
+				struct sg_table *sgt;
+
+				/* 'lock' to protect concurrent request from TEE and prepare. */
+				struct mutex lock;
+			} map;
+
+			/* Use SHMBridge, hence the handle. */
+			u64 shm_bridge_handle;
+
+			struct mapping_info {
+				phys_addr_t p_addr;
+				size_t p_addr_len;
+			} mapping_info;
+		};
+
+		/* XXX information. */
+		/* struct { ... } */
+	};
+
+	struct list_head node;
+
+	/* Private pointer passed for callbacks. */
+	void *private;
+
+	void (*release)(void *private);
+};
+
+#define to_mem_object(o) container_of((o), struct mem_object, object)
+
+/* List of memory objects. */
+static LIST_HEAD(mo_list);
+static DEFINE_MUTEX(mo_list_mutex);
+
+/* mo_notify and mo_dispatch are shared by all types of memory objects. */
+/* Depending on how we share memory with TEE (e.g. using QCOM SHMBridge or FFA),
+ * the mem_ops.release will be selected in the mem_object_probe.
+ */
+
+static void mo_notify(unsigned int context_id, struct qcom_tee_object *object, int status) {}
+static int mo_dispatch(unsigned int context_id, struct qcom_tee_object *object,
+	unsigned long op, struct qcom_tee_arg args[])
+{
+	return 0;
+}
+
+static struct qcom_tee_object_operations mem_ops = {
+	.notify = mo_notify,
+	.dispatch = mo_dispatch
+};
+
+static int is_mem_object(struct qcom_tee_object *object)
+{
+	return (typeof_qcom_tee_object(object) == QCOM_TEE_OBJECT_TYPE_CB_OBJECT) &&
+		(object->ops == &mem_ops);
+}
+
+/** Support for 'SHMBridge'. **/
+
+/* make_shm_bridge_single only support single continuous memory. */
+static int make_shm_bridge_single(struct mem_object *mo)
+{
+	/* 'sgt' should have one mapped entry. **/
+	if (mo->map.sgt->nents != 1)
+		return -EINVAL;
+
+	mo->mapping_info.p_addr = sg_dma_address(mo->map.sgt->sgl);
+	mo->mapping_info.p_addr_len = sg_dma_len(mo->map.sgt->sgl);
+
+	/* TODO. Use SHMBridge to establish the shered memory. */
+
+	return 0;
+}
+
+static void rm_shm_bridge(struct mem_object *mo)
+{
+	/* TODO. Use SHMBridge to release the shered memory. */
+}
+
+static void detach_dma_buf(struct mem_object *mo)
+{
+	if (mo->map.sgt) {
+		dma_buf_unmap_attachment_unlocked(mo->map.buf_attach,
+			mo->map.sgt, DMA_BIDIRECTIONAL);
+	}
+
+	if (mo->map.buf_attach)
+		dma_buf_detach(mo->dma_buf, mo->map.buf_attach);
+}
+
+/* init_tz_shared_memory is called while holding the map.lock mutex. */
+static int init_tz_shared_memory(struct mem_object *mo)
+{
+	int ret;
+	struct dma_buf_attachment *buf_attach;
+	struct sg_table *sgt;
+
+	mo->map.buf_attach = NULL;
+	mo->map.sgt = NULL;
+
+	buf_attach = dma_buf_attach(mo->dma_buf, &mem_object_pdev->dev);
+	if (IS_ERR(buf_attach))
+		return PTR_ERR(buf_attach);
+
+	mo->map.buf_attach = buf_attach;
+
+	sgt = dma_buf_map_attachment_unlocked(buf_attach, DMA_BIDIRECTIONAL);
+	if (IS_ERR(sgt)) {
+		ret = PTR_ERR(sgt);
+
+		goto out_failed;
+	}
+
+	mo->map.sgt = sgt;
+
+	ret = make_shm_bridge_single(mo);
+	if (ret)
+		goto out_failed;
+
+	return 0;
+
+out_failed:
+	detach_dma_buf(mo);
+
+	return ret;
+}
+
+static int map_memory_obj(struct mem_object *mo)
+{
+	int ret;
+
+	if (mo->mapping_info.p_addr == 0) {
+		/* 'mo' has not been mapped before. Do it now. */
+		ret = init_tz_shared_memory(mo);
+	} else {
+		/* 'mo' is already mapped. Just return. */
+		ret = 0;
+	}
+
+	return ret;
+}
+
+static void release_memory_obj(struct mem_object *mo)
+{
+	rm_shm_bridge(mo);
+
+	detach_dma_buf(mo);
+}
+
+static void mo_shm_bridge_release(struct qcom_tee_object *object)
+{
+	struct mem_object *mo = to_mem_object(object);
+
+	release_memory_obj(mo);
+
+	if (mo->release)
+		mo->release(mo->private);
+
+	/* Put a dam-buf copy obtained in init_si_mem_object_user.*/
+	dma_buf_put(mo->dma_buf);
+
+	mutex_lock(&mo_list_mutex);
+	list_del(&mo->node);
+	mutex_unlock(&mo_list_mutex);
+
+	kfree(mo);
+}
+
+/* Primordial object for SHMBridge. */
+
+static int shm_bridge__po_dispatch(unsigned int context_id,
+	struct qcom_tee_object *unused, unsigned long op, struct qcom_tee_arg args[])
+{
+	int ret;
+
+	struct qcom_tee_object *object;
+	struct mem_object *mo;
+
+	switch (op) {
+	case QCOM_TEE_OBJECT_OP_MAP_REGION: {
+		/* Format of response as expected by TZ. */
+		struct {
+			u64 p_addr;
+			u64 len;
+			u32 perms;
+		} *mi;
+
+		if (size_of_arg(args) != 3 ||
+			args[0].type != QCOM_TEE_ARG_TYPE_OB  ||
+			args[1].type != QCOM_TEE_ARG_TYPE_IO  ||
+			args[2].type != QCOM_TEE_ARG_TYPE_OO) {
+			pr_err("mapping of a memory object with invalid message format.\n");
+
+			return -EINVAL;
+		}
+
+		object = args[1].o;
+
+		if (!is_mem_object(object)) {
+			pr_err("mapping of a non-memory object.\n");
+			put_qcom_tee_object(object);
+
+			return -EINVAL;
+		}
+
+		mo = to_mem_object(object);
+
+		mutex_lock(&mo->map.lock);
+		ret = map_memory_obj(mo);
+		mutex_unlock(&mo->map.lock);
+
+		if (!ret) {
+			/* 'object' has been mapped. Share it. */
+			args[2].o = object;
+
+			mi = (typeof(mi))args[0].b.addr;
+			mi->p_addr = mo->mapping_info.p_addr;
+			mi->len = mo->mapping_info.p_addr_len;
+			mi->perms = 6; /* RW Permission. */
+		} else {
+			pr_err("mapping memory object %s failed.\n", qcom_tee_object_name(object));
+
+			put_qcom_tee_object(object);
+		}
+	}
+
+		break;
+	default: /* The operation is not supported! */
+		ret = -EINVAL;
+
+		break;
+	}
+
+	return ret;
+}
+
+static int op_supported(unsigned long op)
+{
+	switch (op) {
+	case QCOM_TEE_OBJECT_OP_MAP_REGION:
+		return 1;
+	default:
+		return 0;
+	}
+}
+
+static struct qcom_tee_object_operations shm_bridge__po_ops = {
+	.op_supported = op_supported,
+	.dispatch = shm_bridge__po_dispatch
+};
+
+/* Memory Object Extension API. */
+
+struct qcom_tee_object *qcom_tee_mem_object_init(struct dma_buf *dma_buf,
+	void (*release)(void *), void *private)
+{
+	struct mem_object *mo;
+
+	if (!mem_ops.release) {
+		pr_err("memory object type is unknown.\n");
+
+		return NULL_QCOM_TEE_OBJECT;
+	}
+
+	mo = kzalloc(sizeof(*mo), GFP_KERNEL);
+	if (!mo)
+		return NULL_QCOM_TEE_OBJECT;
+
+	mutex_init(&mo->map.lock);
+
+	/* Get a copy of dma-buf. */
+	get_dma_buf(dma_buf);
+
+	mo->dma_buf = dma_buf;
+	mo->private = private;
+	mo->release = release;
+
+	init_qcom_tee_object_user(&mo->object, QCOM_TEE_OBJECT_TYPE_CB_OBJECT,
+		&mem_ops, "mem-object");
+
+	mutex_lock(&mo_list_mutex);
+	list_add_tail(&mo->node, &mo_list);
+	mutex_unlock(&mo_list_mutex);
+
+	return &mo->object;
+}
+EXPORT_SYMBOL_GPL(qcom_tee_mem_object_init);
+
+struct dma_buf *qcom_tee_mem_object_to_dma_buf(struct qcom_tee_object *object)
+{
+	if (is_mem_object(object))
+		return to_mem_object(object)->dma_buf;
+
+	return ERR_PTR(-EINVAL);
+}
+EXPORT_SYMBOL_GPL(qcom_tee_mem_object_to_dma_buf);
+
+static ssize_t mem_objects_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	size_t len = 0;
+	struct mem_object *mo;
+
+	mutex_lock(&mo_list_mutex);
+	list_for_each_entry(mo, &mo_list, node) {
+		len += scnprintf(buf + len, PAGE_SIZE - len, "%s refs: %u (%llx %zx)\n",
+			qcom_tee_object_name(&mo->object), kref_read(&mo->object.refcount),
+			mo->mapping_info.p_addr, mo->mapping_info.p_addr_len);
+	}
+
+	mutex_unlock(&mo_list_mutex);
+
+	return len;
+}
+
+/* 'struct device_attribute dev_attr_mem_objects'. */
+/* Use device attribute rather than driver attribute in case we want to support
+ * multiple types of memory objects as different devices.
+ */
+
+static DEVICE_ATTR_RO(mem_objects);
+
+static struct attribute *attrs[] = {
+	&dev_attr_mem_objects.attr,
+	NULL
+};
+
+static struct attribute_group attr_group = {
+	.attrs = attrs,
+};
+
+static const struct attribute_group *attr_groups[] = {
+	&attr_group,
+	NULL
+};
+
+static int mem_object_probe(struct platform_device *pdev)
+{
+	int ret;
+
+	ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64));
+	if (ret)
+		return ret;
+
+	/* Select memory object type: default to SHMBridge. */
+	mem_ops.release = mo_shm_bridge_release;
+
+	init_qcom_tee_object_user(&primordial_object,
+		QCOM_TEE_OBJECT_TYPE_ROOT, &shm_bridge__po_ops, "po_in_mem_object");
+
+	mem_object_pdev = pdev;
+
+	return 0;
+}
+
+static const struct of_device_id mem_object_match[] = {
+	{ .compatible = "qcom,mem-object", }, {}
+};
+
+static struct platform_driver mem_object_plat_driver = {
+	.probe = mem_object_probe,
+	.driver = {
+		.name = "mem-object",
+		.dev_groups = attr_groups,
+		.of_match_table = mem_object_match,
+	},
+};
+
+module_platform_driver(mem_object_plat_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Memory object driver");
+MODULE_IMPORT_NS(DMA_BUF);

-- 
2.34.1

