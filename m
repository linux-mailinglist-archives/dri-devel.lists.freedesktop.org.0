Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E8674D023
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jul 2023 10:38:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09C0E10E230;
	Mon, 10 Jul 2023 08:38:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2059.outbound.protection.outlook.com [40.107.223.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B57110E22D;
 Mon, 10 Jul 2023 08:38:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S9zSBRFEfacsNf0LGRY0o3ArJrR+w4A/bV8SpNDQ3KWc7enCYYSaHs+e2zcaKXwLt1d5E6q74ugrONuPIRWL116CBTb1SPaSQcJzf1A2pKw3cRCwcfVra3gXJBk4SEuBB/OoD/hjCW9nDPWuxIP053JS/xlGzWin0zJgvSMQbq8bV2vJM7rqT8jq2MG3XfpLNoYqvvrWH5ZIiE6he8cCKzycjqpQ4olCPng+B3uGBdKjAWdRSk81NbOg+QGP+gaOhD6n/kst8KYOcgxDiH2JoVNW+TUDykcCXJIhe05mSy2xxjeQcMS7VhAhZ5B1vauMsToJ2cacz1xIUTXLsn8AIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5nDei7uuZqoTOslWgQibBud0GsaQVKnHNM+DYs7xJ9c=;
 b=dfjAMKebhQupO1wEjSI41YUg16/kcUzU+ERjr/O8vykIlIL7bozT8JAwvzibQQ7hjeulYlNzpOvwOoIN231sCfEOfAR4r32NqwVsxEoTS/zzwqdTaLmNNMEhOLYhfUuPtRB8bTriH2fkZyFNBe23mbUXY6fmh28jRXArxMrWYu9TJzYd3s4QyB99cQKqVrwgSc1xMknyEIFDfe4SQ6V69s5xv7eVkb4IERFOxZoeqr7W8krikM1DXy7RmnkQO1RRG53JAwXH8T45koOi6B751uXcshGZdctWKNNGNSNc6HwRVC/yUAoM2L8ixPmvw40sSH9/k9uVm/dPgBEsJqQe3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5nDei7uuZqoTOslWgQibBud0GsaQVKnHNM+DYs7xJ9c=;
 b=TbBxpCkUfhIzUoZwxu3DqVt2+VHncaZ3FZbxi78IxUa2dxrA2VjxBCyNv8efQrkiZCc+L4smpTvf191ynKKpZ5jF1GSspDuM7OlE9lbgMBlj3ZD0E6IbN/f8thzBT8VUQwzjkhSWwZ4xCoDEIgvo4ImfGnm43CRf1VEEOLm8lX0=
Received: from MW3PR05CA0025.namprd05.prod.outlook.com (2603:10b6:303:2b::30)
 by PH8PR12MB6842.namprd12.prod.outlook.com (2603:10b6:510:1c9::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Mon, 10 Jul
 2023 08:38:43 +0000
Received: from CO1NAM11FT017.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:2b:cafe::c4) by MW3PR05CA0025.outlook.office365.com
 (2603:10b6:303:2b::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.18 via Frontend
 Transport; Mon, 10 Jul 2023 08:38:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT017.mail.protection.outlook.com (10.13.175.108) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6588.18 via Frontend Transport; Mon, 10 Jul 2023 08:38:42 +0000
Received: from equan-buildpc.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Mon, 10 Jul
 2023 03:38:33 -0500
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
Subject: [PATCH V6 2/9] driver core: add ACPI based WBRF mechanism introduced
 by AMD
Date: Mon, 10 Jul 2023 16:36:34 +0800
Message-ID: <20230710083641.2132264-3-evan.quan@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1NAM11FT017:EE_|PH8PR12MB6842:EE_
X-MS-Office365-Filtering-Correlation-Id: 62c99559-42ea-4064-2d90-08db81211167
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: T4z2GTXLmUxfGx6i6PewZpUK8vEG+bvNZvoMZaFfNYVJ1RVEzE6th2DO7VqQTi5LgtrzVoWrsoC7cU3CyGVpXcAXvVThxPj3Qr9YIDQL/klxfw89K7tPO4oEdYv9QsH3VNSKrXwZWuZXx0grzzFpmmxvOuLZCzMDv/PyRq9lN08SL81xU4TawSyzYhD7RbwaqDTK4KWIGhbh/JQa+o9mvq7Vxu7h53CDt9F2OfCMdYZ1nj9NK5p+zCa0vDP+Fe4rRss7EuvprR+2DJC4wBPQFpclehDb+ut42lnHFZoxTEaCBMzclmmUSI6s/AzPzZbxu49EtB0Qwtpu3t0GK+tAa0DpdC09EV2FNDN1MKjKMm8prNrG+yZXsE3Sw4WsZJYUx6ucsJAPLc9arq77a+1xcs05OrVOSUqRhH15e0Reb48e9MVXRaksSIIXEcBqvNVIYkeq2zdtaj5uqiUNnsfELWotyJS/mnF9gBQbwpIu3tcHZ2mALjPx7G7STlSHXhXe75vY+NCopXswg8Rqcb983uRx7hUIemGHSN1n5CIMhQkmifVAIWc97X/JEYOi1F/IzVVTN/172XWvaA62X+nKaMhPKnbkoehOchgBaqi9CdVzDlM4+pkgdU1pgKzZbq6L4x6C7q0mevxvAKWMvoy3UEvkl7TP7and9GyLM7zqzQvz+00hR3R1Zs4HVXo7Li+2CoLk5JKvzHAZOHzD788BRrlLkWH2ccjQ2QEg/I7UUZ48nwOnsrKPAH8MaLYFwmSykz8n4JhSCTARrZq3SyEsmAL4eUIOd6H0DywQxYWdqXWxDX4y9jCKcFw2UkPFlIpsJZKU/JH6hkkcuBd2cCUJyQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(346002)(39860400002)(396003)(376002)(451199021)(36840700001)(46966006)(40470700004)(30864003)(1076003)(8676002)(41300700001)(8936002)(44832011)(2906002)(82740400003)(356005)(4326008)(81166007)(86362001)(7416002)(5660300002)(70586007)(70206006)(316002)(921005)(40460700003)(7696005)(186003)(54906003)(110136005)(16526019)(26005)(478600001)(36756003)(83380400001)(40480700001)(336012)(2616005)(426003)(36860700001)(47076005)(66899021)(82310400005)(83996005)(2101003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2023 08:38:42.7373 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 62c99559-42ea-4064-2d90-08db81211167
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT017.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6842
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

AMD has introduced an ACPI based mechanism to support WBRF for some
platforms with AMD dGPU + WLAN. This needs support from BIOS equipped
with necessary AML implementations and dGPU firmwares.

For those systems without the ACPI mechanism and developing solutions,
user can use the generic WBRF solution for diagnosing potential
interference issues.

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
v5->v6:
  - make the code more readable and some other fixes(Andrew)
---
 drivers/acpi/Makefile         |   2 +
 drivers/acpi/amd_wbrf.c       | 269 ++++++++++++++++++++++++++++++++++
 drivers/base/Kconfig          |  29 ++++
 drivers/base/wbrf.c           |  35 ++++-
 include/linux/acpi_amd_wbrf.h |  24 +++
 include/linux/wbrf.h          |   2 +
 6 files changed, 355 insertions(+), 6 deletions(-)
 create mode 100644 drivers/acpi/amd_wbrf.c
 create mode 100644 include/linux/acpi_amd_wbrf.h

diff --git a/drivers/acpi/Makefile b/drivers/acpi/Makefile
index feb36c0b9446..94b940ddbf88 100644
--- a/drivers/acpi/Makefile
+++ b/drivers/acpi/Makefile
@@ -131,3 +131,5 @@ obj-y				+= dptf/
 obj-$(CONFIG_ARM64)		+= arm64/
 
 obj-$(CONFIG_ACPI_VIOT)		+= viot.o
+
+obj-$(CONFIG_WBRF_AMD_ACPI)	+= amd_wbrf.o
diff --git a/drivers/acpi/amd_wbrf.c b/drivers/acpi/amd_wbrf.c
new file mode 100644
index 000000000000..481b1c180a09
--- /dev/null
+++ b/drivers/acpi/amd_wbrf.c
@@ -0,0 +1,269 @@
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
+/*
+ * Functions bit vector for WBRF method
+ *
+ * Bit 0: Supported for any functions other than function 0.
+ * Bit 1: Function 1 (Add / Remove frequency) is supported.
+ * Bit 2: Function 2 (Get frequency list) is supported.
+ */
+#define WBRF_SUPPORT_OTHER_FUNCTION		0x0
+#define WBRF_RECORD				0x1
+#define WBRF_RETRIEVE				0x2
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
+		*out = obj;
+		return 0;
+
+	case ACPI_TYPE_INTEGER:
+		rc =  obj->integer.value ? -EINVAL : 0;
+		break;
+
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
+		       struct wbrf_ranges_in *in)
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
+	 * Every range comes with two end points(start and end) and
+	 * each of them is accounted as an element. Meanwhile the range
+	 * count and action type are accounted as an element each.
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
+	ret = wbrf_dsm(adev, WBRF_RECORD, &argv4, NULL);
+
+	kfree(tmp);
+
+	return ret;
+}
+
+int acpi_amd_wbrf_add_exclusion(struct device *dev,
+				struct wbrf_ranges_in *in)
+{
+	struct acpi_device *adev = ACPI_COMPANION(dev);
+
+	if (!adev)
+		return -ENODEV;
+
+	return wbrf_record(adev, WBRF_RECORD_ADD, in);
+}
+
+int acpi_amd_wbrf_remove_exclusion(struct device *dev,
+				   struct wbrf_ranges_in *in)
+{
+	struct acpi_device *adev = ACPI_COMPANION(dev);
+
+	if (!adev)
+		return -ENODEV;
+
+	return wbrf_record(adev, WBRF_RECORD_REMOVE, in);
+}
+
+bool acpi_amd_wbrf_supported_producer(struct device *dev)
+{
+	struct acpi_device *adev = ACPI_COMPANION(dev);
+
+	if (!adev)
+		return false;
+
+	return acpi_check_dsm(adev->handle, &wifi_acpi_dsm_guid,
+			      WBRF_REVISION,
+			      BIT(WBRF_RECORD));
+}
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
+	if (ACPI_SUCCESS(ret))
+		return (union acpi_object *)buf.pointer;
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
+	/*
+	 * Bit vector providing supported functions information.
+	 * Each bit marks support for one specific function of the WBRF method.
+	 */
+	for (i = 0; i < obj->buffer.length && i < 8; i++)
+		mask |= (((u64)obj->buffer.pointer[i]) << (i * 8));
+
+	ACPI_FREE(obj);
+
+	if ((mask & BIT(WBRF_SUPPORT_OTHER_FUNCTION)) &&
+	     (mask & funcs) == funcs)
+		return true;
+
+	return false;
+}
+
+bool acpi_amd_wbrf_supported_consumer(struct device *dev)
+{
+	struct acpi_device *adev = ACPI_COMPANION(dev);
+
+	if (!adev)
+		return false;
+
+	return check_acpi_wbrf(adev->handle,
+			       WBRF_REVISION,
+			       BIT(WBRF_RETRIEVE));
+}
+
+int acpi_amd_wbrf_retrieve_exclusions(struct device *dev,
+				      struct wbrf_ranges_out *out)
+{
+	struct acpi_device *adev = ACPI_COMPANION(dev);
+	union acpi_object *obj;
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
+	if (obj->buffer.length > sizeof(*out) ||
+	    obj->buffer.length < 4) {
+		dev_err(dev, "BIOS FUBAR, ignoring wrong sized WBRT information");
+		ACPI_FREE(obj);
+		return -EINVAL;
+	}
+	memcpy(out, obj->buffer.pointer, obj->buffer.length);
+
+	ACPI_FREE(obj);
+
+	return 0;
+}
diff --git a/drivers/base/Kconfig b/drivers/base/Kconfig
index 5b441017b225..cbf0b2358c17 100644
--- a/drivers/base/Kconfig
+++ b/drivers/base/Kconfig
@@ -250,4 +250,33 @@ config WBRF
 	  different domains to notify the frequencies in use so that hardware
 	  can be reconfigured to avoid harmonic conflicts.
 
+config WBRF_AMD_ACPI
+	bool "Use the ACPI mechanism introduced by AMD to support WBRF"
+	default n
+	depends on ACPI
+	select WBRF
+	help
+	  AMD has introduced an ACPI based mechanism to support WBRF for some
+	  platforms with AMD dGPU and WLAN. This needs support from BIOS equipped
+	  with necessary AML implementations and dGPU firmwares.
+
+	  Say Y to enable this ACPI based mechanism. It is suggested to confirm
+	  with the hardware designer/provider first whether your platform
+	  equipped with necessary BIOS and firmwares.
+
+config WBRF_GENERIC
+	bool "Use the generic WBRF solution"
+	default n
+	depends on !WBRF_AMD_ACPI
+	select WBRF
+	help
+	  Ideally it is the hardware designer/provider who should provide a
+	  solution for the possible RF interference issue. Since they know
+	  well whether there could be RF interference issue with their
+	  platforms.
+
+	  Say Y to enable this generic WBRF solution for diagnosing potential
+	  interference issues on systems without the ACPI mechanism and
+	  developing solutions.
+
 endmenu
diff --git a/drivers/base/wbrf.c b/drivers/base/wbrf.c
index 2163a8ec8a9a..401c6da86618 100644
--- a/drivers/base/wbrf.c
+++ b/drivers/base/wbrf.c
@@ -6,9 +6,12 @@
  */
 
 #include <linux/wbrf.h>
+#include <linux/acpi_amd_wbrf.h>
 
 static BLOCKING_NOTIFIER_HEAD(wbrf_chain_head);
 static DEFINE_MUTEX(wbrf_mutex);
+
+#if IS_ENABLED(CONFIG_WBRF_GENERIC)
 static struct exclusion_range_pool wbrf_pool;
 
 static int _wbrf_add_exclusion_ranges(struct wbrf_ranges_in *in)
@@ -89,6 +92,7 @@ static int _wbrf_retrieve_exclusion_ranges(struct wbrf_ranges_out *out)
 
 	return 0;
 }
+#endif
 
 /**
  * wbrf_supported_producer - Determine if the device can report frequencies
@@ -100,7 +104,12 @@ static int _wbrf_retrieve_exclusion_ranges(struct wbrf_ranges_out *out)
  */
 bool wbrf_supported_producer(struct device *dev)
 {
+#if IS_ENABLED(CONFIG_WBRF_AMD_ACPI)
+	return acpi_amd_wbrf_supported_producer(dev);
+#elif IS_ENABLED(CONFIG_WBRF_GENERIC)
 	return true;
+#endif
+	return false;
 }
 EXPORT_SYMBOL_GPL(wbrf_supported_producer);
 
@@ -116,12 +125,15 @@ EXPORT_SYMBOL_GPL(wbrf_supported_producer);
 int wbrf_add_exclusion(struct device *dev,
 		       struct wbrf_ranges_in *in)
 {
-	int r;
+	int r = -ENODEV;
 
 	mutex_lock(&wbrf_mutex);
 
+#if IS_ENABLED(CONFIG_WBRF_AMD_ACPI)
+	r = acpi_amd_wbrf_add_exclusion(dev, in);
+#elif IS_ENABLED(CONFIG_WBRF_GENERIC)
 	r = _wbrf_add_exclusion_ranges(in);
-
+#endif
 	mutex_unlock(&wbrf_mutex);
 	if (r)
 		return r;
@@ -144,12 +156,15 @@ EXPORT_SYMBOL_GPL(wbrf_add_exclusion);
 int wbrf_remove_exclusion(struct device *dev,
 			  struct wbrf_ranges_in *in)
 {
-	int r;
+	int r = -ENODEV;
 
 	mutex_lock(&wbrf_mutex);
 
+#if IS_ENABLED(CONFIG_WBRF_AMD_ACPI)
+	r  = acpi_amd_wbrf_remove_exclusion(dev, in);
+#elif IS_ENABLED(CONFIG_WBRF_GENERIC)
 	r = _wbrf_remove_exclusion_ranges(in);
-
+#endif
 	mutex_unlock(&wbrf_mutex);
 	if (r)
 		return r;
@@ -171,7 +186,12 @@ EXPORT_SYMBOL_GPL(wbrf_remove_exclusion);
  */
 bool wbrf_supported_consumer(struct device *dev)
 {
+#if IS_ENABLED(CONFIG_WBRF_AMD_ACPI)
+	return acpi_amd_wbrf_supported_consumer(dev);
+#elif IS_ENABLED(CONFIG_WBRF_GENERIC)
 	return true;
+#endif
+	return false;
 }
 EXPORT_SYMBOL_GPL(wbrf_supported_consumer);
 
@@ -214,12 +234,15 @@ EXPORT_SYMBOL_GPL(wbrf_unregister_notifier);
 int wbrf_retrieve_exclusions(struct device *dev,
 			     struct wbrf_ranges_out *out)
 {
-	int r;
+	int r = -ENODEV;
 
 	mutex_lock(&wbrf_mutex);
 
+#if IS_ENABLED(CONFIG_WBRF_AMD_ACPI)
+	r = acpi_amd_wbrf_retrieve_exclusions(dev, out);
+#elif IS_ENABLED(CONFIG_WBRF_GENERIC)
 	r = _wbrf_retrieve_exclusion_ranges(out);
-
+#endif
 	mutex_unlock(&wbrf_mutex);
 
 	return r;
diff --git a/include/linux/acpi_amd_wbrf.h b/include/linux/acpi_amd_wbrf.h
new file mode 100644
index 000000000000..18b3d39b6abe
--- /dev/null
+++ b/include/linux/acpi_amd_wbrf.h
@@ -0,0 +1,24 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Wifi Band Exclusion Interface (AMD ACPI Implementation)
+ * Copyright (C) 2023 Advanced Micro Devices
+ *
+ */
+
+#ifndef _ACPI_AMD_WBRF_H
+#define _ACPI_AMD_WBRF_H
+
+#include <linux/wbrf.h>
+
+#if IS_ENABLED(CONFIG_WBRF_AMD_ACPI)
+bool acpi_amd_wbrf_supported_consumer(struct device *dev);
+bool acpi_amd_wbrf_supported_producer(struct device *dev);
+int acpi_amd_wbrf_remove_exclusion(struct device *dev,
+				   struct wbrf_ranges_in *in);
+int acpi_amd_wbrf_add_exclusion(struct device *dev,
+				struct wbrf_ranges_in *in);
+int acpi_amd_wbrf_retrieve_exclusions(struct device *dev,
+				      struct wbrf_ranges_out *out);
+#endif
+
+#endif /* _ACPI_AMD_WBRF_H */
diff --git a/include/linux/wbrf.h b/include/linux/wbrf.h
index 32c017232874..7e627ef34c33 100644
--- a/include/linux/wbrf.h
+++ b/include/linux/wbrf.h
@@ -18,10 +18,12 @@ struct exclusion_range {
 	u64		end;
 };
 
+#if IS_ENABLED(CONFIG_WBRF_GENERIC)
 struct exclusion_range_pool {
 	struct exclusion_range	band_list[MAX_NUM_OF_WBRF_RANGES];
 	u64			ref_counter[MAX_NUM_OF_WBRF_RANGES];
 };
+#endif
 
 struct wbrf_ranges_in {
 	/* valid entry: `start` and `end` filled with non-zero values */
-- 
2.34.1

