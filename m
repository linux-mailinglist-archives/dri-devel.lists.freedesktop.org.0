Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97267C2A69E
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 08:54:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEE5D10E378;
	Mon,  3 Nov 2025 07:54:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="AmkCNSd7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010004.outbound.protection.outlook.com [52.101.46.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5658D10E378;
 Mon,  3 Nov 2025 07:54:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=teuI3Nrqr2x5v5Se2VCpNr7t+nXq5/xe69oZXfzuIRHVbdBxAtUuEbTL1rUUlkCehJtiE6D5z23VCzyUHxpH1dcCWUlZrbKGg2jf9MEhjDyImIX6oDNK14XERN20/hjo2IyL5724ODN1eOCNJK4JvNHNE3g1LM8z9F+owpxt5oxxHPgH2stuDAWGEF0i5ZzYiDXoPYq9KcIPYvQlRlpLTSdKVdV2Bmsex9yf9FLBkHd11KBL29vQGvQ9MJv1vUS3gdjuctUuU4PlwQjIJkXpe3yEp7+ISzHBUBBtMo6RxM9intXTrzFSRk0fPwbqhFU9p564j4Y8plAmMtgKO1miZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k17MXIsfn8Q8h4L+R7U3PCZW2ieaCOBN/yI9P03b8EI=;
 b=GrMH/LAVUHrByv2qUzf+WoLsxrJoFaWT4SrPabuD3mJO8bITMD/J2KG9fiVHs8LyN2xb8OjijQjYCRpReuifr/tDBOJVHpuqJCfUAY8gtbFhqo0NcVg3qz+9tmn44SL2L3D5IOodtwiDm9oTYmCQWlwYa9UrfCCsJM7V2SbnE08InP6BF82nMe5MUNm1rC0n5SYPKYtESocsuAQKfHBkLrLt4Rv8+xi+3JjZ5brWfOOb5IKIdjAlS8xrttspoe21b1son5b1+40XRNCbjiEN6J5+DupLd+DtM+1vNqwTzMiqN+CpR1WM9N1dioDgAqrFchapsiQ14kxddo7Cd30s1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k17MXIsfn8Q8h4L+R7U3PCZW2ieaCOBN/yI9P03b8EI=;
 b=AmkCNSd7yyDxjmoQZic6exban2Ot+MlsEw3znZkPLSexoSYb+0jw8vq/CVSqLOHzrpU4HjaJI5s2HLQ63uuinbDSf+CUaBZMQ61Wg0eClao2zo+281Y2QQmloWamyO23cj0Zxc3P4JQhqcjTBYRIHropYeUOivjP9E6NEaY6ldw=
Received: from DS7PR05CA0002.namprd05.prod.outlook.com (2603:10b6:5:3b9::7) by
 DM4PR12MB6304.namprd12.prod.outlook.com (2603:10b6:8:a2::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.16; Mon, 3 Nov 2025 07:54:10 +0000
Received: from DS1PEPF00017093.namprd03.prod.outlook.com
 (2603:10b6:5:3b9:cafe::65) by DS7PR05CA0002.outlook.office365.com
 (2603:10b6:5:3b9::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.7 via Frontend Transport; Mon, 3
 Nov 2025 07:54:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS1PEPF00017093.mail.protection.outlook.com (10.167.17.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Mon, 3 Nov 2025 07:54:09 +0000
Received: from [127.0.1.1] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Sun, 2 Nov
 2025 23:54:04 -0800
From: "Yo-Jung Leo Lin (AMD)" <Leo.Lin@amd.com>
Date: Mon, 3 Nov 2025 15:51:06 +0800
Subject: [PATCH 3/5] drm/amdgpu: add UMA allocation setting helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251103-vram-carveout-tuning-for-upstream-v1-3-17e2a72639c5@amd.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6396; i=Leo.Lin@amd.com;
 h=from:subject:message-id; bh=OOPUQvgJFYRAVz/SHG164JwIG24VU1oGoMaElOhVuXk=;
 b=owEBbQKS/ZANAwAKAV8XsZZKKe6GAcsmYgBpCF8MZa9qWLJSCsG/xjsJzKhTmW0gWhL2B9W3e
 4/LFgF4urSJAjMEAAEKAB0WIQQzqV4kW+yguuqHrw5fF7GWSinuhgUCaQhfDAAKCRBfF7GWSinu
 hrwAD/9vMZSpclVz+UED+S+zuzbt8ZS1l6WCtaiEQQSe2CYiCW0x6E+rWTGtdTLqebFvyVWFd0J
 0JcWKIT1c3dId1HmluudQdnWYZo52XSGtYWn9xAa5K2C46fZQrjBrCtD+w0vQalCGVbtLSUBPuK
 TOsbZtsXi9BLjzIZ8F0CGg2LSIobm1WuY8pWqkGq2KiGWqLDUCh8YnHu8Rn14NrD1Gf74A/P8Qf
 PLJ8Xf9DoRqA+SUZ8AawIy9qdwKFSal/gFPQPe9aaGJ0/ddXct3Fel6rTg+pq2y+RHcMkc61hK4
 WCVmJPf+lw2TvjAf9F1gNsfPuClgoiHYe47tJXIyDxjRjhik7lx3q6ImzgMGPYq7UC/VtsftaEm
 POCCud1upSAuC5J9Fcm4yEfl9tOat8kWreEGuHU2bMV6PDOayEjlZJGjXwaAlN79pOaq2GQMdUO
 0j1EIpyqr29AdmPaTgu9mS4y43fvg3kw3/ExgYALMq6CFcHEgO8KKKhWIs4NJuvZ/oi8x4OJNzB
 94XGDVBCLW5+kd3GqVW6FucT3kPd3vvNb7x3XmKMbZD94H2DUsqq3OI+qdIREvdJFNKiE07JnYu
 P1COAvFQgsJq1bRQ2kwxxaD4Aj7egn47LXuN4QBnli6DikqmNZuOj0ahOm6R3oqybGOMnGNeQrM
 pNXqqdyfdQlD3NA==
X-Developer-Key: i=Leo.Lin@amd.com; a=openpgp;
 fpr=33A95E245BECA0BAEA87AF0E5F17B1964A29EE86
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017093:EE_|DM4PR12MB6304:EE_
X-MS-Office365-Filtering-Correlation-Id: ce7dfa88-49da-44c6-4e72-08de1aae2bb5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|1800799024|376014|7416014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NU1Sa2plVURTcXhzMkpJKzhPTmk5bHRneVZ5LzNTR3ZTeU5INndndGNxZ2ZN?=
 =?utf-8?B?RkV3N0E2dnFoVDdRUkF3NHV3QWg3bG5nWHZiQXY2Z2RDb0pYSVMzTkhJT0oy?=
 =?utf-8?B?QVFHZkkrTnVjM0pxZXRONE5qL0srMGRGc0V3MkJtYld3dVlwK2krWHlFNGxV?=
 =?utf-8?B?d3NuQ3RiTzhmQ2Ixd2Y0Y0VxVmRLdXIxWjlFK2dGdktCRVZkbmM3MUkxYWNj?=
 =?utf-8?B?Wkh2cmZkV000dGsrTzd5Q0Y0b2NLakloQ0Nybm1UTGpLcFNEWU85aWR3SnVZ?=
 =?utf-8?B?TEQySlphWWZZUWFET1VJY0liMWxOYXIxUWNCZEVLb1JpUkQ2eFlYZWtMSklr?=
 =?utf-8?B?Y2NlRW5MOCtTVWZOZkRZQUtPZzRPQjRTZGNzZkNOVFhrY2MyQXNyT2lyY1Rh?=
 =?utf-8?B?MmYwN3ZUVGdkZVNra0h6WklmN0loSkdUckpESHBselR5QUpnT3duNTViTjdr?=
 =?utf-8?B?UkJzb05WYlJwUjJQTjZkU2Qrb2FwbTg1MFNPeUM4V3BjRWxheUNjR2hRRkpm?=
 =?utf-8?B?dUNaSndnY0N0TUk4ajAxVWRlVGJwY3Z3V2pVU3V2ZE5XQ0NKRi9sQWpOcmcw?=
 =?utf-8?B?RXlBcDZKaVpRUWhBeklzeFRFNktSMG84NU1xNkU5RDZWazRUWldJNStRaytM?=
 =?utf-8?B?azJ6Z0tGUEZLVGRsRkF3ZjFaUmtSUHlzVGY4SVlsM3VycHVOR0RsZSt3ZW1y?=
 =?utf-8?B?T3FjRVlGd2g1UitBT0JHaEJrMW8vUGRNVGlZQis5UDI1K3BwTUVwZmxsVU8w?=
 =?utf-8?B?NGtBVzBsa0tFeHV5WXdET2ZEc1psVHlRaUFvek1UTG9SZWI2WXVJZHNlNlFC?=
 =?utf-8?B?RnRIcGsrOHNxaWdsaXNZR05CRnNCYzFaeXArSm1ZQlVNOEp1amVPaVNNSXRq?=
 =?utf-8?B?QmxSdGdZNHIzblVQZE56c3RXWU8wazNUOWJNRW5EQXhvVjZXaDBuNjJwNTRN?=
 =?utf-8?B?K2UvdHRFQWFrNHU1NlU4ZUYzSXJZNEFvSTJqWnpXZTBUV3h3a3dvSVBiOUhU?=
 =?utf-8?B?c2c4UkNSd1g4TVRjTkc4L0FZWkxSdWtsakdJc1FmaUNzRkM4R25kbTkyM3lR?=
 =?utf-8?B?clU5ZTBWVEpsYnRVaWVYeEllVVVpd2I3UVh4NVZpTTM4L0dwRUhzQ09YMnR4?=
 =?utf-8?B?Ynd0MEV5QU9laHcrMG1ack9ibm83ZnlUaC9iZ0hwYVJ3NzRLcjhlZWFXZHY0?=
 =?utf-8?B?T1dDZXNJcStqZEtYMmh6T0FYY2xuNEs1dE9vWkduVFBCTjB4eVQzNHhPWDF0?=
 =?utf-8?B?TklPZVBLKzNrRE5BYUF6d3Q2d1BNWXVIbEdqYXRoUktJbUFqQUkxSlVXay9h?=
 =?utf-8?B?ZmtnV205TGswNkFCdDA3blFHU0Zod3p3eEYrSWVpMWs3VDRpS0FLVTRlTWdk?=
 =?utf-8?B?UTdUeHp5ditpeVIyRGZZTmZMNS9OZkJSU0hkMWhaSmRSajZhaUVaNDVRWFVS?=
 =?utf-8?B?OVhaVmdHT3psSlFYYWwzZjlKVUhkNDBNeDZSSlZJMkg2RlM4RWtreXVscnN2?=
 =?utf-8?B?MTdZME5aVm9DblZrNlBIb200dTlTL3VDd1dDbE1mc3lETGlaMDl2QkhtZFJI?=
 =?utf-8?B?TmJRODhtWEhZL1FLNkc3ZzRQTnQxdXpHRlh4c0FkV3JWZEwzbmluYXNRc1hX?=
 =?utf-8?B?ZGVrelArSGJzZDNESG1PM0JnSW5QTUg2by9JMkpiU1FqTDdXZksyUXNkL1M3?=
 =?utf-8?B?ZkJJQlZGK1FhMi9ZK1FNRFdROGVIRmdiSGFjUEowWUxSa29SdlBrbTZWaHQ1?=
 =?utf-8?B?MTlST2JLRUhVU3BIUWZ0UHhSWjBScEpIelhiQXV3RnM1a3B6elliWkF4MWgz?=
 =?utf-8?B?RTg4YkNMa0lDSGZFSUFpS3NFazNIbmZqSXV4UFQ4OHRWZ25uYUd3QXR0ckE2?=
 =?utf-8?B?K0xJOHZOOGhVSDg0elFhNGIvR2ZNdE4rb1ZOa0E3QTZ3bzZPamxyZDdJNmJ4?=
 =?utf-8?B?VFRRWUJTazBycWFHdmVFRStNVEJpLzlCbnpUaGlIOHcxMVprZ0lVWnV2QzNF?=
 =?utf-8?B?andSS0ViSHF6cXRRMXpBMXhuMHhabUg5NERQT2xNdnVuSTVBYmpLZE1OMUd2?=
 =?utf-8?B?aXIxRlNYVlNZSXVxK1ExU1kwazc5bXppZ2dHL29TT2Vvd255N1ZDbkd4UHJ3?=
 =?utf-8?Q?ZcPM=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014)(7416014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 07:54:09.2325 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ce7dfa88-49da-44c6-4e72-08de1aae2bb5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF00017093.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6304
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
Signed-off-by: Yo-Jung Leo Lin (AMD) <Leo.Lin@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h      |  7 ++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c | 43 ++++++++++++++++++++++++++++++++
 drivers/gpu/drm/amd/include/amd_acpi.h   | 30 ++++++++++++++++++++++
 3 files changed, 80 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index a5574e84694b..3de520f0b5b4 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -1686,12 +1686,14 @@ int amdgpu_acpi_init(struct amdgpu_device *adev);
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
@@ -1720,6 +1722,7 @@ static inline bool amdgpu_acpi_should_gpu_reset(struct amdgpu_device *adev) { re
 static inline void amdgpu_acpi_detect(void) { }
 static inline void amdgpu_acpi_release(void) { }
 static inline bool amdgpu_acpi_is_power_shift_control_supported(void) { return false; }
+static inline bool amdgpu_acpi_is_set_uma_allocation_size_supported(void) { return false; }
 static inline int amdgpu_acpi_power_shift_control(struct amdgpu_device *adev,
 						  u8 dev_state, bool drv_state) { return 0; }
 static inline int amdgpu_acpi_smart_shift_update(struct amdgpu_device *adev,
@@ -1727,6 +1730,10 @@ static inline int amdgpu_acpi_smart_shift_update(struct amdgpu_device *adev,
 {
 	return 0;
 }
+int amdgpu_acpi_set_uma_allocation_size(struct amdgpu_device *adev, u8 index, u8 type)
+{
+	return -EINVAL;
+}
 static inline void amdgpu_acpi_get_backlight_caps(struct amdgpu_dm_backlight_caps *caps) { }
 #endif
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
index 0743fd8620e4..d53f7b33d619 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
@@ -669,6 +669,11 @@ bool amdgpu_acpi_is_power_shift_control_supported(void)
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
@@ -909,6 +914,44 @@ static struct amdgpu_numa_info *amdgpu_acpi_get_numa_info(uint32_t pxm)
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

