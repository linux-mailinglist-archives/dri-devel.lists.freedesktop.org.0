Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CFFB67153D3
	for <lists+dri-devel@lfdr.de>; Tue, 30 May 2023 04:43:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C68E810E325;
	Tue, 30 May 2023 02:43:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2040.outbound.protection.outlook.com [40.107.223.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6334710E320;
 Tue, 30 May 2023 02:43:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S4TVo8gkNebwDvw3ZJR7fBe+aK65Hebt9WgacdU+GwR4dU77We3PcaUHriiu4F6Pr6TklWzC0HfLvxF/jX/qtMybFTwQC1QhZ++iCLKY7WWp4MQ9Uf4fUcIurXMRy569OuIslDX9UraUaypRE26ErWKi1N+LnrV7+MYaGr/GJzFFbxWGnVzFLAa/TUzkNJOdpsv0AddZQKq7sAuhQDD6EHoKlu+def/HRcUvPwXam2ITiRvSZvQPNjOb2i74jlQutyLSQqE1YpY70Pc/oJvgOSwYNg5/+t11c081fYnT/o9/XRpFWfgyrQd8C5QbuVqyFN96z0GkN4bnmnLLQ1e5tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zP2Mj09EECWAAQZ5Co1FJARpQzmGjUwt6MWpCVUUISk=;
 b=KKv4BAR8DmJhkHuPtcT5Cgq7QjbTgm8gQ5BHKevHXe8bEkDP+ZJJSwOoIPWl6yBL+LIOwQAsS3c/h3Lh1l78JJ2hU5zHW773AIzERsODFEzFAicHyFhz+/LVvUAs3vQ6yfChb5MfJiweCqR47fGZwHjt4HPN8UHw13kqMHcLVcggB08WtrfGbaP/ubOoz0Ko6E2vDjJa2Sj1oNOwFh+CN8cFrMC9ICcRQicqGjpzXZO3G+SHAiG0eH5+XvsRRVoWFf99e3rKdVqkx1Veqr7HA31h9xH4JNnoU2E4faNQy09YTZ43un7+hGwP6xBQxok+rN8cfrmqAxeYjyImoed4rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zP2Mj09EECWAAQZ5Co1FJARpQzmGjUwt6MWpCVUUISk=;
 b=HXpgRyGc9afmhE8nK1Y030vurKE3vpQP/TjmotDewmfO5I62BiTFsDvfJ3EW0k8exYPjIfhdyGSmast1wjxuCRlxW+rM+K7ui9rJ4jpM2vkkgIoO97lFEktJhLFj/Y1wfDQIqZRZgeAElr6l2yk53JA+PhhGlC/HidWqlbOYqj4=
Received: from BN0PR04CA0064.namprd04.prod.outlook.com (2603:10b6:408:ea::9)
 by DM4PR12MB5817.namprd12.prod.outlook.com (2603:10b6:8:60::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23; Tue, 30 May
 2023 02:43:30 +0000
Received: from BN8NAM11FT009.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:ea:cafe::d8) by BN0PR04CA0064.outlook.office365.com
 (2603:10b6:408:ea::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23 via Frontend
 Transport; Tue, 30 May 2023 02:43:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT009.mail.protection.outlook.com (10.13.176.65) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6455.21 via Frontend Transport; Tue, 30 May 2023 02:43:29 +0000
Received: from equan-buildpc.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 29 May
 2023 21:43:22 -0500
From: Evan Quan <evan.quan@amd.com>
To: <rafael@kernel.org>, <lenb@kernel.org>, <alexander.deucher@amd.com>,
 <christian.koenig@amd.com>, <Xinhui.Pan@amd.com>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <evan.quan@amd.com>, <kvalo@kernel.org>, <nbd@nbd.name>,
 <lorenzo@kernel.org>, <ryder.lee@mediatek.com>, <shayne.chen@mediatek.com>,
 <sean.wang@mediatek.com>, <matthias.bgg@gmail.com>,
 <angelogioacchino.delregno@collabora.com>, <Mario.Limonciello@amd.com>,
 <Lijo.Lazar@amd.com>
Subject: [PATCH 3/9] wifi: ath11k: Add support to the Qualcomm ath11k for ACPI
 WBRF
Date: Tue, 30 May 2023 10:42:21 +0800
Message-ID: <20230530024227.2139632-4-evan.quan@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN8NAM11FT009:EE_|DM4PR12MB5817:EE_
X-MS-Office365-Filtering-Correlation-Id: 94453707-cbff-4f29-45e4-08db60b7a6f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +GiiDLZlBp9AlsJidV/FCrH0I0U/fdHi5446wYzU6n1c9XiAFznERRGOzTh1Y+vK3WmfZlzmtxtVwwQA6m8SbM3OEfRWZOgygt1wDGcKxB7AYIhpE1Jx2udwpogy3VlXE1XtTokeVgH+FxpsndNGzD5eMRlZF1Sr1nz9JBFmkKTGcw3NqC634CE5UZpfeD19YFL9+7gVoILmJEAA5KBRYm0USBCdNlgNpBhtKs+9C/N57r26zQ6lIpXjlvHMnnTTsym4jIAmNBnoiiFROY3aR0ihSQG3TE96jRgIcBQqy1ukgGrqdOBIkAI61xKlNSvv/zoCI/MQveWuwjPkieRyQFlDmTEFTwtOA82wmigsVFYsjFEtHlW49BVe329VBRqXdwtUyKjLYUuzdpyI9fgnhyRjJGr8NcYEyEYsJyaMIuL8i85re0jas8hyHrPRW3NNcynGWKT4hhWMeUSnpQrMdLpNAZ9uz0n8qsIJEnLlIVP4wHwB5cP8fhRcS5N1en85KkjNSJP/Ec+tjY4E5q5en0Ix/yD+fcCK3+wx57fKH0sbsO7SRBgqVjjqmLsSpfSXYzrmPqDA7dJZ4p7UxdAhds/rIRkdIMR4rCvFMneRW9mY3DUSZ0pveGElQaZuq6/xCReBodJrvXP/WcUu5AhcrWqO1vOzWiv4KTfIltRmo9rrTNMly/u/MxFDDm0UAGoRszqpbliz9El0nPz5oELGIZVU7BJRGHbfIdnaaox8XKmL7TKmjOko0NrMu8nwuvFKaRqqFPy/34GZZfilaaG2slYkRwXPHuTW44x63PdIM78=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(346002)(136003)(39860400002)(376002)(451199021)(46966006)(36840700001)(40470700004)(54906003)(478600001)(110136005)(40460700003)(8936002)(44832011)(7416002)(5660300002)(8676002)(2906002)(86362001)(36756003)(82310400005)(70206006)(70586007)(4326008)(6636002)(82740400003)(81166007)(356005)(921005)(316002)(40480700001)(41300700001)(2616005)(16526019)(336012)(426003)(186003)(1076003)(26005)(47076005)(7696005)(36860700001)(83380400001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2023 02:43:29.8790 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 94453707-cbff-4f29-45e4-08db60b7a6f0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT009.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5817
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
 Anson Tsao <anson.tsao@amd.com>, ath11k@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Anson Tsao <anson.tsao@amd.com>

Qualcomm wifi adapters are utilized in systems that support AMD's WBRF
interference mitigation mechanism. For this mechanism to work frequencies
utilized use must be notified to an ACPI device.

If the kernel is configured with CONFIG_ACPI_WBRF then notify this ACPI
device accordingly.

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.23

Signed-off-by: Anson Tsao <anson.tsao@amd.com>
Signed-off-by: Evan Quan <evan.quan@amd.com>
Co-developed-by: Evan Quan <evan.quan@amd.com>
--
v1->v2:
  - Fix possible NULL pointer dereference caused by ar->hw->conf.chandef.chan
v2->v3:
  - correct the timing for `ath11k_add_wbrf` and `ath11k_remove_wbrf`
    calling
---
 drivers/net/wireless/ath/Makefile      |  1 +
 drivers/net/wireless/ath/acpi_wbrf.c   | 45 ++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath.h         | 15 +++++++++
 drivers/net/wireless/ath/ath11k/core.c | 23 +++++++++++++
 drivers/net/wireless/ath/ath11k/core.h | 14 ++++++++
 drivers/net/wireless/ath/ath11k/mac.c  |  4 +++
 drivers/net/wireless/ath/ath11k/pci.c  |  3 ++
 7 files changed, 105 insertions(+)
 create mode 100644 drivers/net/wireless/ath/acpi_wbrf.c

diff --git a/drivers/net/wireless/ath/Makefile b/drivers/net/wireless/ath/Makefile
index 8d6e6e218d24..234e904bdfa9 100644
--- a/drivers/net/wireless/ath/Makefile
+++ b/drivers/net/wireless/ath/Makefile
@@ -21,5 +21,6 @@ ath-objs :=	main.o \
 
 ath-$(CONFIG_ATH_DEBUG) += debug.o
 ath-$(CONFIG_ATH_TRACEPOINTS) += trace.o
+ath-$(CONFIG_ACPI_WBRF) += acpi_wbrf.o
 
 CFLAGS_trace.o := -I$(src)
diff --git a/drivers/net/wireless/ath/acpi_wbrf.c b/drivers/net/wireless/ath/acpi_wbrf.c
new file mode 100644
index 000000000000..98b3416eca4d
--- /dev/null
+++ b/drivers/net/wireless/ath/acpi_wbrf.c
@@ -0,0 +1,45 @@
+// SPDX-License-Identifier: ISC
+/* Copyright (C) 2023 Advanced Micro Devices */
+
+#include <linux/wbrf.h>
+#include "ath.h"
+
+bool ath_check_wbrf_support(struct device *dev)
+{
+	struct acpi_device *acpi_dev = ACPI_COMPANION(dev);
+	bool wbrf_supported;
+
+	if (!acpi_dev) {
+		dev_dbg(dev, "ACPI companion not found\n");
+		return false;
+	}
+
+	wbrf_supported = wbrf_supported_producer(acpi_dev);
+	dev_dbg(dev, "WBRF is %s supported\n",
+		wbrf_supported ? "" : "not");
+
+	return wbrf_supported;
+}
+EXPORT_SYMBOL_GPL(ath_check_wbrf_support);
+
+int ath_add_wbrf(struct device *dev, struct cfg80211_chan_def *chandef)
+{
+	struct acpi_device *acpi_dev = ACPI_COMPANION(dev);
+
+	if (!acpi_dev)
+		return -ENODEV;
+
+	return wbrf_add_exclusion_wlan(acpi_dev, chandef);
+}
+EXPORT_SYMBOL_GPL(ath_add_wbrf);
+
+int ath_remove_wbrf(struct device *dev, struct cfg80211_chan_def *chandef)
+{
+	struct acpi_device *acpi_dev = ACPI_COMPANION(dev);
+
+	if (!acpi_dev)
+		return -ENODEV;
+
+	return wbrf_remove_exclusion_wlan(acpi_dev, chandef);
+}
+EXPORT_SYMBOL_GPL(ath_remove_wbrf);
diff --git a/drivers/net/wireless/ath/ath.h b/drivers/net/wireless/ath/ath.h
index f02a308a9ffc..c9f5c9a67c0a 100644
--- a/drivers/net/wireless/ath/ath.h
+++ b/drivers/net/wireless/ath/ath.h
@@ -334,4 +334,19 @@ static inline const char *ath_bus_type_to_string(enum ath_bus_type bustype)
 	return ath_bus_type_strings[bustype];
 }
 
+#ifdef CONFIG_ACPI_WBRF
+bool ath_check_wbrf_support(struct device *dev);
+int ath_add_wbrf(struct device *dev, struct cfg80211_chan_def *chandef);
+int ath_remove_wbrf(struct device *dev, struct cfg80211_chan_def *chandef);
+#else
+static inline
+bool ath_check_wbrf_support(struct device *dev) { return false; }
+static inline
+int ath_add_wbrf(struct device *dev,
+		 struct cfg80211_chan_def *chandef) { return 0; }
+static inline
+int ath_remove_wbrf(struct device *dev,
+		    struct cfg80211_chan_def *chandef) { return 0; }
+#endif
+
 #endif /* ATH_H */
diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index b1b90bd34d67..1f1eed9c8ae7 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -16,6 +16,7 @@
 #include "debug.h"
 #include "hif.h"
 #include "wow.h"
+#include "../ath.h"
 
 unsigned int ath11k_debug_mask;
 EXPORT_SYMBOL(ath11k_debug_mask);
@@ -2035,5 +2036,27 @@ struct ath11k_base *ath11k_core_alloc(struct device *dev, size_t priv_size,
 }
 EXPORT_SYMBOL(ath11k_core_alloc);
 
+#if defined(CONFIG_ACPI_WBRF)
+int ath11k_add_wbrf(struct ath11k_base *ab,
+		    struct cfg80211_chan_def *chandef)
+{
+	if (!ab->wbrf)
+		return 0;
+
+	return ath_add_wbrf(ab->dev, chandef);
+}
+EXPORT_SYMBOL_GPL(ath11k_add_wbrf);
+
+int ath11k_remove_wbrf(struct ath11k_base *ab,
+		       struct cfg80211_chan_def *chandef)
+{
+	if (!ab->wbrf)
+		return 0;
+
+	return ath_remove_wbrf(ab->dev, chandef);
+}
+EXPORT_SYMBOL_GPL(ath11k_remove_wbrf);
+#endif
+
 MODULE_DESCRIPTION("Core module for Qualcomm Atheros 802.11ax wireless LAN cards.");
 MODULE_LICENSE("Dual BSD/GPL");
diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index 0830276e5028..02975d012875 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -978,6 +978,8 @@ struct ath11k_base {
 		const struct ath11k_pci_ops *ops;
 	} pci;
 
+	bool wbrf;
+
 	/* must be last */
 	u8 drv_priv[] __aligned(sizeof(void *));
 };
@@ -1236,4 +1238,16 @@ static inline const char *ath11k_bus_str(enum ath11k_bus bus)
 	return "unknown";
 }
 
+#ifdef CONFIG_ACPI_WBRF
+int ath11k_add_wbrf(struct ath11k_base *ab, struct cfg80211_chan_def *chandef);
+int ath11k_remove_wbrf(struct ath11k_base *ab, struct cfg80211_chan_def *chandef);
+#else
+static inline
+int ath11k_add_wbrf(struct ath11k_base *ab,
+		    struct cfg80211_chan_def *chandef) { return 0; }
+static inline
+int ath11k_remove_wbrf(struct ath11k_base *ab0,
+		       struct cfg80211_chan_def *chandef) { return 0; }
+#endif /* CONFIG_ACPI_WBRF */
+
 #endif /* _CORE_H_ */
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 1c93f1afccc5..b96e13ae816b 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -6838,6 +6838,8 @@ static int ath11k_mac_op_add_chanctx(struct ieee80211_hw *hw,
 
 	mutex_lock(&ar->conf_mutex);
 
+	ath11k_add_wbrf(ar->ab, &ctx->def);
+
 	spin_lock_bh(&ar->data_lock);
 	/* TODO: In case of multiple channel context, populate rx_channel from
 	 * Rx PPDU desc information.
@@ -6862,6 +6864,8 @@ static void ath11k_mac_op_remove_chanctx(struct ieee80211_hw *hw,
 
 	mutex_lock(&ar->conf_mutex);
 
+	ath11k_remove_wbrf(ar->ab, &ctx->def);
+
 	spin_lock_bh(&ar->data_lock);
 	/* TODO: In case of there is one more channel context left, populate
 	 * rx_channel with the channel of that remaining channel context.
diff --git a/drivers/net/wireless/ath/ath11k/pci.c b/drivers/net/wireless/ath/ath11k/pci.c
index 7b33731a50ee..f648f92c7564 100644
--- a/drivers/net/wireless/ath/ath11k/pci.c
+++ b/drivers/net/wireless/ath/ath11k/pci.c
@@ -15,6 +15,7 @@
 #include "mhi.h"
 #include "debug.h"
 #include "pcic.h"
+#include "../ath.h"
 
 #define ATH11K_PCI_BAR_NUM		0
 #define ATH11K_PCI_DMA_MASK		32
@@ -891,6 +892,8 @@ static int ath11k_pci_probe(struct pci_dev *pdev,
 		goto err_irq_affinity_cleanup;
 	}
 
+	ab->wbrf = ath_check_wbrf_support(ab->dev);
+
 	ret = ath11k_core_init(ab);
 	if (ret) {
 		ath11k_err(ab, "failed to init core: %d\n", ret);
-- 
2.34.1

