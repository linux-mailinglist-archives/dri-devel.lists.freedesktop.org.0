Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CB9D78E63B
	for <lists+dri-devel@lfdr.de>; Thu, 31 Aug 2023 08:21:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0981110E584;
	Thu, 31 Aug 2023 06:21:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2083.outbound.protection.outlook.com [40.107.102.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 596A110E577;
 Thu, 31 Aug 2023 06:21:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Roip0wpheboTNk7TnNBqOrhbNOlso5SD2LxICT1Iq/S4nCBUMwemZE+npALiwBhLI/R86MHkWDiYvfo2iB8TnP04m9PJaivZuL77WUEOW1JBJ6PT2VfNRQ8uN0fNltDjwTWGN5Sey9166bQrFnye7wZ4B25hZ+FaEaiMWwmtvb+yhoNj42OrtV6g5niCAvy1IMUCfM8ujUTQVsr13+Q8iIcysdd1UAfHXGl534GHNSbe22CY7rYHXZb7HFAVi65h7xyDB/zEzPnKxGPszu/r09J9ZJOb+Bep4h4c8bJO3Pq7EHpfayM3zsPLXgqb9wsPJQgWBTs3PHu8wcln9NP58A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NJ75n/beCEyoC+OCidKcqlhvMPEqIdYYZy8ugTYX8bE=;
 b=iWdDECGpf0FzVllcyrjtUVLiDtSb5XmHf3HkierhzVINfiKEbLzKNF5WTJ2cY6+cgL4dzGmUojX6gzZlFHPEvbr28Q/LWSd0XY25c1gpecsfHPLcwrQTbt/WPbZ5JkFknOBPm93jBQv7I0YOuZUMCjDB0Tc0s88jZk/tRcpVFGrcG/YBaVCNZyaONUIwV2BtLPR48gqKJXGJPqZQrysCA3u9mpNzEF/88t4P1T9d08PM8gzWZlh+vRipFPibnPer40QQ8ui+xbsWbvIuY3WYCm0gGbuXSdPKyYJfMN4L4IgY59qt1zSacBOPKIaN4edTXfEjbHq/H7TvA6jkM4ohZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NJ75n/beCEyoC+OCidKcqlhvMPEqIdYYZy8ugTYX8bE=;
 b=4rUfoMBg/0ne4bdF08Ci5XeenTQVDYnLbhyXun1kpjTBoWPprnlMTrUnBzlmlT4fh4MI0bS4nBWnHFbsfjZ/oq5dtCCxKZZB9w48gF1dk9BmLBeKQ7VcVBd68hXrfbKmMbJ8dfz/EDgQzTkvcMAg0l1KWzVPs3Zf5gr0rapG7RA=
Received: from MW2PR2101CA0028.namprd21.prod.outlook.com (2603:10b6:302:1::41)
 by PH7PR12MB6737.namprd12.prod.outlook.com (2603:10b6:510:1a8::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.36; Thu, 31 Aug
 2023 06:21:09 +0000
Received: from CO1PEPF000044F9.namprd21.prod.outlook.com
 (2603:10b6:302:1:cafe::a0) by MW2PR2101CA0028.outlook.office365.com
 (2603:10b6:302:1::41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.9 via Frontend
 Transport; Thu, 31 Aug 2023 06:21:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044F9.mail.protection.outlook.com (10.167.241.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6768.2 via Frontend Transport; Thu, 31 Aug 2023 06:21:09 +0000
Received: from equan-buildpc.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 31 Aug
 2023 01:21:01 -0500
From: Evan Quan <evan.quan@amd.com>
To: <lenb@kernel.org>, <johannes@sipsolutions.net>, <davem@davemloft.net>,
 <edumazet@google.com>, <kuba@kernel.org>, <pabeni@redhat.com>,
 <alexander.deucher@amd.com>, <rafael@kernel.org>, <Lijo.Lazar@amd.com>,
 <mario.limonciello@amd.com>
Subject: [V11 1/8] ACPI: Add support for AMD ACPI based Wifi band RFI
 mitigation feature
Date: Thu, 31 Aug 2023 14:20:24 +0800
Message-ID: <20230831062031.1014799-2-evan.quan@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230831062031.1014799-1-evan.quan@amd.com>
References: <20230831062031.1014799-1-evan.quan@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F9:EE_|PH7PR12MB6737:EE_
X-MS-Office365-Filtering-Correlation-Id: bbd772a3-af4a-4e5c-b422-08dba9ea7756
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KFgEbZOJVP62vbuV4/JsNE10KJaQ1G6aAlwY3nEajYSkds0AnqDwp3qavGMuDjVQDiaZacACyUNo+loD1O8Dhue/N+oMIVymA4KzsglanA4tMFK0enawdrQYxQPjzbWDvhw7vwwosDDajAJofZk8SiCob7alhxDmaCsha0q10I2lZ4OkdygzRkbBCvlTL0Ben1JTSiyl+wWISrOceQS1WZoXWNIF1wKtF/GaZmae9xwv0qVKA0i/ffqR8kpdR+DRqJpLMHZU8W15n255Q54M9ZqOKKMqtsCZPTf3l055473xSszTSvBTadP7GQVXqUuQs/FymGdhJfqc9qUfUYfIiApfs1Ak/WKkqVfNu3I3T684zkCjeMMCk9Dz3bxtQGbxFgHWJKbWALX9jyrML7l48YyEfs7khWxooG38vMQbbCmSKkZPLTQ0HSBuooBFFq/xJ1raBpNmd42/CTzmJye4gWcnhysKcin0WBEvYtwZu9AFufOPugqlHCUd1eivJo1tTw6/ohr5173XP605y886R9RFtaD5NcUA9Cx6wLVKZDzZiXyN56Ah2GoErNoWhzS2/u5iG0BeMBJhcpD8JYTYyMpo24t90v8gME0XrCuRi7CMUKkxk6pXE10xl1yjuHcLk/tl2QlhUSkACr8/7bz/qRtI0pDvBnko4x6D9aPASTA0Wtj9y9yO3NZkn8UOFUvDSXitfudUL0VwvzO6RyB3XhGSlQBFLwoIItBLwEhZDTt5e0iV4rvNsBMxlkT/qxZ9A3xQWv6tOfd4gsCgeKQojretEtfzAZM+HIcTXWzsitU=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(39860400002)(376002)(136003)(346002)(396003)(451199024)(82310400011)(1800799009)(186009)(46966006)(40470700004)(36840700001)(40460700003)(41300700001)(316002)(6636002)(8676002)(4326008)(7416002)(426003)(336012)(2616005)(2906002)(47076005)(30864003)(86362001)(44832011)(16526019)(5660300002)(83380400001)(36756003)(1076003)(26005)(36860700001)(40480700001)(8936002)(6666004)(82740400003)(921005)(81166007)(356005)(7696005)(54906003)(478600001)(110136005)(70586007)(70206006)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2023 06:21:09.0950 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bbd772a3-af4a-4e5c-b422-08dba9ea7756
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044F9.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6737
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
 Evan Quan <evan.quan@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Due to electrical and mechanical constraints in certain platform designs
there may be likely interference of relatively high-powered harmonics of
the (G-)DDR memory clocks with local radio module frequency bands used
by Wifi 6/6e/7.

To mitigate this, AMD has introduced a mechanism that devices can use to
notify active use of particular frequencies so that other devices can make
relative internal adjustments as necessary to avoid this resonance.

Signed-off-by: Evan Quan <evan.quan@amd.com>
--
v10->v11:
  - fix typo(Simon)
---
 drivers/acpi/Kconfig          |  17 ++
 drivers/acpi/Makefile         |   2 +
 drivers/acpi/amd_wbrf.c       | 414 ++++++++++++++++++++++++++++++++++
 include/linux/acpi_amd_wbrf.h | 140 ++++++++++++
 4 files changed, 573 insertions(+)
 create mode 100644 drivers/acpi/amd_wbrf.c
 create mode 100644 include/linux/acpi_amd_wbrf.h

diff --git a/drivers/acpi/Kconfig b/drivers/acpi/Kconfig
index 00dd309b6682..a092ea72d152 100644
--- a/drivers/acpi/Kconfig
+++ b/drivers/acpi/Kconfig
@@ -594,6 +594,23 @@ config ACPI_PRMT
 	  substantially increase computational overhead related to the
 	  initialization of some server systems.
 
+config WBRF_AMD_ACPI
+	bool "ACPI based WBRF mechanism introduced by AMD"
+	depends on ACPI
+	default n
+	help
+	  Wifi band RFI mitigation mechanism allows multiple drivers from
+	  different domains to notify the frequencies in use so that hardware
+	  can be reconfigured to avoid harmonic conflicts.
+
+	  AMD has introduced an ACPI based mechanism to support WBRF for some
+	  platforms with AMD dGPU and WLAN. This needs support from BIOS equipped
+	  with necessary AML implementations and dGPU firmwares.
+
+	  Before enabling this ACPI based mechanism, it is suggested to confirm
+	  with the hardware designer/provider first whether your platform
+	  equipped with necessary BIOS and firmwares.
+
 endif	# ACPI
 
 config X86_PM_TIMER
diff --git a/drivers/acpi/Makefile b/drivers/acpi/Makefile
index eaa09bf52f17..a3d2f259d0a5 100644
--- a/drivers/acpi/Makefile
+++ b/drivers/acpi/Makefile
@@ -132,3 +132,5 @@ obj-$(CONFIG_ARM64)		+= arm64/
 obj-$(CONFIG_ACPI_VIOT)		+= viot.o
 
 obj-$(CONFIG_RISCV)		+= riscv/
+
+obj-$(CONFIG_WBRF_AMD_ACPI)	+= amd_wbrf.o
diff --git a/drivers/acpi/amd_wbrf.c b/drivers/acpi/amd_wbrf.c
new file mode 100644
index 000000000000..8ee0e2977a30
--- /dev/null
+++ b/drivers/acpi/amd_wbrf.c
@@ -0,0 +1,414 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Wifi Band Exclusion Interface (AMD ACPI Implementation)
+ * Copyright (C) 2023 Advanced Micro Devices
+ *
+ */
+
+#include <linux/acpi.h>
+#include <linux/acpi_amd_wbrf.h>
+
+#define ACPI_AMD_WBRF_METHOD	"\\WBRF"
+
+/*
+ * Functions bit vector for WBRF method
+ *
+ * Bit 0: Supported for any functions other than function 0.
+ * Bit 1: Function 1 (Add / Remove frequency) is supported.
+ * Bit 2: Function 2 (Get frequency list) is supported.
+ */
+#define WBRF_ENABLED				0x0
+#define WBRF_RECORD				0x1
+#define WBRF_RETRIEVE				0x2
+
+/* record actions */
+#define WBRF_RECORD_ADD		0x0
+#define WBRF_RECORD_REMOVE	0x1
+
+#define WBRF_REVISION		0x1
+
+/*
+ * The data structure used for WBRF_RETRIEVE is not naturally aligned.
+ * And unfortunately the design has been settled down.
+ */
+struct amd_wbrf_ranges_out {
+	u32			num_of_ranges;
+	struct exclusion_range	band_list[MAX_NUM_OF_WBRF_RANGES];
+} __packed;
+
+static const guid_t wifi_acpi_dsm_guid =
+	GUID_INIT(0x7b7656cf, 0xdc3d, 0x4c1c,
+		  0x83, 0xe9, 0x66, 0xe7, 0x21, 0xde, 0x30, 0x70);
+
+static BLOCKING_NOTIFIER_HEAD(wbrf_chain_head);
+
+static int wbrf_dsm(struct acpi_device *adev,
+		    u8 fn,
+		    union acpi_object *argv4)
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
+	case ACPI_TYPE_INTEGER:
+		rc = obj->integer.value ? -EINVAL : 0;
+		break;
+	default:
+		rc = -EOPNOTSUPP;
+	}
+
+	ACPI_FREE(obj);
+
+	return rc;
+}
+
+static int wbrf_record(struct acpi_device *adev, uint8_t action,
+		       struct wbrf_ranges_in_out *in)
+{
+	union acpi_object argv4;
+	union acpi_object *tmp;
+	u32 num_of_ranges = 0;
+	u32 num_of_elements;
+	u32 arg_idx = 0;
+	u32 loop_idx;
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
+	/*
+	 * The valid entry counter does not match with this told.
+	 * Something must went wrong.
+	 */
+	if (num_of_ranges != in->num_of_ranges)
+		return -EINVAL;
+
+	/*
+	 * Every input frequency band comes with two end points(start/end)
+	 * and each is accounted as an element. Meanwhile the range count
+	 * and action type are accounted as an element each.
+	 * So, the total element count = 2 * num_of_ranges + 1 + 1.
+	 */
+	num_of_elements = 2 * num_of_ranges + 1 + 1;
+
+	tmp = kcalloc(num_of_elements, sizeof(*tmp), GFP_KERNEL);
+	if (!tmp)
+		return -ENOMEM;
+
+	argv4.package.type = ACPI_TYPE_PACKAGE;
+	argv4.package.count = num_of_elements;
+	argv4.package.elements = tmp;
+
+	tmp[arg_idx].integer.type = ACPI_TYPE_INTEGER;
+	tmp[arg_idx++].integer.value = num_of_ranges;
+	tmp[arg_idx].integer.type = ACPI_TYPE_INTEGER;
+	tmp[arg_idx++].integer.value = action;
+
+	for (loop_idx = 0; loop_idx < ARRAY_SIZE(in->band_list);
+	     loop_idx++) {
+		if (!in->band_list[loop_idx].start ||
+		    !in->band_list[loop_idx].end)
+			continue;
+
+		tmp[arg_idx].integer.type = ACPI_TYPE_INTEGER;
+		tmp[arg_idx++].integer.value = in->band_list[loop_idx].start;
+		tmp[arg_idx].integer.type = ACPI_TYPE_INTEGER;
+		tmp[arg_idx++].integer.value = in->band_list[loop_idx].end;
+	}
+
+	ret = wbrf_dsm(adev, WBRF_RECORD, &argv4);
+
+	kfree(tmp);
+
+	return ret;
+}
+
+/**
+ * acpi_amd_wbrf_add_exclusion - broadcast the frequency band the device
+ *                               is using
+ *
+ * @dev: device pointer
+ * @in: input structure containing the frequency band the device is using
+ *
+ * Broadcast to other consumers the frequency band the device starts
+ * to use. Underneath the surface the information is cached into an
+ * internal buffer first. Then a notification is sent to all those
+ * registered consumers. So then they can retrieve that buffer to
+ * know the latest active frequency bands. The benefit with such design
+ * is for those consumers which have not been registered yet, they can
+ * still have a chance to retrieve such information later.
+ */
+int acpi_amd_wbrf_add_exclusion(struct device *dev,
+				struct wbrf_ranges_in_out *in)
+{
+	struct acpi_device *adev = ACPI_COMPANION(dev);
+	int ret;
+
+	if (!adev)
+		return -ENODEV;
+
+	ret = wbrf_record(adev, WBRF_RECORD_ADD, in);
+	if (ret)
+		return ret;
+
+	blocking_notifier_call_chain(&wbrf_chain_head,
+				     WBRF_CHANGED,
+				     NULL);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(acpi_amd_wbrf_add_exclusion);
+
+/**
+ * acpi_amd_wbrf_remove_exclusion - broadcast the frequency band the device
+ *                                  is no longer using
+ *
+ * @dev: device pointer
+ * @in: input structure containing the frequency band which is not used
+ *      by the device any more
+ *
+ * Broadcast to other consumers the frequency band the device stops
+ * to use. The stored information paired with this will be dropped
+ * from the internal buffer. And then a notification is sent to
+ * all registered consumers.
+ */
+int acpi_amd_wbrf_remove_exclusion(struct device *dev,
+				   struct wbrf_ranges_in_out *in)
+{
+	struct acpi_device *adev = ACPI_COMPANION(dev);
+	int ret;
+
+	if (!adev)
+		return -ENODEV;
+
+	ret = wbrf_record(adev, WBRF_RECORD_REMOVE, in);
+	if (ret)
+		return ret;
+
+	blocking_notifier_call_chain(&wbrf_chain_head,
+				     WBRF_CHANGED,
+				     NULL);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(acpi_amd_wbrf_remove_exclusion);
+
+static bool acpi_amd_wbrf_supported_system(void)
+{
+	acpi_status status;
+	acpi_handle handle;
+
+	status = acpi_get_handle(NULL, ACPI_AMD_WBRF_METHOD, &handle);
+
+	return ACPI_SUCCESS(status);
+}
+
+/**
+ * acpi_amd_wbrf_supported_producer - determine if the WBRF can be enabled
+ *                                    for the device as a producer
+ *
+ * @dev: device pointer
+ *
+ * Determine if the platform equipped with necessary implementations to
+ * support WBRF for the device as a producer.
+ */
+bool acpi_amd_wbrf_supported_producer(struct device *dev)
+{
+	struct acpi_device *adev = ACPI_COMPANION(dev);
+
+	if (!acpi_amd_wbrf_supported_system())
+		return false;
+
+	if (!adev)
+		return false;
+
+	return acpi_check_dsm(adev->handle, &wifi_acpi_dsm_guid,
+			      WBRF_REVISION,
+			      BIT(WBRF_RECORD));
+}
+EXPORT_SYMBOL_GPL(acpi_amd_wbrf_supported_producer);
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
+	params[3].string.pointer = NULL;
+
+	ret = acpi_evaluate_object(handle, "WBRF", &input, &buf);
+	if (ACPI_FAILURE(ret))
+		return NULL;
+
+	return buf.pointer;
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
+	/*
+	 * Bit vector providing supported functions information.
+	 * Each bit marks support for one specific function of the WBRF method.
+	 */
+	for (i = 0; i < obj->buffer.length && i < 8; i++)
+		mask |= (u64)obj->buffer.pointer[i] << i * 8;
+
+	ACPI_FREE(obj);
+
+	return mask & BIT(WBRF_ENABLED) && (mask & funcs) == funcs;
+}
+
+/**
+ * acpi_amd_wbrf_supported_consumer - determine if the WBRF can be enabled
+ *                                    for the device as a consumer
+ *
+ * @dev: device pointer
+ *
+ * Determine if the platform equipped with necessary implementations to
+ * support WBRF for the device as a consumer.
+ */
+bool acpi_amd_wbrf_supported_consumer(struct device *dev)
+{
+	struct acpi_device *adev = ACPI_COMPANION(dev);
+
+	if (!acpi_amd_wbrf_supported_system())
+		return false;
+
+	if (!adev)
+		return false;
+
+	return check_acpi_wbrf(adev->handle,
+			       WBRF_REVISION,
+			       BIT(WBRF_RETRIEVE));
+}
+EXPORT_SYMBOL_GPL(acpi_amd_wbrf_supported_consumer);
+
+/**
+ * acpi_amd_wbrf_retrieve_exclusions - retrieve current active frequency
+ *                                     bands
+ *
+ * @dev: device pointer
+ * @out: output structure containing all the active frequency bands
+ *
+ * Retrieve the current active frequency bands which were broadcasted
+ * by other producers. The consumer who calls this API should take
+ * proper actions if any of the frequency band may cause RFI with its
+ * own frequency band used.
+ */
+int acpi_amd_wbrf_retrieve_exclusions(struct device *dev,
+				      struct wbrf_ranges_in_out *out)
+{
+	struct acpi_device *adev = ACPI_COMPANION(dev);
+	struct amd_wbrf_ranges_out acpi_out = {0};
+	union acpi_object *obj;
+	int ret = 0;
+
+	if (!adev)
+		return -ENODEV;
+
+	obj = acpi_evaluate_wbrf(adev->handle,
+				 WBRF_REVISION,
+				 WBRF_RETRIEVE);
+	if (!obj)
+		return -EINVAL;
+
+	/*
+	 * The return buffer is with variable length and the format below:
+	 * number_of_entries(1 DWORD):       Number of entries
+	 * start_freq of 1st entry(1 QWORD): Start frequency of the 1st entry
+	 * end_freq of 1st entry(1 QWORD):   End frequency of the 1st entry
+	 * ...
+	 * ...
+	 * start_freq of the last entry(1 QWORD)
+	 * end_freq of the last entry(1 QWORD)
+	 *
+	 * Thus the buffer length is determined by the number of entries.
+	 * - For zero entry scenario, the buffer length will be 4 bytes.
+	 * - For one entry scenario, the buffer length will be 20 bytes.
+	 */
+	if (obj->buffer.length > sizeof(acpi_out) ||
+	    obj->buffer.length < 4) {
+		dev_err(dev, "Wrong sized WBRT information");
+		ret = -EINVAL;
+		goto out;
+	}
+	memcpy(&acpi_out, obj->buffer.pointer, obj->buffer.length);
+
+	out->num_of_ranges = acpi_out.num_of_ranges;
+	memcpy(out->band_list, acpi_out.band_list, sizeof(acpi_out.band_list));
+
+out:
+	ACPI_FREE(obj);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(acpi_amd_wbrf_retrieve_exclusions);
+
+/**
+ * acpi_amd_wbrf_register_notifier - register for notifications of frequency
+ *                                   band update
+ *
+ * @nb: driver notifier block
+ *
+ * The consumer should register itself via this API. So that it can get
+ * notified timely on the frequency band updates from other producers.
+ */
+int acpi_amd_wbrf_register_notifier(struct notifier_block *nb)
+{
+	return blocking_notifier_chain_register(&wbrf_chain_head, nb);
+}
+EXPORT_SYMBOL_GPL(acpi_amd_wbrf_register_notifier);
+
+/**
+ * acpi_amd_wbrf_unregister_notifier - unregister for notifications of
+ *                                     frequency band update
+ *
+ * @nb: driver notifier block
+ *
+ * The consumer should call this API when it is longer interested with
+ * the frequency band updates from other producers. Usually, this should
+ * be performed during driver cleanup.
+ */
+int acpi_amd_wbrf_unregister_notifier(struct notifier_block *nb)
+{
+	return blocking_notifier_chain_unregister(&wbrf_chain_head, nb);
+}
+EXPORT_SYMBOL_GPL(acpi_amd_wbrf_unregister_notifier);
diff --git a/include/linux/acpi_amd_wbrf.h b/include/linux/acpi_amd_wbrf.h
new file mode 100644
index 000000000000..c2363d664641
--- /dev/null
+++ b/include/linux/acpi_amd_wbrf.h
@@ -0,0 +1,140 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Wifi Band Exclusion Interface (AMD ACPI Implementation)
+ * Copyright (C) 2023 Advanced Micro Devices
+ *
+ * Due to electrical and mechanical constraints in certain platform designs
+ * there may be likely interference of relatively high-powered harmonics of
+ * the (G-)DDR memory clocks with local radio module frequency bands used
+ * by Wifi 6/6e/7.
+ *
+ * To mitigate this, AMD has introduced an ACPI based mechanism to support
+ * WBRF(Wifi Band RFI mitigation Feature) for platforms with AMD dGPU + WLAN.
+ * This needs support from BIOS equipped with necessary AML implementations
+ * and dGPU firmwares.
+ *
+ * Some general terms:
+ * Producer: such component who can produce high-powered radio frequency
+ * Consumer: such component who can adjust its in-use frequency in
+ *           response to the radio frequencies of other components to
+ *           mitigate the possible RFI.
+ *
+ * To make the mechanism function, those producers should notify active use
+ * of their particular frequencies so that other consumers can make relative
+ * internal adjustments as necessary to avoid this resonance.
+ */
+
+#ifndef _ACPI_AMD_WBRF_H
+#define _ACPI_AMD_WBRF_H
+
+#include <linux/device.h>
+#include <linux/notifier.h>
+
+/*
+ * A wbrf range is defined as a frequency band with start and end
+ * frequency point specified(in Hz). And a vaild range should have
+ * its start and end frequency point filled with non-zero values.
+ * Meanwhile, the maximum number of wbrf ranges is limited as
+ * `MAX_NUM_OF_WBRF_RANGES`.
+ */
+#define MAX_NUM_OF_WBRF_RANGES		11
+
+struct exclusion_range {
+	u64		start;
+	u64		end;
+};
+
+struct wbrf_ranges_in_out {
+	u64			num_of_ranges;
+	struct exclusion_range	band_list[MAX_NUM_OF_WBRF_RANGES];
+};
+
+/*
+ * The notification types for the consumers are defined as below.
+ * The consumers may need to take different actions in response to
+ * different notifications.
+ * WBRF_CHANGED: there was some frequency band updates. The consumers
+ *               should retrieve the latest active frequency bands.
+ */
+enum wbrf_notifier_actions {
+	WBRF_CHANGED,
+};
+
+#if IS_ENABLED(CONFIG_WBRF_AMD_ACPI)
+/*
+ * The expected flow for the producers:
+ * 1) During probe, call `acpi_amd_wbrf_supported_producer` to check
+ *    if WBRF can be enabled for the device.
+ * 2) On using some frequency band, call `acpi_amd_wbrf_add_exclusion`
+ *    to get other consumers properly notified.
+ * 3) Or on stopping using some frequency band, call
+ *    `acpi_amd_wbrf_remove_exclusion` to get other consumers notified.
+ */
+bool acpi_amd_wbrf_supported_producer(struct device *dev);
+int acpi_amd_wbrf_remove_exclusion(struct device *dev,
+				   struct wbrf_ranges_in_out *in);
+int acpi_amd_wbrf_add_exclusion(struct device *dev,
+				struct wbrf_ranges_in_out *in);
+
+/*
+ * The expected flow for the consumers:
+ * 1) During probe, call `acpi_amd_wbrf_supported_consumer` to check if WBRF
+ *    can be enabled for the device.
+ * 2) Call `acpi_amd_wbrf_register_notifier` to register for notification
+ *    of frequency band change(add or remove) from other producers.
+ * 3) Call the `acpi_amd_wbrf_retrieve_exclusions` intentionally to retrieve
+ *    current active frequency bands considering some producers may broadcast
+ *    such information before the consumer is up.
+ * 4) On receiving a notification for frequency band change, run
+ *    `acpi_amd_wbrf_retrieve_exclusions` again to retrieve the latest
+ *    active frequency bands.
+ * 5) During driver cleanup, call `acpi_amd_wbrf_unregister_notifier` to
+ *    unregister the notifier.
+ */
+bool acpi_amd_wbrf_supported_consumer(struct device *dev);
+int acpi_amd_wbrf_retrieve_exclusions(struct device *dev,
+				      struct wbrf_ranges_in_out *out);
+int acpi_amd_wbrf_register_notifier(struct notifier_block *nb);
+int acpi_amd_wbrf_unregister_notifier(struct notifier_block *nb);
+#else
+static inline
+bool acpi_amd_wbrf_supported_consumer(struct device *dev)
+{
+	return false;
+}
+static inline
+int acpi_amd_wbrf_remove_exclusion(struct device *dev,
+				   struct wbrf_ranges_in_out *in)
+{
+	return -ENODEV;
+}
+static inline
+int acpi_amd_wbrf_add_exclusion(struct device *dev,
+				struct wbrf_ranges_in_out *in)
+{
+	return -ENODEV;
+}
+static inline
+bool acpi_amd_wbrf_supported_producer(struct device *dev)
+{
+	return false;
+}
+static inline
+int acpi_amd_wbrf_retrieve_exclusions(struct device *dev,
+				      struct wbrf_ranges_in_out *out)
+{
+	return -ENODEV;
+}
+static inline
+int acpi_amd_wbrf_register_notifier(struct notifier_block *nb)
+{
+	return -ENODEV;
+}
+static inline
+int acpi_amd_wbrf_unregister_notifier(struct notifier_block *nb)
+{
+	return -ENODEV;
+}
+#endif
+
+#endif /* _ACPI_AMD_WBRF_H */
-- 
2.34.1

