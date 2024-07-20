Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09483937EDB
	for <lists+dri-devel@lfdr.de>; Sat, 20 Jul 2024 05:46:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9087510E068;
	Sat, 20 Jul 2024 03:46:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="KqQJTU0o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64ADC10E068
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Jul 2024 03:46:28 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46K1Q12J028062;
 Sat, 20 Jul 2024 03:46:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=340u2FOXO3S3W3/5NdlbPr
 e/LjBcWaN7PrV7X1dXLns=; b=KqQJTU0o7XpAsiynRINcOkdR6/jB/7o2mZ5vS4
 O9aGWbA28g3r47vdMRaY3QUSDzjOtVlA/+rldA3FzQ6HCY+w0JLDE84pkE1Hxq6z
 xQ4MdEuzhs+wH6Q9+vDVwpi2aiFmY1ZZ8syoMlsFF8PcUHeSXAdcXtpGQAa2me18
 WOXimb6zaqp6Iv2R0/UHvVHftY4NHMwPAkWZ7MWrT/ObaRY0omKt5E+PTjM78xPS
 RvMR5Vfrmo2YcnzmShSdKZKeaAOuEIpl2bHpu8IzipJD00f6GQoVECu+lrn5Nqwk
 ZCJjhoLbAQ0eIcCYmMqiunaJMQuPSTy44P9BbwCqjkRZTVoA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40g2kmr6ne-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 20 Jul 2024 03:46:23 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
 by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 46K3kMJC025364
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 20 Jul 2024 03:46:22 GMT
Received: from hu-ekangupt-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 19 Jul 2024 20:46:19 -0700
From: Ekansh Gupta <quic_ekangupt@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <linux-arm-msm@vger.kernel.org>
CC: <gregkh@linuxfoundation.org>, <quic_bkumar@quicinc.com>,
 <linux-kernel@vger.kernel.org>, <quic_chennak@quicinc.com>,
 <dri-devel@lists.freedesktop.org>, <arnd@arndb.de>
Subject: [PATCH v2] misc: fastrpc: Add support for multiple PD from one process
Date: Sat, 20 Jul 2024 09:16:11 +0530
Message-ID: <20240720034611.2219308-1-quic_ekangupt@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: k0Q9cgjlrq3YUzjaNzLa1WUU8R1PWBcY
X-Proofpoint-GUID: k0Q9cgjlrq3YUzjaNzLa1WUU8R1PWBcY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-20_01,2024-07-18_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0
 spamscore=0 mlxscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 adultscore=0 clxscore=1011 mlxlogscore=999 lowpriorityscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407200026
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
user PD to make the resources available.

For every call to DSP, fastrpc driver passes the process tgid which
works as an identifier for the DSP to enqueue the tasks to specific PD.
With current design, if any process opens device node more than once
and makes PD initmrequest, same tgid will be passed to DSP which will
be considered a bad request and this will result in failure as the same
identifier cannot be used for multiple DSP PD.

Allocate and pass an effective pgid to DSP which would be allocated
during device open and will have a lifetime till the device is closed.
This will allow the same process to open the device more than once and
spawn multiple dynamic PD for ease of processing.

Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
---
Changes in v2:
  - Reformatted commit text.
  - Moved from ida to idr.
  - Changed dsp_pgid data type.
  - Resolved memory leak.

 drivers/misc/fastrpc.c | 49 +++++++++++++++++++++++++++++++-----------
 1 file changed, 37 insertions(+), 12 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index a7a2bcedb37e..b4a5af2d2dfa 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -105,6 +105,10 @@
 
 #define miscdev_to_fdevice(d) container_of(d, struct fastrpc_device, miscdev)
 
+#define MAX_DSP_PD	64	/* Maximum 64 PDs are allowed on DSP */
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
+	struct idr dsp_pgid_idr;
 	struct list_head users;
 	struct kref refcount;
 	/* Flag if dsp attributes are cached */
@@ -298,7 +303,7 @@ struct fastrpc_user {
 	struct fastrpc_session_ctx *sctx;
 	struct fastrpc_buf *init_mem;
 
-	int tgid;
+	u16 dsp_pgid;
 	int pd;
 	bool is_secure_dev;
 	/* Lock for lists */
@@ -462,6 +467,7 @@ static void fastrpc_channel_ctx_free(struct kref *ref)
 	struct fastrpc_channel_ctx *cctx;
 
 	cctx = container_of(ref, struct fastrpc_channel_ctx, refcount);
+	idr_destroy(&cctx->dsp_pgid_idr);
 
 	kfree(cctx);
 }
@@ -613,7 +619,7 @@ static struct fastrpc_invoke_ctx *fastrpc_context_alloc(
 	ctx->sc = sc;
 	ctx->retval = -1;
 	ctx->pid = current->pid;
-	ctx->tgid = user->tgid;
+	ctx->tgid = user->dsp_pgid;
 	ctx->cctx = cctx;
 	init_completion(&ctx->work);
 	INIT_WORK(&ctx->put_work, fastrpc_context_put_wq);
@@ -1111,7 +1117,7 @@ static int fastrpc_invoke_send(struct fastrpc_session_ctx *sctx,
 	int ret;
 
 	cctx = fl->cctx;
-	msg->pid = fl->tgid;
+	msg->pid = fl->dsp_pgid;
 	msg->tid = current->pid;
 
 	if (kernel)
@@ -1294,7 +1300,7 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
 		}
 	}
 
-	inbuf.pgid = fl->tgid;
+	inbuf.pgid = fl->dsp_pgid;
 	inbuf.namelen = init.namelen;
 	inbuf.pageslen = 0;
 	fl->pd = USER_PD;
@@ -1396,7 +1402,7 @@ static int fastrpc_init_create_process(struct fastrpc_user *fl,
 		goto err;
 	}
 
-	inbuf.pgid = fl->tgid;
+	inbuf.pgid = fl->dsp_pgid;
 	inbuf.namelen = strlen(current->comm) + 1;
 	inbuf.filelen = init.filelen;
 	inbuf.pageslen = 1;
@@ -1505,7 +1511,7 @@ static int fastrpc_release_current_dsp_process(struct fastrpc_user *fl)
 	int tgid = 0;
 	u32 sc;
 
-	tgid = fl->tgid;
+	tgid = fl->dsp_pgid;
 	args[0].ptr = (u64)(uintptr_t) &tgid;
 	args[0].length = sizeof(tgid);
 	args[0].fd = -1;
@@ -1528,6 +1534,7 @@ static int fastrpc_device_release(struct inode *inode, struct file *file)
 
 	spin_lock_irqsave(&cctx->lock, flags);
 	list_del(&fl->user);
+	idr_remove(&cctx->dsp_pgid_idr, fl->dsp_pgid);
 	spin_unlock_irqrestore(&cctx->lock, flags);
 
 	if (fl->init_mem)
@@ -1562,6 +1569,7 @@ static int fastrpc_device_open(struct inode *inode, struct file *filp)
 	struct fastrpc_device *fdevice;
 	struct fastrpc_user *fl = NULL;
 	unsigned long flags;
+	int ret;
 
 	fdevice = miscdev_to_fdevice(filp->private_data);
 	cctx = fdevice->cctx;
@@ -1580,13 +1588,29 @@ static int fastrpc_device_open(struct inode *inode, struct file *filp)
 	INIT_LIST_HEAD(&fl->maps);
 	INIT_LIST_HEAD(&fl->mmaps);
 	INIT_LIST_HEAD(&fl->user);
-	fl->tgid = current->tgid;
 	fl->cctx = cctx;
 	fl->is_secure_dev = fdevice->secure;
 
+	spin_lock_irqsave(&cctx->lock, flags);
+	/* allocate unique id between MIN_FRPC_PGID and MAX_FRPC_PGID */
+	ret = idr_alloc_cyclic(&cctx->dsp_pgid_idr, NULL, MIN_FRPC_PGID,
+					MAX_FRPC_PGID, GFP_ATOMIC);
+	if (ret < 0) {
+		dev_dbg(&cctx->rpdev->dev, "too many fastrpc clients, max %u allowed\n", MAX_DSP_PD);
+		spin_unlock_irqrestore(&cctx->lock, flags);
+		mutex_destroy(&fl->mutex);
+		kfree(fl);
+		return ret;
+	}
+	fl->dsp_pgid = ret;
+	spin_unlock_irqrestore(&cctx->lock, flags);
+
 	fl->sctx = fastrpc_session_alloc(cctx);
 	if (!fl->sctx) {
 		dev_err(&cctx->rpdev->dev, "No session available\n");
+		spin_lock_irqsave(&cctx->lock, flags);
+		idr_remove(&cctx->dsp_pgid_idr, fl->dsp_pgid);
+		spin_unlock_irqrestore(&cctx->lock, flags);
 		mutex_destroy(&fl->mutex);
 		kfree(fl);
 
@@ -1648,7 +1672,7 @@ static int fastrpc_dmabuf_alloc(struct fastrpc_user *fl, char __user *argp)
 static int fastrpc_init_attach(struct fastrpc_user *fl, int pd)
 {
 	struct fastrpc_invoke_args args[1];
-	int tgid = fl->tgid;
+	int tgid = fl->dsp_pgid;
 	u32 sc;
 
 	args[0].ptr = (u64)(uintptr_t) &tgid;
@@ -1804,7 +1828,7 @@ static int fastrpc_req_munmap_impl(struct fastrpc_user *fl, struct fastrpc_buf *
 	int err;
 	u32 sc;
 
-	req_msg.pgid = fl->tgid;
+	req_msg.pgid = fl->dsp_pgid;
 	req_msg.size = buf->size;
 	req_msg.vaddr = buf->raddr;
 
@@ -1890,7 +1914,7 @@ static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
 		return err;
 	}
 
-	req_msg.pgid = fl->tgid;
+	req_msg.pgid = fl->dsp_pgid;
 	req_msg.flags = req.flags;
 	req_msg.vaddr = req.vaddrin;
 	req_msg.num = sizeof(pages);
@@ -1980,7 +2004,7 @@ static int fastrpc_req_mem_unmap_impl(struct fastrpc_user *fl, struct fastrpc_me
 		return -EINVAL;
 	}
 
-	req_msg.pgid = fl->tgid;
+	req_msg.pgid = fl->dsp_pgid;
 	req_msg.len = map->len;
 	req_msg.vaddrin = map->raddr;
 	req_msg.fd = map->fd;
@@ -2033,7 +2057,7 @@ static int fastrpc_req_mem_map(struct fastrpc_user *fl, char __user *argp)
 		return err;
 	}
 
-	req_msg.pgid = fl->tgid;
+	req_msg.pgid = fl->dsp_pgid;
 	req_msg.fd = req.fd;
 	req_msg.offset = req.offset;
 	req_msg.vaddrin = req.vaddrin;
@@ -2358,6 +2382,7 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 	INIT_LIST_HEAD(&data->invoke_interrupted_mmaps);
 	spin_lock_init(&data->lock);
 	idr_init(&data->ctx_idr);
+	idr_init(&data->dsp_pgid_idr);
 	data->domain_id = domain_id;
 	data->rpdev = rpdev;
 
-- 
2.34.1

