Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AF84975642
	for <lists+dri-devel@lfdr.de>; Wed, 11 Sep 2024 16:59:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 459DD10E7BB;
	Wed, 11 Sep 2024 14:59:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Yluzb9GS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2040.outbound.protection.outlook.com [40.107.220.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD3E310E7BB
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2024 14:59:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KoPF2ayIRm2kpGAzqhAmBohc4Mh0yOTtakRt3dAyYkEj4VDXIDmaFvHvh1Mp8hZXvjva+ATUGBoeg07OPVkL7hkqfRJkatA39Ji31DMRFt76VLeh+/mSPw22S1v6f1anJ2x9CaHtivfxe8nTKauyffH6c5JVMynuVG/Ptf4/djYTWCZ42rrSmD/ZOMaCXE18jj/rkJwZjV+qJNqJkAvOVAH+q2wJaukXTdukULPTAJLyf6HtAznUMfJ4ZOWvUXhtwKhiDCWWqvjE2Z1x6mrq9WbJZclD0EVh1rOjo8kHhPY6vvqUSX0HtEmCm6l22wwlxFUzuTPiPUQDl5bI/wTazg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nS6k48MdjB7LAAw/7I3TQUY+lYVF5eAThZS9Xe1lAns=;
 b=JDocKR07mugEc7Ph8DLg6t6V0IRYAXwOdFALJWUbPg+yFe1SYn8kcPD5CR8MolFrmQP7+iR/+ZR0g8VR9/OeTqI78TJREgQOEVTQ9SUNHOUjcavZJVb8WCN2GBu82zEq+Khi3g5S54RCISOkJeH6HGO8upjdd31/SFywBTN/YbhTgefhbZTR/rSUg6/19P8dkEKxmDyxKrSUsKhk40RFofmTT/lM0fDnd14xsgye7LqlUhPxHZkMNOXzeN2Xq9bPRLniqXCpRfButb77ZCJUGVLmMdWYI9OsWUEZfbdfGuNoBq8/xjdxmCGN8mpEjIdqKHH+0BTFODm60GmQ96S01A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nS6k48MdjB7LAAw/7I3TQUY+lYVF5eAThZS9Xe1lAns=;
 b=Yluzb9GSwz09G/paa+eig2M8jrXTJwT+wSMnFdeEDdja7kfwCUF6g3g14mOwaSK6dADiydIuE7Fu9/EYAvB7L/KfBxiIebKXhhan07w/1lrOVYzMNlAjgptQoW12BGqlMPOcIgsmqSfl5gaXDUqujvaouGxQbiiOHe6Z4Ijq56A=
Received: from BN0PR08CA0009.namprd08.prod.outlook.com (2603:10b6:408:142::13)
 by BL1PR12MB5852.namprd12.prod.outlook.com (2603:10b6:208:397::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.17; Wed, 11 Sep
 2024 14:59:01 +0000
Received: from MN1PEPF0000F0E2.namprd04.prod.outlook.com
 (2603:10b6:408:142:cafe::78) by BN0PR08CA0009.outlook.office365.com
 (2603:10b6:408:142::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24 via Frontend
 Transport; Wed, 11 Sep 2024 14:59:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000F0E2.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Wed, 11 Sep 2024 14:59:01 +0000
Received: from patedamande.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 11 Sep
 2024 09:58:59 -0500
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: <dri-devel@lists.freedesktop.org>, <christian.koenig@amd.com>,
 <tursulin@igalia.com>, <simona.vetter@ffwll.ch>, <robdclark@gmail.com>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Subject: [PATCH 2/3] drm: use drm_file name in fdinfo
Date: Wed, 11 Sep 2024 16:58:33 +0200
Message-ID: <20240911145836.734080-2-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240911145836.734080-1-pierre-eric.pelloux-prayer@amd.com>
References: <20240911145836.734080-1-pierre-eric.pelloux-prayer@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E2:EE_|BL1PR12MB5852:EE_
X-MS-Office365-Filtering-Correlation-Id: c87bc805-282b-455e-607b-08dcd27245bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?s8n8qBUtditxt40jov+PhkkpG+7A943u647VxtHEH6TiqSIYldD1Av9Y7LDF?=
 =?us-ascii?Q?TMa9A/ujgqET+rOUI1ml7BjnywOZRgupw38hprrzrcpu14m9nY6tHMDrbG93?=
 =?us-ascii?Q?pGiYFT2yKRESkyOqOe9b9wX8n7JEGiPcU3anhFQdwcx5oUGHtRk6AKEi+2qt?=
 =?us-ascii?Q?KDVAihNQrDRAE0jLAFFF6wy66MD9xBS/BMKSYytfLgdbFBLS+HXGRakCgWrn?=
 =?us-ascii?Q?pJPMsUvzH4/ArGcEDJuJS3+FXAwtzbGxn4bBC6U/91zMcDHRlZr+KSfDPZwP?=
 =?us-ascii?Q?z7y9o4/s97mmPteNWiXNhHajuBF09YEBKJn/qbFWsBn3y4qHXQQbdeD1doZf?=
 =?us-ascii?Q?7WJvxsBDYYzyqjA0FDaE3AF6BR9bXU5UlIxvMDkm5UPOHCKJRdjpZ69xSXjG?=
 =?us-ascii?Q?Cmy19p50lMrIVbq4KRfl6BKWzs5R0HgvBDWkQ5MNqDOsXScWt0dL1gqLw4T5?=
 =?us-ascii?Q?lZ5+eEQPiDYXWPSzyPsfRcjIIifi2tXJR7HIjvxqW27/0fuZWhyOZL8pFSWB?=
 =?us-ascii?Q?cCYn2zofh32nC+R+phlFMBd9lLHeEEJW7TxcMmOHzMUONXGtKr3VN1eAVTk/?=
 =?us-ascii?Q?U9hYNS3gkcKtGPNv0dzXTjfzMRl50Z+P1fKyg/bGjRjvFXVgTWbkHnIe1NiF?=
 =?us-ascii?Q?ppgLooaWyFxDsXikHO2qRDmi8yWKpi5z3X7nvjcZXZhDeMQlyqeUX10eWiFj?=
 =?us-ascii?Q?iOu0/tZoGBWeP9w+mLzJEfac/bndDxQFZr41Pzsjw93Ottsq2IrjgN0YOFLP?=
 =?us-ascii?Q?pMwZ8HSy7YdCsSKXTtTqldBCLQOKQkxNDNfghzwBZSuxx9mcL+0XEgVfANRO?=
 =?us-ascii?Q?f2KL+/jopTvPkQuh9u/vKWfluDBox/s9kuwe7FK9qBy5gPGN2KSdnfKjPqHh?=
 =?us-ascii?Q?umlMm4Ha46U7oKNU5tMkKXkQWKlIe1on9AVMMyHEECiBLoU1WK/O3VmMWuA8?=
 =?us-ascii?Q?FZrcmhTKnxRoGiy0/sfE79kJRaBvDC50QwctCzIoVGGSivsRy9XMpewwv+aM?=
 =?us-ascii?Q?fTrJiY6Ci1ThmT/GSnFXrGCh+KA2sQgFptaJ4CIZthaqLIhKI7cqPR1uxD0X?=
 =?us-ascii?Q?HmolvZLEB+kjw4h0F0Pt1x+1GD/6rK8+RiWHRz+l56PXKWKW884wHENNVt32?=
 =?us-ascii?Q?CcPkHdlihAT8j37Gmoo0EYyPk8h8Qw3ObitYzDKcj8+sGoOVRwgWvEdv77px?=
 =?us-ascii?Q?VbuNdrXgctHiVcmjgOFliU6LfqAECcvhZ30uqjulpxushCYuiTF5QKIQh7aJ?=
 =?us-ascii?Q?e5hBwocn7soywkxrJWUJkYcZsLwvQQ4d9eXk7Z3bIlBI/343vAeFHjxf6SvS?=
 =?us-ascii?Q?zUBvp8hO8tb0dHUkfTch/3YvP72Kv50szgbP+lRFB5KCcPgsF28s/G/3CNbD?=
 =?us-ascii?Q?P6zf24lDXUjgeWR30SxLf7FA4OswFQUI3T0lBG70tYpEmaAjAO5pWu7qBJ85?=
 =?us-ascii?Q?/DWgBYtkO2cMm7nexd5LiQB+aPx1nDMu?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2024 14:59:01.7064 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c87bc805-282b-455e-607b-08dcd27245bc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000F0E2.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5852
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

Add an optional drm-client-name field to drm fdinfo's output.

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
---
 Documentation/gpu/drm-usage-stats.rst | 5 +++++
 drivers/gpu/drm/drm_file.c            | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/Documentation/gpu/drm-usage-stats.rst b/Documentation/gpu/drm-usage-stats.rst
index a80f95ca1b2f..ed1d7edbbc5f 100644
--- a/Documentation/gpu/drm-usage-stats.rst
+++ b/Documentation/gpu/drm-usage-stats.rst
@@ -73,6 +73,11 @@ scope of each device, in which case `drm-pdev` shall be present as well.
 Userspace should make sure to not double account any usage statistics by using
 the above described criteria in order to associate data to individual clients.
 
+- drm-client-name: <valstr>
+
+String optionally set by userspace using DRM_IOCTL_SET_NAME.
+
+
 Utilization
 ^^^^^^^^^^^
 
diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
index 558151c3912e..024c7b47ab04 100644
--- a/drivers/gpu/drm/drm_file.c
+++ b/drivers/gpu/drm/drm_file.c
@@ -955,6 +955,11 @@ void drm_show_fdinfo(struct seq_file *m, struct file *f)
 			   PCI_SLOT(pdev->devfn), PCI_FUNC(pdev->devfn));
 	}
 
+	mutex_lock(&file->name_lock);
+	if (file->name)
+		drm_printf(&p, "drm-client-name:\t%s\n", file->name);
+	mutex_unlock(&file->name_lock);
+
 	if (dev->driver->show_fdinfo)
 		dev->driver->show_fdinfo(&p, file);
 }
-- 
2.40.1

