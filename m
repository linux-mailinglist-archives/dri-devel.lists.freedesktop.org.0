Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7A15C88D6D
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 10:05:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D7B510E563;
	Wed, 26 Nov 2025 09:05:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="f9lS7hTz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010009.outbound.protection.outlook.com [52.101.61.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAECD10E563;
 Wed, 26 Nov 2025 09:05:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XNAk7gWF8tCcVQwhai2PIv8wWLK+QvHPpL/NiOvinfW13BogEkn7OmJhI9esbZjKKjj6PrnEezgzUqtenw7jYyDbjfiB06tc9OV84ppUupVVFI4kG1gW2y5B97p9abXsPtdlk0+YHVlXA3MuRVj0ebvNj5tcIRziGgdKVzKNtewMZqB22ovzm5Tv3O4mQZxjQIZ9k5ome7zQ3s45/ouusNP7nSlL8DjzS3r8EhXqYfNVDej6rgkgQvlLlrxgLxJRWKNkv5svFgmT6Jqx7DUNct0rQ1VUBqn9xLSh0ZJJU8VUdEvc/7PGrGZ4JQE+XiodsPKbyTS+tU0/AN3u34srjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qsy65f6XG5aplnFArmQkGUyK5BX1bklxHcQcAyt7RLM=;
 b=NPSsYowarv63QymNJ48Szo23ceTJ98T4ovG0wxc8QCVYH6Rzr2ByOygNhjLMwwe+GP6ZCFsnqGiQI/RsfHy6nvbNAQ/hFcxWHq+KioOAcWAHqy9BlwgM1+mUwopBxaVn7eIl6s9M3HSvXDsAIMkBgQj21tY9rRTU3JO7NvEUoFDUheaC4ocb1dHCNJzbEH8Ls78DRIbdMTeIxx8ZY1Z+A25TWXFVw3uFGy4a40yIc7KY0YpdlXn31k2GLk2NAHadyyfn8CZF/qViJzSvopjg/V80OXxzkfsaSeZ17CaTXGewSSbhr7IiEUjVLGetgNA6qk7RLo2uW0THhEZUgIU4pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qsy65f6XG5aplnFArmQkGUyK5BX1bklxHcQcAyt7RLM=;
 b=f9lS7hTzTVYYdmTYHgdd0dixXBCPPPWTx+huACTuqjw2LIydC6eM3M/f04u4swRUlv9CEr3eAsc/Y7JJ+cUZw6AycW/75mhz9c//0T6IZe3btLOpdOz16DhK2NQRIVT2HszfTcUB5BnmBDjSwzH1I/9DF2PcxGPns+JtLvrx8e0=
Received: from CH0P221CA0002.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:11c::10)
 by SJ2PR12MB8847.namprd12.prod.outlook.com (2603:10b6:a03:546::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.11; Wed, 26 Nov
 2025 09:05:45 +0000
Received: from DS3PEPF000099D3.namprd04.prod.outlook.com
 (2603:10b6:610:11c:cafe::9a) by CH0P221CA0002.outlook.office365.com
 (2603:10b6:610:11c::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.13 via Frontend Transport; Wed,
 26 Nov 2025 09:05:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS3PEPF000099D3.mail.protection.outlook.com (10.167.17.4) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.7 via Frontend Transport; Wed, 26 Nov 2025 09:05:45 +0000
Received: from [127.0.1.1] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 26 Nov
 2025 03:05:40 -0600
From: "Yo-Jung Leo Lin (AMD)" <Leo.Lin@amd.com>
Date: Wed, 26 Nov 2025 17:05:15 +0800
Subject: [PATCH v3 4/5] drm/amdgpu: add UMA allocation interfaces to sysfs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251126-vram-carveout-tuning-for-upstream-v3-4-cf1729c4cb3c@amd.com>
References: <20251126-vram-carveout-tuning-for-upstream-v3-0-cf1729c4cb3c@amd.com>
In-Reply-To: <20251126-vram-carveout-tuning-for-upstream-v3-0-cf1729c4cb3c@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, =?utf-8?q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonathan Corbet <corbet@lwn.net>
CC: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>, "Tsao, Anson"
 <anson.tsao@amd.com>, "Mario Limonciello (AMD) (kernel.org)"
 <superm1@kernel.org>, "Yo-Jung Leo Lin (AMD)" <Leo.Lin@amd.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5459; i=Leo.Lin@amd.com;
 h=from:subject:message-id; bh=IHnUrlO8fTpPDACouSC6i1w3QPi+W6JiV+gxx+NrrUA=;
 b=owEBbQKS/ZANAwAKAV8XsZZKKe6GAcsmYgBpJsLWs2Bzk5qfw341uX2w8g3xZEI2+FxQQfVB1
 vww7AxugkaJAjMEAAEKAB0WIQQzqV4kW+yguuqHrw5fF7GWSinuhgUCaSbC1gAKCRBfF7GWSinu
 hlt4D/sHWqm7NozmziIgsNGVstIQKSpdeqiZYil44QFPV6XORfr0BS34zDtJWbvQm7UmMc4k8c3
 DrB0SbtvWXt6Cr75ChhSjNqyGc/Ynr/FQ2YAnyWvXoKO2yez37UI5GNtqUtoIRYjJdwcnFNq5x+
 IEJrFwTffDNUMZUHRaP/k1CRLlX3tlM1HsErnZJL5iDier7cZ17TR2T1aWcIycFwlB3Mm1bxqf4
 9h915MLlEMm8yVcCRJNgHhSDAWgGrsEyJv22rr5eB4xo7FavtFRLWX0WYgqj3O91btA6NkSVuPq
 yWifGszvYXHme8XscwRhwEHZXHkohd3XDyjbnhZtJZtWQGFyjHRhxk/Hy+twIEVRtl8bXlNJRaM
 0NWCx7KkVxZORUWAPV3VBa9BgCKnx5Xlx4gkSS3j7n1+V/JMSkGTWtIeaXB1nQFxLfzD68hxb55
 8GhAETVC6ZKmqxxY9Q0AMjBoVCv8JJBvh9TWMWHX/B+fA+KsEu1NYTQb8389ubh8aZ5M7E4DpzN
 Up7A0HMl6hjVjglqRek6LRBk1RXYAy2pcJqBnvPM3jtz8KrrB2j8DN+S0nA+qI+1Vqtd6LZkxL0
 IFEwJr8Uzfp6Zzc23+5D55+00gCurgHAECzMOySfluPbLUcCg9JnamDGlVSl1xVg6gD1hYmvkdC
 LPxAE+XSvOHep9Q==
X-Developer-Key: i=Leo.Lin@amd.com; a=openpgp;
 fpr=33A95E245BECA0BAEA87AF0E5F17B1964A29EE86
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D3:EE_|SJ2PR12MB8847:EE_
X-MS-Office365-Filtering-Correlation-Id: 28476c2c-3a89-4f95-f226-08de2ccafbaf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|376014|7416014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c1dKV20wSXJHeXV3K0RkNkx4VmcwRVFVb2RyWGtOV1B0T2xodE8vUTB0L2l1?=
 =?utf-8?B?dEgwRW9QcGkyb05mazJGUWFJajg3ZGp1czE3dFJkMWRML0ZEK3NJdlhYQmRy?=
 =?utf-8?B?SmV6VVlDeVZTQmxoQUNzV0tTRFNZM3M2TmMwcytscm0xVm1OSXhNNFZTUzNY?=
 =?utf-8?B?eXE2OEwzUDRMZ3RZb3BYaXBOY090NVNBaVdNSXNYdWUvWnhVWUZEdXgvUXp6?=
 =?utf-8?B?Z0pZRFdLcjBRU3h6SlRreFVydFRPLzMrTCtzTEtVb2xyZzdudWdVcnlTTStr?=
 =?utf-8?B?L2I1TmdudU5va1l2dFovMGRaR3YyU0wrT2VJOTF0cDh3MUFmUFE1TWljTHo5?=
 =?utf-8?B?c1dQWHZOYzZkZk1jSzFwSzZtd3ArR3lKQ3g4bEpWQ1UrYXh5blcrVGQycjA1?=
 =?utf-8?B?TDVIN2tTblNWQk1xcUpvdmNhOUJVaVdoL1lWOTQwNzRGMG5scXpjaUVBQWNh?=
 =?utf-8?B?Sm1vazQxQmp1aEZsVXk1RlJvSGpRQmZzQnZVeDZrb1ppRFpsUGRiVzVNTUFx?=
 =?utf-8?B?c2trK1FIOWtUcU5SVE83N1QwZnB0R3AybDhmSWNMR2xOdUFpNUZaUGdyOW1j?=
 =?utf-8?B?RXQ0ekxJa0ROS0ZFNTR4Q2UwZExrNU5PbTFSSlFGbzhpcUdzS1drWlV5bzNx?=
 =?utf-8?B?QkdaZDdqWitCOXE4MHNyZXhVMGZUK2NERkRzQXZLWnA0V2JoUDlSYWIxS0U3?=
 =?utf-8?B?NFRueGJ0RFZxSmtCcVdmUCtNY1ZRUFRpNFd1cFI0bWJEUHVtb2RMVE5FekRr?=
 =?utf-8?B?WnR1WjFxRjg3ZmxUOS8wbmV0S3MxNzVKdFZBSFZYN3lLS1QyR1M4U1A5UEF5?=
 =?utf-8?B?U3RLaEZGN0xkSldkMktBdEpDakpnOVlKZllzSVc5MngyUU5Eb3dCYVRxaVJq?=
 =?utf-8?B?bm0rY09QUW1PbzRTZVVxQlNTTlJGVXI0ZkNMNVJOSmtOMkhUQWFxd3IyTDgr?=
 =?utf-8?B?Q2txc292VllRTS9BZlExajJvZnF3RXltK1ZlaXl0dldPZ1hrNHROTi84ck95?=
 =?utf-8?B?NktYWFFqL0Z1UUU2YTVYN1VwUlYvNGMvUHpaT0NPbXJkdjA0N2JjUTFReUZs?=
 =?utf-8?B?WkdYeXNybzQwNUtpV2NOdEttRnhHaUM4Y2IrOEV1ZEF5VzBvRUtzRjNUUEND?=
 =?utf-8?B?NCsxTUJDT09temZzT2xXbGNrNzNuRHZYOFlmcElqczZqV3liRTE5YmtLNTUr?=
 =?utf-8?B?MEZqYXM0Mkx4ODJpUWwwVWlXVmxrQ0VqcUdMK3l5SEpQVDhKR1pkREhYaVNk?=
 =?utf-8?B?NnRiU0tjRVh1NDF2ZzFLU1ptbzhCQ016MjFWbkx5VXBNaWRhUGNpeWsyT0hX?=
 =?utf-8?B?K1YrZjVTWUxqd1dYOENPdHRjdlBWaEdhbVJpUkhtOUZTMVVhcy9JQ1NHZzVp?=
 =?utf-8?B?eUc0RHRPK2ZjZ05FZWdINk5vSGN1M205YVVuZkk4YS9YajhCOFpxc0NpWEhw?=
 =?utf-8?B?ZktCRUQ5Y3lKdWJNWll0R2dUMEl1M0FNQTJxbmpUUS9GZlp5NXpOOGVRTzVH?=
 =?utf-8?B?QWpHYkpobGFGeUUyN1BuRFhxazBpRER3Nm5mUWFoK1ZnaG5mZ0cxNlV3cTRa?=
 =?utf-8?B?U3BzTWpDZDlZSW5PcERFZDdZT3YrRXRyYnoyUWpvaHU1a21FUGwzVmZMSTM1?=
 =?utf-8?B?NEU5Rm56bzZRVG9HY1RRL3JKZ0dzekxNME9mcFBwMHUrL05ZNkVzdktIam1q?=
 =?utf-8?B?SHAwNXcvRlVubUNmNDJQN2M5d2pJZm9XSFRTdVZwZWN3Yk5vaU1uSHdhUWtI?=
 =?utf-8?B?eTNxeTRqZllKak02YndXQVZWVk83b3Nocmcya043dWhVc3FucUNiRHlkclJV?=
 =?utf-8?B?NUlta3NlVUNuM2doQVl5N3luN3B2QWJ5ckpFTzhjRk55VUJnbjNPWW02UlMx?=
 =?utf-8?B?U1RsOC92NWNmaE1tV09TWTNRMEVtb3FKdTFYL3ErS2dBWGVISy9sYk0yT28r?=
 =?utf-8?B?SzNyVldhVUtFWkJPSkkxejNyNzlZS1JjZkk3YUkwVG5NV2dpTWMrR2ppREJt?=
 =?utf-8?B?cHpQNEsrLzR2Z21OVWhHdXhEMmllWDJsT3dOVnFkWFNhYUt4eXlHZ1BHekUv?=
 =?utf-8?B?a1lvSWJLd2kwYkIxd0hQUU1TUzNFRzBGbWwxVEFTTSswV2h6TERNTkg1WmFL?=
 =?utf-8?Q?7eIw=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(376014)(7416014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 09:05:45.0067 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 28476c2c-3a89-4f95-f226-08de2ccafbaf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099D3.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8847
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a uma/ directory containing two sysfs files as interfaces to
inspect or change UMA carveout size. These files are:

- uma/carveout_options: a read-only file listing all the available
  UMA allocation options and their index.

- uma/carveout: a file that is both readable and writable. On read,
  it shows the index of the current setting. Writing a valid index
  into this file allows users to change the UMA carveout size to that
  option on the next boot.

Co-developed-by: Mario Limonciello (AMD) <superm1@kernel.org>
Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>
Signed-off-by: Yo-Jung Leo Lin (AMD) <Leo.Lin@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c | 137 +++++++++++++++++++++++++++++++
 1 file changed, 137 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
index bce9027fa241..c3b7b8c91919 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
@@ -30,6 +30,7 @@
 #include <linux/power_supply.h>
 #include <linux/pm_runtime.h>
 #include <linux/suspend.h>
+#include <linux/device.h>
 #include <acpi/video.h>
 #include <acpi/actbl.h>
 
@@ -1246,6 +1247,135 @@ int amdgpu_acpi_get_mem_info(struct amdgpu_device *adev, int xcc_id,
 	return -ENOENT;
 }
 
+static ssize_t carveout_options_show(struct device *dev,
+				     struct device_attribute *attr,
+				     char *buf)
+{
+	struct amdgpu_uma_carveout_info *uma_info = &amdgpu_acpi_priv.atcs.uma_info;
+	uint32_t memory_carved;
+	ssize_t size = 0;
+
+	if (!uma_info || !uma_info->num_entries)
+		return -ENODEV;
+
+	for (int i = 0; i < uma_info->num_entries; i++) {
+		memory_carved = uma_info->entries[i].memory_carved_mb;
+		if (memory_carved >= SZ_1G/SZ_1M) {
+			size += sysfs_emit_at(buf, size, "%d: %s (%u GB)\n",
+					      i,
+					      uma_info->entries[i].name,
+					      memory_carved >> 10);
+		} else {
+			size += sysfs_emit_at(buf, size, "%d: %s (%u MB)\n",
+					      i,
+					      uma_info->entries[i].name,
+					      memory_carved);
+		}
+	}
+
+	return size;
+}
+static DEVICE_ATTR_RO(carveout_options);
+
+static ssize_t carveout_show(struct device *dev,
+			     struct device_attribute *attr,
+			     char *buf)
+{
+	return sysfs_emit(buf, "%u\n", amdgpu_acpi_priv.atcs.uma_info.uma_option_index);
+}
+
+static ssize_t carveout_store(struct device *dev,
+			      struct device_attribute *attr,
+			      const char *buf, size_t count)
+{
+	struct amdgpu_uma_carveout_info *uma_info = &amdgpu_acpi_priv.atcs.uma_info;
+	struct drm_device *ddev = dev_get_drvdata(dev);
+	struct amdgpu_device *adev = drm_to_adev(ddev);
+	struct amdgpu_uma_carveout_option *opt;
+	unsigned long val;
+	uint8_t flags;
+	int r;
+
+	r = kstrtoul(buf, 10, &val);
+	if (r)
+		return r;
+
+	if (val >= uma_info->num_entries)
+		return -EINVAL;
+
+	opt = &uma_info->entries[val];
+
+	if (!(opt->flags & AMDGPU_UMA_FLAG_AUTO) &&
+	    !(opt->flags & AMDGPU_UMA_FLAG_CUSTOM)) {
+		drm_err_once(ddev, "Option %ul not supported due to lack of Custom/Auto flag", r);
+		return -EINVAL;
+	}
+
+	flags = opt->flags;
+	flags &= ~((flags & AMDGPU_UMA_FLAG_AUTO) >> 1);
+
+	guard(mutex)(&uma_info->update_lock);
+
+	r = amdgpu_acpi_set_uma_allocation_size(adev, val, flags);
+	if (r)
+		return r;
+
+	uma_info->uma_option_index = val;
+
+	return count;
+}
+static DEVICE_ATTR_RW(carveout);
+
+static struct attribute *amdgpu_uma_attrs[] = {
+	&dev_attr_carveout.attr,
+	&dev_attr_carveout_options.attr,
+	NULL
+};
+
+const struct attribute_group amdgpu_uma_attr_group = {
+	.name = "uma",
+	.attrs = amdgpu_uma_attrs
+};
+
+static int amdgpu_acpi_uma_option_init(struct amdgpu_device *adev)
+{
+	struct amdgpu_atcs *atcs = &amdgpu_acpi_priv.atcs;
+	int rc;
+
+	if (!atcs->functions.set_uma_allocation_size)
+		return -ENODEV;
+
+	rc = amdgpu_atomfirmware_get_uma_carveout_info(adev, &atcs->uma_info);
+	if (rc) {
+		drm_dbg(adev_to_drm(adev),
+			"Failed to parse UMA carveout info from VBIOS: %d\n", rc);
+		goto out_info;
+	}
+
+	mutex_init(&atcs->uma_info.update_lock);
+
+	rc = devm_device_add_group(adev->dev, &amdgpu_uma_attr_group);
+	if (rc) {
+		drm_dbg(adev_to_drm(adev), "Failed to add UMA carveout sysfs interfaces %d\n", rc);
+		goto out_attr;
+	}
+
+	return 0;
+
+out_attr:
+	mutex_destroy(&atcs->uma_info.update_lock);
+out_info:
+	return rc;
+}
+
+static void amdgpu_acpi_uma_option_fini(void)
+{
+	struct amdgpu_uma_carveout_info *uma_info = &amdgpu_acpi_priv.atcs.uma_info;
+
+	mutex_destroy(&uma_info->update_lock);
+	uma_info->num_entries = 0;
+}
+
 /**
  * amdgpu_acpi_event - handle notify events
  *
@@ -1290,6 +1420,12 @@ static int amdgpu_acpi_event(struct notifier_block *nb,
 int amdgpu_acpi_init(struct amdgpu_device *adev)
 {
 	struct amdgpu_atif *atif = &amdgpu_acpi_priv.atif;
+	int rc;
+
+	rc = amdgpu_acpi_uma_option_init(adev);
+
+	if (rc)
+		drm_dbg(adev_to_drm(adev), "Not creating uma carveout interfaces: %d", rc);
 
 	if (atif->notifications.brightness_change) {
 		if (adev->dc_enabled) {
@@ -1342,6 +1478,7 @@ void amdgpu_acpi_get_backlight_caps(struct amdgpu_dm_backlight_caps *caps)
 void amdgpu_acpi_fini(struct amdgpu_device *adev)
 {
 	unregister_acpi_notifier(&adev->acpi_nb);
+	amdgpu_acpi_uma_option_fini();
 }
 
 /**

-- 
2.43.0

