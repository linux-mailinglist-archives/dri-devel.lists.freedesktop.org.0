Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57B52C96D02
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 12:09:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A11E510E3A0;
	Mon,  1 Dec 2025 11:09:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="37zZphhP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010063.outbound.protection.outlook.com [52.101.85.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3B2910E39F;
 Mon,  1 Dec 2025 11:09:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ycqt1k5e9ecY1pgndlsGKdWKHTKEM47zwm7FnP1XVdxD+3d+DwW4mTbiwcu0mQTUejP4Evu0PtofIOBYBa34xQBN+bzk641uV6sqqbL2JyqUvlLKzqaUII/xV550l5+GiPRN0MLYEwWORSjqHSw293RpsawvhX8agcqi3pbhObvdGliR+N8qkKFN/ANaNzXcMzvQjbR+D63TOIddYsQ0BrGPCprf6DhH0OWKbVhguB6JeMXaS7lOtCLliMZKigOY+x2PSsUBvJ8QMQ0OOxMCuLMJp5Jziu+VhMbGCRJEIKmxyesCP1KU9UbST6g6vjwPSYbjvtmaIBQiT34Y0q2swA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vqEYGfiR8q0cjq5iWXP1NeuvvNLM9lyiBSKW6MFxoK0=;
 b=yRNjs/3AN2Ugel60HyAfUENynR14NNHqmfb0qKoyFV5qflYpW1xhShxuyAzpIHkTdR6Bw8lyV8lWJfgfzKFEEJQQK2PtRa5nx7kLAsz+1D+WXC4Ef+sdrgyQeuiCVUwBXiOvR5nW1ENgzjEYPNg2EHfAzSH6q7NyXDiGMauPXZRiXakdmGIpK/woDrwDDw9APEXIGFGJWzREPA5UUSUpwjfSR//AeG5vPWJHkAfmL2cIRTRa8hrwCjwnYgNYASfr7bHObl6yPOj7hEGkbPhcstMQqIjEY+dSud9V2khszbzHj5oyVrcMBusygNZW4IkffXyfBpnt+E8fzTVc8pf2UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vqEYGfiR8q0cjq5iWXP1NeuvvNLM9lyiBSKW6MFxoK0=;
 b=37zZphhP4pEh+hiqCZQqgbUS9J+9TqDJsdZNke2Uh0bRadZdc9/1htZ0Vxbhn4XUZCCq3yJLnwZIZZKGzhSbrrnJD6FxMasmXcYC0SjLfXQd5JX5IWhQEoJqRSxCqCaf+yr3N18Oo7aUw9nbxDt2EGLVDqn845/u5/uW1UQZz1w=
Received: from BL1PR13CA0405.namprd13.prod.outlook.com (2603:10b6:208:2c2::20)
 by CH1PPFD8936FA16.namprd12.prod.outlook.com
 (2603:10b6:61f:fc00::624) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 11:09:18 +0000
Received: from MN1PEPF0000F0E0.namprd04.prod.outlook.com
 (2603:10b6:208:2c2:cafe::f3) by BL1PR13CA0405.outlook.office365.com
 (2603:10b6:208:2c2::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.9 via Frontend Transport; Mon, 1
 Dec 2025 11:08:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MN1PEPF0000F0E0.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Mon, 1 Dec 2025 11:09:15 +0000
Received: from [127.0.1.1] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 1 Dec
 2025 05:09:12 -0600
From: "Yo-Jung Leo Lin (AMD)" <Leo.Lin@amd.com>
Date: Mon, 1 Dec 2025 19:08:10 +0800
Subject: [PATCH v4 2/5] drm/amdgpu: add helper to read UMA carveout info
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251201-vram-carveout-tuning-for-upstream-v4-2-9e151363b5ab@amd.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6319; i=Leo.Lin@amd.com;
 h=from:subject:message-id; bh=eA8BpgnmJjtHcwq/axi4BLexWKy79hpik/sofYeVprA=;
 b=owEBbQKS/ZANAwAKAV8XsZZKKe6GAcsmYgBpLXdPXrqOoT/8S3H3eQHs4ZxLwtEQDExIsj2Mt
 4uKWxaNbtWJAjMEAAEKAB0WIQQzqV4kW+yguuqHrw5fF7GWSinuhgUCaS13TwAKCRBfF7GWSinu
 hq/cD/4mNR94YoVSPxkqbIkO5ckxi88C4XziSIqhI3huJ1Qur4q+NXXz6K6xu5JT0bHSXZ1iCF3
 Jcn6DlngCbNjKlICRJkVQQKUQ9nU6m2TdofVPLKhqIeIQdJQGWH3GXimp3n0Q8EoBz1YKBPfoB5
 OiayhknauMaOAocdOxAetctZrvddZkeNPtstHH9DbrJUcr4Dgif9zSJKXFVtHeTOfxPRwjlXviP
 Tk/Ib9un/siH0l/PXOAq1GofFGAD2Q/lxV2PzjFD6iWVtDqEGizOva8xoesntGlhiHh8sgehTEA
 lshAs41Tm8RUBoo9oukCgQtL1fbwD4o8B3b7sZttYnwwruvplXtOU2XO5w2Zu2Yx+QF4pw8j9HB
 t04MufE+g5VmGFhc0CAPwLGZFISCzRje+4FkLwPtzZobNlRtmA1xSiv41meEyFHvtBpzvX6l32I
 Sj/QcDmv61zbdCOAdyo7jx9YoRjdrwVfK2qgW/gL19vsk1el0u46IckFOHsICziGXxb9NI3KsKt
 w5JR7mbMLnDu70U/+ntv+4W7uMLkQJiTdXrNUh6XplM5TPjvKJTJqheBQe8xS1nj2/DwpA+1vlK
 H9GBS6KWNk4IC6OmGJPLg/HMQrpTb0JjXmjmb3ND4N0J8T7WUJx2m2uIEsOJQsJsTBzGp/LBqpH
 QA8SAfGyfymdDbA==
X-Developer-Key: i=Leo.Lin@amd.com; a=openpgp;
 fpr=33A95E245BECA0BAEA87AF0E5F17B1964A29EE86
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E0:EE_|CH1PPFD8936FA16:EE_
X-MS-Office365-Filtering-Correlation-Id: c6a31e6b-8ca8-483f-e265-08de30ca10f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|7416014|376014|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aitjNnpFY0tueWZ3QUlGcXlxUG9INXBaeWJWVmF3ZXFQNlNpMzBpT3ljWkVV?=
 =?utf-8?B?dVdQckxxUXVlN3pFanp6N21PbkhnRTVuaHk4ZC82WDRQd3d1UnVoOXVQMVAx?=
 =?utf-8?B?cVVvb3NWeXRMYlN1TW9LK1BwZWJkZmJaOFc3YkpSUkMrWVI1NzdtYWIwd21C?=
 =?utf-8?B?amdZdjVtY1kydFBEcStDaU5pbGY0OEZneFBzWklYV3B1RTBPeXZ6QnpIWlZL?=
 =?utf-8?B?TDNNaWhGc3YvQmpmMDA1aGF1RUVOQnpTNkNzZTRNOXJzRjVianpOYXpBWXdF?=
 =?utf-8?B?algyUjJmelBFdExYcVVxSXdSb01ZNFhMVVJvei94b0U5TlVrUHZKMHpOMDhw?=
 =?utf-8?B?Z2ZTM2pMTXlwZ29NTkp4NW1lMWRiblZVdXZYcXBaUGo2YjlpZUxpcDkrendY?=
 =?utf-8?B?aFhXYjREZVQxSThHbnM2VXYyV2NtYVRxellPOWZ6VDlJTng0V244bERvWlla?=
 =?utf-8?B?SFF6Y1lzbVNDTUVEaHd5d1R5d292K0UvYm1TYWJZYlMzRjFSSFVyVm83dkhy?=
 =?utf-8?B?cHZaQVIwVEZnOE0vZkRhUllOWXFzVTZXMGk4Mzl0Z1NzOWZTbElRenA2bkpZ?=
 =?utf-8?B?dk92bjNaSjgvWU5kNzBmdHRsYW9ZSkh6ME9rejJRbGdCUzZjd1RvTGFyU3U5?=
 =?utf-8?B?MG1JbmlzWHZtUnQ3RTZuc2tZNzZsL0gwK2xuelU2eUdDYU16YXVRWFpPUjhw?=
 =?utf-8?B?WHlLU3ZrVjBnOE5DZjllazB0TCttTVFOSHdJL252UVMvNkpGUE0vdktMZ2dL?=
 =?utf-8?B?YTdxT2FkYWFmek50SmNidllKdkhKMCtxTHF0dkhXemVLbFZPM1RFVmsxOXJX?=
 =?utf-8?B?bGtQUFF6RGRaRDZ4SVV6bUVlYTRXbFJXN1drZ2tEbDIxbDVvSXQxQlkveDBi?=
 =?utf-8?B?OG1VWjBreEZKNDFOTnAvRXlTeERhQU5nSE1vbXdBR2M3cHZsWEF6bEd1QXgw?=
 =?utf-8?B?RzU0ZVY0ZjRwRlRhL3BURmNJemhzcml3T1pNRk5QTTBpWkd6K2VzWUZTdk5x?=
 =?utf-8?B?TmZpcFdneElUd2N3aHB5Q2RyMXZWbEdReDV1WHFxUGdyWUh6bWI4Ky9ZWlBD?=
 =?utf-8?B?RUFKRGF3U0ZkdVZMbGZqcUFMSklRaVl5VTd3UDNCS28waUhoY0s4RnRZWGZ2?=
 =?utf-8?B?Zk91d01TUks3cUI5MXd4bXR5NzIvMjBRbk1EaUdLVEZ2SGlNbGMrUnIvSGVx?=
 =?utf-8?B?UFNKMzMyMllTN1BHblp0SkhCSlFRTWFRa3hueWw1TDc4WUJOcGhMdmprYy9a?=
 =?utf-8?B?OVNXT2tPQmN4M05iRGZnY1l4dEVpTzdwUmdjVkpoRVVjcVp0eU8vcU5DMDdj?=
 =?utf-8?B?RExNOWdHRUpQZEl5dllNYnpZSHZIWVhkazBNckdRaUF2RVVYZG5BS1VrZmtN?=
 =?utf-8?B?RU5nSjB2a1pkU3hVSVhoeURReEIranJKVC9oTWNaOTRnQ1ZMdmhycDFlNkE1?=
 =?utf-8?B?S2pPSUR6Snh2M0xJUlJXMllseGZrU0dDQlZZY0U3ek5Da2VLSnZ3akZmdWxO?=
 =?utf-8?B?a1NnTHZRaWVkZTVscGtKL0VBTU4rQVhJN2YybCtnNitZVTFmdHZGcWhDV1l5?=
 =?utf-8?B?eGtGenFBcUNZcFJ2cFNETEFGVi9FY1lVaFVYNWdTWGN4SXpGcVE2K0hXWW5V?=
 =?utf-8?B?eGErSmd3UGJkZWk0OFlydk1BSVZ6OFdRRURuZ0orV0FmNUVsb3BQNVZWMGFt?=
 =?utf-8?B?S05PNzkrUHFHVXltQS8wVE5yZGtUeEdDaFlDalk1dEdiWHN4YncvV01lRFV2?=
 =?utf-8?B?aHFTd0pIeHNqNXRhYTlqV0lOazN6KytSbVRldm9UQ3hURGxIVnJUNkhpeXg4?=
 =?utf-8?B?MGM0S0ExQnNRMXA2eSt5RWNCZ2ZmbkFtY0FWeFZsczd4SGl2dkNnR0crREcx?=
 =?utf-8?B?bFRjeVJjVjJkZlZNOERqeENFWUU0Ui8zUHVIVlRnY3lRb3h6WTVhV1M3QWVK?=
 =?utf-8?B?MWNnQUxrL1ZLdFd2b2NSUmIzc2drY3lZM0gyWHhaMnp5NU9JaGczRkVSZ3Qy?=
 =?utf-8?B?RjBxOWNLemd5Y0RoMUk2dWV3TmhaZ2VpMTB5b0laeUY1VEhabWxxRkxySEVt?=
 =?utf-8?B?WHFEL3JLNHkyMVNJc05VWFdSb2RxRXBpdncyRThsZEIxQVlnOGJrN1RKbG9l?=
 =?utf-8?Q?lLI0=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(7416014)(376014)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 11:09:15.9097 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c6a31e6b-8ca8-483f-e265-08de30ca10f9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000F0E0.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPFD8936FA16
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
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Yo-Jung Leo Lin (AMD) <Leo.Lin@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h              | 32 ++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c         |  2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c | 77 ++++++++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.h |  2 +
 4 files changed, 113 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index 9f9774f58ce1..ca9c2b54045b 100644
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
+ * struct amdgpu_uma_carveout_option - single UMA carveout option
+ * @name: Name of the carveout option
+ * @memory_carved_mb: Amount of memory carved in MB
+ * @flags: ATCS flags supported by this option
+ */
+struct amdgpu_uma_carveout_option {
+	char name[MAX_UMA_OPTION_NAME];
+	uint32_t memory_carved_mb;
+	uint8_t flags;
+};
+
+/**
+ * struct amdgpu_uma_carveout_info - table of available UMA carveout options
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
index 610449d73a6c..92070738bd42 100644
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
index 636385c80f64..7f4751e5caaf 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c
@@ -296,6 +296,83 @@ static int convert_atom_mem_type_to_vram_type(struct amdgpu_device *adev,
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
+		if (!opts[i].memoryCarvedGb)
+			uma_info->entries[i].memory_carved_mb = 512;
+		else
+			uma_info->entries[i].memory_carved_mb = (uint32_t)opts[i].memoryCarvedGb << 10;
+
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

