Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 929C19B0BF2
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2024 19:42:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6452E10EB57;
	Fri, 25 Oct 2024 17:42:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Is+dlTa3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2072.outbound.protection.outlook.com [40.107.236.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6427E10EB56;
 Fri, 25 Oct 2024 17:41:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zNuf1RrsWj0TrvCskwKa9dU6dLrrWge7lxvf6x543q7ptknMQ8g+mW1b1VHtHx8Qgcbg0Pvv2oX7dNA9rz9oB0DsNuS2suqYCY4one149gfPURGhSttrRKeLGK3he6sawa2Afiv7BtDUDCQentShH1ZG0OyXSzgZlUzbEAVGa55Kuy69U3vYNSdS6s9S5YQYZNbKtxuPGSzZ9fws+t72TBpkn3gGE3naSdVB9kAuDx+3t4Mn1kU/q4wPbkEWWzirYps5gqwJ0hqt85JKvMXGhCNTOcGwM4SHm91m08aBOXH3KP5hLoOj5s2YmrgufR3UVsnOmHrsELec4dlmlZe9oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5V31yZqs6mUZSS/Bgqj965Klzs50w3i1AcjYXBXaQSc=;
 b=eEGFqMsEBfliu9AUb/SLXG6weAxrZTR3bOAllYJa3PDzgZfV4mrbCErvkBawNy5pHirfTyESwlUKi6pk5yReJSlwas922mwXiwM9sfBkiCfH/NZtpJY8kRdswTaV1VFA12I5511la1961eRMWoyo0EXL41A+BkOiBnhTjpBIP1s/uXL+/7bZOX3/hgR60hVNqmx0Trph8tgb+KJdksn5n/TuqelYFitCDl2rUD+jzAOFLbzRooSm3foRTzkRXNMvtmEuucrMXWuTizQUIERie4n53Cfl8ZPORGPol5DnCVsr9ICSuA7scHwVFYfXqBPe6a2KEqaZx0Mc94tnIiO0zA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5V31yZqs6mUZSS/Bgqj965Klzs50w3i1AcjYXBXaQSc=;
 b=Is+dlTa3OPsEiqrYvwQNf/sqI0mEEHPb/OCe6ZTHrJk7w3sooRLM4lTCD4WPDUCbLKPLwcCDwEqKmzHOzsklm+c/HUuf1JaV821F0HQuoX7VhnM6NRGQifg4v3cM2Cb5CHLw0jiZacw4AUW63ogAU2GQKrPv1BBRR3IjM9eCDL0=
Received: from SA9PR13CA0080.namprd13.prod.outlook.com (2603:10b6:806:23::25)
 by DM4PR12MB6064.namprd12.prod.outlook.com (2603:10b6:8:af::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.23; Fri, 25 Oct
 2024 17:41:47 +0000
Received: from SA2PEPF00003AE6.namprd02.prod.outlook.com
 (2603:10b6:806:23:cafe::24) by SA9PR13CA0080.outlook.office365.com
 (2603:10b6:806:23::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.7 via Frontend
 Transport; Fri, 25 Oct 2024 17:41:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF00003AE6.mail.protection.outlook.com (10.167.248.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8093.14 via Frontend Transport; Fri, 25 Oct 2024 17:41:47 +0000
Received: from MKM-L10-YUNXIA9.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 25 Oct
 2024 12:41:46 -0500
From: Yunxiang Li <Yunxiang.Li@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <christian.koenig@amd.com>, <tvrtko.ursulin@igalia.com>
CC: <Alexander.Deucher@amd.com>, Yunxiang Li <Yunxiang.Li@amd.com>
Subject: [PATCH v6 4/5] drm: add drm_memory_stats_is_zero
Date: Fri, 25 Oct 2024 13:41:12 -0400
Message-ID: <20241025174113.554-5-Yunxiang.Li@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241025174113.554-1-Yunxiang.Li@amd.com>
References: <20241025174113.554-1-Yunxiang.Li@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE6:EE_|DM4PR12MB6064:EE_
X-MS-Office365-Filtering-Correlation-Id: 0dc45406-a8d2-42e2-75c1-08dcf51c4cb4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?XzpX5zlt7qpc5fX1j3KuIijS9ODDeLi9KHfDsYR+W/X2TyyXj2zQqGkciAq9?=
 =?us-ascii?Q?6dDmAmWIw6YK3IjCDLRmxTNOhThv/weYuMtMInIkFZohx3OSibKAK9kHr8cH?=
 =?us-ascii?Q?zDDT2oduNykVEaElq+fd5LIxO4PbzdEc+4c2cOTjdKdClNs5fwRsUvlX10tP?=
 =?us-ascii?Q?BXdJMs1Q9T7EB/UBckAbcX5sFQzmf85GSRNsUaI9+jEdFz/dfN5ft2VhMFKx?=
 =?us-ascii?Q?C8FwSfw4PBT30JLbvC7srAEW1EKCppTQlcefrydtCBF+FVhWuW7KF9ZMYScp?=
 =?us-ascii?Q?aVtmnP8rDRodaV+GIu6vvQ/0STQxGw/8/O5mTxHZxjRcYFNodbw7sDyR/5wk?=
 =?us-ascii?Q?O5BB+8ufWHnIY2aiZMnKSThoOKBGyG3pOIvyqo1z7RTIkaskACI7goFO9ncu?=
 =?us-ascii?Q?SfCTafqiX1AsHd1/1GuDcFIEQ2mY6mKUwCkClh7Esq5YRyNl9DEGCBanjFCI?=
 =?us-ascii?Q?aRkvk/ZoVAwcurf1iKEx+p7UHb2F3+cqCulbyt+ipVeYXf5ctMipEWa70x+/?=
 =?us-ascii?Q?0c2BLApXBGLbLiipEGTUclw9f3x3Uid9OMuaeQiJ5EesAZctjk9s4Lne4M33?=
 =?us-ascii?Q?wNUKWHGXZkRPsfhXX/Y1GU+zgq1djgpMGGOzdlWGyfmkVAuJ8icrU5kivKeo?=
 =?us-ascii?Q?ybhMhtmMM3Qu66/mJ4a7kzz1ejFzzxVwlNLLrSOzXMPmmCvTR3F6KhPribG+?=
 =?us-ascii?Q?dzakyLd2xNCaN0P4Winz+EZI6kiTutUsiAOlI6DvEAyo0H1yAMXupS+FMiWU?=
 =?us-ascii?Q?R+xVuRwc0KWXB3h9Co6bSE5zCP5GtUaAUC8pvqlbmnfse1DdxITC3brBlXnz?=
 =?us-ascii?Q?Mzyl7JEH4U73OVyyk4hzl25yx9FDN3SqtEy/VE9r+DeiSDnr2hm7xzTKuA3z?=
 =?us-ascii?Q?CES32IJh0qR8MZcPbFZZYYAgoKtQv8bxXqod4Fxa6HasmQZBf/CvQmg9ysfX?=
 =?us-ascii?Q?86Cwy7htupBo2vPl/U2hIDtQmZkzzYSEfmdvTbRC1WVyducs+TbdUB58wB5j?=
 =?us-ascii?Q?EJuyqsXUMR8p63XSO7Uz/RdDdrzfS9fgQYkJuhjSsPHvoBaemQO7fPWd3ISU?=
 =?us-ascii?Q?3uOEXt5x1vFsId/oopp7fkkQrP1eVMsikFAZp8YvTAOauIt1r446BHuMmSlY?=
 =?us-ascii?Q?4z1OHgkNe3KmA6Kp1GyewXbFqB/OJH5iKDhxNurVFob45ZZ8ElEIpqgbTIXf?=
 =?us-ascii?Q?B7AIbGBJHyhQYlzQuOq9z2dwun3HutFMKSHrVAUzHoyC2MbECdNhMGc2Bw8S?=
 =?us-ascii?Q?1yhebxNBOSd2D/qdSoapKYCNXl5MxGxghdtLCcCxdTDpc2/ZBA7OE5X+t5ED?=
 =?us-ascii?Q?nJt/3hUcs0OPMIDRBeP67HwtDOldVtuO8tn4tTyRDhhjbic//ALEoYCqzbDM?=
 =?us-ascii?Q?l5uO8E8tyktQ7BV5z4eSff0rmONGNjfrM9rPpjJDfewkUjbIaQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2024 17:41:47.3771 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0dc45406-a8d2-42e2-75c1-08dcf51c4cb4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00003AE6.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6064
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

Add a helper to check if the memory stats is zero, this will be used to
check for memory accounting errors.

Signed-off-by: Yunxiang Li <Yunxiang.Li@amd.com>
---
 drivers/gpu/drm/drm_file.c | 9 +++++++++
 include/drm/drm_file.h     | 1 +
 2 files changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
index 714e42b051080..75ed701d80f74 100644
--- a/drivers/gpu/drm/drm_file.c
+++ b/drivers/gpu/drm/drm_file.c
@@ -859,6 +859,15 @@ static void print_size(struct drm_printer *p, const char *stat,
 	drm_printf(p, "drm-%s-%s:\t%llu%s\n", stat, region, sz, units[u]);
 }
 
+int drm_memory_stats_is_zero(const struct drm_memory_stats *stats) {
+	return (stats->shared == 0 &&
+		stats->private == 0 &&
+		stats->resident == 0 &&
+		stats->purgeable == 0 &&
+		stats->active == 0);
+}
+EXPORT_SYMBOL(drm_memory_stats_is_zero);
+
 /**
  * drm_print_memory_stats - A helper to print memory stats
  * @p: The printer to print output to
diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
index ab230d3af138d..7f91e35d027d9 100644
--- a/include/drm/drm_file.h
+++ b/include/drm/drm_file.h
@@ -477,6 +477,7 @@ struct drm_memory_stats {
 
 enum drm_gem_object_status;
 
+int drm_memory_stats_is_zero(const struct drm_memory_stats *stats);
 void drm_print_memory_stats(struct drm_printer *p,
 			    const struct drm_memory_stats *stats,
 			    enum drm_gem_object_status supported_status,
-- 
2.34.1

