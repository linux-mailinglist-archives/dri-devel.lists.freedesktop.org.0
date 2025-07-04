Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 244D1AF8FAB
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 12:14:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86ABE10E9CC;
	Fri,  4 Jul 2025 10:14:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="crq3aw+e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2051.outbound.protection.outlook.com [40.107.93.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A02DD10E9CC;
 Fri,  4 Jul 2025 10:14:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=At4yNhEaDpGdmZ4JE3213DWAjW0p9fJMG0uyyQ8A9I6rEF7Te5hF5a5a7yc/AfErEFx7qWRuMwVcOCG/gjwRwq3i7MRWaETwxIAo0Rz6Rg5nAK1uPIhHsUXRQke6xNrcWZzeNU2E3OIkZtkJu2IdgxV0IYl7P2aPt9CiH7Em/PBFSMrE/shKo3HbS1qBnVgAFoT2VFUe90gdj88ADF/zjjnufAe+TQILYkvHqoZnXKvhFaDYTyutR/1Jct/5HCoVB1ARhCNnf+6IgqG3xa+qKoRU4VjQHPAVnitaxIAzT0xyjOTcChcNpYZCpPdx/DEecVy34TeqsEb1QM/mKqQ32g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qDgMkhERxZUsPYLC/xIQteDtMz1k+K7qWV7n8Ev1GDw=;
 b=Z2JenqHOSDn3b1ewMPU243/IXUs2R1nH6RZZ8KjEBkQVcI+yafB9HouTWrS23ZayQK5FWilmaHqau50G0po9Bbg4oirg9UNHNTyaYgviRjF4YDW8c7QVUS1fROdpYN2PJm2fDTGEgUMPjmkxn8HCjJLs6B/vd64J6brdDX53V9SPQLB7nOeDhgC17hCeVmJYOrWCtIDuBV9Mm1QuJ7wbmUwqFtHmpaCxA6fg5enWOokfbgswuNScOyFVjsiaEibmaxyI4E0PMc6xNUoDPNXc6DsX/oCd9yBhSe6F6pvoNDN1fezWEJ7VUDE3q8HsvlJGa8gW93khUUKqWd2w59Z1Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qDgMkhERxZUsPYLC/xIQteDtMz1k+K7qWV7n8Ev1GDw=;
 b=crq3aw+ek9+pH+AyUiCjnm0zh9h63C7pzPg7YrzLp61UQ5louF2ooWTkYsjoOlKfwAeHzV1KjG1I9wRiBZ+vdyKAV25q+YbzzRpuX/FfrglQfhNdBo5ayPbG1YB3wET+h3wLmaPAC0kjYyx9lNJUkQ0kI+uuQH1GCkbBlJvJ4Rk=
Received: from BN8PR03CA0026.namprd03.prod.outlook.com (2603:10b6:408:94::39)
 by IA0PR12MB7774.namprd12.prod.outlook.com (2603:10b6:208:430::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.38; Fri, 4 Jul
 2025 10:14:20 +0000
Received: from BN1PEPF00006003.namprd05.prod.outlook.com
 (2603:10b6:408:94:cafe::c0) by BN8PR03CA0026.outlook.office365.com
 (2603:10b6:408:94::39) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.22 via Frontend Transport; Fri,
 4 Jul 2025 10:14:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN1PEPF00006003.mail.protection.outlook.com (10.167.243.235) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.15 via Frontend Transport; Fri, 4 Jul 2025 10:14:20 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 4 Jul
 2025 05:14:10 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 4 Jul
 2025 05:14:10 -0500
Received: from hjbog-srdc-41.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 4 Jul 2025 05:14:05 -0500
From: Samuel Zhang <guoqing.zhang@amd.com>
To: <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <rafael@kernel.org>, <len.brown@intel.com>, <pavel@kernel.org>,
 <gregkh@linuxfoundation.org>, <dakr@kernel.org>, <airlied@gmail.com>,
 <simona@ffwll.ch>, <ray.huang@amd.com>, <matthew.auld@intel.com>,
 <matthew.brost@intel.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>
CC: <mario.limonciello@amd.com>, <lijo.lazar@amd.com>, <victor.zhao@amd.com>, 
 <haijun.chang@amd.com>, <Qing.Ma@amd.com>, <linux-pm@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <amd-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, Samuel Zhang <guoqing.zhang@amd.com>
Subject: [PATCH v2 1/5] drm/ttm: add ttm_device_prepare_hibernation() api
Date: Fri, 4 Jul 2025 18:12:29 +0800
Message-ID: <20250704101233.347506-2-guoqing.zhang@amd.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250704101233.347506-1-guoqing.zhang@amd.com>
References: <20250704101233.347506-1-guoqing.zhang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00006003:EE_|IA0PR12MB7774:EE_
X-MS-Office365-Filtering-Correlation-Id: 897f841f-c445-4722-6afb-08ddbae38a80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|82310400026|376014|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?FyoVmVAIeHzrNuPQeyEiO6UKfn8bGw9gUricwmcxons/8LSMe2l0MLD9veRW?=
 =?us-ascii?Q?paFaGpsUg06vAvJWa7wNjoz1mWujT8xLGzt+5z/d/y+xvV2HcUuk2XT7SxZy?=
 =?us-ascii?Q?Px6buTtW+IFIuVaz/G2bsLA2Pkjdf728We30TNNc7UmqoJVSySk6kJDGOLMI?=
 =?us-ascii?Q?myG0kj9yQ9gzLJ/wfFvLwKteS9EPtUAk8fDuYjSrfUdlktHBUuOYpaOxTl0k?=
 =?us-ascii?Q?baiiPPzowwWbIJjXQsPb7Fzs7GqpybA9hnYSfDjWcBX9l3MldBVC4fHV8Sya?=
 =?us-ascii?Q?XXDmAYcbjArVOmmWl0A4UEGUxHnY9w2JS7rxUHF0Q/JN+cY1+Df6DBIxWv9r?=
 =?us-ascii?Q?DSy4aVrE17bmFju14VPVWMPmYS7/8GUA8uXFI2B2pMGY2uBFj461STvNZtca?=
 =?us-ascii?Q?3JX3PK2HPvi3ZXlXbN+2g2PjDQpXIVp+TO4N77QQawtOTtqqdG5EjPvFnFQT?=
 =?us-ascii?Q?cf+lHwjuo0G4DSGL+mdbF2MoeqGZrkSWkjLRBqp5c7XTGQJAAsGTqiwz0+t8?=
 =?us-ascii?Q?j8w7/oZe7cZ+U2UMELPJmx3By2bz3WZpAXpFpDK9EsvvBUHpOe/CLkow4eHs?=
 =?us-ascii?Q?Gx8DQoWTgbTr5vHyXdaBOSlqboqwW8kytJwkROPadBebjgXCmiymuyyipqlf?=
 =?us-ascii?Q?A67+QUvRHZopaplnFwWsoMoXdQwtSQ6+seKlffSIVLtD4f3fFzNgdBv1ePix?=
 =?us-ascii?Q?BvsonzY49xfwJlsyUdZg9iOuZ1yS47rfknAu9krX5Gpl1IhgXfJLPIhYwNzM?=
 =?us-ascii?Q?ziU/6NjjehtrgQLoQKnIzmHBW6elCA9tweCUlj/ORKRsimSU3YKD4J3OaY98?=
 =?us-ascii?Q?SLKgt+/AES9k9DeRNLj1/LVIdXEfQYIj+vf0td6EleSHxue6rKhlIwGmLa+V?=
 =?us-ascii?Q?OExBmapjXdh7gtgQEmimy8naHi8GDUd43/LgGc/0FUpGoH+ezKxylYNCr/Of?=
 =?us-ascii?Q?vnn8MRhHLbaTZjxtEyMZOiH7P3xVAX8q401wtpFAs/vJ53SDuVPO8qMg5K00?=
 =?us-ascii?Q?9JbfxYrrQP8ob2jiAKu3W6avAWnrQmByJDFjEooOjqWZcTYZWfbcLdVpKgMI?=
 =?us-ascii?Q?K6jHXWQD4DyFJYMhXJwu5LecgrjUmI77UnbNIob/gaiVCp8ROADu2oFpRlRn?=
 =?us-ascii?Q?4LnKDT3u0p/2xOVyMfAn/aEvVK6vSsq320kIBRkEUW+gku0qYMDJnTv4I2zU?=
 =?us-ascii?Q?au2k3NlXmGhceEY/q5EjinmYN2OHGpLbZOkSkm5K2Qev7FrhWtSlIL3vi5Y3?=
 =?us-ascii?Q?mGBEDUc5lHsqJM60Oq/yiKgIxF4qzW8ECPWf88DJbRBD2zCh1I7KNfwTQV5A?=
 =?us-ascii?Q?5HckRHaj74Ye9mwFk9PAJe4xl+R3KiqS9xsBNWeSB7RG7C+ERi31eFXt9/g5?=
 =?us-ascii?Q?Dl6y7oLDZA7xVhCHHjClI7I9LHYzsTzW5NoLMdfqmaLsNBjUfsnVueD+kOiG?=
 =?us-ascii?Q?We8dOub/X4OHQl+OiX+ImYnAf+7WA9G3KtK/8D622AUuP6MZadVrmrGeDjsM?=
 =?us-ascii?Q?1Awf4g77g0ju1uMFbRflV7pazvCf3DhSnLrLeAb5UjdahuSP7fEf6H4+pQ?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(7416014)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 10:14:20.0075 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 897f841f-c445-4722-6afb-08ddbae38a80
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00006003.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7774
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
---
 drivers/gpu/drm/ttm/ttm_device.c | 29 +++++++++++++++++++++++++++++
 include/drm/ttm/ttm_device.h     |  1 +
 2 files changed, 30 insertions(+)

diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
index 02e797fd1891..19ab35ffeead 100644
--- a/drivers/gpu/drm/ttm/ttm_device.c
+++ b/drivers/gpu/drm/ttm/ttm_device.c
@@ -123,6 +123,35 @@ static int ttm_global_init(void)
 	return ret;
 }
 
+/**
+ * move GTT BOs to shmem for hibernation.
+ *
+ * returns 0 on success, negative on failure.
+ */
+int ttm_device_prepare_hibernation(void)
+{
+	struct ttm_operation_ctx ctx = {
+		.interruptible = false,
+		.no_wait_gpu = false,
+		.force_alloc = true
+	};
+	struct ttm_global *glob = &ttm_glob;
+	struct ttm_device *bdev;
+	int ret = 0;
+
+	mutex_lock(&ttm_global_mutex);
+	list_for_each_entry(bdev, &glob->device_list, device_list) {
+		do {
+			ret = ttm_device_swapout(bdev, &ctx, GFP_KERNEL);
+		} while (ret > 0);
+		if (ret < 0)
+			break;
+	}
+	mutex_unlock(&ttm_global_mutex);
+	return ret;
+}
+EXPORT_SYMBOL(ttm_device_prepare_hibernation);
+
 /*
  * A buffer object shrink method that tries to swap out the first
  * buffer object on the global::swap_lru list.
diff --git a/include/drm/ttm/ttm_device.h b/include/drm/ttm/ttm_device.h
index 39b8636b1845..b45498b398dd 100644
--- a/include/drm/ttm/ttm_device.h
+++ b/include/drm/ttm/ttm_device.h
@@ -272,6 +272,7 @@ struct ttm_device {
 int ttm_global_swapout(struct ttm_operation_ctx *ctx, gfp_t gfp_flags);
 int ttm_device_swapout(struct ttm_device *bdev, struct ttm_operation_ctx *ctx,
 		       gfp_t gfp_flags);
+int ttm_device_prepare_hibernation(void);
 
 static inline struct ttm_resource_manager *
 ttm_manager_type(struct ttm_device *bdev, int mem_type)
-- 
2.43.5

