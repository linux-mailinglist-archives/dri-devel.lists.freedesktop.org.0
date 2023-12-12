Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A3F580E224
	for <lists+dri-devel@lfdr.de>; Tue, 12 Dec 2023 03:47:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D992110E549;
	Tue, 12 Dec 2023 02:47:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22D8810E547
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Dec 2023 02:47:27 +0000 (UTC)
X-UUID: c7489822989811eea5db2bebc7c28f94-20231212
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=vwtS8L5iqxhbdUVvfvV1bHrAuc8ODHY3J4ZblLns0Jw=; 
 b=Yb7vsKgSdQ2uePq+G51ovRnkSz6QIjpP499IqE1KjsveMB0+p0CaBqRjcs7yAkiXdX15z2mF4tAeSWLv5Mjoxk80pnUkhBrh6+KA4iOPbPqxDhAEG51uAjem/JWLoQc+jCXOMgVxSUQ64FAVXn8+jP5/T4VDn0iPuFTnxV5E35M=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35, REQID:d89c0e66-f24b-4473-b9c5-2e9af2d0acf3, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:5d391d7, CLOUDID:97db8efd-4a48-46e2-b946-12f04f20af8c,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
 DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: c7489822989811eea5db2bebc7c28f94-20231212
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by
 mailgw01.mediatek.com (envelope-from <yong.wu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 2081418428; Tue, 12 Dec 2023 10:47:24 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 12 Dec 2023 10:47:22 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 12 Dec 2023 10:47:21 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
 <christian.koenig@amd.com>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v3 6/7] dma-buf: heaps: secure_heap_mtk: Add tee memory
 service call
Date: Tue, 12 Dec 2023 10:46:06 +0800
Message-ID: <20231212024607.3681-7-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231212024607.3681-1-yong.wu@mediatek.com>
References: <20231212024607.3681-1-yong.wu@mediatek.com>
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
Cc: dri-devel@lists.freedesktop.org, John Stultz <jstultz@google.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jeffrey Kardatzke <jkardatzke@google.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Vijayanand Jitta <quic_vjitta@quicinc.com>,
 Nicolas Dufresne <nicolas@ndufresne.ca>, Yong Wu <yong.wu@mediatek.com>,
 jianjiao.zeng@mediatek.com, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 ckoenig.leichtzumerken@gmail.com, linaro-mm-sig@lists.linaro.org,
 linux-mediatek@lists.infradead.org, Joakim Bech <joakim.bech@linaro.org>,
 tjmercier@google.com, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 kuohong.wang@mediatek.com, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add TEE service call for MediaTek heap. We have a limited number of
hardware entries to protect memory, therefore we cannot protect memory
arbitrarily, then our secure memory management is actually inside OPTEE.
The kernel just tells the TEE what size I want and the TEE will return a
"secure address". The secure_address is a reference to a secure buffer
within TEE. We put it in the sg_dma_address, please see the comment in
code.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
 drivers/dma-buf/heaps/secure_heap.c     | 16 +++++
 drivers/dma-buf/heaps/secure_heap.h     |  2 +
 drivers/dma-buf/heaps/secure_heap_mtk.c | 92 +++++++++++++++++++++++++
 3 files changed, 110 insertions(+)

diff --git a/drivers/dma-buf/heaps/secure_heap.c b/drivers/dma-buf/heaps/secure_heap.c
index ca4b433fb3f1..e2b8b97ad4dc 100644
--- a/drivers/dma-buf/heaps/secure_heap.c
+++ b/drivers/dma-buf/heaps/secure_heap.c
@@ -94,8 +94,22 @@ static struct sg_table *
 secure_heap_map_dma_buf(struct dma_buf_attachment *attachment, enum dma_data_direction direction)
 {
 	struct secure_heap_attachment *a = attachment->priv;
+	struct dma_buf *dmabuf = attachment->dmabuf;
+	struct secure_buffer *sec_buf = dmabuf->priv;
 	struct sg_table *table = a->table;
 
+	/*
+	 * Technically dma_address refers to the address used by HW, But for secure buffer
+	 * we don't know its dma_address in kernel, Instead, we only know its "secure handle".
+	 * Thus use this property to save the "secure handle", and the user will use it to
+	 * obtain the real address in secure world.
+	 *
+	 * Note: CONFIG_DMA_API_DEBUG requires it to be aligned with PAGE_SIZE.
+	 */
+	if (sec_buf->secure_address) {
+		sg_dma_address(table->sgl) = sec_buf->secure_address;
+		sg_dma_len(table->sgl) = sec_buf->size;
+	}
 	return table;
 }
 
@@ -106,6 +120,8 @@ secure_heap_unmap_dma_buf(struct dma_buf_attachment *attachment, struct sg_table
 	struct secure_heap_attachment *a = attachment->priv;
 
 	WARN_ON(a->table != table);
+	sg_dma_address(table->sgl) = 0;
+	sg_dma_len(table->sgl) = 0;
 }
 
 static int
diff --git a/drivers/dma-buf/heaps/secure_heap.h b/drivers/dma-buf/heaps/secure_heap.h
index 1ce9c431d989..374fd276bdd7 100644
--- a/drivers/dma-buf/heaps/secure_heap.h
+++ b/drivers/dma-buf/heaps/secure_heap.h
@@ -11,6 +11,8 @@
 struct secure_buffer {
 	struct dma_heap		*heap;
 	size_t			size;
+
+	u64			secure_address; /* A reference to the buffer in the secure world */
 };
 
 struct secure_heap {
diff --git a/drivers/dma-buf/heaps/secure_heap_mtk.c b/drivers/dma-buf/heaps/secure_heap_mtk.c
index c7e609dd7bd3..2c6aaeaf469f 100644
--- a/drivers/dma-buf/heaps/secure_heap_mtk.c
+++ b/drivers/dma-buf/heaps/secure_heap_mtk.c
@@ -25,6 +25,27 @@ enum mtk_secure_mem_type {
 	MTK_SECURE_MEMORY_TYPE_CM_TZ	= 1,
 };
 
+enum mtk_secure_buffer_tee_cmd {
+	/*
+	 * Allocate the zeroed secure memory from TEE.
+	 *
+	 * [in]  value[0].a: The buffer size.
+	 *       value[0].b: alignment.
+	 * [in]  value[1].a: enum mtk_secure_mem_type.
+	 * [out] value[3].a: The secure handle.
+	 */
+	MTK_TZCMD_SECMEM_ZALLOC	= 0x10000, /* MTK TEE Command ID Base */
+
+	/*
+	 * Free secure memory.
+	 *
+	 * [in]  value[0].a: The secure handle of this buffer, It's value[3].a of
+	 *                   MTK_TZCMD_SECMEM_ZALLOC.
+	 * [out] value[1].a: return value, 0 means successful, otherwise fail.
+	 */
+	MTK_TZCMD_SECMEM_FREE	= 0x10001,
+};
+
 struct mtk_secure_heap_data {
 	struct tee_context	*tee_ctx;
 	u32			tee_session;
@@ -74,6 +95,73 @@ static int mtk_tee_session_init(struct mtk_secure_heap_data *data)
 	return ret;
 }
 
+static int
+mtk_tee_service_call(struct tee_context *tee_ctx, u32 session,
+		     unsigned int command, struct tee_param *params)
+{
+	struct tee_ioctl_invoke_arg arg = {0};
+	int ret;
+
+	arg.num_params = TEE_PARAM_NUM;
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
+static int mtk_tee_secure_memory(struct secure_heap *sec_heap, struct secure_buffer *sec_buf)
+{
+	struct mtk_secure_heap_data *data = sec_heap->priv_data;
+	struct tee_param params[TEE_PARAM_NUM] = {0};
+	int ret;
+
+	params[0].attr = TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT;
+	params[0].u.value.a = sec_buf->size;
+	params[0].u.value.b = PAGE_SIZE;
+	params[1].attr = TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT;
+	params[1].u.value.a = data->mem_type;
+	params[2].attr = TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT;
+	params[3].attr = TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_OUTPUT;
+	ret = mtk_tee_service_call(data->tee_ctx, data->tee_session,
+				   MTK_TZCMD_SECMEM_ZALLOC, params);
+	if (ret)
+		return -ENOMEM;
+
+	sec_buf->secure_address = params[3].u.value.a;
+	return 0;
+}
+
+static void mtk_tee_unsecure_memory(struct secure_heap *sec_heap, struct secure_buffer *sec_buf)
+{
+	struct mtk_secure_heap_data *data = sec_heap->priv_data;
+	struct tee_param params[TEE_PARAM_NUM] = {0};
+
+	params[0].attr = TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT;
+	params[0].u.value.a = sec_buf->secure_address;
+	params[1].attr = TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_OUTPUT;
+
+	mtk_tee_service_call(data->tee_ctx, data->tee_session,
+			     MTK_TZCMD_SECMEM_FREE, params);
+	if (params[1].u.value.a)
+		pr_err("%s, unsecure buffer(0x%llx) fail(%lld) from TEE.\n",
+		       sec_heap->name, sec_buf->secure_address, params[1].u.value.a);
+}
+
+static int mtk_secure_memory_allocate(struct secure_heap *sec_heap, struct secure_buffer *sec_buf)
+{
+	/* The memory allocating is within the TEE. */
+	return 0;
+}
+
+static void mtk_secure_memory_free(struct secure_heap *sec_heap, struct secure_buffer *sec_buf)
+{
+}
+
 static int mtk_secure_heap_init(struct secure_heap *sec_heap)
 {
 	struct mtk_secure_heap_data *data = sec_heap->priv_data;
@@ -85,6 +173,10 @@ static int mtk_secure_heap_init(struct secure_heap *sec_heap)
 
 static const struct secure_heap_ops mtk_sec_mem_ops = {
 	.heap_init		= mtk_secure_heap_init,
+	.memory_alloc		= mtk_secure_memory_allocate,
+	.memory_free		= mtk_secure_memory_free,
+	.secure_the_memory	= mtk_tee_secure_memory,
+	.unsecure_the_memory	= mtk_tee_unsecure_memory,
 };
 
 static struct mtk_secure_heap_data mtk_sec_heap_data = {
-- 
2.25.1

