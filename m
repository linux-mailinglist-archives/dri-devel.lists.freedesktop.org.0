Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3581AC9A2F6
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 07:07:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25DEF10E52C;
	Tue,  2 Dec 2025 06:07:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="EgQTegLm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 640BD10E52C
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Dec 2025 06:07:01 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5B1Ls8mT1491744; Tue, 2 Dec 2025 06:06:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=DhsOS29GZch
 pXLfo/BA0lDhYTuJAIj4h4tj6HU8EmXM=; b=EgQTegLmaxHi6On0mAoKZG9hHap
 ficMBkPfVSbLp7tZWDtz9jin+ZQ39iJSNMqCPkRNwJDgyfPQzJ62jLcliiCmLwYi
 GZLADqOdZmCoSdvpBjp1crBtXEdaNX3u3sMZsb6d5+hN8Lo2XpO5h666RDphGsho
 eoARStlqcdYHA8rESuUNAF65PZDjUAfD3s7jAjDRAe3ij32dQ4D/MvkACzakkgrg
 v+sBJm/8JMwi4VaDWpJwabQMMqzS2YL51vBqrfYnE9/voAAoEdcs+BWOYiyK3KHh
 TcvELMQ3ME3qwPtHDgY5KX37hWZwzF7NZcuRxsxUPTLyrldFQk2iXSFTtYw==
Received: from apblrppmta01.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4askbd15k3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Dec 2025 06:06:50 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
 by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5B266lMD002085; 
 Tue, 2 Dec 2025 06:06:47 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4aqswkhqep-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Dec 2025 06:06:47 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5B266k6U002076;
 Tue, 2 Dec 2025 06:06:46 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-kpallavi-hyd.qualcomm.com
 [10.147.243.7])
 by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 5B266kYF002074
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Dec 2025 06:06:46 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4720299)
 id 3A544570; Tue,  2 Dec 2025 11:36:45 +0530 (+0530)
From: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
To: kpallavi@qti.qualcomm.com, srini@kernel.org, amahesh@qti.qualcomm.com,
 arnd@arndb.de, gregkh@linuxfoundation.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org
Cc: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>, quic_bkumar@quicinc.com, 
 ekansh.gupta@oss.qualcomm.com, linux-kernel@vger.kernel.org,
 quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 jingyi.wang@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
 ktadakam@qti.qualcomm.com
Subject: [PATCH v5 2/4] misc: fastrpc: Rename phys to dma_addr for clarity
Date: Tue,  2 Dec 2025 11:36:26 +0530
Message-Id: <20251202060628.1869967-3-kumari.pallavi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251202060628.1869967-1-kumari.pallavi@oss.qualcomm.com>
References: <20251202060628.1869967-1-kumari.pallavi@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: ZNSYKVpNkmPJNFUOBX706VUezsEhlSW4
X-Proofpoint-GUID: ZNSYKVpNkmPJNFUOBX706VUezsEhlSW4
X-Authority-Analysis: v=2.4 cv=fLg0HJae c=1 sm=1 tr=0 ts=692e81fa cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=UZbHtQxcIr1JeRqDSmcA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAyMDA0NiBTYWx0ZWRfX7w7FneGFOrPG
 wXVY/MyM2xUgWTx98yqEAeEgjMLF9OadXCUudDCAElrbH8H5liIbawe+H7JzgEaZd++EV/crL45
 ANr8FagItTHvDGMrFw8iFqQxb339sZampXKpmzwrylAUNyWQmaV5G7BqCo12gU3LzBkDZ5FdaSW
 ixuV4RIXZpxxVXOhUHvXmSP0bD6CCEd9IoNyEVSgCsn+e6w7vR+qxqA6WmKeQN3gSjdzMoeog7o
 UrE0E6kPm9Ou8Rh4DW7xalKES/N2E8dtZUDdIZ1mB0XwZyjMfY0aKoHK3ZDDgWl9w86QvoOU+vB
 fca4IFK7iWmVmD5cPAxouGI7EcKdSlII9bQFQjpKVX2elfnhOJh1fnFJKNojEJ8Hw3F+QIy6Z1U
 9xTx9ilISlYI97DSJrIygjc/VX2JVw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 phishscore=0 adultscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512020046
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

Update all references of buf->phys and map->phys to buf->dma_addr and
map->dma_addr to accurately represent that these fields store DMA
addresses, not physical addresses. This change improves code clarity
and aligns with kernel conventions for dma_addr_t usage.

Signed-off-by: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 77 ++++++++++++++++++++++--------------------
 1 file changed, 41 insertions(+), 36 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index ee652ef01534..eb9501fe79bc 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -106,7 +106,7 @@
 #define miscdev_to_fdevice(d) container_of(d, struct fastrpc_device, miscdev)
 
 struct fastrpc_phy_page {
-	u64 addr;		/* physical address */
+	dma_addr_t addr;	/* dma address */
 	u64 size;		/* size of contiguous region */
 };
 
@@ -171,7 +171,7 @@ struct fastrpc_msg {
 	u64 ctx;		/* invoke caller context */
 	u32 handle;	/* handle to invoke */
 	u32 sc;		/* scalars structure describing the data */
-	u64 addr;		/* physical address */
+	dma_addr_t addr;	/* dma address */
 	u64 size;		/* size of contiguous region */
 };
 
@@ -194,7 +194,7 @@ struct fastrpc_buf {
 	struct dma_buf *dmabuf;
 	struct device *dev;
 	void *virt;
-	u64 phys;
+	dma_addr_t dma_addr;
 	u64 size;
 	/* Lock for dma buf attachments */
 	struct mutex lock;
@@ -217,7 +217,7 @@ struct fastrpc_map {
 	struct dma_buf *buf;
 	struct sg_table *table;
 	struct dma_buf_attachment *attach;
-	u64 phys;
+	dma_addr_t dma_addr;
 	u64 size;
 	void *va;
 	u64 len;
@@ -320,11 +320,12 @@ static void fastrpc_free_map(struct kref *ref)
 
 			perm.vmid = QCOM_SCM_VMID_HLOS;
 			perm.perm = QCOM_SCM_PERM_RWX;
-			err = qcom_scm_assign_mem(map->phys, map->len,
+			err = qcom_scm_assign_mem(map->dma_addr, map->len,
 				&src_perms, &perm, 1);
 			if (err) {
-				dev_err(map->fl->sctx->dev, "Failed to assign memory phys 0x%llx size 0x%llx err %d\n",
-						map->phys, map->len, err);
+				dev_err(map->fl->sctx->dev,
+					"Failed to assign memory dma_addr %pad size 0x%llx err %d\n",
+					&map->dma_addr, map->len, err);
 				return;
 			}
 		}
@@ -389,7 +390,7 @@ static int fastrpc_map_lookup(struct fastrpc_user *fl, int fd,
 static void fastrpc_buf_free(struct fastrpc_buf *buf)
 {
 	dma_free_coherent(buf->dev, buf->size, buf->virt,
-			  FASTRPC_PHYS(buf->phys));
+			  FASTRPC_PHYS(buf->dma_addr));
 	kfree(buf);
 }
 
@@ -408,12 +409,12 @@ static int __fastrpc_buf_alloc(struct fastrpc_user *fl, struct device *dev,
 
 	buf->fl = fl;
 	buf->virt = NULL;
-	buf->phys = 0;
+	buf->dma_addr = 0;
 	buf->size = size;
 	buf->dev = dev;
 	buf->raddr = 0;
 
-	buf->virt = dma_alloc_coherent(dev, buf->size, (dma_addr_t *)&buf->phys,
+	buf->virt = dma_alloc_coherent(dev, buf->size, &buf->dma_addr,
 				       GFP_KERNEL);
 	if (!buf->virt) {
 		mutex_destroy(&buf->lock);
@@ -439,7 +440,7 @@ static int fastrpc_buf_alloc(struct fastrpc_user *fl, struct device *dev,
 	buf = *obuf;
 
 	if (fl->sctx && fl->sctx->sid)
-		buf->phys += ((u64)fl->sctx->sid << 32);
+		buf->dma_addr += ((u64)fl->sctx->sid << 32);
 
 	return 0;
 }
@@ -684,7 +685,7 @@ static int fastrpc_dma_buf_attach(struct dma_buf *dmabuf,
 		return -ENOMEM;
 
 	ret = dma_get_sgtable(buffer->dev, &a->sgt, buffer->virt,
-			      FASTRPC_PHYS(buffer->phys), buffer->size);
+			      FASTRPC_PHYS(buffer->dma_addr), buffer->size);
 	if (ret < 0) {
 		dev_err(buffer->dev, "failed to get scatterlist from DMA API\n");
 		kfree(a);
@@ -733,7 +734,7 @@ static int fastrpc_mmap(struct dma_buf *dmabuf,
 	dma_resv_assert_held(dmabuf->resv);
 
 	return dma_mmap_coherent(buf->dev, vma, buf->virt,
-				 FASTRPC_PHYS(buf->phys), size);
+				 FASTRPC_PHYS(buf->dma_addr), size);
 }
 
 static const struct dma_buf_ops fastrpc_dma_buf_ops = {
@@ -785,10 +786,10 @@ static int fastrpc_map_attach(struct fastrpc_user *fl, int fd,
 	map->table = table;
 
 	if (attr & FASTRPC_ATTR_SECUREMAP) {
-		map->phys = sg_phys(map->table->sgl);
+		map->dma_addr = sg_phys(map->table->sgl);
 	} else {
-		map->phys = sg_dma_address(map->table->sgl);
-		map->phys += ((u64)fl->sctx->sid << 32);
+		map->dma_addr = sg_dma_address(map->table->sgl);
+		map->dma_addr += ((u64)fl->sctx->sid << 32);
 	}
 	for_each_sg(map->table->sgl, sgl, map->table->nents,
 		sgl_index)
@@ -815,10 +816,11 @@ static int fastrpc_map_attach(struct fastrpc_user *fl, int fd,
 		dst_perms[1].vmid = fl->cctx->vmperms[0].vmid;
 		dst_perms[1].perm = QCOM_SCM_PERM_RWX;
 		map->attr = attr;
-		err = qcom_scm_assign_mem(map->phys, (u64)map->len, &src_perms, dst_perms, 2);
+		err = qcom_scm_assign_mem(map->dma_addr, (u64)map->len, &src_perms, dst_perms, 2);
 		if (err) {
-			dev_err(sess->dev, "Failed to assign memory with phys 0x%llx size 0x%llx err %d\n",
-					map->phys, map->len, err);
+			dev_err(sess->dev,
+				"Failed to assign memory with dma_addr %pad size 0x%llx err %d\n",
+				&map->dma_addr, map->len, err);
 			goto map_err;
 		}
 	}
@@ -1009,7 +1011,7 @@ static int fastrpc_get_args(u32 kernel, struct fastrpc_invoke_ctx *ctx)
 			struct vm_area_struct *vma = NULL;
 
 			rpra[i].buf.pv = (u64) ctx->args[i].ptr;
-			pages[i].addr = ctx->maps[i]->phys;
+			pages[i].addr = ctx->maps[i]->dma_addr;
 
 			mmap_read_lock(current->mm);
 			vma = find_vma(current->mm, ctx->args[i].ptr);
@@ -1036,7 +1038,7 @@ static int fastrpc_get_args(u32 kernel, struct fastrpc_invoke_ctx *ctx)
 				goto bail;
 
 			rpra[i].buf.pv = args - ctx->olaps[oix].offset;
-			pages[i].addr = ctx->buf->phys -
+			pages[i].addr = ctx->buf->dma_addr -
 					ctx->olaps[oix].offset +
 					(pkt_size - rlen);
 			pages[i].addr = pages[i].addr &	PAGE_MASK;
@@ -1068,7 +1070,7 @@ static int fastrpc_get_args(u32 kernel, struct fastrpc_invoke_ctx *ctx)
 		list[i].num = ctx->args[i].length ? 1 : 0;
 		list[i].pgidx = i;
 		if (ctx->maps[i]) {
-			pages[i].addr = ctx->maps[i]->phys;
+			pages[i].addr = ctx->maps[i]->dma_addr;
 			pages[i].size = ctx->maps[i]->size;
 		}
 		rpra[i].dma.fd = ctx->args[i].fd;
@@ -1150,7 +1152,7 @@ static int fastrpc_invoke_send(struct fastrpc_session_ctx *sctx,
 	msg->ctx = ctx->ctxid | fl->pd;
 	msg->handle = handle;
 	msg->sc = ctx->sc;
-	msg->addr = ctx->buf ? ctx->buf->phys : 0;
+	msg->addr = ctx->buf ? ctx->buf->dma_addr : 0;
 	msg->size = roundup(ctx->msg_sz, PAGE_SIZE);
 	fastrpc_context_get(ctx);
 
@@ -1306,13 +1308,15 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
 		if (fl->cctx->vmcount) {
 			u64 src_perms = BIT(QCOM_SCM_VMID_HLOS);
 
-			err = qcom_scm_assign_mem(fl->cctx->remote_heap->phys,
+			err = qcom_scm_assign_mem(fl->cctx->remote_heap->dma_addr,
 							(u64)fl->cctx->remote_heap->size,
 							&src_perms,
 							fl->cctx->vmperms, fl->cctx->vmcount);
 			if (err) {
-				dev_err(fl->sctx->dev, "Failed to assign memory with phys 0x%llx size 0x%llx err %d\n",
-					fl->cctx->remote_heap->phys, fl->cctx->remote_heap->size, err);
+				dev_err(fl->sctx->dev,
+					"Failed to assign memory with dma_addr %pad size 0x%llx err %d\n",
+					&fl->cctx->remote_heap->dma_addr,
+					fl->cctx->remote_heap->size, err);
 				goto err_map;
 			}
 			scm_done = true;
@@ -1332,7 +1336,7 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
 	args[1].length = inbuf.namelen;
 	args[1].fd = -1;
 
-	pages[0].addr = fl->cctx->remote_heap->phys;
+	pages[0].addr = fl->cctx->remote_heap->dma_addr;
 	pages[0].size = fl->cctx->remote_heap->size;
 
 	args[2].ptr = (u64)(uintptr_t) pages;
@@ -1361,12 +1365,12 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
 
 		dst_perms.vmid = QCOM_SCM_VMID_HLOS;
 		dst_perms.perm = QCOM_SCM_PERM_RWX;
-		err = qcom_scm_assign_mem(fl->cctx->remote_heap->phys,
+		err = qcom_scm_assign_mem(fl->cctx->remote_heap->dma_addr,
 						(u64)fl->cctx->remote_heap->size,
 						&src_perms, &dst_perms, 1);
 		if (err)
-			dev_err(fl->sctx->dev, "Failed to assign memory phys 0x%llx size 0x%llx err %d\n",
-				fl->cctx->remote_heap->phys, fl->cctx->remote_heap->size, err);
+			dev_err(fl->sctx->dev, "Failed to assign memory dma_addr %pad size 0x%llx err %d\n",
+				&fl->cctx->remote_heap->dma_addr, fl->cctx->remote_heap->size, err);
 	}
 err_map:
 	fastrpc_buf_free(fl->cctx->remote_heap);
@@ -1455,7 +1459,7 @@ static int fastrpc_init_create_process(struct fastrpc_user *fl,
 	args[2].length = inbuf.filelen;
 	args[2].fd = init.filefd;
 
-	pages[0].addr = imem->phys;
+	pages[0].addr = imem->dma_addr;
 	pages[0].size = imem->size;
 
 	args[3].ptr = (u64)(uintptr_t) pages;
@@ -1913,7 +1917,7 @@ static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
 	args[0].ptr = (u64) (uintptr_t) &req_msg;
 	args[0].length = sizeof(req_msg);
 
-	pages.addr = buf->phys;
+	pages.addr = buf->dma_addr;
 	pages.size = buf->size;
 
 	args[1].ptr = (u64) (uintptr_t) &pages;
@@ -1941,11 +1945,12 @@ static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
 	if (req.flags == ADSP_MMAP_REMOTE_HEAP_ADDR && fl->cctx->vmcount) {
 		u64 src_perms = BIT(QCOM_SCM_VMID_HLOS);
 
-		err = qcom_scm_assign_mem(buf->phys, (u64)buf->size,
+		err = qcom_scm_assign_mem(buf->dma_addr, (u64)buf->size,
 			&src_perms, fl->cctx->vmperms, fl->cctx->vmcount);
 		if (err) {
-			dev_err(fl->sctx->dev, "Failed to assign memory phys 0x%llx size 0x%llx err %d",
-					buf->phys, buf->size, err);
+			dev_err(fl->sctx->dev,
+				"Failed to assign memory dma_addr %pad size 0x%llx err %d",
+				&buf->dma_addr, buf->size, err);
 			goto err_assign;
 		}
 	}
@@ -2059,7 +2064,7 @@ static int fastrpc_req_mem_map(struct fastrpc_user *fl, char __user *argp)
 	args[0].ptr = (u64) (uintptr_t) &req_msg;
 	args[0].length = sizeof(req_msg);
 
-	pages.addr = map->phys;
+	pages.addr = map->dma_addr;
 	pages.size = map->len;
 
 	args[1].ptr = (u64) (uintptr_t) &pages;
-- 
2.34.1

