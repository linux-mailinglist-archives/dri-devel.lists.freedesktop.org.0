Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 388C09254D4
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2024 09:41:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF07810E74C;
	Wed,  3 Jul 2024 07:41:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="D7ewIrZ5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8142410E731
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jul 2024 05:58:41 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 462HEXFI026437;
 Wed, 3 Jul 2024 05:58:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 V8TXcx8jw6QWvKs5CYwsTmHLAtBSwRHSzyv0bVaGZQ4=; b=D7ewIrZ5qK0iDwyT
 lhg63QZcIQQ+p7Gm+00wlQrQg2o5fXkbtLFkNNInf+FtgFIYnK5UQ+Rh322Tl5tw
 yn72qpix9EI6g0EDJndn9shPYxLgqJpbD92InV6tzOYR3UACJ7Q8hgHZ80q0Bkxm
 YwqWc58HAiGe8k5s70DCsGZtgLFZfufxhGOdxyKUcRllOPzufmRoudTLIWj6ILWN
 iY2rMHg83Xgf/PJEF+0HTPYyGMSGbH3rIv3kSyR/1Qey4+aSck+ZY8ap+rAmNl0V
 MRZyj65bHAOSkUfJ4micQcOTHq2w3OCmjA0UKPBwoJQ+DqLV+tdE6M/RBcsc+B5w
 WJz6NQ==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4027mnr571-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 Jul 2024 05:58:33 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 4635wVlv031851
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 3 Jul 2024 05:58:31 GMT
Received: from hu-azarrabi-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 2 Jul 2024 22:58:31 -0700
From: Amirreza Zarrabi <quic_azarrabi@quicinc.com>
Date: Tue, 2 Jul 2024 22:57:36 -0700
Subject: [PATCH RFC 1/3] firmware: qcom: implement object invoke support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240702-qcom-tee-object-and-ioctls-v1-1-633c3ddf57ee@quicinc.com>
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
X-Proofpoint-ORIG-GUID: bgfF0m4pFUqjGKfycWXzM9nANdFOjKka
X-Proofpoint-GUID: bgfF0m4pFUqjGKfycWXzM9nANdFOjKka
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-03_02,2024-07-02_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0
 spamscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 mlxscore=0 suspectscore=0 clxscore=1015
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
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

Qualcomm TEE hosts Trusted Applications and Services that run in the
secure world. Access to these resources is provided using object
capabilities. A TEE client with access to the capability can invoke
the object and request a service. Similarly, TEE can request a service
from nonsecure world with object capabilities that are exported to secure
world.

We provide qcom_tee_object which represents an object in both secure
and nonsecure world. TEE clients can invoke an instance of qcom_tee_object
to access TEE. TEE can issue a callback request to nonsecure world
by invoking an instance of qcom_tee_object in nonsecure world.

Any driver in nonsecure world that is interested to export a struct (or a
service object) to TEE, requires to embed an instance of qcom_tee_object in
the relevant struct and implements the dispatcher function which is called
when TEE invoked the service object.

We also provids simplified API which implements the Qualcomm TEE transport
protocol. The implementation is independent from any services that may
reside in nonsecure world.

Signed-off-by: Amirreza Zarrabi <quic_azarrabi@quicinc.com>
---
 drivers/firmware/qcom/Kconfig                      |   14 +
 drivers/firmware/qcom/Makefile                     |    2 +
 drivers/firmware/qcom/qcom_object_invoke/Makefile  |    4 +
 drivers/firmware/qcom/qcom_object_invoke/async.c   |  142 +++
 drivers/firmware/qcom/qcom_object_invoke/core.c    | 1139 ++++++++++++++++++++
 drivers/firmware/qcom/qcom_object_invoke/core.h    |  186 ++++
 .../qcom/qcom_object_invoke/qcom_scm_invoke.c      |   22 +
 .../firmware/qcom/qcom_object_invoke/release_wq.c  |   90 ++
 include/linux/firmware/qcom/qcom_object_invoke.h   |  233 ++++
 9 files changed, 1832 insertions(+)

diff --git a/drivers/firmware/qcom/Kconfig b/drivers/firmware/qcom/Kconfig
index 7f6eb4174734..103ab82bae9f 100644
--- a/drivers/firmware/qcom/Kconfig
+++ b/drivers/firmware/qcom/Kconfig
@@ -84,4 +84,18 @@ config QCOM_QSEECOM_UEFISECAPP
 	  Select Y here to provide access to EFI variables on the aforementioned
 	  platforms.
 
+config QCOM_OBJECT_INVOKE_CORE
+	bool "Secure TEE Communication Support"
+	help
+	  Various Qualcomm SoCs have a Trusted Execution Environment (TEE) running
+	  in the Trust Zone. This module provides an interface to that via the
+	  capability based object invocation, using SMC calls.
+
+	  OBJECT_INVOKE_CORE allows capability based secure communication between
+	  TEE and VMs. Using OBJECT_INVOKE_CORE, kernel can issue calls to TEE or
+	  TAs to request a service or exposes services to TEE and TAs. It implements
+	  the necessary marshaling of messages with TEE.
+
+	  Select Y here to provide access to TEE.
+
 endmenu
diff --git a/drivers/firmware/qcom/Makefile b/drivers/firmware/qcom/Makefile
index 0be40a1abc13..dd5e00215b2e 100644
--- a/drivers/firmware/qcom/Makefile
+++ b/drivers/firmware/qcom/Makefile
@@ -8,3 +8,5 @@ qcom-scm-objs += qcom_scm.o qcom_scm-smc.o qcom_scm-legacy.o
 obj-$(CONFIG_QCOM_TZMEM)	+= qcom_tzmem.o
 obj-$(CONFIG_QCOM_QSEECOM)	+= qcom_qseecom.o
 obj-$(CONFIG_QCOM_QSEECOM_UEFISECAPP) += qcom_qseecom_uefisecapp.o
+
+obj-y += qcom_object_invoke/
diff --git a/drivers/firmware/qcom/qcom_object_invoke/Makefile b/drivers/firmware/qcom/qcom_object_invoke/Makefile
new file mode 100644
index 000000000000..6ef4d54891a5
--- /dev/null
+++ b/drivers/firmware/qcom/qcom_object_invoke/Makefile
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+obj-$(CONFIG_QCOM_OBJECT_INVOKE_CORE) += object-invoke-core.o
+object-invoke-core-objs := qcom_scm_invoke.o release_wq.o async.o core.o
diff --git a/drivers/firmware/qcom/qcom_object_invoke/async.c b/drivers/firmware/qcom/qcom_object_invoke/async.c
new file mode 100644
index 000000000000..dd022ec68d8b
--- /dev/null
+++ b/drivers/firmware/qcom/qcom_object_invoke/async.c
@@ -0,0 +1,142 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <linux/kobject.h>
+#include <linux/slab.h>
+#include <linux/mutex.h>
+
+#include "core.h"
+
+/* Async handlers and providers. */
+struct async_msg {
+	struct {
+		u32 version;	/* Protocol version: top 16b major, lower 16b minor. */
+		u32 op;			/* Async operation. */
+	} header;
+
+	/* Format of the Async data field is defined by the specified operation. */
+
+	struct {
+		u32 count;	/* Number of objects that should be released. */
+		u32 obj[];
+	} op_release;
+};
+
+/* Async Operations and header information. */
+
+#define ASYNC_HEADER_SIZE sizeof(((struct async_msg *)(0))->header)
+
+/* ASYNC_OP_x: operation.
+ * ASYNC_OP_x_HDR_SIZE: header size for the operation.
+ * ASYNC_OP_x_SIZE: size of each entry in a message for the operation.
+ * ASYNC_OP_x_MSG_SIZE: size of a message with n entries.
+ */
+
+#define ASYNC_OP_RELEASE QCOM_TEE_OBJECT_OP_RELEASE	/* Added in minor version 0x0000. **/
+#define ASYNC_OP_RELEASE_HDR_SIZE offsetof(struct async_msg, op_release.obj)
+#define ASYNC_OP_RELEASE_SIZE sizeof(((struct async_msg *)(0))->op_release.obj[0])
+#define ASYNC_OP_RELEASE_MSG_SIZE(n) \
+	(ASYNC_OP_RELEASE_HDR_SIZE + ((n) * ASYNC_OP_RELEASE_SIZE))
+
+/* async_qcom_tee_buffer return the available async buffer in the output buffer. */
+
+static struct qcom_tee_buffer async_qcom_tee_buffer(struct qcom_tee_object_invoke_ctx *oic)
+{
+	int i;
+	size_t offset;
+
+	struct qcom_tee_callback *msg = (struct qcom_tee_callback *)oic->out.msg.addr;
+
+	if (!(oic->flags & OIC_FLAG_BUSY))
+		return oic->out.msg;
+
+	/* Async requests are appended to the output buffer after the CB message. */
+
+	offset = OFFSET_TO_BUFFER_ARGS(msg, counts_total(msg->counts));
+
+	for_each_input_buffer(i, msg->counts)
+		offset += align_offset(msg->args[i].b.size);
+
+	for_each_output_buffer(i, msg->counts)
+		offset += align_offset(msg->args[i].b.size);
+
+	if (oic->out.msg.size > offset) {
+		return (struct qcom_tee_buffer)
+			{ { oic->out.msg.addr + offset }, oic->out.msg.size - offset };
+	}
+
+	pr_err("no space left for async messages! or malformed message.\n");
+
+	return (struct qcom_tee_buffer) { { 0 }, 0 };
+}
+
+static size_t async_release_handler(struct qcom_tee_object_invoke_ctx *oic,
+	struct async_msg *async_msg, size_t size)
+{
+	int i;
+
+	/* We need space for at least a single entry. */
+	if (size < ASYNC_OP_RELEASE_MSG_SIZE(1))
+		return 0;
+
+	for (i = 0; i < async_msg->op_release.count; i++) {
+		struct qcom_tee_object *object;
+
+		/* Remove the object from xa_qcom_tee_objects so that the object_id
+		 * becomes invalid for further use. However, call put_qcom_tee_object
+		 * to schedule the actual release if there is no user.
+		 */
+
+		object = erase_qcom_tee_object(async_msg->op_release.obj[i]);
+
+		put_qcom_tee_object(object);
+	}
+
+	return ASYNC_OP_RELEASE_MSG_SIZE(i);
+}
+
+/* '__fetch__async_reqs' is a handler dispatcher (from TEE). */
+
+void __fetch__async_reqs(struct qcom_tee_object_invoke_ctx *oic)
+{
+	size_t consumed, used = 0;
+
+	struct qcom_tee_buffer async_buffer = async_qcom_tee_buffer(oic);
+
+	while (async_buffer.size - used > ASYNC_HEADER_SIZE) {
+		struct async_msg *async_msg = (struct async_msg *)(async_buffer.addr + used);
+
+		/* TEE assumes unused buffer is set to zero. */
+		if (!async_msg->header.version)
+			goto out;
+
+		switch (async_msg->header.op) {
+		case ASYNC_OP_RELEASE:
+			consumed = async_release_handler(oic,
+				async_msg, async_buffer.size - used);
+
+			break;
+		default: /* Unsupported operations. */
+			consumed = 0;
+		}
+
+		used += align_offset(consumed);
+
+		if (!consumed) {
+			pr_err("Drop async buffer (context_id %d): buffer %p, (%p, %zx), processed %zx\n",
+				oic->context_id,
+				oic->out.msg.addr,	/* Address of Output buffer. */
+				async_buffer.addr,	/* Address of beginning of async buffer. */
+				async_buffer.size,	/* Available size of async buffer. */
+				used);				/* Processed async buffer. */
+
+			goto out;
+		}
+	}
+
+ out:
+
+	memset(async_buffer.addr, 0, async_buffer.size);
+}
diff --git a/drivers/firmware/qcom/qcom_object_invoke/core.c b/drivers/firmware/qcom/qcom_object_invoke/core.c
new file mode 100644
index 000000000000..37dde8946b08
--- /dev/null
+++ b/drivers/firmware/qcom/qcom_object_invoke/core.c
@@ -0,0 +1,1139 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <linux/kobject.h>
+#include <linux/sysfs.h>
+#include <linux/module.h>
+#include <linux/init.h>
+#include <linux/slab.h>
+#include <linux/delay.h>
+#include <linux/mm.h>
+#include <linux/xarray.h>
+
+#include "core.h"
+
+/* Static 'Primordial Object' operations. */
+
+#define OBJECT_OP_YIELD	1
+#define OBJECT_OP_SLEEP	2
+
+/* static_qcom_tee_object_primordial always exists. */
+/* primordial_object_register and primordial_object_release extends it. */
+
+static struct qcom_tee_object static_qcom_tee_object_primordial;
+
+static int primordial_object_register(struct qcom_tee_object *object);
+static void primordial_object_release(struct qcom_tee_object *object);
+
+/* Marshaling API. */
+/*
+ * prepare_msg - Prepares input buffer for sending to TEE.
+ * update_args - Parses TEE response in input buffer.
+ * prepare_args - Parses TEE request from output buffer.
+ * update_msg - Updates output buffer with response for TEE request.
+ *
+ * prepare_msg and update_args are used in direct TEE object invocation.
+ * prepare_args and update_msg are used for TEE requests (callback or async).
+ */
+
+static int prepare_msg(struct qcom_tee_object_invoke_ctx *oic,
+	struct qcom_tee_object *object, unsigned long op, struct qcom_tee_arg u[]);
+static int update_args(struct qcom_tee_arg u[], struct qcom_tee_object_invoke_ctx *oic);
+static int prepare_args(struct qcom_tee_object_invoke_ctx *oic);
+static int update_msg(struct qcom_tee_object_invoke_ctx *oic);
+
+static int next_arg_type(struct qcom_tee_arg u[], int i, enum qcom_tee_arg_type type)
+{
+	while (u[i].type != QCOM_TEE_ARG_TYPE_END && u[i].type != type)
+		i++;
+
+	return i;
+}
+
+/**
+ * args_for_each_type - Iterate over argument of given type.
+ * @i: index in @args.
+ * @args: array of arguments.
+ * @at: type of argument.
+ */
+#define args_for_each_type(i, args, at) \
+	for (i = 0, i = next_arg_type(args, i, at); \
+		args[i].type != QCOM_TEE_ARG_TYPE_END; i = next_arg_type(args, ++i, at))
+
+#define arg_for_each_input_buffer(i, args)  args_for_each_type(i, args, QCOM_TEE_ARG_TYPE_IB)
+#define arg_for_each_output_buffer(i, args) args_for_each_type(i, args, QCOM_TEE_ARG_TYPE_OB)
+#define arg_for_each_input_object(i, args)  args_for_each_type(i, args, QCOM_TEE_ARG_TYPE_IO)
+#define arg_for_each_output_object(i, args) args_for_each_type(i, args, QCOM_TEE_ARG_TYPE_OO)
+
+/* Outside this file we use struct qcom_tee_object to identify an object. */
+
+/* We only allocate IDs with QCOM_TEE_OBJ_NS_BIT set in range
+ * [QCOM_TEE_OBJECT_ID_START .. QCOM_TEE_OBJECT_ID_END]. qcom_tee_object
+ * represents non-secure object. The first ID with QCOM_TEE_OBJ_NS_BIT set is reserved
+ * for primordial object.
+ */
+
+#define QCOM_TEE_OBJECT_PRIMORDIAL	(QCOM_TEE_OBJ_NS_BIT)
+#define QCOM_TEE_OBJECT_ID_START	(QCOM_TEE_OBJECT_PRIMORDIAL + 1)
+#define QCOM_TEE_OBJECT_ID_END		(UINT_MAX)
+
+#define SET_QCOM_TEE_OBJECT(p, type, ...) __SET_QCOM_TEE_OBJECT(p, type, ##__VA_ARGS__, 0UL)
+#define __SET_QCOM_TEE_OBJECT(p, type, optr, ...) do { \
+		(p)->object_type = (type); \
+		(p)->info.object_ptr = (unsigned long)(optr); \
+		(p)->release = NULL; \
+	} while (0)
+
+/* ''TEE Object Table''. */
+static DEFINE_XARRAY_ALLOC(xa_qcom_tee_objects);
+
+struct qcom_tee_object *allocate_qcom_tee_object(void)
+{
+	struct qcom_tee_object *object;
+
+	object = kzalloc(sizeof(*object), GFP_KERNEL);
+	if (object)
+		SET_QCOM_TEE_OBJECT(object, QCOM_TEE_OBJECT_TYPE_NULL);
+
+	return object;
+}
+EXPORT_SYMBOL_GPL(allocate_qcom_tee_object);
+
+void free_qcom_tee_object(struct qcom_tee_object *object)
+{
+	kfree(object);
+}
+EXPORT_SYMBOL_GPL(free_qcom_tee_object);
+
+/* 'get_qcom_tee_object' and 'put_qcom_tee_object'. */
+
+static int __free_qcom_tee_object(struct qcom_tee_object *object);
+static void ____destroy_qcom_tee_object(struct kref *refcount)
+{
+	struct qcom_tee_object *object = container_of(refcount, struct qcom_tee_object, refcount);
+
+	__free_qcom_tee_object(object);
+}
+
+int get_qcom_tee_object(struct qcom_tee_object *object)
+{
+	if (object != NULL_QCOM_TEE_OBJECT &&
+		object != ROOT_QCOM_TEE_OBJECT)
+		return kref_get_unless_zero(&object->refcount);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(get_qcom_tee_object);
+
+static struct qcom_tee_object *qcom_tee__get_qcom_tee_object(unsigned int object_id)
+{
+	XA_STATE(xas, &xa_qcom_tee_objects, object_id);
+	struct qcom_tee_object *object;
+
+	rcu_read_lock();
+	do {
+		object = xas_load(&xas);
+		if (xa_is_zero(object))
+			object = NULL_QCOM_TEE_OBJECT;
+
+	} while (xas_retry(&xas, object));
+
+	/* Sure object still exists. */
+	if (!get_qcom_tee_object(object))
+		object = NULL_QCOM_TEE_OBJECT;
+
+	rcu_read_unlock();
+
+	return object;
+}
+
+struct qcom_tee_object *qcom_tee_get_qcom_tee_object(unsigned int object_id)
+{
+	switch (object_id) {
+	case QCOM_TEE_OBJECT_PRIMORDIAL:
+		return &static_qcom_tee_object_primordial;
+
+	default:
+		return qcom_tee__get_qcom_tee_object(object_id);
+	}
+}
+
+void put_qcom_tee_object(struct qcom_tee_object *object)
+{
+	if (object != &static_qcom_tee_object_primordial &&
+		object != NULL_QCOM_TEE_OBJECT &&
+		object != ROOT_QCOM_TEE_OBJECT)
+		kref_put(&object->refcount, ____destroy_qcom_tee_object);
+}
+EXPORT_SYMBOL_GPL(put_qcom_tee_object);
+
+/* 'alloc_qcom_tee_object_id' and 'erase_qcom_tee_object'. */
+
+static int alloc_qcom_tee_object_id(struct qcom_tee_object *object, u32 *idx)
+{
+	static u32 xa_last_id = QCOM_TEE_OBJECT_ID_START;
+
+	/* Every ID allocated here, will have 'QCOM_TEE_OBJ_NS_BIT' set. */
+	return xa_alloc_cyclic(&xa_qcom_tee_objects, idx, object,
+		XA_LIMIT(QCOM_TEE_OBJECT_ID_START, QCOM_TEE_OBJECT_ID_END),
+			&xa_last_id, GFP_KERNEL);
+}
+
+struct qcom_tee_object *erase_qcom_tee_object(u32 idx)
+{
+	return xa_erase(&xa_qcom_tee_objects, idx);
+}
+
+static int __free_qcom_tee_object(struct qcom_tee_object *object)
+{
+	if (object->release)
+		object->release(object);
+
+	synchronize_rcu();
+
+	switch (typeof_qcom_tee_object(object)) {
+	case QCOM_TEE_OBJECT_TYPE_USER:
+		release_user_object(object);
+
+		break;
+	case QCOM_TEE_OBJECT_TYPE_CB_OBJECT: {
+		/* Keep the name in case 'release' needs it! */
+		const char *name = object->name;
+
+		if (object->ops->release)
+			object->ops->release(object);
+
+		kfree_const(name);
+		break;
+	}
+	case QCOM_TEE_OBJECT_TYPE_ROOT:
+	case QCOM_TEE_OBJECT_TYPE_NULL:
+	default:
+
+		break;
+	}
+
+	return 0;
+}
+
+/**
+ * qcom_tee_object_type - Returns type of object represented by a TEE handle.
+ * @object_id: a TEE handle for the object.
+ *
+ * This is similar to typeof_qcom_tee_object but instead of receiving object
+ * as argument it receives TEE object handle. It is used internally on return path
+ * from TEE.
+ */
+static enum qcom_tee_object_type qcom_tee_object_type(unsigned int object_id)
+{
+	if (object_id == QCOM_TEE_OBJ_NULL)
+		return QCOM_TEE_OBJECT_TYPE_NULL;
+
+	if (object_id & QCOM_TEE_OBJ_NS_BIT)
+		return QCOM_TEE_OBJECT_TYPE_CB_OBJECT;
+
+	return QCOM_TEE_OBJECT_TYPE_USER;
+}
+
+/**
+ * init_qcom_tee_object_user - Initialize an instance of qcom_tee_object.
+ * @object: object to initialize.
+ * @ot: type of object.
+ * @ops: instance of callbacks.
+ * @fmt: name assigned to the object.
+ *
+ * Return: On error, -EINVAL if the arguments are invalid.
+ * On success, return zero.
+ */
+int init_qcom_tee_object_user(struct qcom_tee_object *object, enum qcom_tee_object_type ot,
+	struct qcom_tee_object_operations *ops, const char *fmt, ...)
+{
+	int ret;
+	va_list ap;
+
+	kref_init(&object->refcount);
+	SET_QCOM_TEE_OBJECT(object, QCOM_TEE_OBJECT_TYPE_NULL);
+
+	/* **/
+	/* init_qcom_tee_object_user only initializes'qcom_tee_object. The object_id
+	 * allocation is postponed to get_object_id. We want to use different
+	 * IDs so user can decide to share a qcom_tee_object.
+	 *
+	 **/
+
+	va_start(ap, fmt);
+	switch (ot) {
+	case QCOM_TEE_OBJECT_TYPE_NULL:
+
+		ret = 0;
+		break;
+	case QCOM_TEE_OBJECT_TYPE_CB_OBJECT:
+	case QCOM_TEE_OBJECT_TYPE_ROOT:
+		object->ops = ops;
+		if (!object->ops->dispatch)
+			return -EINVAL;
+
+		object->name = kvasprintf_const(GFP_KERNEL, fmt, ap);
+		if (!object->name)
+			return -ENOMEM;
+
+		SET_QCOM_TEE_OBJECT(object, QCOM_TEE_OBJECT_TYPE_CB_OBJECT);
+
+		if (ot == QCOM_TEE_OBJECT_TYPE_ROOT) {
+			object->release = primordial_object_release;
+
+			/* Finally, REGISTER it. */
+			primordial_object_register(object);
+		}
+
+		ret = 0;
+		break;
+	case QCOM_TEE_OBJECT_TYPE_USER:
+	default:
+		ret = -EINVAL;
+	}
+	va_end(ap);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(init_qcom_tee_object_user);
+
+/* init_qcom_tee_object is to be consumed internally on return path from TEE. */
+static int init_qcom_tee_object(struct qcom_tee_object **object, unsigned int object_id)
+{
+	int ret;
+
+	switch (qcom_tee_object_type(object_id)) {
+	case QCOM_TEE_OBJECT_TYPE_NULL:
+
+		/* Should we receive ''QCOM_TEE_OBJECT_TYPE_NULL'' from TEE!? Why not. **/
+		*object = NULL_QCOM_TEE_OBJECT;
+
+		ret = 0;
+		break;
+	case QCOM_TEE_OBJECT_TYPE_CB_OBJECT: {
+		struct qcom_tee_object *t_object = qcom_tee_get_qcom_tee_object(object_id);
+
+		if (t_object != NULL_QCOM_TEE_OBJECT) {
+			*object = t_object;
+
+			ret = 0;
+		} else {
+			ret = -EINVAL;
+		}
+
+		break;
+	}
+	case QCOM_TEE_OBJECT_TYPE_USER: {
+		struct qcom_tee_object *t_object = allocate_qcom_tee_object();
+
+		if (t_object) {
+			kref_init(&t_object->refcount);
+
+			/* "noname"; it is not really a reason to fail here!. */
+			t_object->name = kasprintf(GFP_KERNEL, "qcom_tee-%u", object_id);
+
+			SET_QCOM_TEE_OBJECT(t_object, QCOM_TEE_OBJECT_TYPE_USER, object_id);
+
+			*object = t_object;
+
+			ret = 0;
+		} else {
+			ret = -ENOMEM;
+		}
+
+		break;
+	}
+	default: /* Err. SHOULD NEVER GET HERE! **/
+		ret = 0;
+
+		break;
+	}
+
+	if (ret)
+		*object = NULL_QCOM_TEE_OBJECT;
+
+	return ret;
+}
+
+/**
+ * get_object_id - Allocates a TEE handler 'object_id' for an object.
+ * @object: object to allocate a TEE handle.
+ * @object_id: TEE handle allocated.
+ *
+ * It is to be consumed internally on direct path to TEE. Unlike init_qcom_tee_object,
+ * get_object_id does not increase the object's reference counter, i.e. the client
+ * should do that.
+ */
+int get_object_id(struct qcom_tee_object *object, unsigned int *object_id)
+{
+	int ret;
+
+	switch (typeof_qcom_tee_object(object)) {
+	case QCOM_TEE_OBJECT_TYPE_CB_OBJECT: {
+		u32 idx;
+
+		ret = alloc_qcom_tee_object_id(object, &idx);
+		if (ret < 0)
+			goto out;
+
+		*object_id = idx;
+
+		ret = 0;
+	}
+
+		break;
+	case QCOM_TEE_OBJECT_TYPE_USER:
+		*object_id = object->info.object_ptr;
+
+		ret = 0;
+		break;
+	case QCOM_TEE_OBJECT_TYPE_NULL:
+		*object_id = QCOM_TEE_OBJ_NULL;
+
+		ret = 0;
+		break;
+	case QCOM_TEE_OBJECT_TYPE_ROOT:
+		*object_id = QCOM_TEE_OBJ_ROOT;
+
+		ret = 0;
+		break;
+	default:
+		return -EBADF;
+	}
+
+out:
+
+	return ret;
+}
+
+/* Release TEE handle allocated in get_object_id. */
+void __put_object_id(unsigned int object_id)
+{
+	erase_qcom_tee_object(object_id);
+}
+
+/* Context management API */
+
+/* 'shmem_alloc',
+ * 'qcom_tee_object_invoke_ctx_init', and
+ * 'qcom_tee_object_invoke_ctx_uninit'.
+ */
+
+#define OUT_BUFFER_SIZE SZ_32K
+
+/* ''Context ID Allocator''. */
+static DEFINE_IDA(qcom_tee_object_invoke_ctxs_ida);
+
+static int shmem_alloc(struct qcom_tee_object_invoke_ctx *oic, struct qcom_tee_arg u[])
+{
+	int i;
+
+	/* See 'prepare_msg'. Calculate size of inbound message. */
+
+	size_t size = OFFSET_TO_BUFFER_ARGS((struct qcom_tee_object_invoke *)(0), size_of_arg(u));
+
+	arg_for_each_input_buffer(i, u)
+		size = align_offset(u[i].b.size + size);
+
+	arg_for_each_output_buffer(i, u)
+		size = align_offset(u[i].b.size + size);
+
+	/* TEE requires both input and output buffer
+	 *   (1) to be PAGE_SIZE aligned and
+	 *   (2) to be multiple of PAGE_SIZE.
+	 */
+
+	size = PAGE_ALIGN(size);
+
+	/* TODO. Allocate memory using tzmem allocator. */
+
+	/* TEE assume unused buffers are zeroed; Do it now! */
+	memset(oic->in.msg.addr, 0, oic->in.msg.size);
+	memset(oic->out.msg.addr, 0, oic->out.msg.size);
+
+	return 0;
+}
+
+static int qcom_tee_object_invoke_ctx_init(struct qcom_tee_object_invoke_ctx *oic,
+	struct qcom_tee_arg u[])
+{
+	memset(oic, 0, sizeof(*oic));
+
+	/* First check if we can allocate an ID, then initialize it. */
+	/* Context IDs [0 .. 10) are never used. */
+
+	oic->context_id = ida_alloc_min(&qcom_tee_object_invoke_ctxs_ida, 10, GFP_KERNEL);
+	if (oic->context_id < 0) {
+		pr_err("unable to allocate context ID (%d)\n", oic->context_id);
+
+		return oic->context_id;
+	}
+
+	if (shmem_alloc(oic, u)) {
+		ida_free(&qcom_tee_object_invoke_ctxs_ida, oic->context_id);
+
+		return -ENOMEM;
+	}
+
+	return 0;
+}
+
+static void qcom_tee_object_invoke_ctx_uninit(struct qcom_tee_object_invoke_ctx *oic)
+{
+	ida_free(&qcom_tee_object_invoke_ctxs_ida, oic->context_id);
+
+	/* TODO. Release memory using tzmem allocator. */
+}
+
+/* For X_msg functions, on failure we do the cleanup. Because, we could not
+ * construct a message to send so the caller remains the owner of the objects.
+ * For X_args functions, on failure wo do ''not'' do a cleanup. Because,
+ * we received the message and receiver should be the new owner to cleanup.
+ */
+
+static int prepare_msg(struct qcom_tee_object_invoke_ctx *oic,
+	struct qcom_tee_object *object, unsigned long op, struct qcom_tee_arg u[])
+{
+	int i, ib = 0, ob = 0, io = 0, oo = 0;
+
+	unsigned int object_id;
+
+	/* Use input message buffer in 'oic'. */
+
+	struct qcom_tee_object_invoke *msg = (struct qcom_tee_object_invoke *)oic->in.msg.addr;
+	size_t msg_size = oic->in.msg.size;
+
+	/* Start offset in a message for buffer argument. */
+	unsigned int offset = OFFSET_TO_BUFFER_ARGS(msg, size_of_arg(u));
+
+	if (get_object_id(object, &object_id))
+		return -ENOSPC;
+
+	arg_for_each_input_buffer(i, u) {
+		msg->args[ib].b.offset = offset;
+		msg->args[ib].b.size = u[i].b.size;
+		if (!arg_in_bounds(&msg->args[ib], msg_size))
+			return -ENOMEM;
+
+		memcpy(OFFSET_TO_PTR(msg, offset), u[i].b.addr, u[i].b.size);
+
+		offset = align_offset(u[i].b.size + offset);
+		ib++;
+	}
+
+	ob = ib;
+	arg_for_each_output_buffer(i, u) {
+		msg->args[ob].b.offset = offset;
+		msg->args[ob].b.size = u[i].b.size;
+		if (!arg_in_bounds(&msg->args[ob], msg_size))
+			return -ENOMEM;
+
+		offset = align_offset(u[i].b.size + offset);
+		ob++;
+	}
+
+	io = ob;
+	arg_for_each_input_object(i, u) {
+		if (get_object_id(u[i].o, &msg->args[io].o)) {
+
+			/* Unable to get_object_id; put whatever we got. */
+			__put_object_id(object_id);
+			for (--io; io >= ob; io--)
+				__put_object_id(msg->args[io].o);
+
+			return -ENOSPC;
+		}
+
+		io++;
+	}
+
+	oo = io;
+	arg_for_each_output_object(i, u)
+		oo++;
+
+	/* Set object, operation, and argument counts. */
+	init_oi_msg(msg, object_id, op, ib, ob, io, oo);
+
+	return 0;
+}
+
+static int update_args(struct qcom_tee_arg u[], struct qcom_tee_object_invoke_ctx *oic)
+{
+	int ret = 0;
+
+	int i, ib = 0, ob = 0, io = 0, oo = 0;
+
+	/* Use input message buffer in 'oic'. */
+
+	struct qcom_tee_object_invoke *msg = (struct qcom_tee_object_invoke *)oic->in.msg.addr;
+
+	arg_for_each_input_buffer(i, u)
+		ib++;
+
+	ob = ib;
+	arg_for_each_output_buffer(i, u) {
+
+		memcpy(u[i].b.addr, OFFSET_TO_PTR(msg, msg->args[ob].b.offset),
+			msg->args[ob].b.size);
+
+		u[i].b.size = msg->args[ob].b.size;
+		ob++;
+	}
+
+	io = ob;
+	arg_for_each_input_object(i, u)
+		io++;
+
+	oo = io;
+	arg_for_each_output_object(i, u) {
+		int err;
+
+		/* **/
+		/* If init_qcom_tee_object returns error (e.g. requested handle is invalid or
+		 * init_qcom_tee_object is unable to allocate qcom_tee_object), we continue to
+		 * process arguments. It is necessary so that latter we can issue the RELEASE.
+		 *
+		 * If init_qcom_tee_object failed to allocated the qcom_tee_object, we could not
+		 * release that object.
+		 *
+		 **/
+
+		err = init_qcom_tee_object(&u[i].o, msg->args[oo].o);
+		if (err)
+			ret = err;
+
+		oo++;
+	}
+
+	return ret;
+}
+
+static int prepare_args(struct qcom_tee_object_invoke_ctx *oic)
+{
+	int i, ret = 0;
+
+	/* Use output message buffer in 'oic'. */
+
+	struct qcom_tee_callback *msg = (struct qcom_tee_callback *)oic->out.msg.addr;
+
+	/* We assume TEE already checked the buffer boundaries! */
+
+	for_each_input_buffer(i, msg->counts) {
+		oic->u[i].b.addr = OFFSET_TO_PTR(msg, msg->args[i].b.offset);
+		oic->u[i].b.size = msg->args[i].b.size;
+		oic->u[i].type = QCOM_TEE_ARG_TYPE_IB;
+	}
+
+	for_each_output_buffer(i, msg->counts) {
+		oic->u[i].b.addr = OFFSET_TO_PTR(msg, msg->args[i].b.offset);
+		oic->u[i].b.size = msg->args[i].b.size;
+		oic->u[i].type = QCOM_TEE_ARG_TYPE_OB;
+	}
+
+	for_each_input_object(i, msg->counts) {
+		int err;
+
+		/* See comments for for_each_output_object in update_args. **/
+
+		err = init_qcom_tee_object(&oic->u[i].o, msg->args[i].o);
+		if (err)
+			ret = err;
+
+		oic->u[i].type = QCOM_TEE_ARG_TYPE_IO;
+	}
+
+	for_each_output_object(i, msg->counts)
+		oic->u[i].type = QCOM_TEE_ARG_TYPE_OO;
+
+	/* End of Arguments. */
+	oic->u[i].type = QCOM_TEE_ARG_TYPE_END;
+
+	return ret;
+}
+
+static int update_msg(struct qcom_tee_object_invoke_ctx *oic)
+{
+	int i, ib = 0, ob = 0, io = 0, oo = 0;
+
+	/* Use output message buffer in 'oic'. */
+
+	struct qcom_tee_callback *msg = (struct qcom_tee_callback *)oic->out.msg.addr;
+
+	arg_for_each_input_buffer(i, oic->u)
+		ib++;
+
+	ob = ib;
+	arg_for_each_output_buffer(i, oic->u) {
+		/* Only reduce size of client requested that; never increase it. */
+		if (msg->args[ob].b.size < oic->u[i].b.size)
+			return -EINVAL;
+
+		msg->args[ob].b.size = oic->u[i].b.size;
+
+		ob++;
+	}
+
+	io = ob;
+	arg_for_each_input_object(i, oic->u)
+		io++;
+
+	oo = io;
+	arg_for_each_output_object(i, oic->u) {
+		if (get_object_id(oic->u[i].o, &msg->args[oo].o)) {
+			/* Unable to get_object_id; put whatever we got. */
+			for (--oo; oo >= io; --oo)
+				__put_object_id(msg->args[oo].o);
+
+			return -ENOSPC;
+		}
+
+		oo++;
+	}
+
+	return 0;
+}
+
+/* Invoke an 'qcom_tee_object' instance. */
+
+static void qcom_tee_object_invoke(struct qcom_tee_object_invoke_ctx *oic,
+	struct qcom_tee_callback *msg)
+{
+	int i, errno;
+
+	/* Get object being invoked!!! */
+	unsigned int object_id = msg->cxt;
+	struct qcom_tee_object *object;
+
+	/* TEE can not invoke NULL object or objects it hosts. */
+	if (qcom_tee_object_type(object_id) == QCOM_TEE_OBJECT_TYPE_NULL ||
+		qcom_tee_object_type(object_id) == QCOM_TEE_OBJECT_TYPE_USER) {
+		errno = -EINVAL;
+
+		goto out;
+	}
+
+	object = qcom_tee_get_qcom_tee_object(object_id);
+	if (object == NULL_QCOM_TEE_OBJECT) {
+		errno = -EINVAL;
+
+		goto out;
+	}
+
+	oic->object = object;
+
+	switch (QCOM_TEE_OBJECT_OP_METHOD_ID(msg->op)) {
+	case QCOM_TEE_OBJECT_OP_RELEASE:
+
+		/* Remove the object from xa_qcom_tee_objects so that the object_id
+		 * becomes invalid for further use. However, call put_qcom_tee_object
+		 * to schedule the actual release if there is no user.
+		 */
+
+		erase_qcom_tee_object(object_id);
+		put_qcom_tee_object(object);
+		errno = 0;
+
+		break;
+	case QCOM_TEE_OBJECT_OP_RETAIN:
+		get_qcom_tee_object(object);
+		errno = 0;
+
+		break;
+	default:
+
+		/* Check if the operation is supported before going forward. */
+		if (object->ops->op_supported) {
+			if (object->ops->op_supported(msg->op)) {
+				errno = -EINVAL;
+
+				break;
+			}
+		}
+
+		errno = prepare_args(oic);
+		if (errno) {
+			/* Unable to parse the message. Release any object arrived as input. */
+			arg_for_each_input_buffer(i, oic->u)
+				put_qcom_tee_object(oic->u[i].o);
+
+			break;
+		}
+
+		errno = object->ops->dispatch(oic->context_id,
+			/* .dispatch(Object, Operation, Arguments). */
+			object, msg->op, oic->u);
+
+		if (!errno) {
+			/* On SUCCESS, notify object at appropriate time. */
+			oic->flags |= OIC_FLAG_NOTIFY;
+		}
+	}
+
+	switch (errno) {
+	case 0:
+
+		break;
+
+	case -ERESTARTSYS:
+	case -ERESTARTNOINTR:
+	case -ERESTARTNOHAND:
+	case -ERESTART_RESTARTBLOCK:
+
+		/* There's no easy way to restart the syscall that end up in callback
+		 * object invocation. Just fail the call with EINTR.
+		 */
+
+		/* We do not do any cleanup for input objects. */
+
+		errno = -EINTR;
+
+		fallthrough;
+	default:
+
+		/* On error, dispatcher should do the cleanup. */
+
+		break;
+	}
+
+out:
+
+	oic->errno = errno;
+}
+
+/**
+ * qcom_tee_object_do_invoke - Submit an invocation for qcom_tee_object_invoke_ctx.
+ * @oic: context to use for current invocation.
+ * @object: object being invoked.
+ * @op: requested operation on @object.
+ * @u: array of argument for the current invocation.
+ * @result: result returned from TEE.
+ *
+ * The caller is responsible to keep track of the refcount for each object,
+ * including @object. On return (success or failure), the caller loses the
+ * ownership of all input object of type QCOM_TEE_OBJECT_TYPE_CB_OBJECT.
+ *
+ * Return: On success return 0. On failure returns -EINVAL if unable to parse the
+ * request or response. It returns -ENODEV if it can not communicate with TEE, or
+ * -EAGAIN if it can not communicate with TEE but it is safe for the caller to
+ * retry the call (after getting IO again as they are put on return). It returns
+ * -ENOMEM if memory could not be allocated, or -ENOSPC if there is not free
+ * context ID or TEE handler.
+ */
+int qcom_tee_object_do_invoke(struct qcom_tee_object_invoke_ctx *oic,
+	struct qcom_tee_object *object, unsigned long op, struct qcom_tee_arg u[], int *result)
+{
+	int i, ret, errno;
+	unsigned int data;
+	u64 response_type;
+
+	struct qcom_tee_callback *cb_msg;
+
+	if (typeof_qcom_tee_object(object) != QCOM_TEE_OBJECT_TYPE_USER &&
+		typeof_qcom_tee_object(object) != QCOM_TEE_OBJECT_TYPE_ROOT)
+		return -EINVAL;
+
+	ret = qcom_tee_object_invoke_ctx_init(oic, u);
+	if (ret)
+		return ret;
+
+	ret = prepare_msg(oic, object, op, u);
+	if (ret)
+		goto out;
+
+	/* INVOKE remote object!! */
+
+	cb_msg = (struct qcom_tee_callback *)oic->out.msg.addr;
+
+	while (1) {
+		if (oic->flags & OIC_FLAG_BUSY) {
+			errno = oic->errno;
+
+			/* Update output buffer only if result is SUCCESS. */
+			if (!errno)
+				errno = update_msg(oic);
+
+			err_to_qcom_tee_err(cb_msg, errno);
+		}
+
+		ret = qcom_tee_object_invoke_ctx_invoke(oic, result, &response_type, &data);
+
+		if (oic->flags & OIC_FLAG_BUSY) {
+			struct qcom_tee_object *oic_object = oic->object;
+
+			/* A busy 'oic' can have a NULL_QCOM_TEE_OBJECT object if
+			 * qcom_tee_object_invoke fails, internally.
+			 */
+
+			if (oic_object) {
+				if (oic->flags & OIC_FLAG_NOTIFY) {
+					if (oic_object->ops->notify)
+						oic_object->ops->notify(oic->context_id,
+							oic_object, (errno | ret));
+				}
+
+				put_qcom_tee_object(oic_object);
+			}
+
+			/* 'oic' is done. Cleanup. */
+			oic->object = NULL_QCOM_TEE_OBJECT;
+			oic->flags &= ~(OIC_FLAG_BUSY | OIC_FLAG_NOTIFY);
+		}
+
+		if (ret) {
+			/* We can not recover from this. */
+
+			if (!(oic->flags & OIC_FLAG_QCOM_TEE)) {
+				/* So TEE is unaawre of this. */
+				/* QCOM_TEE_OBJECT_TYPE_CB_OBJECT input objects are orphan. */
+				arg_for_each_input_object(i, u)
+					if (typeof_qcom_tee_object(u[i].o) ==
+						QCOM_TEE_OBJECT_TYPE_CB_OBJECT)
+						put_qcom_tee_object(u[i].o);
+
+				ret = -EAGAIN;
+
+			} else {
+				/* So TEE is aware of this. */
+				/* On error, there is no clean way to clean up. */
+				ret = -ENODEV;
+			}
+
+			goto out;
+
+		} else {
+			/* TEE obtained the ownership of QCOM_TEE_OBJECT_TYPE_CB_OBJECT
+			 * input objects in 'u'. On further failure, TEE is responsible
+			 * to release them.
+			 */
+
+			oic->flags |= OIC_FLAG_QCOM_TEE;
+		}
+
+		/* Is it a callback request?! */
+		if (response_type != QCOM_TEE_RESULT_INBOUND_REQ_NEEDED) {
+			if (!*result) {
+				ret = update_args(u, oic);
+				if (ret) {
+					arg_for_each_output_object(i, u)
+						put_qcom_tee_object(u[i].o);
+				}
+			}
+
+			break;
+
+		} else {
+			oic->flags |= OIC_FLAG_BUSY;
+
+			/* Before dispatching the request, handle any pending async requests. */
+			__fetch__async_reqs(oic);
+
+			qcom_tee_object_invoke(oic, cb_msg);
+		}
+	}
+
+	__fetch__async_reqs(oic);
+
+out:
+	qcom_tee_object_invoke_ctx_uninit(oic);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(qcom_tee_object_do_invoke);
+
+/* Primordial Object. */
+/* It is invoked by TEE for kernel services. */
+
+static struct qcom_tee_object *primordial_object = NULL_QCOM_TEE_OBJECT;
+static DEFINE_MUTEX(primordial_object_lock);
+
+static int primordial_object_register(struct qcom_tee_object *object)
+{
+	/* A primordial_object is a valid callback object. */
+	if (typeof_qcom_tee_object(object) != QCOM_TEE_OBJECT_TYPE_CB_OBJECT)
+		return -EINVAL;
+
+	/* Finally, REGISTER it. */
+
+	mutex_lock(&primordial_object_lock);
+	rcu_assign_pointer(primordial_object, object);
+	mutex_unlock(&primordial_object_lock);
+
+	return 0;
+}
+
+static void primordial_object_release(struct qcom_tee_object *object)
+{
+	mutex_lock(&primordial_object_lock);
+
+	/* Only reset 'primordial_object' if it points to this object. */
+	if (primordial_object == object)
+		rcu_assign_pointer(primordial_object, NULL_QCOM_TEE_OBJECT);
+
+	mutex_unlock(&primordial_object_lock);
+}
+
+static struct qcom_tee_object *get_primordial_object(void)
+{
+	struct qcom_tee_object *object;
+
+	rcu_read_lock();
+	object = rcu_dereference(primordial_object);
+
+	if (!get_qcom_tee_object(object))
+		object = NULL_QCOM_TEE_OBJECT;
+
+	rcu_read_unlock();
+
+	return object;
+}
+
+/* Static 'Primordial Object' operations. */
+
+static int op_sleep(struct qcom_tee_arg args[])
+{
+	if (size_of_arg(args) != 1 || args[0].type != QCOM_TEE_ARG_TYPE_IB)
+		return -EINVAL;
+
+	msleep(*(u32 *)(args[0].b.addr));
+
+	return 0;
+}
+
+static int do_primordial_object_dispatch(unsigned int context_id,
+	struct qcom_tee_object *primordial_object, unsigned long op, struct qcom_tee_arg args[])
+{
+	int i, ret = -EINVAL;
+
+	struct qcom_tee_object *object;
+
+	/* Static 'primordial_object': Unused here! */
+
+	switch (op) {
+	case OBJECT_OP_YIELD:
+		ret = 0;
+
+		break;
+	case OBJECT_OP_SLEEP:
+		ret = op_sleep(args);
+
+		break;
+	default:
+		object = get_primordial_object();
+
+		if (object) {
+			ret = object->ops->dispatch(context_id,
+				/* .dispatch(Object, Operation, Arguments). */
+				object, op, args);
+
+			put_qcom_tee_object(object);
+		} else {
+			pr_err("No primordial object registered.\n");
+
+			/* Release any object arrived as input. */
+			arg_for_each_input_object(i, args)
+				put_qcom_tee_object(args[i].o);
+		}
+	}
+
+	return ret;
+}
+
+static struct qcom_tee_object_operations primordial_ops = {
+	.dispatch = do_primordial_object_dispatch
+};
+
+static struct qcom_tee_object static_qcom_tee_object_primordial = {
+	.object_type = QCOM_TEE_OBJECT_TYPE_CB_OBJECT,
+	.ops = &primordial_ops
+};
+
+/* Dump TEE object table. */
+static ssize_t ot_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf)
+{
+	struct qcom_tee_object *object;
+	unsigned long idx;
+	size_t len = 0;
+
+	rcu_read_lock();
+	xa_for_each_start(&xa_qcom_tee_objects, idx, object, QCOM_TEE_OBJECT_ID_START) {
+		len += scnprintf(buf + len, PAGE_SIZE - len, "%lx %4d %s\n",
+			idx, kref_read(&object->refcount), qcom_tee_object_name(object));
+	}
+	rcu_read_unlock();
+
+	return len;
+}
+
+/* Info for registered primordial object. */
+static ssize_t po_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf)
+{
+	struct qcom_tee_object *object = get_primordial_object();
+	size_t len = 0;
+
+	if (object) {
+		len = scnprintf(buf, PAGE_SIZE, "%s %d\n",
+			/* minus one for the above 'get_primordial_object'. */
+			qcom_tee_object_name(object), kref_read(&object->refcount) - 1);
+		put_qcom_tee_object(object);
+	}
+
+	return len;
+}
+
+static struct kobj_attribute ot = __ATTR_RO(ot);
+static struct kobj_attribute po = __ATTR_RO(po);
+static struct kobj_attribute release = __ATTR_RO(release);
+static struct attribute *attrs[] = {
+	&ot.attr,
+	&po.attr,
+	&release.attr,
+	NULL
+};
+
+static struct attribute_group attr_group = {
+	.attrs = attrs,
+};
+
+static struct kobject *qcom_object_invoke_kobj;
+static int __init qcom_object_invoke_init(void)
+{
+	int ret;
+
+	ret = init_release_wq();
+	if (ret)
+		return ret;
+
+	/* Create '/sys/kernel/qcom_object_invoke'. */
+	qcom_object_invoke_kobj = kobject_create_and_add("qcom_object_invoke", kernel_kobj);
+	if (!qcom_object_invoke_kobj) {
+		destroy_release_wq();
+
+		return -ENOMEM;
+	}
+
+	ret = sysfs_create_group(qcom_object_invoke_kobj, &attr_group);
+	if (ret) {
+		kobject_put(qcom_object_invoke_kobj);
+		destroy_release_wq();
+	}
+
+	return ret;
+}
+
+static void __exit qcom_object_invoke_exit(void)
+{
+	/* TODO. Cleanup?!. */
+
+	sysfs_remove_group(qcom_object_invoke_kobj, &attr_group);
+
+	kobject_put(qcom_object_invoke_kobj);
+}
+
+module_init(qcom_object_invoke_init);
+module_exit(qcom_object_invoke_exit);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("SI CORE driver");
diff --git a/drivers/firmware/qcom/qcom_object_invoke/core.h b/drivers/firmware/qcom/qcom_object_invoke/core.h
new file mode 100644
index 000000000000..885cb2964680
--- /dev/null
+++ b/drivers/firmware/qcom/qcom_object_invoke/core.h
@@ -0,0 +1,186 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef __QCOM_OBJECT_INVOKE_CORE_H
+#define __QCOM_OBJECT_INVOKE_CORE_H
+
+#include <linux/kobject.h>
+#include <linux/firmware/qcom/qcom_object_invoke.h>
+
+#undef pr_fmt
+#define pr_fmt(fmt) "qcom-object-invoke: %s: " fmt, __func__
+
+/* get_object_id allocates a TEE handler 'object_id' for an object. */
+/* __put_object_id erases the TEE handler. */
+
+int get_object_id(struct qcom_tee_object *object, unsigned int *object_id);
+void __put_object_id(unsigned int object_id);
+
+/* qcom_tee_get_qcom_tee_object returns object for a TEE handler and increase the refcount. */
+struct qcom_tee_object *qcom_tee_get_qcom_tee_object(unsigned int object_id);
+
+/* erase_qcom_tee_object invalidates a TEE handler and returns respective object. */
+struct qcom_tee_object *erase_qcom_tee_object(u32 idx);
+
+/* qcom_tee_object_invoke_ctx_invoke is the interface to SCM. */
+int qcom_tee_object_invoke_ctx_invoke(struct qcom_tee_object_invoke_ctx *oic,
+	int *result, u64 *response_type, unsigned int *data);
+
+/* Object Release APIs. */
+
+int init_release_wq(void);
+void destroy_release_wq(void);
+void release_user_object(struct qcom_tee_object *object);
+ssize_t release_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf);
+
+/* ASYNC message management APIs. */
+
+void __fetch__async_reqs(struct qcom_tee_object_invoke_ctx *oic);
+
+/* ''Qualcomm TEE'' related definitions. */
+
+#define QCOM_TEE_RESULT_INBOUND_REQ_NEEDED 3
+
+#define QCOM_TEE_OBJ_NULL (0U)
+#define QCOM_TEE_OBJ_ROOT (1U)
+
+/* If this bit is set in a TEE handler, it represents an object in non-secure world. */
+#define QCOM_TEE_OBJ_NS_BIT BIT(31)
+
+#define align_offset(o) PTR_ALIGN((o), 8U)
+
+/* Definitions from TEE as part of the transport protocol. */
+
+/* qcom_tee_msg_arg - arguments as recognized by TEE. */
+union qcom_tee_msg_arg {
+	struct {
+		u32 offset;
+		u32 size;
+	} b;
+	u32 o;
+};
+
+/* struct qcom_tee_object_invoke - header for direct object invocation message. */
+struct qcom_tee_object_invoke {
+	u32 cxt;
+	u32 op;
+	u32 counts;
+	union qcom_tee_msg_arg args[];
+};
+
+/* struct qcom_tee_callback - header for callback request from TEE. */
+struct qcom_tee_callback {
+	u32 result;
+	u32 cxt;
+	u32 op;
+	u32 counts;
+	union qcom_tee_msg_arg args[];
+};
+
+/* Check if a buffer argument 'arg' can fit in a message of size 'sz'. */
+#define arg_in_bounds(arg, sz) \
+	(((arg)->b.offset < (sz)) && ((arg)->b.size < ((sz) - (arg)->b.offset)))
+
+#define OFFSET_TO_PTR(m, off) ((void *)&((char *)(m))[(off)])
+
+/* Offset in the message for the beginning of buffer argument's contents. */
+#define OFFSET_TO_BUFFER_ARGS(m, n) \
+	align_offset(offsetof(typeof(*m), args) + ((n) * sizeof((m)->args[0])))
+
+#define counts_num__bi_(x) (((x) >> 0) & 0xFU)
+#define counts_num__bo_(x) (((x) >> 4) & 0xFU)
+#define counts_num__oi_(x) (((x) >> 8) & 0xFU)
+#define counts_num__oo_(x) (((x) >> 12) & 0xFU)
+
+#define counts_idx__bi_(x) 0U
+#define counts_idx__bo_(x) (counts_idx__bi_(x) + counts_num__bi_(x))
+#define counts_idx__oi_(x) (counts_idx__bo_(x) + counts_num__bo_(x))
+#define counts_idx__oo_(x) (counts_idx__oi_(x) + counts_num__oi_(x))
+#define counts_total(x) (counts_idx__oo_(x) + counts_num__oo_(x))
+
+#define FOR_ARGS(i, c, type) \
+	for (i = counts_idx##type(c); i < (counts_idx##type(c) + counts_num##type(c)); i++)
+
+#define for_each_input_buffer(i, c)  FOR_ARGS(i, c, __bi_)
+#define for_each_output_buffer(i, c) FOR_ARGS(i, c, __bo_)
+#define for_each_input_object(i, c)  FOR_ARGS(i, c, __oi_)
+#define for_each_output_object(i, c) FOR_ARGS(i, c, __oo_)
+
+static inline void init_oi_msg(struct qcom_tee_object_invoke *msg,
+	u32 cxt, u32 op, int ib, int ob, int io, int oo)
+{
+#define MSG_ARG_BI_SHIFT 0
+#define MSG_ARG_OB_SHIFT 4
+#define MSG_ARG_IO_SHIFT 8
+#define MSG_ARG_OO_SHIFT 12
+
+	u32 counts = 0;
+
+	counts |= ((oo - io) & 0xFU) << MSG_ARG_OO_SHIFT;	/* No. Output Objects. */
+	counts |= ((io - ob) & 0xFU) << MSG_ARG_IO_SHIFT;	/* No. Input Objects. */
+	counts |= ((ob - ib) & 0xFU) << MSG_ARG_OB_SHIFT;	/* No. Output Buffer. */
+	counts |= (ib & 0xFU) << MSG_ARG_BI_SHIFT;			/* No. Input Buffer. */
+
+	msg->cxt = cxt;
+	msg->op = op;
+	msg->counts = counts;
+}
+
+static inline void err_to_qcom_tee_err(struct qcom_tee_callback *cb_msg, int err)
+{
+/* Generic error codes */
+#define QCOM_OBJECT_INVIKE_OK				0	/* non-specific success code */
+#define QCOM_OBJECT_INVIKE_ERROR			1	/* non-specific error */
+#define QCOM_OBJECT_INVIKE_ERROR_INVALID	2	/* unsupported/unrecognized request */
+#define QCOM_OBJECT_INVIKE_ERROR_SIZE_IN	3	/* supplied buffer/string too large */
+#define QCOM_OBJECT_INVIKE_ERROR_SIZE_OUT	4	/* supplied output buffer too small */
+
+#define QCOM_OBJECT_INVIKE_ERROR_USERBASE	10	/* start of user-defined error range */
+
+/* Transport layer error codes */
+#define QCOM_OBJECT_INVIKE_ERROR_DEFUNCT	-90	/* object no longer exists */
+#define QCOM_OBJECT_INVIKE_ERROR_ABORT		-91	/* calling thread must exit */
+#define QCOM_OBJECT_INVIKE_ERROR_BADOBJ		-92	/* invalid object context */
+#define QCOM_OBJECT_INVIKE_ERROR_NOSLOTS	-93	/* caller's object table full */
+#define QCOM_OBJECT_INVIKE_ERROR_MAXARGS	-94	/* too many args */
+#define QCOM_OBJECT_INVIKE_ERROR_MAXDATA	-95	/* buffers too large */
+#define QCOM_OBJECT_INVIKE_ERROR_UNAVAIL	-96	/* the request could not be processed */
+#define QCOM_OBJECT_INVIKE_ERROR_KMEM		-97	/* kernel out of memory */
+#define QCOM_OBJECT_INVIKE_ERROR_REMOTE		-98	/* local method sent to remote object */
+#define QCOM_OBJECT_INVIKE_ERROR_BUSY		-99	/* Object is busy */
+#define QCOM_OBJECT_INVIKE_ERROR_TIMEOUT	-103	/* Call Back Object invocation timed out. */
+
+	switch (err) {
+	case 0:
+		cb_msg->result = QCOM_OBJECT_INVIKE_OK;
+
+		break;
+	case -ENOMEM:
+		cb_msg->result = QCOM_OBJECT_INVIKE_ERROR_KMEM;
+
+		break;
+	case -ENODEV:
+		cb_msg->result = QCOM_OBJECT_INVIKE_ERROR_DEFUNCT;
+
+		break;
+	case -ENOSPC:
+	case -EBUSY:
+		cb_msg->result = QCOM_OBJECT_INVIKE_ERROR_BUSY;
+
+		break;
+	case -EBADF:
+		cb_msg->result = QCOM_OBJECT_INVIKE_ERROR_UNAVAIL;
+
+		break;
+	case -EINVAL:
+		cb_msg->result = QCOM_OBJECT_INVIKE_ERROR_INVALID;
+
+		break;
+	default:
+		cb_msg->result = QCOM_OBJECT_INVIKE_ERROR;
+	}
+}
+
+#endif /* __QCOM_OBJECT_INVOKE_CORE_H */
diff --git a/drivers/firmware/qcom/qcom_object_invoke/qcom_scm_invoke.c b/drivers/firmware/qcom/qcom_object_invoke/qcom_scm_invoke.c
new file mode 100644
index 000000000000..2a9795da291b
--- /dev/null
+++ b/drivers/firmware/qcom/qcom_object_invoke/qcom_scm_invoke.c
@@ -0,0 +1,22 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <linux/firmware/qcom/qcom_scm.h>
+
+#include "core.h"
+
+int qcom_tee_object_invoke_ctx_invoke(struct qcom_tee_object_invoke_ctx *oic,
+	int *result, u64 *response_type, unsigned int *data)
+{
+	/* TODO. Buffers always coherent!? */
+
+	/* Direct invocation of callback!? */
+	if (!(oic->flags & OIC_FLAG_BUSY))
+		; /* TODO. Make smcinvoke. */
+	else
+		; /* TODO. Submit callback response. */
+
+	return 0;
+}
diff --git a/drivers/firmware/qcom/qcom_object_invoke/release_wq.c b/drivers/firmware/qcom/qcom_object_invoke/release_wq.c
new file mode 100644
index 000000000000..a01d3d03cfa4
--- /dev/null
+++ b/drivers/firmware/qcom/qcom_object_invoke/release_wq.c
@@ -0,0 +1,90 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <linux/slab.h>
+
+#include "core.h"
+
+static struct workqueue_struct *release_wq;
+
+/* Number of all release requests submitted. */
+static atomic_t pending_releases = ATOMIC_INIT(0);
+
+/* 'release_user_object' put object in release work queue.
+ * 'qcom_tee_object_do_release' make direct invocation to release an object.
+ * 'destroy_user_object' finished the release after TEE acknowledged it.
+ */
+
+static void destroy_user_object(struct work_struct *work);
+void release_user_object(struct qcom_tee_object *object)
+{
+	INIT_WORK(&object->work, destroy_user_object);
+
+	atomic_inc(&pending_releases);
+
+	/* QUEUE a release work. */
+	queue_work(release_wq, &object->work);
+}
+
+static void qcom_tee_object_do_release(struct qcom_tee_object *object)
+{
+	int ret, result;
+
+	static struct qcom_tee_object_invoke_ctx oic;
+	static struct qcom_tee_arg args[1] = { 0 };
+
+	ret = qcom_tee_object_do_invoke(&oic, object, QCOM_TEE_OBJECT_OP_RELEASE, args, &result);
+	if (ret == -EAGAIN) {
+		/* On failure, if no callback response is in progress. */
+
+		queue_work(release_wq, &object->work);
+	} else {
+		/* On failure, there are two scenarios:
+		 *  - ret != 0 while retuning a callback response.
+		 *  - ret == 0 and result != 0.
+		 * In any of these case, there is nothing we can do to cleanup.
+		 */
+
+		if (ret || result)
+			pr_err("release failed for %s (%d result = %x).\n",
+				qcom_tee_object_name(object), ret, result);
+
+		atomic_dec(&pending_releases);
+
+		kfree(object->name);
+		free_qcom_tee_object(object);
+	}
+}
+
+static void destroy_user_object(struct work_struct *work)
+{
+	struct qcom_tee_object *object = container_of(work, struct qcom_tee_object, work);
+
+	qcom_tee_object_do_release(object);
+}
+
+ssize_t release_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf)
+{
+	return scnprintf(buf, PAGE_SIZE, "%d\n", atomic_read(&pending_releases));
+}
+
+/* 'init_release_wq' and 'destroy_release_wq'. */
+
+int init_release_wq(void)
+{
+	release_wq = alloc_ordered_workqueue("qcom_object_invoke_release_wq", 0);
+	if (!release_wq) {
+		pr_err("failed to create qcom_object_invoke_release_wq.\n");
+
+		return -ENOMEM;
+	}
+
+	return 0;
+}
+
+void destroy_release_wq(void)
+{
+	destroy_workqueue(release_wq);
+}
diff --git a/include/linux/firmware/qcom/qcom_object_invoke.h b/include/linux/firmware/qcom/qcom_object_invoke.h
new file mode 100644
index 000000000000..9e6acd0f4db0
--- /dev/null
+++ b/include/linux/firmware/qcom/qcom_object_invoke.h
@@ -0,0 +1,233 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef __QCOM_OBJECT_INVOKE_H
+#define __QCOM_OBJECT_INVOKE_H
+
+#include <linux/kref.h>
+#include <linux/completion.h>
+#include <linux/workqueue.h>
+#include <uapi/misc/qcom_tee.h>
+
+struct qcom_tee_object;
+
+/* Primordial Object */
+
+/* It is used for bootstrapping the IPC connection between a VM and TEE.
+ *
+ * Each side (both the VM and the TEE) starts up with no object received from the
+ * other side. They both ''assume'' the other side implements a permanent initial
+ * object in the object table.
+ *
+ * TEE's initial object is typically called the ''root client env'', and it's
+ * invoked by VMs when they want to get a new clientEnv. The initial object created
+ * by the VMs is invoked by TEE, it's typically called the ''primordial object''.
+ *
+ * VM can register a primordial object using 'init_qcom_tee_object_user' with
+ * 'QCOM_TEE_OBJECT_TYPE_ROOT' type.
+ */
+
+enum qcom_tee_object_type {
+	QCOM_TEE_OBJECT_TYPE_USER = 0x1,	/* TEE object. */
+	QCOM_TEE_OBJECT_TYPE_CB_OBJECT = 0x2,	/* Callback Object. */
+	QCOM_TEE_OBJECT_TYPE_ROOT = 0x8,	/* ''Root client env.'' or 'primordial' Object. */
+	QCOM_TEE_OBJECT_TYPE_NULL = 0x10,	/* NULL object. */
+};
+
+enum qcom_tee_arg_type {
+	QCOM_TEE_ARG_TYPE_END = 0,
+	QCOM_TEE_ARG_TYPE_IB  = 0x80,	/* Input Buffer (IB).  */
+	QCOM_TEE_ARG_TYPE_OB  =	0x1,	/* Output Buffer (OB). */
+	QCOM_TEE_ARG_TYPE_IO  = 0x81,	/* Input Object (IO).  */
+	QCOM_TEE_ARG_TYPE_OO  = 0x2		/* Output Object (OO). */
+};
+
+#define QCOM_TEE_ARG_TYPE_INPUT_MASK 0x80
+
+/* Maximum specific type of arguments (i.e. IB, OB, IO, and OO) that can fit in a TEE message. */
+#define QCOM_TEE_ARGS_PER_TYPE 16
+
+/* Maximum arguments that can fit in a TEE message. */
+#define QCOM_TEE_ARGS_MAX (QCOM_TEE_ARGS_PER_TYPE * 4)
+
+/**
+ * struct qcom_tee_arg - Argument for TEE object invocation.
+ * @type: type of argument
+ * @flags: extra flags.
+ * @b: address and size if type of argument is buffer.
+ * @o: qcom_tee_object instance if type of argument is object.
+ *
+ * @flags only accept QCOM_TEE_ARG_FLAGS_UADDR for now which states that @b
+ * contains userspace address in uaddr.
+ *
+ */
+struct qcom_tee_arg {
+	enum qcom_tee_arg_type type;
+
+/* 'uaddr' holds a __user address. */
+#define QCOM_TEE_ARG_FLAGS_UADDR 1
+	char flags;
+	union {
+		struct qcom_tee_buffer {
+			union {
+				void *addr;
+				void __user *uaddr;
+			};
+			size_t size;
+		} b;
+		struct qcom_tee_object *o;
+	};
+};
+
+static inline int size_of_arg(struct qcom_tee_arg u[])
+{
+	int i = 0;
+
+	while (u[i].type != QCOM_TEE_ARG_TYPE_END)
+		i++;
+
+	return i;
+}
+
+/* Context ID - It is a unique ID assigned to a invocation which is in progress.
+ * Objects's dispatcher can use the ID to differentiate between concurrent calls.
+ * ID [0 .. 10) are reserved, i.e. never passed to object's dispatcher.
+ */
+
+struct qcom_tee_object_invoke_ctx {
+	unsigned int context_id;
+
+#define OIC_FLAG_BUSY		1	/* Context is busy, i.e. callback is in progress. */
+#define OIC_FLAG_NOTIFY		2	/* Context needs to notify the current object. */
+#define OIC_FLAG_QCOM_TEE	4	/* Context has objects shared with TEE. */
+	unsigned int flags;
+
+	/* Current object invoked in this callback context. */
+	struct qcom_tee_object *object;
+
+	/* Arguments passed to dispatch callback. */
+	struct qcom_tee_arg u[QCOM_TEE_ARGS_MAX + 1];
+
+	int errno;
+
+	/* Inbound and Outbound buffers shared with TEE. */
+	struct {
+		struct qcom_tee_buffer msg;
+	} in, out;
+};
+
+int qcom_tee_object_do_invoke(struct qcom_tee_object_invoke_ctx *oic,
+	struct qcom_tee_object *object, unsigned long op, struct qcom_tee_arg u[], int *result);
+
+#define QCOM_TEE_OBJECT_OP_METHOD_MASK 0x0000FFFFU
+#define QCOM_TEE_OBJECT_OP_METHOD_ID(op) ((op) & QCOM_TEE_OBJECT_OP_METHOD_MASK)
+
+/* Reserved Operations. */
+
+#define QCOM_TEE_OBJECT_OP_RELEASE	(QCOM_TEE_OBJECT_OP_METHOD_MASK - 0)
+#define QCOM_TEE_OBJECT_OP_RETAIN	(QCOM_TEE_OBJECT_OP_METHOD_MASK - 1)
+#define QCOM_TEE_OBJECT_OP_NO_OP	(QCOM_TEE_OBJECT_OP_METHOD_MASK - 2)
+
+struct qcom_tee_object_operations {
+	void (*release)(struct qcom_tee_object *object);
+
+	/**
+	 * @op_supported:
+	 *
+	 * Query made to make sure the requested operation is supported. If defined,
+	 * it is called before marshaling of the arguments (as optimisation).
+	 */
+	int (*op_supported)(unsigned long op);
+
+	/**
+	 * @notify:
+	 *
+	 * After @dispatch returned, it is called to notify the status of the transport;
+	 * i.e. transport errors or success. This allows the client to cleanup, if
+	 * the transport fails after @dispatch submits a SUCCESS response.
+	 */
+	void (*notify)(unsigned int context_id,	struct qcom_tee_object *object, int status);
+
+	int (*dispatch)(unsigned int context_id, struct qcom_tee_object *object,
+		unsigned long op, struct qcom_tee_arg args[]);
+
+	/**
+	 * @param_to_object:
+	 *
+	 * Called by core to do the object dependent marshaling from @param to an
+	 * instance of @object (NOT IMPLEMENTED YET).
+	 */
+	int (*param_to_object)(struct qcom_tee_param *param, struct qcom_tee_object *object);
+
+	int (*object_to_param)(struct qcom_tee_object *object, struct qcom_tee_param *param);
+};
+
+struct qcom_tee_object {
+	const char *name;
+	struct kref refcount;
+
+	enum qcom_tee_object_type object_type;
+	union object_info {
+		unsigned long object_ptr;
+	} info;
+
+	struct qcom_tee_object_operations *ops;
+
+	/* see release_wq.c. */
+	struct work_struct work;
+
+	/* Callback for any internal cleanup before the object's release. */
+	void (*release)(struct qcom_tee_object *object);
+};
+
+/* Static instances of qcom_tee_object objects. */
+
+#define NULL_QCOM_TEE_OBJECT ((struct qcom_tee_object *)(0))
+
+/* ROOT_QCOM_TEE_OBJECT aka ''root client env''. */
+#define ROOT_QCOM_TEE_OBJECT ((struct qcom_tee_object *)(1))
+
+static inline enum qcom_tee_object_type typeof_qcom_tee_object(struct qcom_tee_object *object)
+{
+	if (object == NULL_QCOM_TEE_OBJECT)
+		return QCOM_TEE_OBJECT_TYPE_NULL;
+
+	if (object == ROOT_QCOM_TEE_OBJECT)
+		return QCOM_TEE_OBJECT_TYPE_ROOT;
+
+	return object->object_type;
+}
+
+static inline const char *qcom_tee_object_name(struct qcom_tee_object *object)
+{
+	if (object == NULL_QCOM_TEE_OBJECT)
+		return "null";
+
+	if (object == ROOT_QCOM_TEE_OBJECT)
+		return "root";
+
+	if (!object->name)
+		return "noname";
+
+	return object->name;
+}
+
+struct qcom_tee_object *allocate_qcom_tee_object(void);
+void free_qcom_tee_object(struct qcom_tee_object *object);
+
+/**
+ * init_qcom_tee_object_user - Initialize an instance of qcom_tee_object.
+ * @object: object being initialized.
+ * @ot: type of object.
+ * @ops: sets of callback opeartions.
+ * @fmt: object name.
+ */
+int init_qcom_tee_object_user(struct qcom_tee_object *object, enum qcom_tee_object_type ot,
+	struct qcom_tee_object_operations *ops, const char *fmt, ...);
+
+int get_qcom_tee_object(struct qcom_tee_object *object);
+void put_qcom_tee_object(struct qcom_tee_object *object);
+
+#endif /* __QCOM_OBJECT_INVOKE_H */

-- 
2.34.1

