Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B08F8785E9
	for <lists+dri-devel@lfdr.de>; Mon, 11 Mar 2024 17:59:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 419C310E88D;
	Mon, 11 Mar 2024 16:59:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="PZXqQaxH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D72410E88D
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Mar 2024 16:59:06 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 42B7Rj48020804; Mon, 11 Mar 2024 16:59:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:content-type; s=
 qcppdkim1; bh=AkMKDVPBNraApdKcuSvUz7HmxQffLqjFXFhwiqP68oQ=; b=PZ
 XqQaxHR2Q7D2cQBXi0BBtlIysYL5XDfBDjwLP2Xktwcyw0VHS5Dvl2qpapwbamys
 JRup3sDc4leELHpGhadbwWybT7T4Z2SjMleIU5CJXVx/PeqrhQhfMhwSe89yROw9
 1NHAU85NIhVWW72DnB2OPUQ2iFE4VqPtB9JhItmsde1tcpfvFa7ST7L630cWDhkr
 gjWlllYNw1Co5rC6+NfLwLPMp2ZsGpPPTr+dDsTskvGtp7zWD6jydZeo84K0PFym
 fSNYuNDwc5sej+cJ1IWB1GW8b2Qoe05Lxmsnd6QjgUM+6biPabfJnLc5hJtDzipx
 fnIMApKpGJsNLH2dwmHQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wssyg1vsh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Mar 2024 16:59:03 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42BGx3Gw005516
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Mar 2024 16:59:03 GMT
Received: from jhugo-lnx.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Mon, 11 Mar 2024 09:59:02 -0700
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
To: <quic_carlv@quicinc.com>, <quic_pkanojiy@quicinc.com>,
 <stanislaw.gruszka@linux.intel.com>, <jacek.lawrynowicz@linux.intel.com>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <ogabbay@kernel.org>, Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: [PATCH 2/3] accel/qaic: Add fifo size debugfs
Date: Mon, 11 Mar 2024 10:58:25 -0600
Message-ID: <20240311165826.1728693-3-quic_jhugo@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240311165826.1728693-1-quic_jhugo@quicinc.com>
References: <20240311165826.1728693-1-quic_jhugo@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: ian2DhbPFQcrBr-uJA4q1bf1xWSb4_t3
X-Proofpoint-GUID: ian2DhbPFQcrBr-uJA4q1bf1xWSb4_t3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-11_10,2024-03-11_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0
 spamscore=0 lowpriorityscore=0 mlxscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 adultscore=0 impostorscore=0 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2402120000
 definitions=main-2403110129
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

Each DMA Bridge Channel (dbc) has a unique configured fifo size which is
specified by the userspace client of that dbc. Since the fifo is
circular, it is useful to know the configured size when debugging
issues.

Add a per-dbc subdirectory in debugfs and in each subdirectory add a
fifo_size entry that will display the size of that dbc's fifo when read.

Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
Reviewed-by: Carl Vanderlip <quic_carlv@quicinc.com>
Reviewed-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
---
 drivers/accel/qaic/qaic_debugfs.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/accel/qaic/qaic_debugfs.c b/drivers/accel/qaic/qaic_debugfs.c
index 4f87fe29be1a..9d56cd451b64 100644
--- a/drivers/accel/qaic/qaic_debugfs.c
+++ b/drivers/accel/qaic/qaic_debugfs.c
@@ -11,6 +11,7 @@
 #include <linux/mutex.h>
 #include <linux/pci.h>
 #include <linux/seq_file.h>
+#include <linux/sprintf.h>
 #include <linux/string.h>
 #include <linux/types.h>
 #include <linux/workqueue.h>
@@ -20,6 +21,7 @@
 
 #define BOOTLOG_POOL_SIZE		16
 #define BOOTLOG_MSG_SIZE		512
+#define QAIC_DBC_DIR_NAME		9
 
 struct bootlog_msg {
 	/* Buffer for bootlog messages */
@@ -74,14 +76,43 @@ static const struct file_operations bootlog_fops = {
 	.release = single_release,
 };
 
+static int read_dbc_fifo_size(struct seq_file *s, void *unused)
+{
+	struct dma_bridge_chan *dbc = s->private;
+
+	seq_printf(s, "%u\n", dbc->nelem);
+	return 0;
+}
+
+static int fifo_size_open(struct inode *inode, struct file *file)
+{
+	return single_open(file, read_dbc_fifo_size, inode->i_private);
+}
+
+static const struct file_operations fifo_size_fops = {
+	.owner = THIS_MODULE,
+	.open = fifo_size_open,
+	.read = seq_read,
+	.llseek = seq_lseek,
+	.release = single_release,
+};
+
 void qaic_debugfs_init(struct qaic_drm_device *qddev)
 {
 	struct qaic_device *qdev = qddev->qdev;
 	struct dentry *debugfs_root;
+	struct dentry *debugfs_dir;
+	char name[QAIC_DBC_DIR_NAME];
+	u32 i;
 
 	debugfs_root = to_drm(qddev)->debugfs_root;
 
 	debugfs_create_file("bootlog", 0400, debugfs_root, qdev, &bootlog_fops);
+	for (i = 0; i < qdev->num_dbc; ++i) {
+		snprintf(name, QAIC_DBC_DIR_NAME, "dbc%03u", i);
+		debugfs_dir = debugfs_create_dir(name, debugfs_root);
+		debugfs_create_file("fifo_size", 0400, debugfs_dir, &qdev->dbc[i], &fifo_size_fops);
+	}
 }
 
 static struct bootlog_page *alloc_bootlog_page(struct qaic_device *qdev)
-- 
2.34.1

