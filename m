Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE807153CE
	for <lists+dri-devel@lfdr.de>; Tue, 30 May 2023 04:43:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 301DF10E322;
	Tue, 30 May 2023 02:43:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0DB310E320;
 Tue, 30 May 2023 02:43:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ch/YHgStkzgw7h0veYdYlbvd76a6uTElVDDyzBzLqZM8aPWpVtrOWMHixcznlydUbWkd4LbOqLg7tbNSJpdgMDmU7vGBT8FSowR7pfuMmJYU+jbUkujusqmZzEhU4SP0CEplKJ4IZbikejT3wxaA1zc2tWqVHYx4A9Js4MvLeeWCZCRHTdczsHLBEnbzUEpDXfES+GtKU9PaOqa7hgjwwhuO701PpS6ptBZo2lKqeoZluz9VZTXLCGzj7eA1bdPVEq/27wJ8ZDhhA/dXYZQwmVnqDfbkK2LUIuYJkiKusX6o7zlhxzrVOYYQ8vPVWVsoP3X7NLbVBFwvFmonQnu6dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XAbVT9ROTPdXrJWm3kGd6olP9jTlaT+vKHK5FWRChK0=;
 b=jswqVUKprvtaCus+k/U2hefWi8NbgkOJW5oo7baUHC/jReiscREC8bCYwhZQmBP4UUpNCpH5+2B1bf7IxRA0CK+sa5z/8m5+/8/QBRwWBq1YtUGqhKjQ5891GRsqGAoB/gKalkmBOlgrzkLIKc9vCQrdKmLY89AbZ2GUpP+Mm8L3Z3atuxQIpZehvz5JqU7AbqOB/MG2f9Q4M5k91tNQ6u4QgII3HXDGogMFC2ZuhpPDIYwFrgqvzM5U2HUM/3Hfl5j7lradEBC6Ey4QKTnNhpG2bSJItSIvZbFKrzzOp/JYi3gWA67UH0CP7kkreuoQTsJ1XrY+KVrIWdN8GYHfig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XAbVT9ROTPdXrJWm3kGd6olP9jTlaT+vKHK5FWRChK0=;
 b=Nlo3CJdzP/R1XOsWb8Xbp20sNjIAeh4J8UtvgwNlo47bqZvXfYDRcVPhmhMe7jsuSRmSlWc7FnJgnxnZao/ufZJzKSEJ+88cS68hKYCx8dL/rmpRP8FDTcnfdlji//UlLz80/8D/wFItfEQ4pIZuY2N9s8aEM3zKM8tsP3nt6eY=
Received: from BN8PR16CA0032.namprd16.prod.outlook.com (2603:10b6:408:4c::45)
 by CY5PR12MB6156.namprd12.prod.outlook.com (2603:10b6:930:24::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.22; Tue, 30 May
 2023 02:43:16 +0000
Received: from BN8NAM11FT040.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:4c:cafe::16) by BN8PR16CA0032.outlook.office365.com
 (2603:10b6:408:4c::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23 via Frontend
 Transport; Tue, 30 May 2023 02:43:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT040.mail.protection.outlook.com (10.13.177.166) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6455.21 via Frontend Transport; Tue, 30 May 2023 02:43:16 +0000
Received: from equan-buildpc.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 29 May
 2023 21:43:09 -0500
From: Evan Quan <evan.quan@amd.com>
To: <rafael@kernel.org>, <lenb@kernel.org>, <alexander.deucher@amd.com>,
 <christian.koenig@amd.com>, <Xinhui.Pan@amd.com>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <evan.quan@amd.com>, <kvalo@kernel.org>, <nbd@nbd.name>,
 <lorenzo@kernel.org>, <ryder.lee@mediatek.com>, <shayne.chen@mediatek.com>,
 <sean.wang@mediatek.com>, <matthias.bgg@gmail.com>,
 <angelogioacchino.delregno@collabora.com>, <Mario.Limonciello@amd.com>,
 <Lijo.Lazar@amd.com>
Subject: [PATCH 1/9] drivers/acpi: Add support for Wifi band RF mitigations
Date: Tue, 30 May 2023 10:42:19 +0800
Message-ID: <20230530024227.2139632-2-evan.quan@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN8NAM11FT040:EE_|CY5PR12MB6156:EE_
X-MS-Office365-Filtering-Correlation-Id: 285892d8-f087-49dd-692c-08db60b79ee1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hcBYBF06ClfGuiUq2S7NSmdM6jz3bPGIw8QpgPfvGuDzKHOzmBY4WD4/3TtOoC1vmCqjhRqicQIVutvugJjmjUKGdIJzCzhlZiGtkEA95Mc62zpdRm0fia5MpOVFryK6dy/f5VRFgzwL7ci2oH7OlXjSY/sdtSOc6dud7NuSQ/PSP9C4ZIFYLSPsLu4UqqzQiP3KllIkSm6DCYAUc+Q4ZQ2Y7RX+/wQwyP0gAczJ7eE0l9JJZ7Qnm0I1EG4Ff2pAcbnzaWP8LnbTHCNWDkL/IMHdXAfWbpcnGr88qwj/2DJSAeH3mk6qDr+neO60zHw6jeqQVvZTKwzNKXVDhGsMlfFZ45d0FWfGfqnOqYuvSF0wpVE4bYHrS7qxsofr0BiJ/juqybGwHFPnW6lRFx+D8sQkP6b7rNqZ9GWLHDPLhMyy0m5KzMvObQ24S/rafGBSZpJrCMJvDsaftdfUZikmuC7R8zQM0nUzFzjbhf71VPZ1eLV+DYx0V4CHgVTp8KHIT/W2B4Iry+eM1yBFg+xovEQqYVuOLaxpOsiDX1U1OwdKscPx9n/sf4GiNYxg+W2psfEpKEP6O1lBNDey+BgZdSlNBDWN9C2oAj4L4JK9Yr/biy2Z+j/Km0d0ap1S8tuiFyQoVnfIEIiceZcft9X8aP1NzNVONxLoRGDf61QKMxD/f8Hw1dRxtF9vH4HS69Pbiuh/0ZJXyI/Hikmg7NDfLCo1KlFGqe2NZSf6gA5FQMpet0i1HJ2i+HoA9f7xyEVuCOwE36KLXEQlkYou4ZWsZas4o3Uq6zjKeD+a0KLlV8M=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(136003)(39860400002)(346002)(376002)(451199021)(46966006)(36840700001)(40470700004)(54906003)(478600001)(110136005)(40460700003)(8676002)(44832011)(6636002)(8936002)(7416002)(5660300002)(30864003)(36756003)(2906002)(86362001)(82310400005)(82740400003)(4326008)(70206006)(70586007)(81166007)(316002)(921005)(356005)(40480700001)(41300700001)(186003)(36860700001)(16526019)(26005)(336012)(1076003)(47076005)(7696005)(6666004)(426003)(83380400001)(2616005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2023 02:43:16.3442 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 285892d8-f087-49dd-692c-08db60b79ee1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT040.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6156
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
 ath11k@lists.infradead.org, Mario Limonciello <mario.limonciello@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Mario Limonciello <mario.limonciello@amd.com>

Due to electrical and mechanical constraints in certain platform designs
there may be likely interference of relatively high-powered harmonics of
the (G-)DDR memory clocks with local radio module frequency bands used
by Wifi 6/6e/7.

To mitigate this, AMD has introduced an ACPI based mechanism that
devices can use to notify active use of particular frequencies so
that devices can make relative internal adjustments as necessary
to avoid this resonance.

In order for a device to support this, the expected flow for device
driver or subsystems:

Drivers/subsystems contributing frequencies:

1) During probe, check `wbrf_supported_producer` to see if WBRF supported
   for the device.
2) If adding frequencies, then call `wbrf_add_exclusion` with the
   start and end ranges of the frequencies. For net/wireless subsystem
   specifically, `wbrf_add_exclusion_wlan` can be used instead.
3) If removing frequencies, then call `wbrf_remove_exclusion` with
   start and end ranges of the frequencies. For net/wireless subsystem
   specifically, `wbrf_remove_exclusion_wlan` can be used instead.

Drivers/subsystems responding to frequencies:

1) During probe, check `wbrf_supported_consumer` to see if WBRF is supported
   for the device.
2) Call the `wbrf_retrieve_exclusions` to retrieve the current
   exclusions on receiving an ACPI notification for a new frequency
   change.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
Co-developed-by: Evan Quan <evan.quan@amd.com>
Signed-off-by: Evan Quan <evan.quan@amd.com>
--
v1->v2:
  - update wifi_acpi_dsm_guid and wbrf_record to fit latest designs
  - the frequency range fed to BIOS is expected to be in HZ unit
v2->v3:
  - correct the algorithm for frequency range start and end point
    calculation
  - drop unneeded notifier register/unregister APIs
v3->v4:
  - concentrate all wbrf ACPI related code in acpi_wbrf.c
v4->v5:
  - typo and some other minor fixes(Mario)
v5->v6:
  - correct the calculations around start/end frequency points
v6->v7:
  - correct the data type for arg3 to fit ACPI spce
---
 drivers/acpi/Kconfig     |   7 +
 drivers/acpi/Makefile    |   2 +
 drivers/acpi/acpi_wbrf.c | 343 +++++++++++++++++++++++++++++++++++++++
 include/linux/wbrf.h     |  70 ++++++++
 4 files changed, 422 insertions(+)
 create mode 100644 drivers/acpi/acpi_wbrf.c
 create mode 100644 include/linux/wbrf.h

diff --git a/drivers/acpi/Kconfig b/drivers/acpi/Kconfig
index ccbeab9500ec..9ee7c7dcc3e6 100644
--- a/drivers/acpi/Kconfig
+++ b/drivers/acpi/Kconfig
@@ -611,3 +611,10 @@ config X86_PM_TIMER
 
 	  You should nearly always say Y here because many modern
 	  systems require this timer.
+
+config ACPI_WBRF
+	bool "ACPI Wifi band RF mitigation mechanism"
+	help
+	  Wifi band RF mitigation mechanism allows multiple drivers from
+	  different domains to notify the frequencies in use so that hardware
+	  can be reconfigured to avoid harmonic conflicts.
\ No newline at end of file
diff --git a/drivers/acpi/Makefile b/drivers/acpi/Makefile
index feb36c0b9446..be173e76aa62 100644
--- a/drivers/acpi/Makefile
+++ b/drivers/acpi/Makefile
@@ -131,3 +131,5 @@ obj-y				+= dptf/
 obj-$(CONFIG_ARM64)		+= arm64/
 
 obj-$(CONFIG_ACPI_VIOT)		+= viot.o
+
+obj-$(CONFIG_ACPI_WBRF)		+= acpi_wbrf.o
\ No newline at end of file
diff --git a/drivers/acpi/acpi_wbrf.c b/drivers/acpi/acpi_wbrf.c
new file mode 100644
index 000000000000..bf8e0ed73072
--- /dev/null
+++ b/drivers/acpi/acpi_wbrf.c
@@ -0,0 +1,343 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * AMD Wifi Band Exclusion Interface
+ * Copyright (C) 2023 Advanced Micro Devices
+ *
+ */
+
+#include <linux/wbrf.h>
+
+/* functions */
+#define WBRF_RECORD		0x1
+#define WBRF_RETRIEVE		0x2
+
+/* record actions */
+#define WBRF_RECORD_ADD		0x0
+#define WBRF_RECORD_REMOVE	0x1
+
+#define WBRF_REVISION		0x1
+
+#define KHZ_TO_HZ(freq)		((freq) * 1000ULL)
+
+static const guid_t wifi_acpi_dsm_guid =
+	GUID_INIT(0x7b7656cf, 0xdc3d, 0x4c1c,
+		  0x83, 0xe9, 0x66, 0xe7, 0x21, 0xde, 0x30, 0x70);
+
+static int wbrf_dsm(struct acpi_device *adev, u8 fn,
+		    union acpi_object *argv4,
+		    union acpi_object **out)
+{
+	union acpi_object *obj;
+	int rc;
+
+	obj = acpi_evaluate_dsm(adev->handle, &wifi_acpi_dsm_guid,
+				WBRF_REVISION, fn, argv4);
+	if (!obj)
+		return -ENXIO;
+
+	switch (obj->type) {
+	case ACPI_TYPE_BUFFER:
+		if (!*out) {
+			rc = -EINVAL;
+			break;
+		}
+		*out = obj;
+		return 0;
+
+	case ACPI_TYPE_INTEGER:
+		rc =  obj->integer.value ? -EINVAL : 0;
+		break;
+	default:
+		rc = -EOPNOTSUPP;
+	}
+	ACPI_FREE(obj);
+
+	return rc;
+}
+
+static int wbrf_record(struct acpi_device *adev, uint8_t action,
+		       struct wbrf_ranges_in *in)
+{
+	union acpi_object *argv4;
+	uint32_t num_of_ranges = 0;
+	uint32_t arg_idx = 0;
+	uint32_t loop_idx;
+	int ret;
+
+	if (!in)
+		return -EINVAL;
+
+	for (loop_idx = 0; loop_idx < ARRAY_SIZE(in->band_list);
+	     loop_idx++)
+		if (in->band_list[loop_idx].start &&
+		    in->band_list[loop_idx].end)
+			num_of_ranges++;
+
+	argv4 = kzalloc(sizeof(*argv4) * (2 * num_of_ranges + 2 + 1), GFP_KERNEL);
+	if (!argv4)
+		return -ENOMEM;
+
+	argv4[arg_idx].package.type = ACPI_TYPE_PACKAGE;
+	argv4[arg_idx].package.count = 2 + 2 * num_of_ranges;
+	argv4[arg_idx++].package.elements = &argv4[1];
+	argv4[arg_idx].integer.type = ACPI_TYPE_INTEGER;
+	argv4[arg_idx++].integer.value = num_of_ranges;
+	argv4[arg_idx].integer.type = ACPI_TYPE_INTEGER;
+	argv4[arg_idx++].integer.value = action;
+
+	for (loop_idx = 0; loop_idx < ARRAY_SIZE(in->band_list);
+	     loop_idx++) {
+		if (!in->band_list[loop_idx].start ||
+		    !in->band_list[loop_idx].end)
+			continue;
+
+		argv4[arg_idx].integer.type = ACPI_TYPE_INTEGER;
+		argv4[arg_idx++].integer.value = in->band_list[loop_idx].start;
+		argv4[arg_idx].integer.type = ACPI_TYPE_INTEGER;
+		argv4[arg_idx++].integer.value = in->band_list[loop_idx].end;
+	}
+
+	ret = wbrf_dsm(adev, WBRF_RECORD, argv4, NULL);
+
+	kfree(argv4);
+
+	return ret;
+}
+
+int wbrf_add_exclusion(struct acpi_device *adev,
+		       struct wbrf_ranges_in *in)
+{
+	return wbrf_record(adev, WBRF_RECORD_ADD, in);
+}
+EXPORT_SYMBOL_GPL(wbrf_add_exclusion);
+
+int wbrf_remove_exclusion(struct acpi_device *adev,
+			  struct wbrf_ranges_in *in)
+{
+	return wbrf_record(adev, WBRF_RECORD_REMOVE, in);
+}
+EXPORT_SYMBOL_GPL(wbrf_remove_exclusion);
+
+static int chan_width_to_mhz(enum nl80211_chan_width chan_width)
+{
+	int mhz;
+
+	switch (chan_width) {
+	case NL80211_CHAN_WIDTH_1:
+		mhz = 1;
+		break;
+	case NL80211_CHAN_WIDTH_2:
+		mhz = 2;
+		break;
+	case NL80211_CHAN_WIDTH_4:
+		mhz = 4;
+		break;
+	case NL80211_CHAN_WIDTH_8:
+		mhz = 8;
+		break;
+	case NL80211_CHAN_WIDTH_16:
+		mhz = 16;
+		break;
+	case NL80211_CHAN_WIDTH_5:
+		mhz = 5;
+		break;
+	case NL80211_CHAN_WIDTH_10:
+		mhz = 10;
+		break;
+	case NL80211_CHAN_WIDTH_20:
+	case NL80211_CHAN_WIDTH_20_NOHT:
+		mhz = 20;
+		break;
+	case NL80211_CHAN_WIDTH_40:
+		mhz = 40;
+		break;
+	case NL80211_CHAN_WIDTH_80P80:
+	case NL80211_CHAN_WIDTH_80:
+		mhz = 80;
+		break;
+	case NL80211_CHAN_WIDTH_160:
+		mhz = 160;
+		break;
+	case NL80211_CHAN_WIDTH_320:
+		mhz = 320;
+		break;
+	default:
+		WARN_ON_ONCE(1);
+		return -1;
+	}
+	return mhz;
+}
+
+static void get_chan_freq_boundary(u32 center_freq,
+				   u32 bandwidth,
+				   u64 *start,
+				   u64 *end)
+{
+	bandwidth = MHZ_TO_KHZ(bandwidth);
+	center_freq = MHZ_TO_KHZ(center_freq);
+
+	*start = center_freq - bandwidth / 2;
+	*end = center_freq + bandwidth / 2;
+
+	/* Frequency in HZ is expected in BIOS */
+	*start = KHZ_TO_HZ(*start);
+	*end = KHZ_TO_HZ(*end);
+}
+
+static int wbrf_get_ranges_from_chandef(struct cfg80211_chan_def *chandef,
+					struct wbrf_ranges_in *ranges_in)
+{
+	u64 start_freq1, end_freq1;
+	u64 start_freq2, end_freq2;
+	int bandwidth;
+
+	bandwidth = chan_width_to_mhz(chandef->width);
+	if (bandwidth < 0)
+		return -EINVAL;
+
+	get_chan_freq_boundary(chandef->center_freq1,
+			       bandwidth,
+			       &start_freq1,
+			       &end_freq1);
+
+	ranges_in->band_list[0].start = start_freq1;
+	ranges_in->band_list[0].end = end_freq1;
+
+	if (chandef->width == NL80211_CHAN_WIDTH_80P80) {
+		get_chan_freq_boundary(chandef->center_freq2,
+				       bandwidth,
+				       &start_freq2,
+				       &end_freq2);
+
+		ranges_in->band_list[1].start = start_freq2;
+		ranges_in->band_list[1].end = end_freq2;
+	}
+
+	return 0;
+}
+
+int wbrf_add_exclusion_wlan(struct acpi_device *adev,
+			    struct cfg80211_chan_def *chandef)
+{
+	struct wbrf_ranges_in ranges_in = {0};
+	int ret;
+
+	ret = wbrf_get_ranges_from_chandef(chandef, &ranges_in);
+	if (ret)
+		return ret;
+
+	return wbrf_add_exclusion(adev, &ranges_in);
+}
+EXPORT_SYMBOL_GPL(wbrf_add_exclusion_wlan);
+
+int wbrf_remove_exclusion_wlan(struct acpi_device *adev,
+			       struct cfg80211_chan_def *chandef)
+{
+	struct wbrf_ranges_in ranges_in = {0};
+	int ret;
+
+	ret = wbrf_get_ranges_from_chandef(chandef, &ranges_in);
+	if (ret)
+		return ret;
+
+	return wbrf_remove_exclusion(adev, &ranges_in);
+}
+EXPORT_SYMBOL_GPL(wbrf_remove_exclusion_wlan);
+
+bool wbrf_supported_producer(struct acpi_device *adev)
+{
+	return acpi_check_dsm(adev->handle, &wifi_acpi_dsm_guid,
+			      WBRF_REVISION,
+			      (1ULL << WBRF_RECORD) | (1ULL << WBRF_RETRIEVE));
+}
+EXPORT_SYMBOL_GPL(wbrf_supported_producer);
+
+static union acpi_object *
+acpi_evaluate_wbrf(acpi_handle handle, u64 rev, u64 func)
+{
+	acpi_status ret;
+	struct acpi_buffer buf = {ACPI_ALLOCATE_BUFFER, NULL};
+	union acpi_object params[4];
+	struct acpi_object_list input = {
+		.count = 4,
+		.pointer = params,
+	};
+
+	params[0].type = ACPI_TYPE_INTEGER;
+	params[0].integer.value = rev;
+	params[1].type = ACPI_TYPE_INTEGER;
+	params[1].integer.value = func;
+	params[2].type = ACPI_TYPE_PACKAGE;
+	params[2].package.count = 0;
+	params[2].package.elements = NULL;
+	params[3].type = ACPI_TYPE_STRING;
+	params[3].string.length = 0;
+	params[3].string.pointer= NULL;
+
+	ret = acpi_evaluate_object(handle, "WBRF", &input, &buf);
+	if (ACPI_SUCCESS(ret))
+		return (union acpi_object *)buf.pointer;
+
+	if (ret != AE_NOT_FOUND)
+		acpi_handle_warn(handle,
+				 "failed to evaluate WBRF(0x%x)\n", ret);
+
+	return NULL;
+}
+
+static bool check_acpi_wbrf(acpi_handle handle, u64 rev, u64 funcs)
+{
+	int i;
+	u64 mask = 0;
+	union acpi_object *obj;
+
+	if (funcs == 0)
+		return false;
+
+	obj = acpi_evaluate_wbrf(handle, rev, 0);
+	if (!obj)
+		return false;
+
+	if (obj->type != ACPI_TYPE_BUFFER)
+		return false;
+
+	for (i = 0; i < obj->buffer.length && i < 8; i++)
+		mask |= (((u64)obj->buffer.pointer[i]) << (i * 8));
+	ACPI_FREE(obj);
+
+	/*
+	 * Bit 0 indicates whether there's support for any functions other than
+	 * function 0.
+	 */
+	if ((mask & 0x1) && (mask & funcs) == funcs)
+		return true;
+
+	return false;
+}
+
+bool wbrf_supported_consumer(struct acpi_device *adev)
+{
+	return check_acpi_wbrf(adev->handle,
+			       WBRF_REVISION,
+			       1ULL << WBRF_RETRIEVE);
+}
+EXPORT_SYMBOL_GPL(wbrf_supported_consumer);
+
+int wbrf_retrieve_exclusions(struct acpi_device *adev,
+			     struct wbrf_ranges_out *exclusions_out)
+{
+	union acpi_object *obj;
+
+	obj = acpi_evaluate_wbrf(adev->handle,
+				 WBRF_REVISION,
+				 WBRF_RETRIEVE);
+	if (!obj)
+		return -EINVAL;
+
+	memcpy(exclusions_out, obj->buffer.pointer, obj->buffer.length);
+
+	ACPI_FREE(obj);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(wbrf_retrieve_exclusions);
diff --git a/include/linux/wbrf.h b/include/linux/wbrf.h
new file mode 100644
index 000000000000..c77766069d73
--- /dev/null
+++ b/include/linux/wbrf.h
@@ -0,0 +1,70 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * AMD Wifi Band Exclusion Interface
+ * Copyright (C) 2023 Advanced Micro Devices
+ */
+
+#ifndef _LINUX_WBRF_H
+#define _LINUX_WBRF_H
+
+#include <linux/acpi.h>
+#include <net/cfg80211.h>
+
+/* Maximum number of wbrf ranges */
+#define MAX_NUM_OF_WBRF_RANGES		11
+
+struct exclusion_range {
+	uint64_t	start;
+	uint64_t	end;
+};
+
+struct wbrf_ranges_in {
+	/* valid entry: `start` and `end` filled with non-zero values */
+	struct exclusion_range	band_list[MAX_NUM_OF_WBRF_RANGES];
+};
+
+struct wbrf_ranges_out {
+	uint32_t		num_of_ranges;
+	struct exclusion_range	band_list[MAX_NUM_OF_WBRF_RANGES];
+} __attribute__((packed));
+
+/**
+ * APIs needed by drivers/subsystems for contributing frequencies:
+ * During probe, check `wbrf_supported_producer` to see if WBRF is supported.
+ * If adding frequencies, then call `wbrf_add_exclusion` with the
+ * start and end points specified for the frequency ranges added.
+ * If removing frequencies, then call `wbrf_remove_exclusion` with
+ * start and end points specified for the frequency ranges added.
+ */
+bool wbrf_supported_producer(struct acpi_device *adev);
+int wbrf_add_exclusion(struct acpi_device *adev,
+		       struct wbrf_ranges_in *in);
+int wbrf_remove_exclusion(struct acpi_device *adev,
+			  struct wbrf_ranges_in *in);
+/**
+ * The following two APIs are created specially for net/wireless subsystem(
+ * a main player for contributing frequencies) for adding and removing
+ * frequencies:
+ * If adding frequencies, then call `wbrf_add_exclusion_wlan` with
+ * `struct cfg80211_chan_def` which defines the center frequency points
+ * and bandwidth.
+ * If removing frequencies, then call `wbrf_remove_exclusion_wlan` with
+ * `struct cfg80211_chan_def` which defines the center frequency points
+ * and bandwidth.
+ */
+int wbrf_add_exclusion_wlan(struct acpi_device *adev,
+			    struct cfg80211_chan_def *chandef);
+int wbrf_remove_exclusion_wlan(struct acpi_device *adev,
+			       struct cfg80211_chan_def *chandef);
+
+/**
+ * APIs needed by drivers/subsystems responding to frequencies:
+ * During probe, check `wbrf_supported_consumer` to see if WBRF is supported.
+ * When receiving an ACPI notification for some frequencies change, run
+ * `wbrf_retrieve_exclusions` to retrieve the latest frequencies ranges.
+ */
+int wbrf_retrieve_exclusions(struct acpi_device *adev,
+			     struct wbrf_ranges_out *out);
+bool wbrf_supported_consumer(struct acpi_device *adev);
+
+#endif /* _LINUX_WBRF_H */
-- 
2.34.1

