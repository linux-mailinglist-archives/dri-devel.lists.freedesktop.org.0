Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3783B77717B
	for <lists+dri-devel@lfdr.de>; Thu, 10 Aug 2023 09:39:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90C1A10E4D6;
	Thu, 10 Aug 2023 07:39:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2069.outbound.protection.outlook.com [40.107.244.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05EF910E4D5;
 Thu, 10 Aug 2023 07:39:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mm+QbeKTglUm8QWVfGguZfWBthYsnJixI+pzn06RMXEDk0zjwkUM2jMmFC8fjd/G+15uItR8N4GC3Ck7sgVESk/SV+ECNhq5He5CbdH1ZHmtU9kH/rifDlsRZZ2uwl59MjByXr201ozDQ/n0bl1RHkzaGK3rR//CJs402tdIZNm/oC2oLq1Ryb/3EhzDVJLnEywf+vyRXPoqEvD7DIOy0XSv0YbVwGmQP/lQFF12Bol4aRg1BCOYUdyE/TnrRCewQBZXwsYyUe/Lbl93QY4PYcobB3jH23YBOfdZWaD/a+nEltjQxUM/dpQ69DGNx6fc3+NPfUkoU/QceBGZCv8jUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uDLR9nCc3WvnYEDHkNAPN4A94TUp8UHcvVIgzD15glI=;
 b=UP6JT+1TpcdsymniIE126lJaBsGWy31WFxCFOws709NlSUav+zf5CBCuL8MCPhWB7Od/YLSkj+7Pr1B9eDuCzo2yY9c9LJsKx87Bj0BDxDPVLVm8pt+WX6FxaRk76DUVP6oJKN3Al7rL4WAfptwWV7rDPHGkFLt955eo0daIncjFt84tMwolNgvshtjjbrzeHCONola/zysrCOxAG2GjlStLYv3OUQdqOWFNX9J5BLJn8jBKXeUSXBShxH1Us6hPAk/jOZo0MZDCRZ5sXsJGY9GPsdIqF8BaXYrgR3Lg+mtM7IUSuzsTb4ymXzwToAG7RezqHEeOknMR5d4FDMAzOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uDLR9nCc3WvnYEDHkNAPN4A94TUp8UHcvVIgzD15glI=;
 b=1xpYIaxLrWHoDO8A6mv3HcnA317Ve+IzrEtju7Txi2M6SZ7Hq88/4uEThv8IE1w6UhWw5eMPkfwOHQBBV26FJ/84dIVbt8yZ2BWvYT7MHatxYC9nkYKiOGgFfZTKhX58WtiQZCt3HsVi6k2mrkfNUuyXy9KL6gPETfoRvirW9vQ=
Received: from MW4P220CA0010.NAMP220.PROD.OUTLOOK.COM (2603:10b6:303:115::15)
 by SJ2PR12MB9241.namprd12.prod.outlook.com (2603:10b6:a03:57b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.30; Thu, 10 Aug
 2023 07:39:32 +0000
Received: from MWH0EPF000971E8.namprd02.prod.outlook.com
 (2603:10b6:303:115:cafe::86) by MW4P220CA0010.outlook.office365.com
 (2603:10b6:303:115::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.28 via Frontend
 Transport; Thu, 10 Aug 2023 07:39:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000971E8.mail.protection.outlook.com (10.167.243.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6652.20 via Frontend Transport; Thu, 10 Aug 2023 07:39:31 +0000
Received: from equan-buildpc.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 10 Aug
 2023 02:39:22 -0500
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
Subject: [PATCH V8 1/9] drivers core: Add support for Wifi band RF mitigations
Date: Thu, 10 Aug 2023 15:37:55 +0800
Message-ID: <20230810073803.1643451-2-evan.quan@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230810073803.1643451-1-evan.quan@amd.com>
References: <20230810073803.1643451-1-evan.quan@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E8:EE_|SJ2PR12MB9241:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d2f4a7d-e5f7-4dc4-f1c8-08db9974ef8f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Vo+xSbqieZs/Y3jBW/ItYN5jW7ntn+n5Z/aiAuTaem7P0RD5/4/OkMm6tki+czKoTgwCql4yreO+nuqdu8oevQkvmYHWVuc8FAtTZcoLjRU1mf7gABSk9PrqG5dDPxqgA0qlk7Gg2L7sq2K9Xnjs5X2+GtCFDyhet1+ZM/dNg2Vk8K/oFqjs/wHOSqGghRMig6ScTVFxItIrqdezR6EK91T+aYFTxmThDPw3eoeau7r3LiMqodmklRG9H5Po5FZ4M/MUAiGIwRa1m/oSxccKzMOkymy/hYHAW44e6Cx+DLoCAB3bvSR5CT9AXfRPVLR5kzCtb5YSiYnfdeij9jaDUdGq1MCqcvU7o0TFlEXfqgGHF+d0PP5pLoO9hXv2MbwuiV8eILZGc2WCFyR3rZOv3z5CwczEOjlA1izBbmj0DAJWORi/jYSWs27g8QUFXVz/hqL5sJ+MqOWq4D0gm0wBRiXjmEMFMq8Y1hjDRQ3OHIDkzKwWGdgxyBT18NpKf+fycqLc96sAthCkZeAzGb+5jmc918dIcy4f3/nNDG085tD0LoLkTRYHNj09S7DGkaHzCLOIO379AMRUOsc0/QusS1OujKVqxk45+A0KDyCwSwytVi9HOVjbmLzh8n+8e1R0OogSOXP2C2QIALFLYGXQt6bIUVYJkg9joerR4a47GcTM4weiPhD4t23dNzRMSyYZoeH9/aveIlv8IY3H2/C9Uj3Y0zTBfklQArFGYzCSSziiOWyI4uXbqCcNRFixKIBULZaVInv/Sp6XIyD9sE2h+0ZUR2qctzjv/oSHM7OWF7/ngZrClmdaaR4nycPDnltUmEjuCnL4k7kxYOwU+8F3FA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(136003)(396003)(376002)(346002)(451199021)(82310400008)(1800799006)(186006)(36840700001)(40470700004)(46966006)(2906002)(336012)(478600001)(36756003)(16526019)(30864003)(26005)(1076003)(40480700001)(6666004)(7696005)(40460700003)(86362001)(316002)(8936002)(8676002)(7416002)(4326008)(70586007)(5660300002)(70206006)(41300700001)(81166007)(82740400003)(356005)(921005)(2616005)(426003)(36860700001)(44832011)(54906003)(47076005)(110136005)(83380400001)(83996005)(2101003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2023 07:39:31.6095 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d2f4a7d-e5f7-4dc4-f1c8-08db9974ef8f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000971E8.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9241
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
2) Call the `wbrf_register_notifier` to register for notifications of
   frequency changes from other devices.
3) Call the `wbrf_retrieve_exclusions` to retrieve the current exclusions
   range on receiving a notification and response correspondingly.

Meanwhile a kernel parameter `wbrf` with default setting as "auto" is
introduced to specify what the policy is.
  - With `wbrf=on`, the WBRF features will be enabled forcely.
  - With `wbrf=off`, the WBRF features will be disabled forcely.
  - With `wbrf=auto`, it will be up to the system to do proper checks
    to determine the WBRF features should be enabled or not.

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
v6->v7:
  - revised the `struct wbrf_ranges_out` to be naturally aligned(Andrew)
  - revised some code comments(Andrew)
---
 .../admin-guide/kernel-parameters.txt         |   9 +
 drivers/base/Makefile                         |   1 +
 drivers/base/wbrf.c                           | 280 ++++++++++++++++++
 include/linux/wbrf.h                          |  47 +++
 4 files changed, 337 insertions(+)
 create mode 100644 drivers/base/wbrf.c
 create mode 100644 include/linux/wbrf.h

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index a1457995fd41..21f73a0bbd0b 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -7152,3 +7152,12 @@
 				xmon commands.
 			off	xmon is disabled.
 
+	wbrf=		[KNL]
+			Format: { on | auto | off }
+			Controls if WBRF features should be enabled or disabled
+			forcely. Default is auto.
+			on	Force enable the WBRF features.
+			auto	Up to the system to do proper checks to
+				determine the WBRF features should be enabled
+				or not.
+			off	Force disable the WBRF features.
diff --git a/drivers/base/Makefile b/drivers/base/Makefile
index 3079bfe53d04..7b3cef898c19 100644
--- a/drivers/base/Makefile
+++ b/drivers/base/Makefile
@@ -26,6 +26,7 @@ obj-$(CONFIG_GENERIC_MSI_IRQ) += platform-msi.o
 obj-$(CONFIG_GENERIC_ARCH_TOPOLOGY) += arch_topology.o
 obj-$(CONFIG_GENERIC_ARCH_NUMA) += arch_numa.o
 obj-$(CONFIG_ACPI) += physical_location.o
+obj-y			+= wbrf.o
 
 obj-y			+= test/
 
diff --git a/drivers/base/wbrf.c b/drivers/base/wbrf.c
new file mode 100644
index 000000000000..678f245c12c6
--- /dev/null
+++ b/drivers/base/wbrf.c
@@ -0,0 +1,280 @@
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
+static enum WBRF_POLICY_MODE {
+	WBRF_POLICY_FORCE_DISABLE,
+	WBRF_POLICY_AUTO,
+	WBRF_POLICY_FORCE_ENABLE,
+} wbrf_policy = WBRF_POLICY_AUTO;
+
+static int __init parse_wbrf_policy_mode(char *p)
+{
+	if (!strncmp(p, "auto", 4))
+		wbrf_policy = WBRF_POLICY_AUTO;
+	else if (!strncmp(p, "on", 2))
+		wbrf_policy = WBRF_POLICY_FORCE_ENABLE;
+	else if (!strncmp(p, "off", 3))
+		wbrf_policy = WBRF_POLICY_FORCE_DISABLE;
+	else
+		return -EINVAL;
+
+	return 0;
+}
+early_param("wbrf", parse_wbrf_policy_mode);
+
+static struct exclusion_range_pool {
+	struct exclusion_range	band_list[MAX_NUM_OF_WBRF_RANGES];
+	u64			ref_counter[MAX_NUM_OF_WBRF_RANGES];
+} wbrf_pool;
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
+	out->num_of_ranges = out_idx;
+
+	return 0;
+}
+
+/**
+ * wbrf_supported_system - Determine if the system supports WBRF features
+ *
+ * WBRF is used to mitigate devices that cause harmonic interference.
+ * This function will determine if the platform is able to support the
+ * WBRF features.
+ */
+static bool wbrf_supported_system(void)
+{
+	switch (wbrf_policy) {
+	case WBRF_POLICY_FORCE_ENABLE:
+		return true;
+	case WBRF_POLICY_FORCE_DISABLE:
+		return false;
+	case WBRF_POLICY_AUTO:
+		return false;
+	}
+
+	return false;
+}
+
+/**
+ * wbrf_supported_producer - Determine if the device should report frequencies
+ *
+ * @dev: device pointer
+ *
+ * WBRF is used to mitigate devices that cause harmonic interference.
+ * This function will determine if this device should report such frequencies.
+ */
+bool wbrf_supported_producer(struct device *dev)
+{
+	if (!wbrf_supported_system())
+		return false;
+
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
+ * wbrf_supported_consumer - Determine if the device should react to frequencies
+ *
+ * @dev: device pointer
+ *
+ * WBRF is used to mitigate devices that cause harmonic interference.
+ * This function will determine if this device should react to reports from
+ * other devices for such frequencies.
+ */
+bool wbrf_supported_consumer(struct device *dev)
+{
+	if (!wbrf_supported_system())
+		return false;
+
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
index 000000000000..476a28fec27a
--- /dev/null
+++ b/include/linux/wbrf.h
@@ -0,0 +1,47 @@
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
+struct wbrf_ranges_in {
+	/* valid entry: `start` and `end` filled with non-zero values */
+	struct exclusion_range	band_list[MAX_NUM_OF_WBRF_RANGES];
+};
+
+struct wbrf_ranges_out {
+	u64			num_of_ranges;
+	struct exclusion_range	band_list[MAX_NUM_OF_WBRF_RANGES];
+};
+
+enum wbrf_notifier_actions {
+	WBRF_CHANGED,
+};
+
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
+
+#endif /* _LINUX_WBRF_H */
-- 
2.34.1

