Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4GN7LNaxqmkhVgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 11:52:06 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5116221F2D6
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 11:52:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57A6B10ECDD;
	Fri,  6 Mar 2026 10:52:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="uNz29u4P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A337610ECD9;
 Fri,  6 Mar 2026 10:52:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 9923C6012A;
 Fri,  6 Mar 2026 10:52:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3EC4C2BC9E;
 Fri,  6 Mar 2026 10:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772794321;
 bh=ZYeln3JcaxU+wVsGuAKHzY9GvhkzARzFTNlqHt2hz9k=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=uNz29u4PkjvyTDNXs6QppFBD6/yK+lw9BoLzh5y0cZNhpLNeIjdrVRTZ75t2XzliZ
 irxcpAGaAHwU3L4kmu3I6vnJakP+CnDFVIREtALcN9RQdpKg+r7LeFxdNHCHEoAEZb
 y9tvV99pO7xwH38YMgD7IWsu90ELl4FicTCZ+ioO38LEV3gQkd2MZZkQHcny83TTfK
 7r8SMc/InZtw/X/0WGaEkUlW5zayYgQd5sg069nubWnmMsBrgb+SJgOJqBTMpNhYIV
 d4Fk5TorNtZeGj6xIohvXydlbHVmkj5BWHbqaZzi+TG3gRlm/V125v9fh3HkkmMwoQ
 rsk04nJcySiuQ==
From: Sumit Garg <sumit.garg@kernel.org>
To: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-media@vger.kernel.org, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
 linux-remoteproc@vger.kernel.org
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, robin.clark@oss.qualcomm.com,
 sean@poorly.run, akhilpo@oss.qualcomm.com, lumag@kernel.org,
 abhinav.kumar@linux.dev, jesszhan0024@gmail.com,
 marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch,
 vikash.garodia@oss.qualcomm.com, dikshita.agarwal@oss.qualcomm.com,
 bod@kernel.org, mchehab@kernel.org, elder@kernel.org,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, jjohnson@kernel.org,
 mathieu.poirier@linaro.org, trilokkumar.soni@oss.qualcomm.com,
 mukesh.ojha@oss.qualcomm.com, pavan.kondeti@oss.qualcomm.com,
 jorge.ramirez@oss.qualcomm.com, tonyh@qti.qualcomm.com,
 vignesh.viswanathan@oss.qualcomm.com, srinivas.kandagatla@oss.qualcomm.com,
 amirreza.zarrabi@oss.qualcomm.com, jens.wiklander@linaro.org,
 op-tee@lists.trustedfirmware.org, apurupa@qti.qualcomm.com,
 skare@qti.qualcomm.com, Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: [PATCH 04/14] firmware: qcom: Add a PAS TEE service
Date: Fri,  6 Mar 2026 16:20:17 +0530
Message-ID: <20260306105027.290375-5-sumit.garg@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260306105027.290375-1-sumit.garg@kernel.org>
References: <20260306105027.290375-1-sumit.garg@kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Queue-Id: 5116221F2D6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[48];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,poorly.run,linux.dev,gmail.com,somainline.org,ffwll.ch,lunn.ch,davemloft.net,google.com,redhat.com,linaro.org,qti.qualcomm.com,lists.trustedfirmware.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sumit.garg@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt,netdev];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Action: no action

From: Sumit Garg <sumit.garg@oss.qualcomm.com>

Add support for Peripheral Authentication Service (PAS) driver based
on TEE bus with OP-TEE providing the backend PAS service implementation.

The TEE PAS service ABI is designed to be extensible with additional API
as PTA_QCOM_PAS_CAPABILITIES. This allows to accommodate any future
extensions of the PAS service needed while still maintaining backwards
compatibility.

Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
---
 drivers/firmware/qcom/Kconfig        |   9 +
 drivers/firmware/qcom/Makefile       |   1 +
 drivers/firmware/qcom/qcom_pas_tee.c | 478 +++++++++++++++++++++++++++
 3 files changed, 488 insertions(+)
 create mode 100644 drivers/firmware/qcom/qcom_pas_tee.c

diff --git a/drivers/firmware/qcom/Kconfig b/drivers/firmware/qcom/Kconfig
index 9a12ae2b639d..fff47abdaafd 100644
--- a/drivers/firmware/qcom/Kconfig
+++ b/drivers/firmware/qcom/Kconfig
@@ -14,6 +14,15 @@ config QCOM_PAS
 	  backends plugged in whether it's an SCM implementation or a proper
 	  TEE bus based PAS service implementation.
 
+config QCOM_PAS_TEE
+	tristate
+	select QCOM_PAS
+	depends on TEE
+	depends on !CPU_BIG_ENDIAN
+	help
+	  Enable the generic Peripheral Authentication Service (PAS) provided
+	  by the firmware TEE implementation as the backend.
+
 config QCOM_SCM
 	select QCOM_PAS
 	select QCOM_TZMEM
diff --git a/drivers/firmware/qcom/Makefile b/drivers/firmware/qcom/Makefile
index dc5ab45f906a..48801d18f37b 100644
--- a/drivers/firmware/qcom/Makefile
+++ b/drivers/firmware/qcom/Makefile
@@ -9,3 +9,4 @@ obj-$(CONFIG_QCOM_TZMEM)	+= qcom_tzmem.o
 obj-$(CONFIG_QCOM_QSEECOM)	+= qcom_qseecom.o
 obj-$(CONFIG_QCOM_QSEECOM_UEFISECAPP) += qcom_qseecom_uefisecapp.o
 obj-$(CONFIG_QCOM_PAS)		+= qcom_pas.o
+obj-$(CONFIG_QCOM_PAS_TEE)	+= qcom_pas_tee.o
diff --git a/drivers/firmware/qcom/qcom_pas_tee.c b/drivers/firmware/qcom/qcom_pas_tee.c
new file mode 100644
index 000000000000..84cd4d62058c
--- /dev/null
+++ b/drivers/firmware/qcom/qcom_pas_tee.c
@@ -0,0 +1,478 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/delay.h>
+#include <linux/of.h>
+#include <linux/firmware/qcom/qcom_pas.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/slab.h>
+#include <linux/tee_drv.h>
+#include <linux/uuid.h>
+
+#include "qcom_pas.h"
+
+/*
+ * Peripheral Authentication Service (PAS) supported.
+ *
+ * [in]  params[0].value.a:	Unique 32bit remote processor identifier
+ */
+#define PTA_QCOM_PAS_IS_SUPPORTED		1
+
+/*
+ * PAS capabilities.
+ *
+ * [in]  params[0].value.a:	Unique 32bit remote processor identifier
+ * [out] params[1].value.a:	PAS capability flags
+ */
+#define PTA_QCOM_PAS_CAPABILITIES		2
+
+/*
+ * PAS image initialization.
+ *
+ * [in]  params[0].value.a:	Unique 32bit remote processor identifier
+ * [in]  params[1].memref:	Loadable firmware metadata
+ */
+#define PTA_QCOM_PAS_INIT_IMAGE			3
+
+/*
+ * PAS memory setup.
+ *
+ * [in]  params[0].value.a:	Unique 32bit remote processor identifier
+ * [in]  params[0].value.b:	Relocatable firmware size
+ * [in]  params[1].value.a:	32bit LSB relocatable firmware memory address
+ * [in]  params[1].value.b:	32bit MSB relocatable firmware memory address
+ */
+#define PTA_QCOM_PAS_MEM_SETUP			4
+
+/*
+ * PAS get resource table.
+ *
+ * [in]     params[0].value.a:	Unique 32bit remote processor identifier
+ * [inout]  params[1].memref:	Resource table config
+ */
+#define PTA_QCOM_PAS_GET_RESOURCE_TABLE		5
+
+/*
+ * PAS image authentication and co-processor reset.
+ *
+ * [in]  params[0].value.a:	Unique 32bit remote processor identifier
+ * [in]  params[0].value.b:	Firmware size
+ * [in]  params[1].value.a:	32bit LSB firmware memory address
+ * [in]  params[1].value.b:	32bit MSB firmware memory address
+ * [in]  params[2].memref:	Optional fw memory space shared/lent
+ */
+#define PTA_QCOM_PAS_AUTH_AND_RESET		6
+
+/*
+ * PAS co-processor set suspend/resume state.
+ *
+ * [in]  params[0].value.a:	Unique 32bit remote processor identifier
+ * [in]  params[0].value.b:	Co-processor state identifier
+ */
+#define PTA_QCOM_PAS_SET_REMOTE_STATE		7
+
+/*
+ * PAS co-processor shutdown.
+ *
+ * [in]  params[0].value.a:	Unique 32bit remote processor identifier
+ */
+#define PTA_QCOM_PAS_SHUTDOWN			8
+
+#define TEE_NUM_PARAMS				4
+
+/**
+ * struct qcom_pas_tee_private - PAS service private data
+ * @dev:		PAS service device.
+ * @ctx:		TEE context handler.
+ * @session_id:		PAS TA session identifier.
+ */
+struct qcom_pas_tee_private {
+	struct device *dev;
+	struct tee_context *ctx;
+	u32 session_id;
+};
+
+static bool qcom_pas_tee_supported(struct device *dev, u32 pas_id)
+{
+	struct qcom_pas_tee_private *data = dev_get_drvdata(dev);
+	struct tee_ioctl_invoke_arg inv_arg = {
+		.func = PTA_QCOM_PAS_IS_SUPPORTED,
+		.session = data->session_id,
+		.num_params = TEE_NUM_PARAMS
+	};
+	struct tee_param param[4] = {
+		[0] = {
+			.attr = TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT,
+			.u.value.a = pas_id
+		}
+	};
+	int ret;
+
+	ret = tee_client_invoke_func(data->ctx, &inv_arg, param);
+	if (ret < 0 || inv_arg.ret != 0) {
+		dev_err(dev, "PAS not supported, pas_id: %d, err: %x\n",
+			pas_id, inv_arg.ret);
+		return false;
+	}
+
+	return true;
+}
+
+static int qcom_pas_tee_init_image(struct device *dev, u32 pas_id,
+				   const void *metadata, size_t size,
+				   struct qcom_pas_context *ctx)
+{
+	struct qcom_pas_tee_private *data = dev_get_drvdata(dev);
+	struct tee_ioctl_invoke_arg inv_arg = {
+		.func = PTA_QCOM_PAS_INIT_IMAGE,
+		.session = data->session_id,
+		.num_params = TEE_NUM_PARAMS
+	};
+	struct tee_param param[4] = {
+		[0] = {
+			.attr = TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT,
+			.u.value.a = pas_id
+		},
+		[1] = {
+			.attr = TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT,
+		}
+	};
+	struct tee_shm *mdata_shm;
+	u8 *mdata_buf = NULL;
+	int ret;
+
+	mdata_shm = tee_shm_alloc_kernel_buf(data->ctx, size);
+	if (IS_ERR(mdata_shm)) {
+		dev_err(dev, "mdata_shm allocation failed\n");
+		return PTR_ERR(mdata_shm);
+	}
+
+	mdata_buf = tee_shm_get_va(mdata_shm, 0);
+	if (IS_ERR(mdata_buf)) {
+		dev_err(dev, "mdata_buf get VA failed\n");
+		tee_shm_free(mdata_shm);
+		return PTR_ERR(mdata_buf);
+	}
+	memcpy(mdata_buf, metadata, size);
+
+	param[1].u.memref.shm = mdata_shm;
+	param[1].u.memref.size = size;
+
+	ret = tee_client_invoke_func(data->ctx, &inv_arg, param);
+	if (ret < 0 || inv_arg.ret != 0) {
+		dev_err(dev, "PAS init image failed, pas_id: %d, err: %x\n",
+			pas_id, inv_arg.ret);
+		tee_shm_free(mdata_shm);
+		return -EINVAL;
+	}
+	ctx->ptr = (void *)mdata_shm;
+
+	return 0;
+}
+
+static int qcom_pas_tee_mem_setup(struct device *dev, u32 pas_id,
+				  phys_addr_t addr, phys_addr_t size)
+{
+	struct qcom_pas_tee_private *data = dev_get_drvdata(dev);
+	struct tee_ioctl_invoke_arg inv_arg = {
+		.func = PTA_QCOM_PAS_MEM_SETUP,
+		.session = data->session_id,
+		.num_params = TEE_NUM_PARAMS
+	};
+	struct tee_param param[4] = {
+		[0] = {
+			.attr = TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT,
+			.u.value.a = pas_id,
+			.u.value.b = size,
+		},
+		[1] = {
+			.attr = TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT,
+			.u.value.a = lower_32_bits(addr),
+			.u.value.b = upper_32_bits(addr),
+		}
+	};
+	int ret;
+
+	ret = tee_client_invoke_func(data->ctx, &inv_arg, param);
+	if (ret < 0 || inv_arg.ret != 0) {
+		dev_err(dev, "PAS mem setup failed, pas_id: %d, err: %x\n",
+			pas_id, inv_arg.ret);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+DEFINE_FREE(shm_free, struct tee_shm *, tee_shm_free(_T))
+
+static void *qcom_pas_tee_get_rsc_table(struct device *dev,
+					struct qcom_pas_context *ctx,
+					void *input_rt, size_t input_rt_size,
+					size_t *output_rt_size)
+{
+	struct qcom_pas_tee_private *data = dev_get_drvdata(dev);
+	struct tee_ioctl_invoke_arg inv_arg = {
+		.func = PTA_QCOM_PAS_GET_RESOURCE_TABLE,
+		.session = data->session_id,
+		.num_params = TEE_NUM_PARAMS
+	};
+	struct tee_param param[4] = {
+		[0] = {
+			.attr = TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT,
+			.u.value.a = ctx->pas_id,
+		},
+		[1] = {
+			.attr = TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT,
+			.u.memref.size = input_rt_size,
+		}
+	};
+	void *rt_buf = NULL;
+	int ret;
+
+	ret = tee_client_invoke_func(data->ctx, &inv_arg, param);
+	if (ret < 0 || inv_arg.ret != 0) {
+		dev_err(dev, "PAS get RT failed, pas_id: %d, err: %x\n",
+			ctx->pas_id, inv_arg.ret);
+		return ERR_PTR(-EINVAL);
+	}
+
+	if (param[1].u.memref.size) {
+		struct tee_shm *rt_shm __free(shm_free) =
+			tee_shm_alloc_kernel_buf(data->ctx,
+						 param[1].u.memref.size);
+		void *rt_shm_va;
+
+		if (IS_ERR(rt_shm)) {
+			dev_err(dev, "rt_shm allocation failed\n");
+			return rt_shm;
+		}
+
+		rt_shm_va = tee_shm_get_va(rt_shm, 0);
+		if (IS_ERR_OR_NULL(rt_shm_va)) {
+			dev_err(dev, "rt_shm get VA failed\n");
+			return ERR_PTR(-EINVAL);
+		}
+		memcpy(rt_shm_va, input_rt, input_rt_size);
+
+		param[1].u.memref.shm = rt_shm;
+		ret = tee_client_invoke_func(data->ctx, &inv_arg, param);
+		if (ret < 0 || inv_arg.ret != 0) {
+			dev_err(dev, "PAS get RT failed, pas_id: %d, err: %x\n",
+				ctx->pas_id, inv_arg.ret);
+			return ERR_PTR(-EINVAL);
+		}
+
+		if (param[1].u.memref.size) {
+			*output_rt_size = param[1].u.memref.size;
+			rt_buf = kmalloc(param[1].u.memref.size, GFP_KERNEL);
+			if (!rt_buf)
+				return ERR_PTR(-ENOMEM);
+
+			memcpy(rt_buf, rt_shm_va, *output_rt_size);
+		}
+	}
+
+	return rt_buf;
+}
+
+static int __qcom_pas_tee_auth_and_reset(struct device *dev, u32 pas_id,
+					 phys_addr_t mem_phys, size_t mem_size)
+{
+	struct qcom_pas_tee_private *data = dev_get_drvdata(dev);
+	struct tee_ioctl_invoke_arg inv_arg = {
+		.func = PTA_QCOM_PAS_AUTH_AND_RESET,
+		.session = data->session_id,
+		.num_params = TEE_NUM_PARAMS
+	};
+	struct tee_param param[4] = {
+		[0] = {
+			.attr = TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT,
+			.u.value.a = pas_id,
+			.u.value.b = mem_size,
+		},
+		[1] = {
+			.attr = TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT,
+			.u.value.a = lower_32_bits(mem_phys),
+			.u.value.b = upper_32_bits(mem_phys),
+		},
+		/* Reserved for fw memory space to be shared or lent */
+		[2] = {
+			.attr = TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT,
+		}
+	};
+	int ret;
+
+	ret = tee_client_invoke_func(data->ctx, &inv_arg, param);
+	if (ret < 0 || inv_arg.ret != 0) {
+		dev_err(dev, "PAS auth reset failed, pas_id: %d, err: %x\n",
+			pas_id, inv_arg.ret);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int qcom_pas_tee_auth_and_reset(struct device *dev, u32 pas_id)
+{
+	return __qcom_pas_tee_auth_and_reset(dev, pas_id, 0, 0);
+}
+
+static int qcom_pas_tee_prepare_and_auth_reset(struct device *dev,
+					       struct qcom_pas_context *ctx)
+{
+	return __qcom_pas_tee_auth_and_reset(dev, ctx->pas_id, ctx->mem_phys,
+					     ctx->mem_size);
+}
+
+static int qcom_pas_tee_set_remote_state(struct device *dev, u32 state,
+					 u32 pas_id)
+{
+	struct qcom_pas_tee_private *data = dev_get_drvdata(dev);
+	struct tee_ioctl_invoke_arg inv_arg = {
+		.func = PTA_QCOM_PAS_SET_REMOTE_STATE,
+		.session = data->session_id,
+		.num_params = TEE_NUM_PARAMS
+	};
+	struct tee_param param[4] = {
+		[0] = {
+			.attr = TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT,
+			.u.value.a = pas_id,
+			.u.value.b = state,
+		}
+	};
+	int ret;
+
+	ret = tee_client_invoke_func(data->ctx, &inv_arg, param);
+	if (ret < 0 || inv_arg.ret != 0) {
+		dev_err(dev, "PAS shutdown failed, pas_id: %d, err: %x\n",
+			pas_id, inv_arg.ret);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int qcom_pas_tee_shutdown(struct device *dev, u32 pas_id)
+{
+	struct qcom_pas_tee_private *data = dev_get_drvdata(dev);
+	struct tee_ioctl_invoke_arg inv_arg = {
+		.func = PTA_QCOM_PAS_SHUTDOWN,
+		.session = data->session_id,
+		.num_params = TEE_NUM_PARAMS
+	};
+	struct tee_param param[4] = {
+		[0] = {
+			.attr = TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT,
+			.u.value.a = pas_id
+		}
+	};
+	int ret = 0;
+
+	ret = tee_client_invoke_func(data->ctx, &inv_arg, param);
+	if (ret < 0 || inv_arg.ret != 0) {
+		dev_err(dev, "PAS shutdown failed, pas_id: %d, err: %x\n",
+			pas_id, inv_arg.ret);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static void qcom_pas_tee_metadata_release(struct device *dev,
+					  struct qcom_pas_context *ctx)
+{
+	struct tee_shm *mdata_shm = ctx->ptr;
+
+	tee_shm_free(mdata_shm);
+}
+
+static struct qcom_pas_ops qcom_pas_ops_tee = {
+	.drv_name		= "qcom-pas-tee",
+	.supported		= qcom_pas_tee_supported,
+	.init_image		= qcom_pas_tee_init_image,
+	.mem_setup		= qcom_pas_tee_mem_setup,
+	.get_rsc_table		= qcom_pas_tee_get_rsc_table,
+	.auth_and_reset		= qcom_pas_tee_auth_and_reset,
+	.prepare_and_auth_reset	= qcom_pas_tee_prepare_and_auth_reset,
+	.set_remote_state	= qcom_pas_tee_set_remote_state,
+	.shutdown		= qcom_pas_tee_shutdown,
+	.metadata_release	= qcom_pas_tee_metadata_release,
+};
+
+static int optee_ctx_match(struct tee_ioctl_version_data *ver, const void *data)
+{
+	return ver->impl_id == TEE_IMPL_ID_OPTEE;
+}
+
+static int qcom_pas_tee_probe(struct tee_client_device *pas_dev)
+{
+	struct device *dev = &pas_dev->dev;
+	struct qcom_pas_tee_private *data;
+	struct tee_ioctl_open_session_arg sess_arg = {
+		.clnt_login = TEE_IOCTL_LOGIN_REE_KERNEL
+	};
+	int ret, err = -ENODEV;
+
+	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	data->ctx = tee_client_open_context(NULL, optee_ctx_match, NULL, NULL);
+	if (IS_ERR(data->ctx))
+		return -ENODEV;
+
+	export_uuid(sess_arg.uuid, &pas_dev->id.uuid);
+	ret = tee_client_open_session(data->ctx, &sess_arg, NULL);
+	if ((ret < 0) || (sess_arg.ret != 0)) {
+		dev_err(dev, "tee_client_open_session failed, err: %x\n",
+			sess_arg.ret);
+		err = -EINVAL;
+		goto out_ctx;
+	}
+
+	data->session_id = sess_arg.session;
+	dev_set_drvdata(dev, data);
+	qcom_pas_ops_tee.dev = dev;
+	qcom_pas_ops_register(&qcom_pas_ops_tee);
+
+	return 0;
+out_ctx:
+	tee_client_close_context(data->ctx);
+
+	return err;
+}
+
+static void qcom_pas_tee_remove(struct tee_client_device *pas_dev)
+{
+	struct device *dev = &pas_dev->dev;
+	struct qcom_pas_tee_private *data = dev_get_drvdata(dev);
+
+	qcom_pas_ops_unregister();
+	tee_client_close_session(data->ctx, data->session_id);
+	tee_client_close_context(data->ctx);
+}
+
+static const struct tee_client_device_id qcom_pas_tee_id_table[] = {
+	{UUID_INIT(0xcff7d191, 0x7ca0, 0x4784,
+		   0xaf, 0x13, 0x48, 0x22, 0x3b, 0x9a, 0x4f, 0xbe)},
+	{}
+};
+MODULE_DEVICE_TABLE(tee, qcom_pas_tee_id_table);
+
+static struct tee_client_driver optee_pas_tee_driver = {
+	.probe		= qcom_pas_tee_probe,
+	.remove		= qcom_pas_tee_remove,
+	.id_table	= qcom_pas_tee_id_table,
+	.driver		= {
+		.name		= "qcom-pas-tee",
+	},
+};
+
+module_tee_client_driver(optee_pas_tee_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Sumit Garg <sumit.garg@oss.qualcomm.com>");
+MODULE_DESCRIPTION("TEE bus based Qualcomm PAS driver");
-- 
2.51.0

