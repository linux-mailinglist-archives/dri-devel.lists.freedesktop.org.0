Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB4CC88725B
	for <lists+dri-devel@lfdr.de>; Fri, 22 Mar 2024 18:58:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BA351126A4;
	Fri, 22 Mar 2024 17:58:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="NDHiJjFE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1C851126A5
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Mar 2024 17:58:06 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 42M4rmhe002852; Fri, 22 Mar 2024 17:57:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:content-type; s=
 qcppdkim1; bh=Vb3/BhACQgd0Lkib5CeEds9ZFeODXFvmLDP5i/pngvM=; b=ND
 HiJjFEZN11ivWPcuHbRxerqwd32pFNOxHSispkMsnZO63AaeIh/w6yW+Lo5RllG3
 l812iCKkpZwZM5AqDez7n3FLlxIrWQxRPiAWSwfc2MqXK2yFsthYYHRg3ozW1pEZ
 Oqq7ttOXS5Jq9YFfaZ1ykbdh+Zs6AU20C8F0uf2cQlRJgAdq42d96TQg1EAayVSI
 Bw4Vfm9jNecL3kKeoclOy+dBC5s5VteQreRCmxyboJTxhti4b9fjcK9+tGSPo/W8
 VN4nAGPrIERyPAl1M2mQVTnrKsxaqQIWhvvQjsU3ZrPPzBRj/+bfDeAoWv6aTwzU
 sxSFpIEpn0scAS5s8NPA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x0wy8twpu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Mar 2024 17:57:57 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42MHvvxJ017334
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Mar 2024 17:57:57 GMT
Received: from jhugo-lnx.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Fri, 22 Mar 2024 10:57:56 -0700
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
To: <quic_carlv@quicinc.com>, <quic_pkanojiy@quicinc.com>,
 <stanislaw.gruszka@linux.intel.com>, <jacek.lawrynowicz@linux.intel.com>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <ogabbay@kernel.org>, Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: [PATCH v2 3/3] accel/qaic: Add fifo queued debugfs
Date: Fri, 22 Mar 2024 11:57:30 -0600
Message-ID: <20240322175730.3855440-4-quic_jhugo@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240322175730.3855440-1-quic_jhugo@quicinc.com>
References: <20240322175730.3855440-1-quic_jhugo@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: Y-b4l8VBwP9oCpCBwugK9r22QVeHBx9e
X-Proofpoint-GUID: Y-b4l8VBwP9oCpCBwugK9r22QVeHBx9e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-22_10,2024-03-21_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 malwarescore=0 impostorscore=0 phishscore=0 mlxlogscore=999 adultscore=0
 priorityscore=1501 mlxscore=0 spamscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403210001 definitions=main-2403220128
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

When debugging functional issues with workload input processing, it is
useful to know if requests are backing up in the fifo, or perhaps
getting stuck elsewhere. To answer the question of how many requests are
in the fifo, implement a "queued" debugfs entry per-dbc that returns the
number of pending requests when read.

Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
Reviewed-by: Carl Vanderlip <quic_carlv@quicinc.com>
Reviewed-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
Reviewed-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
---
 drivers/accel/qaic/qaic.h         |  1 +
 drivers/accel/qaic/qaic_data.c    |  9 +++++++++
 drivers/accel/qaic/qaic_debugfs.c | 31 +++++++++++++++++++++++++++++++
 3 files changed, 41 insertions(+)

diff --git a/drivers/accel/qaic/qaic.h b/drivers/accel/qaic/qaic.h
index 03d9c9fbffb3..02561b6cecc6 100644
--- a/drivers/accel/qaic/qaic.h
+++ b/drivers/accel/qaic/qaic.h
@@ -288,6 +288,7 @@ int disable_dbc(struct qaic_device *qdev, u32 dbc_id, struct qaic_user *usr);
 void enable_dbc(struct qaic_device *qdev, u32 dbc_id, struct qaic_user *usr);
 void wakeup_dbc(struct qaic_device *qdev, u32 dbc_id);
 void release_dbc(struct qaic_device *qdev, u32 dbc_id);
+void qaic_data_get_fifo_info(struct dma_bridge_chan *dbc, u32 *head, u32 *tail);
 
 void wake_all_cntl(struct qaic_device *qdev);
 void qaic_dev_reset_clean_local_state(struct qaic_device *qdev);
diff --git a/drivers/accel/qaic/qaic_data.c b/drivers/accel/qaic/qaic_data.c
index 2459fe4a3f95..e86e71c1cdd8 100644
--- a/drivers/accel/qaic/qaic_data.c
+++ b/drivers/accel/qaic/qaic_data.c
@@ -1981,3 +1981,12 @@ void release_dbc(struct qaic_device *qdev, u32 dbc_id)
 	dbc->in_use = false;
 	wake_up(&dbc->dbc_release);
 }
+
+void qaic_data_get_fifo_info(struct dma_bridge_chan *dbc, u32 *head, u32 *tail)
+{
+	if (!dbc || !head || !tail)
+		return;
+
+	*head = readl(dbc->dbc_base + REQHP_OFF);
+	*tail = readl(dbc->dbc_base + REQTP_OFF);
+}
diff --git a/drivers/accel/qaic/qaic_debugfs.c b/drivers/accel/qaic/qaic_debugfs.c
index b362960941d7..20b653d99e52 100644
--- a/drivers/accel/qaic/qaic_debugfs.c
+++ b/drivers/accel/qaic/qaic_debugfs.c
@@ -98,6 +98,36 @@ static const struct file_operations fifo_size_fops = {
 	.release = single_release,
 };
 
+static int read_dbc_queued(struct seq_file *s, void *unused)
+{
+	struct dma_bridge_chan *dbc = s->private;
+	u32 tail = 0, head = 0;
+
+	qaic_data_get_fifo_info(dbc, &head, &tail);
+
+	if (head == U32_MAX || tail == U32_MAX)
+		seq_printf(s, "%u\n", 0);
+	else if (head > tail)
+		seq_printf(s, "%u\n", dbc->nelem - head + tail);
+	else
+		seq_printf(s, "%u\n", tail - head);
+
+	return 0;
+}
+
+static int queued_open(struct inode *inode, struct file *file)
+{
+	return single_open(file, read_dbc_queued, inode->i_private);
+}
+
+static const struct file_operations queued_fops = {
+	.owner = THIS_MODULE,
+	.open = queued_open,
+	.read = seq_read,
+	.llseek = seq_lseek,
+	.release = single_release,
+};
+
 void qaic_debugfs_init(struct qaic_drm_device *qddev)
 {
 	struct qaic_device *qdev = qddev->qdev;
@@ -117,6 +147,7 @@ void qaic_debugfs_init(struct qaic_drm_device *qddev)
 		snprintf(name, QAIC_DBC_DIR_NAME, "dbc%03u", i);
 		debugfs_dir = debugfs_create_dir(name, debugfs_root);
 		debugfs_create_file("fifo_size", 0400, debugfs_dir, &qdev->dbc[i], &fifo_size_fops);
+		debugfs_create_file("queued", 0400, debugfs_dir, &qdev->dbc[i], &queued_fops);
 	}
 }
 
-- 
2.34.1

