Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4458F7E8A8E
	for <lists+dri-devel@lfdr.de>; Sat, 11 Nov 2023 12:17:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B96D10E278;
	Sat, 11 Nov 2023 11:17:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 287C410E278
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Nov 2023 11:17:01 +0000 (UTC)
X-UUID: d36690e6808311eea33bb35ae8d461a2-20231111
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=roR8Vq3ha/ba4tX960IysHiPrj6jd3ZptOPgK0s/rp4=; 
 b=GTzNDTYKhRWPyXeIfVZ00SyFJYVeDngGXk2UQl35JPSXie+ZcxUV70k380xGp+q0xvn5W0Y6Au3NyDRNBIeXweW1ZQX05CEmi+3ZfGWEQYUwhYeD4nsVg4h3pRCU9NF3CimidaU5+BwUJztyucU1Wx3GE8G6k1FMHNXW4gU3QMs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.33, REQID:c0f4393c-1bd7-4d10-b3d4-b4e40bacf213, IP:0,
 U
 RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:-5
X-CID-META: VersionHash:364b77b, CLOUDID:ccf1f05f-c89d-4129-91cb-8ebfae4653fc,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
 DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: d36690e6808311eea33bb35ae8d461a2-20231111
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by
 mailgw01.mediatek.com (envelope-from <yong.wu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1451347898; Sat, 11 Nov 2023 19:16:57 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Sat, 11 Nov 2023 19:16:55 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Sat, 11 Nov 2023 19:16:54 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
 <christian.koenig@amd.com>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v2 3/8] dma-buf: heaps: secure_heap: Initialize tee session
Date: Sat, 11 Nov 2023 19:15:54 +0800
Message-ID: <20231111111559.8218-4-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231111111559.8218-1-yong.wu@mediatek.com>
References: <20231111111559.8218-1-yong.wu@mediatek.com>
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

The TEE probe later than dma-buf heap, and PROBE_DEDER doesn't work
here since this is not a platform driver, therefore initialize the TEE
context/session while we allocate the first secure buffer.

Add our special UUID and tee type in the private data.

If the uuid is zero, it means that it doesn't enter TEE to protect the
buffer, there may be other ways to protect the buffer.

All the MTK chrome projects use this UUID. The UUID is only used in the
kernelspace while userspace never use it. The userspace could allocate the
secure memory via the existing dma-buf ioctl.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
 drivers/dma-buf/heaps/secure_heap.c | 75 +++++++++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/drivers/dma-buf/heaps/secure_heap.c b/drivers/dma-buf/heaps/secure_heap.c
index 87ac23072e9e..2a037fc54004 100644
--- a/drivers/dma-buf/heaps/secure_heap.c
+++ b/drivers/dma-buf/heaps/secure_heap.c
@@ -10,6 +10,12 @@
 #include <linux/err.h>
 #include <linux/module.h>
 #include <linux/slab.h>
+#include <linux/tee_drv.h>
+#include <linux/uuid.h>
+
+#define TZ_TA_MEM_UUID_MTK		"4477588a-8476-11e2-ad15-e41f1390d676"
+
+#define TEE_PARAM_NUM			4
 
 enum secure_memory_type {
 	/*
@@ -27,6 +33,9 @@ struct secure_buffer {
 struct secure_heap;
 
 struct secure_heap_prv_data {
+	const char			*uuid;
+	const int			tee_impl_id;
+
 	int	(*memory_alloc)(struct secure_heap *sec_heap, struct secure_buffer *sec_buf);
 	void	(*memory_free)(struct secure_heap *sec_heap, struct secure_buffer *sec_buf);
 
@@ -39,9 +48,62 @@ struct secure_heap {
 	const char			*name;
 	const enum secure_memory_type	mem_type;
 
+	struct tee_context		*tee_ctx;
+	u32				tee_session;
+
 	const struct secure_heap_prv_data *data;
 };
 
+static int tee_ctx_match(struct tee_ioctl_version_data *ver, const void *data)
+{
+	const struct secure_heap_prv_data *d = data;
+
+	return ver->impl_id == d->tee_impl_id;
+}
+
+static int secure_heap_tee_session_init(struct secure_heap *sec_heap)
+{
+	struct tee_param t_param[TEE_PARAM_NUM] = {0};
+	struct tee_ioctl_open_session_arg arg = {0};
+	const struct secure_heap_prv_data *data = sec_heap->data;
+	uuid_t ta_mem_uuid;
+	int ret;
+
+	sec_heap->tee_ctx = tee_client_open_context(NULL, tee_ctx_match, data, NULL);
+	if (IS_ERR(sec_heap->tee_ctx)) {
+		pr_err_once("%s: open context failed, ret=%ld\n", sec_heap->name,
+			    PTR_ERR(sec_heap->tee_ctx));
+		return -ENODEV;
+	}
+
+	arg.num_params = TEE_PARAM_NUM;
+	arg.clnt_login = TEE_IOCTL_LOGIN_PUBLIC;
+	ret = uuid_parse(data->uuid, &ta_mem_uuid);
+	if (ret)
+		goto close_context;
+	memcpy(&arg.uuid, &ta_mem_uuid.b, sizeof(ta_mem_uuid));
+
+	ret = tee_client_open_session(sec_heap->tee_ctx, &arg, t_param);
+	if (ret < 0 || arg.ret) {
+		pr_err_once("%s: open session failed, ret=%d:%d\n",
+			    sec_heap->name, ret, arg.ret);
+		ret = -EINVAL;
+		goto close_context;
+	}
+	sec_heap->tee_session = arg.session;
+	return 0;
+
+close_context:
+	tee_client_close_context(sec_heap->tee_ctx);
+	return ret;
+}
+
+/* The memory allocating is within the TEE. */
+const struct secure_heap_prv_data mtk_sec_mem_data = {
+	.uuid			= TZ_TA_MEM_UUID_MTK,
+	.tee_impl_id		= TEE_IMPL_ID_OPTEE,
+};
+
 static int secure_heap_secure_memory_allocate(struct secure_heap *sec_heap,
 					      struct secure_buffer *sec_buf)
 {
@@ -84,11 +146,23 @@ secure_heap_allocate(struct dma_heap *heap, unsigned long size,
 		     unsigned long fd_flags, unsigned long heap_flags)
 {
 	struct secure_heap *sec_heap = dma_heap_get_drvdata(heap);
+	const struct secure_heap_prv_data *data = sec_heap->data;
 	struct secure_buffer *sec_buf;
 	DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
 	struct dma_buf *dmabuf;
 	int ret;
 
+	/*
+	 * If uuid is valid, It requires enter TEE to protect buffers. However
+	 * TEE probe may be late. Initialize the secure session the first time
+	 * we request the secure buffer.
+	 */
+	if (data->uuid && !sec_heap->tee_session) {
+		ret = secure_heap_tee_session_init(sec_heap);
+		if (ret)
+			return ERR_PTR(ret);
+	}
+
 	sec_buf = kzalloc(sizeof(*sec_buf), GFP_KERNEL);
 	if (!sec_buf)
 		return ERR_PTR(-ENOMEM);
@@ -127,6 +201,7 @@ static struct secure_heap secure_heaps[] = {
 	{
 		.name		= "secure_mtk_cm",
 		.mem_type	= SECURE_MEMORY_TYPE_MTK_CM_TZ,
+		.data		= &mtk_sec_mem_data,
 	},
 };
 
-- 
2.25.1

