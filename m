Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFD569254D7
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2024 09:42:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7DF910E74A;
	Wed,  3 Jul 2024 07:41:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="LxlSHf29";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1241810E731
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jul 2024 05:58:47 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4634Miwt026797;
 Wed, 3 Jul 2024 05:58:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 +Qufv8nSsO26prsDMp1M0X/extr/ONR88p7a4XR34fg=; b=LxlSHf29+iXUztDt
 xzRUG6U/Z/c+xyy1Ek59PFE1Uqz8lzzQ93JlOWT9PUG4T6ByAEwesExHaik0AHfU
 gBzQQZIcTOuGtxJBmi5voOGBgjQuuEcTUIg+pq9yUWJnnfs2ugxcwjywcbjwp1NL
 pUC4acDT8WOXW3OFoYMQPzuW20+bZT0KkMTc5Z8OhV1+feN0kJwY0BCJRxIBJhS4
 pYj9xYhtT8ZDJJjD785/J7RKkJJiKPf9sjc0b6N2YUJ4fUtEvS16gZjPQ7lGAiOC
 0/jbCS24PkjHWS6AItJpLa+AfjoFm9CoGhdmQ5wx0KmlEwsjBYwChRaljnaxolhe
 L1TuWg==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 404yjhr5a2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 Jul 2024 05:58:33 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 4635wWlv003308
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 3 Jul 2024 05:58:32 GMT
Received: from hu-azarrabi-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 2 Jul 2024 22:58:32 -0700
From: Amirreza Zarrabi <quic_azarrabi@quicinc.com>
Date: Tue, 2 Jul 2024 22:57:38 -0700
Subject: [PATCH RFC 3/3] firmware: qcom: implement ioctl for TEE object
 invocation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240702-qcom-tee-object-and-ioctls-v1-3-633c3ddf57ee@quicinc.com>
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
X-Proofpoint-GUID: tv38L9CMtE-9U0HzqzGp_E2MQ2jCqEMF
X-Proofpoint-ORIG-GUID: tv38L9CMtE-9U0HzqzGp_E2MQ2jCqEMF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-03_02,2024-07-02_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0
 mlxlogscore=999 clxscore=1015 lowpriorityscore=0 suspectscore=0
 malwarescore=0 mlxscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

Provide ioctl to expose support to invoke a TEE object to userspace and
implementing a callback server to handle TEE object invokes.

Signed-off-by: Amirreza Zarrabi <quic_azarrabi@quicinc.com>
---
 drivers/firmware/qcom/Kconfig                      |   12 +
 drivers/firmware/qcom/qcom_object_invoke/Makefile  |    3 +
 .../qcom_object_invoke/xts/object_invoke_uapi.c    | 1231 ++++++++++++++++++++
 include/uapi/misc/qcom_tee.h                       |  117 ++
 4 files changed, 1363 insertions(+)

diff --git a/drivers/firmware/qcom/Kconfig b/drivers/firmware/qcom/Kconfig
index f16fb7997595..6592f79d3b70 100644
--- a/drivers/firmware/qcom/Kconfig
+++ b/drivers/firmware/qcom/Kconfig
@@ -108,4 +108,16 @@ config QCOM_OBJECT_INVOKE_MEM_OBJECT
 
 	  Select Y here Enable support for memory object.
 
+config QCOM_OBJECT_INVOKE
+	bool "Add support for userspace to access TEE"
+	select QCOM_OBJECT_INVOKE_CORE
+	select QCOM_OBJECT_INVOKE_MEM_OBJECT
+	help
+	  This provides an interface to access TEE from userspace. It creates two
+	  char devices /dev/tee and /dev/tee-ree. The /dev/tee is used to obtain
+	  access to the root client env object. The /dev/tee-ree is used to start a
+	  callback server.
+
+	  Select Y here to provide access to TEE.
+
 endmenu
diff --git a/drivers/firmware/qcom/qcom_object_invoke/Makefile b/drivers/firmware/qcom/qcom_object_invoke/Makefile
index 1f7d43fa38db..9c2350fff6b7 100644
--- a/drivers/firmware/qcom/qcom_object_invoke/Makefile
+++ b/drivers/firmware/qcom/qcom_object_invoke/Makefile
@@ -7,3 +7,6 @@ object-invoke-core-objs := qcom_scm_invoke.o release_wq.o async.o core.o
 
 obj-$(CONFIG_QCOM_OBJECT_INVOKE_MEM_OBJECT) += mem-object.o
 mem-object-objs := xts/mem_object.o
+
+obj-$(CONFIG_QCOM_OBJECT_INVOKE) += object-invoke-uapi.o
+object-invoke-uapi-objs := xts/object_invoke_uapi.o
diff --git a/drivers/firmware/qcom/qcom_object_invoke/xts/object_invoke_uapi.c b/drivers/firmware/qcom/qcom_object_invoke/xts/object_invoke_uapi.c
new file mode 100644
index 000000000000..b6d2473e183c
--- /dev/null
+++ b/drivers/firmware/qcom/qcom_object_invoke/xts/object_invoke_uapi.c
@@ -0,0 +1,1231 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#define pr_fmt(fmt) "qcom-object-invoke-uapi: %s: " fmt, __func__
+
+#include <linux/module.h>
+#include <linux/file.h>
+#include <linux/dma-buf.h>
+#include <linux/cdev.h>
+#include <linux/version.h>
+#include <linux/anon_inodes.h>
+#include <linux/miscdevice.h>
+#include <linux/platform_device.h>
+#include <linux/mod_devicetable.h>
+
+#include <linux/firmware/qcom/qcom_object_invoke.h>
+
+/* Mutex to protect userspace processes. */
+static DEFINE_MUTEX(si_mutex);
+
+static const struct file_operations qtee_fops;
+static const struct file_operations server_fops;
+
+struct server_info {
+	struct kref refcount;
+
+	/* List of transactions pending for service. */
+	struct list_head cb_tx_list;
+
+	int id, dead;
+
+	/* Queue of threads waiting for a new transaction. */
+	wait_queue_head_t server_threads;
+};
+
+/* Dispatcher is called with context ID [10 .. n] from qcom_object_invoke_core.c.
+ * Any ID below 10 is available to call dispatcher internally.
+ * Here, CONTEXT_ID_ANY is used to state that it is an async call, e.g. release.
+ */
+#define CONTEXT_ID_ANY 0
+
+/* A transaction made to usespace server host an object. */
+struct cb_txn {
+	struct kref refcount;
+	struct list_head node;
+	struct completion completion;
+
+	/* ''Object Invocation'' */
+
+	struct qcom_tee_arg *args;	/* Arguments for the requested operation. */
+	int errno;					/* Result of the operation. */
+
+	enum state {
+		XST_NEW = 0,		/* New transaction. */
+		XST_PENDING = 1,	/* Waiting for server. */
+		XST_PROCESSING = 2,	/* Being processed by server. */
+		XST_PROCESSED = 3,	/* Done. */
+		XST_TIMEDOUT = 4,
+	} processing;
+
+	/* ''Object Invocation'' as seen by userspace. */
+
+	struct qcom_tee_cb_arg *uargs;
+	size_t uargs_size;
+};
+
+/* 'struct cb_object' is a userspace object. */
+struct cb_object {
+	struct qcom_tee_object object;
+
+	/* If set, we send release request to userspace. */
+	int notify_on_release;
+
+	/* 'id' + 'server_info' combo that represents user object.*/
+	u64 id;
+	struct server_info *si;
+};
+
+static struct qcom_tee_object_operations cbo_ops;
+
+#define to_cb_object(o) container_of((o), struct cb_object, object)
+
+static int is_cb_object(struct qcom_tee_object *object)
+{
+	return (typeof_qcom_tee_object(object) == QCOM_TEE_OBJECT_TYPE_CB_OBJECT) &&
+		(object->ops == &cbo_ops);
+}
+
+static int fd_alloc(const char *name, const struct file_operations *fops, void *private)
+{
+	int fd;
+	struct file *file;
+
+	fd = get_unused_fd_flags(O_RDWR);
+	if (fd < 0)
+		return fd;
+
+	file = anon_inode_getfile(name, fops, private, O_RDWR);
+	if (!IS_ERR(file)) {
+		fd_install(fd, file);
+
+		return fd;
+	}
+
+	put_unused_fd(fd);
+
+	return PTR_ERR(file);
+}
+
+static struct file *get_file_of_type(int fd, const struct file_operations *fop)
+{
+	struct file *filp;
+
+	filp = fget(fd);
+	if (!filp)
+		return NULL;
+
+	if (filp->f_op == fop)
+		return filp;
+
+	fput(filp);
+
+	return NULL;
+}
+
+static struct cb_object *cb_object_alloc_for_param(struct qcom_tee_param *param)
+{
+	struct file *filp;
+	struct cb_object *cb_object;
+
+	filp = get_file_of_type(param->object.host_id, &server_fops);
+	if (!filp)
+		return ERR_PTR(-EBADF);
+
+	cb_object = kzalloc(sizeof(*cb_object), GFP_KERNEL);
+	if (cb_object) {
+		kref_get(&cb_object->si->refcount);
+		cb_object->notify_on_release = 1; /* Default: notify. */
+		cb_object->id = param->object.id;
+		cb_object->si = filp->private_data;
+
+	} else {
+		cb_object = ERR_PTR(-ENOMEM);
+	}
+
+	fput(filp);
+
+	return cb_object;
+}
+
+/* QCOM_TEE_OBJECT to/from PARAM. */
+
+/* This declaration should be removed, see comments in get_qcom_tee_object_from_param. */
+struct qcom_tee_object *qcom_tee_mem_object_init(struct dma_buf *dma_buf,
+	void (*release)(void *), void *private);
+
+/* get_qcom_tee_object_from_param - converts a param to instance of qcom_tee_object.
+ * It calls get_qcom_tee_object before returning (i.e. ref == 2) for all objects
+ * except QCOM_TEE_OBJECT_TYPE_USER: One reference for TEE and one for driver itself.
+ */
+static int get_qcom_tee_object_from_param(struct qcom_tee_param *param, struct qcom_tee_arg *arg)
+{
+	int ret = 0;
+	struct qcom_tee_object *object;
+
+	if (param->attr == QCOM_TEE_OBJECT) {
+		if (QCOM_TEE_PARAM_OBJECT_USER(param)) {
+			struct cb_object *cb_object;
+
+			cb_object = cb_object_alloc_for_param(param);
+			if (!IS_ERR(cb_object)) {
+				object = &cb_object->object;
+
+				init_qcom_tee_object_user(object, QCOM_TEE_OBJECT_TYPE_CB_OBJECT,
+					&cbo_ops, "cbo");
+
+				get_qcom_tee_object(object);
+			} else {
+				ret = PTR_ERR(cb_object);
+			}
+
+		} else if (QCOM_TEE_PARAM_OBJECT_KERNEL(param)) {
+			struct dma_buf *dma_buf;
+
+			/* param->object.host_id == QCOM_TEE_MEMORY_OBJECT. */
+
+			/* TODO. For now, we only have memory object that is hosted in kernel
+			 * so keep it simple. We should move this conversation to the code
+			 * implements the object using @param_to_object callback.
+			 */
+
+			dma_buf = dma_buf_get(param->object.id);
+			if (!IS_ERR(dma_buf)) {
+				object = qcom_tee_mem_object_init(dma_buf, NULL, NULL);
+				if (!object)
+					ret = -EINVAL;
+
+				get_qcom_tee_object(object);
+
+				/* qcom_tee_mem_object_init calls dma_buf_get internally. */
+				dma_buf_put(dma_buf);
+			} else {
+				ret = -EINVAL;
+			}
+
+		} else { /* QCOM_TEE_PARAM_OBJECT_SECURE(param). */
+			struct file *filp;
+
+			filp = get_file_of_type(param->object.id, &qtee_fops);
+			if (filp) {
+				object = filp->private_data;
+
+				/* We put 'filp' while keeping the instance of object. */
+				get_qcom_tee_object(object);
+
+				fput(filp);
+			} else {
+				ret = -EINVAL;
+			}
+		}
+
+	} else if (param->attr == QCOM_TEE_OBJECT_NULL) {
+		object = NULL_QCOM_TEE_OBJECT;
+
+	} else { /* param->attr == QCOM_TEE_BUFFER. */
+		ret = -EINVAL;
+	}
+
+	if (ret)
+		object = NULL_QCOM_TEE_OBJECT;
+
+	arg->o = object;
+
+	return ret;
+}
+
+/* This declaration should be removed, see comments in get_param_from_qcom_tee_object. */
+struct dma_buf *qcom_tee_mem_object_to_dma_buf(struct qcom_tee_object *object);
+
+/* get_param_from_qcom_tee_object - converts object to param.
+ * On SUCCESS, it calls put_qcom_tee_object before returning for all objects except
+ * QCOM_TEE_OBJECT_TYPE_USER. get_param_from_qcom_tee_object only initializes the
+ * object and attr fields.
+ */
+static int get_param_from_qcom_tee_object(struct qcom_tee_object *object,
+	struct qcom_tee_param *param, struct server_info **si)
+{
+	int ret = 0;
+
+	if (si)
+		*si = NULL;
+
+	switch (typeof_qcom_tee_object(object)) {
+	case QCOM_TEE_OBJECT_TYPE_NULL:
+		param->attr = QCOM_TEE_OBJECT_NULL;
+
+		break;
+	case QCOM_TEE_OBJECT_TYPE_CB_OBJECT:
+		param->attr = QCOM_TEE_OBJECT;
+
+		if (is_cb_object(object)) {
+			struct cb_object *cb_object = to_cb_object(object);
+
+			param->object.id = cb_object->id;
+			param->object.host_id = cb_object->si->id;
+
+			if (si)
+				*si = cb_object->si;
+
+			put_qcom_tee_object(object);
+
+		} else {
+			struct dma_buf *dma_buf = qcom_tee_mem_object_to_dma_buf(object);
+
+			/* TODO. For now, we only have memory object that is hosted in kernel
+			 * so keep it simple. We should move this conversation to the code
+			 * implements the object using @object_to_param callback.
+			 */
+
+			get_dma_buf(dma_buf);
+			param->object.id = dma_buf_fd(dma_buf, O_CLOEXEC);
+			if (param->object.id < 0) {
+				dma_buf_put(dma_buf);
+
+				ret = -EBADF;
+			} else {
+				param->object.host_id = QCOM_TEE_MEMORY_OBJECT;
+
+				put_qcom_tee_object(object);
+			}
+		}
+
+		break;
+	case QCOM_TEE_OBJECT_TYPE_USER:
+		param->attr = QCOM_TEE_OBJECT;
+		param->object.host_id = QCOM_TEE_OBJECT_SECURE;
+		param->object.id = fd_alloc(qcom_tee_object_name(object), &qtee_fops, object);
+		if (param->object.id < 0)
+			ret = -EBADF;
+
+		/* On SUCCESS, do not call put_qcom_tee_object.
+		 * refcount is used by file's private_data.
+		 */
+
+		break;
+	case QCOM_TEE_OBJECT_TYPE_ROOT:
+	default:
+		ret = -EBADF;
+
+		break;
+	}
+
+	if (ret)
+		param->attr = QCOM_TEE_OBJECT_NULL;
+
+	return ret;
+}
+
+/* Marshaling API. */
+/* marshal_in_req Prepare input buffer for sending to TEE.
+ * marshal_out_req Parse TEE response in input buffer.
+ * marshal_in_cb_req Parse TEE request from output buffer.
+ * marshal_out_cb_req Update output buffer with response for TEE request.
+ *
+ * marshal_in_req and marshal_out_req are used in direct invocation path.
+ * marshal_in_cb_req and marshal_out_cb_req are used for TEE request.
+ */
+
+static void marshal_in_req_cleanup(struct qcom_tee_arg u[], int notify)
+{
+	int i;
+	struct qcom_tee_object *object;
+
+	for (i = 0; u[i].type; i++) {
+		switch (u[i].type) {
+		case QCOM_TEE_ARG_TYPE_IO:
+			object = u[i].o;
+
+			if (is_cb_object(object))
+				to_cb_object(object)->notify_on_release = notify;
+
+			/* For object of type QCOM_TEE_OBJECT_TYPE_USER,
+			 * get_qcom_tee_object_from_param does not call get_qcom_tee_object
+			 * before returning (i.e. ref == 1). Replace it with
+			 * NULL_QCOM_TEE_OBJECT as after put_qcom_tee_object,
+			 * u[i].o is invalid.
+			 */
+
+			else if (typeof_qcom_tee_object(object) == QCOM_TEE_OBJECT_TYPE_USER)
+				u[i].o = NULL_QCOM_TEE_OBJECT;
+
+			put_qcom_tee_object(object);
+
+			break;
+		case QCOM_TEE_ARG_TYPE_IB:
+		case QCOM_TEE_ARG_TYPE_OB:
+		case QCOM_TEE_ARG_TYPE_OO:
+		default:
+
+			break;
+		}
+	}
+}
+
+static int marshal_in_req(struct qcom_tee_arg u[], struct qcom_tee_param *params, int num_params)
+{
+	int i;
+
+	/* Assume 'u' already cleared. */
+
+	for (i = 0; i < num_params; i++) {
+		if (params[i].attr == QCOM_TEE_BUFFER) {
+			if (params[i].direction)
+				u[i].type = QCOM_TEE_ARG_TYPE_IB;
+			else
+				u[i].type = QCOM_TEE_ARG_TYPE_OB;
+
+			u[i].flags = QCOM_TEE_ARG_FLAGS_UADDR;
+			u[i].b.uaddr = u64_to_user_ptr(params[i].buffer.addr);
+			u[i].b.size = params[i].buffer.len;
+
+		} else { /* QCOM_TEE_OBJECT || QCOM_TEE_OBJECT_NULL */
+			if (params[i].direction) {
+				if (get_qcom_tee_object_from_param(&params[i], &u[i]))
+					goto out_failed;
+
+				u[i].type = QCOM_TEE_ARG_TYPE_IO;
+			} else {
+				u[i].type = QCOM_TEE_ARG_TYPE_OO;
+			}
+		}
+	}
+
+	return 0;
+
+out_failed:
+
+	/* Release whatever resources we got in 'u'. */
+	marshal_in_req_cleanup(u, 0);
+
+	/* Drop TEE istances; on Success TEE does that. */
+	for (i = 0; u[i].type; i++) {
+		if (u[i].type == QCOM_TEE_ARG_TYPE_IO)
+			put_qcom_tee_object(u[i].o);
+	}
+
+	return -1;
+}
+
+static int marshal_out_req(struct qcom_tee_param params[], struct qcom_tee_arg u[])
+{
+	int i = 0, err = 0;
+
+	/* Consumes 'u' as initialized by marshal_in_req. */
+
+	for (i = 0; u[i].type; i++) {
+		switch (u[i].type) {
+		case QCOM_TEE_ARG_TYPE_OB:
+			params[i].buffer.len = u[i].b.size;
+
+			break;
+		case QCOM_TEE_ARG_TYPE_IO:
+			put_qcom_tee_object(u[i].o);
+
+			break;
+		case QCOM_TEE_ARG_TYPE_OO:
+			if (err) {
+				/* On FAILURE, continue to put objects. */
+				params[i].attr = QCOM_TEE_OBJECT_NULL;
+				put_qcom_tee_object(u[i].o);
+			} else if (get_param_from_qcom_tee_object(u[i].o, &params[i], NULL)) {
+				put_qcom_tee_object(u[i].o);
+
+				err = -1;
+			}
+
+			break;
+		case QCOM_TEE_ARG_TYPE_IB:
+		default:
+			break;
+		}
+	}
+
+	if (!err)
+		return 0;
+
+	/* Release whatever resources we got in 'params'. */
+	for (i = 0; u[i].type; i++) {
+		if (params[i].attr == QCOM_TEE_OBJECT)
+			; /* TODO. Cleanup exported object. */
+	}
+
+	return -1;
+}
+
+static int marshal_in_cb_req(struct qcom_tee_param params[], u64 ubuf,
+	struct server_info *target_si, struct qcom_tee_arg u[])
+{
+	int i, err = 0;
+
+	size_t offset = 0;
+
+	for (i = 0; u[i].type; i++) {
+		switch (u[i].type) {
+		case QCOM_TEE_ARG_TYPE_IB:
+		case QCOM_TEE_ARG_TYPE_OB:
+			params[i].attr = QCOM_TEE_BUFFER;
+			params[i].direction = u[i].type & QCOM_TEE_ARG_TYPE_INPUT_MASK;
+			params[i].buffer.addr = ubuf + offset;
+			params[i].buffer.len = u[i].b.size;
+
+			offset = ALIGN(offset + u[i].b.size, 8);
+
+			if (u[i].type == QCOM_TEE_ARG_TYPE_IB) {
+				void __user *uaddr = u64_to_user_ptr(params[i].buffer.addr);
+
+				if (copy_to_user(uaddr, u[i].b.addr, u[i].b.size))
+					return -1;
+			}
+
+			break;
+		case QCOM_TEE_ARG_TYPE_IO: {
+			struct server_info *si;
+
+			if (!err) {
+				params[i].direction = 1;
+				if (get_param_from_qcom_tee_object(u[i].o, &params[i], &si)) {
+					put_qcom_tee_object(u[i].o);
+
+					err = -1;
+				} else if (target_si && si && si != target_si) {
+					err = -1;
+				}
+			} else {
+				params[i].attr = QCOM_TEE_OBJECT_NULL;
+
+				put_qcom_tee_object(u[i].o);
+			}
+		}
+
+			break;
+		case QCOM_TEE_ARG_TYPE_OO:
+			params[i].attr = QCOM_TEE_OBJECT_NULL;
+			params[i].direction = 0;
+
+			break;
+		default:
+			break;
+		}
+	}
+
+	if (!err)
+		return 0;
+
+	/* Release whatever resources we got in 'params'. */
+	for (i = 0; u[i].type; i++) {
+		if (params[i].attr == QCOM_TEE_OBJECT)
+			; /* TODO. Cleanup exported object. */
+	}
+
+	return -1;
+}
+
+static int marshal_out_cb_req(struct qcom_tee_arg u[], struct qcom_tee_param params[])
+{
+	int i;
+
+	for (i = 0; u[i].type; i++) {
+		switch (u[i].type) {
+		case QCOM_TEE_ARG_TYPE_OB: {
+				void __user *uaddr = u64_to_user_ptr(params[i].buffer.addr);
+
+				u[i].b.size = params[i].buffer.len;
+				if (copy_from_user(u[i].b.addr, uaddr, params[i].buffer.len))
+					return -1;
+			}
+
+			break;
+		case QCOM_TEE_ARG_TYPE_OO:
+			if (get_qcom_tee_object_from_param(&params[i], &u[i])) {
+				/* TODO. Release whatever resources we got in 'u'.*/
+				return -1;
+			}
+
+			break;
+		case QCOM_TEE_ARG_TYPE_IO:
+		case QCOM_TEE_ARG_TYPE_IB:
+		default:
+			break;
+		}
+	}
+
+	return 0;
+}
+
+/* Transaction management. */
+/* TODO. Do better! */
+
+static struct cb_txn *txn_alloc(void)
+{
+	struct cb_txn *txn;
+
+	txn = kzalloc(sizeof(*txn), GFP_KERNEL);
+	if (txn) {
+		kref_init(&txn->refcount);
+
+		INIT_LIST_HEAD(&txn->node);
+		init_completion(&txn->completion);
+	}
+
+	return txn;
+}
+
+static void txn_free(struct cb_txn *txn)
+{
+	kfree(txn->uargs);
+	kfree(txn);
+}
+
+/* queue_txn - queue a transaction only if server 'si' is alive. */
+static int queue_txn(struct server_info *si, struct cb_txn *txn)
+{
+	int dead;
+
+	mutex_lock(&si_mutex);
+	dead = si->dead;
+	if (!dead) {
+		list_add(&txn->node, &si->cb_tx_list);
+
+		txn->processing = XST_PENDING;
+	}
+	mutex_unlock(&si_mutex);
+
+	return dead;
+}
+
+static struct cb_txn *dequeue_txn_by_id(struct server_info *si, unsigned int id)
+{
+	struct cb_txn *txn;
+
+	mutex_lock(&si_mutex);
+	list_for_each_entry(txn, &si->cb_tx_list, node)
+		if (txn->uargs->request_id == id) {
+			list_del_init(&txn->node);
+
+			goto found;
+		}
+
+	/* Invalid id. */
+	txn = NULL;
+
+found:
+	mutex_unlock(&si_mutex);
+
+	return txn;
+}
+
+/**
+ * possible__txn_state_transition - Return possible state transition.
+ * @txn: Transactione to update.
+ * @state: Target state for @txn.
+ *
+ * Checks if the requested state transition for @txn is possible.
+ * Returns @state if the transition is possible or if @txn is already in @state state.
+ * Returns current @txn state if the transition is not possible.
+ */
+static enum state possible__txn_state_transition(struct cb_txn *txn, enum state state)
+{
+	/* Possible state transitions:
+	 * PENDING	-> PROCESSING, TIMEDOUT.
+	 * PROCESSING -> PROCESSED, TIMEDOUT.
+	 */
+
+	/* Moving to PROCESSING state; we should be in PENDING state. */
+	if (state == XST_PROCESSING) {
+		if (txn->processing != XST_PENDING)
+			return txn->processing;
+
+	/* Moving to PROCESSED state; we should be in PROCESSING state. */
+	} else if (state == XST_PROCESSED) {
+		if (txn->processing != XST_PROCESSING)
+			return txn->processing;
+
+	/* Moving to TIMEDOUT state; we should be in PENDING or PROCESSING state. */
+	} else if (state == XST_TIMEDOUT) {
+		if (txn->processing != XST_PENDING && txn->processing != XST_PROCESSING)
+			return txn->processing;
+
+	} else {
+		return txn->processing;
+	}
+
+	return state;
+}
+
+static int set_txn_state_locked(struct cb_txn *txn, enum state state)
+{
+	enum state pstate;
+
+	pstate = possible__txn_state_transition(txn, state);
+	if (pstate == state) {
+		txn->processing = state;
+
+		return 0;
+	}
+
+	return -EINVAL;
+}
+
+static struct cb_txn *get_txn_for_state_transition_locked(struct server_info *si,
+	unsigned int id, enum state state)
+{
+	struct cb_txn *txn;
+
+	/* Supported state transitions:
+	 * PENDING	-> PROCESSING.
+	 * PROCESSING -> PROCESSED.
+	 */
+
+	if (state != XST_PROCESSING && state != XST_PROCESSED)
+		return NULL;
+
+	list_for_each_entry(txn, &si->cb_tx_list, node) {
+		/* Search for a specific transaction with a particular state?! */
+		if (id != CONTEXT_ID_ANY && txn->uargs->request_id != id)
+			continue;
+
+		if (txn->processing != state &&
+			possible__txn_state_transition(txn, state) == state) {
+			kref_get(&txn->refcount);
+
+			return txn;
+		}
+	}
+
+	return NULL;
+}
+
+static struct cb_txn *get_txn_for_state_transition(struct server_info *si,
+	unsigned int context_id, enum state state)
+{
+	struct cb_txn *txn;
+
+	mutex_lock(&si_mutex);
+	txn = get_txn_for_state_transition_locked(si, context_id, state);
+	mutex_unlock(&si_mutex);
+
+	return txn;
+}
+
+static int set_txn_state(struct cb_txn *txn, enum state state)
+{
+	int ret;
+
+	mutex_lock(&si_mutex);
+	ret = set_txn_state_locked(txn, state);
+	mutex_unlock(&si_mutex);
+
+	return ret;
+}
+
+static void __release_txn(struct kref *refcount)
+{
+	struct cb_txn *txn = container_of(refcount, struct cb_txn, refcount);
+
+	txn_free(txn);
+}
+
+static void put_txn(struct cb_txn *txn)
+{
+	kref_put(&txn->refcount, __release_txn);
+}
+
+static void dequeue_and_put_txn(struct cb_txn *txn)
+{
+	mutex_lock(&si_mutex);
+	/* Only if it is queued. */
+	if (txn->processing != XST_NEW)
+		list_del_init(&txn->node);
+	mutex_unlock(&si_mutex);
+
+	put_txn(txn);
+}
+
+/* wait_for_pending_txn picks the next available pending transaction or sleep. */
+static int wait_for_pending_txn(struct server_info *si, struct cb_txn **picked_txn)
+{
+	int ret = 0;
+	struct cb_txn *txn;
+
+	DEFINE_WAIT_FUNC(wait, woken_wake_function);
+
+	add_wait_queue(&si->server_threads, &wait);
+	while (1) {
+		if (signal_pending(current)) {
+			ret = -ERESTARTSYS;
+
+			break;
+		}
+
+		mutex_lock(&si_mutex);
+		txn = get_txn_for_state_transition_locked(si, CONTEXT_ID_ANY, XST_PROCESSING);
+		if (txn) {
+			/* ''PENDING -> PROCESSING''. */
+			set_txn_state_locked(txn, XST_PROCESSING);
+			mutex_unlock(&si_mutex);
+
+			break;
+		}
+		mutex_unlock(&si_mutex);
+
+		wait_woken(&wait, TASK_INTERRUPTIBLE, MAX_SCHEDULE_TIMEOUT);
+	}
+
+	remove_wait_queue(&si->server_threads, &wait);
+	*picked_txn = txn;
+
+	return ret;
+}
+
+/* Callback object's operations. */
+
+static int cbo_dispatch(unsigned int context_id,
+	struct qcom_tee_object *object, unsigned long op, struct qcom_tee_arg *args)
+{
+	struct cb_txn *txn;
+	struct cb_object *cb_object = to_cb_object(object);
+
+	int errno, num_params = size_of_arg(args);
+
+	txn = txn_alloc();
+	if (!txn)
+		return -ENOMEM;
+
+	/* INIT and QUEUE the request. */
+
+	txn->args = args;
+	txn->uargs_size = offsetof(struct qcom_tee_cb_arg, params) +
+		(num_params * sizeof(txn->uargs->params[0]));
+
+	txn->uargs = kzalloc(txn->uargs_size, GFP_KERNEL);
+	if (!txn->args) {
+		put_txn(txn);
+
+		return -EINVAL;
+	}
+
+	txn->uargs->id = cb_object->id;
+	txn->uargs->op = op;
+	txn->uargs->request_id = context_id;
+	txn->uargs->num_params = num_params;
+
+	if (queue_txn(cb_object->si, txn)) {
+		put_txn(txn);
+
+		return -EINVAL;
+	}
+
+	wake_up_interruptible_all(&cb_object->si->server_threads);
+
+	if (context_id == CONTEXT_ID_ANY)
+		return 0;
+
+	wait_for_completion_state(&txn->completion, TASK_FREEZABLE);
+
+	/* TODO. Allow TASK_KILLABLE. */
+	/* We do not care why wait_for_completion_state returend.
+	 * The fastest way to exit the dispatcher is to TIMEOUT the transaction.
+	 * However, if set_txn_state failed, then transaction has already been PROCESSED.
+	 */
+
+	errno = set_txn_state(txn, XST_TIMEDOUT) ? txn->errno : -EINVAL;
+	if (errno)
+		dequeue_and_put_txn(txn);
+
+	return errno;
+}
+
+static void cbo_notify(unsigned int context_id, struct qcom_tee_object *object, int status)
+{
+	struct cb_txn *txn;
+
+	txn = dequeue_txn_by_id(to_cb_object(object)->si, context_id);
+	if (txn) {
+		int i;
+		struct qcom_tee_arg *u = txn->args;
+
+		for (i = 0; u[i].type; i++) {
+			if (u[i].type == QCOM_TEE_ARG_TYPE_OO) {
+				/* Transport failed. TEE did not recived the objects. */
+				if (status && (typeof_qcom_tee_object(u[i].o) !=
+						QCOM_TEE_OBJECT_TYPE_USER))
+					put_qcom_tee_object(u[i].o);
+
+				put_qcom_tee_object(u[i].o);
+			}
+		}
+
+		put_txn(txn);
+	}
+}
+
+static void ____destroy_server_info(struct kref *kref);
+static void cbo_release(struct qcom_tee_object *object)
+{
+	struct cb_object *cb_object = to_cb_object(object);
+
+	if (cb_object->notify_on_release) {
+		static struct qcom_tee_arg args[] = { { .type = QCOM_TEE_ARG_TYPE_END } };
+
+		/* Use 'CONTEXT_ID_ANY' as context ID; as we do not care about the results. */
+		cbo_dispatch(CONTEXT_ID_ANY, object, QCOM_TEE_OBJECT_OP_RELEASE, args);
+	}
+
+	/* The matching 'kref_get' is in 'cb_object_alloc'. */
+	kref_put(&cb_object->si->refcount, ____destroy_server_info);
+	kfree(cb_object);
+}
+
+static struct qcom_tee_object_operations cbo_ops = {
+	.release = cbo_release,
+	.notify = cbo_notify,
+	.dispatch = cbo_dispatch,
+};
+
+/* User Callback server */
+
+static int server_open(struct inode *nodp, struct file *filp)
+{
+	struct server_info *si;
+
+	si = kzalloc(sizeof(*si), GFP_KERNEL);
+	if (!si)
+		return -ENOMEM;
+
+	kref_init(&si->refcount);
+	INIT_LIST_HEAD(&si->cb_tx_list);
+	init_waitqueue_head(&si->server_threads);
+
+	filp->private_data = ROOT_QCOM_TEE_OBJECT;
+
+	return 0;
+}
+
+static long qtee_ioctl_receive(struct server_info *si, u64 uargs, size_t len)
+{
+	struct cb_txn *txn;
+	u64 ubuf;
+
+	do {
+		/* WAIT FOR A REQUEST ... */
+		if (wait_for_pending_txn(si, &txn))
+			return -ERESTARTSYS;
+
+		/* Extra user buffer used for buffer arguments. */
+		ubuf = ALIGN(uargs + txn->uargs_size, 8);
+
+		/* Initialize param. */
+		/* The remaining fields are already initialized in cbo_dispatch. */
+		if (marshal_in_cb_req(txn->uargs->params, ubuf, si, txn->args))
+			goto out_failed;
+
+		if (copy_to_user((void __user *)uargs, txn->uargs, txn->uargs_size)) {
+			/* TODO. We need to do some cleanup for marshal_in_cb_req. */
+			goto out_failed;
+		}
+
+		break;
+
+out_failed:
+		/* FAILED parsing a request. Notify TEE and try another one. */
+
+		if (txn->uargs->request_id == CONTEXT_ID_ANY)
+			dequeue_and_put_txn(txn);
+		else
+			complete(&txn->completion);
+
+		put_txn(txn);
+	} while (1);
+
+	return 0;
+}
+
+static long qtee_ioctl_reply(struct server_info *si, u64 uargs, size_t len)
+{
+	struct qcom_tee_cb_arg args;
+	struct cb_txn *txn;
+
+	int errno;
+
+	if (copy_from_user(&args, (void __user *)uargs, sizeof(args)))
+		return -EFAULT;
+
+	/* 'CONTEXT_ID_ANY' context ID?! Ignore. */
+	if (args.request_id == CONTEXT_ID_ANY)
+		return 0;
+
+	txn = get_txn_for_state_transition(si, args.request_id, XST_PROCESSED);
+	if (!txn)
+		return -EINVAL;
+
+	errno = args.result;
+	if (!errno) {
+		/* Only parse arguments on SUCCESS. */
+
+		/* TODO. Do not copy the header again, but let's keep it simple for now. */
+		if (copy_from_user(txn->uargs, (void __user *)uargs, txn->uargs_size)) {
+			errno = -EFAULT;
+		} else {
+			if (marshal_out_cb_req(txn->args, txn->uargs->params))
+				errno = -EINVAL;
+		}
+	}
+
+	txn->errno = errno;
+
+	if (set_txn_state(txn, XST_PROCESSED))
+		; /* TODO. We need to do some cleanup for marshal_out_cb_req on !errno. */
+	else
+		complete(&txn->completion);
+
+	put_txn(txn);
+
+	return errno;
+}
+
+static long server_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
+{
+	struct qcom_tee_ioctl_data data;
+
+	if (_IOC_SIZE(cmd) != sizeof(data))
+		return -EINVAL;
+
+	if (copy_from_user(&data, (void __user *)arg, sizeof(data)))
+		return -EFAULT;
+
+	switch (cmd) {
+	case QCOM_TEE_IOCTL_RECEIVE:
+		return qtee_ioctl_receive(filp->private_data, data.buf_ptr, data.buf_len);
+
+	case QCOM_TEE_IOCTL_REPLY:
+		return qtee_ioctl_reply(filp->private_data, data.buf_ptr, data.buf_len);
+
+	default:
+		return -ENOIOCTLCMD;
+	}
+}
+
+static void ____destroy_server_info(struct kref *kref)
+{
+	struct server_info *si = container_of(kref, struct server_info, refcount);
+
+	kfree(si);
+}
+
+static int server_release(struct inode *nodp, struct file *filp)
+{
+	struct server_info *si = filp->private_data;
+
+	mutex_lock(&si_mutex);
+	si->dead = 1;
+
+	/* TODO. Teminate any PENDING or PROCESSING transactions. */
+
+	mutex_unlock(&si_mutex);
+	kref_put(&si->refcount, ____destroy_server_info);
+
+	return 0;
+}
+
+static const struct file_operations server_fops = {
+	.owner = THIS_MODULE,
+	.unlocked_ioctl = server_ioctl,
+	.compat_ioctl = server_ioctl,
+	.release = server_release,
+	.open = server_open,
+};
+
+/* TEE object invocation. */
+
+static long qtee_ioctl_invoke(struct qcom_tee_object *object,
+	struct qcom_tee_object_invoke_arg __user *uargs, size_t len)
+{
+	int ret;
+
+	struct qcom_tee_object_invoke_arg args;
+	struct qcom_tee_object_invoke_ctx *oic;
+	struct qcom_tee_param *params;
+	struct qcom_tee_arg *u;
+
+	if (copy_from_user(&args, (void __user *)uargs, sizeof(args)))
+		return -EFAULT;
+
+	oic = kzalloc(sizeof(*oic), GFP_KERNEL);
+	if (!oic)
+		return -ENOMEM;
+
+	params = kcalloc(args.num_params, sizeof(*params), GFP_KERNEL);
+	if (!params) {
+		ret = -ENOMEM;
+		goto out_failed;
+	}
+
+	/* Plus one for 'QCOM_TEE_ARG_TYPE_END'. */
+	u = kcalloc(args.num_params + 1, sizeof(*u), GFP_KERNEL);
+	if (!u) {
+		ret = -ENOMEM;
+		goto out_failed;
+	}
+
+	/* Copy argument array from userspace. */
+	if (copy_from_user(params, (void __user *)uargs->params,
+		sizeof(*params) * args.num_params)) {
+		ret = -EFAULT;
+		goto out_failed;
+	}
+
+	/* INITIATE an invocation. */
+
+	if (marshal_in_req(u, params, args.num_params)) {
+		pr_err("marshal_in_req failed.\n");
+		ret = -EINVAL;
+		goto out_failed;
+	}
+
+	ret = qcom_tee_object_do_invoke(oic, object, args.op, u, &args.result);
+	if (ret) {
+		/* TODO. We need to do some cleanup for marshal_in_req. */
+		goto out_failed;
+	}
+
+	if (!args.result) {
+		if (marshal_out_req(params, u)) {
+			pr_err("marshal_out_req failed.\n");
+			ret = -EINVAL;
+			goto out_failed;
+		}
+
+		if (copy_to_user((void __user *)uargs->params, params,
+			sizeof(*params) * args.num_params)) {
+			ret = -EFAULT;
+
+			/* TODO. We need to do some cleanup for marshal_out_req. */
+
+			goto out_failed;
+		}
+	}
+
+	/* Copy u_req.result back! */
+	if (copy_to_user(uargs, &args, sizeof(args))) {
+		ret = -EFAULT;
+
+		goto out_failed;
+	}
+
+	ret = 0;
+
+out_failed:
+	kfree(u);
+	kfree(params);
+	kfree(oic);
+
+	return ret;
+}
+
+static long qtee_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
+{
+	struct qcom_tee_ioctl_data data;
+
+	if (_IOC_SIZE(cmd) != sizeof(data))
+		return -EINVAL;
+
+	if (copy_from_user(&data, (void __user *)arg, sizeof(data)))
+		return -EFAULT;
+
+	switch (cmd) {
+	case QCOM_TEE_IOCTL_INVOKE:
+		return qtee_ioctl_invoke(filp->private_data,
+			(struct qcom_tee_object_invoke_arg __user *)data.buf_ptr, data.buf_len);
+
+	default:
+		return -ENOIOCTLCMD;
+	}
+}
+
+static int qtee_release(struct inode *nodp, struct file *filp)
+{
+	struct qcom_tee_object *object = filp->private_data;
+
+	/* The matching get_qcom_tee_object is in get_param_from_qcom_tee_object. */
+	put_qcom_tee_object(object);
+
+	return 0;
+}
+
+static const struct file_operations qtee_fops = {
+	.owner = THIS_MODULE,
+	.unlocked_ioctl = qtee_ioctl,
+	.compat_ioctl = qtee_ioctl,
+	.release = qtee_release,
+};
+
+/* ''ROOT Object'' */
+
+static int root_open(struct inode *nodp, struct file *filp)
+{
+	/* Always return the same instance of root qcom_tee_object. */
+	filp->private_data = ROOT_QCOM_TEE_OBJECT;
+
+	return 0;
+}
+
+static const struct file_operations root_fops = {
+	.owner = THIS_MODULE,
+	.unlocked_ioctl = qtee_ioctl,
+	.compat_ioctl = qtee_ioctl,
+	.open = root_open,
+};
+
+/* Device for direct object invocation. */
+static struct miscdevice smcinvoke_misc_qtee_device = {
+	.minor = MISC_DYNAMIC_MINOR,
+	.name = "qtee",
+	.fops = &root_fops,
+};
+
+/* Device to start a userspace object host, i.e. a callback server. */
+static struct miscdevice smcinvoke_misc_qtee_ree_device = {
+	.minor = MISC_DYNAMIC_MINOR,
+	.name = "qtee-ree",
+	.fops = &server_fops,
+};
+
+static int smcinvoke_probe(struct platform_device *pdev)
+{
+	int ret;
+
+	ret = misc_register(&smcinvoke_misc_qtee_device);
+	if (ret)
+		return ret;
+
+	ret = misc_register(&smcinvoke_misc_qtee_ree_device);
+	if (ret) {
+		misc_deregister(&smcinvoke_misc_qtee_device);
+
+		return ret;
+	}
+
+	return 0;
+}
+
+static const struct of_device_id smcinvoke_match[] = {
+	{ .compatible = "qcom,smcinvoke", }, {},
+};
+
+static struct platform_driver smcinvoke_plat_driver = {
+	.probe = smcinvoke_probe,
+	.driver = {
+		.name = "smcinvoke",
+		.of_match_table = smcinvoke_match,
+	},
+};
+
+module_platform_driver(smcinvoke_plat_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("smcinvoke driver");
+MODULE_IMPORT_NS(VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver);
+MODULE_IMPORT_NS(DMA_BUF);
diff --git a/include/uapi/misc/qcom_tee.h b/include/uapi/misc/qcom_tee.h
new file mode 100644
index 000000000000..7c127efc9612
--- /dev/null
+++ b/include/uapi/misc/qcom_tee.h
@@ -0,0 +1,117 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+
+#ifndef __QCOM_TEE_H__
+#define __QCOM_TEE_H__
+
+#include <linux/types.h>
+
+/**
+ * struct qcom_tee_ioctl_data - Buffer to pass arguments to IOCTL call.
+ * @buf_ptr: a __user pointer to a buffer.
+ * @buf_len: length of the buffer.
+ *
+ * Used for QCOM_TEE_IOCTL_INVOKE, QCOM_TEE_IOCTL_RECEIVE, and QCOM_TEE_IOCTL_REPLY.
+ */
+struct qcom_tee_ioctl_data {
+	__u64 buf_ptr;
+	__u64 buf_len;
+};
+
+#define QCOM_TEE_IOCTL_INVOKE _IOWR('Q', 0, struct qcom_tee_ioctl_data)
+#define QCOM_TEE_IOCTL_RECEIVE _IOWR('Q', 1, struct qcom_tee_ioctl_data)
+#define QCOM_TEE_IOCTL_REPLY _IOWR('Q', 2, struct qcom_tee_ioctl_data)
+
+enum qcom_tee_param_attr {
+	/* Buffer. */
+	QCOM_TEE_BUFFER = 0,
+	/* A NULL object. */
+	QCOM_TEE_OBJECT_NULL = 0x80,
+	/* An object. */
+	QCOM_TEE_OBJECT = QCOM_TEE_OBJECT_NULL + 1,
+};
+
+/**
+ * Objects can be hosted on secure side, or privileged nonsecure side.
+ * host_id in struct qcom_tee_param specifies the object host.
+ *
+ * For remote objects, use QCOM_TEE_OBJECT_SECURE. For objects, hosted in
+ * userspace, host_id is the file descriptor of the userspace server that host
+ * the object. Any negative number, is an object hosted in kernel.
+ */
+
+#define QCOM_TEE_OBJECT_SECURE -1
+#define QCOM_TEE_MEMORY_OBJECT -2
+
+/* Some helpers to check object host. */
+
+#define QCOM_TEE_PARAM_OBJECT_SECURE(p) ((p)->object.host_id == QCOM_TEE_OBJECT_SECURE)
+#define QCOM_TEE_PARAM_OBJECT_KERNEL(p) ((p)->object.host_id < QCOM_TEE_OBJECT_SECURE)
+#define QCOM_TEE_PARAM_OBJECT_USER(p) ((p)->object.host_id > QCOM_TEE_OBJECT_SECURE)
+
+/**
+ * struct qcom_tee_param - Parameter to IOCTL calls.
+ * @attr: attributes from enum qcom_tee_param_attr.
+ * @direction: either input or output parameter.
+ * @object: an ID that represent the object.
+ * @buffer: a buffer.
+ *
+ * @id is the file descriptor that represents the object if @host_id is
+ * QCOM_TEE_OBJECT_KERNEL or QCOM_TEE_OBJECT_SECURE. Otherwise, it is a number
+ * that represents the object in the userspace process.
+ *
+ * @addr and @len represents a buffer which is copied to a shared buffer with
+ * secure side, i.e. it is not zero-copy.
+ *
+ * QCOM_TEE_OBJECT_NULL is valid everywhere, so @id and @host_id are ignored.
+ */
+struct qcom_tee_param {
+	__u32 attr;
+	__u32 direction;
+
+	union {
+		struct {
+			__u64 id;
+			__s32 host_id;
+		} object;
+
+		struct {
+			__u64 addr;
+			__u64 len;
+		} buffer;
+	};
+};
+
+/**
+ * struct qcom_tee_object_invoke_arg - Invokes an object in QTEE.
+ * @op: operation specific to object.
+ * @result: return value.
+ * @num_params: number of parameters following this struct.
+ */
+struct qcom_tee_object_invoke_arg {
+	__u32 op;
+	__s32 result;
+	__u32 num_params;
+	struct qcom_tee_param params[];
+};
+
+/**
+ * struct qcom_tee_cb_arg - Receive/Send object invocation from/to QTEE.
+ * @id: object ID being invoked.
+ * @request_id: ID of current request.
+ * @op: operation specific to object.
+ * @result: return value.
+ * @num_params: number of parameters following this struct.
+ *
+ * @params is initialized to represents number of input and output parameters
+ * and where the kernel expects to read the results.
+ */
+struct qcom_tee_cb_arg {
+	__u64 id;
+	__u32 request_id;
+	__u32 op;
+	__s32 result;
+	__u32 num_params;
+	struct qcom_tee_param params[];
+};
+
+#endif /* __QCOM_TEE_H__ */

-- 
2.34.1

