Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ABA9C96D08
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 12:09:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9589110E3A2;
	Mon,  1 Dec 2025 11:09:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="JBThQRKQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013047.outbound.protection.outlook.com
 [40.107.201.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E35AE10E3A1;
 Mon,  1 Dec 2025 11:09:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qi8HyBjD0IY6ukJ33R/u/8AOTn9+CzXnyPgVJlgP5WLS8KtBiUysoT+H85lh/wA9KWKQvHfgcKWvzAf1/Y/wWmGnhYkpZUw3H7ZB1SR6J/2yLtfmXtFzVwChwPj84qxaIgaPKOFJs3NMC43XXGzPgBtYqyZf1+NrmMQBBGAL383GHniRSCVPAEdoVipVMgeKKv6ZNjxnegh82h7jGPKMMTLyaqnM6H9LyN5G8GeC5f+1m2W60A1jiM2zwDDEQa34+xVbubnsggvr08wKPOQ1UITOxGaLjUlp0IA0ndl30pg959bN4REFCNVzDjFLHSYvrJLULKFV18aWsryxk0NyJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UOCc5u+MQ+VVZvgEUZCQ98BBtZmh/ZI3mSNRj5DQqcs=;
 b=P0CHbgS7y0nZVTI/POmgwNLlSL/Bzh05y/9t9lBuywUso6Dm0hPMrFTzr6/zskjJaf1QeO4jMZo+ZBmgatDJdu9pCAXDEM6FxFNPzabA4pQqY+pziZtdwgf9t5cbb6l7gpfnYAYl2j1lz6EFrwAXtRyafUjXmjnoSpL9CBB/Ba/jKFsdIrksc/NC9u37iK39S0KUiYZ5ApLQkvbf3KHrqjNqQ5KFaofs4fpEbWmvU5iE1Do8iTHCUiLg8CF4MGlHL61vwBZ1rSQvO+nsu3JgIyaKhu79L6kkEsTUc8IQvItzvNnPNG3PcvbNgiNDGolDbkQzQhSIndQ0rVNUCrJwCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UOCc5u+MQ+VVZvgEUZCQ98BBtZmh/ZI3mSNRj5DQqcs=;
 b=JBThQRKQXerdrqT46iyU1rut7UWvHeNPfCpl0qGiIAtwk9F5i6sW30hcVXntpP+6AxLD7jfqoAqQy5RgIsZ9BcKsOMQgxSXZLuTQTpVeJh/gyqe56p6Qv+2/H0GGk44F2aYYeLPN7MkuIkEBZYog3diHWU19a4WLWtz9eBATjs4=
Received: from BL1PR13CA0394.namprd13.prod.outlook.com (2603:10b6:208:2c2::9)
 by IA1PR12MB6460.namprd12.prod.outlook.com (2603:10b6:208:3a8::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 11:09:19 +0000
Received: from MN1PEPF0000F0E0.namprd04.prod.outlook.com
 (2603:10b6:208:2c2:cafe::d2) by BL1PR13CA0394.outlook.office365.com
 (2603:10b6:208:2c2::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.9 via Frontend Transport; Mon, 1
 Dec 2025 11:09:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MN1PEPF0000F0E0.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Mon, 1 Dec 2025 11:09:19 +0000
Received: from [127.0.1.1] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 1 Dec
 2025 05:09:15 -0600
From: "Yo-Jung Leo Lin (AMD)" <Leo.Lin@amd.com>
Date: Mon, 1 Dec 2025 19:08:11 +0800
Subject: [PATCH v4 3/5] drm/amdgpu: add UMA allocation setting helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251201-vram-carveout-tuning-for-upstream-v4-3-9e151363b5ab@amd.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6465; i=Leo.Lin@amd.com;
 h=from:subject:message-id; bh=MC0Naskx3s6b+48x+DyhjXElbfffGFnO9whl9i7j+bA=;
 b=kA0DAAoBXxexlkop7oYByyZiAGktd0/IyMDWVCpJma6pwfe4Z+1G+qad69vfUiQJMtjHDTby/
 okCMwQAAQoAHRYhBDOpXiRb7KC66oevDl8XsZZKKe6GBQJpLXdPAAoJEF8XsZZKKe6G2G8QAIuI
 e0cCxUbEn+P90YtHIbA2Gb1+VJqYfLBA2NqirL1UPgJycSjyApfTgJQw14jCJpbzTEn4kbjViXy
 LfBO+GZ1FeuUOavxS3EitNizPavtpAaXHNzU8+xeEm5szdWZ8fMwQ5ziy9YWgvGLleIsFc3sotU
 Q78NiFKdLnJd74VgPTg9ZoJy6NuGLRtdI20F9CfUyzTpxkIBcRrVCcRqOvUqx6z4L/xkk08fuWv
 fkNyOIRof8FaNEPRuGaZ/OXwRfFp5w5ONA0AcpaP0JdBAwsFpv+rr8hqRPiPDxN1uSAXNRuxuf/
 V5Wik+PEIVP1ac2WHGxkYdK4SKLVAmNnTyv6lDlxNhwibKWSgXmEWcuUnMXHIvNBtl1cuyt7w+k
 pxPvnukhKWoVrlScjaDzqT+wxYyzBy+fe1bdnqNpNXd9QMtJtwMl4w+OrrOurCVZc7orv1KSbyV
 uTOJd+UEy84lcQ8rRiTOBpDTTxzHt3BXXsnNuJDQh5NPLl/+QZRlH8Muw3z7Z180d0OD+OD7jQs
 bfk2Bj77ay0BRBIPfp+RgBRV59EXm4kVD0h5OKRqtkzJIagidz7YDAic1YPlR07rqGh0FmBkbSX
 QtOupQX2FvaCjibs5geAVXsxH0cdIt07hl1BRzHRe41sVVeYyeggZ94wHTAg1pD56RwvV8KVJJO
 j6zdL
X-Developer-Key: i=Leo.Lin@amd.com; a=openpgp;
 fpr=33A95E245BECA0BAEA87AF0E5F17B1964A29EE86
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E0:EE_|IA1PR12MB6460:EE_
X-MS-Office365-Filtering-Correlation-Id: 28c5793a-31ac-4ff0-5080-08de30ca131c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|82310400026|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aU1iSWJ6NVhSd2J3aXB2VU1tSUJxTThqQWpYRGxENnhQU2FDd2tYelIvT3Bp?=
 =?utf-8?B?YU9qTXNiVWx4UzFtZHQ2cjNDanZyb0kzRnltaUdkZi9sRXNuc1FpeGFCeGsw?=
 =?utf-8?B?MjlYSGUxNzJwNHVIRHlVMlMxeUUzRFl2Q1RQQW9RZ2VRbXNBSDJoOUc0b1FF?=
 =?utf-8?B?THhaQUs3bEV1MlNFNFpKRDExek5zamVKTk5La09pSE9oOFhETjlnWFJhcnFT?=
 =?utf-8?B?S0M3THJwcjhFK2J1WTdlemg0bElwaEMrSE83dVBpMTI0ZGlqR2VNTENidmd0?=
 =?utf-8?B?d1VxS2F5VlZJQ1hPVzl3UmJVZFIvaHdNenRkV29VTzEwNUNxVE5IRkg3dTcr?=
 =?utf-8?B?eVpTYXVMbkc5NTZPQnJudXdHQ25KbjI5WFZBOEZ3N0JvQXFIbFJiaXpaOXNY?=
 =?utf-8?B?OUJHMTlMaFQ5T2lBUkpzVi94U2J4dGVFK3VvaS9HdXBnWGpjZVh2c0ViR3RL?=
 =?utf-8?B?RkRMaHE5aEpIMXROQnpTbFY5L0tIOEgzOFFhcXBVRTMyYVYxVHJ3VkxraVpY?=
 =?utf-8?B?OHZKSmtSenFFMUZOYURqNnhOM1BKL3dYRndIb2FCUzBLYXE4TVJkWUQ1THdp?=
 =?utf-8?B?ZjVpN3JCMGlQQ3B4Mm1LWEJ1TXZOUXNab2Zjak9Vckw1d0N2UHFjV2pFMTZw?=
 =?utf-8?B?dnVuSWkzYk5aZ1dWQmE0cHFvbVozMXoyVXlCeHdGKy9EL0JHdkxrbGJNcXBp?=
 =?utf-8?B?VHViWjVEWTFDVTR6bkNNSkUyYXV4S0dYU2lFc0NGNWk2RjBMcG8xeXI4c2ZO?=
 =?utf-8?B?MGdQcExqeXI5OFgreTV3QzBIcnZtTnNwMzlIUTFWdE9LWG9Zblh0VWdjZWdL?=
 =?utf-8?B?RXkyNHNUSkQrK21aUnN5OFY2SUQ0YXZZcjZhZ0Q3d1FlcitjZStrbWo1WnBP?=
 =?utf-8?B?V3lkenZRSkpFZ3U1TWk2VkNsMDZ4ckFEVSszUzdDUkxLa0xRNXFBSnpRVjBT?=
 =?utf-8?B?SXRiV2U0Zy9oeHZmYnFIck9CbTBrSzR3Tnhka25uNk8yRnVUUERqaHc1UTZa?=
 =?utf-8?B?SGlPUzFhbEJhUkZ5WGJhMlo3VmJia2cyeU8raEx1cndiOUxPNVQ5WGpCd0ZP?=
 =?utf-8?B?Ry9NcGgwNWY2Y1lYcHdwNWtURjI1Qk1XRXEzaWYzOUhlQmZGUkZxbThBVVd0?=
 =?utf-8?B?MHl0OW13V3ZxZGN4dnQ0NE01dG1ISU1rMjk2c0lIR3M0YVorWXdWblR0R0NG?=
 =?utf-8?B?MzNsOWxIOS9JWTJSNm5XMmd6N2wrc3Z6VVBEOEh1VzVSZFBxeFFldTNTR3V2?=
 =?utf-8?B?RWM5M1c4WlhaaEcya2FBRWxoaUZMRjJnMWE3Y3phckZ1ODdjRkc4YUNwWmQz?=
 =?utf-8?B?Q09EbG9YVXYyc0dKREkrZjFsU0w5MlpBV3BydWZCKzZvY3NYeEwra2xSL29Q?=
 =?utf-8?B?Y0luVnc0c24zNk1GYitObm5Tdmw0QW1iaUtkbmtlVFM1NmxpNW51bnUzQVVw?=
 =?utf-8?B?MXdyRVpkR0NjMzRNZ1pydzJyeWJKaXpwcnhTSGhxM0J4MVhOV3hMSE5hcndL?=
 =?utf-8?B?eXFuRUZXejhhK0dVejkrdkNyOGk2eHN6RG5EalBVbVlVQU82MGNaYUVoSjN4?=
 =?utf-8?B?ZE1DTzNVa05kc3BvNTFjejhzZm5ma3FkVG4wZVhRTXZZbDhqL2N5bjRiQVNn?=
 =?utf-8?B?djlOWHRuSTcyWmFiaWZkK0Y5UjFsdmpYeTduKzJuSHMzb2hpanppSGk0VWVT?=
 =?utf-8?B?ZmNVTjZUc0tyRlY2UWFKcXNJUGZkQnJxeHZQWGlPTUpzSFAvdlcyRlhpSnFE?=
 =?utf-8?B?ak8zTysvSkJwUm92aGpIeVRKTHp4VmJJaTYveTF5UHozdXJNVllVSG5RTEVF?=
 =?utf-8?B?Q0s0ZmpPMnAxd3duMmpHZ1pwaGtJU2ZzUE5nZWV1MFpLU2ZNaUlWbTE3NEZ4?=
 =?utf-8?B?dnU4QVMyU2tHYkxHWVY2Y3BDdE5KcUtlOXprRHpZK29tUC9OQitwTTZGUkdo?=
 =?utf-8?B?ekU3WUxDUHRScHllYTZ4WHl5YWJ5VGdjQ3g5d3NCSTBHeDNubldXM2dsaHNx?=
 =?utf-8?B?SHMrZ1VqRDdzNVl6T3dQeFFHNkx3ZklvWU5Ra0NUdmNIRWNFWEphTElpL2Z6?=
 =?utf-8?B?UUsvTERNcjhBMkdhYmQ4V1dCek5TZ3BZV1VHNkJPMHVvUkYyRUt5VngyaWU0?=
 =?utf-8?Q?TqEw=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(82310400026)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 11:09:19.4905 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 28c5793a-31ac-4ff0-5080-08de30ca131c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000F0E0.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6460
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
index ca9c2b54045b..cd9a71abf4c5 100644
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

