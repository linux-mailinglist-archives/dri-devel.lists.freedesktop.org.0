Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E319E743975
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jun 2023 12:34:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04CCE10E296;
	Fri, 30 Jun 2023 10:34:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20605.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eab::605])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A37C10E157;
 Fri, 30 Jun 2023 10:34:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jQQy+Y73KRIZOBHcb69Eroq1ynRsmiVCdztaCeVRyXZT0SHz3tOaqLkYGFLmyjcynBAPnmxK0M6ZJ8sf4qskYU6A3TkTOyWpEN+D/E2ARW6mB8hRl+m4XyRFXEpXOjZEBvmosDAU4rVkzgvUwHum+I1o8lIDcRoZgBKbq3VxZafjG7/PdIwDFDH42dMsbVn5HB1+36dvYVObCYtZc2Kn+s98Fduxd17MJ6UzdK5dHVzYuAA4FJL081v3+bw6ubrDQDG/UvUGcR95oGi5oEahPvm52d6p3iFvga6lK7FSkj/kl7lyADQh+IIzOfsyenhNdeZs+0Eam52BvFyFQxDZ7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bhYfZLG0qKeanOUYjubLfrEZXNQFsM0seDnuO72sm2s=;
 b=iG5ksWvak3XjGIPZJF+E0u10Qk4VYBmIMmM3e/wGH64VXkHQpUABs+ZGtK9qcDACCKlXoHL8xORIifYgVCtlJ/CWnnR0LVOXz0Y+QxMfXL9ytdsX27jm5Ngd8UTeIpWdmzaM9NXVQfTw/NqzDwzpsvgfpORyGVkUAp+5F9oQrcu6KrFVEngt4mwwF0VsBSLkFuu8kNPvZAAY+BSE9wYoo220yEJR2vmUgOWJZgGycIfSK9k/oVN5jbjXH1XqOdhn5RD/98tTauKghl6jgg/t6ixprDONM367lt1b2wxWucX84ntVTN9R5Ojnr2+4rpSJyBx95oj2F4Yzeix/97FVGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bhYfZLG0qKeanOUYjubLfrEZXNQFsM0seDnuO72sm2s=;
 b=Ri4+xrCuI9Sd66sTPnVp/I3/TevySYYV/xqBsl50VJJp69DUTa3l+HI/H9ShhFRpEdGqDEgjQZNWUwkTMBI7DQ5pqkIkfEZTfOyRhZ9Z4FnUmPnm/hnXDp4ZcYJdX3Ud906Y/Wbrnmq9IyyKluXtC4+Uw+N27TXgt7MKEb9KOeA=
Received: from DM6PR18CA0004.namprd18.prod.outlook.com (2603:10b6:5:15b::17)
 by MW6PR12MB7086.namprd12.prod.outlook.com (2603:10b6:303:238::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Fri, 30 Jun
 2023 10:34:11 +0000
Received: from DM6NAM11FT010.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:15b:cafe::95) by DM6PR18CA0004.outlook.office365.com
 (2603:10b6:5:15b::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.22 via Frontend
 Transport; Fri, 30 Jun 2023 10:34:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT010.mail.protection.outlook.com (10.13.172.222) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6500.49 via Frontend Transport; Fri, 30 Jun 2023 10:34:10 +0000
Received: from equan-buildpc.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Fri, 30 Jun
 2023 05:34:02 -0500
From: Evan Quan <evan.quan@amd.com>
To: <rafael@kernel.org>, <lenb@kernel.org>, <Alexander.Deucher@amd.com>,
 <Christian.Koenig@amd.com>, <Xinhui.Pan@amd.com>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <johannes@sipsolutions.net>, <davem@davemloft.net>,
 <edumazet@google.com>, <kuba@kernel.org>, <pabeni@redhat.com>,
 <Mario.Limonciello@amd.com>, <mdaenzer@redhat.com>,
 <maarten.lankhorst@linux.intel.com>, <tzimmermann@suse.de>,
 <hdegoede@redhat.com>, <jingyuwang_vip@163.com>, <Lijo.Lazar@amd.com>,
 <jim.cromie@gmail.com>, <bellosilicio@gmail.com>, <andrealmeid@igalia.com>,
 <trix@redhat.com>, <jsg@jsg.id.au>, <arnd@arndb.de>
Subject: [PATCH V5 2/9] driver core: add ACPI based WBRF mechanism introduced
 by AMD
Date: Fri, 30 Jun 2023 18:32:33 +0800
Message-ID: <20230630103240.1557100-3-evan.quan@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230630103240.1557100-1-evan.quan@amd.com>
References: <20230630103240.1557100-1-evan.quan@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT010:EE_|MW6PR12MB7086:EE_
X-MS-Office365-Filtering-Correlation-Id: 95a2c99d-3c5c-4729-40c4-08db79558ac9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jmE2Zvdiy5ZZBhHV4KOVMI81ACGR95wqDQ/bpfPobVNvm/YefXw0/69Tbp8pOcu8bZkWOkIXXd/SWQKgiBvCy/sf8QKU/rbGG9mrwseBBSCkkMXPgeB7WmL8soNxwcT9zK7PFz7gCyDfmUv3dQe2sX9WWRHcQvYgjcqEAPgp70AY5c79QwXQdc8ESCsCW1XdJI58AZdcpNQ42ngSmoPal5sy/yNxcRW3cRNT8m6sftv+2YyWm/IlyMTtRU8OBiV/WKC0vCCFg+zCVrcOejhnigTjXC9tsr4VZtUr6XYbi5xOqUxunONQdvhdSn1wc00h1O0e1LwvQWT5T0VpQYbSxMIzMTHedodSau96LXZQBPdVG47WTNvvc/f/8lGSSaj6uZMHmb+1n4dqjErFMh8eNxevFGdvYUp5wlR5GiH/Il5lyZ+gxdpNuqQibpqnRhTA9d0L12ZB/SoSYMUMGd92Fh9jNziHW5MyK7e3zYyAqD3a4UKj2Mfw3S0eci7gVYtZVngxanjGZcGcrXxXhAf7hOXDGE41WxYXn8INxGMjna4dwgdWvb4mX/+CwTT2h90kJG9FiuMPMIS5O3CKxvpRGkl9hL2tWxDgT7ave59it7rCkUM7tN2cPeAVmMpBHI4eIsEg6ricFNBWLQAJ4t6fX8BJOJEXygOISfvFhIwPe3Dwg6bKRh3b9p38SVLX7T1mBOT176610m2Q0DVCQDCwtHGS+aC8Vk1/0iywuEfDnGdwER8I7VfbFrgSmv4gsGmrumWLSaygrG+wiR2G3CLLlCE00SLFruiFxJOFnUmno5A78m4iRPiECScmPpNyPosQjxYVpXbyQC5I2EeATSls3w==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(136003)(346002)(39860400002)(376002)(451199021)(46966006)(40470700004)(36840700001)(66899021)(41300700001)(36860700001)(16526019)(82310400005)(36756003)(40460700003)(316002)(70206006)(81166007)(7416002)(30864003)(5660300002)(44832011)(921005)(356005)(8936002)(86362001)(8676002)(70586007)(40480700001)(4326008)(82740400003)(47076005)(1076003)(2906002)(478600001)(83380400001)(2616005)(26005)(186003)(426003)(6666004)(7696005)(110136005)(336012)(54906003)(36900700001)(83996005)(2101003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2023 10:34:10.9902 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 95a2c99d-3c5c-4729-40c4-08db79558ac9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT010.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB7086
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
---
 drivers/acpi/Makefile         |   2 +
 drivers/acpi/amd_wbrf.c       | 236 ++++++++++++++++++++++++++++++++++
 drivers/base/Kconfig          |  29 +++++
 drivers/base/wbrf.c           |  35 ++++-
 include/linux/acpi_amd_wbrf.h |  38 ++++++
 include/linux/wbrf.h          |   2 +
 6 files changed, 336 insertions(+), 6 deletions(-)
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
index 000000000000..44e38c97acf0
--- /dev/null
+++ b/drivers/acpi/amd_wbrf.c
@@ -0,0 +1,236 @@
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
+	WARN(obj->buffer.length != sizeof(*out),
+		"Unexpected buffer length");
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
index 2163a8ec8a9a..d9fab9f3045e 100644
--- a/drivers/base/wbrf.c
+++ b/drivers/base/wbrf.c
@@ -6,9 +6,12 @@
  */
 
 #include <linux/wbrf.h>
+#include <linux/acpi_amd_wbrf.h>
 
 static BLOCKING_NOTIFIER_HEAD(wbrf_chain_head);
 static DEFINE_MUTEX(wbrf_mutex);
+
+#if defined(CONFIG_WBRF_GENERIC)
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
+#ifdef CONFIG_WBRF_AMD_ACPI
+	return acpi_amd_wbrf_supported_producer(dev);
+#elif defined(CONFIG_WBRF_GENERIC)
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
 
+#ifdef CONFIG_WBRF_AMD_ACPI
+	r = acpi_amd_wbrf_add_exclusion(dev, in);
+#elif defined(CONFIG_WBRF_GENERIC)
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
 
+#ifdef CONFIG_WBRF_AMD_ACPI
+	r  = acpi_amd_wbrf_remove_exclusion(dev, in);
+#elif defined(CONFIG_WBRF_GENERIC)
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
+#ifdef CONFIG_WBRF_AMD_ACPI
+	return acpi_amd_wbrf_supported_consumer(dev);
+#elif defined(CONFIG_WBRF_GENERIC)
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
 
+#ifdef CONFIG_WBRF_AMD_ACPI
+	r = acpi_amd_wbrf_retrieve_exclusions(dev, out);
+#elif defined(CONFIG_WBRF_GENERIC)
 	r = _wbrf_retrieve_exclusion_ranges(out);
-
+#endif
 	mutex_unlock(&wbrf_mutex);
 
 	return r;
diff --git a/include/linux/acpi_amd_wbrf.h b/include/linux/acpi_amd_wbrf.h
new file mode 100644
index 000000000000..c274093972e3
--- /dev/null
+++ b/include/linux/acpi_amd_wbrf.h
@@ -0,0 +1,38 @@
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
+#ifdef CONFIG_WBRF_AMD_ACPI
+bool acpi_amd_wbrf_supported_consumer(struct device *dev);
+bool acpi_amd_wbrf_supported_producer(struct device *dev);
+int acpi_amd_wbrf_remove_exclusion(struct device *dev,
+				   struct wbrf_ranges_in *in);
+int acpi_amd_wbrf_add_exclusion(struct device *dev,
+				struct wbrf_ranges_in *in);
+int acpi_amd_wbrf_retrieve_exclusions(struct device *dev,
+				      struct wbrf_ranges_out *out);
+#else
+static inline bool
+acpi_amd_wbrf_supported_consumer(struct device *dev) { return false; }
+static inline bool
+acpi_amd_wbrf_supported_producer(struct device *dev) {return false; }
+static inline int
+acpi_amd_wbrf_remove_exclusion(struct device *dev,
+			       struct wbrf_ranges_in *in) { return -ENODEV; }
+static inline int
+acpi_amd_wbrf_add_exclusion(struct device *dev,
+			    struct wbrf_ranges_in *in) { return -ENODEV; }
+static inline int
+acpi_amd_wbrf_retrieve_exclusions(struct device *dev,
+				  struct wbrf_ranges_out *out) { return -ENODEV; }
+#endif
+
+#endif /* _ACPI_AMD_WBRF_H */
diff --git a/include/linux/wbrf.h b/include/linux/wbrf.h
index 3ca95786cef5..f71ac2343b29 100644
--- a/include/linux/wbrf.h
+++ b/include/linux/wbrf.h
@@ -18,10 +18,12 @@ struct exclusion_range {
 	uint64_t	end;
 };
 
+#if defined(CONFIG_WBRF_GENERIC)
 struct exclusion_range_pool {
 	struct exclusion_range	band_list[MAX_NUM_OF_WBRF_RANGES];
 	uint64_t		ref_counter[MAX_NUM_OF_WBRF_RANGES];
 };
+#endif
 
 struct wbrf_ranges_in {
 	/* valid entry: `start` and `end` filled with non-zero values */
-- 
2.34.1

