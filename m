Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8327D7590DC
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jul 2023 11:02:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DD3410E435;
	Wed, 19 Jul 2023 09:02:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2061e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe59::61e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23EEA10E433;
 Wed, 19 Jul 2023 09:02:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ajt2+0KURaR+K4eNA4muGVTV6K5tWSa8NM9w8ERkdtwta3qN5vmubaaG/joqX1agXKk0NyGQcGz26GMVJnbQsYnDy80YFgIF95ie/lArFzMzPiEnD00jQX41R9jC38QGmIXyJ/1IkhLQrSl6v3vuan9oTRR1FMKCYH35r+T+O8lThWxoNHxo0scc/4KLfHGjtQjU3TS+pKFb94Ons6+eATYacivgdq4txIb7j0qIXMObrHlDF3CO9lM0qSiYFq041uUzH9u6TcCAfyekYhSKyt1tKt5bzpXb4q1fSdWvGKT+i7MYxxNKAIAHyyxF2GSKbClDSVhvil1NjqkSNN6QNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JDDRIUGCTN3fvd1CuLdiqrhQc0N9aQdOMwMha/Ppk1I=;
 b=Uu/UaTE5ttmJHfhP79yGwmk+0cKfx3yYuftMStbX7kIIGO/xyGOgXk7dnN14OexCZ+jDax+eI3gUwDN8cjTXbwfA5z1+WdvbLBXN9wcLku3Xt0bvBNOya49fJKFrRe29TsUKAh5fy3KM0Mc1LxpKQXF3Hzg/vKYmZrjWesTZlwf3PKx8LjK36jo0qlQ4+YBysVTbo8t8UTOPwiL1bfZOgbuwNQWlbP6EJcdH4geIet9PbW9PbWSYohRZw7WQo8JLwYcagxtfgOoFL+yCCkL85rhTHe+tnDZY9bf9BhuoIOTBmOG+NqmSTeRz4MtH1IaBFG3EdkOV890vnDXHTn0hiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JDDRIUGCTN3fvd1CuLdiqrhQc0N9aQdOMwMha/Ppk1I=;
 b=t1LCIIMNnoCdZlJZgAa3OKAI7NXDZQJGUNEyJpNuFh4PG6fBcEsQ86wFbzLwPm0mJ9vcmK4aSC1ga19rBJ/ORWfKgFZAvndsqLwHgvR2QHvSu+Scn4xfahR1SbmW3IhoserYuvIPgCH9jCHMrwzxcjNv7kchm5pkXPle+G1qXrE=
Received: from MW4PR04CA0228.namprd04.prod.outlook.com (2603:10b6:303:87::23)
 by SJ0PR12MB6736.namprd12.prod.outlook.com (2603:10b6:a03:47a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.33; Wed, 19 Jul
 2023 09:02:01 +0000
Received: from CO1NAM11FT037.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:87:cafe::8b) by MW4PR04CA0228.outlook.office365.com
 (2603:10b6:303:87::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.24 via Frontend
 Transport; Wed, 19 Jul 2023 09:02:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT037.mail.protection.outlook.com (10.13.174.91) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6588.20 via Frontend Transport; Wed, 19 Jul 2023 09:02:01 +0000
Received: from equan-buildpc.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Wed, 19 Jul
 2023 04:01:41 -0500
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
Subject: [PATCH V7 2/9] driver core: add ACPI based WBRF mechanism introduced
 by AMD
Date: Wed, 19 Jul 2023 17:00:13 +0800
Message-ID: <20230719090020.2716892-3-evan.quan@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230719090020.2716892-1-evan.quan@amd.com>
References: <20230719090020.2716892-1-evan.quan@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT037:EE_|SJ0PR12MB6736:EE_
X-MS-Office365-Filtering-Correlation-Id: 91be69e3-9dd7-4712-32f6-08db8836d0ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LhxcGRCt4P3JW7LXbkiWzLVNBLMEU9HZlMbnHC5p1Cc9RAws9/UZrtoK4sSg59StiU+kd1rfz5hVfeGlcHUNOAr9XKhOjbIuWkwcIopPtKT/qtV3BwSuKcnf/wE+cc2pnidC5Vqfv+dFq9DcHK9TTm5Zcqfg+7jQUUxpX6rNiOp8RCgCaTUYYDQWUxsjFU1v94fvwXMuL/OWGg+JoKeMfKyJI8AyMCvdFQik8AXy7k83KyHgXB56KuA5mcwxmq+FdybqM1Vijb68btK9GhrJmfNpnCnuOzdSfN4uYgjY+uy0bQNLb786ih2FklmgCCuB0ujMhTshV/wOiLa4LNnPTtkszPZQIKTF7ubC1aqBfEzp7Ayqy/uCaQqvnQDQ1Qmt1f2rE08QTAf9NFWE+GqVfXL/TpzAMXYMk1qBwaJQ20nqwuUaJUOLLtSEUimuAyjVBnjuW+dMICInNGJebOZ/ZC46eXM5LBVggPKz2nRK33wt3wfgCf6oDJt105xrAHtEO7/vgdJ1Zj01n0QdBRLs6PUbFK0+F6dX2v4cd10D7NNfbLCZuZZHfDJtDT0/Pha5Nvf7kafKbdSp5MzPNkKQWwB2cTo44wuycovWu1ZYwOuJw7X/dsD3/TYs8z9j8RJLXuUY5QZpJvVz2ZgASuIzERzpJSGb3KWziSDm9jgPtk6rsEjhutfRtBiJMD1smaD5aoJ4tvUuk/oSLP9pq1koznyEZeWR9PY0bB1XWB2NSZJe1C3foNbki4ovRNLR2WH1X0Ieh3/rfjJBsYyR4bj5pyMCA5Jpyt5vVg14sS7WWr0Dzh6cP0hNtXJiF3C/oL0YnsPiRQqAd9Ngp7rwqEYnkg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(136003)(396003)(346002)(376002)(82310400008)(451199021)(36840700001)(40470700004)(46966006)(86362001)(30864003)(2906002)(36756003)(44832011)(7416002)(66899021)(40460700003)(4326008)(40480700001)(54906003)(16526019)(426003)(336012)(186003)(36860700001)(83380400001)(26005)(1076003)(356005)(81166007)(921005)(6666004)(7696005)(82740400003)(110136005)(47076005)(2616005)(8936002)(70206006)(41300700001)(70586007)(316002)(8676002)(478600001)(5660300002)(36900700001)(2101003)(83996005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2023 09:02:01.5934 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 91be69e3-9dd7-4712-32f6-08db8836d0ec
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT037.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6736
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
 drivers/acpi/amd_wbrf.c       | 282 ++++++++++++++++++++++++++++++++++
 drivers/base/Kconfig          |  29 ++++
 drivers/base/wbrf.c           |  41 ++++-
 include/linux/acpi_amd_wbrf.h |  24 +++
 include/linux/wbrf.h          |   2 +
 6 files changed, 373 insertions(+), 7 deletions(-)
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
index 000000000000..f79d09c0c535
--- /dev/null
+++ b/drivers/acpi/amd_wbrf.c
@@ -0,0 +1,282 @@
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
+/*
+ * The data structure used for WBRF_RETRIEVE is not natually aligned.
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
+	struct amd_wbrf_ranges_out acpi_out = {0};
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
+	if (obj->buffer.length > sizeof(acpi_out) ||
+	    obj->buffer.length < 4) {
+		dev_err(dev, "BIOS FUBAR, ignoring wrong sized WBRT information");
+		ACPI_FREE(obj);
+		return -EINVAL;
+	}
+	memcpy(&acpi_out, obj->buffer.pointer, obj->buffer.length);
+
+	out->num_of_ranges = acpi_out.num_of_ranges;
+	memcpy(out->band_list, acpi_out.band_list, sizeof(acpi_out.band_list));
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
index 3bc1c31b094e..f69936eeeb3c 100644
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
@@ -91,6 +94,7 @@ static int _wbrf_retrieve_exclusion_ranges(struct wbrf_ranges_out *out)
 
 	return 0;
 }
+#endif
 
 /**
  * wbrf_supported_producer - Determine if the device should report frequencies
@@ -99,10 +103,17 @@ static int _wbrf_retrieve_exclusion_ranges(struct wbrf_ranges_out *out)
  *
  * WBRF is used to mitigate devices that cause harmonic interference.
  * This function will determine if this device should report such frequencies.
+ * For example, for AMD ACPI implementation it should say true only when the
+ * necessary AML code/logic supporting wbrf feature available for this device.
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
 
@@ -118,12 +129,15 @@ EXPORT_SYMBOL_GPL(wbrf_supported_producer);
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
@@ -146,12 +160,15 @@ EXPORT_SYMBOL_GPL(wbrf_add_exclusion);
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
@@ -169,11 +186,18 @@ EXPORT_SYMBOL_GPL(wbrf_remove_exclusion);
  *
  * WBRF is used to mitigate devices that cause harmonic interference.
  * This function will determine if this device should react to reports from
- * other devices for such frequencies.
+ * other devices for such frequencies. For example, for AMD ACPI implementation
+ * it should say true only when the necessary AML code/logic supporting wbrf
+ * feature available for this device.
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
 
@@ -216,12 +240,15 @@ EXPORT_SYMBOL_GPL(wbrf_unregister_notifier);
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
index 2ad217fee349..09784eb2e9b2 100644
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

