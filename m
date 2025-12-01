Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 216C8C96D0E
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 12:09:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D93F10E3A6;
	Mon,  1 Dec 2025 11:09:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="KUw1h7re";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011065.outbound.protection.outlook.com [52.101.52.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2F2C10E395;
 Mon,  1 Dec 2025 11:09:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FE+oH10MenDYrAvIe+DxIzjgWxCk9wn/H29SMXNJDuTMVurnNssiA4xZ0+vr2rLohH5irwEuT4BAZBMBgVS8LaKZHpdDW8jsPfWYHuVFIMxcopj14oKsqvE4+RdSq8H7NVUMlWi4d2DUkCT8WcguC9yygTD+imCudNXGoZ/lfEPdpiJZ3eOgA/ipV3ZnWI8nHDXTnDw9Kb8qMSS9mp/zOOLJoFROTNSj59qv3aohOSkZB1cLKhvVYcqIN3olZCSZQhCnHpALbqFosljDh3cvnifUrnoDMytpYQTEaLuSHgGSqhkhqmBh1eV8kjaokpVgTxj+09JfIglwkoKa95MjtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gnzi+2yUDaHk5Ism4sAUAI+3eu33R/z7A+T3jCoqvO4=;
 b=qiQVgrnG/BLjBWe25NvXhiVeHTaSgw8H8xCQVIbMdS+ceCaDdBX3pB9foj3MefRDla6nILGrwUsxCZZcoZ1FiQMYK/9DGPAtz9tuJrpaUA7A84CldAlZmN0W83t2v6jUmVfMy7A9Doty53mobPf6viIAWDRctVfIxegkBHQdhWCBbnWhwWeirxikam5jC4GF5mkO9JagBTGCWoxq9B65AwKH4Db+vYTBANomGtRVhuWykx0p/6ORksxWMHejcqpsMGYxg01XUChSZEN8zy60CKY3fBGRLJQgAwcl19BGh59kFMPqN9eeysenqcZfaM2R4Zwd5VfF77z0ZEsXK2ClrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gnzi+2yUDaHk5Ism4sAUAI+3eu33R/z7A+T3jCoqvO4=;
 b=KUw1h7recT3W4zOSV2AojuwIehRaOjOsCGDOE4WBEwRtKpY1H9wTcKkyAePert+hYT7xWK1/Ob703pOVIsdcccjn6sCmgU1wheagZrOocb5Ij/UPdxfF/m7PjkuYktwUbdm8jm/3cCuYdRlvviZbhZlyxjkJrSqgY46yLAd+ocY=
Received: from BL1PR13CA0407.namprd13.prod.outlook.com (2603:10b6:208:2c2::22)
 by SJ5PPFE4FC9FAB3.namprd12.prod.outlook.com
 (2603:10b6:a0f:fc02::9a7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 11:09:23 +0000
Received: from MN1PEPF0000F0E0.namprd04.prod.outlook.com
 (2603:10b6:208:2c2:cafe::92) by BL1PR13CA0407.outlook.office365.com
 (2603:10b6:208:2c2::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.9 via Frontend Transport; Mon, 1
 Dec 2025 11:09:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MN1PEPF0000F0E0.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Mon, 1 Dec 2025 11:09:22 +0000
Received: from [127.0.1.1] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 1 Dec
 2025 05:09:19 -0600
From: "Yo-Jung Leo Lin (AMD)" <Leo.Lin@amd.com>
Date: Mon, 1 Dec 2025 19:08:12 +0800
Subject: [PATCH v4 4/5] drm/amdgpu: add UMA allocation interfaces to sysfs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251201-vram-carveout-tuning-for-upstream-v4-4-9e151363b5ab@amd.com>
References: <20251201-vram-carveout-tuning-for-upstream-v4-0-9e151363b5ab@amd.com>
In-Reply-To: <20251201-vram-carveout-tuning-for-upstream-v4-0-9e151363b5ab@amd.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5546; i=Leo.Lin@amd.com;
 h=from:subject:message-id; bh=FC+gH66/AgvZKbtkiHMAOFZ5+3Ozaef2cS6Y+d3ZgoE=;
 b=owEBbQKS/ZANAwAKAV8XsZZKKe6GAcsmYgBpLXdQvzELfUrc6JHpUMQ/+3bCzWkYgPPmqbdMl
 R0fwpvkbyyJAjMEAAEKAB0WIQQzqV4kW+yguuqHrw5fF7GWSinuhgUCaS13UAAKCRBfF7GWSinu
 htNwD/9AAT+58lNkmxqXWmPoaE6p9HEeBjHJY20QpVa8a88Fls5XEpy2blQSII3O1IP1OnDCA4L
 hhSba5C23/dFjDf7fT9GprA0JVVTODxxuiseH633tzfP3K1yCGUwml/gbP2sa6m9Auqe4aqvn6i
 Z9jO5c1c/AOd1HQLvSBfQ7a2XP00Xha7IoqsR98er4Dm99h/fuT6Tu3b8a4TmUvDsq54OnMPDIU
 CcEFCIvxl7KTorPCx7zmuELzeAsma4StI9TE1bclUUUcxVTJMpadb+RiIg1NxO42MHtiOtospQk
 ybt0WNbmpiBjbw2qq7XGzrkAtSpttTBMhI+ucibsrZbM9ipPNWc66oKlTEBS1nvfVMTpDaqoTcd
 ZoAXGM3DMmHDUB4pRlQ9xVN66Ie20mCxbQZzsKgf8vuKZojaV1QnMpUYos/NEHEuC8QkJLxOX+R
 vxGXWf24P4SO69uTiyrkyVkPvZlvU/IgkN62NhseNh52vS5TICnAAO5RxFbNp1x0qJyHHDA4z50
 qcA7HGf69kkA9am7dGRQRlWxurVLs/iAj+hv1iK/hxdUwAvhxJs/nLGvCkEM6MUasVTNCZKmsnm
 /xo/EP0CluZtYVy4e5JplE4qM2jp67lPNWA+L2M/mc6jWLYOcPuQG5CdAV1QHoD1GqjoXtVHUWq
 Qgkay9pkPl7bH5w==
X-Developer-Key: i=Leo.Lin@amd.com; a=openpgp;
 fpr=33A95E245BECA0BAEA87AF0E5F17B1964A29EE86
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E0:EE_|SJ5PPFE4FC9FAB3:EE_
X-MS-Office365-Filtering-Correlation-Id: 70ab15f1-1e4e-4d98-e62a-08de30ca1532
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|82310400026|36860700013|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?clNPaUFUakhyUHpkd1lCbVExYUNHREc2c3d5MUR6TjVQNlJGdEFxTk5BVDdr?=
 =?utf-8?B?WWFYUEcwYW45ZVpzWWRXaDhCM1Q0NE9UclNSQkVBbXh0OVZYZ29aR2Vpc1U1?=
 =?utf-8?B?dml4bGRWVHNzUlFuMnBTZEpxSmpsM1d0amFUVUpVd3dFMHdkM0d0M1p1elQ4?=
 =?utf-8?B?Q21ZWU5BZUdEa3NuUlU2MmtVZU9kY1BJNTZadmlLczl6UER5TjFWSlJrZzJy?=
 =?utf-8?B?RTI1aTFyNDZBTElpd3B6WHlPYjBodWQyWmRTT0hpdE0vL3Q4QThIU0hVRk5O?=
 =?utf-8?B?dDBGV1ZTUVQwUFFXcU56QnVWY1IwSCtWYk9LNFViR3NJMG5hNzBrakNFVzYr?=
 =?utf-8?B?d3RKL1hJWXhaZjhtaTBDK3JRQ2JNUDNNU2tnUm5rTEplSVplenp4RHJhL1hJ?=
 =?utf-8?B?YW5IZHk0TnJwYldpcm9zaGVFZUVtS0VIamJaWVFveUZiMmlxRHpCVXhVTDZs?=
 =?utf-8?B?R00vSk9wZUtkaVNWMHl2SzRqaVU0QnlxNzhOUm0zWjhYS0tYbG1ldFJkckhv?=
 =?utf-8?B?dzQwZWNJUEYzV1RhTmNudTFMZUNIM0dQWjVMY01KTnNkZVpobzdEOGNDYXpL?=
 =?utf-8?B?cE5PVzJReVVsVVNCRmNFQlRibEZqcStiMTZiVmU3Vy9ucmpIenlPODBxeHlC?=
 =?utf-8?B?S242bXVXeExlWTQxcjNVSkpSS1cvVytLSUtyK2FrTVZhWUZEdmJjZmF0cVYv?=
 =?utf-8?B?UFdTVDFqREpEN3dJbWlFaE5IaURqc00rUVBnWUtJbVlGd21CZkdGelNHd3cx?=
 =?utf-8?B?Q2FkL253dFpyYXk3cFFTYkpqQmhNOUFEVkRvL1grdy9EQnBCeE9iL24zaTFF?=
 =?utf-8?B?Q25HVHBhOGdUN2o5cXRmT3VPQzFJQ20rWEl1b2RqL2Y5NGVLQnVDalVBQmh3?=
 =?utf-8?B?THprYWgvWnM5UGhQQVg0ZmJuOGcwWWYwMXl3RHAwcjJxa0lFOEs4azgyOUkx?=
 =?utf-8?B?d2NZYXU2VkVJQWdmdXRzbFlvOWpTZzhVUHlIcUpQbXZlalJ0eGU1dURmb0ZQ?=
 =?utf-8?B?Sk9EZW1aZWN0RjMyTisrVXBGMTF3N0hMeFIzY3hONDlTaElISUU5M3dmL2Fp?=
 =?utf-8?B?Q1FRZHJURWhRNHlrODZEQWNabTY1S0VRME9NQW55TGlya1pMSVN3TlFoc0JH?=
 =?utf-8?B?OVFlMFRBcmkxL3dNTmhrVWY0ZDEwNFBLRDJSYlV1VGNqQW5YK3RsZG8wUzg3?=
 =?utf-8?B?OVNXakM0Uk41QXRZZmpVTTdwSnhKVDNzOWltMzk3ZUpQVnNqakRTRnpXdlZB?=
 =?utf-8?B?dElzLzZLcElVQzJKakU5aHlzeEliYW5yUjV1WllJdDZjMEc5WEtUMmo3VGYy?=
 =?utf-8?B?ODdKcXB5NHNwcXEwK0JUOE1hR3FWNkJXbDNkS3FWTUxIRzlTSjFQenhBT1lZ?=
 =?utf-8?B?Qm92TXRnR1hlc25jdVJEWnlEL0owaC9Ha3VLYTlnNURTeW4xL2x5U1loYis2?=
 =?utf-8?B?dXFzV24rUHJWNFRYOUNpc1VXb2F4ZUJ2S0l2UXg2Tm9tV3JTbzRiWGdQREN1?=
 =?utf-8?B?eXowZE5ZQVFnbEhmcHIveU1kQjlORVJ6VElwaFZnZnplaTFnQ2Zpa3diYUdz?=
 =?utf-8?B?aWtNbXgyQS9HVGdZc1NkMWhiTXFTWlh1V05PTXdIVFVKMFpJVmRQTTIzZmQw?=
 =?utf-8?B?amd5Tk1lS1NvZ2VzMjRtSUZmTG91RCtMYk5oWWp4RVdzaDU4WFU5WmlFOWMr?=
 =?utf-8?B?TmNTUjF5RVVwTm9LZHdwMzBSWFpPeFZESXpFMk1QMkg1eHhmaVBVVUkxY0NX?=
 =?utf-8?B?VDNPMS82aEw3QnN3Y1pZM1BjVGlWMVZSU1NCZUQxUnEvUlN4YmRScXlocERv?=
 =?utf-8?B?MERNdXBoR0x3ZWxsQXQ4OHR4Qk8vM29mS0pYQ01MNXp6TU1ScG1lUmdCbldB?=
 =?utf-8?B?L0FhZGorcXpCZXZHL2FLY0tOaHl0UWtSSnJMbDIvRFdnbk9KbWhLZlFxZmlu?=
 =?utf-8?B?c0ZvejM3aEVjaEUrazlKOXJQeVB1ZmJ0OUkzMTIrODlqaXZESitHVTdqS3Z4?=
 =?utf-8?B?aUhBRWlabUFFZE94aDRtQWFwTnIrVlNpRGxLTVR4UmQzSGpDYVJadStqR2ZL?=
 =?utf-8?B?dlFsTlB1T1poamEzWVE4R1lOSXVEK0Nwc0dKZTdPNlhOK2dzQTZkOU1ZSC83?=
 =?utf-8?Q?TAk0=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(7416014)(82310400026)(36860700013)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 11:09:22.9943 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 70ab15f1-1e4e-4d98-e62a-08de30ca1532
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000F0E0.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFE4FC9FAB3
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
 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c | 139 +++++++++++++++++++++++++++++++
 1 file changed, 139 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
index bce9027fa241..2c0405cdc436 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
@@ -30,6 +30,8 @@
 #include <linux/power_supply.h>
 #include <linux/pm_runtime.h>
 #include <linux/suspend.h>
+#include <linux/device.h>
+#include <linux/nospec.h>
 #include <acpi/video.h>
 #include <acpi/actbl.h>
 
@@ -1246,6 +1248,136 @@ int amdgpu_acpi_get_mem_info(struct amdgpu_device *adev, int xcc_id,
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
+	val = array_index_nospec(val, uma_info->num_entries);
+	opt = &uma_info->entries[val];
+
+	if (!(opt->flags & AMDGPU_UMA_FLAG_AUTO) &&
+	    !(opt->flags & AMDGPU_UMA_FLAG_CUSTOM)) {
+		drm_err_once(ddev, "Option %lu not supported due to lack of Custom/Auto flag", val);
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
@@ -1290,6 +1422,12 @@ static int amdgpu_acpi_event(struct notifier_block *nb,
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
@@ -1342,6 +1480,7 @@ void amdgpu_acpi_get_backlight_caps(struct amdgpu_dm_backlight_caps *caps)
 void amdgpu_acpi_fini(struct amdgpu_device *adev)
 {
 	unregister_acpi_notifier(&adev->acpi_nb);
+	amdgpu_acpi_uma_option_fini();
 }
 
 /**

-- 
2.43.0

