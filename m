Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4949C88D67
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 10:05:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4173910E54E;
	Wed, 26 Nov 2025 09:05:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="GgVnI9fY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012005.outbound.protection.outlook.com [40.107.209.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFEAC10E55C;
 Wed, 26 Nov 2025 09:05:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wgHIcC6kHH+KOG+mixHs6XyCA+Y0NN80qkdePA19Gx55SaXdxe/Fx7EfF5CJSh8kONGgRffO6pbGr9rym9DtIRjjNmttUAm7/MLy7qzSAqF17YMgf061Y6g2ostRJ2jP9+Rntdq455czPbg5wWWnHK+S/Gs8CBSTFrOY230lDdCgDDi1l3C6995Fb+P5tSI8cjzbtae4jmer8LXX7JuzyXNZefnfyJ71wodCQp3dvzaahIBM3kPuDmyf34NudDkpOvAC2X0wmpQJiX3zx6ENwkQ3ZMZEuqTefVCyNsNhJ2kbxEITDX47jbxG4M2u82NH+r/Dsq/oH6wRUYuwl0TKxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YU6rJjO2RgIFT0OcRfaQxnJdIdlZcR8ORwiMve7dvDI=;
 b=U1AZMlRKiqznY3bHZw6qTKfljq2GEW91fI0yWEoT3Qd/RHnwpfrDffRcnJvtHKIcy5DsNjs0eIlerr6AQHYvslG/yapaMsI5M2S7LRfjorYtdFTYgcIXRYAuD55TkUltNDKWPlK4XfA2nzQbNY63eUk3OF+CXqbjXLost7e9qptxQXQfBSAtpBnMwVaffo9Q4SfqD4j0o08HAMA6j8YXbrWCKCUO7cbq1/t60t7FpXYS+c2M3H+qoRsbD6ZrRfeGm/SIRwB/63lNWf/PPPw1VzDi5PPeELUJ+Xe/Wj+UH/yse2+cS6P7gAjaHRVf5J+1nLq/VAYQ9wCuxid6CO59yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YU6rJjO2RgIFT0OcRfaQxnJdIdlZcR8ORwiMve7dvDI=;
 b=GgVnI9fY5Rh0hoUa9Hx2P25jUFnDwKpgA8PyxBiwpaP573NoWhAgcOnyMQUwFyI0P0TeEHmey26X5J6ZBFRoyqGh8M4LKCtHkxxjcj2tB9e6TQ0gFST+tbFT7VqhgA2i+VC/5dVHLUaq0czWDmANsZnrYSwltRdkeLUVUU3LUiM=
Received: from CH0PR13CA0060.namprd13.prod.outlook.com (2603:10b6:610:b2::35)
 by SA3PR12MB7858.namprd12.prod.outlook.com (2603:10b6:806:306::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Wed, 26 Nov
 2025 09:05:37 +0000
Received: from DS3PEPF000099D6.namprd04.prod.outlook.com
 (2603:10b6:610:b2:cafe::d4) by CH0PR13CA0060.outlook.office365.com
 (2603:10b6:610:b2::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.11 via Frontend Transport; Wed,
 26 Nov 2025 09:05:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS3PEPF000099D6.mail.protection.outlook.com (10.167.17.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.7 via Frontend Transport; Wed, 26 Nov 2025 09:05:37 +0000
Received: from [127.0.1.1] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 26 Nov
 2025 03:05:33 -0600
From: "Yo-Jung Leo Lin (AMD)" <Leo.Lin@amd.com>
Date: Wed, 26 Nov 2025 17:05:13 +0800
Subject: [PATCH v3 2/5] drm/amdgpu: add helper to read UMA carveout info
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251126-vram-carveout-tuning-for-upstream-v3-2-cf1729c4cb3c@amd.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6317; i=Leo.Lin@amd.com;
 h=from:subject:message-id; bh=/KRghPRPXo0gSPRtjWFnJpxq8BfUF08hsSfyp7YcPCQ=;
 b=owEBbQKS/ZANAwAKAV8XsZZKKe6GAcsmYgBpJsLVvKWrRjRR6oW6krR30U6fmx1J2/jf8Jq7p
 RwD32p1KtyJAjMEAAEKAB0WIQQzqV4kW+yguuqHrw5fF7GWSinuhgUCaSbC1QAKCRBfF7GWSinu
 hrQ0D/9HBXa6+pldW5m5biXwWgqLNZ8p/aAB4H/PQITZ2sM9lf6ZvTq73kwcEBcLg6W9JxlsRUe
 Gy9AxaHDtIrQCi3wkTOHDhfI9BZ2mfOHG3F662B6gyBe3w3sb38ruAlvip7gpxiG84dWJqtliUJ
 hZ5jN7WFGm5/xv+asOupBs/oHFnIRqgu2lC/0PNkjZPoRdr/e5sF+t7D/XC8WNb9vGHzZ6EsJPD
 EzePIYOkQ2pW7v0RdBh+765mbZKJz4vh8/n1TBEUlFhFZRl+UVqSBT1TWa1ALWzPEfGtUdN1dGK
 A+ZHaHRuCTm6XXA2EQ03qz9iZn17D62qXSJV2ZYG8chCvjL5JsuwFH2BiNJk2XH3jssfIS7o4Ya
 aDjxWqebkd3gTFUatD2pTfrL/0J1puFgThqQ5/6vI+oCp93YWjpMnZJO/ZUdU2ICZA/6BfDQhn0
 iFFpRyc47fH1CFdqctGdh3fydIShKpc+BaRyhXB1pTu87gxR51hWNZ0OPW54DSWF11cCW51uNOb
 DAk8N4lNa6pDYHoR8VgIdJ+QkNmQhWx2UbixcSESVYSZIWaRTEfwlIOeYPF+LdsIURci1K+eFCG
 DH44B1Git5fJwZDZwXH0tzOt4fy/D7MXmLxfNDp9uF4E+JwSRw/igS7coc0Xuaa0yVzvzRfd/Jw
 7LFGPOxPLcYFFHA==
X-Developer-Key: i=Leo.Lin@amd.com; a=openpgp;
 fpr=33A95E245BECA0BAEA87AF0E5F17B1964A29EE86
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D6:EE_|SA3PR12MB7858:EE_
X-MS-Office365-Filtering-Correlation-Id: a5d30c8a-2977-4986-0659-08de2ccaf757
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|82310400026|7416014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U29sdEQ1SmRnVDFhak5oR3prT1AzeTZudjJaTHlFcTZvZ2NGN1I2K0ZzSURH?=
 =?utf-8?B?UFBoem9NNDJ0Tkc4MWhxSUt0TGpyend3NjdqR2Q0TVhnTktkL1A5L2xsUmxx?=
 =?utf-8?B?eVNqTXdPYlN2SENUREJoT1ZUU2tkQjFlMmFITWJBNFp0cUtHRGdpRU9iczRF?=
 =?utf-8?B?a1RZZnZZQVF5RjVGVDVWejJ5UWFTZFN2K0NUZFZqY0lMVlVmNW56ZlNFNHU1?=
 =?utf-8?B?cS94TTZ2WEZYYzB3Rmp3M3JUczhmTUl3Q2h0dGtneEJQRVhvcFZXM1JHQUI0?=
 =?utf-8?B?bHRCdVcvdXpRUkl6Mm15MGR2eCtBSWllU2N0K0RmL2Y2WDNGUm54VThqQkU1?=
 =?utf-8?B?ZU9oSDZuV3AweEpidTRmZFZXUUZmUjVBUHZZSXQ1NnRKcjArSjQyMVVGQjJM?=
 =?utf-8?B?TUt6TjIzWWhTMElrM2h0OUpnQnVoV0cvZmRGOWtoMWtMN284QmRUOGc0WGRO?=
 =?utf-8?B?eXM3V1V3YnlZQnFPdkhTdHFIbk1jdkd0bUJwY2Fkemh2REN5dHdEU0YzVnJr?=
 =?utf-8?B?THhxN2FCL1k3U3Z5UnQvc1JVL0g3Nlh0eW5xb1k3dWtpWkZKMGpZQXYzaUxY?=
 =?utf-8?B?b0FMU3RyRkJIbUN4aHF0bjFLb3JwclZaU0JzblUwR3hjaHFuSGFqUmVzU2ZX?=
 =?utf-8?B?b1F2TUV2T1dqay9MUHFsZ0VKV0JYQVQxTEhUemU5OG5ZKzVXMDhYLzNRcmEr?=
 =?utf-8?B?SnBHUmlJODduTWhnbzVBYk9VUi9qL3hpcVN3LzBYb0dXWHZOUnRrM3J6aEdZ?=
 =?utf-8?B?NXpyM2gvREowaEFyYlJ5QjQzWGVYSFNudE1SSDhKTjhFUFZOYkRFZmNWY0lU?=
 =?utf-8?B?RnVuOVQrVktJL2YrQmc1bTRheXhBQmRtNUw3ZUtpNU40VFZ0K0NScnN3bXJz?=
 =?utf-8?B?U3hHNURXbldUQzdCaE8zZUU3OW45QSttSGY5blNsWG1BaEtFSUhZWkphNWJy?=
 =?utf-8?B?YldFWms4VGoydUJHUFNUcFphd3pJd2ZnZ0I0NG1TK3E0d1dGaVdtMFkxaU50?=
 =?utf-8?B?MUpkWlIrdXpKN21rQjZOTHkwQXBKQW9kZ2VCRkNydEtwM3pXbTlkcllxRDhS?=
 =?utf-8?B?ZkREcU1STCs1NUtxc3IyUUVLTXJvMjcvM25CQTRSY0lyTm1ldUtMUkhBZHl1?=
 =?utf-8?B?Vm8rWWhxOWpPRmtGZ20wd0I0by9kZzE5L05QQ2RSVHBDcVFXYWpYck9zRmhs?=
 =?utf-8?B?dStYVWtMclk0OUVndm9Za0FDbnMzSXlkeTJKaTQxVHEvT3dKVjZKZnJjdi9N?=
 =?utf-8?B?K3FTSGxYSHh3QzR0S1p6UlpzR0dWZ0cxWlN0VEdxNnUvd21kOTBGQVhzUTFI?=
 =?utf-8?B?YytmRm5GMkR6eFA4QXBlOGQyajVKNW81ZnRRM1JyQnA2S3ZUV3ZacTNYdlZh?=
 =?utf-8?B?aXkzaEhSRldmRU90T2dMSnIvMG1YU29iNnBnMXdWWDUvaHg3Q2xFYXdyYlZV?=
 =?utf-8?B?RDc5am5peVA0OXRRZVJqNzFiY0djQVMvdEwxcG90NEQvQUVDNjFWSktJQ0E3?=
 =?utf-8?B?cnpsNVExVEtXQjZmNVJrZ1FKeUx4eWdIQU41dUxtNm9aRjIxZnl0V0Vod0dl?=
 =?utf-8?B?U3FhWnI3QlFuME5sejdzSE9UUDFPQnJTNlNnOEp6WXNmNytGcDg0YWZDQXdm?=
 =?utf-8?B?eWN1cWc1T0lWS1dFRFpmbzB4NHlpdzc1OHVTTldxMlBaY0JVdE9LeWNJSk54?=
 =?utf-8?B?NTRwdHYvWFNkc2FWaEQ0R3R0Ky9zWmRQWFNJSDlzdlZla05teVhsaWNCRG1l?=
 =?utf-8?B?R016OW5DTld2Uy9kZDgyVWlXRGNPTjlPVjF6eWsyK0N6MjhQaGVEdXFkbENK?=
 =?utf-8?B?QklUaHNkSFR0SGJxQVk0SUIxaHFRRUhkcmhqUjlGTGZULy9iR1U1MmJMMDBM?=
 =?utf-8?B?TjFLSmxVQk43QmpNZVN6bllTam15Ykh0aTdQVzVOdkVsTnBWZlJEa1p0VkZs?=
 =?utf-8?B?cEFwVmdETFlvckFNR21lZG9pWFpiVy9TTWs4TStmaDhnQVlZU3pKWmFLZHpj?=
 =?utf-8?B?U09rQnJOTGJ3OGR6UUhab1huMS9kRWY5cTRaM3E5WHVBbzM4YW8wUTdOZUFT?=
 =?utf-8?B?VVptSFE0MVRIbURZR1Vnb0d4MUZHTTlJZVBiazBZcmNVQTdUOXpobm9QS0Zz?=
 =?utf-8?Q?xZt4=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(82310400026)(7416014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 09:05:37.7057 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a5d30c8a-2977-4986-0659-08de2ccaf757
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099D6.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7858
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
index 9f9774f58ce1..6873c020b923 100644
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

