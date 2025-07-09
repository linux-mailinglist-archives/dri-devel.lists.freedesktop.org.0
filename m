Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7367CAFE4FE
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 12:05:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE50310E795;
	Wed,  9 Jul 2025 10:05:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="VYZVsKZR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2073.outbound.protection.outlook.com [40.107.220.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1161D10E785;
 Wed,  9 Jul 2025 10:05:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GI2GDjCV0TLb6G6YbIbIcf6VSgdkOV9HBttAmAQioin2fSwIk3k+juTyQzm+haFGoykgxsbpZeWBKGIPw4axT6eZ0KOLAk0Ni7dYY5mWYBpzF3IrW4Nu95ZIy7+70TWiPd+rEciAEem0SwtVFl0ivzrQTMqWhRONyJYPPgs1LErgg0ulalRaRXySS791QspnXuSYmlNhCh0vO7yg7XU61Es+gsk0vH1TDwJA9IV6cNmKJdtYKGp+4D7DJXQ2YyE3zH4xQXjy2S4ZgJ/VQSeKkq1eJTsCIycI/iZjoCqCyLsM59isEx/vPQkncK4RZn4YnomBG4s5QYh9d/PuhIVRJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XTRSVa2DGfIa3N2ZrPVZSMaNXu2+Au1JeBXVqDuQKsU=;
 b=SuIUEhUK2hPE41tBC7Ei9jC+x+gF5zdgN2eTZ3a7T+sHr3aIwEaqxIU7IQPIPomeiSEPK65RFROFzm1lj2ozcObZyItYPdAE0xKGEhTbdXKxoRNm5ejSz0jceMCrIK7rfYrVLEgDKwxveAGBUkVDQ1fnzuCqfg21TbOC8FAdWYe/M6EVJGlcSu44zP8Pp+e3WxPcMvTW7SiQPIrrtcye5kpxN7VK8kg50m7ePj6fu8vhFJL0HFOOteKu1XmKX1RVAtK9PvgpfhspwSsWPU20c42cpXngx9qjSaV+cFyply6c140hWejYWbFXop4q4A4i/hShgxYDNWC2LliodennPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XTRSVa2DGfIa3N2ZrPVZSMaNXu2+Au1JeBXVqDuQKsU=;
 b=VYZVsKZRAziE1puWUKxrwtDq/wWn3Mxak5FSy5QAWRXbJIusNYwqG8U1ljKDcIp6xFRZ7DL7OzHtEKn8AnYNZh4He3LUQiqboiNloQRhbgbgx4yCyniMdg+ikPtw18SCTXQ9xLyDmtAHdaLs4qEO66k8eNPcJTf6zntKZSZUBBo=
Received: from SA0PR11CA0122.namprd11.prod.outlook.com (2603:10b6:806:131::7)
 by CH8PR12MB9791.namprd12.prod.outlook.com (2603:10b6:610:254::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Wed, 9 Jul
 2025 10:05:37 +0000
Received: from SA2PEPF00003AE4.namprd02.prod.outlook.com
 (2603:10b6:806:131:cafe::5f) by SA0PR11CA0122.outlook.office365.com
 (2603:10b6:806:131::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.22 via Frontend Transport; Wed,
 9 Jul 2025 10:05:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SA2PEPF00003AE4.mail.protection.outlook.com (10.167.248.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8922.22 via Frontend Transport; Wed, 9 Jul 2025 10:05:37 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 9 Jul
 2025 05:05:36 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 9 Jul
 2025 05:05:35 -0500
Received: from hjbog-srdc-41.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 9 Jul 2025 05:05:30 -0500
From: Samuel Zhang <guoqing.zhang@amd.com>
To: <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <rafael@kernel.org>, <len.brown@intel.com>, <pavel@kernel.org>,
 <gregkh@linuxfoundation.org>, <dakr@kernel.org>, <airlied@gmail.com>,
 <simona@ffwll.ch>, <ray.huang@amd.com>, <matthew.auld@intel.com>,
 <matthew.brost@intel.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>
CC: <mario.limonciello@amd.com>, <lijo.lazar@amd.com>, <victor.zhao@amd.com>, 
 <haijun.chang@amd.com>, <Qing.Ma@amd.com>, <Owen.Zhang2@amd.com>,
 <linux-pm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>, "Samuel
 Zhang" <guoqing.zhang@amd.com>
Subject: [PATCH v5 1/5] drm/ttm: add new api ttm_device_prepare_hibernation()
Date: Wed, 9 Jul 2025 18:05:08 +0800
Message-ID: <20250709100512.3762063-2-guoqing.zhang@amd.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250709100512.3762063-1-guoqing.zhang@amd.com>
References: <20250709100512.3762063-1-guoqing.zhang@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE4:EE_|CH8PR12MB9791:EE_
X-MS-Office365-Filtering-Correlation-Id: f25d19a0-abaf-4b22-ee8c-08ddbed026e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|7416014|82310400026|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WFJKL2R0V21IcVE1cTBJZndQU0g1bVk4QmVqYUVXZ0xCbXJHelFVdXZ4eG5Z?=
 =?utf-8?B?NXFQQks4WURTUU4zZEZmTHd3Q1V0NEZZSC9RTkxwQWw0Y0pmN0ZnVHNFbHRm?=
 =?utf-8?B?N25DZ2hEYS9MT3pzVTN5cFZCTFMrS2dMcmU4bWhvZnl2QXBuNFc5UW43T1hU?=
 =?utf-8?B?aXhkUVNPcmNkK1d3K2RHRE9vbmhjdGZsazN2OTdyN0ZjNTJaYmhURC8vcTRG?=
 =?utf-8?B?Ty84eGpCS2ljS2dwS3RDdWhJNUxpcTJ0TXBPcGtMdFd1QlNVR0pkN1p0ODVl?=
 =?utf-8?B?YnNLQnFaRUZtUWc3TjAyM2xyNEFxT2QzN2dWcnp5MDQ0RmdMc3YvZHpMSGp3?=
 =?utf-8?B?MVM2NHVXcmk0M1pXNHB1NXRFeXM5UWRNdEZ0TzAycStoVFRsQnhXQTJWYWt4?=
 =?utf-8?B?SDRIMlhUank2czJ0YkhMVlNZQ28zT3V0cGdIa0d0QzYyUi9DM2RQY0x2M2FU?=
 =?utf-8?B?NFVaY0Z5YW9wb21QazhnNC9TcFE3U3lLcDBUaDVPeGt6eldNOXRsSEI5NjVP?=
 =?utf-8?B?ZllYdXRLeDVpaHVBL0R3ODFyYWVrOGthUEpjbUtSOG1RcGlieVdFbGMvT0F0?=
 =?utf-8?B?WUVOd25MN2xMZW15dmZzaGtYZmpNbWd4SEZFYksxL0RDb1B2bnoxWW8yTmRI?=
 =?utf-8?B?SGJ6blIzUWV2SGdSVDZxRGJENDRKS2FBZHdTckZxalFFWnczR3BGQzNSSG5M?=
 =?utf-8?B?NlIxT1c5VVZlOHhLQ3lNQzExemhySVR5R3Exa3N5b1NmOXpPaS9vYmxXWHB3?=
 =?utf-8?B?TlhqeUNGWGRla0hvNmZ3SThHVVpmeXd6QXpnYUNyNlhaSGhBTlpMeng5d25Z?=
 =?utf-8?B?a2JHUTcxYzB2Tk1EKzlUcFE1RXdIVzVQeUUxL1BPd1RnVjluRFpKRSs3WnBT?=
 =?utf-8?B?a1Q5M3VPbHJ6b0N1R3A5QTRQMUw3ZGdjVjNaVENmK3Y4WjJFNWJWcGFiY1cz?=
 =?utf-8?B?b25YN1A0U0dJbk9GWlBaRndwSm1JWFZGeGlCWDQwN0gwRytLTWdlcno3d3dC?=
 =?utf-8?B?a1E1TnNkaHZVQ0d3amg3TnFsT3VTSHFiTjJVZC9xd0hWYTFFdVpQM2JJY3c5?=
 =?utf-8?B?eWxrSGRXTXM1cnVxZVVRL0U2YytKcnc4eUNiaVVqdXliRkI5eFFhMHRMTWhT?=
 =?utf-8?B?R3dnVVFQZ1RZcmdSem5IeThMWkw3aVpZOGMvNVN3Qk85YnUzdmtHcWVmYzln?=
 =?utf-8?B?QjZFT0Z5ckw2YW43cUtudHlzN3hIb1RTWXp1NDg4ek82T1B1SEdOY1krb3Fr?=
 =?utf-8?B?Zkw3YmRwT0VBTENjQnk1SUtYQXBxNWt0WklNcHZiTjJKWmIwcEtBS2NvbW05?=
 =?utf-8?B?eDRhb2lmYzNNSmlHREJUNTRpTVh6bUQ2MlV4QzFTTER4Tm01cVNJdFI4VTcz?=
 =?utf-8?B?Y3F1azQ3MW1yVzBWT2NwWFRHcjdMWFc0ei9lck9OZm1lUThDbXR4UXdoMmtM?=
 =?utf-8?B?UXdkTUt2OHdZdW5wN3doWUVxL216UDBXZEppVmlQVVNwaG5kMmU1Wm9zVENW?=
 =?utf-8?B?TkF3VUtqYk40R3BHdkFPSzk3Q2lkWENCOWtVOGZqUE5XU2ZqOEZiWG5iWm03?=
 =?utf-8?B?OHZaR29pbmUyWCtZd3ZpNUgrcVMyVzFYK2IwdEZwSjlsczA1NmNOc0VxN0hL?=
 =?utf-8?B?S1MvdU92VE9VU25YNzRjcGg0RVhoVnVnck1Qb25NOUxFNTk3QmJKZlhEUkpS?=
 =?utf-8?B?OVlyU3ZOOEd0QUw4SXN0Tm91N0w1YjRSaFpCSTYxZUg5dWZLU1kvRXdEUDhp?=
 =?utf-8?B?UzJIdGpvbXpQMnAxakxFSks2UGRUQUVSVUIvM21Kc2UrOUQ1UEtpN0FXb2ky?=
 =?utf-8?B?V2tUeXpPdTAyb0s3djJJL1ltM1pJTlJFVGQ3RU9KZkJhQXg0UlNpbi94OFpy?=
 =?utf-8?B?K0lhYXZzUDVDRnJtTDR4VnUvMFBVOGtQWVRBbWtYTXBMcVRsNlF2UXNYc2NN?=
 =?utf-8?B?bGg5a3QwSzFHQ0FwZnJYaU9kcDlEajBnaGV6SjZpZjZCSGZTZjVzUm1DYWdr?=
 =?utf-8?B?b1F3ODBpWFJ0KzBpSWdwNlZtSlFFbkt0Z2kyK3I1RjRpTlBybTBnL1pMYWRs?=
 =?utf-8?B?akp1VCtYOUdDa3NLcUJRUWxwUWZPTy9LUlNHZz09?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(7416014)(82310400026)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2025 10:05:37.0768 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f25d19a0-abaf-4b22-ee8c-08ddbed026e3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00003AE4.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR12MB9791
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

This new api is used for hibernation to move GTT BOs to shmem after
VRAM eviction. shmem will be flushed to swap disk later to reduce
the system memory usage for hibernation.

Signed-off-by: Samuel Zhang <guoqing.zhang@amd.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/ttm/ttm_device.c | 23 +++++++++++++++++++++++
 include/drm/ttm/ttm_device.h     |  1 +
 2 files changed, 24 insertions(+)

diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
index 02e797fd1891..9c9ab1903919 100644
--- a/drivers/gpu/drm/ttm/ttm_device.c
+++ b/drivers/gpu/drm/ttm/ttm_device.c
@@ -123,6 +123,29 @@ static int ttm_global_init(void)
 	return ret;
 }
 
+/**
+ * ttm_device_prepare_hibernation - move GTT BOs to shmem for hibernation.
+ *
+ * @bdev: A pointer to a struct ttm_device to prepare hibernation for.
+ *
+ * Return: 0 on success, negative number on failure.
+ */
+int ttm_device_prepare_hibernation(struct ttm_device *bdev)
+{
+	struct ttm_operation_ctx ctx = {
+		.interruptible = false,
+		.no_wait_gpu = false,
+		.force_alloc = true
+	};
+	int ret;
+
+	do {
+		ret = ttm_device_swapout(bdev, &ctx, GFP_KERNEL);
+	} while (ret > 0);
+	return ret;
+}
+EXPORT_SYMBOL(ttm_device_prepare_hibernation);
+
 /*
  * A buffer object shrink method that tries to swap out the first
  * buffer object on the global::swap_lru list.
diff --git a/include/drm/ttm/ttm_device.h b/include/drm/ttm/ttm_device.h
index 39b8636b1845..592b5f802859 100644
--- a/include/drm/ttm/ttm_device.h
+++ b/include/drm/ttm/ttm_device.h
@@ -272,6 +272,7 @@ struct ttm_device {
 int ttm_global_swapout(struct ttm_operation_ctx *ctx, gfp_t gfp_flags);
 int ttm_device_swapout(struct ttm_device *bdev, struct ttm_operation_ctx *ctx,
 		       gfp_t gfp_flags);
+int ttm_device_prepare_hibernation(struct ttm_device *bdev);
 
 static inline struct ttm_resource_manager *
 ttm_manager_type(struct ttm_device *bdev, int mem_type)
-- 
2.43.5

