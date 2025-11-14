Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0492C5C0CC
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 09:43:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B23410EA11;
	Fri, 14 Nov 2025 08:43:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="OnfyQ/p3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012046.outbound.protection.outlook.com [52.101.43.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B701B10EA0C;
 Fri, 14 Nov 2025 08:43:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N5jsi6yM8c3sfYJbBpjSOuDxH9dnXuSKl3bA/ABbEuFp171Cq+c5EUms1ia9wBgvr4iYRqddH+gRmAUDq+3t1CCJQSaNdWiSl4W7Zb8myJv4gMTxH9sioB0JLes/thoHGHMy4ZybtuDjFOXIFJ1BgfCnEHSZ+XC5OUBZaUl54hgY+Lq7qty3wwrDGnlfEOcDOzHVaO0u3O3pzLYEyNDiFq720zSSjSJOJl49pOXx0HjERXhWLy1DGeDWfZbsgx+VS/ozZ1YJ8F/u5DNQ7a3MOiONyXlOX6gczoVEmPJmt0tkhrLoFDFHpE4wkVGuhavdvGEWwNu6wmikE73ctv1byg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nl8hxzv6eTPkmDzxLaR/zK2/WQrFylPeEHLJVvZecjk=;
 b=OVpnhiUu3MFoLF4kU8dXhLwP8jxBUd2StXUPv6y917g05bd2N9duIjjFBvmKgnvf75AxUR3BfLzRsxbT7l1ieGLi8gk4FBpJc9NGqvPOSzjKKbVn9beEAsRY+ekJr3OQhZW326htbMI8WyNHeu1Qi1q83wCMLkMB80m9ogRuGMQhn4gMsLBMPC5BlUJAYf7tHq9alCfUOOMH2UFD2ElNRxkqhQUOqzLoZxcPk6WX15/8uqiE9MO+Lp//f3WW4/3iI6/rWtwDu5fDZdLmzX71LG0PKbuitxOZ7Pddts9VgzGBGeBPfTAYOzpa+Q6YQ/rGxSD5hv4sMFBJitf/26Ir5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nl8hxzv6eTPkmDzxLaR/zK2/WQrFylPeEHLJVvZecjk=;
 b=OnfyQ/p3ZIOeS85n1duc6H7gOHpI4O4FuX4upEtO0nyxmLxT4ze2MvBXFEhBzi5FA8jPGKA5XynkGIyL37Ybp4kOXWHeFeNYo/0pINIt88ZWb0t+PNwO34NTHfcEuv9bmyH2kE6hL2dhWxy/V9GAWYMeYjZrYzb0Zj0153hg0Pk=
Received: from SN7PR18CA0014.namprd18.prod.outlook.com (2603:10b6:806:f3::26)
 by BY5PR12MB4067.namprd12.prod.outlook.com (2603:10b6:a03:212::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Fri, 14 Nov
 2025 08:43:23 +0000
Received: from SN1PEPF0002BA4D.namprd03.prod.outlook.com
 (2603:10b6:806:f3:cafe::e) by SN7PR18CA0014.outlook.office365.com
 (2603:10b6:806:f3::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.18 via Frontend Transport; Fri,
 14 Nov 2025 08:43:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF0002BA4D.mail.protection.outlook.com (10.167.242.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Fri, 14 Nov 2025 08:43:23 +0000
Received: from [127.0.1.1] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 00:43:19 -0800
From: "Yo-Jung Leo Lin (AMD)" <Leo.Lin@amd.com>
Date: Fri, 14 Nov 2025 16:42:22 +0800
Subject: [PATCH v2 2/5] drm/amdgpu: add helper to read UMA carveout info
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251114-vram-carveout-tuning-for-upstream-v2-2-4f6bdd48030d@amd.com>
References: <20251114-vram-carveout-tuning-for-upstream-v2-0-4f6bdd48030d@amd.com>
In-Reply-To: <20251114-vram-carveout-tuning-for-upstream-v2-0-4f6bdd48030d@amd.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6135; i=Leo.Lin@amd.com;
 h=from:subject:message-id; bh=zGk1bpQEPLKJgbcuDlwTeI2di2NYTjbMv1frtno5poo=;
 b=owEBbQKS/ZANAwAKAV8XsZZKKe6GAcsmYgBpFuueEG4LsAabnweozI4y+G3d8QNhf1SF4QH5o
 QrE9ymnwUmJAjMEAAEKAB0WIQQzqV4kW+yguuqHrw5fF7GWSinuhgUCaRbrngAKCRBfF7GWSinu
 hr3CD/91Pt/m2ivkTJ/ahheEE38XAZSk5T8wkApFrh9xgmTQxZmG/kVcNVBIYD3xpYBoRzLAR0x
 gIiCDf170PNC7s5NRpjsmDjRnP6mAJ8yXuywBaFNvitaS6SzjVt/kqtb/JiJLiiIEEwMZUZ6THx
 klvEUHQkyuo1kf/mVLfx234rXs8xPlIHiO0/adFZq2X2pt7Jo5vHWCAVMqQp+L7hP3CUfj80Foj
 2Gnq25gTnns8r6nrR91HJoaAlSxbqh+uYEiXfWHbMvg0ZUiZpcd5N2ut77VR4j0rQR7HZN3nHu5
 P6yepVeKWEwSyuhsUrPEPnc5aG3r+Xf22cCEW75AIhQGrJ/6mDNZCIbJomjXsExfvZTHxB8dSFC
 1eotCE8MWkQQasZYEVQ5RC9bfVxWRfcK+dmoVZiaeN4YD58UnxBksKbyZ4/HLeefWlJtbRPdxkW
 u74I3NLlm5uOY3Ecrn7cwft2Eh7dM0ZYSOKDQ9R43AQ+mQ2DNQ7GY2VQL46FLG82lscGyWFT8qN
 z3DTFI1OW0LWq9700lVgJ7cAgWXGEUPEOhFU5zSlLjIzhl2encHp19SH7Z2QIn9BzD2NbToaCB4
 0eaSge56HcSBivBDH0NOfxazpVwgX0idUvTgzNgk0gmhVZl5G7UyTHP1a+QOATbuWRpNiB+vv9m
 XIMo4OgGcTRkHIw==
X-Developer-Key: i=Leo.Lin@amd.com; a=openpgp;
 fpr=33A95E245BECA0BAEA87AF0E5F17B1964A29EE86
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4D:EE_|BY5PR12MB4067:EE_
X-MS-Office365-Filtering-Correlation-Id: 05e43b5b-0d6d-460d-6034-08de2359dee2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|82310400026|376014|7416014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TXQzZ0J4YTFCQjUvYTVzMlhySmQrWldTVmZkWFU3dXBhN1B1OVlDQVRFVHJY?=
 =?utf-8?B?QW5DOFp4cUNFQ0hKNk56Nyt1ZUpkNS9yaXFuQlBhQWhibDQ1VGt3WjVVbDBT?=
 =?utf-8?B?c2N2WlNGMFdXd3NodG5Ic0UrQXlVY0RMc2FZTk9YOU5XOTREblZZUEs2R01R?=
 =?utf-8?B?MXV5SDV6SzI2YXh1RThvZXk1aEtrYTNmaW4rZkhGUGx2YXNnblZqYWJoaWg1?=
 =?utf-8?B?TkkzWUhlYVZFcU40TTB6aXVQM0pFdzFnMTRVcHd4S1IvN1dYWTZqNjZKb1M1?=
 =?utf-8?B?VVdvdWlZclZxYlFuNmhRMUkyS3BObmY5citiWnZpeWxhTVdnSlVCWmUyNCsz?=
 =?utf-8?B?REJDbFRZK1BqbVNhandMdkM1V1gwTnF1RUc1SjFyOXZSV2lDYlhicWtXcGxY?=
 =?utf-8?B?V2srOTJlWVA0MUkvVlRxbWlLcXVxRHFBb1BFRXFKeVlVU2dUQktsckhYQ0t5?=
 =?utf-8?B?N2J2R3JZZDFyMW01Uml2SENxY0JKOXhsMDZWbFIzaFcrVzdzOXl4M0l1SkZr?=
 =?utf-8?B?VCtlbm9NRHlTd2Y4SE85cVNJV1l1K05LV2VFWU9aaDltaW50dWhUQSs3ZWd3?=
 =?utf-8?B?aEhHSTNzelFTWm84ZzRTZkplUXlxcmRhTUx0YXJnK1BRRDE0UTVOeTFZZWdD?=
 =?utf-8?B?U21vUkN3RXJ0WGJzdHQvdmlSc3UzS0poZmQxTWJGb01sV0pRdE5zWDZHMkVD?=
 =?utf-8?B?Zkk3OGxaUmV6ZTFYRzdtalFrN2lhcTZsUjBISGJXWi9KanRKOVZJV0hNWWNH?=
 =?utf-8?B?d2xvZEFMUk9jWFhuWStUaFgzeGZPUTZUb1o4dVZnUUNzSVdmMnZ3Tm5LaHVM?=
 =?utf-8?B?ejJ4cFFEc0Ixak4zeFRDa0V2eEczbU9wNktPN3gxaWlZSlRKRzZUWEJvaDlP?=
 =?utf-8?B?VU01QVJjRklMeEdUUmRyeWdacFNZTFM1RmZwQ3pBSGo5YkJicVM3TGtoRVkw?=
 =?utf-8?B?bjJVVDBueTZkL29hUnhpYVJ3K21FSDhqVUxYaWxmanhpdFVSdEJXZXZtUHRx?=
 =?utf-8?B?dFFLaGRPYTZYWDQ4andDNy9vaU1GYmZXZUwwY01iRG9OYWFHTE4zRVlicTZW?=
 =?utf-8?B?YW9WRGV3K3AyVkRMMTh3akNxeGpSQnBKUnVGZ1ZHTEJ3SzRrbXJaekFhdjZl?=
 =?utf-8?B?QXkyRUM1TXdWUVdlaGc0am1iQ3YybVNPQTRDNnUvM3d1ZGcvZlVkeDI2b2Jx?=
 =?utf-8?B?MmE1UWZRSWtXSUtBSG5xbE1ORXNFS2R5MEdiTDZnZVhsRnZURWtDZ01naEwz?=
 =?utf-8?B?MHk5ZmFNb0tpUWh2U2Zod1M4TWtDSDE2VkNhNFllU1Q3OTJhSlVkTFZDTng4?=
 =?utf-8?B?R1RKM0RheVowUkNoT1prdDc0ZVBVQUhDV21iM05VK3E0NDNBWjhIZ29mc21G?=
 =?utf-8?B?S0creGw3T1hsVi8vcHJqVkU1OG1hZmptWm92TUQ2UlBhaW40Q2pVUTgvNkZN?=
 =?utf-8?B?cU5FenRWZjJYYW4yaUlDVTQydTM2M1hoVnQyOTMyZjJCMDU1dWNCVUFPV2xY?=
 =?utf-8?B?bEI2R29ZMXV4YzF4VEN6UnJpZjZxUEFIWFhlWUVwQmFNbGlGZmVRS2lsYkJk?=
 =?utf-8?B?MTU4M1NROFpFZnUvWFdpU1dOSFFGTEk2MFRIU0Y4RkczSGhCQS9WeExTM3VF?=
 =?utf-8?B?bzhORk5sYkVsTkNVV1B0MmhYUVhkNHZteWEvNFpCN2VCbGJNclp5M24vU1h5?=
 =?utf-8?B?VXYxTnE0Zkdua3ZBZEhNMXdBRkxyL2d2YVJEZThEcEk1UEhKWlZYUFRXUWpC?=
 =?utf-8?B?MExPRTBsV000eFVRVlVoUVl6OHZFSE5pSmxVZndINml3aytYekRMRUIvTnFj?=
 =?utf-8?B?UWViR0pDY1N3TEYzdnZ1U3pVajFqU1pyWHdjRDNCUTRQZVhoa3grcHNjdzRH?=
 =?utf-8?B?WXBRUmNvMW1kUzNTalB3a0JZVy9nQXFFcm52SXUxZWdlNDVGT1M3VzhPTC9i?=
 =?utf-8?B?UVJhL1NQMUpiQ3N5T29JR1g0bklsTzFVVEFJYVJycjIyd1AyREpPUFJ4OTRJ?=
 =?utf-8?B?cm5kVktMVFU1YXg4bWYzMzRQc1BPTk9SVGNJR1VxU1EwOVNlcTV4WnU3SHky?=
 =?utf-8?B?ZkttQ1IvKzJtVTdjLzVDN1dUNG9PVEdnVldFRWVZbWZEa3EyaXRLSXNSdDdk?=
 =?utf-8?Q?C71s=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(7416014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 08:43:23.0968 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 05e43b5b-0d6d-460d-6034-08de2359dee2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002BA4D.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4067
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

Currently, the available UMA allocation configs in the integrated system
information table have not been parsed. Add a helper function to retrieve
and store these configs.

Co-developed-by: Mario Limonciello (AMD) <superm1@kernel.org>
Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>
Signed-off-by: Yo-Jung Leo Lin (AMD) <Leo.Lin@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h              | 32 +++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c         |  2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c | 73 ++++++++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.h |  2 +
 4 files changed, 109 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index a5574e84694b..2c1123291577 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -1675,6 +1675,38 @@ struct amdgpu_numa_info {
 	int nid;
 };
 
+#define MAX_UMA_OPTION_NAME	28
+#define MAX_UMA_OPTION_ENTRIES	19
+
+#define AMDGPU_UMA_FLAG_AUTO	BIT(1)
+#define AMDGPU_UMA_FLAG_CUSTOM	BIT(0)
+
+/**
+ * struct amdgpu_uma_carveut_option - single UMA carveout option
+ * @name: Name of the carveout option
+ * @memory_carved: Amount of memory carved
+ * @flags: ATCS flags supported by this option
+ */
+struct amdgpu_uma_carveout_option {
+	char name[MAX_UMA_OPTION_NAME];
+	uint8_t memory_carved;
+	uint8_t flags;
+};
+
+/**
+ * struct amdgpu_uma_carveut_info - table of available UMA carveout options
+ * @num_entries: Number of available options
+ * @uma_option_index: The index of the option currently applied
+ * @update_lock: Lock to serialize changes to the option
+ * @entries: The array of carveout options
+ */
+struct amdgpu_uma_carveout_info {
+	uint8_t num_entries;
+	uint8_t uma_option_index;
+	struct mutex update_lock;
+	struct amdgpu_uma_carveout_option entries[MAX_UMA_OPTION_ENTRIES];
+};
+
 /* ATCS Device/Driver State */
 #define AMDGPU_ATCS_PSC_DEV_STATE_D0		0
 #define AMDGPU_ATCS_PSC_DEV_STATE_D3_HOT	3
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
index 0743fd8620e4..d442dc442d34 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
@@ -38,6 +38,7 @@
 #include "amdgpu_display.h"
 #include "amd_acpi.h"
 #include "atom.h"
+#include "amdgpu_atomfirmware.h"
 
 /* Declare GUID for AMD _DSM method for XCCs */
 static const guid_t amd_xcc_dsm_guid = GUID_INIT(0x8267f5d5, 0xa556, 0x44f2,
@@ -125,6 +126,7 @@ struct amdgpu_atcs {
 	acpi_handle handle;
 
 	struct amdgpu_atcs_functions functions;
+	struct amdgpu_uma_carveout_info uma_info;
 };
 
 static struct amdgpu_acpi_priv {
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c
index 636385c80f64..b1463bb594aa 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c
@@ -296,6 +296,79 @@ static int convert_atom_mem_type_to_vram_type(struct amdgpu_device *adev,
 	return vram_type;
 }
 
+static int amdgpu_atomfirmware_get_uma_carveout_info_v2_3(struct amdgpu_device *adev,
+							  union igp_info *igp_info,
+							  struct amdgpu_uma_carveout_info *uma_info)
+{
+	struct uma_carveout_option *opts;
+	uint8_t nr_uma_options;
+	int i;
+
+	nr_uma_options = igp_info->v23.UMACarveoutIndexMax;
+
+	if (!nr_uma_options)
+		return -ENODEV;
+
+	if (nr_uma_options > MAX_UMA_OPTION_ENTRIES) {
+		drm_dbg(adev_to_drm(adev),
+			"Number of UMA options exceeds max table size. Options will not be parsed");
+		return -EINVAL;
+	}
+
+	uma_info->num_entries = nr_uma_options;
+	uma_info->uma_option_index = igp_info->v23.UMACarveoutIndex;
+
+	opts = igp_info->v23.UMASizeControlOption;
+
+	for (i = 0; i < nr_uma_options; i++) {
+		uma_info->entries[i].memory_carved = opts[i].memoryCarvedGb;
+		uma_info->entries[i].flags = opts[i].uma_carveout_option_flags.all8;
+		strscpy(uma_info->entries[i].name, opts[i].optionName, MAX_UMA_OPTION_NAME);
+	}
+
+	return 0;
+}
+
+int amdgpu_atomfirmware_get_uma_carveout_info(struct amdgpu_device *adev,
+					      struct amdgpu_uma_carveout_info *uma_info)
+{
+	struct amdgpu_mode_info *mode_info = &adev->mode_info;
+	union igp_info *igp_info;
+	u16 data_offset, size;
+	u8 frev, crev;
+	int index;
+
+	if (!(adev->flags & AMD_IS_APU))
+		return -ENODEV;
+
+	index = get_index_into_master_table(atom_master_list_of_data_tables_v2_1,
+					    integratedsysteminfo);
+
+	if (!amdgpu_atom_parse_data_header(mode_info->atom_context,
+					  index, &size,
+					  &frev, &crev, &data_offset)) {
+		return -EINVAL;
+	}
+
+	igp_info = (union igp_info *)
+			(mode_info->atom_context->bios + data_offset);
+
+	switch (frev) {
+	case 2:
+		switch (crev) {
+		case 3:
+			return amdgpu_atomfirmware_get_uma_carveout_info_v2_3(adev, igp_info, uma_info);
+		break;
+		default:
+			break;
+		}
+		break;
+	default:
+		break;
+	}
+	return -ENODEV;
+}
+
 int
 amdgpu_atomfirmware_get_vram_info(struct amdgpu_device *adev,
 				  int *vram_width, int *vram_type,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.h
index 649b5530d8ae..67c8d105729b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.h
@@ -32,6 +32,8 @@ void amdgpu_atomfirmware_scratch_regs_init(struct amdgpu_device *adev);
 int amdgpu_atomfirmware_allocate_fb_scratch(struct amdgpu_device *adev);
 int amdgpu_atomfirmware_get_vram_info(struct amdgpu_device *adev,
 	int *vram_width, int *vram_type, int *vram_vendor);
+int amdgpu_atomfirmware_get_uma_carveout_info(struct amdgpu_device *adev,
+					      struct amdgpu_uma_carveout_info *uma_info);
 int amdgpu_atomfirmware_get_clock_info(struct amdgpu_device *adev);
 int amdgpu_atomfirmware_get_gfx_info(struct amdgpu_device *adev);
 bool amdgpu_atomfirmware_mem_ecc_supported(struct amdgpu_device *adev);

-- 
2.43.0

