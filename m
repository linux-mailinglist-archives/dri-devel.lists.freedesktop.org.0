Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8553D7153D1
	for <lists+dri-devel@lfdr.de>; Tue, 30 May 2023 04:43:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84E8F10E10B;
	Tue, 30 May 2023 02:43:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2073.outbound.protection.outlook.com [40.107.223.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC25F10E323;
 Tue, 30 May 2023 02:43:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B5JV+zHIRVA97ySwN9qWCFelbrhvEIHXP4AIuHYRnT7uTee9C3ohRuEhV7PTQHWrVuJ5TnvBLugj7EH/AgZQZ8whSi7zkfvivlc0EstjGQjOVcVCtA9RazGIjQzhW1CjfTHinCuxryDo3p0DBqLLQ4gfCkjFtlCByYT4z/D9HdMBJkfU99dDcmUAo/uGmSrZbsabRbA5NEpxaf27aEIJvOawLkUQq1W+EqNCzG2mhNii45Qz0dOpEeF0H84ppHhOtYhzsTUIJOQ+s8yDJAynGD+jQqtk7tgyOsm7tZISO3HuBejMNoQrqH2M4V36WDUMjU0PIZDgVS/nfcNbwLQhUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BxSJbwsexBc+KyHw60xot62C2fTQOYaZTLymbSgTBGY=;
 b=e1KtJZ1FgGGkj63o8P3BV2ryoasBOvd8moKZjkpX93Hmj+dG6Tpuv3mLzWrlyLnhPL/9crzyUBUrpBfNFUDI9xESAck+ellwMd4SvZzdm0p6CPME+LawLprcddj6FtZo/iCCWWTORT/rIvcDeney0UWfsR8MkKStIuUdK0TfaGhQVTdS4z+Tt4LINcn92HfMhed/ZaaKlXKQNunBf74y4ZAlzc+9vjoDC0/ZlXg+myRrxjXLdIGUc8F396yt6N7aU7lKWk02c02YOj9Gb0Z2iDCbeTg/KuaLnzLhkuW4nvz9m29JRdG1PiwVb1EAg/7zPI0dhg7auzQbcgCscUnfOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BxSJbwsexBc+KyHw60xot62C2fTQOYaZTLymbSgTBGY=;
 b=lsGhQ3+EP88srSDFtEKYj+84yGhgWVmHNawM+8BBhGjFNmZACroRc8DtqwuuKare2qXUHQMKhpUJlKKgaMbRdeWh/yRqdX9j6Hd9TKAV2lcq3j3H+FvJWUI2fEg5SWGCeZjS1aS3zMGVsTbuQwTjaVynhumdeuwtVelmfxW+c6k=
Received: from BN0PR02CA0023.namprd02.prod.outlook.com (2603:10b6:408:e4::28)
 by SN7PR12MB6931.namprd12.prod.outlook.com (2603:10b6:806:261::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.22; Tue, 30 May
 2023 02:43:22 +0000
Received: from BN8NAM11FT072.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e4:cafe::b4) by BN0PR02CA0023.outlook.office365.com
 (2603:10b6:408:e4::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23 via Frontend
 Transport; Tue, 30 May 2023 02:43:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT072.mail.protection.outlook.com (10.13.176.165) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6455.21 via Frontend Transport; Tue, 30 May 2023 02:43:22 +0000
Received: from equan-buildpc.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 29 May
 2023 21:43:16 -0500
From: Evan Quan <evan.quan@amd.com>
To: <rafael@kernel.org>, <lenb@kernel.org>, <alexander.deucher@amd.com>,
 <christian.koenig@amd.com>, <Xinhui.Pan@amd.com>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <evan.quan@amd.com>, <kvalo@kernel.org>, <nbd@nbd.name>,
 <lorenzo@kernel.org>, <ryder.lee@mediatek.com>, <shayne.chen@mediatek.com>,
 <sean.wang@mediatek.com>, <matthias.bgg@gmail.com>,
 <angelogioacchino.delregno@collabora.com>, <Mario.Limonciello@amd.com>,
 <Lijo.Lazar@amd.com>
Subject: [PATCH 2/9] mt76: Add support to the Mediatek MT7921 for ACPI WBRF
Date: Tue, 30 May 2023 10:42:20 +0800
Message-ID: <20230530024227.2139632-3-evan.quan@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN8NAM11FT072:EE_|SN7PR12MB6931:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a9494a4-52b5-46a3-0a5b-08db60b7a29a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 309PcQx+nfcsSTS/Alen5rZtJmqhuMyroDWYCdaHycvclIS8ZrAEkHi6lDBKo/zDEzvXx5mQfwEL39aoNURPeK6cKbgY1HL0aZnp0Pdna6yQer+ortyCJxkuLW0niSci4oeZC4eEttKK/LeW8z/aFTlitf0KYxEih2OzuQHwlGN+TxJbEhpwynIAWxQLuj/6CAWWC+157pA5/eIDfS13XURG6j6Y95ud+gfbKneRD+xA2Qv4klGEbo7jm9EzFx8JGVOTV9Ytcn9q4DsOlxWiBayt2H1WLpVPh2pIjD30UomqWqpJO08HbzX35ega75ZJjUw92rxVvRn8pbNtO4MtzCXBLdOa4P/g6TmpkqngVhB6d5timyiyh/8jG/6rTR02MsZDww35CxYfLD/GjrzWcD0bMdMoSppL8vhRizD/ab6ZnGfxcXEhGEw/i5ont0yy5uMJeQZCWmkE7Cnu32CqhwvJGmE0nqFvxgpWAFmuw1J1g2i+qyqqXElsQVcG463uqRFUxEBksXCXyyIWWGZSueNa9odpiLZuW7lhQxeEaJOwLe8212tvNUqpbFDuW+VnNnO455nu+3BSko87zfETsTZ6OnS9tH2ZzHct/ZKzc6o761iDAtzZB8tQGlT66bPJGznjw/fp55H/FHR+hYpNeX7wmm6UUXesMUH2nYLUlETwsMNSuSzJOTAVqasWyZaO3yQMvCikutcYJsPazrqJ8B7/dBpsNdMUhEBBLoomWlxTo2UAtuKkOJWw6ylC8vk0I35B85Wx+5Yb4Ice+BlJ4lPgCBrxExayKk3ukbLgsVo=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(39860400002)(346002)(376002)(136003)(451199021)(36840700001)(40470700004)(46966006)(186003)(2906002)(2616005)(110136005)(54906003)(16526019)(336012)(426003)(478600001)(1076003)(26005)(44832011)(47076005)(86362001)(40460700003)(36860700001)(7696005)(356005)(81166007)(8676002)(41300700001)(82740400003)(8936002)(921005)(40480700001)(316002)(5660300002)(6666004)(70586007)(70206006)(82310400005)(36756003)(7416002)(6636002)(4326008)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2023 02:43:22.6030 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a9494a4-52b5-46a3-0a5b-08db60b7a29a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT072.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6931
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
 Anson Taso <anson.tsao@amd.com>, ath11k@lists.infradead.org,
 Mario Limonciello <mario.limonciello@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Mario Limonciello <mario.limonciello@amd.com>

Mediatek wifi adapters are utilized in systems that support AMD's WBRF
interference mitigation mechanism. For this mechanism to work frequencies
utilized use must be notified to an ACPI device.

If the kernel is configured with CONFIG_ACPI_WBRF then notify this ACPI
device accordingly.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Anson Taso <anson.tsao@amd.com>
Co-developed-by: Anson Taso <anson.tsao@amd.com>
--
v1->v2:
  - Fix build errors below for mt76 w/ WBRF enabled
    ERROR: modpost: "mt76_add_wbrf" [drivers/net/wireless/mediatek/mt76/mt76x2/mt76x2e.ko] undefined!
    ERROR: modpost: "mt76_remove_wbrf" [drivers/net/wireless/mediatek/mt76/mt76x2/mt76x2e.ko] undefined!
    ERROR: modpost: "mt76_init_acpi_wbrf" [drivers/net/wireless/mediatek/mt76/mt7921/mt7921-common.ko] undefined!
v2->v3:
  - add support to the real driver(mt7921/main.c) which supports
    Mediatek MT7921
---
 drivers/net/wireless/mediatek/mt76/Makefile   |  1 +
 .../net/wireless/mediatek/mt76/acpi_wbrf.c    | 36 +++++++++++++++++++
 drivers/net/wireless/mediatek/mt76/mt76.h     | 19 ++++++++++
 .../net/wireless/mediatek/mt76/mt7921/init.c  |  2 ++
 .../net/wireless/mediatek/mt76/mt7921/main.c  |  3 ++
 5 files changed, 61 insertions(+)
 create mode 100644 drivers/net/wireless/mediatek/mt76/acpi_wbrf.c

diff --git a/drivers/net/wireless/mediatek/mt76/Makefile b/drivers/net/wireless/mediatek/mt76/Makefile
index 84c99b7e57f9..c016c71f23bd 100644
--- a/drivers/net/wireless/mediatek/mt76/Makefile
+++ b/drivers/net/wireless/mediatek/mt76/Makefile
@@ -12,6 +12,7 @@ mt76-y := \
 
 mt76-$(CONFIG_PCI) += pci.o
 mt76-$(CONFIG_NL80211_TESTMODE) += testmode.o
+mt76-$(CONFIG_ACPI_WBRF) += acpi_wbrf.o
 
 mt76-usb-y := usb.o usb_trace.o
 mt76-sdio-y := sdio.o sdio_txrx.o
diff --git a/drivers/net/wireless/mediatek/mt76/acpi_wbrf.c b/drivers/net/wireless/mediatek/mt76/acpi_wbrf.c
new file mode 100644
index 000000000000..ceef57bddc6f
--- /dev/null
+++ b/drivers/net/wireless/mediatek/mt76/acpi_wbrf.c
@@ -0,0 +1,36 @@
+// SPDX-License-Identifier: ISC
+/* Copyright (C) 2023 Advanced Micro Devices */
+
+#include <linux/wbrf.h>
+#include "mt76.h"
+
+#if defined(CONFIG_ACPI_WBRF)
+void mt76_init_acpi_wbrf(struct mt76_dev *dev)
+{
+	struct acpi_device *acpi_dev = ACPI_COMPANION(dev->dev);
+
+	if (!acpi_dev) {
+		dev_dbg(dev->dev, "ACPI companion not found\n");
+		return;
+	}
+
+	dev->phy.wbrf = wbrf_supported_producer(acpi_dev);
+	dev_dbg(dev->dev, "WBRF is %s supported\n",
+		dev->phy.wbrf ? "" : "not");
+}
+EXPORT_SYMBOL_GPL(mt76_init_acpi_wbrf);
+int mt76_add_wbrf(struct mt76_dev *dev, struct cfg80211_chan_def *chandef)
+{
+	if (!dev->phy.wbrf)
+		return 0;
+	return wbrf_add_exclusion_wlan(ACPI_COMPANION(dev->dev), chandef);
+}
+EXPORT_SYMBOL_GPL(mt76_add_wbrf);
+int mt76_remove_wbrf(struct mt76_dev *dev, struct cfg80211_chan_def *chandef)
+{
+	if (!dev->phy.wbrf)
+		return 0;
+	return wbrf_remove_exclusion_wlan(ACPI_COMPANION(dev->dev), chandef);
+}
+EXPORT_SYMBOL_GPL(mt76_remove_wbrf);
+#endif
diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index 6b07b8fafec2..fd33a553ba2e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -733,6 +733,7 @@ struct mt76_phy {
 	int txpower_cur;
 	u8 antenna_mask;
 	u16 chainmask;
+	bool wbrf;
 
 #ifdef CONFIG_NL80211_TESTMODE
 	struct mt76_testmode_data test;
@@ -1511,4 +1512,22 @@ mt76_packet_id_flush(struct mt76_dev *dev, struct mt76_wcid *wcid)
 	idr_destroy(&wcid->pktid);
 }
 
+#ifdef CONFIG_ACPI_WBRF
+void mt76_init_acpi_wbrf(struct mt76_dev *dev);
+int mt76_add_wbrf(struct mt76_dev *dev, struct cfg80211_chan_def *chandef);
+int mt76_remove_wbrf(struct mt76_dev *dev, struct cfg80211_chan_def *chandef);
+#else
+static inline void mt76_init_acpi_wbrf(struct mt76_dev *dev) { };
+static inline int
+mt76_add_wbrf(struct mt76_dev *dev, struct cfg80211_chan_def *chandef)
+{
+	return 0;
+}
+static inline int
+mt76_remove_wbrf(struct mt76_dev *dev, struct cfg80211_chan_def *chandef)
+{
+	return 0;
+}
+#endif /* CONFIG_ACPI_WBRF */
+
 #endif
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/init.c b/drivers/net/wireless/mediatek/mt76/mt7921/init.c
index bf1da9fddfab..91396139a177 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/init.c
@@ -420,6 +420,8 @@ int mt7921_register_device(struct mt7921_dev *dev)
 
 	mt7921_init_acpi_sar(dev);
 
+	mt76_init_acpi_wbrf(&dev->mt76);
+
 	ret = mt7921_init_wcid(dev);
 	if (ret)
 		return ret;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/main.c b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
index 3b6adb29cbef..241d5b1729dd 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
@@ -480,6 +480,8 @@ static int mt7921_set_channel(struct mt7921_phy *phy)
 	mt7921_mutex_acquire(dev);
 	set_bit(MT76_RESET, &phy->mt76->state);
 
+	mt76_remove_wbrf(phy->mt76->dev, &phy->mt76->chandef);
+
 	mt76_set_channel(phy->mt76);
 
 	ret = mt7921_mcu_set_chan_info(phy, MCU_EXT_CMD(CHANNEL_SWITCH));
@@ -493,6 +495,7 @@ static int mt7921_set_channel(struct mt7921_phy *phy)
 
 out:
 	clear_bit(MT76_RESET, &phy->mt76->state);
+	mt76_add_wbrf(phy->mt76->dev, &phy->mt76->chandef);
 	mt7921_mutex_release(dev);
 
 	mt76_worker_schedule(&dev->mt76.tx_worker);
-- 
2.34.1

