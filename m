Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0F21AFF9AB
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jul 2025 08:23:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4932410E872;
	Thu, 10 Jul 2025 06:23:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="RLA7hKfR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2067.outbound.protection.outlook.com [40.107.243.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9BA910E870;
 Thu, 10 Jul 2025 06:23:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jYaIuzOiBSVxWhxBycXTZ14haHO7yz8viwhMpv24aoeFLyJ0ptffVPlNNH5har8fGbYjRGcVNXMgRzIMLKZXIvSP5ILnKMqdoNX8rnIvRrElS0HLWbkTIrsS92wGX7oYIDJvMcXwEAT3ljrcQ1JjDAIQvT2R/37p0Q2HBWfh1iPEnGQTYqXdNw6TJ0WQV9cOFbmeZk5RH3JGMLPN2pfm0DQBQbndZ56IBt3xA0+cp053Scpp/bNlox/KwIzBos0bDgEHgZbf6Gj3K52kmKskT+z56mhcnpOg5VB3GoE+Br4domm7FEnotabDUh7ghhKj6f0ZsHI1SynxW+2kHP8mFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C3Z4oLBNeoS8a5Ppz0+Y1yVN7K+UMdF+6X/wKhVC8Pg=;
 b=FuflTPl3h+HZxkhisEBgwAnP/GugxG9CM3UsRmPiwybkihCeOP/Nr8INa1gk33miI0jXOQ28Fk1hT4UBnbhUaN2l+qG3QK8Lv1ZCwBNoyRRnfBhSgJ3zqdIqbBUdZ2G40lvMGduG5C6uoNDrWmaT7TkqlWcFOozWFsFOCaR87q/+jFaCYWkQAses8UEo+1ZLeH/GgYNUm11ZggdCeb7QwZosWiUQILreqmj3/9/Haj2qM/JndFtn71rpDZ1Fz5pqLqs6El8a5KWl40bHbl0hUiJdbmWaWgceTzam8uLoVI2sz/6nJub8zJH/l5mWtPJ91kAkKrzOiY+Waafd0rJiuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C3Z4oLBNeoS8a5Ppz0+Y1yVN7K+UMdF+6X/wKhVC8Pg=;
 b=RLA7hKfR2TQaKj/Sq74sbFhKvXfA2tJjkGeWYx6UMgtvS7fACexx5ShyyOiCKoV4ikBcjk3r4lWGGJP/SC+L52UAyURUsCYtI3Joy7qBBrf7BT6UIJJEeMj61PpUO9WjYGt7TZ2sG4/8Q9JnJPsCd9SRttIYAT4a5H5F3K8VhaE=
Received: from BL1P221CA0016.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:2c5::29)
 by SJ5PPFF62310189.namprd12.prod.outlook.com
 (2603:10b6:a0f:fc02::9a9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.30; Thu, 10 Jul
 2025 06:23:34 +0000
Received: from BL6PEPF0001AB73.namprd02.prod.outlook.com
 (2603:10b6:208:2c5:cafe::21) by BL1P221CA0016.outlook.office365.com
 (2603:10b6:208:2c5::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.21 via Frontend Transport; Thu,
 10 Jul 2025 06:23:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB73.mail.protection.outlook.com (10.167.242.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8922.22 via Frontend Transport; Thu, 10 Jul 2025 06:23:33 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 10 Jul
 2025 01:23:33 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 10 Jul
 2025 01:23:33 -0500
Received: from hjbog-srdc-41.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 10 Jul 2025 01:23:27 -0500
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
Subject: [PATCH v6 1/5] drm/ttm: add new api ttm_device_prepare_hibernation()
Date: Thu, 10 Jul 2025 14:23:09 +0800
Message-ID: <20250710062313.3226149-2-guoqing.zhang@amd.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250710062313.3226149-1-guoqing.zhang@amd.com>
References: <20250710062313.3226149-1-guoqing.zhang@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB05.amd.com: guoqing.zhang@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB73:EE_|SJ5PPFF62310189:EE_
X-MS-Office365-Filtering-Correlation-Id: 57357fde-a40d-4005-9d82-08ddbf7a4bf7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|7416014|82310400026|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Yy9HRkUvdWpqa1JIcTRFZmZMc0lLZHZBcGtpQnI1bWFFU2lYME9oL2s2cFlV?=
 =?utf-8?B?ZGtJNENyZUhuK0ZhOTY1SnJnd2ZqdEJydDFOK01aVFRpQ2pPWFcxL01GNWFW?=
 =?utf-8?B?TERtZllyWkN1U1duZnduNjUyUWNjcGdEcmhUTnVOczNyQk1CN1B1VUhyR0Y0?=
 =?utf-8?B?d0d6eXJjZ091ZnlUWEgyVmhnN3p2SUlGWHNIVnd2VnZsbXVzR2pmczhDYTBL?=
 =?utf-8?B?NkFqQWxxSWpqQnp6TVZSdEg3bmpVeG9rbUNZNVJUSmd4Tm9xaW1wVW5OdEpU?=
 =?utf-8?B?TENnUS9VekZka2FPaXNSWWwvZlE2TkJtR0o2MTUrQ0dPRjZWUkFLMkp5ZTNx?=
 =?utf-8?B?MDZMakNsT0VBMzd6SlhwSFBVL3ZDVFZrYVJYenRlcVdvMWdJS2NtQ0duZkpk?=
 =?utf-8?B?emJwK3BXb21HMXZ5dFBuR0pYUTN6SHVnY3hrekJpQ1RETlU0c28xRmRjNGxu?=
 =?utf-8?B?RS9FOFpxMHlEbmt1cUgxRmIrQmdpbGxBek1tOHZaMnBsdURGazdjeW9Xakgz?=
 =?utf-8?B?UzVkeEhVUUxxVURaOW9kUHR0WEcybDVTeTVqMURJSnVaek5vcllGbnBuVXMy?=
 =?utf-8?B?SFdOK0hYd2FQbTMxQmMySStxaWZvTFQyMU15L0h4Zlg2RUkvZHFkV3g2R3Rx?=
 =?utf-8?B?bG8rTzYwdXh1cEwyVmtZbnRUdHNVYjE2RnZtL1Avd25vMDRDYUJiTEhHQTFM?=
 =?utf-8?B?MVpiY3Q1WTRjMnR0ZGFBMkdLR0RPMW9WUTdCYWQ5SHNIOEtab1hKbExQMlVt?=
 =?utf-8?B?dXl1dzlvQTVTMGt6QUFEMHo1d2dlTEQ0SVUxN3JUTk0ybUd0M01WU2ZoaUlS?=
 =?utf-8?B?L0pPSWdYZml1YmNSM2dqYnFlclg4MnBCQUtST3FwK3hVc3NKZDNVenhkaWRF?=
 =?utf-8?B?Smd1SHQyZjFweDNLMVRaNDcwZlAvNkxGTXUvb29lODlDR2lLQUxVWmJJMXBx?=
 =?utf-8?B?VWwyUGozWTI4clFXZkhaSC9ZTmd4cXNHRVY2Tk10S1pqM1Fqd2hsZ2hMS1ph?=
 =?utf-8?B?MHZLcWtpMHB6WFVhaE15S05USUd2SWV3SXJtMk5xcVp6NGMrRkhPS3c5REg4?=
 =?utf-8?B?T0tZdEJvc2RGUCtFb0dQMU9zZ2kyVndxY0JIdW5rL1NBN3lGNkhMaW9NSisr?=
 =?utf-8?B?SW4rNFMrb2t2bVUxQXhxV1FvM2hHTVFjWTltWFpHL1Z0RXNZOVM5ZUdHSFdx?=
 =?utf-8?B?MFZkMXNCcjRzQXpFYkdqdlNucHo5SVlFRDVMVjNmWXgyMTlObHcwRXJTTEFY?=
 =?utf-8?B?SUZtZTVOa3ZSbXo3RS9RQmJRQklwWXhiUE4wQXJhV2tzU2lOUnJqdVMySWtQ?=
 =?utf-8?B?SHpqaVVEYjVQVGZsK25IMGdZUENhZXltRDJNRk5LNW5YYXp3MDhUeHJuZFUr?=
 =?utf-8?B?Q2hsbjhua2QzeUY2SW0wVHJWOUNnb2JIZjhBbGt2U0JqbUtFQWlTekVhcG5m?=
 =?utf-8?B?bi82bE8ra1Y2dFh3ZDZUWlNzZ2VFWm03UlFMYlJNYVBpa2ZWdVhuMXJJQ2Ro?=
 =?utf-8?B?d0lxVWp2ZDdvRzZXd0RBMmJYWUU3SGJoOTJib1VpL1pka3VHc1FHWVhObWJC?=
 =?utf-8?B?YmtkdjRBcFhlQW1ZYkNHYjN0a2NnM2lDckh3OHNIdlJWbVhyZzQ1M0dnSUtV?=
 =?utf-8?B?Z3BoV1RJakFGOUxlV1ZERUpkZ1p1dG9lU2RWZHgzc1RSNDlkQ2hxSWZDSS9s?=
 =?utf-8?B?MkdzRXpyNEtFYmwvZVBmUHNDZGNnZytrdkhMUVI4bXdsaHQ0WGtzUnFWdEpP?=
 =?utf-8?B?QXcwVGRqVVJiMmxNbHNuNW4rdy9PaE1ib0NuRnlKdUlGTllybEFoUVJIZDJl?=
 =?utf-8?B?WEFWeVlabFNGaklmdGJTVFAzd1JMN1JvcFBXWEN0VHppNFVnQWRrTUo0bzRX?=
 =?utf-8?B?WGN5REg4d0RJbWFxMkcxWUhRTXYyTkh2d09MU1NZdVM1cmJkSWFsenIrYzlt?=
 =?utf-8?B?aWg0SmQ3NmhNSzZ2WVFiM2NNaGZpSFhSZ1BBL2Y1YjZWOWRicHFaSzhudFBw?=
 =?utf-8?B?V1QvOHZNQi8xNUo1Q0ZncGIwR2o2ejA2U0dQSEZlbm80ZW5kZ1BEOHhiV1BF?=
 =?utf-8?B?UUZDN0ZzRG5mOFkwMGxGd3FWYmZqY0dhL2ZOUT09?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(7416014)(82310400026)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 06:23:33.7478 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 57357fde-a40d-4005-9d82-08ddbf7a4bf7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB73.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFF62310189
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
 drivers/gpu/drm/ttm/ttm_device.c | 22 ++++++++++++++++++++++
 include/drm/ttm/ttm_device.h     |  1 +
 2 files changed, 23 insertions(+)

diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
index 816e2cba6016..c3e2fcbdd2cc 100644
--- a/drivers/gpu/drm/ttm/ttm_device.c
+++ b/drivers/gpu/drm/ttm/ttm_device.c
@@ -125,6 +125,28 @@ static int ttm_global_init(void)
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

