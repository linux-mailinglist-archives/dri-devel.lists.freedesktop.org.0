Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1E6A9A908B
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2024 22:04:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12FB610E18D;
	Mon, 21 Oct 2024 20:04:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="juDDMs0x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 611BD10E18D
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 20:04:19 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49LJkpsV023079;
 Mon, 21 Oct 2024 20:04:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=dE3MBlUKPNcUdW6/Qi+x1k
 VxkTk+Dii/sMVNrRO1BSs=; b=juDDMs0xUZ8/U8FSm4pYeWquj0i1qu/u/ej6uz
 PSqm5T02jJLqHQTfEj3bgA7ycdVy3jqk3tcuipyVaDsLjvU8q491K6Wk+WP/7YON
 JEUYVw1BRE4sR3EszTwcbzsxsLvfwTh0QJfCb24kCmE9U4sPdsN3l85RVpDVuCuq
 v4m993XpdtZaLst9N2X5pUdQZrUd4wl/Fg4Tyjmi5Wnz15MC5Do2yzU59tAbuMVp
 lE9U/pwVzD5T3wvwy8woPDs+U7m24DwKEF3TyLpbMrXO09pl7700v1bi0/sygCqi
 vnqYhmiclo7rk8UTVLJmuPBE4jLG8wPQPl9abjDYjLUL4g4A==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42c6tuwxeg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Oct 2024 20:04:13 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49LK4CbH006635
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Oct 2024 20:04:12 GMT
Received: from jhugo-lnx.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 21 Oct 2024 13:04:12 -0700
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
To: <andersson@kernel.org>, <jacek.lawrynowicz@linux.intel.com>,
 <quic_carlv@quicinc.com>
CC: <ogabbay@kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: [PATCH v2] accel/qaic: Add crashdump to Sahara
Date: Mon, 21 Oct 2024 14:03:55 -0600
Message-ID: <20241021200355.544126-1-quic_jhugo@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: lxQlAg6hj8h12Ut0CaE6PC6F_ZJ54831
X-Proofpoint-GUID: lxQlAg6hj8h12Ut0CaE6PC6F_ZJ54831
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxscore=0
 adultscore=0 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 clxscore=1015 suspectscore=0 mlxlogscore=999 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410210145
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

The Sahara protocol has a crashdump functionality. In the hello
exchange, the device can advertise it has a memory dump available for
the host to collect. Instead of the device making requests of the host,
the host requests data from the device which can be later analyzed.

Implement this functionality and utilize the devcoredump framework for
handing the dump over to userspace.

Similar to how firmware loading in Sahara involves multiple files,
crashdump can consist of multiple files for different parts of the dump.
Structure these into a single buffer that userspace can parse and
extract the original files from.

Reviewed-by: Carl Vanderlip <quic_carlv@quicinc.com>
Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
---

v2:
-Clarify the dump structure to userspace
-Use array notation for copying an array to the dump
-Use min() over trinary operator
-Remove extra return statement
-Remove extra cast
-Use all cpu_to_le operations when initializing a struct for clarity

 drivers/accel/qaic/sahara.c | 388 +++++++++++++++++++++++++++++++++++-
 1 file changed, 381 insertions(+), 7 deletions(-)

diff --git a/drivers/accel/qaic/sahara.c b/drivers/accel/qaic/sahara.c
index bf94bbab6be5..6d772143d612 100644
--- a/drivers/accel/qaic/sahara.c
+++ b/drivers/accel/qaic/sahara.c
@@ -2,6 +2,7 @@
 
 /* Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved. */
 
+#include <linux/devcoredump.h>
 #include <linux/firmware.h>
 #include <linux/limits.h>
 #include <linux/mhi.h>
@@ -9,6 +10,7 @@
 #include <linux/mod_devicetable.h>
 #include <linux/overflow.h>
 #include <linux/types.h>
+#include <linux/vmalloc.h>
 #include <linux/workqueue.h>
 
 #include "sahara.h"
@@ -36,12 +38,14 @@
 
 #define SAHARA_PACKET_MAX_SIZE		0xffffU /* MHI_MAX_MTU */
 #define SAHARA_TRANSFER_MAX_SIZE	0x80000
+#define SAHARA_READ_MAX_SIZE		0xfff0U /* Avoid unaligned requests */
 #define SAHARA_NUM_TX_BUF		DIV_ROUND_UP(SAHARA_TRANSFER_MAX_SIZE,\
 							SAHARA_PACKET_MAX_SIZE)
 #define SAHARA_IMAGE_ID_NONE		U32_MAX
 
 #define SAHARA_VERSION			2
 #define SAHARA_SUCCESS			0
+#define SAHARA_TABLE_ENTRY_STR_LEN	20
 
 #define SAHARA_MODE_IMAGE_TX_PENDING	0x0
 #define SAHARA_MODE_IMAGE_TX_COMPLETE	0x1
@@ -53,6 +57,8 @@
 #define SAHARA_END_OF_IMAGE_LENGTH	0x10
 #define SAHARA_DONE_LENGTH		0x8
 #define SAHARA_RESET_LENGTH		0x8
+#define SAHARA_MEM_DEBUG64_LENGTH	0x18
+#define SAHARA_MEM_READ64_LENGTH	0x18
 
 struct sahara_packet {
 	__le32 cmd;
@@ -80,18 +86,95 @@ struct sahara_packet {
 			__le32 image;
 			__le32 status;
 		} end_of_image;
+		struct {
+			__le64 table_address;
+			__le64 table_length;
+		} memory_debug64;
+		struct {
+			__le64 memory_address;
+			__le64 memory_length;
+		} memory_read64;
 	};
 };
 
+struct sahara_debug_table_entry64 {
+	__le64	type;
+	__le64	address;
+	__le64	length;
+	char	description[SAHARA_TABLE_ENTRY_STR_LEN];
+	char	filename[SAHARA_TABLE_ENTRY_STR_LEN];
+};
+
+struct sahara_dump_table_entry {
+	u64	type;
+	u64	address;
+	u64	length;
+	char	description[SAHARA_TABLE_ENTRY_STR_LEN];
+	char	filename[SAHARA_TABLE_ENTRY_STR_LEN];
+};
+
+#define SAHARA_DUMP_V1_MAGIC 0x1234567890abcdef
+#define SAHARA_DUMP_V1_VER   1
+struct sahara_memory_dump_meta_v1 {
+	u64	magic;
+	u64	version;
+	u64	dump_size;
+	u64	table_size;
+};
+
+/*
+ * Layout of crashdump provided to user via devcoredump
+ *              +------------------------------------------+
+ *              |         Crashdump Meta structure         |
+ *              | type: struct sahara_memory_dump_meta_v1  |
+ *              +------------------------------------------+
+ *              |             Crashdump Table              |
+ *              | type: array of struct                    |
+ *              |       sahara_dump_table_entry            |
+ *              |                                          |
+ *              |                                          |
+ *              +------------------------------------------+
+ *              |                Crashdump                 |
+ *              |                                          |
+ *              |                                          |
+ *              |                                          |
+ *              |                                          |
+ *              |                                          |
+ *              +------------------------------------------+
+ *
+ * First is the metadata header. Userspace can use the magic number to verify
+ * the content type, and then check the version for the rest of the format.
+ * New versions should keep the magic number location/value, and version
+ * location, but increment the version value.
+ *
+ * For v1, the metadata lists the size of the entire dump (header + table +
+ * dump) and the size of the table. Then the dump image table, which describes
+ * the contents of the dump. Finally all the images are listed in order, with
+ * no deadspace in between. Userspace can use the sizes listed in the image
+ * table to reconstruct the individual images.
+ */
+
 struct sahara_context {
 	struct sahara_packet		*tx[SAHARA_NUM_TX_BUF];
 	struct sahara_packet		*rx;
-	struct work_struct		work;
+	struct work_struct		fw_work;
+	struct work_struct		dump_work;
 	struct mhi_device		*mhi_dev;
 	const char			**image_table;
 	u32				table_size;
 	u32				active_image_id;
 	const struct firmware		*firmware;
+	u64				dump_table_address;
+	u64				dump_table_length;
+	size_t				rx_size;
+	size_t				rx_size_requested;
+	void				*mem_dump;
+	size_t				mem_dump_sz;
+	struct sahara_dump_table_entry	*dump_image;
+	u64				dump_image_offset;
+	void				*mem_dump_freespace;
+	u64				dump_images_left;
+	bool				is_mem_dump_mode;
 };
 
 static const char *aic100_image_table[] = {
@@ -153,6 +236,8 @@ static void sahara_send_reset(struct sahara_context *context)
 {
 	int ret;
 
+	context->is_mem_dump_mode = false;
+
 	context->tx[0]->cmd = cpu_to_le32(SAHARA_RESET_CMD);
 	context->tx[0]->length = cpu_to_le32(SAHARA_RESET_LENGTH);
 
@@ -186,7 +271,8 @@ static void sahara_hello(struct sahara_context *context)
 	}
 
 	if (le32_to_cpu(context->rx->hello.mode) != SAHARA_MODE_IMAGE_TX_PENDING &&
-	    le32_to_cpu(context->rx->hello.mode) != SAHARA_MODE_IMAGE_TX_COMPLETE) {
+	    le32_to_cpu(context->rx->hello.mode) != SAHARA_MODE_IMAGE_TX_COMPLETE &&
+	    le32_to_cpu(context->rx->hello.mode) != SAHARA_MODE_MEMORY_DEBUG) {
 		dev_err(&context->mhi_dev->dev, "Unsupported hello packet - mode %d\n",
 			le32_to_cpu(context->rx->hello.mode));
 		return;
@@ -320,9 +406,70 @@ static void sahara_end_of_image(struct sahara_context *context)
 		dev_dbg(&context->mhi_dev->dev, "Unable to send done response %d\n", ret);
 }
 
+static void sahara_memory_debug64(struct sahara_context *context)
+{
+	int ret;
+
+	dev_dbg(&context->mhi_dev->dev,
+		"MEMORY DEBUG64 cmd received. length:%d table_address:%#llx table_length:%#llx\n",
+		le32_to_cpu(context->rx->length),
+		le64_to_cpu(context->rx->memory_debug64.table_address),
+		le64_to_cpu(context->rx->memory_debug64.table_length));
+
+	if (le32_to_cpu(context->rx->length) != SAHARA_MEM_DEBUG64_LENGTH) {
+		dev_err(&context->mhi_dev->dev, "Malformed memory debug64 packet - length %d\n",
+			le32_to_cpu(context->rx->length));
+		return;
+	}
+
+	context->dump_table_address = le64_to_cpu(context->rx->memory_debug64.table_address);
+	context->dump_table_length = le64_to_cpu(context->rx->memory_debug64.table_length);
+
+	if (context->dump_table_length % sizeof(struct sahara_debug_table_entry64) != 0 ||
+	    !context->dump_table_length) {
+		dev_err(&context->mhi_dev->dev, "Malformed memory debug64 packet - table length %lld\n",
+			context->dump_table_length);
+		return;
+	}
+
+	/*
+	 * From this point, the protocol flips. We make memory_read requests to
+	 * the device, and the device responds with the raw data. If the device
+	 * has an error, it will send an End of Image command. First we need to
+	 * request the memory dump table so that we know where all the pieces
+	 * of the dump are that we can consume.
+	 */
+
+	context->is_mem_dump_mode = true;
+
+	/*
+	 * Assume that the table is smaller than our MTU so that we can read it
+	 * in one shot. The spec does not put an upper limit on the table, but
+	 * no known device will exceed this.
+	 */
+	if (context->dump_table_length > SAHARA_PACKET_MAX_SIZE) {
+		dev_err(&context->mhi_dev->dev, "Memory dump table length %lld exceeds supported size. Discarding dump\n",
+			context->dump_table_length);
+		sahara_send_reset(context);
+		return;
+	}
+
+	context->tx[0]->cmd = cpu_to_le32(SAHARA_MEM_READ64_CMD);
+	context->tx[0]->length = cpu_to_le32(SAHARA_MEM_READ64_LENGTH);
+	context->tx[0]->memory_read64.memory_address = cpu_to_le64(context->dump_table_address);
+	context->tx[0]->memory_read64.memory_length = cpu_to_le64(context->dump_table_length);
+
+	context->rx_size_requested = context->dump_table_length;
+
+	ret = mhi_queue_buf(context->mhi_dev, DMA_TO_DEVICE, context->tx[0],
+			    SAHARA_MEM_READ64_LENGTH, MHI_EOT);
+	if (ret)
+		dev_err(&context->mhi_dev->dev, "Unable to send read for dump table %d\n", ret);
+}
+
 static void sahara_processing(struct work_struct *work)
 {
-	struct sahara_context *context = container_of(work, struct sahara_context, work);
+	struct sahara_context *context = container_of(work, struct sahara_context, fw_work);
 	int ret;
 
 	switch (le32_to_cpu(context->rx->cmd)) {
@@ -338,6 +485,12 @@ static void sahara_processing(struct work_struct *work)
 	case SAHARA_DONE_RESP_CMD:
 		/* Intentional do nothing as we don't need to exit an app */
 		break;
+	case SAHARA_RESET_RESP_CMD:
+		/* Intentional do nothing as we don't need to exit an app */
+		break;
+	case SAHARA_MEM_DEBUG64_CMD:
+		sahara_memory_debug64(context);
+		break;
 	default:
 		dev_err(&context->mhi_dev->dev, "Unknown command %d\n",
 			le32_to_cpu(context->rx->cmd));
@@ -350,6 +503,217 @@ static void sahara_processing(struct work_struct *work)
 		dev_err(&context->mhi_dev->dev, "Unable to requeue rx buf %d\n", ret);
 }
 
+static void sahara_parse_dump_table(struct sahara_context *context)
+{
+	struct sahara_dump_table_entry *image_out_table;
+	struct sahara_debug_table_entry64 *dev_table;
+	struct sahara_memory_dump_meta_v1 *dump_meta;
+	u64 table_nents;
+	u64 dump_length;
+	int ret;
+	u64 i;
+
+	table_nents = context->dump_table_length / sizeof(*dev_table);
+	context->dump_images_left = table_nents;
+	dump_length = 0;
+
+	dev_table = (struct sahara_debug_table_entry64 *)(context->rx);
+	for (i = 0; i < table_nents; ++i) {
+		/* Do not trust the device, ensure the strings are terminated */
+		dev_table[i].description[SAHARA_TABLE_ENTRY_STR_LEN - 1] = 0;
+		dev_table[i].filename[SAHARA_TABLE_ENTRY_STR_LEN - 1] = 0;
+
+		dump_length = size_add(dump_length, le64_to_cpu(dev_table[i].length));
+		if (dump_length == SIZE_MAX) {
+			/* Discard the dump */
+			sahara_send_reset(context);
+			return;
+		}
+
+		dev_dbg(&context->mhi_dev->dev,
+			"Memory dump table entry %lld type: %lld address: %#llx length: %#llx description: \"%s\" filename \"%s\"\n",
+			i,
+			le64_to_cpu(dev_table[i].type),
+			le64_to_cpu(dev_table[i].address),
+			le64_to_cpu(dev_table[i].length),
+			dev_table[i].description,
+			dev_table[i].filename);
+	}
+
+	dump_length = size_add(dump_length, sizeof(*dump_meta));
+	if (dump_length == SIZE_MAX) {
+		/* Discard the dump */
+		sahara_send_reset(context);
+		return;
+	}
+	dump_length = size_add(dump_length, size_mul(sizeof(*image_out_table), table_nents));
+	if (dump_length == SIZE_MAX) {
+		/* Discard the dump */
+		sahara_send_reset(context);
+		return;
+	}
+
+	context->mem_dump_sz = dump_length;
+	context->mem_dump = vzalloc(dump_length);
+	if (!context->mem_dump) {
+		/* Discard the dump */
+		sahara_send_reset(context);
+		return;
+	}
+
+	/* Populate the dump metadata and table for userspace */
+	dump_meta = context->mem_dump;
+	dump_meta->magic = SAHARA_DUMP_V1_MAGIC;
+	dump_meta->version = SAHARA_DUMP_V1_VER;
+	dump_meta->dump_size = dump_length;
+	dump_meta->table_size = context->dump_table_length;
+
+	image_out_table = context->mem_dump + sizeof(*dump_meta);
+	for (i = 0; i < table_nents; ++i) {
+		image_out_table[i].type = le64_to_cpu(dev_table[i].type);
+		image_out_table[i].address = le64_to_cpu(dev_table[i].address);
+		image_out_table[i].length = le64_to_cpu(dev_table[i].length);
+		strscpy(image_out_table[i].description, dev_table[i].description,
+			SAHARA_TABLE_ENTRY_STR_LEN);
+		strscpy(image_out_table[i].filename,
+			dev_table[i].filename,
+			SAHARA_TABLE_ENTRY_STR_LEN);
+	}
+
+	context->mem_dump_freespace = &image_out_table[i];
+
+	/* Done parsing the table, switch to image dump mode */
+	context->dump_table_length = 0;
+
+	/* Request the first chunk of the first image */
+	context->dump_image = &image_out_table[0];
+	dump_length = min(context->dump_image->length, SAHARA_READ_MAX_SIZE);
+	/* Avoid requesting EOI sized data so that we can identify errors */
+	if (dump_length == SAHARA_END_OF_IMAGE_LENGTH)
+		dump_length = SAHARA_END_OF_IMAGE_LENGTH / 2;
+
+	context->dump_image_offset = dump_length;
+
+	context->tx[0]->cmd = cpu_to_le32(SAHARA_MEM_READ64_CMD);
+	context->tx[0]->length = cpu_to_le32(SAHARA_MEM_READ64_LENGTH);
+	context->tx[0]->memory_read64.memory_address = cpu_to_le64(context->dump_image->address);
+	context->tx[0]->memory_read64.memory_length = cpu_to_le64(dump_length);
+
+	context->rx_size_requested = dump_length;
+
+	ret = mhi_queue_buf(context->mhi_dev, DMA_TO_DEVICE, context->tx[0],
+			    SAHARA_MEM_READ64_LENGTH, MHI_EOT);
+	if (ret)
+		dev_err(&context->mhi_dev->dev, "Unable to send read for dump content %d\n", ret);
+}
+
+static void sahara_parse_dump_image(struct sahara_context *context)
+{
+	u64 dump_length;
+	int ret;
+
+	memcpy(context->mem_dump_freespace, context->rx, context->rx_size);
+	context->mem_dump_freespace += context->rx_size;
+
+	if (context->dump_image_offset >= context->dump_image->length) {
+		/* Need to move to next image */
+		context->dump_image++;
+		context->dump_images_left--;
+		context->dump_image_offset = 0;
+
+		if (!context->dump_images_left) {
+			/* Dump done */
+			dev_coredumpv(context->mhi_dev->mhi_cntrl->cntrl_dev,
+				      context->mem_dump,
+				      context->mem_dump_sz,
+				      GFP_KERNEL);
+			context->mem_dump = NULL;
+			sahara_send_reset(context);
+			return;
+		}
+	}
+
+	/* Get next image chunk */
+	dump_length = context->dump_image->length - context->dump_image_offset;
+	dump_length = min(dump_length, SAHARA_READ_MAX_SIZE);
+	/* Avoid requesting EOI sized data so that we can identify errors */
+	if (dump_length == SAHARA_END_OF_IMAGE_LENGTH)
+		dump_length = SAHARA_END_OF_IMAGE_LENGTH / 2;
+
+	context->tx[0]->cmd = cpu_to_le32(SAHARA_MEM_READ64_CMD);
+	context->tx[0]->length = cpu_to_le32(SAHARA_MEM_READ64_LENGTH);
+	context->tx[0]->memory_read64.memory_address =
+		cpu_to_le64(context->dump_image->address + context->dump_image_offset);
+	context->tx[0]->memory_read64.memory_length = cpu_to_le64(dump_length);
+
+	context->dump_image_offset += dump_length;
+	context->rx_size_requested = dump_length;
+
+	ret = mhi_queue_buf(context->mhi_dev, DMA_TO_DEVICE, context->tx[0],
+			    SAHARA_MEM_READ64_LENGTH, MHI_EOT);
+	if (ret)
+		dev_err(&context->mhi_dev->dev,
+			"Unable to send read for dump content %d\n", ret);
+}
+
+static void sahara_dump_processing(struct work_struct *work)
+{
+	struct sahara_context *context = container_of(work, struct sahara_context, dump_work);
+	int ret;
+
+	/*
+	 * We should get the expected raw data, but if the device has an error
+	 * it is supposed to send EOI with an error code.
+	 */
+	if (context->rx_size != context->rx_size_requested &&
+	    context->rx_size != SAHARA_END_OF_IMAGE_LENGTH) {
+		dev_err(&context->mhi_dev->dev,
+			"Unexpected response to read_data. Expected size: %#zx got: %#zx\n",
+			context->rx_size_requested,
+			context->rx_size);
+		goto error;
+	}
+
+	if (context->rx_size == SAHARA_END_OF_IMAGE_LENGTH &&
+	    le32_to_cpu(context->rx->cmd) == SAHARA_END_OF_IMAGE_CMD) {
+		dev_err(&context->mhi_dev->dev,
+			"Unexpected EOI response to read_data. Status: %d\n",
+			le32_to_cpu(context->rx->end_of_image.status));
+		goto error;
+	}
+
+	if (context->rx_size == SAHARA_END_OF_IMAGE_LENGTH &&
+	    le32_to_cpu(context->rx->cmd) != SAHARA_END_OF_IMAGE_CMD) {
+		dev_err(&context->mhi_dev->dev,
+			"Invalid EOI response to read_data. CMD: %d\n",
+			le32_to_cpu(context->rx->cmd));
+		goto error;
+	}
+
+	/*
+	 * Need to know if we received the dump table, or part of a dump image.
+	 * Since we get raw data, we cannot tell from the data itself. Instead,
+	 * we use the stored dump_table_length, which we zero after we read and
+	 * process the entire table.
+	 */
+	if (context->dump_table_length)
+		sahara_parse_dump_table(context);
+	else
+		sahara_parse_dump_image(context);
+
+	ret = mhi_queue_buf(context->mhi_dev, DMA_FROM_DEVICE, context->rx,
+			    SAHARA_PACKET_MAX_SIZE, MHI_EOT);
+	if (ret)
+		dev_err(&context->mhi_dev->dev, "Unable to requeue rx buf %d\n", ret);
+
+	return;
+
+error:
+	vfree(context->mem_dump);
+	context->mem_dump = NULL;
+	sahara_send_reset(context);
+}
+
 static int sahara_mhi_probe(struct mhi_device *mhi_dev, const struct mhi_device_id *id)
 {
 	struct sahara_context *context;
@@ -382,7 +746,8 @@ static int sahara_mhi_probe(struct mhi_device *mhi_dev, const struct mhi_device_
 	}
 
 	context->mhi_dev = mhi_dev;
-	INIT_WORK(&context->work, sahara_processing);
+	INIT_WORK(&context->fw_work, sahara_processing);
+	INIT_WORK(&context->dump_work, sahara_dump_processing);
 	context->image_table = aic100_image_table;
 	context->table_size = ARRAY_SIZE(aic100_image_table);
 	context->active_image_id = SAHARA_IMAGE_ID_NONE;
@@ -405,7 +770,10 @@ static void sahara_mhi_remove(struct mhi_device *mhi_dev)
 {
 	struct sahara_context *context = dev_get_drvdata(&mhi_dev->dev);
 
-	cancel_work_sync(&context->work);
+	cancel_work_sync(&context->fw_work);
+	cancel_work_sync(&context->dump_work);
+	if (context->mem_dump)
+		vfree(context->mem_dump);
 	sahara_release_image(context);
 	mhi_unprepare_from_transfer(mhi_dev);
 }
@@ -418,8 +786,14 @@ static void sahara_mhi_dl_xfer_cb(struct mhi_device *mhi_dev, struct mhi_result
 {
 	struct sahara_context *context = dev_get_drvdata(&mhi_dev->dev);
 
-	if (!mhi_result->transaction_status)
-		schedule_work(&context->work);
+	if (!mhi_result->transaction_status) {
+		context->rx_size = mhi_result->bytes_xferd;
+		if (context->is_mem_dump_mode)
+			schedule_work(&context->dump_work);
+		else
+			schedule_work(&context->fw_work);
+	}
+
 }
 
 static const struct mhi_device_id sahara_mhi_match_table[] = {
-- 
2.34.1

