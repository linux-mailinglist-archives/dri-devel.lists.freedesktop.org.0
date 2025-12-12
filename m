Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8521CB82EA
	for <lists+dri-devel@lfdr.de>; Fri, 12 Dec 2025 08:59:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF8CC10E56C;
	Fri, 12 Dec 2025 07:59:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="KI2f1F0X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013033.outbound.protection.outlook.com
 [40.93.201.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A841D10E55A;
 Fri, 12 Dec 2025 07:59:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yggr1JWVvqLA66NZvlIIXRhq8X+RvrEyeA0EMo5Sa0T5mUDpJjCCOITtEu5H4Zz59NC7ubMTdI4oqk2T/Kj9uzHaXLo7zuWTrFP1ytyzV/XQrFWKifov46LrGNLCBahOOt2LYP0gSJpblzb6aVHo1Aw2LrEYZt25F42HY5C3qZUBMXasPhs48dXk7U7KtPVgXbB1MZOfTjRBF5SMynJfG6Ba8s7UHm9+pZL/hoahktNY6ksZrPYDWmQ0RS5+8oDt5vIJA8GPLhMumV7nE1Fn0S55mnNM2Vu2dNRAfpnyjN/q9uYjedT2HjjKhud+A8vClwI8p2twLeGmUwhJeg+F9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1s1agTl5/wK5jsZeSEoayqP66OsRkfzvC7pHS+q6110=;
 b=TxmsjOBO1XjvezIrGDV2bl2lSM3ziUVdZl5YdPqhL/itN3t9vk+OeSZW6w66Ry/gbkMMmAKIXMMQEdk5pM1ybRCzGP0CJx1GVlOIqZcOkQ3CLupel+m4jEuDQ7iVsLf5KEIudNksS/+3N0K5pkrrsBm6d2IMivpfnQetgpiPmPW4lSVwrzvT/X6LAfGk/7Xvm2f2N6kU546pUPkKIPpUoVsETkxhACTaEvNfl6ZyJCh+fW4J0bYtqRsMe6Fg23hLWSajGYCVJ1/i/j+4WVikhZuzcL5/SMosQuM+/qvUO3HGn1IcrBvriZbQB9u/ZCuR048AjPWka7RULfIc4lUOIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1s1agTl5/wK5jsZeSEoayqP66OsRkfzvC7pHS+q6110=;
 b=KI2f1F0XwMzTse8VSOiPa3ATnAhRDw6a0iZoaQ+UZjq0mMf7AbMseCi7RATBN4ukh9lTO1cNL+Zdrc8bPybBb5LbzmT3q15Ipg4qsWKziHzmkelJB5qgzoEt52v6hGAQd4t6ckQ5vXhxzSCagAHEOe4fw6110zCYPkN4mRvkVkE=
Received: from BL1PR13CA0378.namprd13.prod.outlook.com (2603:10b6:208:2c0::23)
 by SN7PR12MB8057.namprd12.prod.outlook.com (2603:10b6:806:34a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.9; Fri, 12 Dec
 2025 07:59:42 +0000
Received: from BL02EPF00021F6B.namprd02.prod.outlook.com
 (2603:10b6:208:2c0:cafe::be) by BL1PR13CA0378.outlook.office365.com
 (2603:10b6:208:2c0::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.7 via Frontend Transport; Fri,
 12 Dec 2025 07:59:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL02EPF00021F6B.mail.protection.outlook.com (10.167.249.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Fri, 12 Dec 2025 07:59:41 +0000
Received: from [127.0.1.1] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 12 Dec
 2025 01:59:38 -0600
From: "Yo-Jung Leo Lin (AMD)" <Leo.Lin@amd.com>
Date: Fri, 12 Dec 2025 15:59:14 +0800
Subject: [PATCH v6 2/5] drm/amdgpu: add helper to read UMA carveout info
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251212-vram-carveout-tuning-for-upstream-v6-2-50c02fd180c9@amd.com>
References: <20251212-vram-carveout-tuning-for-upstream-v6-0-50c02fd180c9@amd.com>
In-Reply-To: <20251212-vram-carveout-tuning-for-upstream-v6-0-50c02fd180c9@amd.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5797; i=Leo.Lin@amd.com;
 h=from:subject:message-id; bh=ASdiq3kjKJdaJjxTBSLBkmVna+yxq0v6+iOeXV/tDKA=;
 b=owEBbQKS/ZANAwAKAV8XsZZKKe6GAcsmYgBpO8th+V4xSaAgRy1XBQJBLCBYlqmrQyqIn+Zn/
 yig/oAlX16JAjMEAAEKAB0WIQQzqV4kW+yguuqHrw5fF7GWSinuhgUCaTvLYQAKCRBfF7GWSinu
 hoUgD/47Eq268Io10jgq9hzdGf7qAvwg7xSMWLYkT3VlCf+X0HJlAMi6pCuJrjM5XsbBhW22y/S
 0JmU1XGdX2gFRjhiRAjVEooKd/bHcAgnEUNaVOvas++e3wMMyvjgkXpbF/k+YXZbPoyppSELLmN
 9Y2iQnojt+88fZBDcdsmM6hudw/I/EA3S7/hhrPDXEPhTS4dKWKNJLIpUtjRGsYW1dGqGzasmYj
 tSD6oClL9LbGCUcZnn7Z/jkCS8HHx4gCwKb+P03gzK705PBY101CImKMWMdtevnKXJ+JvLJxxo1
 2VDe6ycA2kHOo3KdxJvQ5uaMFKVr2i5SGcZXODovgzfYrelWT0vssj7JLtucHt1bQUni3XJf14T
 ywNJB3km5ASpugr0xX54x6GSp9wmt6PCxaS92CpymKDqnLjp0NNbETPmDBVZv9U9yMEiZr/kV/C
 dgs4jdqpmZunFnT/LvL5PChTGh0fXTtJgdDx8rrsoNl0WaQkl0v2W0r0ft7sWP4aRGGW3/wenhM
 Z0NyQfqOiwmNG5mq/MR4aoF7lH1w1bSIvWU6kUrqh+YEBAzL+RXQyX+9tGYNNUMAfsMLSS7P8WN
 mT1vUL7fPRX+2LRwGTqfGq1cKd45w/enG5jlma6mbZtPR81ZMXaKztcZzdE/llsjk0BUNhDq/iL
 Ew/cz3WrF7ZTwcw==
X-Developer-Key: i=Leo.Lin@amd.com; a=openpgp;
 fpr=33A95E245BECA0BAEA87AF0E5F17B1964A29EE86
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6B:EE_|SN7PR12MB8057:EE_
X-MS-Office365-Filtering-Correlation-Id: 3cb271e8-3ff9-41f9-7987-08de3954680d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YXkyVFRWd3JxcmtmbDF3S2s2dll6ZXJVZ1RTM3BxK0svR29tR28wcFpJZ1dD?=
 =?utf-8?B?WVhjRkJCSENKTmJ6NmZxSDc5ZlE4UlFncWdqaGdXaUhBOGphT0daMzJxeFRY?=
 =?utf-8?B?bW90NE9DT2FVYUZ2QVFMdEI0eFdLbDhEOW5mamgvb2NXUlBIOXduQ2Q1Y202?=
 =?utf-8?B?YXhQM2Q0QmdBcHJTakprdnBaTENKSjJmQ0hHb1U5RTczdTBqYmZ0L2toWXZB?=
 =?utf-8?B?MWZTamdVaDAzN24wOGhKTWQ4S1NVYzBxbndUVC9HZ0laQ2RaSFBCb3N4T1ZC?=
 =?utf-8?B?SHNjeGVFU2lXWHlTYkc0Rk1wckdGTThOeTdVcVdjSDJZaC9WeHBSbTlESDlj?=
 =?utf-8?B?T0paUk5BeVFRd0dVcnpqZlpnY2RUa2F5NFVaTzBFZlRaelJEbEMzWnhlbzNR?=
 =?utf-8?B?RTdCeXFVNS9wZ2hCL2JLdC9WeUptV0Y0ZDhtTlFLU2ZmZjVpYmRBRVJtMVVY?=
 =?utf-8?B?c2xOODNlNExDLzkrd3NLWUlUS0xSN0crejhVVGNmSXVkeGg3TUlrU3JMZEdH?=
 =?utf-8?B?YlE3QzF6YXRMSitmeTNQMG5VYnRybnpELy9neUNVVkRUY0JwYS9HSU42Z1Rr?=
 =?utf-8?B?QUcvdzJkV0pkYlJVR2lsMVVDajdJOUdDejVHM01rcy9EenNJNW9uSXorb05I?=
 =?utf-8?B?UU1VQWtDZEFFcjM1Z2JTNmsvWlQvZWRJWndRcHRzczJkdXpLaHJWZDdMbS9M?=
 =?utf-8?B?NFJOaG5KY0Zlak50Q3ZtRExyeDdpM29uSlpPRHNqa3R2eURWdWQ2M2tMVjJv?=
 =?utf-8?B?KzlGem9KTHMzVFZwelI3dENmTGxyWC9nTlpwR1JiejlsTllDaGYydjJlOW0z?=
 =?utf-8?B?VFhLdFlDejdVMWlyOERsTzVlbkpyMGNjOHplbmdOMEhMbHdjbU9sUW9GTlZC?=
 =?utf-8?B?Q296b050SHp4QUI1UFR2SCtBTDhyaTU1bGsvdTZKN05hUmZnQVVmUlB1UFVz?=
 =?utf-8?B?OGpJc1FyNm9jVDhsQmRvK1hTbGJCTWlzNG05WmpPejR6NHFNSmlqZ0I1QVZm?=
 =?utf-8?B?N1EyY01SL0QwWUdWMk5WaUFRdE9WcllSbjl3aVdOcWRzSkdBUXJEVjBWSTNY?=
 =?utf-8?B?emswcll6MllUMUZSMGlyR2V0NWVtWE9IV29nOWJ3QlU4VmNMMDFib1BhRm9C?=
 =?utf-8?B?N2toQlZSN3Z0eUgzRjlkUWxjRHRrS3k3ek80Qm9UWjFBeXdYU1RkeVRmeW5M?=
 =?utf-8?B?Sll5akFCc3R3QmNMWWJJSFZMZEF6WjZpaDE0WUJ3d09IZkxBS3FHVUlzbDRi?=
 =?utf-8?B?b2dEZGlLL2hZT2RUQUJqSzRueEZRakVjZW9QZDA0aU4rT3FMR2pDWUx5a2o4?=
 =?utf-8?B?V0g1OTRBcGh5cEF5azBnYUVscHVJQzdRdlQ2WFRlRWRtTWJJQkVrc1dzbFJR?=
 =?utf-8?B?SGhyelk3d1RtWHZUMi9TOXVMLzhYTnV2U3V0dldvaS9kdUR2L3cxYTBQdU9k?=
 =?utf-8?B?UWwrRFJobk9Obzc4eURNM1M3cThMNEw2L1ZuRng5ZmxERjY3SGJnREY3clEx?=
 =?utf-8?B?WWV1RCtiRDd6ZUZoR2RRdDQvM05KdzdHOVNMYm1UNDB2S0lQZ3FQWXF5Y3Nv?=
 =?utf-8?B?WStiZzZhMHpxWnBvZzh1dUZJbEJXN2NOL3B1N3BJSmh6R0xqbFByUVJUSUwx?=
 =?utf-8?B?MUZlZ0RCTXErekl1ODQyQkl3MkJQT0lkc1dJYUdjZHlHOEtlbVdFVnlHZ0lD?=
 =?utf-8?B?OEtJRytTZElLZ1l2OWpRKy9FL2pUSVJ6OTh6WGZjWHlXbUtLb010YmRDZDc3?=
 =?utf-8?B?SG5wRHk0MEVHOGwrODhZS29yTlVNYlpoWVhJZVFKbkU2ZnZwQWgvZ0sxVGNs?=
 =?utf-8?B?VXl1MTN6MEk3akJrWjRZRnB5Y1hpb1hEZTVSTHZuVkhyZVRCcFk1YitnWHJY?=
 =?utf-8?B?THoyUVo2ZmZ4Nnd0cHh3Q0QzYzJZbjBUQ3UvaVpxbnRVM2VKMUNtektkRTNC?=
 =?utf-8?B?ZVZFN2YzTVBCQkNRUitVNXhndWd1dHFQNk0xN1ZlcnIwWG9zdmN1MytkeEJo?=
 =?utf-8?B?akk0NFQzQ1FZWEdLK201ZW5acmZLdUNWVHZNZ0dKWjlKcENBWlR0L0gxMmZH?=
 =?utf-8?B?Y2F5clFCcytqL3FRVEpLZWpHVkxvcW5CK2RPTkJMSThGdFA3bHI4ekc0OFZq?=
 =?utf-8?Q?LoME=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 07:59:41.8498 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cb271e8-3ff9-41f9-7987-08de3954680d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF00021F6B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8057
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
 drivers/gpu/drm/amd/amdgpu/amdgpu.h              | 34 +++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c | 77 ++++++++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.h |  2 +
 3 files changed, 113 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index 9f9774f58ce1..aca2ddddc64c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -836,6 +836,38 @@ struct amdgpu_uid {
 	struct amdgpu_device *adev;
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
 struct amd_powerplay {
 	void *pp_handle;
 	const struct amd_pm_funcs *pp_funcs;
@@ -1319,6 +1351,8 @@ struct amdgpu_device {
 	struct work_struct              userq_reset_work;
 	struct amdgpu_uid *uid_info;
 
+	struct amdgpu_uma_carveout_info uma_info;
+
 	/* KFD
 	 * Must be last --ends in a flexible-array member.
 	 */
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

