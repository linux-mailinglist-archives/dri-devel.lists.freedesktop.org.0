Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 813B0777183
	for <lists+dri-devel@lfdr.de>; Thu, 10 Aug 2023 09:40:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13E3F10E4D5;
	Thu, 10 Aug 2023 07:40:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2049.outbound.protection.outlook.com [40.107.92.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73FF210E4D5;
 Thu, 10 Aug 2023 07:39:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=np0fmzC8fN9H+kesc6UzS/8HFY8rYfypkctollNYX6jLNTCfKLcMpzxDS8xaWv27jSzVX+KYE9WRlHKtMTQCrsTijburb+W5gmsiPyJUvyOFMoOg07bC3dm9h8cz0cFUkhwPB/nbCeIY+y5MUDjsYV8pqSZ16aGK2EH39BjjCFgxoBTs9snV+KP0ydg6lBmEYc55yUZ6x3rFSNlt6vp0kcIBLrtbwpinVcZwcV+QTZCx7vwzoRK5bliScRV8F/kPb5uCeDC9NisVNml6zR/6Lexf0c48MrkV7oXt9d+zi3teoICW6TkuF6VAU/KLnTlZFATevmZzTucYDzYofEQeGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yCaHqYP8QYyX8L941rjs+1lHEWpQH7UheKFD3geywvk=;
 b=O1QhCw1vUvkMBLrRjC9REF/z0rRtdTrReojVgx/dBqQMcdLtY0u5h4A81bq1/L6hV3Qvw2iI58dcaZ46Dx/fEnbZJIahXzfNPnXcQiBaVLvmbDLNrYqEsB7fzKkSPA+QWbFcGsXWhivQHMcS6gBtuRNTM+RdWOD/nQ7z8CsWcjAV//or7d97OxGZ2mSB8dBql+GTMQDo/ga118uvUDezlcYtzAlb+5KGUUQ8IGsV2XgfqjSGNbDF1kW28f4Tq67y/fR6qV/90DP64MU7COj10D9xK30r/+qXf+CcUK64kJ3BCPc9dVcgfLKpGHFZssthT0OqjwOisugbnq24RTwdDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yCaHqYP8QYyX8L941rjs+1lHEWpQH7UheKFD3geywvk=;
 b=lQvCVvmGH5Ax8Hrn3o5UTdztzBV0gNvoea9oZFs1lVqsYuaui3crGY53HQLuj5nxbDeUMrMso53eaHs6/HiiFB3DBlJpD+saz9niXSSKh0bUd8xkK9f+S6PIoQqaWZVkxBKAajzVWCLGEkVOjIL4OdwklSJIAzWpPrlCsKKpe0c=
Received: from MW4P220CA0017.NAMP220.PROD.OUTLOOK.COM (2603:10b6:303:115::22)
 by DS0PR12MB7747.namprd12.prod.outlook.com (2603:10b6:8:138::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.30; Thu, 10 Aug
 2023 07:39:54 +0000
Received: from MWH0EPF000971E8.namprd02.prod.outlook.com
 (2603:10b6:303:115:cafe::34) by MW4P220CA0017.outlook.office365.com
 (2603:10b6:303:115::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.30 via Frontend
 Transport; Thu, 10 Aug 2023 07:39:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000971E8.mail.protection.outlook.com (10.167.243.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6652.20 via Frontend Transport; Thu, 10 Aug 2023 07:39:54 +0000
Received: from equan-buildpc.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 10 Aug
 2023 02:39:30 -0500
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
Subject: [PATCH V8 2/9] drivers core: add ACPI based WBRF mechanism introduced
 by AMD
Date: Thu, 10 Aug 2023 15:37:56 +0800
Message-ID: <20230810073803.1643451-3-evan.quan@amd.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E8:EE_|DS0PR12MB7747:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a0ce06a-06d0-4efd-692a-08db9974fcf4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: c/gGQCEEUNPw+iFHJf3czUYeey3BcnJos6RqVqQ+p2Lg8FFt7yAva48zyFMvSrVa/VwpHl4WhjHbiFnd8z67mTdU9NKfWKsU5H/bkJ2s8NRKax9PUVBCAIDiJG8pHgnqxZYxUykpHwmHoqEB8f5dpavKnnyoClQnIY0Hfl1Y5/Y3FMyAcdYEFRId01ukTjMwDvos7amDStvwUO/mQ60zmB7qvKx5vOhayMy39G8CIf5bQDdFnpm9hrcaqVCf+0JK9SYnNv9myFJdpkqJ7m0wQxCBa6TGBrvmlhhbdZ32BznDHBBtsZFocuwOm29v694/Gbto1uJc+o3DAeRsaXshleX2Ou3gd+L8BOuaiDvgSO7H2Wt2v71P1L8gMLYC80m8ctnGl4nix0AhjsmGRZiG/r8xxbUVlYMQOzzV7k47jPuTyGJMEty2Cv1tpmKwMznf2K2ALRT+3a/nCsTkb6MQyRZl5Vo10mIbI42Yx4oduiwZ+BSLQ9WAKRN6ywNYkSypd94P9w6CGOVZXaSyQ7wxGB0njCB6bfYn8DkRW+eR64Vt5UEzDQmBhFEoQ1tLUd77nMg8jov+NddAyobwWfktgpHBnhkQWnUa9H7N5ey5rdE2saXVFz9zdensAkqNCdVcmOGidXUUBjVNCz31k/0rC6SIBlJfZnm2fhhzfoBW2667dxpLfpDEUKizSzDAoCesujP/DB4dIu6g3IbIBMKTNN62u2eN/dKRL9UtoSj1VFB5DsBdQ69bakUlgdiDMMpko65dQOIaoO5HKe/wNTGsQhkI8qcgRw9UvsKI7G81dOv7x5mYdZ+gbG3iVv7wnvUiZqKgw5W5t/3Jju4KHOvvjw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(39860400002)(376002)(346002)(396003)(451199021)(82310400008)(186006)(1800799006)(40470700004)(36840700001)(46966006)(36756003)(40460700003)(26005)(1076003)(8936002)(921005)(8676002)(356005)(82740400003)(40480700001)(316002)(86362001)(2616005)(478600001)(426003)(81166007)(41300700001)(336012)(16526019)(36860700001)(5660300002)(7696005)(44832011)(7416002)(30864003)(70586007)(70206006)(4326008)(2906002)(83380400001)(47076005)(6666004)(54906003)(110136005)(2101003)(83996005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2023 07:39:54.0783 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a0ce06a-06d0-4efd-692a-08db9974fcf4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000971E8.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7747
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
user can use/fall-back the generic WBRF solution for diagnosing potential
interference issues.

And for the platform which does not equip with the necessary AMD ACPI
implementations but with CONFIG_WBRF_AMD_ACPI built as 'y', it will
fall back to generic WBRF solution if the `wbrf` is set as "on".

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
v6->v8:
  - drop CONFIG_WBRF_GENERIC(Mario)
  - add `wbrf` kernel parameter for policy control(Mario)
---
 drivers/acpi/Makefile         |   2 +
 drivers/acpi/amd_wbrf.c       | 294 ++++++++++++++++++++++++++++++++++
 drivers/base/Kconfig          |  20 +++
 drivers/base/wbrf.c           | 135 +++++++++++++---
 include/linux/acpi_amd_wbrf.h |  25 +++
 5 files changed, 452 insertions(+), 24 deletions(-)
 create mode 100644 drivers/acpi/amd_wbrf.c
 create mode 100644 include/linux/acpi_amd_wbrf.h

diff --git a/drivers/acpi/Makefile b/drivers/acpi/Makefile
index 3fc5a0d54f6e..9185d16e4495 100644
--- a/drivers/acpi/Makefile
+++ b/drivers/acpi/Makefile
@@ -133,3 +133,5 @@ obj-$(CONFIG_ARM64)		+= arm64/
 obj-$(CONFIG_ACPI_VIOT)		+= viot.o
 
 obj-$(CONFIG_RISCV)		+= riscv/
+
+obj-$(CONFIG_WBRF_AMD_ACPI)	+= amd_wbrf.o
diff --git a/drivers/acpi/amd_wbrf.c b/drivers/acpi/amd_wbrf.c
new file mode 100644
index 000000000000..a3390d91cbea
--- /dev/null
+++ b/drivers/acpi/amd_wbrf.c
@@ -0,0 +1,294 @@
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
+bool acpi_amd_wbrf_supported_system(void)
+{
+	acpi_status status;
+	acpi_handle handle;
+
+	status = acpi_get_handle(NULL, ACPI_AMD_WBRF_METHOD, &handle);
+
+	return ACPI_SUCCESS(status);
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
+	if ((mask & BIT(WBRF_ENABLED)) &&
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
index 2b8fd6bb7da0..feb6f5625728 100644
--- a/drivers/base/Kconfig
+++ b/drivers/base/Kconfig
@@ -242,4 +242,24 @@ config FW_DEVLINK_SYNC_STATE_TIMEOUT
 	  command line option on every system/board your kernel is expected to
 	  work on.
 
+menu "Wifi band RF mitigation mechanism"
+
+config WBRF_AMD_ACPI
+	bool "ACPI based mechanism introduced by AMD"
+	depends on ACPI
+	help
+	  Wifi band RF mitigation mechanism allows multiple drivers from
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
+endmenu
+
 endmenu
diff --git a/drivers/base/wbrf.c b/drivers/base/wbrf.c
index 678f245c12c6..751e252d0039 100644
--- a/drivers/base/wbrf.c
+++ b/drivers/base/wbrf.c
@@ -6,9 +6,25 @@
  */
 
 #include <linux/wbrf.h>
+#include <linux/acpi_amd_wbrf.h>
 
 static BLOCKING_NOTIFIER_HEAD(wbrf_chain_head);
+
 static DEFINE_MUTEX(wbrf_mutex);
+
+static struct exclusion_range_pool {
+	struct exclusion_range	band_list[MAX_NUM_OF_WBRF_RANGES];
+	u64			ref_counter[MAX_NUM_OF_WBRF_RANGES];
+} wbrf_pool;
+
+enum WBRF_SUPPORT_CHECK {
+	WBRF_SUPPORT_UNCHECKED,
+	WBRF_SUPPORT_NONE,
+	WBRF_SUPPORT_GENERIC,
+	WBRF_SUPPORT_OTHERS,
+};
+static atomic_t wbrf_support_check = ATOMIC_INIT(WBRF_SUPPORT_UNCHECKED);
+
 static enum WBRF_POLICY_MODE {
 	WBRF_POLICY_FORCE_DISABLE,
 	WBRF_POLICY_AUTO,
@@ -30,11 +46,6 @@ static int __init parse_wbrf_policy_mode(char *p)
 }
 early_param("wbrf", parse_wbrf_policy_mode);
 
-static struct exclusion_range_pool {
-	struct exclusion_range	band_list[MAX_NUM_OF_WBRF_RANGES];
-	u64			ref_counter[MAX_NUM_OF_WBRF_RANGES];
-} wbrf_pool;
-
 static int _wbrf_add_exclusion_ranges(struct wbrf_ranges_in *in)
 {
 	int i, j;
@@ -121,20 +132,45 @@ static int _wbrf_retrieve_exclusion_ranges(struct wbrf_ranges_out *out)
  *
  * WBRF is used to mitigate devices that cause harmonic interference.
  * This function will determine if the platform is able to support the
- * WBRF features.
+ * WBRF features. For example, for AMD ACPI implementation it should say
+ * true only when the necessary AML code/logic supporting wbrf feature
+ * available.
  */
-static bool wbrf_supported_system(void)
+static enum WBRF_SUPPORT_CHECK wbrf_supported_system(void)
 {
+	enum WBRF_SUPPORT_CHECK support_check;
+
+	support_check = atomic_read(&wbrf_support_check);
+	if (support_check != WBRF_SUPPORT_UNCHECKED)
+		return support_check;
+
+	support_check = WBRF_SUPPORT_NONE;
+
 	switch (wbrf_policy) {
 	case WBRF_POLICY_FORCE_ENABLE:
-		return true;
+#if IS_ENABLED(CONFIG_WBRF_AMD_ACPI)
+		if (acpi_amd_wbrf_supported_system()) {
+			support_check = WBRF_SUPPORT_OTHERS;
+			break;
+		}
+		pr_warn_once("Force WBRF w/o acpi_amd_wbrf support\n");
+		pr_warn_once("Fall back to generic version\n");
+#endif
+		support_check = WBRF_SUPPORT_GENERIC;
+		break;
 	case WBRF_POLICY_FORCE_DISABLE:
-		return false;
+		break;
 	case WBRF_POLICY_AUTO:
-		return false;
+#if IS_ENABLED(CONFIG_WBRF_AMD_ACPI)
+		if (acpi_amd_wbrf_supported_system())
+			support_check = WBRF_SUPPORT_OTHERS;
+#endif
+		break;
 	}
 
-	return false;
+	atomic_set(&wbrf_support_check, support_check);
+
+	return support_check;
 }
 
 /**
@@ -144,13 +180,22 @@ static bool wbrf_supported_system(void)
  *
  * WBRF is used to mitigate devices that cause harmonic interference.
  * This function will determine if this device should report such frequencies.
+ * For example, for AMD ACPI implementation it should say true only when the
+ * necessary AML code/logic supporting wbrf feature available for this device.
  */
 bool wbrf_supported_producer(struct device *dev)
 {
-	if (!wbrf_supported_system())
+	switch (wbrf_supported_system()) {
+	case WBRF_SUPPORT_GENERIC:
+		return true;
+	case WBRF_SUPPORT_OTHERS:
+#if IS_ENABLED(CONFIG_WBRF_AMD_ACPI)
+		return acpi_amd_wbrf_supported_producer(dev);
+#endif
+		fallthrough;
+	default:
 		return false;
-
-	return true;
+	}
 }
 EXPORT_SYMBOL_GPL(wbrf_supported_producer);
 
@@ -166,11 +211,22 @@ EXPORT_SYMBOL_GPL(wbrf_supported_producer);
 int wbrf_add_exclusion(struct device *dev,
 		       struct wbrf_ranges_in *in)
 {
-	int r;
+	int r = -ENODEV;
 
 	mutex_lock(&wbrf_mutex);
 
-	r = _wbrf_add_exclusion_ranges(in);
+	switch (wbrf_supported_system()) {
+	case WBRF_SUPPORT_OTHERS:
+#if IS_ENABLED(CONFIG_WBRF_AMD_ACPI)
+		r = acpi_amd_wbrf_add_exclusion(dev, in);
+#endif
+		break;
+	case WBRF_SUPPORT_GENERIC:
+		r = _wbrf_add_exclusion_ranges(in);
+		break;
+	default:
+		break;
+	}
 
 	mutex_unlock(&wbrf_mutex);
 	if (r)
@@ -194,11 +250,22 @@ EXPORT_SYMBOL_GPL(wbrf_add_exclusion);
 int wbrf_remove_exclusion(struct device *dev,
 			  struct wbrf_ranges_in *in)
 {
-	int r;
+	int r = -ENODEV;
 
 	mutex_lock(&wbrf_mutex);
 
-	r = _wbrf_remove_exclusion_ranges(in);
+	switch (wbrf_supported_system()) {
+	case WBRF_SUPPORT_OTHERS:
+#if IS_ENABLED(CONFIG_WBRF_AMD_ACPI)
+		r  = acpi_amd_wbrf_remove_exclusion(dev, in);
+#endif
+		break;
+	case WBRF_SUPPORT_GENERIC:
+		r = _wbrf_remove_exclusion_ranges(in);
+		break;
+	default:
+		break;
+	}
 
 	mutex_unlock(&wbrf_mutex);
 	if (r)
@@ -217,14 +284,23 @@ EXPORT_SYMBOL_GPL(wbrf_remove_exclusion);
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
-	if (!wbrf_supported_system())
+	switch (wbrf_supported_system()) {
+	case WBRF_SUPPORT_GENERIC:
+		return true;
+	case WBRF_SUPPORT_OTHERS:
+#if IS_ENABLED(CONFIG_WBRF_AMD_ACPI)
+		return acpi_amd_wbrf_supported_consumer(dev);
+#endif
+		fallthrough;
+	default:
 		return false;
-
-	return true;
+	}
 }
 EXPORT_SYMBOL_GPL(wbrf_supported_consumer);
 
@@ -267,11 +343,22 @@ EXPORT_SYMBOL_GPL(wbrf_unregister_notifier);
 int wbrf_retrieve_exclusions(struct device *dev,
 			     struct wbrf_ranges_out *out)
 {
-	int r;
+	int r = -ENODEV;
 
 	mutex_lock(&wbrf_mutex);
 
-	r = _wbrf_retrieve_exclusion_ranges(out);
+	switch (wbrf_supported_system()) {
+	case WBRF_SUPPORT_OTHERS:
+#if IS_ENABLED(CONFIG_WBRF_AMD_ACPI)
+		r = acpi_amd_wbrf_retrieve_exclusions(dev, out);
+#endif
+		break;
+	case WBRF_SUPPORT_GENERIC:
+		r = _wbrf_retrieve_exclusion_ranges(out);
+		break;
+	default:
+		break;
+	}
 
 	mutex_unlock(&wbrf_mutex);
 
diff --git a/include/linux/acpi_amd_wbrf.h b/include/linux/acpi_amd_wbrf.h
new file mode 100644
index 000000000000..40c59e9f626d
--- /dev/null
+++ b/include/linux/acpi_amd_wbrf.h
@@ -0,0 +1,25 @@
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
+bool acpi_amd_wbrf_supported_system(void);
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
-- 
2.34.1

