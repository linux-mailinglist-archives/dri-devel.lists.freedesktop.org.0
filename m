Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24D4274D020
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jul 2023 10:38:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F8E210E22F;
	Mon, 10 Jul 2023 08:38:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2063.outbound.protection.outlook.com [40.107.237.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF61A10E227;
 Mon, 10 Jul 2023 08:38:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ufuz5toGgnkBZck8Nv0xshqVd4+ZIrUb0v7y6l7ZragKp63e+/dhlTtjni6OLgqHEjbNnYE1CF/3U2iED+gEabZTMm00n3hKo5pUYjiwTJ+t3d3kcNRXj7GXjLWcFkEwE0TyqVZb6o7Oz5RfhUMliK6RVQU7dmOKE+m6Z0Khi+73EoG0PXBMuJMLLg4xjPEnCdq6kMRQQ1RDKvGSPtTcFdot4GOPXcoNbUgBPQSXvNfEzqSUnUMP/DnNEn8MdQd/KvESyLLNMWi+s/gAvwbZPdzw9k09O2OY2Ha4TyeGwnCiCyAaJd7529zlVoqKBP0WdDDqY2zw6p3EgXQ/eLBEWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bpornu5Yj7Tw0flQlscdO20Wfpe40rXSOJGeHuvILis=;
 b=IlcKFOhb87VbozvnvtrYk/BGco6N6qy/cupxGL5qcu/RWLsJPs1JHGIXsczNkvZtfgdCBLsdmQbPGDvm/hfkMqq7R75yue+VFZhBIrke/nCrcj1Kwn+oKJwP4e9zrgZa7M/1mYvCkqIZIUh3wlcBIYZFezue8//F8PP4yAtfX2GUY9eHnmX8gCr+aJ2Gw8FJP+gMhDhhIkP1bDtW5ph/htyzlDhiKjTlnzsJrM4o+3zBoPpTFi8v1F1/sOMxhvBa/ZLK6rLcpUHHsATP8ZROieNN7BoahiZcB/6+L5/0YYtFKy8G2y9fJmLjC91VEmHOgAup4Xs3Va+5P2c4yrRE1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bpornu5Yj7Tw0flQlscdO20Wfpe40rXSOJGeHuvILis=;
 b=fZNq8D/egvceuM7ko+bfYCXVmtTA7cXX/ssCr3FKeXfUYa+m247xiEqqk3WVKhIdBGxI6TRabPBL6T/aiLwvn/6O6hSzDzHwMBDyy20UtT5fNkIPNd8cVAnzu/rdacVKZnACu/gGMd+mHPXSIXqBsJpWOT7CUDACyuS/YuE0xVE=
Received: from MW4P221CA0018.NAMP221.PROD.OUTLOOK.COM (2603:10b6:303:8b::23)
 by SA1PR12MB7174.namprd12.prod.outlook.com (2603:10b6:806:2b1::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.30; Mon, 10 Jul
 2023 08:38:34 +0000
Received: from CO1NAM11FT048.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8b:cafe::a4) by MW4P221CA0018.outlook.office365.com
 (2603:10b6:303:8b::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.30 via Frontend
 Transport; Mon, 10 Jul 2023 08:38:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT048.mail.protection.outlook.com (10.13.175.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6588.19 via Frontend Transport; Mon, 10 Jul 2023 08:38:33 +0000
Received: from equan-buildpc.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Mon, 10 Jul
 2023 03:38:25 -0500
From: Evan Quan <evan.quan@amd.com>
To: <rafael@kernel.org>, <lenb@kernel.org>, <Alexander.Deucher@amd.com>,
 <Christian.Koenig@amd.com>, <Xinhui.Pan@amd.com>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <johannes@sipsolutions.net>, <davem@davemloft.net>,
 <edumazet@google.com>, <kuba@kernel.org>, <pabeni@redhat.com>,
 <Mario.Limonciello@amd.com>, <mdaenzer@redhat.com>,
 <maarten.lankhorst@linux.intel.com>, <tzimmermann@suse.de>,
 <hdegoede@redhat.com>, <jingyuwang_vip@163.com>, <Lijo.Lazar@amd.com>,
 <jim.cromie@gmail.com>, <bellosilicio@gmail.com>, <andrealmeid@igalia.com>,
 <trix@redhat.com>, <jsg@jsg.id.au>, <arnd@arndb.de>, <andrew@lunn.ch>
Subject: [PATCH V6 1/9] drivers core: Add support for Wifi band RF mitigations
Date: Mon, 10 Jul 2023 16:36:33 +0800
Message-ID: <20230710083641.2132264-2-evan.quan@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230710083641.2132264-1-evan.quan@amd.com>
References: <20230710083641.2132264-1-evan.quan@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT048:EE_|SA1PR12MB7174:EE_
X-MS-Office365-Filtering-Correlation-Id: 308b663a-03c5-4791-c7ae-08db81210c20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: h7abzS2nI5W+7DS65Wip75VX6eP0cBVEZFZVkcMWi74h0p3fNQ9jjmWbN/YaSDnI3zq3gaNgnu0nwCCqzUfl7A7ejk01pLljopVkGCZ/7Vc9a0u2HIVSqsTYawyDU7uHe8FovOkrDifCDBwVKaJRNCxJuP8RMn2Ee5qRjORwE4uoS4Hc9ozfNnl+Veu9KBFP63x2ZngwNbdJyk6CbNzujq9AaNThLotdhlTaH6qcUn+IJzbpaix131A29aR73XBGUJOK/3TnYxBpOi6WyGhf4JnEa/f7Onpx7hTcYUFvk02Z687AEFSCDpvEktu8F+g3Q9S2uMqmuZH22ZC4hrM7UrbjXhk3Ev7Ay3ZL8K8i+zRffq5Lp8lc9wMqtyMBzK0wnsKKCaI/y5XeShlmjf3u1Eq47iY5QqpL+TNINwq+gEphs5y4oLdAbn5xbZsZ+zsS8YlexKUmrHCVJXxh21Y/V29Z/P+zazJ8TjgIuUH4OVJ9UBywEE/vQZw7SMsu7CeG7uNvngx7/uYMUHB441vhYudUcyV4gC0ON1/oTnQebDn+2LwGq9ZDp7DBmVngbWijAXAXXvPr0rWRHHW/od7W0x/VhkAlA891Z2aOlZMaVTrhDeoKxWu9WpMP9SmCEw+L1fIGQqMkFPmClkIsxjAur5/iEwzAMAzVwG9pUO74FOW+TBZl0/Ev/ulITNuRSXWoOsfflq2bQzG+m5yPrSMGCl9HhmrBKqSWxToyEeZrGV8vnoMfg5w0KQ5+yEWHELUp9axnyve6cBK7yCl4TNb9enmWaNKreXVObNBfsw1bOeIQAictHUj/EMYK9J6ortbH5Agz+psGFLsx4wqVDZdGCA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(376002)(136003)(346002)(396003)(451199021)(36840700001)(40470700004)(46966006)(40460700003)(186003)(16526019)(26005)(2616005)(1076003)(36860700001)(336012)(426003)(83380400001)(47076005)(41300700001)(30864003)(4326008)(2906002)(316002)(44832011)(7416002)(5660300002)(8676002)(8936002)(478600001)(7696005)(6666004)(70586007)(70206006)(110136005)(54906003)(40480700001)(36756003)(921005)(81166007)(356005)(82740400003)(86362001)(82310400005)(83996005)(2101003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2023 08:38:33.8873 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 308b663a-03c5-4791-c7ae-08db81210c20
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT048.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7174
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
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-acpi@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Evan Quan <evan.quan@amd.com>, Mario Limonciello <mario.limonciello@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Due to electrical and mechanical constraints in certain platform designs
there may be likely interference of relatively high-powered harmonics of
the (G-)DDR memory clocks with local radio module frequency bands used
by Wifi 6/6e/7.

To mitigate this, AMD has introduced a mechanism that devices can use to
notify active use of particular frequencies so that other devices can make
relative internal adjustments as necessary to avoid this resonance.

In order for a device to support this, the expected flow for device
driver or subsystems:

Drivers/subsystems contributing frequencies:

1) During probe, check `wbrf_supported_producer` to see if WBRF supported
   for the device.
2) If adding frequencies, then call `wbrf_add_exclusion` with the
   start and end ranges of the frequencies.
3) If removing frequencies, then call `wbrf_remove_exclusion` with
   start and end ranges of the frequencies.

Drivers/subsystems responding to frequencies:

1) During probe, check `wbrf_supported_consumer` to see if WBRF is supported
   for the device.
2) Call the `wbrf_retrieve_exclusions` to retrieve the current
   exclusions on receiving an ACPI notification for a new frequency
   change.

Co-developed-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
Co-developed-by: Evan Quan <evan.quan@amd.com>
Signed-off-by: Evan Quan <evan.quan@amd.com>
--
v4->v5:
  - promote this to be a more generic solution with input argument taking
    `struct device` and provide better scalability to support non-ACPI
    scenarios(Andrew)
  - update the APIs naming and some other minor fixes(Rafael)
---
 drivers/base/Kconfig  |   8 ++
 drivers/base/Makefile |   1 +
 drivers/base/wbrf.c   | 227 ++++++++++++++++++++++++++++++++++++++++++
 include/linux/wbrf.h  |  70 +++++++++++++
 4 files changed, 306 insertions(+)
 create mode 100644 drivers/base/wbrf.c
 create mode 100644 include/linux/wbrf.h

diff --git a/drivers/base/Kconfig b/drivers/base/Kconfig
index 2b8fd6bb7da0..5b441017b225 100644
--- a/drivers/base/Kconfig
+++ b/drivers/base/Kconfig
@@ -242,4 +242,12 @@ config FW_DEVLINK_SYNC_STATE_TIMEOUT
 	  command line option on every system/board your kernel is expected to
 	  work on.
 
+config WBRF
+	bool "Wifi band RF mitigation mechanism"
+	default n
+	help
+	  Wifi band RF mitigation mechanism allows multiple drivers from
+	  different domains to notify the frequencies in use so that hardware
+	  can be reconfigured to avoid harmonic conflicts.
+
 endmenu
diff --git a/drivers/base/Makefile b/drivers/base/Makefile
index 3079bfe53d04..c844f68a6830 100644
--- a/drivers/base/Makefile
+++ b/drivers/base/Makefile
@@ -26,6 +26,7 @@ obj-$(CONFIG_GENERIC_MSI_IRQ) += platform-msi.o
 obj-$(CONFIG_GENERIC_ARCH_TOPOLOGY) += arch_topology.o
 obj-$(CONFIG_GENERIC_ARCH_NUMA) += arch_numa.o
 obj-$(CONFIG_ACPI) += physical_location.o
+obj-$(CONFIG_WBRF) += wbrf.o
 
 obj-y			+= test/
 
diff --git a/drivers/base/wbrf.c b/drivers/base/wbrf.c
new file mode 100644
index 000000000000..2163a8ec8a9a
--- /dev/null
+++ b/drivers/base/wbrf.c
@@ -0,0 +1,227 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Wifi Band Exclusion Interface
+ * Copyright (C) 2023 Advanced Micro Devices
+ *
+ */
+
+#include <linux/wbrf.h>
+
+static BLOCKING_NOTIFIER_HEAD(wbrf_chain_head);
+static DEFINE_MUTEX(wbrf_mutex);
+static struct exclusion_range_pool wbrf_pool;
+
+static int _wbrf_add_exclusion_ranges(struct wbrf_ranges_in *in)
+{
+	int i, j;
+
+	for (i = 0; i < ARRAY_SIZE(in->band_list); i++) {
+		if (!in->band_list[i].start &&
+		    !in->band_list[i].end)
+			continue;
+
+		for (j = 0; j < ARRAY_SIZE(wbrf_pool.band_list); j++) {
+			if (wbrf_pool.band_list[j].start == in->band_list[i].start &&
+			    wbrf_pool.band_list[j].end == in->band_list[i].end) {
+				wbrf_pool.ref_counter[j]++;
+				break;
+			}
+		}
+		if (j < ARRAY_SIZE(wbrf_pool.band_list))
+			continue;
+
+		for (j = 0; j < ARRAY_SIZE(wbrf_pool.band_list); j++) {
+			if (!wbrf_pool.band_list[j].start &&
+			    !wbrf_pool.band_list[j].end) {
+				wbrf_pool.band_list[j].start = in->band_list[i].start;
+				wbrf_pool.band_list[j].end = in->band_list[i].end;
+				wbrf_pool.ref_counter[j] = 1;
+				break;
+			}
+		}
+		if (j >= ARRAY_SIZE(wbrf_pool.band_list))
+			return -ENOSPC;
+	}
+
+	return 0;
+}
+
+static int _wbrf_remove_exclusion_ranges(struct wbrf_ranges_in *in)
+{
+	int i, j;
+
+	for (i = 0; i < ARRAY_SIZE(in->band_list); i++) {
+		if (!in->band_list[i].start &&
+		    !in->band_list[i].end)
+			continue;
+
+		for (j = 0; j < ARRAY_SIZE(wbrf_pool.band_list); j++) {
+			if (wbrf_pool.band_list[j].start == in->band_list[i].start &&
+			    wbrf_pool.band_list[j].end == in->band_list[i].end) {
+				wbrf_pool.ref_counter[j]--;
+				if (!wbrf_pool.ref_counter[j]) {
+					wbrf_pool.band_list[j].start = 0;
+					wbrf_pool.band_list[j].end = 0;
+				}
+				break;
+			}
+		}
+	}
+
+	return 0;
+}
+
+static int _wbrf_retrieve_exclusion_ranges(struct wbrf_ranges_out *out)
+{
+	int out_idx = 0;
+	int i;
+
+	memset(out, 0, sizeof(*out));
+
+	for (i = 0; i < ARRAY_SIZE(wbrf_pool.band_list); i++) {
+		if (!wbrf_pool.band_list[i].start &&
+		    !wbrf_pool.band_list[i].end)
+			continue;
+
+		out->band_list[out_idx].start = wbrf_pool.band_list[i].start;
+		out->band_list[out_idx++].end = wbrf_pool.band_list[i].end;
+	}
+
+	return 0;
+}
+
+/**
+ * wbrf_supported_producer - Determine if the device can report frequencies
+ *
+ * @dev: device pointer
+ *
+ * WBRF is used to mitigate devices that cause harmonic interference.
+ * This function will determine if this device needs to report such frequencies.
+ */
+bool wbrf_supported_producer(struct device *dev)
+{
+	return true;
+}
+EXPORT_SYMBOL_GPL(wbrf_supported_producer);
+
+/**
+ * wbrf_add_exclusion - Add frequency ranges to the exclusion list
+ *
+ * @dev: device pointer
+ * @in: input structure containing the frequency ranges to be added
+ *
+ * Add frequencies into the exclusion list for supported consumers
+ * to react to.
+ */
+int wbrf_add_exclusion(struct device *dev,
+		       struct wbrf_ranges_in *in)
+{
+	int r;
+
+	mutex_lock(&wbrf_mutex);
+
+	r = _wbrf_add_exclusion_ranges(in);
+
+	mutex_unlock(&wbrf_mutex);
+	if (r)
+		return r;
+
+	blocking_notifier_call_chain(&wbrf_chain_head, WBRF_CHANGED, NULL);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(wbrf_add_exclusion);
+
+/**
+ * wbrf_remove_exclusion - Remove frequency ranges from the exclusion list
+ *
+ * @dev: device pointer
+ * @in: input structure containing the frequency ranges to be removed
+ *
+ * Remove frequencies from the exclusion list for supported consumers
+ * to react to.
+ */
+int wbrf_remove_exclusion(struct device *dev,
+			  struct wbrf_ranges_in *in)
+{
+	int r;
+
+	mutex_lock(&wbrf_mutex);
+
+	r = _wbrf_remove_exclusion_ranges(in);
+
+	mutex_unlock(&wbrf_mutex);
+	if (r)
+		return r;
+
+	blocking_notifier_call_chain(&wbrf_chain_head, WBRF_CHANGED, NULL);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(wbrf_remove_exclusion);
+
+/**
+ * wbrf_supported_consumer - Determine if the device can react to frequencies
+ *
+ * @dev: device pointer
+ *
+ * WBRF is used to mitigate devices that cause harmonic interference.
+ * This function will determine if this device needs to react to reports from
+ * other devices for such frequencies.
+ */
+bool wbrf_supported_consumer(struct device *dev)
+{
+	return true;
+}
+EXPORT_SYMBOL_GPL(wbrf_supported_consumer);
+
+/**
+ * wbrf_register_notifier - Register for notifications of frequency changes
+ *
+ * @nb: driver notifier block
+ *
+ * WBRF is used to mitigate devices that cause harmonic interference.
+ * This function will allow consumers to register for frequency notifications.
+ */
+int wbrf_register_notifier(struct notifier_block *nb)
+{
+	return blocking_notifier_chain_register(&wbrf_chain_head, nb);
+}
+EXPORT_SYMBOL_GPL(wbrf_register_notifier);
+
+/**
+ * wbrf_unregister_notifier - Unregister for notifications of frequency changes
+ *
+ * @nb: driver notifier block
+ *
+ * WBRF is used to mitigate devices that cause harmonic interference.
+ * This function will allow consumers to unregister for frequency notifications.
+ */
+int wbrf_unregister_notifier(struct notifier_block *nb)
+{
+	return blocking_notifier_chain_unregister(&wbrf_chain_head, nb);
+}
+EXPORT_SYMBOL_GPL(wbrf_unregister_notifier);
+
+/**
+ * wbrf_retrieve_exclusions - Retrieve the exclusion list
+ *
+ * @dev: device pointer
+ * @out: output structure containing the frequency ranges to be excluded
+ *
+ * Retrieve the current exclusion list
+ */
+int wbrf_retrieve_exclusions(struct device *dev,
+			     struct wbrf_ranges_out *out)
+{
+	int r;
+
+	mutex_lock(&wbrf_mutex);
+
+	r = _wbrf_retrieve_exclusion_ranges(out);
+
+	mutex_unlock(&wbrf_mutex);
+
+	return r;
+}
+EXPORT_SYMBOL_GPL(wbrf_retrieve_exclusions);
diff --git a/include/linux/wbrf.h b/include/linux/wbrf.h
new file mode 100644
index 000000000000..32c017232874
--- /dev/null
+++ b/include/linux/wbrf.h
@@ -0,0 +1,70 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Wifi Band Exclusion Interface
+ * Copyright (C) 2023 Advanced Micro Devices
+ */
+
+#ifndef _LINUX_WBRF_H
+#define _LINUX_WBRF_H
+
+#include <linux/device.h>
+
+/* Maximum number of wbrf ranges */
+#define MAX_NUM_OF_WBRF_RANGES		11
+
+struct exclusion_range {
+	/* start and end point of the frequency range in Hz */
+	u64		start;
+	u64		end;
+};
+
+struct exclusion_range_pool {
+	struct exclusion_range	band_list[MAX_NUM_OF_WBRF_RANGES];
+	u64			ref_counter[MAX_NUM_OF_WBRF_RANGES];
+};
+
+struct wbrf_ranges_in {
+	/* valid entry: `start` and `end` filled with non-zero values */
+	struct exclusion_range	band_list[MAX_NUM_OF_WBRF_RANGES];
+};
+
+struct wbrf_ranges_out {
+	u32			num_of_ranges;
+	struct exclusion_range	band_list[MAX_NUM_OF_WBRF_RANGES];
+} __packed;
+
+enum wbrf_notifier_actions {
+	WBRF_CHANGED,
+};
+
+#if IS_ENABLED(CONFIG_WBRF)
+bool wbrf_supported_producer(struct device *dev);
+int wbrf_add_exclusion(struct device *adev,
+		       struct wbrf_ranges_in *in);
+int wbrf_remove_exclusion(struct device *dev,
+			  struct wbrf_ranges_in *in);
+int wbrf_retrieve_exclusions(struct device *dev,
+			     struct wbrf_ranges_out *out);
+bool wbrf_supported_consumer(struct device *dev);
+
+int wbrf_register_notifier(struct notifier_block *nb);
+int wbrf_unregister_notifier(struct notifier_block *nb);
+#else
+static inline bool wbrf_supported_producer(struct device *dev) { return false; }
+static inline int wbrf_add_exclusion(struct device *adev,
+				     struct wbrf_ranges_in *in) { return 0; }
+static inline int wbrf_remove_exclusion(struct device *dev,
+					struct wbrf_ranges_in *in) { return 0; }
+static inline int wbrf_retrieve_exclusions(struct device *dev,
+					   struct wbrf_ranges_out *out)
+{
+	memset(out, 0, sizeof(*out));
+
+	return 0;
+}
+static inline bool wbrf_supported_consumer(struct device *dev) { return false; }
+static inline int wbrf_register_notifier(struct notifier_block *nb) { return 0; }
+static inline int wbrf_unregister_notifier(struct notifier_block *nb) { return 0; }
+#endif
+
+#endif /* _LINUX_WBRF_H */
-- 
2.34.1

