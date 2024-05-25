Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 956798CF1F6
	for <lists+dri-devel@lfdr.de>; Sun, 26 May 2024 01:08:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D73910E70B;
	Sat, 25 May 2024 23:08:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="fZiPBH/2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7564010E9D9
 for <dri-devel@lists.freedesktop.org>; Sat, 25 May 2024 23:08:20 +0000 (UTC)
X-UUID: aa03d1841aeb11ef8c37dd7afa272265-20240526
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=duLkq3MY08t3TPV16Qz00xGJ7IWdS0qMJsGqtmvG1LI=; 
 b=fZiPBH/2QRVWDymvSJ15KDvBhxl1/twMTpjCD71XPWx38ESeh2mx8R05cmWnGwSJp98Wx4sSFftGMHLR1Kstduo7jkV/NWeYilVIxsCfJFxtgByxeAFOqI/IasCW8DvmH+vSkqE6c/JAtc0bq4m/3XiOQ3n0loC333THGazKKjI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.38, REQID:979ad1aa-02ff-4662-a49e-b90f9d521ca0, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:82c5f88, CLOUDID:d6f1cf87-8d4f-477b-89d2-1e3bdbef96d1,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
 SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: aa03d1841aeb11ef8c37dd7afa272265-20240526
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by
 mailgw01.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 2049064832; Sun, 26 May 2024 07:08:14 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Sun, 26 May 2024 07:08:12 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Sun, 26 May 2024 07:08:12 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
CC: Conor Dooley <conor+dt@kernel.org>, Jason-ch Chen
 <jason-ch.chen@mediatek.com>, "Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Shawn Sung <shawn.sung@mediatek.com>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <dri-devel@lists.freedesktop.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v6 8/8] soc: mediatek: mtk-cmdq: Add secure cmdq_pkt APIs
Date: Sun, 26 May 2024 07:08:10 +0800
Message-ID: <20240525230810.24623-9-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240525230810.24623-1-jason-jh.lin@mediatek.com>
References: <20240525230810.24623-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--2.816800-8.000000
X-TMASE-MatchedRID: CrmPfhth5sDDBNgbKIiiTM36paW7ZnFoI0ZIn3NG5Q2JoFTGeLN6N+7x
 5pfAGjL6K+GE57usLIhYo3G+rvxrNW94Ipa1otxoYEtx50+o73+XYX34rFl3xxUZTfM00s4+62a
 +037kacJVn6tr4tn+oa23e1tXXsFrE69fuQMno67il2r2x2PwtTAKasuXH5J1xeGR7mtrTn1SdV
 bMKiueSOsLoj7xkpvN9RsOD/mzVHL/o+5l9ZSgvrIGMNfiwa5N1KoSW5Ji1XtHZg0gWH5yUXKcL
 5Ghhf874vM1YF6AJbbCCfuIMF6xLSdET58jp62Slf1PzZRYJjxTy9Shy79Ruk2XcebyFTNbOUtL
 7t59GengqZ4vSF/h+U29n6FHXNno6vEfkC3oqnKWMssgsGBGYBYP1M+A4AabgITnGkK0NFNRskX
 KHhdfKpij9M86UwHhsKHfMTjCprwNQJGvyiKf6Q==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--2.816800-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 039C7B2CDA5AD5BF02909C7A384C7F2F19DCB8967D7FB9CCB10E8FB6982D25992000:8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Open secure cmdq_pkt APIs to support executing commands in secure world.

1. Add cmdq_sec_pkt_alloc_sec_data(), cmdq_sec_pkt_free_sec_data() and
   cmdq_sec_pkt_set_data() to prepare the sec_data in cmdq_pkt that will
   be referenced in the secure world.

2. Add cmdq_sec_insert_backup_cookie() and cmdq_sec_pkt_write() to
   generate commands that need to be executed in the secure world.
   In cmdq_sec_pkt_write(), we need to prepare the metadata to store
   buffer offset of the secure buffer handle because secure world can
   only translate the start address of secure buffer by secure handle.

Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
---
 drivers/soc/mediatek/mtk-cmdq-helper.c | 155 +++++++++++++++++++++++++
 include/linux/soc/mediatek/mtk-cmdq.h  |  71 +++++++++++
 2 files changed, 226 insertions(+)

diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
index 42fae05f61a8..de6557f3ca2f 100644
--- a/drivers/soc/mediatek/mtk-cmdq-helper.c
+++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
@@ -562,4 +562,159 @@ int cmdq_pkt_finalize(struct cmdq_pkt *pkt)
 }
 EXPORT_SYMBOL(cmdq_pkt_finalize);
 
+int cmdq_sec_insert_backup_cookie(struct cmdq_pkt *pkt)
+{
+	struct cmdq_client *cl = (struct cmdq_client *)pkt->cl;
+	struct cmdq_operand left, right;
+	dma_addr_t addr;
+
+	addr = cmdq_sec_get_exec_cnt_addr(cl->chan);
+	cmdq_pkt_assign(pkt, CMDQ_THR_SPR_IDX1, CMDQ_ADDR_HIGH(addr));
+	cmdq_pkt_read_s(pkt, CMDQ_THR_SPR_IDX1, CMDQ_ADDR_LOW(addr), CMDQ_THR_SPR_IDX1);
+
+	left.reg = true;
+	left.idx = CMDQ_THR_SPR_IDX1;
+	right.reg = false;
+	right.value = 1;
+	cmdq_pkt_logic_command(pkt, CMDQ_THR_SPR_IDX1, &left, CMDQ_LOGIC_ADD, &right);
+
+	addr = cmdq_sec_get_cookie_addr(cl->chan);
+	cmdq_pkt_assign(pkt, CMDQ_THR_SPR_IDX2, CMDQ_ADDR_HIGH(addr));
+	cmdq_pkt_write_s(pkt, CMDQ_THR_SPR_IDX2, CMDQ_ADDR_LOW(addr), CMDQ_THR_SPR_IDX1);
+	cmdq_pkt_set_event(pkt, cmdq_sec_get_eof_event_id(cl->chan));
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(cmdq_sec_insert_backup_cookie);
+
+static int cmdq_sec_realloc_addr_list(struct cmdq_pkt *pkt, const u32 count)
+{
+	struct cmdq_sec_data *sec_data = (struct cmdq_sec_data *)pkt->sec_data;
+	void *prev = (void *)(unsigned long)sec_data->addr_metadatas, *curr;
+
+	if (count <= sec_data->addr_metadata_max_cnt)
+		return 0;
+
+	curr = kcalloc(count, sizeof(*sec_data), GFP_KERNEL);
+	if (!curr)
+		return -ENOMEM;
+
+	if (count && sec_data->addr_metadatas)
+		memcpy(curr, prev, sizeof(*sec_data) * sec_data->addr_metadata_max_cnt);
+
+	kfree(prev);
+
+	sec_data->addr_metadatas = (uintptr_t)curr;
+	sec_data->addr_metadata_max_cnt = count;
+	return 0;
+}
+
+void cmdq_sec_pkt_free_sec_data(struct cmdq_pkt *pkt)
+{
+	kfree(pkt->sec_data);
+}
+EXPORT_SYMBOL_GPL(cmdq_sec_pkt_free_sec_data);
+
+int cmdq_sec_pkt_alloc_sec_data(struct cmdq_pkt *pkt)
+{
+	struct cmdq_sec_data *sec_data;
+
+	if (pkt->sec_data)
+		return 0;
+
+	sec_data = kzalloc(sizeof(*sec_data), GFP_KERNEL);
+	if (!sec_data)
+		return -ENOMEM;
+
+	pkt->sec_data = (void *)sec_data;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(cmdq_sec_pkt_alloc_sec_data);
+
+static int cmdq_sec_append_metadata(struct cmdq_pkt *pkt,
+				    const enum cmdq_iwc_addr_metadata_type type,
+				    const u32 base, const u32 offset)
+{
+	struct cmdq_sec_data *sec_data;
+	struct iwc_cmdq_addr_metadata_t *meta;
+	int idx, max, ret;
+
+	pr_debug("[%s %d] pkt:%p type:%u base:%#x offset:%#x",
+		 __func__, __LINE__, pkt, type, base, offset);
+
+	ret = cmdq_sec_pkt_alloc_sec_data(pkt);
+	if (ret < 0)
+		return ret;
+
+	sec_data = (struct cmdq_sec_data *)pkt->sec_data;
+	idx = sec_data->addr_metadata_cnt;
+	if (idx >= CMDQ_IWC_MAX_ADDR_LIST_LENGTH) {
+		pr_err("idx:%u reach over:%u", idx, CMDQ_IWC_MAX_ADDR_LIST_LENGTH);
+		return -EFAULT;
+	}
+
+	if (!sec_data->addr_metadata_max_cnt)
+		max = ADDR_METADATA_MAX_COUNT_ORIGIN;
+	else if (idx >= sec_data->addr_metadata_max_cnt)
+		max = sec_data->addr_metadata_max_cnt * 2;
+	else
+		max = sec_data->addr_metadata_max_cnt;
+
+	ret = cmdq_sec_realloc_addr_list(pkt, max);
+	if (ret)
+		return ret;
+
+	if (!sec_data->addr_metadatas) {
+		pr_info("addr_metadatas is missing");
+
+		meta = kzalloc(sizeof(*meta), GFP_KERNEL);
+		if (!meta)
+			return -ENOMEM;
+
+		sec_data->addr_metadatas = (uintptr_t)(void *)meta;
+	}
+	meta = (struct iwc_cmdq_addr_metadata_t *)(uintptr_t)sec_data->addr_metadatas;
+
+	meta[idx].type = type;
+	meta[idx].base_handle = base;
+	meta[idx].offset = offset;
+	sec_data->addr_metadata_cnt += 1;
+	return 0;
+}
+
+int cmdq_sec_pkt_set_data(struct cmdq_pkt *pkt, enum cmdq_sec_scenario scenario)
+{
+	struct cmdq_sec_data *sec_data;
+	int ret;
+
+	if (!pkt) {
+		pr_err("invalid pkt:%p", pkt);
+		return -EINVAL;
+	}
+
+	ret = cmdq_sec_pkt_alloc_sec_data(pkt);
+	if (ret < 0)
+		return ret;
+
+	pr_debug("[%s %d] pkt:%p sec_data:%p scen:%u",
+		 __func__, __LINE__, pkt, pkt->sec_data, scenario);
+
+	sec_data = (struct cmdq_sec_data *)pkt->sec_data;
+	sec_data->scenario = scenario;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(cmdq_sec_pkt_set_data);
+
+int cmdq_sec_pkt_write(struct cmdq_pkt *pkt, u8 subsys, u16 offset,
+		       enum cmdq_iwc_addr_metadata_type type,
+		       u32 base, u32 base_offset)
+{
+	cmdq_pkt_write(pkt, subsys, offset, base);
+
+	return cmdq_sec_append_metadata(pkt, type, base, base_offset);
+}
+EXPORT_SYMBOL_GPL(cmdq_sec_pkt_write);
+
 MODULE_LICENSE("GPL v2");
diff --git a/include/linux/soc/mediatek/mtk-cmdq.h b/include/linux/soc/mediatek/mtk-cmdq.h
index 5bee6f7fc400..6baf60313409 100644
--- a/include/linux/soc/mediatek/mtk-cmdq.h
+++ b/include/linux/soc/mediatek/mtk-cmdq.h
@@ -9,6 +9,7 @@
 
 #include <linux/mailbox_client.h>
 #include <linux/mailbox/mtk-cmdq-mailbox.h>
+#include <linux/mailbox/mtk-cmdq-sec-mailbox.h>
 #include <linux/timer.h>
 
 #define CMDQ_ADDR_HIGH(addr)	((u32)(((addr) >> 16) & GENMASK(31, 0)))
@@ -399,6 +400,52 @@ int cmdq_pkt_eoc(struct cmdq_pkt *pkt);
  */
 int cmdq_pkt_finalize(struct cmdq_pkt *pkt);
 
+/**
+ * cmdq_sec_pkt_free_sec_data() - free sec_data for CMDQ packet.
+ * @pkt:	the CMDQ packet.
+ */
+void cmdq_sec_pkt_free_sec_data(struct cmdq_pkt *pkt);
+
+/**
+ * cmdq_sec_pkt_alloc_sec_data() - allocate sec_data for CMDQ packet.
+ * @pkt:	the CMDQ packet.
+ *
+ * Return: 0 for success; else the error code is returned
+ */
+int cmdq_sec_pkt_alloc_sec_data(struct cmdq_pkt *pkt);
+
+/**
+ * cmdq_sec_insert_backup_cookie() - append backup cookie related instructions.
+ * @pkt:	the CMDQ packet.
+ *
+ * Return: 0 for success; else the error code is returned
+ */
+int cmdq_sec_insert_backup_cookie(struct cmdq_pkt *pkt);
+
+/**
+ * cmdq_sec_pkt_set_data() - set secure configuration to sec_data in CDMQ packet.
+ * @pkt:	the CMDQ packet.
+ * @scenario:		the scenario to CMDQ TA.
+ *
+ * Return: 0 for success; else the error code is returned
+ */
+int cmdq_sec_pkt_set_data(struct cmdq_pkt *pkt, enum cmdq_sec_scenario scenario);
+
+/**
+ * cmdq_sec_pkt_write() - append write secure buffer related instructions.
+ * @pkt:	  the CMDQ packet.
+ * @subsys:	the CMDQ sub system code.
+ * @offset:	register offset from CMDQ sub system.
+ * @type:	the address metadata conversion type.
+ * @base:	the secure handle of secure buffer.
+ * @base_offset:the address offset of secure buffer.
+ *
+ * Return: 0 for success; else the error code is returned
+ */
+int cmdq_sec_pkt_write(struct cmdq_pkt *pkt, u8 subsys, u16 offset,
+		       enum cmdq_iwc_addr_metadata_type type,
+		       u32 base, u32 base_offset);
+
 #else /* IS_ENABLED(CONFIG_MTK_CMDQ) */
 
 static inline int cmdq_dev_get_client_reg(struct device *dev,
@@ -524,6 +571,30 @@ static inline int cmdq_pkt_finalize(struct cmdq_pkt *pkt)
 	return -EINVAL;
 }
 
+static inline void cmdq_sec_pkt_free_sec_data(struct cmdq_pkt *pkt) {}
+
+static inline int cmdq_sec_pkt_alloc_sec_data(struct cmdq_pkt *pkt)
+{
+	return -EINVAL;
+}
+
+static inline int cmdq_sec_insert_backup_cookie(struct cmdq_pkt *pkt)
+{
+	return -EINVAL;
+}
+
+static inline int cmdq_sec_pkt_set_data(struct cmdq_pkt *pkt, enum cmdq_sec_scenario scenario)
+{
+	return -EINVAL;
+}
+
+static inline int cmdq_sec_pkt_write(struct cmdq_pkt *pkt, u8 subsys, u16 offset,
+				     enum cmdq_iwc_addr_metadata_type type,
+				     u32 base, u32 base_offset)
+{
+	return -EINVAL;
+}
+
 #endif /* IS_ENABLED(CONFIG_MTK_CMDQ) */
 
 #endif	/* __MTK_CMDQ_H__ */
-- 
2.18.0

