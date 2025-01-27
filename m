Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED146A1D05D
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jan 2025 05:43:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6718610E2ED;
	Mon, 27 Jan 2025 04:43:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="NAqdDcK+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BC5510E2EC
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2025 04:43:01 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50R3TZ5P002702;
 Mon, 27 Jan 2025 04:42:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 7UwtQjBvoB+Dr3S9lh/xSyWx3AKsKVeEuZg0qEXzaSc=; b=NAqdDcK+AKp+zQ5Z
 LaHG5fFVHvgF8KeVaheJeAxZc0Eub73Zk4KUoQiYrKfFgjBEogUqHvzJFbv2ygxW
 Tfmpq0oI6YHcG9fmsvmyq+DIIiVXWDvTPwP0d0TMitiyaTRFHE7PwAwk4fOkyeyH
 d3iF0rESq8pQwjKDtPE2M4uuqiNXRVnGPtm6z1SKftxigFy7KzKFzWeKu4XWWZkX
 RHfWbfMOt9MRQBo1gQuIp53SAanrgzghtUwq+EFll+JDYoPIqlmfVlsi0bjXa93F
 FE1MT4sMzue5Y06PS8UDP76cMP4oIlFVK1HYXuioMBpGxYlxb384iY7PAlTqHkVU
 jBGWeg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44e29883en-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Jan 2025 04:42:56 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
 by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50R4gupw030078
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Jan 2025 04:42:56 GMT
Received: from hu-ekangupt-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 26 Jan 2025 20:42:53 -0800
From: Ekansh Gupta <quic_ekangupt@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <linux-arm-msm@vger.kernel.org>
CC: <gregkh@linuxfoundation.org>, <quic_bkumar@quicinc.com>,
 <linux-kernel@vger.kernel.org>, <quic_chennak@quicinc.com>,
 <dri-devel@lists.freedesktop.org>, <arnd@arndb.de>
Subject: [PATCH v2 2/5] misc: fastrpc: Introduce context params structure
Date: Mon, 27 Jan 2025 10:12:36 +0530
Message-ID: <20250127044239.578540-3-quic_ekangupt@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250127044239.578540-1-quic_ekangupt@quicinc.com>
References: <20250127044239.578540-1-quic_ekangupt@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: dJFFFWpOo40LmHrOzFNGqNhGV9XsisfD
X-Proofpoint-ORIG-GUID: dJFFFWpOo40LmHrOzFNGqNhGV9XsisfD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-27_01,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0
 mlxlogscore=999 lowpriorityscore=0 spamscore=0 malwarescore=0 phishscore=0
 suspectscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501270036
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

Add structure to invoke context parameterms. This structure is meant
to carry invoke context specific data. This structure is passed to
internal invocation call to save the data in context. Examples of
data intended to part of this structure are: CRC user memory address,
poll timeout for invoke call, call priority etc.

Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
---
 drivers/misc/fastrpc.c | 138 ++++++++++++++++++++++++++++++++++-------
 1 file changed, 117 insertions(+), 21 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 1a936d462519..c29d5536195e 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -254,6 +254,11 @@ struct fastrpc_invoke_ctx {
 	struct fastrpc_channel_ctx *cctx;
 };
 
+struct fastrpc_ctx_args {
+	struct fastrpc_invoke_args *args;
+	void __user *crc;
+};
+
 struct fastrpc_session_ctx {
 	struct device *dev;
 	int sid;
@@ -574,7 +579,7 @@ static void fastrpc_get_buff_overlaps(struct fastrpc_invoke_ctx *ctx)
 
 static struct fastrpc_invoke_ctx *fastrpc_context_alloc(
 			struct fastrpc_user *user, u32 kernel, u32 sc,
-			struct fastrpc_invoke_args *args)
+			struct fastrpc_ctx_args *cargs)
 {
 	struct fastrpc_channel_ctx *cctx = user->cctx;
 	struct fastrpc_invoke_ctx *ctx = NULL;
@@ -605,7 +610,7 @@ static struct fastrpc_invoke_ctx *fastrpc_context_alloc(
 			kfree(ctx);
 			return ERR_PTR(-ENOMEM);
 		}
-		ctx->args = args;
+		ctx->args = cargs->args;
 		fastrpc_get_buff_overlaps(ctx);
 	}
 
@@ -1133,7 +1138,7 @@ static int fastrpc_invoke_send(struct fastrpc_session_ctx *sctx,
 
 static int fastrpc_internal_invoke(struct fastrpc_user *fl,  u32 kernel,
 				   u32 handle, u32 sc,
-				   struct fastrpc_invoke_args *args)
+				   struct fastrpc_ctx_args *cargs)
 {
 	struct fastrpc_invoke_ctx *ctx = NULL;
 	struct fastrpc_buf *buf, *b;
@@ -1151,7 +1156,7 @@ static int fastrpc_internal_invoke(struct fastrpc_user *fl,  u32 kernel,
 		return -EPERM;
 	}
 
-	ctx = fastrpc_context_alloc(fl, kernel, sc, args);
+	ctx = fastrpc_context_alloc(fl, kernel, sc, cargs);
 	if (IS_ERR(ctx))
 		return PTR_ERR(ctx);
 
@@ -1233,6 +1238,7 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
 {
 	struct fastrpc_init_create_static init;
 	struct fastrpc_invoke_args *args;
+	struct fastrpc_ctx_args *cargs;
 	struct fastrpc_phy_page pages[1];
 	char *name;
 	int err;
@@ -1307,15 +1313,25 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
 	args[2].length = sizeof(*pages);
 	args[2].fd = -1;
 
+	cargs = kzalloc(sizeof(*cargs), GFP_KERNEL);
+	if (!cargs) {
+		err = -ENOMEM;
+		goto err_invoke;
+	}
+
+	cargs->args = args;
 	sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_CREATE_STATIC, 3, 0);
 
 	err = fastrpc_internal_invoke(fl, true, FASTRPC_INIT_HANDLE,
-				      sc, args);
-	if (err)
+				      sc, cargs);
+	if (err) {
+		kfree(cargs);
 		goto err_invoke;
+	}
 
 	kfree(args);
 	kfree(name);
+	kfree(cargs);
 
 	return 0;
 err_invoke:
@@ -1351,6 +1367,7 @@ static int fastrpc_init_create_process(struct fastrpc_user *fl,
 {
 	struct fastrpc_init_create init;
 	struct fastrpc_invoke_args *args;
+	struct fastrpc_ctx_args *cargs;
 	struct fastrpc_phy_page pages[1];
 	struct fastrpc_map *map = NULL;
 	struct fastrpc_buf *imem = NULL;
@@ -1438,16 +1455,26 @@ static int fastrpc_init_create_process(struct fastrpc_user *fl,
 	args[5].length = sizeof(inbuf.siglen);
 	args[5].fd = -1;
 
+	cargs = kzalloc(sizeof(*cargs), GFP_KERNEL);
+	if (!cargs) {
+		err = -ENOMEM;
+		goto err_invoke;
+	}
+
+	cargs->args = args;
 	sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_CREATE, 4, 0);
 	if (init.attrs)
 		sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_CREATE_ATTR, 4, 0);
 
 	err = fastrpc_internal_invoke(fl, true, FASTRPC_INIT_HANDLE,
-				      sc, args);
-	if (err)
+				      sc, cargs);
+	if (err) {
+		kfree(cargs);
 		goto err_invoke;
+	}
 
 	kfree(args);
+	kfree(cargs);
 
 	return 0;
 
@@ -1498,17 +1525,27 @@ static void fastrpc_session_free(struct fastrpc_channel_ctx *cctx,
 static int fastrpc_release_current_dsp_process(struct fastrpc_user *fl)
 {
 	struct fastrpc_invoke_args args[1];
-	int client_id = 0;
+	struct fastrpc_ctx_args *cargs;
+	int client_id = 0, err;
 	u32 sc;
 
 	client_id = fl->client_id;
 	args[0].ptr = (u64)(uintptr_t) &client_id;
 	args[0].length = sizeof(client_id);
 	args[0].fd = -1;
+
+	cargs = kzalloc(sizeof(*cargs), GFP_KERNEL);
+	if (!cargs)
+		return -ENOMEM;
+
+	cargs->args = args;
 	sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_RELEASE, 1, 0);
 
-	return fastrpc_internal_invoke(fl, true, FASTRPC_INIT_HANDLE,
-				       sc, &args[0]);
+	err = fastrpc_internal_invoke(fl, true, FASTRPC_INIT_HANDLE,
+				       sc, cargs);
+	kfree(cargs);
+
+	return err;
 }
 
 static int fastrpc_device_release(struct inode *inode, struct file *file)
@@ -1643,22 +1680,33 @@ static int fastrpc_dmabuf_alloc(struct fastrpc_user *fl, char __user *argp)
 static int fastrpc_init_attach(struct fastrpc_user *fl, int pd)
 {
 	struct fastrpc_invoke_args args[1];
-	int client_id = fl->client_id;
+	struct fastrpc_ctx_args *cargs;
+	int client_id = fl->client_id, err;
 	u32 sc;
 
 	args[0].ptr = (u64)(uintptr_t) &client_id;
 	args[0].length = sizeof(client_id);
 	args[0].fd = -1;
+
+	cargs = kzalloc(sizeof(*cargs), GFP_KERNEL);
+	if (!cargs)
+		return -ENOMEM;
+
+	cargs->args = args;
 	sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_ATTACH, 1, 0);
 	fl->pd = pd;
 
-	return fastrpc_internal_invoke(fl, true, FASTRPC_INIT_HANDLE,
-				       sc, &args[0]);
+	err = fastrpc_internal_invoke(fl, true, FASTRPC_INIT_HANDLE,
+				       sc, cargs);
+	kfree(cargs);
+
+	return err;
 }
 
 static int fastrpc_invoke(struct fastrpc_user *fl, char __user *argp)
 {
 	struct fastrpc_invoke_args *args = NULL;
+	struct fastrpc_ctx_args *cargs;
 	struct fastrpc_invoke inv;
 	u32 nscalars;
 	int err;
@@ -1679,9 +1727,16 @@ static int fastrpc_invoke(struct fastrpc_user *fl, char __user *argp)
 			return -EFAULT;
 		}
 	}
+	cargs = kzalloc(sizeof(*cargs), GFP_KERNEL);
+	if (!cargs) {
+		kfree(args);
+		return -ENOMEM;
+	}
 
-	err = fastrpc_internal_invoke(fl, false, inv.handle, inv.sc, args);
+	cargs->args = args;
+	err = fastrpc_internal_invoke(fl, false, inv.handle, inv.sc, cargs);
 	kfree(args);
+	kfree(cargs);
 
 	return err;
 }
@@ -1690,6 +1745,8 @@ static int fastrpc_get_info_from_dsp(struct fastrpc_user *fl, uint32_t *dsp_attr
 				     uint32_t dsp_attr_buf_len)
 {
 	struct fastrpc_invoke_args args[2] = { 0 };
+	struct fastrpc_ctx_args *cargs;
+	int err;
 
 	/*
 	 * Capability filled in userspace. This carries the information
@@ -1706,8 +1763,15 @@ static int fastrpc_get_info_from_dsp(struct fastrpc_user *fl, uint32_t *dsp_attr
 	args[1].length = dsp_attr_buf_len * sizeof(u32);
 	args[1].fd = -1;
 
-	return fastrpc_internal_invoke(fl, true, FASTRPC_DSP_UTILITIES_HANDLE,
-				       FASTRPC_SCALARS(0, 1, 1), args);
+	cargs = kzalloc(sizeof(*cargs), GFP_KERNEL);
+	if (!cargs)
+		return -ENOMEM;
+
+	cargs->args = args;
+	err = fastrpc_internal_invoke(fl, true, FASTRPC_DSP_UTILITIES_HANDLE,
+				       FASTRPC_SCALARS(0, 1, 1), cargs);
+	kfree(cargs);
+	return err;
 }
 
 static int fastrpc_get_info_from_kernel(struct fastrpc_ioctl_capability *cap,
@@ -1794,6 +1858,7 @@ static int fastrpc_get_dsp_info(struct fastrpc_user *fl, char __user *argp)
 static int fastrpc_req_munmap_impl(struct fastrpc_user *fl, struct fastrpc_buf *buf)
 {
 	struct fastrpc_invoke_args args[1] = { [0] = { 0 } };
+	struct fastrpc_ctx_args *cargs;
 	struct fastrpc_munmap_req_msg req_msg;
 	struct device *dev = fl->sctx->dev;
 	int err;
@@ -1806,9 +1871,14 @@ static int fastrpc_req_munmap_impl(struct fastrpc_user *fl, struct fastrpc_buf *
 	args[0].ptr = (u64) (uintptr_t) &req_msg;
 	args[0].length = sizeof(req_msg);
 
+	cargs = kzalloc(sizeof(*cargs), GFP_KERNEL);
+	if (!cargs)
+		return -ENOMEM;
+
+	cargs->args = args;
 	sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_MUNMAP, 1, 0);
 	err = fastrpc_internal_invoke(fl, true, FASTRPC_INIT_HANDLE, sc,
-				      &args[0]);
+				      cargs);
 	if (!err) {
 		dev_dbg(dev, "unmmap\tpt 0x%09lx OK\n", buf->raddr);
 		spin_lock(&fl->lock);
@@ -1818,6 +1888,7 @@ static int fastrpc_req_munmap_impl(struct fastrpc_user *fl, struct fastrpc_buf *
 	} else {
 		dev_err(dev, "unmmap\tpt 0x%09lx ERROR\n", buf->raddr);
 	}
+	kfree(cargs);
 
 	return err;
 }
@@ -1852,6 +1923,7 @@ static int fastrpc_req_munmap(struct fastrpc_user *fl, char __user *argp)
 static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
 {
 	struct fastrpc_invoke_args args[3] = { [0 ... 2] = { 0 } };
+	struct fastrpc_ctx_args *cargs;
 	struct fastrpc_buf *buf = NULL;
 	struct fastrpc_mmap_req_msg req_msg;
 	struct fastrpc_mmap_rsp_msg rsp_msg;
@@ -1902,12 +1974,18 @@ static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
 	args[2].ptr = (u64) (uintptr_t) &rsp_msg;
 	args[2].length = sizeof(rsp_msg);
 
+	cargs = kzalloc(sizeof(*cargs), GFP_KERNEL);
+	if (!cargs)
+		return -ENOMEM;
+
+	cargs->args = args;
 	sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_MMAP, 2, 1);
 	err = fastrpc_internal_invoke(fl, true, FASTRPC_INIT_HANDLE, sc,
-				      &args[0]);
+				      cargs);
 	if (err) {
 		dev_err(dev, "mmap error (len 0x%08llx)\n", buf->size);
 		fastrpc_buf_free(buf);
+		kfree(cargs);
 		return err;
 	}
 
@@ -1942,17 +2020,20 @@ static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
 	dev_dbg(dev, "mmap\t\tpt 0x%09lx OK [len 0x%08llx]\n",
 		buf->raddr, buf->size);
 
+	kfree(cargs);
 	return 0;
 
 err_assign:
 	fastrpc_req_munmap_impl(fl, buf);
 
+	kfree(cargs);
 	return err;
 }
 
 static int fastrpc_req_mem_unmap_impl(struct fastrpc_user *fl, struct fastrpc_mem_unmap *req)
 {
 	struct fastrpc_invoke_args args[1] = { [0] = { 0 } };
+	struct fastrpc_ctx_args *cargs;
 	struct fastrpc_map *map = NULL, *iter, *m;
 	struct fastrpc_mem_unmap_req_msg req_msg = { 0 };
 	int err = 0;
@@ -1982,14 +2063,21 @@ static int fastrpc_req_mem_unmap_impl(struct fastrpc_user *fl, struct fastrpc_me
 	args[0].ptr = (u64) (uintptr_t) &req_msg;
 	args[0].length = sizeof(req_msg);
 
+	cargs = kzalloc(sizeof(*cargs), GFP_KERNEL);
+	if (!cargs)
+		return -ENOMEM;
+
+	cargs->args = args;
 	sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_MEM_UNMAP, 1, 0);
 	err = fastrpc_internal_invoke(fl, true, FASTRPC_INIT_HANDLE, sc,
-				      &args[0]);
+				      cargs);
 	if (err) {
 		dev_err(dev, "unmmap\tpt fd = %d, 0x%09llx error\n",  map->fd, map->raddr);
+		kfree(cargs);
 		return err;
 	}
 	fastrpc_map_put(map);
+	kfree(cargs);
 
 	return 0;
 }
@@ -2007,6 +2095,7 @@ static int fastrpc_req_mem_unmap(struct fastrpc_user *fl, char __user *argp)
 static int fastrpc_req_mem_map(struct fastrpc_user *fl, char __user *argp)
 {
 	struct fastrpc_invoke_args args[4] = { [0 ... 3] = { 0 } };
+	struct fastrpc_ctx_args *cargs;
 	struct fastrpc_mem_map_req_msg req_msg = { 0 };
 	struct fastrpc_mmap_rsp_msg rsp_msg = { 0 };
 	struct fastrpc_mem_unmap req_unmap = { 0 };
@@ -2051,8 +2140,13 @@ static int fastrpc_req_mem_map(struct fastrpc_user *fl, char __user *argp)
 	args[3].ptr = (u64) (uintptr_t) &rsp_msg;
 	args[3].length = sizeof(rsp_msg);
 
+	cargs = kzalloc(sizeof(*cargs), GFP_KERNEL);
+	if (!cargs)
+		return -ENOMEM;
+
+	cargs->args = args;
 	sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_MEM_MAP, 3, 1);
-	err = fastrpc_internal_invoke(fl, true, FASTRPC_INIT_HANDLE, sc, &args[0]);
+	err = fastrpc_internal_invoke(fl, true, FASTRPC_INIT_HANDLE, sc, cargs);
 	if (err) {
 		dev_err(dev, "mem mmap error, fd %d, vaddr %llx, size %lld\n",
 			req.fd, req.vaddrin, map->size);
@@ -2072,11 +2166,13 @@ static int fastrpc_req_mem_map(struct fastrpc_user *fl, char __user *argp)
 		fastrpc_req_mem_unmap_impl(fl, &req_unmap);
 		return -EFAULT;
 	}
+	kfree(cargs);
 
 	return 0;
 
 err_invoke:
 	fastrpc_map_put(map);
+	kfree(cargs);
 
 	return err;
 }
-- 
2.34.1

