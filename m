Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A04597153D9
	for <lists+dri-devel@lfdr.de>; Tue, 30 May 2023 04:43:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC7C010E328;
	Tue, 30 May 2023 02:43:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2077.outbound.protection.outlook.com [40.107.94.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F3FC10E320;
 Tue, 30 May 2023 02:43:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BoBOvNWq507la18Wz7sNZnhPxmWYzIslk9j2F5B28SrZH2R0jFJ7na+2fB6qIWsP6DjRgsjv5encvN58K8K9Y3ae2bhlWJPw1CIMdFuJqFNgiQW3MBpfaXdhrD1u6uk6vum/wd0qZ+PDn5hR8zXsQblgez5YMAol+EcQlB3pN1PGlmmahuNEPr6bcWynqr3dybJ0zJLuvQxSmXmf7Rye5cczcaf6JO8SgYqP0w/0hC9spnJx1dopqHZi9n0F6Xr2Y5EdRyZl0Auta2P+J4fBSpafPqswMChkt7pACLx+j/2aBIGfSVGefzfXZ7nKZu7ZAagLGx0BfJpg0qPXvRvUBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pqoYW+ZppvfRNPNCv8U//lStS+ck/No3nz1J9q9VpPg=;
 b=QMbguje0+6dZALfEWqVtAjg/V4LHftcvTJdDouQ98B17Ihy4tbd/lFYYYZ5/H2Fg1z/ul/tOYLJWts8uuvAP4RaNmV8yUqGQQn0MdcfoWv3UO1gDcp/jjqYS6LON7oXr1r/cSSaOJDFUeug4bUe5Zs/pIbnVh+ub/DW3w29iIMbsBk3iyB1xJh24xF8B8thQuZRvewrBm4OHz/gF6nC53Q8vAZURk+NypGxO3wWLBu8BpzSI5JCDRwNcBi/gJb9GasqiLp9zdEo5uMSAWFS/QGkVf/yIygj1k+qAdMN3OX2O7/BngpkzYs81ryWZkHqmNCuNW+TkQ2p7K91oRip9NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pqoYW+ZppvfRNPNCv8U//lStS+ck/No3nz1J9q9VpPg=;
 b=WbqEcb0V2G4C+Usl+8lO/AY+lYT/Tu7u6/MmS6lamY9PcorPaGp/XjTyhE1E0A7wGJa0EiJ8vpPPGuQthythGqamAFhOia76Wd/1VP1EBhqPKd64GwTaKhS4q9wskk2Jkj19OMFABlV/pw0Q88oSOgOZsbfS0b4hZixkDqnd/bA=
Received: from BN9PR03CA0965.namprd03.prod.outlook.com (2603:10b6:408:109::10)
 by DS0PR12MB6461.namprd12.prod.outlook.com (2603:10b6:8:c7::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.22; Tue, 30 May
 2023 02:43:35 +0000
Received: from BN8NAM11FT084.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:109:cafe::6) by BN9PR03CA0965.outlook.office365.com
 (2603:10b6:408:109::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23 via Frontend
 Transport; Tue, 30 May 2023 02:43:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT084.mail.protection.outlook.com (10.13.176.169) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6455.21 via Frontend Transport; Tue, 30 May 2023 02:43:35 +0000
Received: from equan-buildpc.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 29 May
 2023 21:43:29 -0500
From: Evan Quan <evan.quan@amd.com>
To: <rafael@kernel.org>, <lenb@kernel.org>, <alexander.deucher@amd.com>,
 <christian.koenig@amd.com>, <Xinhui.Pan@amd.com>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <evan.quan@amd.com>, <kvalo@kernel.org>, <nbd@nbd.name>,
 <lorenzo@kernel.org>, <ryder.lee@mediatek.com>, <shayne.chen@mediatek.com>,
 <sean.wang@mediatek.com>, <matthias.bgg@gmail.com>,
 <angelogioacchino.delregno@collabora.com>, <Mario.Limonciello@amd.com>,
 <Lijo.Lazar@amd.com>
Subject: [PATCH 4/9] wifi: ath12k: Add support to the Qualcomm ath12k for ACPI
 WBRF
Date: Tue, 30 May 2023 10:42:22 +0800
Message-ID: <20230530024227.2139632-5-evan.quan@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230530024227.2139632-1-evan.quan@amd.com>
References: <20230530024227.2139632-1-evan.quan@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT084:EE_|DS0PR12MB6461:EE_
X-MS-Office365-Filtering-Correlation-Id: f3a26c40-d72b-4517-7d32-08db60b7aa4e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /oeBcEucD4u7h/xDusOvOhXB2S3/Jd8IYlluECkrzDK23wbsRGumfH1HlwZtnKCWQduQ7bNXvDBrUQ03lRih9SSr37baGtA4XFFP8y0+t5FuW1BUjhOvs/NfjWNuEJEIxhFCIGvmME1SHuobat+jIftkrSVcYbYWOVXtYnUT6/oLGUHQdKThZy4a9ClHQ4qP2TjyTx80iCqZHzJItz1rrgVbA1UK0+YfK3/G/iHcd0fcGwKNc+T9/HSZCL0I4Ko4vbk/LHsE7yGLRVN9iCBfw+VIhLEyiXJTIqgsaOq6Y6iTWAbyDVdaPO2iGPj9GSPOe0Ebj98Cltv3jm9K3oVv3NgLdqEUre+cgBFxN931jjwj4g4HMK4aIgXvcLXmgclU0yCdiqhH5autkiMYb7MzyN0pn83hCDRLTTPKssQ6hswHV1sah/eAQAden03TEUjKATaePDm3Ek35xtkJS3WAMY/PeW4dIydLRdmnqENIGquyO/7NcmTJBdw4C2atrqFTSAEr6t4sbY907WJLhAbKICz+ucx66DttIWYhgpLhrB02CneoWR3Yum5bNw7XumLzR0myYloogSdT9sY+qF+6A58b4/+85jg/nv8UgOaXNB/QCc5BhICk+J3RpPNWuvKvGYedMBmug0UrQC0fcHMmKcYeuMB50CdDHjCEqm4x0EwrcFfApxuNis9ugKLQoAmuYtbw1lD7In8MEaVhYMFMrP8oKhnHhKPJ2W3AYxk5BUU3d10xFTkI64XApWD5GxZS4CVZ0N3bJEARFwuqaDaGvYxxyhFosJ9EzBIrdt+aBKQ=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(39860400002)(376002)(346002)(136003)(451199021)(46966006)(36840700001)(40470700004)(47076005)(36860700001)(16526019)(186003)(26005)(1076003)(41300700001)(2616005)(83380400001)(6666004)(426003)(336012)(7696005)(478600001)(110136005)(40460700003)(54906003)(70586007)(82740400003)(6636002)(356005)(921005)(82310400005)(40480700001)(316002)(81166007)(4326008)(7416002)(8676002)(70206006)(5660300002)(44832011)(86362001)(36756003)(2906002)(8936002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2023 02:43:35.5296 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f3a26c40-d72b-4517-7d32-08db60b7aa4e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT084.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6461
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
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-acpi@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 ath11k@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Qualcomm wifi adapters are utilized in systems that support AMD's WBRF
interference mitigation mechanism. For this mechanism to work frequencies
utilized use must be notified to an ACPI device.

If the kernel is configured with CONFIG_ACPI_WBRF then notify this ACPI
device accordingly.

Change based on code review, not tested due to lack of hardware.

Signed-off-by: Evan Quan <evan.quan@amd.com>
---
v1->v2:
  - drop unnecessary EXPORT_SYMBOL_GPL(Mario)
---
 drivers/net/wireless/ath/ath12k/core.c | 21 +++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/core.h | 14 ++++++++++++++
 drivers/net/wireless/ath/ath12k/mac.c  |  4 ++++
 drivers/net/wireless/ath/ath12k/pci.c  |  3 +++
 4 files changed, 42 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index a89e66653f04..fde811524756 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -14,6 +14,7 @@
 #include "dp_rx.h"
 #include "debug.h"
 #include "hif.h"
+#include "../ath.h"
 
 unsigned int ath12k_debug_mask;
 module_param_named(debug_mask, ath12k_debug_mask, uint, 0644);
@@ -935,5 +936,25 @@ struct ath12k_base *ath12k_core_alloc(struct device *dev, size_t priv_size,
 	return NULL;
 }
 
+#if defined(CONFIG_ACPI_WBRF)
+int ath12k_add_wbrf(struct ath12k_base *ab,
+		    struct cfg80211_chan_def *chandef)
+{
+	if (!ab->wbrf)
+		return 0;
+
+	return ath_add_wbrf(ab->dev, chandef);
+}
+
+int ath12k_remove_wbrf(struct ath12k_base *ab,
+		       struct cfg80211_chan_def *chandef)
+{
+	if (!ab->wbrf)
+		return 0;
+
+	return ath_remove_wbrf(ab->dev, chandef);
+}
+#endif
+
 MODULE_DESCRIPTION("Core module for Qualcomm Atheros 802.11be wireless LAN cards.");
 MODULE_LICENSE("Dual BSD/GPL");
diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index 9439052a652e..53ffb679b5c1 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -736,6 +736,8 @@ struct ath12k_base {
 	u64 fw_soc_drop_count;
 	bool static_window_map;
 
+	bool wbrf;
+
 	/* must be last */
 	u8 drv_priv[] __aligned(sizeof(void *));
 };
@@ -820,4 +822,16 @@ static inline const char *ath12k_bus_str(enum ath12k_bus bus)
 	return "unknown";
 }
 
+#ifdef CONFIG_ACPI_WBRF
+int ath12k_add_wbrf(struct ath12k_base *ab, struct cfg80211_chan_def *chandef);
+int ath12k_remove_wbrf(struct ath12k_base *ab, struct cfg80211_chan_def *chandef);
+#else
+static inline
+int ath12k_add_wbrf(struct ath12k_base *ab,
+		    struct cfg80211_chan_def *chandef) { return 0; }
+static inline
+int ath12k_remove_wbrf(struct ath12k_base *ab0,
+		       struct cfg80211_chan_def *chandef) { return 0; }
+#endif /* CONFIG_ACPI_WBRF */
+
 #endif /* _CORE_H_ */
diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index ee792822b411..999354d60228 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -5396,6 +5396,8 @@ static int ath12k_mac_op_add_chanctx(struct ieee80211_hw *hw,
 
 	mutex_lock(&ar->conf_mutex);
 
+	ath12k_add_wbrf(ab, &ctx->def);
+
 	spin_lock_bh(&ar->data_lock);
 	/* TODO: In case of multiple channel context, populate rx_channel from
 	 * Rx PPDU desc information.
@@ -5420,6 +5422,8 @@ static void ath12k_mac_op_remove_chanctx(struct ieee80211_hw *hw,
 
 	mutex_lock(&ar->conf_mutex);
 
+	ath12k_remove_wbrf(ab, &ctx->def);
+
 	spin_lock_bh(&ar->data_lock);
 	/* TODO: In case of there is one more channel context left, populate
 	 * rx_channel with the channel of that remaining channel context.
diff --git a/drivers/net/wireless/ath/ath12k/pci.c b/drivers/net/wireless/ath/ath12k/pci.c
index 9f174daf324c..544d93d66d69 100644
--- a/drivers/net/wireless/ath/ath12k/pci.c
+++ b/drivers/net/wireless/ath/ath12k/pci.c
@@ -13,6 +13,7 @@
 #include "hif.h"
 #include "mhi.h"
 #include "debug.h"
+#include "../ath.h"
 
 #define ATH12K_PCI_BAR_NUM		0
 #define ATH12K_PCI_DMA_MASK		32
@@ -1272,6 +1273,8 @@ static int ath12k_pci_probe(struct pci_dev *pdev,
 		goto err_ce_free;
 	}
 
+	ab->wbrf = ath_check_wbrf_support(ab->dev);
+
 	ret = ath12k_core_init(ab);
 	if (ret) {
 		ath12k_err(ab, "failed to init core: %d\n", ret);
-- 
2.34.1

