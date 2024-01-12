Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 641F682BCDF
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jan 2024 10:21:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B314110EAA8;
	Fri, 12 Jan 2024 09:21:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2953610EAA8
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jan 2024 09:21:27 +0000 (UTC)
X-UUID: f3ffd24eb12b11eea2298b7352fd921d-20240112
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=HADw242FALue4/QzLO55FuBtVdjd8ROKvAlUgmC/eAA=; 
 b=WNB1zq5Snp7FjXnYP1wc1Q1Y8PxsnO7HhC4yc8Vi1Z7QxaNLFP0dL4oUpiwj5oOl6eu1jjJQlRAhraMk12eMNfEzjIwqFZo09+dTLOLcZJ0haDGgiNYW6HSX7VG6tiDB7TmjgT8Npe4JHR69k0ZI99nik+qan4wSI8XLstJ99fI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35, REQID:59fbb378-30a1-4c17-905a-4c08f4cfd859, IP:0,
 U
 RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
 N:release,TS:-25
X-CID-META: VersionHash:5d391d7, CLOUDID:4fa6182f-1ab8-4133-9780-81938111c800,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
 DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: f3ffd24eb12b11eea2298b7352fd921d-20240112
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by
 mailgw02.mediatek.com (envelope-from <yong.wu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1328662330; Fri, 12 Jan 2024 17:21:23 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 12 Jan 2024 17:21:21 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 12 Jan 2024 17:21:20 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, <christian.koenig@amd.com>, Sumit Semwal
 <sumit.semwal@linaro.org>
Subject: [PATCH v4 5/7] dma-buf: heaps: restricted_heap: Add MediaTek
 restricted heap and heap_init
Date: Fri, 12 Jan 2024 17:20:12 +0800
Message-ID: <20240112092014.23999-6-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240112092014.23999-1-yong.wu@mediatek.com>
References: <20240112092014.23999-1-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--8.052100-8.000000
X-TMASE-MatchedRID: 9YdIuhTjdlgxaBEU4bKrVxes/RxhysDb5Y0kb0hqatxaW2Ktn+I8/kE3
 +onTHfsL8Ma3cLgHrnSDZ7J7xj+KAR8sKfBUK4IV04Rmz/agfdwraL2mh8ZVK+9Jtzyqge7Rilv
 Ab18i4hMKAm/Z86jMQ0auycBzvzregWiErfFUIB2HZXNSWjgdU96Cor0X5CicxKLCLOyCW5AR8a
 0W5UsPG0qUGrx94sBh2jhllF6BwBz6GJFh4XuzNSEK7m5BT0HZLJm8FOE9WLVnnK6mXN72mxFxR
 5JQAS6Ozr99M4MG5E10QKegfjzIxUIUHzxdtG/Z4pdq9sdj8LXh79l0/syuVldwRHrgRcbqa2By
 QZcfaSfBd/DCgjlp48/7jrKpSJx3HxPMjOKY7A8LbigRnpKlKSBuGJWwgxArGKTftmZH3Reo/Rs
 BcGSqXXb4Pzi7ApnORfCaNcs3Mo7ytSjJSW0vm69mtef9Ph+b
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--8.052100-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 56D099154249F0D58C5AB7F2F439C0725F04012394C71BE8800DFCDC31D440D22000:8
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 dri-devel@lists.freedesktop.org, John Stultz <jstultz@google.com>, Pavel
 Machek <pavel@ucw.cz>, Jeffrey Kardatzke <jkardatzke@google.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Vijayanand Jitta <quic_vjitta@quicinc.com>, Yong Wu <yong.wu@mediatek.com>,
 jianjiao.zeng@mediatek.com, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 linaro-mm-sig@lists.linaro.org, Pekka Paalanen <ppaalanen@gmail.com>,
 linux-mediatek@lists.infradead.org, Joakim Bech <joakim.bech@linaro.org>,
 tjmercier@google.com, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 youlin.pei@mediatek.com, kuohong.wang@mediatek.com,
 linux-kernel@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a Mediatek restricted heap which uses TEE service call to restrict
buffer. Currently this restricted heap is NULL, Prepare for the later
patch. Mainly there are two changes:
a) Add a heap_init ops since TEE probe late than restricted heap, thus
   initialize the heap when we require the buffer the first time.
b) Add a priv_data for each heap, like the special data used by MTK
   (such as "TEE session") can be placed in priv_data.

Currently our heap depends on CMA which could only be bool, thus
depend on "TEE=y".

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
 drivers/dma-buf/heaps/Kconfig               |   7 ++
 drivers/dma-buf/heaps/Makefile              |   1 +
 drivers/dma-buf/heaps/restricted_heap.c     |  11 ++
 drivers/dma-buf/heaps/restricted_heap.h     |   2 +
 drivers/dma-buf/heaps/restricted_heap_mtk.c | 113 ++++++++++++++++++++
 5 files changed, 134 insertions(+)
 create mode 100644 drivers/dma-buf/heaps/restricted_heap_mtk.c

diff --git a/drivers/dma-buf/heaps/Kconfig b/drivers/dma-buf/heaps/Kconfig
index e54506f480ea..84f748fb2856 100644
--- a/drivers/dma-buf/heaps/Kconfig
+++ b/drivers/dma-buf/heaps/Kconfig
@@ -21,3 +21,10 @@ config DMABUF_HEAPS_RESTRICTED
 	  heap is to manage buffers that are inaccessible to the kernel and user space.
 	  There may be several ways to restrict it, for example it may be encrypted or
 	  protected by a TEE or hypervisor. If in doubt, say N.
+
+config DMABUF_HEAPS_RESTRICTED_MTK
+	bool "MediaTek DMA-BUF Restricted Heap"
+	depends on DMABUF_HEAPS_RESTRICTED && TEE=y
+	help
+	  Enable restricted dma-buf heaps for MediaTek platform. This heap is backed by
+	  TEE client interfaces. If in doubt, say N.
diff --git a/drivers/dma-buf/heaps/Makefile b/drivers/dma-buf/heaps/Makefile
index a2437c1817e2..0028aa9d875f 100644
--- a/drivers/dma-buf/heaps/Makefile
+++ b/drivers/dma-buf/heaps/Makefile
@@ -1,4 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-$(CONFIG_DMABUF_HEAPS_CMA)		+= cma_heap.o
 obj-$(CONFIG_DMABUF_HEAPS_RESTRICTED)	+= restricted_heap.o
+obj-$(CONFIG_DMABUF_HEAPS_RESTRICTED_MTK)	+= restricted_heap_mtk.o
 obj-$(CONFIG_DMABUF_HEAPS_SYSTEM)	+= system_heap.o
diff --git a/drivers/dma-buf/heaps/restricted_heap.c b/drivers/dma-buf/heaps/restricted_heap.c
index ec4c63d2112d..4e9869ab4a85 100644
--- a/drivers/dma-buf/heaps/restricted_heap.c
+++ b/drivers/dma-buf/heaps/restricted_heap.c
@@ -152,11 +152,22 @@ restricted_heap_allocate(struct dma_heap *heap, unsigned long size,
 			 unsigned long fd_flags, unsigned long heap_flags)
 {
 	struct restricted_heap *restricted_heap = dma_heap_get_drvdata(heap);
+	const struct restricted_heap_ops *ops = restricted_heap->ops;
 	struct restricted_buffer *restricted_buf;
 	DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
 	struct dma_buf *dmabuf;
 	int ret;
 
+	/*
+	 * In some implements, TEE is required to protect buffer. However TEE probe
+	 * may be late, Thus heap_init is performed when the first buffer is requested.
+	 */
+	if (ops->heap_init) {
+		ret = ops->heap_init(restricted_heap);
+		if (ret)
+			return ERR_PTR(ret);
+	}
+
 	restricted_buf = kzalloc(sizeof(*restricted_buf), GFP_KERNEL);
 	if (!restricted_buf)
 		return ERR_PTR(-ENOMEM);
diff --git a/drivers/dma-buf/heaps/restricted_heap.h b/drivers/dma-buf/heaps/restricted_heap.h
index ddeaf9805708..cf5865f829fc 100644
--- a/drivers/dma-buf/heaps/restricted_heap.h
+++ b/drivers/dma-buf/heaps/restricted_heap.h
@@ -17,6 +17,8 @@ struct restricted_heap {
 	const char		*name;
 
 	const struct restricted_heap_ops *ops;
+
+	void			*priv_data;
 };
 
 struct restricted_heap_ops {
diff --git a/drivers/dma-buf/heaps/restricted_heap_mtk.c b/drivers/dma-buf/heaps/restricted_heap_mtk.c
new file mode 100644
index 000000000000..a5f5365059cd
--- /dev/null
+++ b/drivers/dma-buf/heaps/restricted_heap_mtk.c
@@ -0,0 +1,113 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * DMABUF restricted heap exporter for MediaTek
+ *
+ * Copyright (C) 2024 MediaTek Inc.
+ */
+#include <linux/dma-buf.h>
+#include <linux/err.h>
+#include <linux/module.h>
+#include <linux/slab.h>
+#include <linux/tee_drv.h>
+#include <linux/uuid.h>
+
+#include "restricted_heap.h"
+
+#define TZ_TA_MEM_UUID_MTK		"4477588a-8476-11e2-ad15-e41f1390d676"
+
+#define TEE_PARAM_NUM			4
+
+enum mtk_secure_mem_type {
+	/*
+	 * MediaTek static chunk memory carved out for TrustZone. The memory
+	 * management is inside the TEE.
+	 */
+	MTK_SECURE_MEMORY_TYPE_CM_TZ	= 1,
+};
+
+struct mtk_restricted_heap_data {
+	struct tee_context	*tee_ctx;
+	u32			tee_session;
+
+	const enum mtk_secure_mem_type mem_type;
+
+};
+
+static int mtk_tee_ctx_match(struct tee_ioctl_version_data *ver, const void *data)
+{
+	return ver->impl_id == TEE_IMPL_ID_OPTEE;
+}
+
+static int mtk_tee_session_init(struct mtk_restricted_heap_data *data)
+{
+	struct tee_param t_param[TEE_PARAM_NUM] = {0};
+	struct tee_ioctl_open_session_arg arg = {0};
+	uuid_t ta_mem_uuid;
+	int ret;
+
+	data->tee_ctx = tee_client_open_context(NULL, mtk_tee_ctx_match, NULL, NULL);
+	if (IS_ERR(data->tee_ctx)) {
+		pr_err_once("%s: open context failed, ret=%ld\n", __func__,
+			    PTR_ERR(data->tee_ctx));
+		return -ENODEV;
+	}
+
+	arg.num_params = TEE_PARAM_NUM;
+	arg.clnt_login = TEE_IOCTL_LOGIN_PUBLIC;
+	ret = uuid_parse(TZ_TA_MEM_UUID_MTK, &ta_mem_uuid);
+	if (ret)
+		goto close_context;
+	memcpy(&arg.uuid, &ta_mem_uuid.b, sizeof(ta_mem_uuid));
+
+	ret = tee_client_open_session(data->tee_ctx, &arg, t_param);
+	if (ret < 0 || arg.ret) {
+		pr_err_once("%s: open session failed, ret=%d:%d\n",
+			    __func__, ret, arg.ret);
+		ret = -EINVAL;
+		goto close_context;
+	}
+	data->tee_session = arg.session;
+	return 0;
+
+close_context:
+	tee_client_close_context(data->tee_ctx);
+	return ret;
+}
+
+static int mtk_restricted_heap_init(struct restricted_heap *heap)
+{
+	struct mtk_restricted_heap_data *data = heap->priv_data;
+
+	if (!data->tee_ctx)
+		return mtk_tee_session_init(data);
+	return 0;
+}
+
+static const struct restricted_heap_ops mtk_restricted_heap_ops = {
+	.heap_init		= mtk_restricted_heap_init,
+};
+
+static struct mtk_restricted_heap_data mtk_restricted_heap_data = {
+	.mem_type		= MTK_SECURE_MEMORY_TYPE_CM_TZ,
+};
+
+static struct restricted_heap mtk_restricted_heaps[] = {
+	{
+		.name		= "restricted_mtk_cm",
+		.ops		= &mtk_restricted_heap_ops,
+		.priv_data	= &mtk_restricted_heap_data,
+	},
+};
+
+static int mtk_restricted_heap_initialize(void)
+{
+	struct restricted_heap *rstrd_heap = mtk_restricted_heaps;
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(mtk_restricted_heaps); i++, rstrd_heap++)
+		restricted_heap_add(rstrd_heap);
+	return 0;
+}
+module_init(mtk_restricted_heap_initialize);
+MODULE_DESCRIPTION("MediaTek Restricted Heap Driver");
+MODULE_LICENSE("GPL");
-- 
2.25.1

