Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 141289DFAE2
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2024 07:48:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2757510E40F;
	Mon,  2 Dec 2024 06:48:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="od3QabDy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B84110E40F
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Dec 2024 06:48:25 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B20tA8s009354;
 Mon, 2 Dec 2024 06:48:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 zT+GIBNpmgwwevHBDfBThQ6x8xSQwD7RKTI6XYPXGcA=; b=od3QabDyMqhh1dPF
 r/GQbnSx7IjFS+q8yTZFqG+wVRKiz+EfU0+aO7tKSSgyFENooO72WFfZF7YTa0EM
 Yrmpm7/Fn0oirLWj/olghsUrgARfDVIg//zJ9a8IzjT2Nzsr4Q8t85qlLx0oUxai
 S2wf5Abubs4NGY/7O8K+5ijxK2pkWOZaH/OEwWNG8U29ZO6f4Kvz8Q5IgwzRlTiC
 NvqfNIQBT720EOSPRQn1QEnAomsBxkpAvO1vE+2z2ENuWQYXDnmsoErgBssyOaLF
 4iLmlT0kanOrY5D1AZm59JldUjeC7ujDY9UMMWc5zwgCn5oYM4SgE6A+SHW9fg9k
 APrlVg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 437ta2umrf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 02 Dec 2024 06:48:21 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
 by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B26mKds007598
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 2 Dec 2024 06:48:20 GMT
Received: from hu-ekangupt-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 1 Dec 2024 22:48:17 -0800
From: Ekansh Gupta <quic_ekangupt@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <linux-arm-msm@vger.kernel.org>
CC: <gregkh@linuxfoundation.org>, <quic_bkumar@quicinc.com>,
 <linux-kernel@vger.kernel.org>, <quic_chennak@quicinc.com>,
 <dri-devel@lists.freedesktop.org>, <arnd@arndb.de>
Subject: [PATCH v5 1/2] misc: fastrpc: Add support for multiple PD from one
 process
Date: Mon, 2 Dec 2024 12:18:05 +0530
Message-ID: <20241202064806.1164800-2-quic_ekangupt@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241202064806.1164800-1-quic_ekangupt@quicinc.com>
References: <20241202064806.1164800-1-quic_ekangupt@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: lzzVLWrsUe406S3Omy5HMb6RLUnjHzti
X-Proofpoint-GUID: lzzVLWrsUe406S3Omy5HMb6RLUnjHzti
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 mlxscore=0 impostorscore=0
 malwarescore=0 adultscore=0 priorityscore=1501 mlxlogscore=999
 phishscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412020058
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
and makes PD init request, same tgid will be passed to DSP which will
be considered a bad request and this will result in failure as the same
identifier cannot be used for multiple DSP PD.

Assign and pass a client ID to DSP which would be assigned during device
open and will be dependent on the index of session allocated for the PD.
This will allow the same process to open the device more than once and
spawn multiple dynamic PD for ease of processing.

Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
---
 drivers/misc/fastrpc.c | 29 +++++++++++++++--------------
 1 file changed, 15 insertions(+), 14 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 412683e0ea86..de6d423ff0b6 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -299,7 +299,7 @@ struct fastrpc_user {
 	struct fastrpc_session_ctx *sctx;
 	struct fastrpc_buf *init_mem;
 
-	int tgid;
+	int client_id;
 	int pd;
 	bool is_secure_dev;
 	/* Lock for lists */
@@ -614,7 +614,7 @@ static struct fastrpc_invoke_ctx *fastrpc_context_alloc(
 	ctx->sc = sc;
 	ctx->retval = -1;
 	ctx->pid = current->pid;
-	ctx->tgid = user->tgid;
+	ctx->tgid = user->client_id;
 	ctx->cctx = cctx;
 	init_completion(&ctx->work);
 	INIT_WORK(&ctx->put_work, fastrpc_context_put_wq);
@@ -1115,7 +1115,7 @@ static int fastrpc_invoke_send(struct fastrpc_session_ctx *sctx,
 	int ret;
 
 	cctx = fl->cctx;
-	msg->pid = fl->tgid;
+	msg->pid = fl->client_id;
 	msg->tid = current->pid;
 
 	if (kernel)
@@ -1293,7 +1293,7 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
 		}
 	}
 
-	inbuf.pgid = fl->tgid;
+	inbuf.pgid = fl->client_id;
 	inbuf.namelen = init.namelen;
 	inbuf.pageslen = 0;
 	fl->pd = USER_PD;
@@ -1395,7 +1395,7 @@ static int fastrpc_init_create_process(struct fastrpc_user *fl,
 		goto err;
 	}
 
-	inbuf.pgid = fl->tgid;
+	inbuf.pgid = fl->client_id;
 	inbuf.namelen = strlen(current->comm) + 1;
 	inbuf.filelen = init.filelen;
 	inbuf.pageslen = 1;
@@ -1469,8 +1469,9 @@ static int fastrpc_init_create_process(struct fastrpc_user *fl,
 }
 
 static struct fastrpc_session_ctx *fastrpc_session_alloc(
-					struct fastrpc_channel_ctx *cctx)
+					struct fastrpc_user *fl)
 {
+	struct fastrpc_channel_ctx *cctx = fl->cctx;
 	struct fastrpc_session_ctx *session = NULL;
 	unsigned long flags;
 	int i;
@@ -1480,6 +1481,7 @@ static struct fastrpc_session_ctx *fastrpc_session_alloc(
 		if (!cctx->session[i].used && cctx->session[i].valid) {
 			cctx->session[i].used = true;
 			session = &cctx->session[i];
+			fl->client_id = i + 1;
 			break;
 		}
 	}
@@ -1504,7 +1506,7 @@ static int fastrpc_release_current_dsp_process(struct fastrpc_user *fl)
 	int tgid = 0;
 	u32 sc;
 
-	tgid = fl->tgid;
+	tgid = fl->client_id;
 	args[0].ptr = (u64)(uintptr_t) &tgid;
 	args[0].length = sizeof(tgid);
 	args[0].fd = -1;
@@ -1579,11 +1581,10 @@ static int fastrpc_device_open(struct inode *inode, struct file *filp)
 	INIT_LIST_HEAD(&fl->maps);
 	INIT_LIST_HEAD(&fl->mmaps);
 	INIT_LIST_HEAD(&fl->user);
-	fl->tgid = current->tgid;
 	fl->cctx = cctx;
 	fl->is_secure_dev = fdevice->secure;
 
-	fl->sctx = fastrpc_session_alloc(cctx);
+	fl->sctx = fastrpc_session_alloc(fl);
 	if (!fl->sctx) {
 		dev_err(&cctx->rpdev->dev, "No session available\n");
 		mutex_destroy(&fl->mutex);
@@ -1647,7 +1648,7 @@ static int fastrpc_dmabuf_alloc(struct fastrpc_user *fl, char __user *argp)
 static int fastrpc_init_attach(struct fastrpc_user *fl, int pd)
 {
 	struct fastrpc_invoke_args args[1];
-	int tgid = fl->tgid;
+	int tgid = fl->client_id;
 	u32 sc;
 
 	args[0].ptr = (u64)(uintptr_t) &tgid;
@@ -1803,7 +1804,7 @@ static int fastrpc_req_munmap_impl(struct fastrpc_user *fl, struct fastrpc_buf *
 	int err;
 	u32 sc;
 
-	req_msg.pgid = fl->tgid;
+	req_msg.pgid = fl->client_id;
 	req_msg.size = buf->size;
 	req_msg.vaddr = buf->raddr;
 
@@ -1889,7 +1890,7 @@ static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
 		return err;
 	}
 
-	req_msg.pgid = fl->tgid;
+	req_msg.pgid = fl->client_id;
 	req_msg.flags = req.flags;
 	req_msg.vaddr = req.vaddrin;
 	req_msg.num = sizeof(pages);
@@ -1978,7 +1979,7 @@ static int fastrpc_req_mem_unmap_impl(struct fastrpc_user *fl, struct fastrpc_me
 		return -EINVAL;
 	}
 
-	req_msg.pgid = fl->tgid;
+	req_msg.pgid = fl->client_id;
 	req_msg.len = map->len;
 	req_msg.vaddrin = map->raddr;
 	req_msg.fd = map->fd;
@@ -2031,7 +2032,7 @@ static int fastrpc_req_mem_map(struct fastrpc_user *fl, char __user *argp)
 		return err;
 	}
 
-	req_msg.pgid = fl->tgid;
+	req_msg.pgid = fl->client_id;
 	req_msg.fd = req.fd;
 	req_msg.offset = req.offset;
 	req_msg.vaddrin = req.vaddrin;
-- 
2.34.1

