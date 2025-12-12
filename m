Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E4C4CB82F0
	for <lists+dri-devel@lfdr.de>; Fri, 12 Dec 2025 08:59:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B5E810E56D;
	Fri, 12 Dec 2025 07:59:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="luuknRFb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011033.outbound.protection.outlook.com [52.101.52.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9032810E566;
 Fri, 12 Dec 2025 07:59:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tiz5RauYsULgrrTffjHIBoTY+hxVpbo/Ckq5Vgxbpuuo3O6PIEZriOldrOM7/dKKGPo45qzS/Nc7Mv7Y5IfUTcbR+ciL2u/ai5/CRA1scYYxG2GjykTpwwjdBdGDnk3S7+b4DjaGzPY3lIMWdXfzNm4C86d6kf8HLOK6Bga1Ni2uZkfKWZG1AjEtgnzLpNlxywrrBg5LB+7/PWsXDTqk1wjly4c2+FnFExoYw7rzId48TpShxs5/MOIOLfyvMYfwqNfz353LaTX3ZMNo2lbGC6QMGGwXxy0X1QOMamNo9z91nZPVJnnWfXQDgk7Kf4yeVg3trwc2WUsipQb0whmmEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dNHdvWdv0VSrnDeBDJ1DnvTDCpcSgm0o9fbtVqDN9bk=;
 b=oQ7qZG//EdcC7an3LZrj7ugcHqICLwCOuh1G0ZGnDvIEODQm9HUNH16k1lJV+7vRDD04UltM+k9pf90ojJp1MUwj5iYY0Vwi0iQR4jWSKalOXLA3+s7U66ITsV94szbBpiMA+0p9J/VJAbbfOnBDT6kgrk5J8/ZCzNZ676t/up+acV3P+oma2d2KtYuenFlBazRl/yc6uuUjUDhy4P4B0ZIXdmi2uEe7318ITpnVqkC3tOEl6EMrWa7oHJ55L6/iyMvDmRCz2xtscLX7opHk+BYnohpoXUXHP1mPujyp7T+X9lt/NXVhylbAuHhbLbTUX13nZoneW7dYJFiWSqxscA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=temperror (sender ip
 is 165.204.84.17) smtp.rcpttodomain=kernel.org
 smtp.mailfrom=amd.com; 
 dmarc=temperror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dNHdvWdv0VSrnDeBDJ1DnvTDCpcSgm0o9fbtVqDN9bk=;
 b=luuknRFbX9OPxSfP4R6FpRVofAF0yiKOBgTjHW2EEMjJS542tBERQWAxZfEGq85HYD5Z7JCvb0RhdAL0ANWF3+X9WN98t0n71x+qgEbdo9Zwp5rnko3CrPa1tFYIjZSkKj9hVbZsabLEPb6IPsto7DgXBFOFqqz9udjyFmlbS/g=
Received: from MN0PR05CA0028.namprd05.prod.outlook.com (2603:10b6:208:52c::12)
 by LV8PR12MB9229.namprd12.prod.outlook.com (2603:10b6:408:191::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.10; Fri, 12 Dec
 2025 07:59:46 +0000
Received: from BL02EPF00021F6F.namprd02.prod.outlook.com
 (2603:10b6:208:52c:cafe::c5) by MN0PR05CA0028.outlook.office365.com
 (2603:10b6:208:52c::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.5 via Frontend Transport; Fri,
 12 Dec 2025 07:59:46 +0000
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is
 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=temperror action=none header.from=amd.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of amd.com: DNS Timeout)
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL02EPF00021F6F.mail.protection.outlook.com (10.167.249.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Fri, 12 Dec 2025 07:59:45 +0000
Received: from [127.0.1.1] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 12 Dec
 2025 01:59:41 -0600
From: "Yo-Jung Leo Lin (AMD)" <Leo.Lin@amd.com>
Date: Fri, 12 Dec 2025 15:59:15 +0800
Subject: [PATCH v6 3/5] drm/amdgpu: add UMA allocation setting helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251212-vram-carveout-tuning-for-upstream-v6-3-50c02fd180c9@amd.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6465; i=Leo.Lin@amd.com;
 h=from:subject:message-id; bh=1JTUnYaMBwN88BupbbAJ9raQhG9A/tKHalgh9CtVNqY=;
 b=owEBbQKS/ZANAwAKAV8XsZZKKe6GAcsmYgBpO8thYpFYmhXlTY1S9PSyAzaMjAkVAi/ZqzOj5
 KxPIXldwz2JAjMEAAEKAB0WIQQzqV4kW+yguuqHrw5fF7GWSinuhgUCaTvLYQAKCRBfF7GWSinu
 hmrcD/wODrFur5v49b0dYdGIFh2HSN9SxSwZsU782lGlWPoleLq+ogGp1QietbCffffYab2PvIe
 J0gC7tm2WZnaClvoCWgfZe+ynKQxCdk0lywVH8sZjkFoQgSbYpttxNfMduQniHhmf7KntZW6Xuo
 zcqwtD/+TqJ19mQcD6pt0fD3Ln5ONOoLr2IXYFHl/6pk4kHRGvsyuJNu/rE8037oBHD3yjkt0e4
 ErjiDecNNyqV27iz8cQ7iPnSXqwgNAKBpEcfIUlpGtYJa/PpAwUWxbM9vvy2PptH+1IP30t0zAp
 oi4lP2xlrzIqs5Y6egwYfXTP7IQC0qwMTC8FeKGc99iMvPcp/C/T2bSLVo89KxHj1dp0RbWQYMt
 aOpHrfutz4qrzK1NXci3mQgAaXUzIUHOdV54cAqML2+eYJEdMT30IAT6M9gx125fZTNbc7VlmnA
 u4YVGalWN+F6oZcjjF7T7dZxXWE0SiTCveIJ+itWWl7t546OHnDQnQiWZ0nP2WoYg6S/a/fgUEh
 9AhMaAb0Lh2/OmUYu4QUWh3oJLKXO6LnIjYRmJugwheEQaFdaqxp9YqL5D5Tan0oKoMl/FwJQc8
 tjZOrAhsdUBRucTKjYnk46QNxdpMAnbmrHVSpSdF76y9XWaMkkaktcTTBFwYzAE6TClwGWCSumz
 hUHkuMhfpFT7bQw==
X-Developer-Key: i=Leo.Lin@amd.com; a=openpgp;
 fpr=33A95E245BECA0BAEA87AF0E5F17B1964A29EE86
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6F:EE_|LV8PR12MB9229:EE_
X-MS-Office365-Filtering-Correlation-Id: c36fe6c6-d1ea-4205-1c63-08de39546a48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|82310400026|7416014|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V1dROWgvZk1kN0t0NmYydTFLOFpzM2x3cjJabHVFWitQU2JHb1V3OWFqZjRQ?=
 =?utf-8?B?SnAyMXl5d2MxUWNSOVpSVnA0VmF4blk0bENVZXZqemowZW5VUWsrREVmNzNY?=
 =?utf-8?B?QStjeEtoQzR0TUJQMFRGbWRtWGdob0ZsVTVodGVER3l0UksyUm05U0NBak1z?=
 =?utf-8?B?QWFndzNRaHozeG9mcDBNcjVrVmVWV2xhUEpqZTF0NXMrNTFlQlRwbHpDRnNX?=
 =?utf-8?B?ZnlZd0JJT2dTMGRLa0Z0SlNLMlhRRUdrQVh0TDh2MDc4cG9MSG56VDZjQUNr?=
 =?utf-8?B?NU82SFdtRldIRC9tTUp0WUgvTzVOaENyU0FCZVVLaHVJTThNaGdnSDY1R2VF?=
 =?utf-8?B?NUR2eHNVVXg0WlNuRTI0Szl2U2Z5SEIycW8xc3dBTUcwT01pL0FSZEVHdGJM?=
 =?utf-8?B?elRpQVB3Z1YwWEVmYkhpK0RsQW5qOUxid1dCNVB4ZWw4NURMVWJWWnNlOFNm?=
 =?utf-8?B?MG1iVkRZNkdOVXlONi9pUjd5VnVuKy9yWC93MFJ0UnB5UkVUbit3N05SSXNG?=
 =?utf-8?B?ZWJjaU9pc3lxSFRkVUxpMlhIVEUvaDZ0ZEIxaUYrNCtJVU1mdHFxR3k2cjBK?=
 =?utf-8?B?UWQ0cWc0TjVhOFRuaE9pTU91NWNWMStjb1cyREJCSUtjUUcvZEowYVYrZGJr?=
 =?utf-8?B?OGh4eHZ1cG9kK3hwbzQ3b1BkKzRpUUJhNTMxbnVreVRpMUd3L0tMRXI5NXgv?=
 =?utf-8?B?aDEyYkcwaXh1bUhnaUZpb3RGVkhDY2xZWUErTi9Yc3hKbVZjRE1QeENjUG0r?=
 =?utf-8?B?VUFZT1VLQ3N1SVFqMmN1RXFxenpQc05VTUVpOVNaMlg2WktrSnBIV0FFQmhH?=
 =?utf-8?B?R3E3N1lUVm1OQW1kWkQrME51YVBuL1Z3bm1uZkcvc1NMVVFYV0c0VW5pQnFp?=
 =?utf-8?B?cFE1bERSeGlLOHpMUGtRSDlzZVRwTXZwdFdyNU9saGRUeUM2NkczdWRXZ2M0?=
 =?utf-8?B?RW05QWwyYVZ0eU9rN0hxam5OZjF0V0FqQUNEQVFrQWNrWVh4V1hid0ltT0pm?=
 =?utf-8?B?a1VFLzd1Q0FXQ041eXB4OENjWVVLWlBRQjRvaFk1SGhuNHpUbVNHSnc3dEgv?=
 =?utf-8?B?SWluZndRSjd2Q25KNUVYRm1vZzRxZWFpWjF5SkxEV1BSc1hWbUlFVFg2ZGVu?=
 =?utf-8?B?UmYvUkJJbVFSS29IcWxpRkdaNDhGQjhPcmZnWmI1UjdZS0ppeGNxK3U1Q3JU?=
 =?utf-8?B?RjJNODlZWU0xWWJvWVU0WWZJQVJCTkhNbnZtL2Y3aytzL2JHUmxrQnJLTDd2?=
 =?utf-8?B?TEVuaFQ2V2NRWXhlSE84LzFBR0d0S1RpNlFNYUVES0FiMWlEaFQyamtwTTVC?=
 =?utf-8?B?NmtxOGRJV0pSS1VldVVDb2p1eGZLVjBPWUFtRmJwdUdUZW9rdldTT1JhZmtU?=
 =?utf-8?B?Y21xZWtTTFVvNmVLYkZYcDdtbFhIcGNhMkJXcW0vVmdua1U3a2hLR3NDVUVO?=
 =?utf-8?B?ek13eFI4TjdHajByQXVpY3VjanNqcXZNaHZ3UmM4NzdaZHRpaU1LKzZWS3Vv?=
 =?utf-8?B?YWh2TFcxb3R3K2ZyOUhyL2gzU3NXcXZhZzZwai9SQllMU3RSc1h5Qk96eGFw?=
 =?utf-8?B?QVFsL05sY0JoaUd5RE9ncFNvUnJKS1lCRnc0ZXEyaW1DVEh2U1o2eVdWS0Jk?=
 =?utf-8?B?SElvRk1tV1phVmpZTFZ3V1c4cXZvbVZjVVJBdHZ6cGE1dUVEcTF2eGVMREV5?=
 =?utf-8?B?ZXpFVmFwc0NUZkpNL0daMjNQV0cxL1dRTExQR0NyajBXaTZwUWNxeTc4a1Bk?=
 =?utf-8?B?RkFUQlhVbnloak9NMUF5ZzloWC81SDUrcERxTEUvSURGNFlvcEZ5dCtnL3gr?=
 =?utf-8?B?UERVaXc5V3BoSWdXNDg0U1RPbmd3SFRmWGkyaEVvbjdQZmZwdlh0dDFOUDZr?=
 =?utf-8?B?NnFjVU1mOGRlTkhSL1FQcTlGWVNHUXFRcUhZemRmektJV0dXVjZBSTVVaTVN?=
 =?utf-8?B?Y1FYSDRaU0RDNjNyT3pHYkxGbVJzU0JzWXUwcUZoK0ZSUVVzV1hPQVFVSlRG?=
 =?utf-8?B?bGtybXB1ZkxoZnFpMmFGeTM2QnMxYXVudHVzYzZDcEJhQ3JpaTd3b2JXNW1Q?=
 =?utf-8?B?eDNCcVY0UUFzQ0c1amtmR1hwbkRhRmpodjlXcDg1Y0RCbGU0WXRwTFAyc1U2?=
 =?utf-8?Q?E8g8=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(82310400026)(7416014)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 07:59:45.5903 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c36fe6c6-d1ea-4205-1c63-08de39546a48
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF00021F6F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9229
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
index aca2ddddc64c..6bf626a51dfc 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -1720,12 +1720,14 @@ int amdgpu_acpi_init(struct amdgpu_device *adev);
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
@@ -1754,6 +1756,7 @@ static inline bool amdgpu_acpi_should_gpu_reset(struct amdgpu_device *adev) { re
 static inline void amdgpu_acpi_detect(void) { }
 static inline void amdgpu_acpi_release(void) { }
 static inline bool amdgpu_acpi_is_power_shift_control_supported(void) { return false; }
+static inline bool amdgpu_acpi_is_set_uma_allocation_size_supported(void) { return false; }
 static inline int amdgpu_acpi_power_shift_control(struct amdgpu_device *adev,
 						  u8 dev_state, bool drv_state) { return 0; }
 static inline int amdgpu_acpi_smart_shift_update(struct amdgpu_device *adev,
@@ -1761,6 +1764,10 @@ static inline int amdgpu_acpi_smart_shift_update(struct amdgpu_device *adev,
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
index 610449d73a6c..bdafcde51107 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
@@ -668,6 +668,11 @@ bool amdgpu_acpi_is_power_shift_control_supported(void)
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
@@ -908,6 +913,44 @@ static struct amdgpu_numa_info *amdgpu_acpi_get_numa_info(uint32_t pxm)
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

