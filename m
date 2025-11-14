Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9635EC5C0D4
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 09:43:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E204E10EA16;
	Fri, 14 Nov 2025 08:43:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="TquwJ5OF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011045.outbound.protection.outlook.com [52.101.52.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1208910EA13;
 Fri, 14 Nov 2025 08:43:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SBZSNFsp+4dvm2sqdvYEg52zlKoYz7+pcCBayGQfK5WHJ7MeOIMcKPs3vZ3/X+qQr0zVnC6DB4mGhfk/3kfoBDw3u4C5CZcpF+scxnee7tDCEgkSbgJ85BtR/VvUNrrWVGuw6Vtn3lv8WEh64p3pu7ahh2FX1Alf1/fdnvTQ0h4C+hkzOWUG7vJnwBEwjEWT+sUTvxqZAFmv21K6lkQGzV7ast8jeaMIaBM7wJsQQ7g3S7nKv+Jk7mLVZk+uqEVFfDuPMxqi6FOfyMd8fVRcZmFryGBYTzqMUv64gV1Rv2RCqMollPq128xRgWY3YCCU1fpLAjlwpUQfrmYbxPD4Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DFfdhqkN5f+dLAf3ckRqYnOITmNbE0RsTTEp+5tRzUA=;
 b=y9x3Stw0IOUn4qrDLcyBjhjmgVX8vZIVkeXZ1ZUIOhEwEKqABTiqwBQxaMD/xcjaczHMrAdfTZas4bWBSEHdLSeIpMxFF2SBIfGnIIWWH7yDlDEjFODP2hf+AnHuOLPzAFhPRKC8E3d3C4hiDC0woL6GMTgXblO0xUGnVKras8AiQvlYsBLJ/h3nAc43EG4fHtaN9z0vQczzp7j8xT4x7xwVyFYtzDbJb7JOaYEWby0sT/XL2b0lKUyHomSJ8WcoewhSP3mhq4uxBDgNkxyLx2IBxx2ccM+0Mmw/Npk4b4oK9Vn4hxUux1GvoF3sDLee7TOpnXZi9RRH2W64KOkMwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DFfdhqkN5f+dLAf3ckRqYnOITmNbE0RsTTEp+5tRzUA=;
 b=TquwJ5OFkkgiPdLR3c+nQf2O3nKHD7odVF2ToShJCvHPCuNBNdZkR9bnMPLy4kYSbADPF6Pjqi3CoMCD+/RwUa+gUu0GrmCO8OFfHkOFIANhPG9emM3H/LOK5HnwM43duq9xekTi9WGJjzs7xwzpZ6bTVWCxS5Ezo3tELq9MMo4=
Received: from SA9PR13CA0094.namprd13.prod.outlook.com (2603:10b6:806:24::9)
 by CH1PPFE5ACC0FD2.namprd12.prod.outlook.com (2603:10b6:61f:fc00::629) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Fri, 14 Nov
 2025 08:43:27 +0000
Received: from SN1PEPF0002BA4C.namprd03.prod.outlook.com
 (2603:10b6:806:24:cafe::8c) by SA9PR13CA0094.outlook.office365.com
 (2603:10b6:806:24::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.6 via Frontend Transport; Fri,
 14 Nov 2025 08:43:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF0002BA4C.mail.protection.outlook.com (10.167.242.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Fri, 14 Nov 2025 08:43:26 +0000
Received: from [127.0.1.1] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 00:43:23 -0800
From: "Yo-Jung Leo Lin (AMD)" <Leo.Lin@amd.com>
Date: Fri, 14 Nov 2025 16:42:23 +0800
Subject: [PATCH v2 3/5] drm/amdgpu: add UMA allocation setting helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251114-vram-carveout-tuning-for-upstream-v2-3-4f6bdd48030d@amd.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6451; i=Leo.Lin@amd.com;
 h=from:subject:message-id; bh=dg42Tb+XwhTt8dd+b+sz7dS2nNLCCvkw6t6JevMPZSs=;
 b=owEBbQKS/ZANAwAKAV8XsZZKKe6GAcsmYgBpFuufiBJe5bO9dXhi3+awjG52oB1KYp+TtSoJe
 OfjX9oBpBeJAjMEAAEKAB0WIQQzqV4kW+yguuqHrw5fF7GWSinuhgUCaRbrnwAKCRBfF7GWSinu
 htPnEACmMXwe09zb86Eb7CFwYijr6qjIUFDRgZr3at8Kr7PXk3xrWgzhv2eQdoQCc9SHlQ4/IAy
 huX58EUnamUCddxulKMb/KUdu8+b5ziGJyyYJdE/uVbCIVICTYIpTH8G/BNq40uiJE4X9mc0bRh
 08FtYC7/JKTvUKMOX0gjNzAvuiP7N7yXwu/OoxXbe75ubaJPmmvi+jbboFiLSh4gm6HmekznCsy
 /1DqUCnv+o7DL3+oigAkb8fZPRvtc8polWDXI+FUGKgHQPUkvv4RL8Noh055uQO6ljxxhAiyhOx
 c6B1BnHemwfj8oxeSISwJfppVSXNdY957A/AH33GFOLCsEhhIV5usLh2K24Hl6DAbASuHlyog2c
 YjGPSjWNkVj/dqhNPuzMokIEUcPObSmNXVrabX1MChyGAUnGt/9SDsTdN4kr+YnP/N8vq3lKvlY
 cNc//l5EK7uswVwp0Wqiv/K7ZGVFELCVacW9SZzC8kHaTAtQ4XPpg15ed7c9+7+gockI5+aLDVI
 Wo6uK71bMbUzvQA32rwMM2qJBjZWeqxMt2IT8K1dO3VwAB7AP/icxQOkL3bT2Zfb0uVGWlzmN+n
 wo4rVRVMhBbfhSk7/r7sCK3fKjQeC4TGXeUdql+Irk2/Z/Y5lSqZyHeQgUg1oi0xpCMLFZJSALI
 Qq5lLjgIoa69gog==
X-Developer-Key: i=Leo.Lin@amd.com; a=openpgp;
 fpr=33A95E245BECA0BAEA87AF0E5F17B1964A29EE86
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4C:EE_|CH1PPFE5ACC0FD2:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d2bacb5-7bdf-4725-3b04-08de2359e0fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|7416014|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MmZ0TnJhNW1vWGV2bGIxaEk2T3BVdWJUTG8ySGVacWdPVXUxRUYyamZWZXhY?=
 =?utf-8?B?QVExeG10M3B0V3NRZ1RPVElDY3plRFRua2dpN01aU3EvdW5vZUIwRVBKTUxF?=
 =?utf-8?B?dzJOZmhQd2h5VHpxWHNycFBmQUhEWmw5SWZBNUJiMWk0MzJnblJKTFJGY0Fs?=
 =?utf-8?B?T2VLS2RwUXhoZEtGVnJ6WEg5VWRmRTgrVXFuc2VBdUVQeGVoVFFSdEF2MHhH?=
 =?utf-8?B?ZU5SYjJ5aVVLMndjVjM2aklFSnhadUtSS1BwTWQxbHJ3NmlSVElLK0xiMkVD?=
 =?utf-8?B?ZG9GdDk0WHVmbWNzM1Z2a1ZLWkNYdXYxanRhSEtpdlBOLzh0OWJ6eDlDTHBE?=
 =?utf-8?B?bTBYOGlYdDRsL0VvQTZyRmp2blB4eU1vL1hYR3YwWVdmQW5XVzdWMWxYT3hD?=
 =?utf-8?B?cEhoYUd2M2tCdVlkL0xwTjRvQmtIL2tqTjJub21KVGJaQm9CUU05OGtZaFNC?=
 =?utf-8?B?cUZyQlJ1NjJ6YTY4RzRzSXFCUHJ6K0FEcTExMWRwbTdCSTQzRXVLWmlvYmdp?=
 =?utf-8?B?VVg0WEhjUnJqK1RNWnhVU2VLQzkxQzhyVmpxQm40RWlJeDB2Wm93cU8wdGtu?=
 =?utf-8?B?NC91VVRqRFlUOVB3R21CRGlEMUNLNDBsaUJaSmZadlJvZWdNZXhGYUhTVmNS?=
 =?utf-8?B?UUlSQUZrczNiYkZndVFtOVdNTWVkcHdyaFZCKzE2Zko3SlF5NUJjYWw4ZjFh?=
 =?utf-8?B?WVo4a3NpSFMzd3lVMzcrcjJHendITytxRGxlZXdjRHBMVzY1alJva3h6SlNr?=
 =?utf-8?B?dmJsWW9PRFRYUXU3UFVaU3dORjJQbGdBNWVVMjY0QmhVTHhVSXFPUXV1TDBy?=
 =?utf-8?B?RXFMaWpoendpYUQwTTFQMU93SHVCVEFPd3d3dCtiUGpHSnBUTWxOcXliTzll?=
 =?utf-8?B?NjJBTzZxVmxNY2xJS0Vacm5Nc2FiMEFkUlFPbDRvdGp1d2JRWkdtdXU2OWhB?=
 =?utf-8?B?ZFVQNVNCajFhK2plRzRzc1lwdVRMYjIxaC9DTnN0TVRNTzEwWDJhb0NLUGNk?=
 =?utf-8?B?UjdEeG5wSS9hQi9TN2FRM1JjTkJOd0RHYU9SWTdPMXVFR3U1OEZMYkVoZE1n?=
 =?utf-8?B?MFkwN0JjZlpYeWt0MFBDc2xIeGkyZHpVc25yVjJXbTBXZm44eHMrVjlBeDBQ?=
 =?utf-8?B?VXh4SENmZ3FxMTh0eTZ4RHptRTRYTlI2b296QnduTXMzUElTM1hMWmJVTGFl?=
 =?utf-8?B?UE13V1YxSXViQzhUNXVac0g5ZWR4RnZXVWtVMWI3VXc1ZlpnMnd2cVp4V0M1?=
 =?utf-8?B?ZjhnaE9XN2xJVFdvTmtzMFV3WVZnczZKODBSSVFrOU9YSVBsRU8vK3BSZm56?=
 =?utf-8?B?SE9idkNyY0RRbDVVUHRzWGR6cVZ4czZvSzR6SXV0YzFpeGJqRFFlSWZjOVdU?=
 =?utf-8?B?c2VqRlkyZ0x0RDZqR0hEenFsci9EakthTjlHUTUweW1CNWd6enBSQmdmR1FC?=
 =?utf-8?B?QWlpTFZ0YWNRejdIaEllcko1MExlRTdhTmpsN2tONHgvUjhQaDNkU3ZLNTRT?=
 =?utf-8?B?NE1FYnNrVGdGSEt3a0JwNzZaWjZ0TVdnSHFVOGE1ZWljMEFyeFJiVzBYcjh5?=
 =?utf-8?B?YnV3d1plNDlXOHZ4akk4WmZCekxEQ3NuZmx6YmE3S20wTzEyYmdJT2Q0bEsr?=
 =?utf-8?B?NkphRWxzbm5ZSnRzNnU2WWVFQ00xcWNZK0JRU3JxZDBrZ2pZcVZhR3FIamlW?=
 =?utf-8?B?V1g2MGVUUUw3eFY5T2VEMXA3SjVLYWpMa3JpbXh6QXE1Q2tuUzF0SHFTa21V?=
 =?utf-8?B?a1VPczlGb3FuYkE4T0hTVWN0UzRoZ2ozd2RrU2FmcGhBSlNhb1dmWEFmV3ZB?=
 =?utf-8?B?U09TMWF6RXlPd0ZnN3RWU3BVc0x0SnpMYy9lRlZYT1RvVmdOLzJ2UGIrWisr?=
 =?utf-8?B?aWx0TXVwVG5OcUNmZjlNaEhkcVF0SEFpWTN6T1hFRUhqZ0ZsT2loSVNKT0xQ?=
 =?utf-8?B?ci9CWUlsVTVQLzB3dXVUbXJQT2J6UlFDVnd1UFFQaEt4Ymc5dXh3S08xdnVq?=
 =?utf-8?B?Y21ITXQrejE1R2dqUERaZHNCTzdpUEFSeDVKOU5BQzBxV2lLSUlPYVozM3FT?=
 =?utf-8?B?OVJFek1yQk5YWGpWczFQbTlmNFIzNTJMVGo1a2hLYWNDYzJoTkgvNkhHZmIz?=
 =?utf-8?Q?CGQg=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(7416014)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 08:43:26.6277 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d2bacb5-7bdf-4725-3b04-08de2359e0fd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002BA4C.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPFE5ACC0FD2
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
index 2c1123291577..ac5e4fb17ff5 100644
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
+int amdgpu_acpi_set_uma_allocation_size(struct amdgpu_device *adev, u8 index, u8 type)
+{
+	return -EINVAL;
+}
 static inline void amdgpu_acpi_get_backlight_caps(struct amdgpu_dm_backlight_caps *caps) { }
 #endif
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
index d442dc442d34..444ab4102168 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
@@ -671,6 +671,11 @@ bool amdgpu_acpi_is_power_shift_control_supported(void)
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
@@ -911,6 +916,44 @@ static struct amdgpu_numa_info *amdgpu_acpi_get_numa_info(uint32_t pxm)
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

