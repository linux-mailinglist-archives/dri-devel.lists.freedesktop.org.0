Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0798737AB0
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 07:47:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08EF110E3B1;
	Wed, 21 Jun 2023 05:47:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2088.outbound.protection.outlook.com [40.107.94.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D00110E3B8;
 Wed, 21 Jun 2023 05:47:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=heg8oRZfKNGziSA+hlJHwIFMdeG1ejOFpv8J8HtenAPmHCcvWExl/CK5OjMXjhYf32f2Mju7QNATdLf11of/ngKG+yA88NUyoQ1GlRhmWmc2AJ3aRTfZHM6v5qAz4Ms1tFLlD56EV7ghgf8+avClTVvKNPeIOsMCvBq0TNfd/3tvn521ely+umA5rKUuLBA06HAFw2Z+1Yk+dMPRdM6Mbv23z86il5qciC8ceC0gmEOUJotZdeztavFz7tu1JB0nygs76GY7UxS0+cvMMn4cqFNjW8wdZj5gHb5VPNIZp2pAI/XjseQ6KKPPFG2ki5HPAb2eocnENRolv5Fejjqc+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cow0QdZCPEsGDMYAI+jklwqjwTBkNc7U47PLXhHPBDg=;
 b=neSYzsJC94uw9LzMNji2QIycM4Pi3uh5JBuoLzChMzPn2XDp9mJs1xwXoj6vuK1Dt0H98wIgYW77w2WkH9b79rpUEm4l+l7BicEotYyD8mMHOuJYcTSb/RKSXWIaM8zi1eXLML2HSpbh7OihQAHNvovBORVhdeagmr48A/rh6+J8788/pTwz5LVcotd2TqXuY1YgrlwEHX3zWNyqHbx1M0HZWDjrtb0oATJZCIxZum4D86w/uo35OIMzTC0HR4Iidg9pgaRzlsLPTTcHSuyTcubGIYb/H+Y09MVOUZ6LXHyCwTWc4IVMtsi862cLxmA1JQEwYQ4BuPbYfZnYpOToCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cow0QdZCPEsGDMYAI+jklwqjwTBkNc7U47PLXhHPBDg=;
 b=pwRgDg1Z7mKgRU+b8+GJPbbddkH2LRo6lqSKKiS3u+FZGBGkCWCo09oV6YZGKzdYjo/mR7PolIsrR0BjQR7AyIhRB+2IMZ5haAOSnVkowY6bfiwPbVAuTk/O4ms9wXY2sTl1UHIPxAznTdeMaw4ZW+orSUGuoPG8dEC5uw1f3uU=
Received: from BY5PR17CA0028.namprd17.prod.outlook.com (2603:10b6:a03:1b8::41)
 by PH8PR12MB7445.namprd12.prod.outlook.com (2603:10b6:510:217::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.21; Wed, 21 Jun
 2023 05:47:36 +0000
Received: from MWH0EPF000989EB.namprd02.prod.outlook.com
 (2603:10b6:a03:1b8:cafe::e4) by BY5PR17CA0028.outlook.office365.com
 (2603:10b6:a03:1b8::41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37 via Frontend
 Transport; Wed, 21 Jun 2023 05:47:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000989EB.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6521.17 via Frontend Transport; Wed, 21 Jun 2023 05:47:35 +0000
Received: from equan-buildpc.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Wed, 21 Jun
 2023 00:47:26 -0500
From: Evan Quan <evan.quan@amd.com>
To: <rafael@kernel.org>, <lenb@kernel.org>, <alexander.deucher@amd.com>,
 <christian.koenig@amd.com>, <Xinhui.Pan@amd.com>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <johannes@sipsolutions.net>, <davem@davemloft.net>,
 <edumazet@google.com>, <kuba@kernel.org>, <pabeni@redhat.com>,
 <mario.limonciello@amd.com>, <mdaenzer@redhat.com>,
 <maarten.lankhorst@linux.intel.com>, <tzimmermann@suse.de>,
 <hdegoede@redhat.com>, <jingyuwang_vip@163.com>, <lijo.lazar@amd.com>,
 <jim.cromie@gmail.com>, <bellosilicio@gmail.com>, <andrealmeid@igalia.com>,
 <trix@redhat.com>, <jsg@jsg.id.au>, <arnd@arndb.de>
Subject: [PATCH V4 1/8] drivers/acpi: Add support for Wifi band RF mitigations
Date: Wed, 21 Jun 2023 13:45:56 +0800
Message-ID: <20230621054603.1262299-2-evan.quan@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230621054603.1262299-1-evan.quan@amd.com>
References: <20230621054603.1262299-1-evan.quan@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989EB:EE_|PH8PR12MB7445:EE_
X-MS-Office365-Filtering-Correlation-Id: b0262719-631d-4de2-4c55-08db721b03f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ppq2gD0loBfOLW6QGV2qN6DQ2dT9NegEUoe+UcrMBFevZXqIXVaZXlYvFJs7b1gCAlkuxIsPHbGzg88EUegycs67uX1e3yZO/5PJ0E/xusRLmf6cCc6bjSI8eePI9XFhIhV6gnAPbEhUFe4B1koU9XmdUXvRj8lx5sXYa8E9A2xzwfIJeQe0BTtsGIZ8Kql/gS+3x66TCCMGfj5bwLVK8w0W29WErcgSPfyWaK/sslfQ/v3TySqH6yAy+S0cUw7REUpTlCjYmkFpPGLaESac7tT7HveTrC+vvPaYqmMCGNhuNPLnpkMM11V2D/2ic607QgjgR9Xj8d/dac4c+xznqH2OOwLmigHvvsN51xH3WIKY9pRIsgnI4LcpvrGRYQCHVn8yAQZUPIYrialCTPFh9yuGbxRtyQMaPQdvI6FQEteGFwSPTmGnKQc5lSWuyz0T8srxnN7dsM0ZaPdyk8Dy/fNuJ9I9Xa/bj2LHNA2VJL+gniMsvulq/rvfg88KwCZ2wa7XveBqXnMSR5aAxptgIzsHLfRSGzGw0e3dwFYkusaoMibQLcYjBUf+tAqQ0PX0yWWsSkoVxhEmlNp4hMrt5f0jLpP0EB3FFU6nsVYW0CkYBxUtB2oh0DciI/6AeZuQHeK9kzu6wCSY4wohn0uAXupSO9AyDArci1hXAwcoi2hoWmeIbaM8MNj6XbvBwFULkPDxeRQhtl/hWlY7Su1JQajJd8WgRVQWYH0k9eHX2XBOTbvvi99oUcqAUSgt0c2855AE5B7xjPI+l542Yn2akWhAThzN5pmk6mkA4EYetut4NTOE24TsmMrvg4zSeaHrsTQWCi5Rjrb1L+ChxQ98Uw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(136003)(39860400002)(346002)(376002)(451199021)(46966006)(36840700001)(40470700004)(82310400005)(36860700001)(36756003)(40460700003)(81166007)(70206006)(356005)(921005)(5660300002)(44832011)(7416002)(86362001)(8936002)(8676002)(41300700001)(4326008)(316002)(40480700001)(70586007)(82740400003)(1076003)(2906002)(47076005)(186003)(26005)(426003)(16526019)(7696005)(2616005)(83380400001)(478600001)(110136005)(54906003)(6666004)(336012)(83996005)(36900700001)(2101003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2023 05:47:35.8013 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b0262719-631d-4de2-4c55-08db721b03f2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000989EB.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7445
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
   start and end ranges of the frequencies.
3) If removing frequencies, then call `wbrf_remove_exclusion` with
   start and end ranges of the frequencies.

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
  - move those wlan specific implementations to net/mac80211(Mario)
---
 drivers/acpi/Kconfig     |   7 ++
 drivers/acpi/Makefile    |   2 +
 drivers/acpi/acpi_wbrf.c | 215 +++++++++++++++++++++++++++++++++++++++
 include/linux/wbrf.h     |  55 ++++++++++
 4 files changed, 279 insertions(+)
 create mode 100644 drivers/acpi/acpi_wbrf.c
 create mode 100644 include/linux/wbrf.h

diff --git a/drivers/acpi/Kconfig b/drivers/acpi/Kconfig
index ccbeab9500ec..0276c1487fa2 100644
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
diff --git a/drivers/acpi/Makefile b/drivers/acpi/Makefile
index feb36c0b9446..14863b0c619f 100644
--- a/drivers/acpi/Makefile
+++ b/drivers/acpi/Makefile
@@ -131,3 +131,5 @@ obj-y				+= dptf/
 obj-$(CONFIG_ARM64)		+= arm64/
 
 obj-$(CONFIG_ACPI_VIOT)		+= viot.o
+
+obj-$(CONFIG_ACPI_WBRF)		+= acpi_wbrf.o
diff --git a/drivers/acpi/acpi_wbrf.c b/drivers/acpi/acpi_wbrf.c
new file mode 100644
index 000000000000..8c275998ac29
--- /dev/null
+++ b/drivers/acpi/acpi_wbrf.c
@@ -0,0 +1,215 @@
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
index 000000000000..e4c99b69f1d2
--- /dev/null
+++ b/include/linux/wbrf.h
@@ -0,0 +1,55 @@
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
+
+/* Maximum number of wbrf ranges */
+#define MAX_NUM_OF_WBRF_RANGES		11
+
+struct exclusion_range {
+	/* start and end point of the frequency range in Hz */
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

