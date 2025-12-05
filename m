Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE50CA644F
	for <lists+dri-devel@lfdr.de>; Fri, 05 Dec 2025 07:52:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0240710EA1A;
	Fri,  5 Dec 2025 06:52:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Juq4hEvw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012055.outbound.protection.outlook.com [52.101.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 745A110EA1C;
 Fri,  5 Dec 2025 06:52:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JH4zKflzqY+Lx38jjbXwMim0TDUqTVL6lutaUPBuXBSuA0r1rbAjFBGj9wJ7Uckr+MvGCWA/60wAPlBlAc9WE1J9q7s2yBiSruCb2E48XK2lHDBK81OejnlK/mTviNI707HtiDC6gY+dLWb+iUb+g+HhLzQcWGyPKN0sK2VmruDW+OfpmXQZL2VwiS2V3YGnHoQBLX3q9njfVbviLvoGbs4TgpZVA3Ys7y/mPzfD2fLcOo3LhWKWLLU9aI5b40MvL1GB56ZczhO63r8Tuuorwd3Wb42qjxdINUiZt9uQeqKxB1+6OVJKg8xdFkYs4LoS5DrwSN2rv6qTbszRPGW/LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dNHdvWdv0VSrnDeBDJ1DnvTDCpcSgm0o9fbtVqDN9bk=;
 b=LNhVoVEwTZTj6l81Ie/qXySe1ODxheQpiMFaMrWDY65bf71FLOxVaQW7BfWnmTICJSKuSO/pzntKxzpVx332Xo7Oxm3o8aSl2MdxPJZu7RFpUS9JPkA/ByULLMfh31oUl2Rz6KUND4hpYrB8CEmfVwush7T6F1V7NaPaBeKadUTJGLMyCKjDEh2/TxoZzg5ELWbtJWZmdRtGkrYI5tZ/LKZG5KvUZdb/RUfY42dlV3UCokPHhtN5UxiwLGN8U/6SaXr3FcY31CaaGkz4FD+3BIY3wH+hktCKsTuRhrrAWKgHoh2b9qLcW9Aa+SpY7BVBf1KKNO3xPfFYTHNgcB4epA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dNHdvWdv0VSrnDeBDJ1DnvTDCpcSgm0o9fbtVqDN9bk=;
 b=Juq4hEvwxlrvw5U98lh/BHigFXrswHDDw4+/GECzgMDa65IXUeVOqYsOlxTyJOM1rAOwWS2DW4MFbA8+tTfVqPQhDgmiI9M0JgVPpVOTYtP+GVevvilt9HjkBatoftfXiJvFJjjvOD6Lw0QB+fhi/JmA1ZZn8Odv0QiA7anyCtc=
Received: from DS7PR03CA0090.namprd03.prod.outlook.com (2603:10b6:5:3bb::35)
 by MN0PR12MB6078.namprd12.prod.outlook.com (2603:10b6:208:3ca::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Fri, 5 Dec
 2025 06:52:15 +0000
Received: from DS1PEPF00017092.namprd03.prod.outlook.com
 (2603:10b6:5:3bb:cafe::12) by DS7PR03CA0090.outlook.office365.com
 (2603:10b6:5:3bb::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Fri,
 5 Dec 2025 06:52:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS1PEPF00017092.mail.protection.outlook.com (10.167.17.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Fri, 5 Dec 2025 06:52:14 +0000
Received: from [127.0.1.1] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 5 Dec
 2025 00:52:10 -0600
From: "Yo-Jung Leo Lin (AMD)" <Leo.Lin@amd.com>
Date: Fri, 5 Dec 2025 14:50:56 +0800
Subject: [PATCH v5 3/5] drm/amdgpu: add UMA allocation setting helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251205-vram-carveout-tuning-for-upstream-v5-3-1e87cf3b57be@amd.com>
References: <20251205-vram-carveout-tuning-for-upstream-v5-0-1e87cf3b57be@amd.com>
In-Reply-To: <20251205-vram-carveout-tuning-for-upstream-v5-0-1e87cf3b57be@amd.com>
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
 b=owEBbQKS/ZANAwAKAV8XsZZKKe6GAcsmYgBpMoEDeCSqVlZFeTD+PxqSNZxKGa5iz4Tz5hYZ8
 VSpPz1ZbMaJAjMEAAEKAB0WIQQzqV4kW+yguuqHrw5fF7GWSinuhgUCaTKBAwAKCRBfF7GWSinu
 hvk8D/9+v54rrCNJD7qh8tr+IL1OrpSrEmRFJJCRgOcYqOWFzApUacLs/LpOvL/h+7aW0Isc2Tm
 K5ICcYYiMSg9KzRVaHD1v4fEf4ApTQDaTwA5r5mb9681ywZIu+Tc8yQmPmm5a6mRnZmsLjufrVu
 8v/D4PVaazOTx/tPR7H5oZ1oFS99sbXCGJccR85ieIb7VdQHWwDjtFPWeoYvZQU1bgUIVXMpVIY
 InQtr/NfpTWkVp42AnWbdN4aGy5OcpR3HVMjFq9G8NUto+7O11AqtTSgN5gzlLPs8KAaPyrrFtf
 MfLeEodH43duGv8oJu+kTY/YQb5rlyAUR+yM2Fr1NFGr15T4ZRuici+Uoo5M1C1f9hYUfGk92cU
 0EKkH0vDY/ckrp5GQRWQMhnvGYQn09bGV8ipWBMRELwDhZ43PS9DzhhbB+mv9Zpruf+4hRo+6mf
 DEN32TN3GFydEyfWeCJp5ZMnlUwyQO0G6I9sPvEgG+fyf2DmrfX2a1+cn+33atfFWjNSQta5wdR
 FsfOqxiD3DUqGDRvD0YxROSZho2Y3B4YGdP7pB1GPHHOYlQXxmhxV+Jzg61N+/b9UVSO8+tsQyH
 wC8Sq1ZjUF46b2+B5011RnzJBmq2zUpcN7L9l+m0eqcoo+jeLCw+Zpl3fHArOp4WupdEupYANIe
 4a3gkoia97Kp3SA==
X-Developer-Key: i=Leo.Lin@amd.com; a=openpgp;
 fpr=33A95E245BECA0BAEA87AF0E5F17B1964A29EE86
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017092:EE_|MN0PR12MB6078:EE_
X-MS-Office365-Filtering-Correlation-Id: f1a8ee56-dcda-4099-0f1c-08de33cad2c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WHZ2b3NRaDlHRmNkdUVmbndXOVRTbkpWUndTa0dabkZKdExtMG9RQTVnMTNE?=
 =?utf-8?B?TktKNnRnOXJCRGtKQzZwV2hDZm94ZWRrVU53OWliaC9aL1lYcitmVEFGNzZH?=
 =?utf-8?B?aVFsSTYyY2hvbzhtcGtFVXhBdlNEeHJ2WHNYZGwweFpQWm8yRnJkUTJ1QlZ1?=
 =?utf-8?B?cW5RVkt5NTI0dFNJV0RvUG5URlZFZmk0VjF5NXc1VHJSdlh6OXRFYk1OUDNz?=
 =?utf-8?B?dk5tTFM5Q3MxTnF1U0NFWEROZkc2SUkzelk1Nk9EYzBOTHdSWC9BM3VxS0RR?=
 =?utf-8?B?UU1ic3NncXZIWVQwZWV1bUxObDVGUjUxaXcwQ3pHTW1SOHlFSk9vWlBZbWpn?=
 =?utf-8?B?RWJFcnluZm9KdHRVLys4SG9lTUhJTnEzVXNUeUVqeUI1TWxlMnRtTytNUEl6?=
 =?utf-8?B?MVlXeE5wNmh2MFh4dDRTZGtzT3NBTXl5cXJlelA0V1V1ZGQ0aml4czFPa2hm?=
 =?utf-8?B?OW8xVi9YQVlCMVIvQkFNY2kxaWw4bWlPS1FJQjZIT0dSWkNiZGdrR2VyL1pT?=
 =?utf-8?B?QVJHTzliLzdwL2hqUGcrc2pkVFVmOU1vUUNDREppVVVpKzR4Vm5wdjdIZVEw?=
 =?utf-8?B?Tmp2QnFyTnhyd1diM1ZLOGlvajBqK2E5dldiS0grVXpxeUE5cXhka0xVQTFN?=
 =?utf-8?B?cEh4VHNUallOL2g3WHhTNzdxL1FFRzdoUWJwSWhQdWI4QytjSWxtbFphTWFT?=
 =?utf-8?B?Tk1GVEFzYUQzQTlhQ1BHalVmTEgydVd2bk1mQkVLdEQ5UEdpYVltcnlDbS9M?=
 =?utf-8?B?czVOS1pkVER4RWxtUmlCODdjRDJGNFd0YVNDVFBPY29xWTBZTnkwbHZMZmNH?=
 =?utf-8?B?RkwzVk9BR01qUkFReFJ0azRoNytnWHUyZ0cwenJtOVIxU3hWcE5kZmlid0ti?=
 =?utf-8?B?RGJyRzJRTXBUYjFvUDhSVENCQVVNaDhYekdYTFV0NUdWZ2o5UEg5QkJUdFRq?=
 =?utf-8?B?NjhIdmNTUTRYQnV6QkZWS2VqQkhxcXBUaG1zNUhOYUxYd1o0Y00yMTVVSzJD?=
 =?utf-8?B?VmUvb2dmaTA2Rk4zRmZuOHJSOGFFOWxCdUI1TG94YXFnU2FnNk1QTG5NR3l1?=
 =?utf-8?B?VWlzc0JCUkhDZzA2MzB5bEVJbkNMejBJV2ptRkNJeC82SFkxYW5TWnBJcnVU?=
 =?utf-8?B?bGhqd014c1ZhYzlPNnZIMWowblJKaWVpUHM2b21Fd0VJQkhuMlNpVGJyWUI3?=
 =?utf-8?B?WE1vbmhUcHhjVFB1Y3NJakRiM2xaRlEzUjlrOVNUOTFPK0FqdGkyZUZ5dURr?=
 =?utf-8?B?M0pQQ2lrQXhmM3lqbTAwdmF1OU9mNDdvMktsVy9lcG9QbXZqVGpBOFkzUjdY?=
 =?utf-8?B?Sy9IQWxMYWpCbE5HUDJXRi80NUN4SFl0OG1vSzhHdUxJaTAvRS81SlpMMTFO?=
 =?utf-8?B?dHZSTTJqMFdydEtRN3pHMko0MmwrdU02QjNrR25FNW1IVWsrTzFKeXFMSjZn?=
 =?utf-8?B?dzJrVUhDbmpSaVljOExETXFPYkljOXN5MW9BYXlOUVI4aFFHUGRraFFXUzNS?=
 =?utf-8?B?YmNsNEdTV2hZbjYzeFg5WFpMcjhtQmRBSFJzemVMU0ZXZlgrOUpqVm00NVpU?=
 =?utf-8?B?Q0tiMUdLbURXTnFpOFdCSGlVTnpjVzNZUFRDVGJjWFE3R0Zpay9mdUs3akZ0?=
 =?utf-8?B?T2lER0U3cnhlT2R5NTVoMm5nMXltbjRJaUFTOWN4ckN6VjZMNG9iZG9zemJR?=
 =?utf-8?B?MFZ3NWZkTTNQZHN0eVRNMzBpSmt1WGFOR1ZXdE9uYU50UXZ3bkl0a1YwZ1Ez?=
 =?utf-8?B?WEV6cjZGVCthdzdhS0lERnBXUWVsUytBSEplaW91bWtKZUwxeXRtTWJURXcx?=
 =?utf-8?B?OGt4TExsdDZnUSt1aVcvdjlDUnJUUTZ2V3ZCVmFTc1FxVlM1RXZIL0NoWWRR?=
 =?utf-8?B?dkUxR1FsUXJaeEVsSEpJNVhxWkxLZzFXd0o2ZVRQY2IwaE53LzJCTi9CZVNQ?=
 =?utf-8?B?dnZvZ3dGbktqRzNpSnZnNE81SU1OL1dyOEpENm54eXhkcHdwUkRwWWdnSzd4?=
 =?utf-8?B?ZVUyZXlST0lZU2VpOUJIZndNWmlReTR2dm9LOGFtQmt6VnRiZ0pCNVN4NzZI?=
 =?utf-8?B?dTZZd2Q2YUFDMVZWRDJyQkdnRmRCakxnenlwZXdCUnRvRDYreUJLVk9wVThK?=
 =?utf-8?Q?5Jw0=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 06:52:14.4813 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f1a8ee56-dcda-4099-0f1c-08de33cad2c3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF00017092.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6078
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

