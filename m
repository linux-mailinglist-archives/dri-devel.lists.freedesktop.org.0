Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MIy2I8ixqmluVQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 11:51:52 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3114321F2B4
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 11:51:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 326C310ECD7;
	Fri,  6 Mar 2026 10:51:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="lElm9LlJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7DC310ECD7;
 Fri,  6 Mar 2026 10:51:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 85BAD60127;
 Fri,  6 Mar 2026 10:51:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 997C3C4CEF7;
 Fri,  6 Mar 2026 10:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772794307;
 bh=TprJHVQUk78N2ZO3Ieo2ufCYgJHKDfjV2VWmAhwPRec=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lElm9LlJSNS3Ty+kW3CBPcjqjeOhvIg2Wg4Xc4ls+wZLF0GsS6LZZqE7cuznLbapG
 15osYVlEilqbuCcfWcLsGGYuDTqjKLnPR7ZbNdrn2bqWwIYulbrn0wUlTfMkHQv7Un
 w2tKOMvg16j7JXPJGehSFkxz0whxG5sw2AF4M9/YSCm6aby6N+WFkc67Rlg9bfG49+
 Lh71sIhJQTtPwxagOj/QpjlB0QtcJRxTKzrYHyA+8PB7+kcMV9RNgh8eEGpYltlUpz
 uV6PIdvSzUKF884Lu0cZXR7KpU514diV/mTgg6kIx2ajkETc4lEM6AvcOQDQ0Oijsr
 FHbEGSYhv4pTw==
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
Subject: [PATCH 03/14] firmware: qcom_scm: Migrate to generic PAS service
Date: Fri,  6 Mar 2026 16:20:16 +0530
Message-ID: <20260306105027.290375-4-sumit.garg@kernel.org>
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
X-Rspamd-Queue-Id: 3114321F2B4
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

With the availability of generic PAS service, let's add SCM calls as
a backend to keep supporting legacy QTEE interfaces. The exported
qcom_scm* wrappers will get dropped once all the client drivers get
migrated as part of future patches.

Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
---
 drivers/firmware/qcom/Kconfig    |   1 +
 drivers/firmware/qcom/qcom_scm.c | 336 ++++++++++++++-----------------
 2 files changed, 156 insertions(+), 181 deletions(-)

diff --git a/drivers/firmware/qcom/Kconfig b/drivers/firmware/qcom/Kconfig
index 8653639d06db..9a12ae2b639d 100644
--- a/drivers/firmware/qcom/Kconfig
+++ b/drivers/firmware/qcom/Kconfig
@@ -15,6 +15,7 @@ config QCOM_PAS
 	  TEE bus based PAS service implementation.
 
 config QCOM_SCM
+	select QCOM_PAS
 	select QCOM_TZMEM
 	tristate
 
diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 8fbc96693a55..2d7937ae7c8f 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -13,6 +13,7 @@
 #include <linux/dma-mapping.h>
 #include <linux/err.h>
 #include <linux/export.h>
+#include <linux/firmware/qcom/qcom_pas.h>
 #include <linux/firmware/qcom/qcom_scm.h>
 #include <linux/firmware/qcom/qcom_tzmem.h>
 #include <linux/init.h>
@@ -33,6 +34,7 @@
 
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 
+#include "qcom_pas.h"
 #include "qcom_scm.h"
 #include "qcom_tzmem.h"
 
@@ -480,25 +482,6 @@ void qcom_scm_cpu_power_down(u32 flags)
 }
 EXPORT_SYMBOL_GPL(qcom_scm_cpu_power_down);
 
-int qcom_scm_set_remote_state(u32 state, u32 id)
-{
-	struct qcom_scm_desc desc = {
-		.svc = QCOM_SCM_SVC_BOOT,
-		.cmd = QCOM_SCM_BOOT_SET_REMOTE_STATE,
-		.arginfo = QCOM_SCM_ARGS(2),
-		.args[0] = state,
-		.args[1] = id,
-		.owner = ARM_SMCCC_OWNER_SIP,
-	};
-	struct qcom_scm_res res;
-	int ret;
-
-	ret = qcom_scm_call(__scm->dev, &desc, &res);
-
-	return ret ? : res.result[0];
-}
-EXPORT_SYMBOL_GPL(qcom_scm_set_remote_state);
-
 static int qcom_scm_disable_sdi(void)
 {
 	int ret;
@@ -571,26 +554,12 @@ static void qcom_scm_set_download_mode(u32 dload_mode)
 		dev_err(__scm->dev, "failed to set download mode: %d\n", ret);
 }
 
-/**
- * devm_qcom_scm_pas_context_alloc() - Allocate peripheral authentication service
- *				       context for a given peripheral
- *
- * PAS context is device-resource managed, so the caller does not need
- * to worry about freeing the context memory.
- *
- * @dev:	  PAS firmware device
- * @pas_id:	  peripheral authentication service id
- * @mem_phys:	  Subsystem reserve memory start address
- * @mem_size:	  Subsystem reserve memory size
- *
- * Returns: The new PAS context, or ERR_PTR() on failure.
- */
 struct qcom_scm_pas_context *devm_qcom_scm_pas_context_alloc(struct device *dev,
 							     u32 pas_id,
 							     phys_addr_t mem_phys,
 							     size_t mem_size)
 {
-	struct qcom_scm_pas_context *ctx;
+	struct qcom_pas_context *ctx;
 
 	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
 	if (!ctx)
@@ -601,11 +570,12 @@ struct qcom_scm_pas_context *devm_qcom_scm_pas_context_alloc(struct device *dev,
 	ctx->mem_phys = mem_phys;
 	ctx->mem_size = mem_size;
 
-	return ctx;
+	return (struct qcom_scm_pas_context *)ctx;
 }
 EXPORT_SYMBOL_GPL(devm_qcom_scm_pas_context_alloc);
 
-static int __qcom_scm_pas_init_image(u32 pas_id, dma_addr_t mdata_phys,
+static int __qcom_scm_pas_init_image(struct device *dev, u32 pas_id,
+				     dma_addr_t mdata_phys,
 				     struct qcom_scm_res *res)
 {
 	struct qcom_scm_desc desc = {
@@ -627,7 +597,7 @@ static int __qcom_scm_pas_init_image(u32 pas_id, dma_addr_t mdata_phys,
 
 	desc.args[1] = mdata_phys;
 
-	ret = qcom_scm_call(__scm->dev, &desc, res);
+	ret = qcom_scm_call(dev, &desc, res);
 	qcom_scm_bw_disable();
 
 disable_clk:
@@ -636,7 +606,8 @@ static int __qcom_scm_pas_init_image(u32 pas_id, dma_addr_t mdata_phys,
 	return ret;
 }
 
-static int qcom_scm_pas_prep_and_init_image(struct qcom_scm_pas_context *ctx,
+static int qcom_scm_pas_prep_and_init_image(struct device *dev,
+					    struct qcom_pas_context *ctx,
 					    const void *metadata, size_t size)
 {
 	struct qcom_scm_res res;
@@ -651,7 +622,7 @@ static int qcom_scm_pas_prep_and_init_image(struct qcom_scm_pas_context *ctx,
 	memcpy(mdata_buf, metadata, size);
 	mdata_phys = qcom_tzmem_to_phys(mdata_buf);
 
-	ret = __qcom_scm_pas_init_image(ctx->pas_id, mdata_phys, &res);
+	ret = __qcom_scm_pas_init_image(dev, ctx->pas_id, mdata_phys, &res);
 	if (ret < 0)
 		qcom_tzmem_free(mdata_buf);
 	else
@@ -660,25 +631,9 @@ static int qcom_scm_pas_prep_and_init_image(struct qcom_scm_pas_context *ctx,
 	return ret ? : res.result[0];
 }
 
-/**
- * qcom_scm_pas_init_image() - Initialize peripheral authentication service
- *			       state machine for a given peripheral, using the
- *			       metadata
- * @pas_id:	peripheral authentication service id
- * @metadata:	pointer to memory containing ELF header, program header table
- *		and optional blob of data used for authenticating the metadata
- *		and the rest of the firmware
- * @size:	size of the metadata
- * @ctx:	optional pas context
- *
- * Return: 0 on success.
- *
- * Upon successful return, the PAS metadata context (@ctx) will be used to
- * track the metadata allocation, this needs to be released by invoking
- * qcom_scm_pas_metadata_release() by the caller.
- */
-int qcom_scm_pas_init_image(u32 pas_id, const void *metadata, size_t size,
-			    struct qcom_scm_pas_context *ctx)
+static int __qcom_scm_pas_init_image2(struct device *dev, u32 pas_id,
+				      const void *metadata, size_t size,
+				      struct qcom_pas_context *ctx)
 {
 	struct qcom_scm_res res;
 	dma_addr_t mdata_phys;
@@ -686,7 +641,8 @@ int qcom_scm_pas_init_image(u32 pas_id, const void *metadata, size_t size,
 	int ret;
 
 	if (ctx && ctx->use_tzmem)
-		return qcom_scm_pas_prep_and_init_image(ctx, metadata, size);
+		return qcom_scm_pas_prep_and_init_image(dev, ctx, metadata,
+							size);
 
 	/*
 	 * During the scm call memory protection will be enabled for the meta
@@ -700,16 +656,15 @@ int qcom_scm_pas_init_image(u32 pas_id, const void *metadata, size_t size,
 	 * If we pass a buffer that is already part of an SHM Bridge to this
 	 * call, it will fail.
 	 */
-	mdata_buf = dma_alloc_coherent(__scm->dev, size, &mdata_phys,
-				       GFP_KERNEL);
+	mdata_buf = dma_alloc_coherent(dev, size, &mdata_phys, GFP_KERNEL);
 	if (!mdata_buf)
 		return -ENOMEM;
 
 	memcpy(mdata_buf, metadata, size);
 
-	ret = __qcom_scm_pas_init_image(pas_id, mdata_phys, &res);
+	ret = __qcom_scm_pas_init_image(dev, pas_id, mdata_phys, &res);
 	if (ret < 0 || !ctx) {
-		dma_free_coherent(__scm->dev, size, mdata_buf, mdata_phys);
+		dma_free_coherent(dev, size, mdata_buf, mdata_phys);
 	} else if (ctx) {
 		ctx->ptr = mdata_buf;
 		ctx->phys = mdata_phys;
@@ -718,36 +673,35 @@ int qcom_scm_pas_init_image(u32 pas_id, const void *metadata, size_t size,
 
 	return ret ? : res.result[0];
 }
-EXPORT_SYMBOL_GPL(qcom_scm_pas_init_image);
 
-/**
- * qcom_scm_pas_metadata_release() - release metadata context
- * @ctx:	pas context
- */
-void qcom_scm_pas_metadata_release(struct qcom_scm_pas_context *ctx)
+int qcom_scm_pas_init_image(u32 pas_id, const void *metadata, size_t size,
+			    struct qcom_scm_pas_context *ctx)
 {
-	if (!ctx->ptr)
-		return;
+	return __qcom_scm_pas_init_image2(__scm->dev, pas_id, metadata, size,
+					  (struct qcom_pas_context *)ctx);
+}
+EXPORT_SYMBOL_GPL(qcom_scm_pas_init_image);
 
+static void __qcom_scm_pas_metadata_release(struct device *dev,
+					    struct qcom_pas_context *ctx)
+{
 	if (ctx->use_tzmem)
 		qcom_tzmem_free(ctx->ptr);
 	else
-		dma_free_coherent(__scm->dev, ctx->size, ctx->ptr, ctx->phys);
+		dma_free_coherent(dev, ctx->size, ctx->ptr, ctx->phys);
 
 	ctx->ptr = NULL;
 }
+
+void qcom_scm_pas_metadata_release(struct qcom_scm_pas_context *ctx)
+{
+	__qcom_scm_pas_metadata_release(__scm->dev,
+					(struct qcom_pas_context *)ctx);
+}
 EXPORT_SYMBOL_GPL(qcom_scm_pas_metadata_release);
 
-/**
- * qcom_scm_pas_mem_setup() - Prepare the memory related to a given peripheral
- *			      for firmware loading
- * @pas_id:	peripheral authentication service id
- * @addr:	start address of memory area to prepare
- * @size:	size of the memory area to prepare
- *
- * Returns 0 on success.
- */
-int qcom_scm_pas_mem_setup(u32 pas_id, phys_addr_t addr, phys_addr_t size)
+static int __qcom_scm_pas_mem_setup(struct device *dev, u32 pas_id,
+				    phys_addr_t addr, phys_addr_t size)
 {
 	int ret;
 	struct qcom_scm_desc desc = {
@@ -769,7 +723,7 @@ int qcom_scm_pas_mem_setup(u32 pas_id, phys_addr_t addr, phys_addr_t size)
 	if (ret)
 		goto disable_clk;
 
-	ret = qcom_scm_call(__scm->dev, &desc, &res);
+	ret = qcom_scm_call(dev, &desc, &res);
 	qcom_scm_bw_disable();
 
 disable_clk:
@@ -777,9 +731,15 @@ int qcom_scm_pas_mem_setup(u32 pas_id, phys_addr_t addr, phys_addr_t size)
 
 	return ret ? : res.result[0];
 }
+
+int qcom_scm_pas_mem_setup(u32 pas_id, phys_addr_t addr, phys_addr_t size)
+{
+	return __qcom_scm_pas_mem_setup(__scm->dev, pas_id, addr, size);
+}
 EXPORT_SYMBOL_GPL(qcom_scm_pas_mem_setup);
 
-static void *__qcom_scm_pas_get_rsc_table(u32 pas_id, void *input_rt_tzm,
+static void *__qcom_scm_pas_get_rsc_table(struct device *dev, u32 pas_id,
+					  void *input_rt_tzm,
 					  size_t input_rt_size,
 					  size_t *output_rt_size)
 {
@@ -814,7 +774,7 @@ static void *__qcom_scm_pas_get_rsc_table(u32 pas_id, void *input_rt_tzm,
 	 * with output_rt_tzm buffer with res.result[2] size however, It should not
 	 * be of unresonable size.
 	 */
-	ret = qcom_scm_call(__scm->dev, &desc, &res);
+	ret = qcom_scm_call(dev, &desc, &res);
 	if (!ret && res.result[2] > SZ_1G) {
 		ret = -E2BIG;
 		goto free_output_rt;
@@ -831,51 +791,11 @@ static void *__qcom_scm_pas_get_rsc_table(u32 pas_id, void *input_rt_tzm,
 	return ret ? ERR_PTR(ret) : output_rt_tzm;
 }
 
-/**
- * qcom_scm_pas_get_rsc_table() - Retrieve the resource table in passed output buffer
- *				  for a given peripheral.
- *
- * Qualcomm remote processor may rely on both static and dynamic resources for
- * its functionality. Static resources typically refer to memory-mapped addresses
- * required by the subsystem and are often embedded within the firmware binary
- * and dynamic resources, such as shared memory in DDR etc., are determined at
- * runtime during the boot process.
- *
- * On Qualcomm Technologies devices, it's possible that static resources are not
- * embedded in the firmware binary and instead are provided by TrustZone However,
- * dynamic resources are always expected to come from TrustZone. This indicates
- * that for Qualcomm devices, all resources (static and dynamic) will be provided
- * by TrustZone via the SMC call.
- *
- * If the remote processor firmware binary does contain static resources, they
- * should be passed in input_rt. These will be forwarded to TrustZone for
- * authentication. TrustZone will then append the dynamic resources and return
- * the complete resource table in output_rt_tzm.
- *
- * If the remote processor firmware binary does not include a resource table,
- * the caller of this function should set input_rt as NULL and input_rt_size
- * as zero respectively.
- *
- * More about documentation on resource table data structures can be found in
- * include/linux/remoteproc.h
- *
- * @ctx:	    PAS context
- * @pas_id:	    peripheral authentication service id
- * @input_rt:       resource table buffer which is present in firmware binary
- * @input_rt_size:  size of the resource table present in firmware binary
- * @output_rt_size: TrustZone expects caller should pass worst case size for
- *		    the output_rt_tzm.
- *
- * Return:
- *  On success, returns a pointer to the allocated buffer containing the final
- *  resource table and output_rt_size will have actual resource table size from
- *  TrustZone. The caller is responsible for freeing the buffer. On failure,
- *  returns ERR_PTR(-errno).
- */
-struct resource_table *qcom_scm_pas_get_rsc_table(struct qcom_scm_pas_context *ctx,
-						  void *input_rt,
-						  size_t input_rt_size,
-						  size_t *output_rt_size)
+static void *__qcom_scm_pas_get_rsc_table2(struct device *dev,
+					   struct qcom_pas_context *ctx,
+					   void *input_rt,
+					   size_t input_rt_size,
+					   size_t *output_rt_size)
 {
 	struct resource_table empty_rsc = {};
 	size_t size = SZ_16K;
@@ -910,11 +830,12 @@ struct resource_table *qcom_scm_pas_get_rsc_table(struct qcom_scm_pas_context *c
 
 	memcpy(input_rt_tzm, input_rt, input_rt_size);
 
-	output_rt_tzm = __qcom_scm_pas_get_rsc_table(ctx->pas_id, input_rt_tzm,
+	output_rt_tzm = __qcom_scm_pas_get_rsc_table(dev, ctx->pas_id,
+						     input_rt_tzm,
 						     input_rt_size, &size);
 	if (PTR_ERR(output_rt_tzm) == -EOVERFLOW)
 		/* Try again with the size requested by the TZ */
-		output_rt_tzm = __qcom_scm_pas_get_rsc_table(ctx->pas_id,
+		output_rt_tzm = __qcom_scm_pas_get_rsc_table(dev, ctx->pas_id,
 							     input_rt_tzm,
 							     input_rt_size,
 							     &size);
@@ -945,16 +866,20 @@ struct resource_table *qcom_scm_pas_get_rsc_table(struct qcom_scm_pas_context *c
 
 	return ret ? ERR_PTR(ret) : tbl_ptr;
 }
+
+struct resource_table *qcom_scm_pas_get_rsc_table(struct qcom_scm_pas_context *ctx,
+						  void *input_rt,
+						  size_t input_rt_size,
+						  size_t *output_rt_size)
+{
+	return __qcom_scm_pas_get_rsc_table2(__scm->dev,
+					     (struct qcom_pas_context *)ctx,
+					     input_rt, input_rt_size,
+					     output_rt_size);
+}
 EXPORT_SYMBOL_GPL(qcom_scm_pas_get_rsc_table);
 
-/**
- * qcom_scm_pas_auth_and_reset() - Authenticate the given peripheral firmware
- *				   and reset the remote processor
- * @pas_id:	peripheral authentication service id
- *
- * Return 0 on success.
- */
-int qcom_scm_pas_auth_and_reset(u32 pas_id)
+static int __qcom_scm_pas_auth_and_reset(struct device *dev, u32 pas_id)
 {
 	int ret;
 	struct qcom_scm_desc desc = {
@@ -974,7 +899,7 @@ int qcom_scm_pas_auth_and_reset(u32 pas_id)
 	if (ret)
 		goto disable_clk;
 
-	ret = qcom_scm_call(__scm->dev, &desc, &res);
+	ret = qcom_scm_call(dev, &desc, &res);
 	qcom_scm_bw_disable();
 
 disable_clk:
@@ -982,28 +907,15 @@ int qcom_scm_pas_auth_and_reset(u32 pas_id)
 
 	return ret ? : res.result[0];
 }
+
+int qcom_scm_pas_auth_and_reset(u32 pas_id)
+{
+	return __qcom_scm_pas_auth_and_reset(__scm->dev, pas_id);
+}
 EXPORT_SYMBOL_GPL(qcom_scm_pas_auth_and_reset);
 
-/**
- * qcom_scm_pas_prepare_and_auth_reset() - Prepare, authenticate, and reset the
- *					   remote processor
- *
- * @ctx:	Context saved during call to qcom_scm_pas_context_init()
- *
- * This function performs the necessary steps to prepare a PAS subsystem,
- * authenticate it using the provided metadata, and initiate a reset sequence.
- *
- * It should be used when Linux is in control setting up the IOMMU hardware
- * for remote subsystem during secure firmware loading processes. The preparation
- * step sets up a shmbridge over the firmware memory before TrustZone accesses the
- * firmware memory region for authentication. The authentication step verifies
- * the integrity and authenticity of the firmware or configuration using secure
- * metadata. Finally, the reset step ensures the subsystem starts in a clean and
- * sane state.
- *
- * Return: 0 on success, negative errno on failure.
- */
-int qcom_scm_pas_prepare_and_auth_reset(struct qcom_scm_pas_context *ctx)
+static int __qcom_scm_pas_prepare_and_auth_reset(struct device *dev,
+						 struct qcom_pas_context *ctx)
 {
 	u64 handle;
 	int ret;
@@ -1014,7 +926,7 @@ int qcom_scm_pas_prepare_and_auth_reset(struct qcom_scm_pas_context *ctx)
 	 * memory region and then invokes a call to TrustZone to authenticate.
 	 */
 	if (!ctx->use_tzmem)
-		return qcom_scm_pas_auth_and_reset(ctx->pas_id);
+		return __qcom_scm_pas_auth_and_reset(dev, ctx->pas_id);
 
 	/*
 	 * When Linux runs @ EL2 Linux must create the shmbridge itself and then
@@ -1024,20 +936,45 @@ int qcom_scm_pas_prepare_and_auth_reset(struct qcom_scm_pas_context *ctx)
 	if (ret)
 		return ret;
 
-	ret = qcom_scm_pas_auth_and_reset(ctx->pas_id);
+	ret = __qcom_scm_pas_auth_and_reset(dev, ctx->pas_id);
 	qcom_tzmem_shm_bridge_delete(handle);
 
 	return ret;
 }
+
+int qcom_scm_pas_prepare_and_auth_reset(struct qcom_scm_pas_context *ctx)
+{
+	return __qcom_scm_pas_prepare_and_auth_reset(__scm->dev,
+						     (struct qcom_pas_context *)ctx);
+}
 EXPORT_SYMBOL_GPL(qcom_scm_pas_prepare_and_auth_reset);
 
-/**
- * qcom_scm_pas_shutdown() - Shut down the remote processor
- * @pas_id:	peripheral authentication service id
- *
- * Returns 0 on success.
- */
-int qcom_scm_pas_shutdown(u32 pas_id)
+static int __qcom_scm_pas_set_remote_state(struct device *dev, u32 state,
+					   u32 pas_id)
+{
+	struct qcom_scm_desc desc = {
+		.svc = QCOM_SCM_SVC_BOOT,
+		.cmd = QCOM_SCM_BOOT_SET_REMOTE_STATE,
+		.arginfo = QCOM_SCM_ARGS(2),
+		.args[0] = state,
+		.args[1] = pas_id,
+		.owner = ARM_SMCCC_OWNER_SIP,
+	};
+	struct qcom_scm_res res;
+	int ret;
+
+	ret = qcom_scm_call(dev, &desc, &res);
+
+	return ret ? : res.result[0];
+}
+
+int qcom_scm_set_remote_state(u32 state, u32 id)
+{
+	return __qcom_scm_pas_set_remote_state(__scm->dev, state, id);
+}
+EXPORT_SYMBOL_GPL(qcom_scm_set_remote_state);
+
+static int __qcom_scm_pas_shutdown(struct device *dev, u32 pas_id)
 {
 	int ret;
 	struct qcom_scm_desc desc = {
@@ -1057,7 +994,7 @@ int qcom_scm_pas_shutdown(u32 pas_id)
 	if (ret)
 		goto disable_clk;
 
-	ret = qcom_scm_call(__scm->dev, &desc, &res);
+	ret = qcom_scm_call(dev, &desc, &res);
 	qcom_scm_bw_disable();
 
 disable_clk:
@@ -1065,16 +1002,14 @@ int qcom_scm_pas_shutdown(u32 pas_id)
 
 	return ret ? : res.result[0];
 }
+
+int qcom_scm_pas_shutdown(u32 pas_id)
+{
+	return __qcom_scm_pas_shutdown(__scm->dev, pas_id);
+}
 EXPORT_SYMBOL_GPL(qcom_scm_pas_shutdown);
 
-/**
- * qcom_scm_pas_supported() - Check if the peripheral authentication service is
- *			      available for the given peripherial
- * @pas_id:	peripheral authentication service id
- *
- * Returns true if PAS is supported for this peripheral, otherwise false.
- */
-bool qcom_scm_pas_supported(u32 pas_id)
+static bool __qcom_scm_pas_supported(struct device *dev, u32 pas_id)
 {
 	int ret;
 	struct qcom_scm_desc desc = {
@@ -1086,16 +1021,49 @@ bool qcom_scm_pas_supported(u32 pas_id)
 	};
 	struct qcom_scm_res res;
 
-	if (!__qcom_scm_is_call_available(__scm->dev, QCOM_SCM_SVC_PIL,
+	if (!__qcom_scm_is_call_available(dev, QCOM_SCM_SVC_PIL,
 					  QCOM_SCM_PIL_PAS_IS_SUPPORTED))
 		return false;
 
-	ret = qcom_scm_call(__scm->dev, &desc, &res);
+	ret = qcom_scm_call(dev, &desc, &res);
 
 	return ret ? false : !!res.result[0];
 }
+
+bool qcom_scm_pas_supported(u32 pas_id)
+{
+	return __qcom_scm_pas_supported(__scm->dev, pas_id);
+}
 EXPORT_SYMBOL_GPL(qcom_scm_pas_supported);
 
+static struct qcom_pas_ops qcom_pas_ops_scm = {
+	.drv_name		= "qcom_scm",
+	.supported		= __qcom_scm_pas_supported,
+	.init_image		= __qcom_scm_pas_init_image2,
+	.mem_setup		= __qcom_scm_pas_mem_setup,
+	.get_rsc_table		= __qcom_scm_pas_get_rsc_table2,
+	.auth_and_reset		= __qcom_scm_pas_auth_and_reset,
+	.prepare_and_auth_reset	= __qcom_scm_pas_prepare_and_auth_reset,
+	.set_remote_state	= __qcom_scm_pas_set_remote_state,
+	.shutdown		= __qcom_scm_pas_shutdown,
+	.metadata_release	= __qcom_scm_pas_metadata_release,
+};
+
+/**
+ * qcom_scm_is_pas_available() - Check if the peripheral authentication service
+ *				 is available via SCM or not
+ *
+ * Returns true if PAS is available, otherwise false.
+ */
+static bool qcom_scm_is_pas_available(void)
+{
+	if (!__qcom_scm_is_call_available(__scm->dev, QCOM_SCM_SVC_PIL,
+					  QCOM_SCM_PIL_PAS_AUTH_AND_RESET))
+		return false;
+
+	return true;
+}
+
 static int __qcom_scm_pas_mss_reset(struct device *dev, bool reset)
 {
 	struct qcom_scm_desc desc = {
@@ -2782,6 +2750,11 @@ static int qcom_scm_probe(struct platform_device *pdev)
 
 	__get_convention();
 
+	if (qcom_scm_is_pas_available()) {
+		qcom_pas_ops_scm.dev = scm->dev;
+		qcom_pas_ops_register(&qcom_pas_ops_scm);
+	}
+
 	/*
 	 * If "download mode" is requested, from this point on warmboot
 	 * will cause the boot stages to enter download mode, unless
@@ -2818,6 +2791,7 @@ static void qcom_scm_shutdown(struct platform_device *pdev)
 {
 	/* Clean shutdown, disable download mode to allow normal restart */
 	qcom_scm_set_download_mode(QCOM_DLOAD_NODUMP);
+	qcom_pas_ops_unregister();
 }
 
 static const struct of_device_id qcom_scm_dt_match[] = {
-- 
2.51.0

