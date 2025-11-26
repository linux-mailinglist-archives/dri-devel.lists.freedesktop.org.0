Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E75FBC88D70
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 10:05:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5A8E10E568;
	Wed, 26 Nov 2025 09:05:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="SvBaJB70";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012020.outbound.protection.outlook.com [52.101.53.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20B2110E54E;
 Wed, 26 Nov 2025 09:05:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GwszVpN1MCur5vvKSXEVDKebg0fwXCOII01cAzzjZHrplfIuzjRY3OqSbx2ugtTmxgRIBcwnKXgtuntSTRGZ+PL3Aikr+teKdm3NuCsAsfKeagS5ajsvyj94XVpURYK5O1UbKzb1wbw5eMnmT7t8dwkGkW31uero46z4OYi2yaDl3FhsXsB7eCCYIOWF23kJrjChkicXwvUbzeerrv6fmX8p1iv0EcoK774rnpbDPHbwBXmOpg7/iJtxGjcG7vF1CjB6xkfyYlAUcqhks6dK4bYwM3athGHP7kG2lmcGOtka4PmX/5uNqQpGkAd3RoF+Gif423Y5d3FJ1l0vXeB5RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pYtFJZCA5t5THqbXyGxJ5dfcR8e4HcChKym9syxE6aY=;
 b=ojK1gKCkBZI/G9Yc2yafzCgnHynUaIC/TQzMKgoOO7MWU7/7Qnd90XgBZ8sLAzMnFnUaL/ellg9R7mHqR0as1YN6VC3SSuueqEGVaUqe8XvZ76W1HuFBvFfu1gEwevt/iYgur3fo7CTKgHa37p0YEFJNhyLZanLD35cCLXTm3qGwzuPg5fKdjR/gFyiUHKgFshI0zh4bHeRqWsISUW09WS2NsvW3qXDs7tMkqN5Zpn2kOczhq+xfa8zMntWSkCB6q4dMhQ2Denj2SuHdutP3zXKn1repm9TQHdA+EqGu8IziLW4/0BWhTsTeFJj6RnEGj6Nv/Qc3Z+70oCCooPuXKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pYtFJZCA5t5THqbXyGxJ5dfcR8e4HcChKym9syxE6aY=;
 b=SvBaJB70vMruvEmIrwV3nPzahKBooNFMXEFO1SmNQOQvEphcTylDz62q2ga4lpL5qYSu6EO/tUQfA8IaXs2U9HtVe1T5lSlRUXZr2v/MPYxlLdQzNY+1ym7CZSPdVJ5VHT0nsoSb7MGQ9tJdv9ldDHUxlYVgM2LV8itpAMITZ7M=
Received: from CH0PR03CA0222.namprd03.prod.outlook.com (2603:10b6:610:e7::17)
 by DS0PR12MB9039.namprd12.prod.outlook.com (2603:10b6:8:de::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.11; Wed, 26 Nov
 2025 09:05:42 +0000
Received: from DS3PEPF000099D6.namprd04.prod.outlook.com
 (2603:10b6:610:e7:cafe::79) by CH0PR03CA0222.outlook.office365.com
 (2603:10b6:610:e7::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.12 via Frontend Transport; Wed,
 26 Nov 2025 09:05:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS3PEPF000099D6.mail.protection.outlook.com (10.167.17.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.7 via Frontend Transport; Wed, 26 Nov 2025 09:05:41 +0000
Received: from [127.0.1.1] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 26 Nov
 2025 03:05:37 -0600
From: "Yo-Jung Leo Lin (AMD)" <Leo.Lin@amd.com>
Date: Wed, 26 Nov 2025 17:05:14 +0800
Subject: [PATCH v3 3/5] drm/amdgpu: add UMA allocation setting helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251126-vram-carveout-tuning-for-upstream-v3-3-cf1729c4cb3c@amd.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6465; i=Leo.Lin@amd.com;
 h=from:subject:message-id; bh=V8u52wZ6Mp0FNPHYdv6t7FNbsPfj8ysfx3nTyxWGhcQ=;
 b=owEBbQKS/ZANAwAKAV8XsZZKKe6GAcsmYgBpJsLVwQ7X28lYhQzNXuAEYXlzvlwmWbCSX58SS
 1HL6K4LzMiJAjMEAAEKAB0WIQQzqV4kW+yguuqHrw5fF7GWSinuhgUCaSbC1QAKCRBfF7GWSinu
 hjUXD/9e62bA68Rv7+fk4J2mEG5SFxgKDr+vQFhbpVVuil7yeChlfRkkVnnJhRWLXjz5enCE0zW
 PRxlSpRe2sjCwRqxFfvs4DYUj7ksD637HtEG791AL9jS+ZhxETOV3UyNA/1B7i9yMuyvGiS19V9
 nj6kSSxDUQRmEWksmIDFbug9VE5//xHdhCu+DDohICIEQjhKCC/+mIV86Suj41GFgIebaJSXyI4
 St3+kgJPPJ8cNmjnGvpOAL3Mc9X4sywMEhVyG4+jlgDQPfxgn9+6NwyFRpk3v8nwi8vyOG2jOuZ
 mnhWsbaPbzYftRYIV8fFVTPtarr+U+o2pzselAkxEumdAe/pJuEuuu1p0dx1WeUOe4UnpElL6Hn
 GTkSak8/8wSR2Kc6/Co+VbtX3SmT4AMr+DwvIjlbc69qvoAKaZxoHoGQggIK/rgxvFeldbottwf
 FR8MES5QPC/0MKw1ACDrqmhu8WyKKp0SGqgh7QKYGhR7pLGdDWpM7FmrO86QQ3nWYSXzv/WMr8T
 kLfSsI1u5XPC52yR/6hZqa04rCimpyaIXE66chdUD1t8lgcEe3+fu4xuUbB3OoEJEe2ltbDxfDT
 lhNPifKrcNq/FjDhZftoTwYRlWhqGp7yq31UraD9bWTq/0lzVE6xS7XzOa0S8uz50QDhi7obiIV
 xOZSMf4euwmBE+Q==
X-Developer-Key: i=Leo.Lin@amd.com; a=openpgp;
 fpr=33A95E245BECA0BAEA87AF0E5F17B1964A29EE86
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D6:EE_|DS0PR12MB9039:EE_
X-MS-Office365-Filtering-Correlation-Id: 27355ba0-18d8-468e-2bd7-08de2ccaf9b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|1800799024|376014|7416014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aXVIS2JwaXZWNWtaMUdHSjhvbXpUY01ZYmtwZkVZSjlLRnB6eUpUcHp0aElv?=
 =?utf-8?B?MUdpV0k0TUpWcmFTSTl4UnhodFNMN2Q2TWdjWlMyLysxUkhuZGxnNVplTWdr?=
 =?utf-8?B?SzY3Y3NSd1kvL3RZK3ltVnl4K3pGQ2IvUHRKNXdTRjF1WTRwNEs5UXA1WkxG?=
 =?utf-8?B?QjNUdWZUOE1NOU1YL1c0UExxNzA5NncvS05jQUFHVHlkZVZIb3dKVFpGTUhR?=
 =?utf-8?B?KzBjbktIM2lvTjRIT0xYb2trQ1Q2ZWNLdGNoaUpJWlFoaldpVmxrT3dCSkNq?=
 =?utf-8?B?dkZiVnQwejJQK2FKTCt2VnZHT0hjUGtYTnhVU2U3c21mejRWZG1UYkczbEhJ?=
 =?utf-8?B?YWRoS2JGc3JRanFMVFc1VTB4RHE5MlkrdFZrSnBkWGxKNXJRUzhFZUFGbktZ?=
 =?utf-8?B?MEdjb25CdSs5UHkvVDVPS0xwcXRJUGw2bVkvck9mbUNUSC94bmE3ejlwNUlL?=
 =?utf-8?B?c0x5dEExWGd1d2pqTm02ZUdiaTMvbzduaTNVR1h4TENuS2tsSjZ4STB3MDdX?=
 =?utf-8?B?MC9jRVpKZlkydDd1bFFWL1JCazRwYWRZWFRLNXJJSkJLV1FtNXZVOVQ3YW13?=
 =?utf-8?B?RGxSQkl3cmlheGZudW56ektRUStMVkpWZVdpVFBLZWJKVUptTk14Kzg3NjNT?=
 =?utf-8?B?OWNPRDVuR0xqRWpGZGNBTFZ6dDI5Zko4ODd3OTE1SjlmdTF1T3ZvSEQzbFBJ?=
 =?utf-8?B?c2pvUWprQ0VaUjlXTjlzU0Y4UGdPS2x0QTl5MzZldHMvR3d5MDU0aFhUeUx6?=
 =?utf-8?B?K21HdCt4QTBuR21OZmJnSHE4b3o2OXdNZ2E4M1duVXZLdDdwVDBHTTY2SmRx?=
 =?utf-8?B?QkQ3emNPQ2F2SFVBSlZCdWE4TnVlOTB1RGVtbGNsbmtoWm0xT2NBSU1xMWhk?=
 =?utf-8?B?eWdublBpTU1QckhZaDZEMzIyKzV0QkFjZ0ZSbVhkalU3UUdCdmtGdmNYdXhs?=
 =?utf-8?B?eEx5Qy9FanMya0xyY1dZR3VoczBySkwxVVNXMlZaR01LL1RnMnNVYlp6cUZo?=
 =?utf-8?B?bENHd21YTmhtKytEdS9vWkw2cThCQlFscWRNVVM3Qm81ajdRTXR2M2FJQjVq?=
 =?utf-8?B?bEU2ZC8vZHBod0tuWGNOL3l6Y20vNko3Q3VRQlI4RkFkd1ZjZDNOVUVmVTJs?=
 =?utf-8?B?TWFCRGtZZ01zcGNYdU1NRlNzcmpwTHlEUnZJYTFnS0ZrSmZpSkdjN1JIOWpG?=
 =?utf-8?B?TDBQMUFVSk1GbG9hb25CZDJUU00weHVmVkRycksxaklid3c1WHREcnlkcDdX?=
 =?utf-8?B?UFUxRUYxNEJuMjVJMG02NUM3RUdXVDFGNFVFa0V4MlZrWkxtR0hrZGcrY0pU?=
 =?utf-8?B?MGp2UXF6MllBTEtCcWErcEhUWjRYZTNHRXJjS3BGd2YyaWdHUjlXeTRuWDUy?=
 =?utf-8?B?S1F1MmxaRmxCS0FEa3c1QVZpWlJXWHJKckY2RnNTdzdNSmdZNm15QmtSc2g3?=
 =?utf-8?B?MHJuZEllZ1hHejVlTGFCUmVZMXVHYjFNMkJ5Y3d1M2QydFRxTDJQbHUwWlBS?=
 =?utf-8?B?L0wrOHQ4dTkwaXdHWXZFblhsNVBMV1p6WDRJc0o3NnJ5QVNaMDhjOHpWU05o?=
 =?utf-8?B?NXJjZHZMNFFFcTlia0tjMno4akoySno2ZnY2bVpLMmd4S0NoQ0RTdC9TZDVZ?=
 =?utf-8?B?R1M0YWR2emlmSks4eDdiOTQxTDh0VVhJbkozam85ZXozemJBSGtUYkI2ZHMv?=
 =?utf-8?B?akFhTWFQQ2FtakV5dVVKdFp4MTZjbW95Nzk5K1E5bUV1YzU3UGt1bHBVYmFL?=
 =?utf-8?B?aUlJOS9sWWJOLzBhb00rTEx4MkZFa00yWWN2cEtwWkJabUpNR2tvZCtYUGJZ?=
 =?utf-8?B?NlR3RlFNRmNtYWFRcGVJZEZjZy9IaHJGTGVqS0tsWThpNDhuMDhmeDdCVXVV?=
 =?utf-8?B?clZJQ1ZUMGYyZjFUQktSMkkzNFhzYlRMTktKSlBFeG5WdUF6MGpUWENXSFQ0?=
 =?utf-8?B?RWZPektzak5lSldYclo2MGNzSnE4SkE5Y1NSM2g3cGRhMml2bG8yT01Hc1ly?=
 =?utf-8?B?dnNkSEdIcy9rZjgwOXJMRW1WdGRvdG9rcjFCMXJTcWtxVUk0cW1nWnp2bXNX?=
 =?utf-8?B?aklzZmhsZEg4UTZ1cHNpTEFkMko2Mkx1eW94L2ovM1JUZEd2aXlYN0d3UWxx?=
 =?utf-8?Q?pAo0=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014)(7416014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 09:05:41.6570 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 27355ba0-18d8-468e-2bd7-08de2ccaf9b2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099D6.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9039
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

On some platforms, UMA allocation size can be set using the ATCS
methods. Add helper functions to interact with this functionality.

Co-developed-by: Mario Limonciello (AMD) <superm1@kernel.org>
Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Yo-Jung Leo Lin (AMD) <Leo.Lin@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h      |  7 ++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c | 43 ++++++++++++++++++++++++++++++++
 drivers/gpu/drm/amd/include/amd_acpi.h   | 30 ++++++++++++++++++++++
 3 files changed, 80 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index 6873c020b923..613da788c9ee 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -1718,12 +1718,14 @@ int amdgpu_acpi_init(struct amdgpu_device *adev);
 void amdgpu_acpi_fini(struct amdgpu_device *adev);
 bool amdgpu_acpi_is_pcie_performance_request_supported(struct amdgpu_device *adev);
 bool amdgpu_acpi_is_power_shift_control_supported(void);
+bool amdgpu_acpi_is_set_uma_allocation_size_supported(void);
 int amdgpu_acpi_pcie_performance_request(struct amdgpu_device *adev,
 						u8 perf_req, bool advertise);
 int amdgpu_acpi_power_shift_control(struct amdgpu_device *adev,
 				    u8 dev_state, bool drv_state);
 int amdgpu_acpi_smart_shift_update(struct amdgpu_device *adev,
 				   enum amdgpu_ss ss_state);
+int amdgpu_acpi_set_uma_allocation_size(struct amdgpu_device *adev, u8 index, u8 type);
 int amdgpu_acpi_pcie_notify_device_ready(struct amdgpu_device *adev);
 int amdgpu_acpi_get_tmr_info(struct amdgpu_device *adev, u64 *tmr_offset,
 			     u64 *tmr_size);
@@ -1752,6 +1754,7 @@ static inline bool amdgpu_acpi_should_gpu_reset(struct amdgpu_device *adev) { re
 static inline void amdgpu_acpi_detect(void) { }
 static inline void amdgpu_acpi_release(void) { }
 static inline bool amdgpu_acpi_is_power_shift_control_supported(void) { return false; }
+static inline bool amdgpu_acpi_is_set_uma_allocation_size_supported(void) { return false; }
 static inline int amdgpu_acpi_power_shift_control(struct amdgpu_device *adev,
 						  u8 dev_state, bool drv_state) { return 0; }
 static inline int amdgpu_acpi_smart_shift_update(struct amdgpu_device *adev,
@@ -1759,6 +1762,10 @@ static inline int amdgpu_acpi_smart_shift_update(struct amdgpu_device *adev,
 {
 	return 0;
 }
+static inline int amdgpu_acpi_set_uma_allocation_size(struct amdgpu_device *adev, u8 index, u8 type)
+{
+	return -EINVAL;
+}
 static inline void amdgpu_acpi_get_backlight_caps(struct amdgpu_dm_backlight_caps *caps) { }
 #endif
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
index 92070738bd42..bce9027fa241 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
@@ -670,6 +670,11 @@ bool amdgpu_acpi_is_power_shift_control_supported(void)
 	return amdgpu_acpi_priv.atcs.functions.power_shift_control;
 }
 
+bool amdgpu_acpi_is_set_uma_allocation_size_supported(void)
+{
+	return amdgpu_acpi_priv.atcs.functions.set_uma_allocation_size;
+}
+
 /**
  * amdgpu_acpi_pcie_notify_device_ready
  *
@@ -910,6 +915,44 @@ static struct amdgpu_numa_info *amdgpu_acpi_get_numa_info(uint32_t pxm)
 }
 #endif
 
+/**
+ * amdgpu_acpi_set_uma_allocation_size - Set Unified Memory Architecture allocation size via ACPI
+ * @adev: Pointer to the amdgpu_device structure
+ * @index: Index specifying the UMA allocation
+ * @type: Type of UMA allocation
+ *
+ * This function configures the UMA allocation size for the specified device
+ * using ACPI methods. The allocation is determined by the provided index and type.
+ * Returns 0 on success or a negative error code on failure.
+ */
+int amdgpu_acpi_set_uma_allocation_size(struct amdgpu_device *adev, u8 index, u8 type)
+{
+	struct atcs_set_uma_allocation_size_input atcs_input;
+	struct amdgpu_atcs *atcs = &amdgpu_acpi_priv.atcs;
+	struct acpi_buffer params;
+	union acpi_object *info;
+
+	if (!amdgpu_acpi_is_set_uma_allocation_size_supported())
+		return -EINVAL;
+
+	atcs_input.size = sizeof(struct atcs_set_uma_allocation_size_input);
+	atcs_input.uma_size_index = index;
+	atcs_input.uma_size_type = type;
+
+	params.length = sizeof(struct atcs_set_uma_allocation_size_input);
+	params.pointer = &atcs_input;
+
+	info = amdgpu_atcs_call(atcs, ATCS_FUNCTION_SET_UMA_ALLOCATION_SIZE, &params);
+	if (!info) {
+		drm_err(adev_to_drm(adev), "ATCS UMA allocation size update failed\n");
+		return -EIO;
+	}
+
+	kfree(info);
+
+	return 0;
+}
+
 /**
  * amdgpu_acpi_get_node_id - obtain the NUMA node id for corresponding amdgpu
  * acpi device handle
diff --git a/drivers/gpu/drm/amd/include/amd_acpi.h b/drivers/gpu/drm/amd/include/amd_acpi.h
index e582339e8e8e..84933c07f720 100644
--- a/drivers/gpu/drm/amd/include/amd_acpi.h
+++ b/drivers/gpu/drm/amd/include/amd_acpi.h
@@ -24,6 +24,8 @@
 #ifndef AMD_ACPI_H
 #define AMD_ACPI_H
 
+#include <linux/types.h>
+
 #define ACPI_AC_CLASS           "ac_adapter"
 
 struct atif_verify_interface {
@@ -112,6 +114,17 @@ struct atcs_pwr_shift_input {
 	u8 drv_state;	/* 0 = operational, 1 = not operational */
 } __packed;
 
+struct atcs_get_uma_size_output {
+	u16 size;		/* structure size in bytes (includes size field) */
+	u32 uma_size_mb;	/* allocated UMA size in MB */
+} __packed;
+
+struct atcs_set_uma_allocation_size_input {
+	u16 size;		/* structure size in bytes (includes size field) */
+	u8 uma_size_index;	/* UMA size index */
+	u8 uma_size_type;	/* UMA size type */
+} __packed;
+
 /* AMD hw uses four ACPI control methods:
  * 1. ATIF
  * ARG0: (ACPI_INTEGER) function code
@@ -494,4 +507,21 @@ struct atcs_pwr_shift_input {
  * OUTPUT: none
  */
 
+#define ATCS_FUNCTION_GET_UMA_SIZE                                 0x6
+/* ARG0: ATCS_FUNCTION_GET_UMA_SIZE
+ * ARG1: none
+ * OUTPUT:
+ * WORD  - structure size in bytes (includes size field)
+ * DWORD - allocated UMA size in MB
+ */
+
+#define ATCS_FUNCTION_SET_UMA_ALLOCATION_SIZE                     0xA
+/* ARG0: ATCS_FUNCTION_SET_UMA_ALLOCATION_SIZE
+ * ARG1:
+ * WORD  - structure size in bytes (includes size field)
+ * BYTE  - UMA size index
+ * BYTE  - UMA size type
+ * OUTPUT: none
+ */
+
 #endif

-- 
2.43.0

