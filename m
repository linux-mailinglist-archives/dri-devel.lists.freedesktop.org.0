Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E8E39253ED
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2024 08:52:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AD4010E100;
	Wed,  3 Jul 2024 06:52:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="gec/Cd32";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB41810E100
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jul 2024 06:52:16 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4634MfdL026782;
 Wed, 3 Jul 2024 06:52:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=Wey2gPnwmY2OcGa3q4Houy
 XyhxUKSTaDIT7MKTAE7NA=; b=gec/Cd32rz5RRbsNViBwgs54gRDbjSqfVPcmSL
 Z5ryHaIW/m8lOVobjpB89gtJfFicusqaBtLqD4G4eRotb5XxitQ32AeXRPGnkOhK
 M/Fll5PTIq1EQdM0bOZTqL5ADFrUxcPODvp111v4j4J+VWm7sY0KbusX9+uWXjvf
 yqwhSFkagYzLEM3HC0qO9LMTD2Mn3icIzVzAsewOi0zESSRxCib9LOS5MxqymyHC
 bO1SRJxgUJiZSy41DpNbYRFU62kydxMO1MTeJHa2lThJxiMt2erCyPMjTwE9g8Y3
 4EzeJSJuCsrLscVsCyddpYbx3btsp5bZuQ/KpD974GHD53wg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 404yjhr8yx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 Jul 2024 06:52:12 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
 by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 4636qBYE014152
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 3 Jul 2024 06:52:11 GMT
Received: from hu-ekangupt-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 2 Jul 2024 23:52:08 -0700
From: Ekansh Gupta <quic_ekangupt@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <linux-arm-msm@vger.kernel.org>
CC: <gregkh@linuxfoundation.org>, <quic_bkumar@quicinc.com>,
 <linux-kernel@vger.kernel.org>, <quic_chennak@quicinc.com>,
 <dri-devel@lists.freedesktop.org>, <arnd@arndb.de>
Subject: [PATCH v1] misc: fastrpc: Add support for multiple PD from one process
Date: Wed, 3 Jul 2024 12:22:00 +0530
Message-ID: <20240703065200.1438145-1-quic_ekangupt@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 4ooK7fRs93bP16MVvvShFI6DBLsBI6ke
X-Proofpoint-ORIG-GUID: 4ooK7fRs93bP16MVvvShFI6DBLsBI6ke
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-03_03,2024-07-02_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0
 mlxlogscore=999 clxscore=1015 lowpriorityscore=0 suspectscore=0
 malwarescore=0 mlxscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407030049
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

Memory intensive applications(which requires more tha 4GB) that wants
to offload tasks to DSP might have to split the tasks to multiple
user PD to make the resources available. For every call to DSP,
fastrpc driver passes the process tgid which works as an identifier
for the DSP to enqueue the tasks to specific PD. With current design,
if any process opens device node more than once and makes PD init
request, same tgid will be passed to DSP which will be considered a
bad request and this will result in failure as the same identifier
cannot be used for multiple DSP PD. Allocate and pass an effective
pgid to DSP which would be allocated during device open and will have
a lifetime till the device is closed. This will allow the same process
to open the device more than once and spawn multiple dynamic PD for
ease of processing.

Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
---
 drivers/misc/fastrpc.c | 48 ++++++++++++++++++++++++++++++++++--------
 1 file changed, 39 insertions(+), 9 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 5204fda51da3..7250e30aa93f 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -105,6 +105,10 @@
 
 #define miscdev_to_fdevice(d) container_of(d, struct fastrpc_device, miscdev)
 
+#define MAX_DSP_PD	64
+#define MIN_FRPC_PGID	1000
+#define MAX_FRPC_PGID	(MIN_FRPC_PGID + MAX_DSP_PD)
+
 static const char *domains[FASTRPC_DEV_MAX] = { "adsp", "mdsp",
 						"sdsp", "cdsp"};
 struct fastrpc_phy_page {
@@ -268,6 +272,7 @@ struct fastrpc_channel_ctx {
 	struct fastrpc_session_ctx session[FASTRPC_MAX_SESSIONS];
 	spinlock_t lock;
 	struct idr ctx_idr;
+	struct ida dsp_pgid_ida;
 	struct list_head users;
 	struct kref refcount;
 	/* Flag if dsp attributes are cached */
@@ -299,6 +304,7 @@ struct fastrpc_user {
 	struct fastrpc_buf *init_mem;
 
 	int tgid;
+	int dsp_pgid;
 	int pd;
 	bool is_secure_dev;
 	/* Lock for lists */
@@ -462,6 +468,7 @@ static void fastrpc_channel_ctx_free(struct kref *ref)
 	struct fastrpc_channel_ctx *cctx;
 
 	cctx = container_of(ref, struct fastrpc_channel_ctx, refcount);
+	ida_destroy(&cctx->dsp_pgid_ida);
 
 	kfree(cctx);
 }
@@ -1114,7 +1121,7 @@ static int fastrpc_invoke_send(struct fastrpc_session_ctx *sctx,
 	int ret;
 
 	cctx = fl->cctx;
-	msg->pid = fl->tgid;
+	msg->pid = fl->dsp_pgid;
 	msg->tid = current->pid;
 
 	if (kernel)
@@ -1292,7 +1299,7 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
 		}
 	}
 
-	inbuf.pgid = fl->tgid;
+	inbuf.pgid = fl->dsp_pgid;
 	inbuf.namelen = init.namelen;
 	inbuf.pageslen = 0;
 	fl->pd = USER_PD;
@@ -1394,7 +1401,7 @@ static int fastrpc_init_create_process(struct fastrpc_user *fl,
 		goto err;
 	}
 
-	inbuf.pgid = fl->tgid;
+	inbuf.pgid = fl->dsp_pgid;
 	inbuf.namelen = strlen(current->comm) + 1;
 	inbuf.filelen = init.filelen;
 	inbuf.pageslen = 1;
@@ -1503,7 +1510,7 @@ static int fastrpc_release_current_dsp_process(struct fastrpc_user *fl)
 	int tgid = 0;
 	u32 sc;
 
-	tgid = fl->tgid;
+	tgid = fl->dsp_pgid;
 	args[0].ptr = (u64)(uintptr_t) &tgid;
 	args[0].length = sizeof(tgid);
 	args[0].fd = -1;
@@ -1528,6 +1535,9 @@ static int fastrpc_device_release(struct inode *inode, struct file *file)
 	list_del(&fl->user);
 	spin_unlock_irqrestore(&cctx->lock, flags);
 
+	if (fl->dsp_pgid != -1)
+		ida_free(&cctx->dsp_pgid_ida, fl->dsp_pgid);
+
 	if (fl->init_mem)
 		fastrpc_buf_free(fl->init_mem);
 
@@ -1554,6 +1564,19 @@ static int fastrpc_device_release(struct inode *inode, struct file *file)
 	return 0;
 }
 
+static int fastrpc_pgid_alloc(struct fastrpc_channel_ctx *cctx)
+{
+	int ret = -1;
+
+	/* allocate unique id between MIN_FRPC_PGID and MAX_FRPC_PGID */
+	ret = ida_alloc_range(&cctx->dsp_pgid_ida, MIN_FRPC_PGID,
+					MAX_FRPC_PGID, GFP_ATOMIC);
+	if (ret < 0)
+		return -1;
+
+	return ret;
+}
+
 static int fastrpc_device_open(struct inode *inode, struct file *filp)
 {
 	struct fastrpc_channel_ctx *cctx;
@@ -1582,6 +1605,12 @@ static int fastrpc_device_open(struct inode *inode, struct file *filp)
 	fl->cctx = cctx;
 	fl->is_secure_dev = fdevice->secure;
 
+	fl->dsp_pgid = fastrpc_pgid_alloc(cctx);
+	if (fl->dsp_pgid == -1) {
+		dev_dbg(&cctx->rpdev->dev, "too many fastrpc clients, max %u allowed\n", MAX_DSP_PD);
+		return -EUSERS;
+	}
+
 	fl->sctx = fastrpc_session_alloc(cctx);
 	if (!fl->sctx) {
 		dev_err(&cctx->rpdev->dev, "No session available\n");
@@ -1646,7 +1675,7 @@ static int fastrpc_dmabuf_alloc(struct fastrpc_user *fl, char __user *argp)
 static int fastrpc_init_attach(struct fastrpc_user *fl, int pd)
 {
 	struct fastrpc_invoke_args args[1];
-	int tgid = fl->tgid;
+	int tgid = fl->dsp_pgid;
 	u32 sc;
 
 	args[0].ptr = (u64)(uintptr_t) &tgid;
@@ -1802,7 +1831,7 @@ static int fastrpc_req_munmap_impl(struct fastrpc_user *fl, struct fastrpc_buf *
 	int err;
 	u32 sc;
 
-	req_msg.pgid = fl->tgid;
+	req_msg.pgid = fl->dsp_pgid;
 	req_msg.size = buf->size;
 	req_msg.vaddr = buf->raddr;
 
@@ -1888,7 +1917,7 @@ static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
 		return err;
 	}
 
-	req_msg.pgid = fl->tgid;
+	req_msg.pgid = fl->dsp_pgid;
 	req_msg.flags = req.flags;
 	req_msg.vaddr = req.vaddrin;
 	req_msg.num = sizeof(pages);
@@ -1978,7 +2007,7 @@ static int fastrpc_req_mem_unmap_impl(struct fastrpc_user *fl, struct fastrpc_me
 		return -EINVAL;
 	}
 
-	req_msg.pgid = fl->tgid;
+	req_msg.pgid = fl->dsp_pgid;
 	req_msg.len = map->len;
 	req_msg.vaddrin = map->raddr;
 	req_msg.fd = map->fd;
@@ -2031,7 +2060,7 @@ static int fastrpc_req_mem_map(struct fastrpc_user *fl, char __user *argp)
 		return err;
 	}
 
-	req_msg.pgid = fl->tgid;
+	req_msg.pgid = fl->dsp_pgid;
 	req_msg.fd = req.fd;
 	req_msg.offset = req.offset;
 	req_msg.vaddrin = req.vaddrin;
@@ -2375,6 +2404,7 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 	INIT_LIST_HEAD(&data->invoke_interrupted_mmaps);
 	spin_lock_init(&data->lock);
 	idr_init(&data->ctx_idr);
+	ida_init(&data->dsp_pgid_ida);
 	data->domain_id = domain_id;
 	data->rpdev = rpdev;
 
-- 
2.34.1

