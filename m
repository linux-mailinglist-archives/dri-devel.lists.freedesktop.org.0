Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A950C266CF
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 18:42:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E70310EBFD;
	Fri, 31 Oct 2025 17:42:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="JlSCWUTh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B46410EBFD
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 17:42:53 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59V9plfT1416929; Fri, 31 Oct 2025 17:42:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=jHW8hh/umhA
 mA9meCvqIXOWr+BKkaTUI8Yxz6jwMCAg=; b=JlSCWUTh7HavPYDrxTP8ObM6/7b
 mtnSL9jzuUIfy9UzpGpTN5/sEslW7Gt6Yz0Xdg3E+QG56zOqszIJiL8ga0S1vsSR
 cnkxcW2nRDC7gLddAhdK8IslktflwG1q+lNub8b14/4lQwAIg0tgobTB+YG19SVf
 71HvtK45zaZQ9Adjln3nx923GmTxsZb/XvRGfT8fmU0wqgq4iuDzsQp6w7MbjKp7
 8XhD33EuX9wXtUrQQx+P5lnErb41jG6633fEGQeDYSOyuV8Aj0remtgtz7sjB7sy
 sqYzZGicep/EkNAIr1YDrDO1PrOGYUtMRMOrg+CDo8QeDThWmrAmTsU3zjQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a4k69jkjm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 Oct 2025 17:42:43 +0000 (GMT)
Received: from pps.filterd (NALASPPMTA02.qualcomm.com [127.0.0.1])
 by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 59VHgYx6031222; 
 Fri, 31 Oct 2025 17:42:34 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA02.qualcomm.com (PPS) with ESMTPS id 4a4uyykc63-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 Oct 2025 17:42:34 +0000
Received: from NALASPPMTA02.qualcomm.com (NALASPPMTA02.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 59VHgY8Q031215;
 Fri, 31 Oct 2025 17:42:34 GMT
Received: from hu-devc-lv-u22-a.qualcomm.com (hu-zmckevit-lv.qualcomm.com
 [10.81.26.129])
 by NALASPPMTA02.qualcomm.com (PPS) with ESMTPS id 59VHgYod031212
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 Oct 2025 17:42:34 +0000
Received: by hu-devc-lv-u22-a.qualcomm.com (Postfix, from userid 4696302)
 id 10DDC5B6; Fri, 31 Oct 2025 10:42:34 -0700 (PDT)
From: Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>
To: jeff.hugo@oss.qualcomm.com, carl.vanderlip@oss.qualcomm.com,
 troy.hanson@oss.qualcomm.com, youssef.abdulrahman@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 andersson@kernel.org,
 Pranjal Ramajor Asha Kanojiya <pkanojiy@codeaurora.org>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>,
 Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>
Subject: [PATCH v3 3/3] accel/qaic: Collect crashdump from SSR channel
Date: Fri, 31 Oct 2025 10:41:04 -0700
Message-Id: <20251031174059.2814445-4-zachary.mckevitt@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251031174059.2814445-1-zachary.mckevitt@oss.qualcomm.com>
References: <20251031174059.2814445-1-zachary.mckevitt@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMxMDE1OCBTYWx0ZWRfX+JxVYytQC5Xp
 4ATauBwRkmTH5QDJZ1gB61wM/iqO1Pa3uvMxxgJ3buIUaxfkqt+mnea0/iv8ezf8fMfV2RdqO+K
 AiV9hf4K+tR2coTvL6gjyfNsM+iXonCShACVdTdegqGszCnDOIWT/UAYLK9AjVPnGNo7m5SJDHM
 vubAAW5/64C/lK7KoKO4peS2glVE2ui0Kl8oDoE0Y53BqfsS1x7r7VHwX4zydTi9opTELe4PdBv
 QItJqTvf4/ghK+6IgRQ2ZyS4iNoQ0RIedGQpSIiDUO2ou4tHvP18PW57oDah7RUpuxlnpY4dEzk
 D7+w0a1O52xhM83gnrmBW9/E3Q0Ri7MVHRryQbgDomNMaG1tTGDYPDUkuHqScRchZBaZyS8meZG
 JD8fgiX6YZ2t12DOkl6ANTVEPYtVhQ==
X-Authority-Analysis: v=2.4 cv=Bv2QAIX5 c=1 sm=1 tr=0 ts=6904f514 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=LpQP-O61AAAA:8 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=6nHViDiHFTo53XLtCswA:9 a=ghPhV6WU9XwBydbd:21
 a=pioyyrs4ZptJ924tMmac:22 a=TjNXssC_j7lpFel5tvFf:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: TmsTnEYjumB8VQUF9vW8f8blv9-idxcx
X-Proofpoint-ORIG-GUID: TmsTnEYjumB8VQUF9vW8f8blv9-idxcx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-31_06,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510310158
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

From: Pranjal Ramajor Asha Kanojiya <pkanojiy@codeaurora.org>

After subsystem of the device has crashed it sends a message with
command DEBUG_TRANSFER_INFO to kernel(host). Send ACK for that message
and then prepare to collect the ramdump of the subsystem

Steps of crashdump collection is as follows,
1)  Device sends DEBUG_TRANSFER_INFO message indicating that device wants
    to send crashdump.
2)  Send an acknowledgment to that message either ACK or NACK.
    a) NACK will inform the device that host will not download the
       crashdump
    b) ACK will inform the device that host will download the crashdump
3)  Along with the DEBUG_TRANSFER_INFO we receive a table base address and
    its length, use that to download that table from device.
    a) This table is meta data of the crashdump and not the actual
       crashdump.
4)  After we respond as ACK for message received on step 1) we start
    downloading the table. Use series of MEMORY_READ/MEMORY_READ_RSP SSR
    commands to download the entire table.
5)  Each entry in the table represents a segment of crashdump. Once the
    table downloading is complete, iterate through each entry of table
    and download each crashdump segment(same as table itself). Table entry
    contains the memory base address and length along with other info.
6)  After the entire crashdump is downloaded send DEBUG_TRANSFER_DONE
    which marks that host is terminating the crashdump transfer. This
    message can be send in both success or error case.
7)  After receiving DEBUG_TRANSFER_DONE_RSP hand over the crashdump to
    dev_coredumpv() and free all the necessary memory.

Co-developed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
Co-developed-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
Signed-off-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
Signed-off-by: Pranjal Ramajor Asha Kanojiya <pkanojiy@codeaurora.org>
Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
Signed-off-by: Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>
---
 drivers/accel/qaic/Kconfig    |   1 +
 drivers/accel/qaic/qaic.h     |   2 +
 drivers/accel/qaic/qaic_drv.c |   2 +-
 drivers/accel/qaic/qaic_ssr.c | 588 +++++++++++++++++++++++++++++++++-
 drivers/accel/qaic/qaic_ssr.h |   3 +-
 5 files changed, 578 insertions(+), 18 deletions(-)

diff --git a/drivers/accel/qaic/Kconfig b/drivers/accel/qaic/Kconfig
index 5e405a19c157..116e42d152ca 100644
--- a/drivers/accel/qaic/Kconfig
+++ b/drivers/accel/qaic/Kconfig
@@ -9,6 +9,7 @@ config DRM_ACCEL_QAIC
 	depends on PCI && HAS_IOMEM
 	depends on MHI_BUS
 	select CRC32
+	select WANT_DEV_COREDUMP
 	help
 	  Enables driver for Qualcomm's Cloud AI accelerator PCIe cards that are
 	  designed to accelerate Deep Learning inference workloads.
diff --git a/drivers/accel/qaic/qaic.h b/drivers/accel/qaic/qaic.h
index 02dfa854244b..527727947af6 100644
--- a/drivers/accel/qaic/qaic.h
+++ b/drivers/accel/qaic/qaic.h
@@ -200,6 +200,8 @@ struct qaic_device {
 	struct mhi_device	*ssr_ch;
 	/* Work queue for tasks related to MHI SSR device */
 	struct workqueue_struct	*ssr_wq;
+	/* Buffer to collect SSR crashdump via SSR MHI channel */
+	void			*ssr_mhi_buf;
 	/* DBC which is under SSR. Sentinel U32_MAX would mean that no SSR in progress */
 	u32			ssr_dbc;
 };
diff --git a/drivers/accel/qaic/qaic_drv.c b/drivers/accel/qaic/qaic_drv.c
index 5c7b739c16e6..8b8ca04ad47f 100644
--- a/drivers/accel/qaic/qaic_drv.c
+++ b/drivers/accel/qaic/qaic_drv.c
@@ -449,7 +449,7 @@ static struct qaic_device *create_qdev(struct pci_dev *pdev,
 	if (ret)
 		return NULL;
 
-	ret = qaic_ssr_init(qdev);
+	ret = qaic_ssr_init(qdev, drm);
 	if (ret)
 		pci_info(pdev, "QAIC SSR crashdump collection not supported.\n");
 
diff --git a/drivers/accel/qaic/qaic_ssr.c b/drivers/accel/qaic/qaic_ssr.c
index 6c691bbf4e37..615d725a419e 100644
--- a/drivers/accel/qaic/qaic_ssr.c
+++ b/drivers/accel/qaic/qaic_ssr.c
@@ -6,6 +6,7 @@
 #include <asm/byteorder.h>
 #include <drm/drm_file.h>
 #include <drm/drm_managed.h>
+#include <linux/devcoredump.h>
 #include <linux/device.h>
 #include <linux/kernel.h>
 #include <linux/mhi.h>
@@ -15,6 +16,9 @@
 #include "qaic_ssr.h"
 
 #define SSR_RESP_MSG_SZ 32
+#define SSR_MHI_BUF_SIZE SZ_64K
+#define SSR_MEM_READ_DATA_SIZE ((u64)SSR_MHI_BUF_SIZE - sizeof(struct ssr_crashdump))
+#define SSR_MEM_READ_CHUNK_SIZE ((u64)SSR_MEM_READ_DATA_SIZE - sizeof(struct ssr_memory_read_rsp))
 
 #define DEBUG_TRANSFER_INFO 		BIT(0)
 #define DEBUG_TRANSFER_INFO_RSP 	BIT(1)
@@ -31,6 +35,19 @@
 #define BEFORE_POWER_UP 	BIT(3)
 #define AFTER_POWER_UP 		BIT(4)
 
+struct debug_info_table {
+	/* Save preferences. Default is mandatory */
+	u64 save_perf;
+	/* Base address of the debug region */
+	u64 mem_base;
+	/* Size of debug region in bytes */
+	u64 len;
+	/* Description */
+	char desc[20];
+	/* Filename of debug region */
+	char filename[20];
+};
+
 struct _ssr_hdr {
 	__le32 cmd;
 	__le32 len;
@@ -43,11 +60,41 @@ struct ssr_hdr {
 	u32 dbc_id;
 };
 
+struct ssr_debug_transfer_info {
+	struct ssr_hdr hdr;
+	u32 resv;
+	u64 tbl_addr;
+	u64 tbl_len;
+} __packed;
+
 struct ssr_debug_transfer_info_rsp {
 	struct _ssr_hdr hdr;
 	__le32 ret;
 } __packed;
 
+struct ssr_memory_read {
+	struct _ssr_hdr hdr;
+	__le32 resv;
+	__le64 addr;
+	__le64 len;
+} __packed;
+
+struct ssr_memory_read_rsp {
+	struct _ssr_hdr hdr;
+	__le32 resv;
+	u8 data[];
+} __packed;
+
+struct ssr_debug_transfer_done {
+	struct _ssr_hdr hdr;
+	__le32 resv;
+} __packed;
+
+struct ssr_debug_transfer_done_rsp {
+	struct _ssr_hdr hdr;
+	__le32 ret;
+} __packed;
+
 struct ssr_event {
 	struct ssr_hdr hdr;
 	u32 event;
@@ -67,17 +114,453 @@ struct ssr_resp {
 	u8 data[] __aligned(8);
 };
 
+/* SSR crashdump book keeping structure */
+struct ssr_dump_info {
+	/* DBC associated with this SSR crashdump */
+	struct dma_bridge_chan *dbc;
+	/*
+	 * It will be used when we complete the crashdump download and switch
+	 * to waiting on SSR events
+	 */
+	struct ssr_resp *resp;
+	/* MEMORY READ request MHI buffer.*/
+	struct ssr_memory_read *read_buf_req;
+	/* TRUE: ->read_buf_req is queued for MHI transaction. FALSE: Otherwise */
+	bool read_buf_req_queued;
+	/* Address of table in host */
+	void *tbl_addr;
+	/* Total size of table */
+	u64 tbl_len;
+	/* Offset of table(->tbl_addr) where the new chunk will be dumped */
+	u64 tbl_off;
+	/* Address of table in device/target */
+	u64 tbl_addr_dev;
+	/* Ptr to the entire dump */
+	void *dump_addr;
+	/* Entire crashdump size */
+	u64 dump_sz;
+	/* Offset of crashdump(->dump_addr) where the new chunk will be dumped */
+	u64 dump_off;
+	/* Points to the table entry we are currently downloading */
+	struct debug_info_table *tbl_ent;
+	/* Offset in the current table entry(->tbl_ent) for next chuck */
+	u64 tbl_ent_off;
+};
+
+struct ssr_crashdump {
+	/*
+	 * Points to a book keeping struct maintained by MHI SSR device while
+	 * downloading a SSR crashdump. It is NULL when crashdump downloading
+	 * not in progress.
+	 */
+	struct ssr_dump_info *dump_info;
+	/* Work struct to schedule work coming on QAIC_SSR channel */
+	struct work_struct work;
+	/* Root struct of device, used to access device resources */
+	struct qaic_device *qdev;
+	/* Buffer used by MHI for transfer requests */
+	u8 data[];
+};
+
+#define QAIC_SSR_DUMP_V1_MAGIC 0x1234567890abcdef
+#define QAIC_SSR_DUMP_V1_VER   1
+struct dump_file_meta {
+	u64 magic;
+	u64 version;
+	u64 size;		/* Total size of the entire dump */
+	u64 tbl_len;		/* Length of the table in byte */
+};
+
+/*
+ * Layout of crashdump
+ *              +------------------------------------------+
+ *              |         Crashdump Meta structure         |
+ *              | type: struct dump_file_meta              |
+ *              +------------------------------------------+
+ *              |             Crashdump Table              |
+ *              | type: array of struct debug_info_table   |
+ *              |                                          |
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
+ */
+
+static void free_ssr_dump_info(struct ssr_crashdump *ssr_crash)
+{
+	struct ssr_dump_info *dump_info = ssr_crash->dump_info;
+
+	ssr_crash->dump_info = NULL;
+	if (!dump_info)
+		return;
+	if (!dump_info->read_buf_req_queued)
+		kfree(dump_info->read_buf_req);
+	vfree(dump_info->tbl_addr);
+	vfree(dump_info->dump_addr);
+	kfree(dump_info);
+}
+
 void qaic_clean_up_ssr(struct qaic_device *qdev)
 {
+	struct ssr_crashdump *ssr_crash = qdev->ssr_mhi_buf;
+
+	if (!ssr_crash)
+		return;
+
 	qaic_dbc_exit_ssr(qdev);
+	free_ssr_dump_info(ssr_crash);
+}
+
+static int alloc_dump(struct ssr_dump_info *dump_info)
+{
+	struct debug_info_table *tbl_ent = dump_info->tbl_addr;
+	struct dump_file_meta *dump_meta;
+	u64 tbl_sz_lp = 0;
+	u64 dump_size = 0;
+
+	while (tbl_sz_lp < dump_info->tbl_len) {
+		le64_to_cpus(&tbl_ent->save_perf);
+		le64_to_cpus(&tbl_ent->mem_base);
+		le64_to_cpus(&tbl_ent->len);
+
+		if (tbl_ent->len == 0)
+			return -EINVAL;
+
+		dump_size += tbl_ent->len;
+		tbl_ent++;
+		tbl_sz_lp += sizeof(*tbl_ent);
+	}
+
+	dump_info->dump_sz = dump_size + dump_info->tbl_len + sizeof(*dump_meta);
+	dump_info->dump_addr = vzalloc(dump_info->dump_sz);
+	if (!dump_info->dump_addr)
+		return -ENOMEM;
+
+	/* Copy crashdump meta and table */
+	dump_meta = dump_info->dump_addr;
+	dump_meta->magic = QAIC_SSR_DUMP_V1_MAGIC;
+	dump_meta->version = QAIC_SSR_DUMP_V1_VER;
+	dump_meta->size = dump_info->dump_sz;
+	dump_meta->tbl_len = dump_info->tbl_len;
+	memcpy(dump_info->dump_addr + sizeof(*dump_meta), dump_info->tbl_addr, dump_info->tbl_len);
+	/* Offset by crashdump meta and table (copied above) */
+	dump_info->dump_off = dump_info->tbl_len + sizeof(*dump_meta);
+
+	return 0;
+}
+
+static int send_xfer_done(struct qaic_device *qdev, void *resp, u32 dbc_id)
+{
+	struct ssr_debug_transfer_done *xfer_done;
+	int ret;
+
+	xfer_done = kmalloc(sizeof(*xfer_done), GFP_KERNEL);
+	if (!xfer_done) {
+		ret = -ENOMEM;
+		goto out;
+	}
+
+	ret = mhi_queue_buf(qdev->ssr_ch, DMA_FROM_DEVICE, resp, SSR_RESP_MSG_SZ, MHI_EOT);
+	if (ret)
+		goto free_xfer_done;
+
+	xfer_done->hdr.cmd = cpu_to_le32(DEBUG_TRANSFER_DONE);
+	xfer_done->hdr.len = cpu_to_le32(sizeof(*xfer_done));
+	xfer_done->hdr.dbc_id = cpu_to_le32(dbc_id);
+
+	ret = mhi_queue_buf(qdev->ssr_ch, DMA_TO_DEVICE, xfer_done, sizeof(*xfer_done), MHI_EOT);
+	if (ret)
+		goto free_xfer_done;
+
+	return 0;
+
+free_xfer_done:
+	kfree(xfer_done);
+out:
+	return ret;
+}
+
+static int mem_read_req(struct qaic_device *qdev, u64 dest_addr, u64 dest_len)
+{
+	struct ssr_crashdump *ssr_crash = qdev->ssr_mhi_buf;
+	struct ssr_memory_read *read_buf_req;
+	struct ssr_dump_info *dump_info;
+	int ret;
+
+	dump_info = ssr_crash->dump_info;
+	ret = mhi_queue_buf(qdev->ssr_ch, DMA_FROM_DEVICE, ssr_crash->data, SSR_MEM_READ_DATA_SIZE,
+			    MHI_EOT);
+	if (ret)
+		goto out;
+
+	read_buf_req = dump_info->read_buf_req;
+	read_buf_req->hdr.cmd = cpu_to_le32(MEMORY_READ);
+	read_buf_req->hdr.len = cpu_to_le32(sizeof(*read_buf_req));
+	read_buf_req->hdr.dbc_id = cpu_to_le32(qdev->ssr_dbc);
+	read_buf_req->addr = cpu_to_le64(dest_addr);
+	read_buf_req->len = cpu_to_le64(dest_len);
+
+	ret = mhi_queue_buf(qdev->ssr_ch, DMA_TO_DEVICE, read_buf_req, sizeof(*read_buf_req),
+			    MHI_EOT);
+	if (!ret)
+		dump_info->read_buf_req_queued = true;
+
+out:
+	return ret;
+}
+
+static int ssr_copy_table(struct ssr_dump_info *dump_info, void *data, u64 len)
+{
+	if (len > dump_info->tbl_len - dump_info->tbl_off)
+		return -EINVAL;
+
+	memcpy(dump_info->tbl_addr + dump_info->tbl_off, data, len);
+	dump_info->tbl_off += len;
+
+	/* Entire table has been downloaded, alloc dump memory */
+	if (dump_info->tbl_off == dump_info->tbl_len) {
+		dump_info->tbl_ent = dump_info->tbl_addr;
+		return alloc_dump(dump_info);
+	}
+
+	return 0;
+}
+
+static int ssr_copy_dump(struct ssr_dump_info *dump_info, void *data, u64 len)
+{
+	struct debug_info_table *tbl_ent;
+
+	tbl_ent = dump_info->tbl_ent;
+
+	if (len > tbl_ent->len - dump_info->tbl_ent_off)
+		return -EINVAL;
+
+	memcpy(dump_info->dump_addr + dump_info->dump_off, data, len);
+	dump_info->dump_off += len;
+	dump_info->tbl_ent_off += len;
+
+	/*
+	 * Current segment (a entry in table) of the crashdump is complete,
+	 * move to next one
+	 */
+	if (tbl_ent->len == dump_info->tbl_ent_off) {
+		dump_info->tbl_ent++;
+		dump_info->tbl_ent_off = 0;
+	}
+
+	return 0;
+}
+
+static void ssr_dump_worker(struct work_struct *work)
+{
+	struct ssr_crashdump *ssr_crash = container_of(work, struct ssr_crashdump, work);
+	struct qaic_device *qdev = ssr_crash->qdev;
+	struct ssr_memory_read_rsp *mem_rd_resp;
+	struct debug_info_table *tbl_ent;
+	struct ssr_dump_info *dump_info;
+	u64 dest_addr, dest_len;
+	struct _ssr_hdr *_hdr;
+	struct ssr_hdr hdr;
+	u64 data_len;
+	int ret;
+
+	mem_rd_resp = (struct ssr_memory_read_rsp *)ssr_crash->data;
+	_hdr = &mem_rd_resp->hdr;
+	hdr.cmd = le32_to_cpu(_hdr->cmd);
+	hdr.len = le32_to_cpu(_hdr->len);
+	hdr.dbc_id = le32_to_cpu(_hdr->dbc_id);
+
+	if (hdr.dbc_id != qdev->ssr_dbc)
+		goto reset_device;
+
+	dump_info = ssr_crash->dump_info;
+	if (!dump_info)
+		goto reset_device;
+
+	if (hdr.cmd != MEMORY_READ_RSP)
+		goto free_dump_info;
+
+	if (hdr.len > SSR_MEM_READ_DATA_SIZE)
+		goto free_dump_info;
+
+	data_len = hdr.len - sizeof(*mem_rd_resp);
+
+	if (dump_info->tbl_off < dump_info->tbl_len) /* Chunk belongs to table */
+		ret = ssr_copy_table(dump_info, mem_rd_resp->data, data_len);
+	else /* Chunk belongs to crashdump */
+		ret = ssr_copy_dump(dump_info, mem_rd_resp->data, data_len);
+
+	if (ret)
+		goto free_dump_info;
+
+	if (dump_info->tbl_off < dump_info->tbl_len) {
+		/* Continue downloading table */
+		dest_addr = dump_info->tbl_addr_dev + dump_info->tbl_off;
+		dest_len = min(SSR_MEM_READ_CHUNK_SIZE, dump_info->tbl_len - dump_info->tbl_off);
+		ret = mem_read_req(qdev, dest_addr, dest_len);
+	} else if (dump_info->dump_off < dump_info->dump_sz) {
+		/* Continue downloading crashdump */
+		tbl_ent = dump_info->tbl_ent;
+		dest_addr = tbl_ent->mem_base + dump_info->tbl_ent_off;
+		dest_len = min(SSR_MEM_READ_CHUNK_SIZE, tbl_ent->len - dump_info->tbl_ent_off);
+		ret = mem_read_req(qdev, dest_addr, dest_len);
+	} else {
+		/* Crashdump download complete */
+		ret = send_xfer_done(qdev, dump_info->resp->data, hdr.dbc_id);
+	}
+
+	/* Most likely a MHI xfer has failed */
+	if (ret)
+		goto free_dump_info;
+
+	return;
+
+free_dump_info:
+	/* Free the allocated memory */
+	free_ssr_dump_info(ssr_crash);
+reset_device:
+	/*
+	 * After subsystem crashes in device crashdump collection begins but
+	 * something went wrong while collecting crashdump, now instead of
+	 * handling this error we just reset the device as the best effort has
+	 * been made
+	 */
+	mhi_soc_reset(qdev->mhi_cntrl);
+}
+
+static struct ssr_dump_info *alloc_dump_info(struct qaic_device *qdev,
+					     struct ssr_debug_transfer_info *debug_info)
+{
+	struct ssr_dump_info *dump_info;
+	int ret;
+
+	le64_to_cpus(&debug_info->tbl_len);
+	le64_to_cpus(&debug_info->tbl_addr);
+
+	if (debug_info->tbl_len == 0 ||
+	    debug_info->tbl_len % sizeof(struct debug_info_table) != 0) {
+		ret = -EINVAL;
+		goto out;
+	}
+
+	/* Allocate SSR crashdump book keeping structure */
+	dump_info = kzalloc(sizeof(*dump_info), GFP_KERNEL);
+	if (!dump_info) {
+		ret = -ENOMEM;
+		goto out;
+	}
+
+	/* Buffer used to send MEMORY READ request to device via MHI */
+	dump_info->read_buf_req = kzalloc(sizeof(*dump_info->read_buf_req), GFP_KERNEL);
+	if (!dump_info->read_buf_req) {
+		ret = -ENOMEM;
+		goto free_dump_info;
+	}
+
+	/* Crashdump meta table buffer */
+	dump_info->tbl_addr = vzalloc(debug_info->tbl_len);
+	if (!dump_info->tbl_addr) {
+		ret = -ENOMEM;
+		goto free_read_buf_req;
+	}
+
+	dump_info->tbl_addr_dev = debug_info->tbl_addr;
+	dump_info->tbl_len = debug_info->tbl_len;
+
+	return dump_info;
+
+free_read_buf_req:
+	kfree(dump_info->read_buf_req);
+free_dump_info:
+	kfree(dump_info);
+out:
+	return ERR_PTR(ret);
+}
+
+static int dbg_xfer_info_rsp(struct qaic_device *qdev, struct dma_bridge_chan *dbc,
+			     struct ssr_debug_transfer_info *debug_info)
+{
+	struct ssr_debug_transfer_info_rsp *debug_rsp;
+	struct ssr_crashdump *ssr_crash = NULL;
+	int ret = 0, ret2;
+
+	debug_rsp = kmalloc(sizeof(*debug_rsp), GFP_KERNEL);
+	if (!debug_rsp)
+		return -ENOMEM;
+
+	if (!qdev->ssr_mhi_buf) {
+		ret = -ENOMEM;
+		goto send_rsp;
+	}
+
+	if (dbc->state != DBC_STATE_BEFORE_POWER_UP) {
+		ret = -EINVAL;
+		goto send_rsp;
+	}
+
+	ssr_crash = qdev->ssr_mhi_buf;
+	ssr_crash->dump_info = alloc_dump_info(qdev, debug_info);
+	if (IS_ERR(ssr_crash->dump_info)) {
+		ret = PTR_ERR(ssr_crash->dump_info);
+		ssr_crash->dump_info = NULL;
+	}
+
+send_rsp:
+	debug_rsp->hdr.cmd = cpu_to_le32(DEBUG_TRANSFER_INFO_RSP);
+	debug_rsp->hdr.len = cpu_to_le32(sizeof(*debug_rsp));
+	debug_rsp->hdr.dbc_id = cpu_to_le32(dbc->id);
+	/*
+	 * 0 = Return an ACK confirming the host is ready to download crashdump
+	 * 1 = Return an NACK confirming the host is not ready to download crashdump
+	 */
+	debug_rsp->ret = cpu_to_le32(ret ? 1 : 0);
+
+	ret2 = mhi_queue_buf(qdev->ssr_ch, DMA_TO_DEVICE, debug_rsp, sizeof(*debug_rsp), MHI_EOT);
+	if (ret2) {
+		free_ssr_dump_info(ssr_crash);
+		kfree(debug_rsp);
+		return ret2;
+	}
+
+	return ret;
+}
+
+static void dbg_xfer_done_rsp(struct qaic_device *qdev, struct dma_bridge_chan *dbc,
+			      struct ssr_debug_transfer_done_rsp *xfer_rsp)
+{
+	struct ssr_crashdump *ssr_crash = qdev->ssr_mhi_buf;
+	u32 status = le32_to_cpu(xfer_rsp->ret);
+	struct device *dev = &qdev->pdev->dev;
+	struct ssr_dump_info *dump_info;
+
+	dump_info = ssr_crash->dump_info;
+	if (!dump_info)
+		return;
+
+	if (status) {
+		free_ssr_dump_info(ssr_crash);
+		return;
+	}
+
+	dev_coredumpv(dev, dump_info->dump_addr, dump_info->dump_sz, GFP_KERNEL);
+	/* dev_coredumpv will free dump_info->dump_addr */
+	dump_info->dump_addr = NULL;
+	free_ssr_dump_info(ssr_crash);
 }
 
 static void ssr_worker(struct work_struct *work)
 {
 	struct ssr_resp *resp = container_of(work, struct ssr_resp, work);
 	struct ssr_hdr *hdr = (struct ssr_hdr *)resp->data;
-	struct ssr_debug_transfer_info_rsp *debug_rsp;
+	struct ssr_dump_info *dump_info = NULL;
 	struct qaic_device *qdev = resp->qdev;
+	struct ssr_crashdump *ssr_crash;
 	struct ssr_event_rsp *event_rsp;
 	struct dma_bridge_chan *dbc;
 	struct ssr_event *event;
@@ -98,27 +581,34 @@ static void ssr_worker(struct work_struct *work)
 
 	switch (hdr->cmd) {
 	case DEBUG_TRANSFER_INFO:
-		/* Decline crash dump request from the device */
-		debug_rsp = kmalloc(sizeof(*debug_rsp), GFP_KERNEL);
-		if (!debug_rsp)
+		ret = dbg_xfer_info_rsp(qdev, dbc, (struct ssr_debug_transfer_info *)resp->data);
+		if (ret)
 			break;
 
-		debug_rsp->hdr.cmd = cpu_to_le32(DEBUG_TRANSFER_INFO_RSP);
-		debug_rsp->hdr.len = cpu_to_le32(sizeof(*debug_rsp));
-		debug_rsp->hdr.dbc_id = cpu_to_le32(event->hdr.dbc_id);
-		debug_rsp->ret = cpu_to_le32(1);
+		ssr_crash = qdev->ssr_mhi_buf;
+		dump_info = ssr_crash->dump_info;
+		dump_info->dbc = dbc;
+		dump_info->resp = resp;
 
-		ret = mhi_queue_buf(qdev->ssr_ch, DMA_TO_DEVICE,
-				    debug_rsp, sizeof(*debug_rsp), MHI_EOT);
+		/* Start by downloading debug table */
+		ret = mem_read_req(qdev, dump_info->tbl_addr_dev,
+				   min(dump_info->tbl_len, SSR_MEM_READ_CHUNK_SIZE));
 		if (ret) {
-			pci_warn(qdev->pdev, "Could not send DEBUG_TRANSFER_INFO_RSP %d\n", ret);
-			kfree(debug_rsp);
+			free_ssr_dump_info(ssr_crash);
+			break;
 		}
+
+		/*
+		 * Till now everything went fine, which means that we will be
+		 * collecting crashdump chunk by chunk. Do not queue a response
+		 * buffer for SSR cmds till the crashdump is complete.
+		 */
 		return;
 	case SSR_EVENT:
 		event = (struct ssr_event *)hdr;
 		le32_to_cpus(&event->event);
 		ssr_event_ack = event->event;
+		ssr_crash = qdev->ssr_mhi_buf;
 
 		switch (event->event) {
 		case BEFORE_SHUTDOWN:
@@ -132,6 +622,18 @@ static void ssr_worker(struct work_struct *work)
 			set_dbc_state(qdev, hdr->dbc_id, DBC_STATE_BEFORE_POWER_UP);
 			break;
 		case AFTER_POWER_UP:
+			/*
+			 * If dump info is a non NULL value it means that we
+			 * have received this SSR event while downloading a
+			 * crashdump for this DBC is still in progress. NACK
+			 * the SSR event
+			 */
+			if (ssr_crash && ssr_crash->dump_info) {
+				free_ssr_dump_info(ssr_crash);
+				ssr_event_ack = SSR_EVENT_NACK;
+				break;
+			}
+
 			set_dbc_state(qdev, hdr->dbc_id, DBC_STATE_AFTER_POWER_UP);
 			break;
 		default:
@@ -152,11 +654,14 @@ static void ssr_worker(struct work_struct *work)
 		if (ret)
 			kfree(event_rsp);
 
-		if (event->event == AFTER_POWER_UP) {
+		if (event->event == AFTER_POWER_UP && ssr_event_ack != SSR_EVENT_NACK) {
 			qaic_dbc_exit_ssr(qdev);
 			set_dbc_state(qdev, hdr->dbc_id, DBC_STATE_IDLE);
 		}
 
+		break;
+	case DEBUG_TRANSFER_DONE_RSP:
+		dbg_xfer_done_rsp(qdev, dbc, (struct ssr_debug_transfer_done_rsp *)hdr);
 		break;
 	default:
 		break;
@@ -211,6 +716,31 @@ static void qaic_ssr_mhi_remove(struct mhi_device *mhi_dev)
 
 static void qaic_ssr_mhi_ul_xfer_cb(struct mhi_device *mhi_dev, struct mhi_result *mhi_result)
 {
+	struct qaic_device *qdev = dev_get_drvdata(&mhi_dev->dev);
+	struct ssr_crashdump *ssr_crash = qdev->ssr_mhi_buf;
+	struct _ssr_hdr *hdr = mhi_result->buf_addr;
+	struct ssr_dump_info *dump_info;
+
+	if (mhi_result->transaction_status) {
+		kfree(mhi_result->buf_addr);
+		return;
+	}
+
+	/*
+	 * MEMORY READ is used to download crashdump. And crashdump is
+	 * downloaded chunk by chunk in a series of MEMORY READ SSR commands.
+	 * Hence to avoid too many kmalloc() and kfree() of the same MEMORY READ
+	 * request buffer, we allocate only one such buffer and free it only
+	 * once.
+	 */
+	if (le32_to_cpu(hdr->cmd) == MEMORY_READ) {
+		dump_info = ssr_crash->dump_info;
+		if (dump_info) {
+			dump_info->read_buf_req_queued = false;
+			return;
+		}
+	}
+
 	kfree(mhi_result->buf_addr);
 }
 
@@ -218,12 +748,23 @@ static void qaic_ssr_mhi_dl_xfer_cb(struct mhi_device *mhi_dev, struct mhi_resul
 {
 	struct ssr_resp *resp = container_of(mhi_result->buf_addr, struct ssr_resp, data);
 	struct qaic_device *qdev = dev_get_drvdata(&mhi_dev->dev);
+	struct ssr_crashdump *ssr_crash = qdev->ssr_mhi_buf;
+	bool memory_read_rsp = false;
+
+	if (ssr_crash && ssr_crash->data == mhi_result->buf_addr)
+		memory_read_rsp = true;
 
 	if (mhi_result->transaction_status) {
-		kfree(resp);
+		/* Do not free SSR crashdump buffer as it allocated via managed APIs */
+		if (!memory_read_rsp)
+			kfree(resp);
 		return;
 	}
-	queue_work(qdev->ssr_wq, &resp->work);
+
+	if (memory_read_rsp)
+		queue_work(qdev->ssr_wq, &ssr_crash->work);
+	else
+		queue_work(qdev->ssr_wq, &resp->work);
 }
 
 static const struct mhi_device_id qaic_ssr_mhi_match_table[] = {
@@ -242,9 +783,24 @@ static struct mhi_driver qaic_ssr_mhi_driver = {
 	},
 };
 
-int qaic_ssr_init(struct qaic_device *qdev)
+int qaic_ssr_init(struct qaic_device *qdev, struct drm_device *drm)
 {
+	struct ssr_crashdump *ssr_crash;
+
 	qdev->ssr_dbc = QAIC_SSR_DBC_SENTINEL;
+
+	/*
+	 * Device requests only one SSR at a time. So allocating only one
+	 * buffer to download crashdump is good enough.
+	 */
+	ssr_crash = drmm_kzalloc(drm, SSR_MHI_BUF_SIZE, GFP_KERNEL);
+	if (!ssr_crash)
+		return -ENOMEM;
+
+	ssr_crash->qdev = qdev;
+	INIT_WORK(&ssr_crash->work, ssr_dump_worker);
+	qdev->ssr_mhi_buf = ssr_crash;
+
 	return 0;
 }
 
diff --git a/drivers/accel/qaic/qaic_ssr.h b/drivers/accel/qaic/qaic_ssr.h
index 02cd9ee1a483..97ccff305750 100644
--- a/drivers/accel/qaic/qaic_ssr.h
+++ b/drivers/accel/qaic/qaic_ssr.h
@@ -7,10 +7,11 @@
 #ifndef __QAIC_SSR_H__
 #define __QAIC_SSR_H__
 
+struct drm_device;
 struct qaic_device;
 
 int qaic_ssr_register(void);
 void qaic_ssr_unregister(void);
 void qaic_clean_up_ssr(struct qaic_device *qdev);
-int qaic_ssr_init(struct qaic_device *qdev);
+int qaic_ssr_init(struct qaic_device *qdev, struct drm_device *drm);
 #endif /* __QAIC_SSR_H__ */
-- 
2.34.1

