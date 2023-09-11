Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 524CB79A153
	for <lists+dri-devel@lfdr.de>; Mon, 11 Sep 2023 04:31:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6801110E0C6;
	Mon, 11 Sep 2023 02:31:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 142FF10E0C3
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Sep 2023 02:31:46 +0000 (UTC)
X-UUID: 5738bc82504b11ee8051498923ad61e6-20230911
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=tMh5czTlXeLunU6sQyq8tkPZ3p5euo92ArNQwmCGL9o=; 
 b=lIejvzNmqM53jcptvfpuIic/CQ08Mkqf+bk1n3aRFJGC5OEZamM+TQf+J6K0g236eFm44lJV8hxyQxQaC6nAc4x5U+nlaRVfETHw/jagUtTb0xeBLWQRqYU2g9t5FZgHRZt6pIvzqtgY4ty7ELmyQj38G7xt6gRCZf60zewosCc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31, REQID:4d99d4c7-62f9-4699-ba57-fadb528e93b3, IP:0,
 U
 RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:-5
X-CID-META: VersionHash:0ad78a4, CLOUDID:0c0bdec2-1e57-4345-9d31-31ad9818b39f,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
 DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 5738bc82504b11ee8051498923ad61e6-20230911
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw02.mediatek.com (envelope-from <yong.wu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1344026967; Mon, 11 Sep 2023 10:31:41 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.194) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 11 Sep 2023 10:31:39 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 11 Sep 2023 10:31:38 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
 <christian.koenig@amd.com>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH 6/9] dma-buf: heaps: mtk_sec_heap: Add tee service call for
 buffer allocating/freeing
Date: Mon, 11 Sep 2023 10:30:35 +0800
Message-ID: <20230911023038.30649-7-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230911023038.30649-1-yong.wu@mediatek.com>
References: <20230911023038.30649-1-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
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
Cc: Anan Sun <anan.sun@mediatek.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, jianjiao.zeng@mediatek.com,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, kuohong.wang@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 tjmercier@google.com, linaro-mm-sig@lists.linaro.org,
 John Stultz <jstultz@google.com>, linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
 Yong Wu <yong.wu@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add TEE service call for secure memory allocating/freeing.

Signed-off-by: Anan Sun <anan.sun@mediatek.com>
Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
 drivers/dma-buf/heaps/mtk_secure_heap.c | 69 ++++++++++++++++++++++++-
 1 file changed, 68 insertions(+), 1 deletion(-)

diff --git a/drivers/dma-buf/heaps/mtk_secure_heap.c b/drivers/dma-buf/heaps/mtk_secure_heap.c
index e3da33a3d083..14c2a16a7164 100644
--- a/drivers/dma-buf/heaps/mtk_secure_heap.c
+++ b/drivers/dma-buf/heaps/mtk_secure_heap.c
@@ -17,6 +17,9 @@
 
 #define MTK_TEE_PARAM_NUM		4
 
+#define TZCMD_MEM_SECURECM_UNREF	7
+#define TZCMD_MEM_SECURECM_ZALLOC	15
+
 /*
  * MediaTek secure (chunk) memory type
  *
@@ -29,6 +32,8 @@ enum kree_mem_type {
 struct mtk_secure_heap_buffer {
 	struct dma_heap		*heap;
 	size_t			size;
+
+	u32			sec_handle;
 };
 
 struct mtk_secure_heap {
@@ -80,6 +85,63 @@ static int mtk_kree_secure_session_init(struct mtk_secure_heap *sec_heap)
 	return ret;
 }
 
+static int
+mtk_sec_mem_tee_service_call(struct tee_context *tee_ctx, u32 session,
+			     unsigned int command, struct tee_param *params)
+{
+	struct tee_ioctl_invoke_arg arg = {0};
+	int ret;
+
+	arg.num_params = MTK_TEE_PARAM_NUM;
+	arg.session = session;
+	arg.func = command;
+
+	ret = tee_client_invoke_func(tee_ctx, &arg, params);
+	if (ret < 0 || arg.ret) {
+		pr_err("%s: cmd %d ret %d:%x.\n", __func__, command, ret, arg.ret);
+		ret = -EOPNOTSUPP;
+	}
+	return ret;
+}
+
+static int mtk_sec_mem_allocate(struct mtk_secure_heap *sec_heap,
+				struct mtk_secure_heap_buffer *sec_buf)
+{
+	struct tee_param params[MTK_TEE_PARAM_NUM] = {0};
+	u32 mem_session = sec_heap->mem_session;
+	int ret;
+
+	params[0].attr = TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT;
+	params[0].u.value.a = SZ_4K;			/* alignment */
+	params[0].u.value.b = sec_heap->mem_type;	/* memory type */
+	params[1].attr = TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT;
+	params[1].u.value.a = sec_buf->size;
+	params[2].attr = TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INOUT;
+
+	/* Always request zeroed buffer */
+	ret = mtk_sec_mem_tee_service_call(sec_heap->tee_ctx, mem_session,
+					   TZCMD_MEM_SECURECM_ZALLOC, params);
+	if (ret)
+		return -ENOMEM;
+
+	sec_buf->sec_handle = params[2].u.value.a;
+	return 0;
+}
+
+static void mtk_sec_mem_release(struct mtk_secure_heap *sec_heap,
+				struct mtk_secure_heap_buffer *sec_buf)
+{
+	struct tee_param params[MTK_TEE_PARAM_NUM] = {0};
+	u32 mem_session = sec_heap->mem_session;
+
+	params[0].attr = TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT;
+	params[0].u.value.a = sec_buf->sec_handle;
+	params[1].attr = TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_OUTPUT;
+
+	mtk_sec_mem_tee_service_call(sec_heap->tee_ctx, mem_session,
+				     TZCMD_MEM_SECURECM_UNREF, params);
+}
+
 static struct dma_buf *
 mtk_sec_heap_allocate(struct dma_heap *heap, size_t size,
 		      unsigned long fd_flags, unsigned long heap_flags)
@@ -107,6 +169,9 @@ mtk_sec_heap_allocate(struct dma_heap *heap, size_t size,
 	sec_buf->size = size;
 	sec_buf->heap = heap;
 
+	ret = mtk_sec_mem_allocate(sec_heap, sec_buf);
+	if (ret)
+		goto err_free_buf;
 	exp_info.exp_name = dma_heap_get_name(heap);
 	exp_info.size = sec_buf->size;
 	exp_info.flags = fd_flags;
@@ -115,11 +180,13 @@ mtk_sec_heap_allocate(struct dma_heap *heap, size_t size,
 	dmabuf = dma_buf_export(&exp_info);
 	if (IS_ERR(dmabuf)) {
 		ret = PTR_ERR(dmabuf);
-		goto err_free_buf;
+		goto err_free_sec_mem;
 	}
 
 	return dmabuf;
 
+err_free_sec_mem:
+	mtk_sec_mem_release(sec_heap, sec_buf);
 err_free_buf:
 	kfree(sec_buf);
 	return ERR_PTR(ret);
-- 
2.25.1

