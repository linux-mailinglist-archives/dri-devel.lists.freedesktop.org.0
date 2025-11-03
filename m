Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AA37C2A6AD
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 08:54:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3156610E388;
	Mon,  3 Nov 2025 07:54:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="UmNxRA1a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012058.outbound.protection.outlook.com [52.101.48.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C573810E37D;
 Mon,  3 Nov 2025 07:54:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PFM1VbRODWIdVm1ESkkYR1PNuhDQ5czjp2IayqMY9xMGUmlkw9CAXnMmA3g7pGWqyOrS+YD0DIzSPfCjywuKwd4jH5w11ODgzW1IGgIi+zl8w3lolhcCR9rRnAc6hJ60eLCq1TQLQYZDhJvBhGBXrnYbfn4PJQQfRnez0jnGr2huPH1si0lX6i/e/nYoDsHyng/o48U93K2hJL3dmi9aCUHo0xP30iYIwHTdAYO5/oq1CdFcfZB9ZAKME1L4t5yierRvcin12PIiwxtPaUPbDfIRv7m5zS1AkAX/ICgD+ohBPmCFikJI7//k3pP7LtG78GGIBNreyKaOjkvizJXeow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LXyYpuw8cBO5muVBNfqJuVf1CNtSTEIAi6slY7Ga+Jw=;
 b=fzB+H73Zgs4Pd6F7/t/XZ9Y9Alchc99r+XXzxMS3O8s+7h5CThg9EBJBCRJie35yqhFFkAgLry/QTULI+jcqGFB+WHnlWLrjPtdldgtRttKbw1EuJe9stdpVRZhyCYiiBMpIP1wAPXFaHRz8hQn/iokqEAZ9pYl49oKJoZnj6lCWV55AdyW5xTFp13Oa29brPZnD5CX6OJDQpIe6eI1mIgL7XblnANq5oh0f3hUevF7ebpDQ9jHdva+FOkAF9qpKABBS4Ah6CDr5nZqcXdK1NRZ0toAH1QETRH3zi7PnH1wAH/lPYP/zOiAnjhtlPSdRSU2GEjAqK+gEsTZYey6a1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LXyYpuw8cBO5muVBNfqJuVf1CNtSTEIAi6slY7Ga+Jw=;
 b=UmNxRA1a0w8iq8Xi2O3ymT2rN9WoMaTKkMbpsnz/4KREILZVzN6OFS1/Yqihs4LTHOIp06yOLPC8REkk11/6+X1Zi2fumBVszX3inmmFe2JyYXasc/6R3Ea4NlpSRVJmFfCBvNZH6MPcZx6LeGGFtLJY8Lvx+kSGo01Ed1Q36wA=
Received: from DM6PR05CA0058.namprd05.prod.outlook.com (2603:10b6:5:335::27)
 by CH2PR12MB4151.namprd12.prod.outlook.com (2603:10b6:610:78::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Mon, 3 Nov
 2025 07:54:12 +0000
Received: from DS1PEPF00017095.namprd03.prod.outlook.com
 (2603:10b6:5:335:cafe::b1) by DM6PR05CA0058.outlook.office365.com
 (2603:10b6:5:335::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.7 via Frontend Transport; Mon, 3
 Nov 2025 07:54:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS1PEPF00017095.mail.protection.outlook.com (10.167.17.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Mon, 3 Nov 2025 07:54:11 +0000
Received: from [127.0.1.1] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Sun, 2 Nov
 2025 23:54:07 -0800
From: "Yo-Jung Leo Lin (AMD)" <Leo.Lin@amd.com>
Date: Mon, 3 Nov 2025 15:51:07 +0800
Subject: [PATCH 4/5] drm/amdgpu: add UMA allocation interfaces to sysfs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251103-vram-carveout-tuning-for-upstream-v1-4-17e2a72639c5@amd.com>
References: <20251103-vram-carveout-tuning-for-upstream-v1-0-17e2a72639c5@amd.com>
In-Reply-To: <20251103-vram-carveout-tuning-for-upstream-v1-0-17e2a72639c5@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, =?utf-8?q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonathan Corbet <corbet@lwn.net>
CC: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>, "Yo-Jung Leo Lin
 (AMD)" <Leo.Lin@amd.com>, <anson.tsao@amd.com>, <superm1@kernel.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4028; i=Leo.Lin@amd.com;
 h=from:subject:message-id; bh=cWbQqAA84R/PVWQYvCaxkQX0B9E5rVNIoVrq6iLZ/LM=;
 b=owEBbQKS/ZANAwAKAV8XsZZKKe6GAcsmYgBpCF8MfLLld8POhBntc1KtHjPmk4yUxz27FMsSS
 L3aRzB6DGmJAjMEAAEKAB0WIQQzqV4kW+yguuqHrw5fF7GWSinuhgUCaQhfDAAKCRBfF7GWSinu
 hoBZD/9X3PEmP0N3SoNQJTq+uDrRpvQAT4Xj5l8KHvw9B7k1AQBsUYteYNsKy6yk1MA3QOPjmdx
 YxWt5sHsrbbGtEI13cIWMu4Fh2uo1OcvREh/AEI+Zt/koPx1SbyBnvV8U0V9CIBfEuRhb1I8anI
 Y8E/4srvEtVZ+fqZa027D//rUvcr6B0euU0vYPn0lr9B8/CIVWmNy0+4P6sZiD4CZELm2OWpRh3
 PCrrlh215nzfiYT7uuZcUaiUnRE8bgrPJvoUcysNhEac1TMA+jdLLtbUuNNcWSyFhMGi974CUp1
 2Hngvaza6fDHU+WauzRNKioIZNJOpCBmxx6zaAhkvovyfNp9oL4euhREn3SPbedROFxs8vGlGKj
 1BhuSTP3jenDYHGNJIxxAvbJcytETYRY+xjBk3Ew29JUWre0jfnKVj3NNt0Xmn3UFZ8CZAA0V81
 hTP5VKKoEaaVevpybNadJja0Ku7zCm2+0mGLXJK4jW6nLQDPAoZFH63PoNYdFwLzxpgizaecG3q
 35CGsZU8eff7z5LXFl4mwZCG77V/o1LSJS5XF2lBeSuQuMp3lRhJXYZo2mp6XvFBjP73fx9oJwR
 YquGzYukxxcKDO5NYmXVT8G+5b97KEuhE+PTvGyufs5YwLhZYlVdFjnPsU3Uermd4RVXdBdHnFj
 EbYjj4bFeamJ73Q==
X-Developer-Key: i=Leo.Lin@amd.com; a=openpgp;
 fpr=33A95E245BECA0BAEA87AF0E5F17B1964A29EE86
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017095:EE_|CH2PR12MB4151:EE_
X-MS-Office365-Filtering-Correlation-Id: 27194eb8-a2eb-449e-da54-08de1aae2d26
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|7416014|376014|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WVBCSXdJS1J0ekZHTVVMT1cvbk5ab0RhYXU0UndVQWdGampZOXdpdjNYb3hQ?=
 =?utf-8?B?eTU3cE1BTDA3YktDTGFVblNmWjhjaFRQYm0wVjNJVHRQSkpjbktQT2gvM3pl?=
 =?utf-8?B?K2ROTCtSbjhaeXpqN1pIT2x4RjBiL1FCRVJjRVlUODRDMVZvWTd2dFJzRTNt?=
 =?utf-8?B?NHlEZzJWaU1rYTFidkowMGJ2VVl3S1RaUnVlWXFuODVEdU1pYUlHcTNBSlFp?=
 =?utf-8?B?bWhHSmREUnBLazFKSGRnNUhYaFNkMWNSVmN1d2tIbEprdVdwUUlnbWhLNHli?=
 =?utf-8?B?UDFwYTdyWTkvYTdzbTE2U2xDcTVSM1VrVS9jT3drM3Jzd2grMXlWbmtZNzNy?=
 =?utf-8?B?b2Y5QWVDMFR4dlJ0WWNsNE5DclN1R0QwVGZyRVhGWGJiNDlQREd3c2xGeEhk?=
 =?utf-8?B?R0c1K1lLTXh0Wm9tVWFBdkdOeWY0ZkErSllXTEdKcllBdkcva0YwenFKaldG?=
 =?utf-8?B?anFVRzR6VVlvcUlqYnpnRTlMZDJxaUlBY1Q2Sk9rZDVSMVRSYkluOVh4Y3VT?=
 =?utf-8?B?YzQ3NVZqT2ovT3ExWm1vcmlyWXlPZ0QyaXVEOEUwL3dxSENiOFZMZmxkVUF3?=
 =?utf-8?B?UE9PT2dMUVhwN2hzUzlGbWplVjVWTDlJcm1jZ003bEtRdzNSZFpMQkFPT1pn?=
 =?utf-8?B?ZVVwRXV3a2ZTQ2VMODdGMFY5U2krL21mc1pVakdpaVRaOGlKSy9VQmdXa2hS?=
 =?utf-8?B?TlJueWhFUmVDaE9Ddy9IUXIrMTFNbm5SeGU3WGtaZThpUEZjN2h5VEovRnJJ?=
 =?utf-8?B?QW9mWC9neUltUU0yNzVaTjRuNjVoMUZIKzl3K2xGOHk2Rk5jQkJkSXc4c3dQ?=
 =?utf-8?B?TzNvYm5qVGNtLzI1WnhmLzlVdHpucmUvanNwVDZLV3l5dGlOa0NwN05oUy9E?=
 =?utf-8?B?VjhQZURkOGFocURucTZhYnpTVTRNSVM5QTZxVmwvekZOUnppVnJuQzQzeW56?=
 =?utf-8?B?ci9qTU9HSVJ1SnBrYVAxSllISk5FZ3oxaFd4RU0zTWF5clFmRHdCUVVBTUhh?=
 =?utf-8?B?amlJYThIU1l4SE1ZcjB1ZjFRSDhzeWFZV3hKOC9TU3hiYlA1d0JzeGlyM01N?=
 =?utf-8?B?bHlMMjFZZGZOR3NrQzQ4NGk3MytkaGZzUzdsN2ZieUpwR29yOUh2SG5TTk5F?=
 =?utf-8?B?cGkxZUQ5TSt6cG1sNnlKc2NFbUZoSEI3Y3B6eVNBaEVDLzR0cGNhQitQZDlm?=
 =?utf-8?B?QXE0OW8velRxYURoZDlyOGZiNnVFVHVTdENjVm5VcjlXcHlsS1l3OVpwWmhq?=
 =?utf-8?B?MFRjVmp5VHE0NU1uUk01YURPY3lGK0t4aW1uaE9oZFV4eitjc1V1M29QaXFB?=
 =?utf-8?B?VS9qM1FJOVlHbWdVZDU0Q3V3d1Z6bWFiRm9tMDNxR3ROMGVtTFp2RkFpem41?=
 =?utf-8?B?QW0vVVVWZ0h0KzNldDVZc3pjZkR1d3EzMjMwWCtjWEdlbEpMSThxNEtmUTFk?=
 =?utf-8?B?dk44S1VOZ1h4RXdLTjg0cldBakZPQk5TUk1ndzVQR2N6ejF2SUxZc0NrTjBR?=
 =?utf-8?B?ak1VMkZ5UlE3WTI2WFBhWHZBYitJYjFBVEgvYjBlcGUyVjQ5SlM4b2ZMQ0Za?=
 =?utf-8?B?ZVJWNUpGaDFHM3pZWlU4Uk90TkJYU3BQdjAxQmwyYnpkM0xvUnE0dTVTNU5T?=
 =?utf-8?B?c0JDb1BvSGZBeUxRcUVWalNOWVlhMVgvTmdpWTFUUXNrNk8ySGtPb1lNVXJL?=
 =?utf-8?B?dmtwZUNzRnFjT0ZWUzJMREc1K2hoc0NDZGFQNGVITm0yeUZMZGNqemFMT2po?=
 =?utf-8?B?NlJ2OGV6SGJVUlpHSnBxR2xhVStlTEpncFhFLzZXQzhpZmZtdkMzVWF0OUFL?=
 =?utf-8?B?N2hveitTeldnNnlRbzkwUmtnR1Z2K3pLUGxpWEJYZitMTU51WnBCd1U2aUVC?=
 =?utf-8?B?QzZsVjRZbFlkQXA5NG44dENKNTRxR1doa3ZXamVpNHRjV21aSUdDb3U5VUFk?=
 =?utf-8?B?WG0xYzgreFZKNmxDWmhrbU53MWU5dG9sekxNcmNhZU5ObjZINWZxbG1CTmNq?=
 =?utf-8?B?Sy9aektpcThLMkZ6M3pGcTV0aUF1eWZWem1BRmo1aTJiMnVJVERYbUgrRWla?=
 =?utf-8?B?QUVVYjR3N1FsamlWNTUzTDgySE5JVFR4UTZWbUdad0NCUUdOd1lENnQ1VnJC?=
 =?utf-8?Q?P4C0=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(7416014)(376014)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 07:54:11.6549 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 27194eb8-a2eb-449e-da54-08de1aae2d26
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF00017095.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4151
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

Add two sysfs files as interfaces to inspect or change UMA carveout
size. These files are:

- uma_carveout_options: a read-only file listing all the available
  UMA allocation options and their index.

- uma_carveout: a file that is both readable and writable. On read,
  it shows the index of the current setting. Writing a valid index
  into this file allows users to change the UMA carveout size to that
  option on the next boot.

Co-developed-by: Mario Limonciello (AMD) <superm1@kernel.org>
Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>
Signed-off-by: Yo-Jung Leo Lin (AMD) <Leo.Lin@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c | 95 +++++++++++++++++++++++++++-
 1 file changed, 93 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c
index 58cc3bc9d42d..1ebfd925b761 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c
@@ -1855,11 +1855,102 @@ const struct attribute_group amdgpu_vbios_version_attr_group = {
 	.is_visible = amdgpu_vbios_version_attrs_is_visible,
 };
 
+static ssize_t uma_carveout_show(struct device *dev,
+				 struct device_attribute *attr,
+				 char *buf)
+{
+	struct drm_device *ddev = dev_get_drvdata(dev);
+	struct amdgpu_device *adev = drm_to_adev(ddev);
+	struct atom_context *ctx = adev->mode_info.atom_context;
+
+	return sysfs_emit(buf, "%u\n", ctx->uma_carveout_index);
+}
+static ssize_t uma_carveout_store(struct device *dev,
+				  struct device_attribute *attr,
+				  const char *buf, size_t count)
+{
+	struct drm_device *ddev = dev_get_drvdata(dev);
+	struct amdgpu_device *adev = drm_to_adev(ddev);
+	struct atom_context *ctx = adev->mode_info.atom_context;
+	struct uma_carveout_option *opt;
+	unsigned long val;
+	uint8_t flags;
+	int r;
+
+	r = kstrtoul(buf, 10, &val);
+	if (r)
+		return r;
+
+	if (val >= ctx->uma_carveout_nr)
+		return -EINVAL;
+
+	opt = &ctx->uma_carveout_options[val];
+
+	if (!opt->uma_carveout_option_flags.flags.Auto &&
+	    !opt->uma_carveout_option_flags.flags.Custom) {
+		drm_err_once(ddev, "Option %ul not supported due to lack of Custom/Auto flag", r);
+		return -EINVAL;
+	}
+
+	flags = opt->uma_carveout_option_flags.all8;
+	flags &= ~((uint8_t)opt->uma_carveout_option_flags.flags.Custom);
+
+	r = amdgpu_acpi_set_uma_allocation_size(adev, val, flags);
+	if (r)
+		return r;
+	ctx->uma_carveout_index = val;
+
+	return count;
+}
+static DEVICE_ATTR_RW(uma_carveout);
+
+static ssize_t uma_carveout_options_show(struct device *dev,
+					 struct device_attribute *attr,
+					 char *buf)
+{
+	struct drm_device *ddev = dev_get_drvdata(dev);
+	struct amdgpu_device *adev = drm_to_adev(ddev);
+	struct atom_context *ctx = adev->mode_info.atom_context;
+	ssize_t size = 0;
+
+	for (int i = 0; i < ctx->uma_carveout_nr; i++) {
+		size += sysfs_emit_at(buf, size, "%d: %s (%u GB)\n",
+				      i,
+				      ctx->uma_carveout_options[i].optionName,
+				      ctx->uma_carveout_options[i].memoryCarvedGb);
+	}
+
+	return size;
+}
+static DEVICE_ATTR_RO(uma_carveout_options);
+
+static struct attribute *amdgpu_uma_attrs[] = {
+	&dev_attr_uma_carveout.attr,
+	&dev_attr_uma_carveout_options.attr,
+	NULL
+};
+
+const struct attribute_group amdgpu_uma_attr_group = {
+	.attrs = amdgpu_uma_attrs
+};
+
 int amdgpu_atombios_sysfs_init(struct amdgpu_device *adev)
 {
-	if (adev->mode_info.atom_context)
-		return devm_device_add_group(adev->dev,
+	int r;
+
+	if (adev->mode_info.atom_context) {
+		r = devm_device_add_group(adev->dev,
 					     &amdgpu_vbios_version_attr_group);
+		if (r)
+			return r;
+	}
+	if (adev->mode_info.atom_context->uma_carveout_options &&
+	    adev->mode_info.atom_context->uma_carveout_nr) {
+		r = devm_device_add_group(adev->dev,
+					   &amdgpu_uma_attr_group);
+		if (r)
+			return r;
+	}
 
 	return 0;
 }

-- 
2.43.0

