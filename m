Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D6C9DBC48
	for <lists+dri-devel@lfdr.de>; Thu, 28 Nov 2024 19:54:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83B2010E6C7;
	Thu, 28 Nov 2024 18:54:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="huMBTn3y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2061.outbound.protection.outlook.com [40.107.223.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F48A10E6C7;
 Thu, 28 Nov 2024 18:54:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ch9rpCtpKQM9CLlFIWTDgYOMBesJ23NZJ8e8+KYX0FF/i97TAmnApjYsbSNrGjuYPEG4F0Ps4K+u5nAHSJRxNEuRACanqDCSZQvPh3maYI5JLTTK1JoEatK5eZ6eeAkrx5tmb+dWK0T9lgD+VK/dnrkWLnsOY5UeLDlM/O4AkwTXGYv2+OmyiU8LWrMkMQWBOezeo61q+ylwVtbX6gWP+GqkHIusvuj9jQeur61B3/gUEygVid7rRkGHiX3cvHWUC2YZb/8Lk74Ni6LCrngcQgZ4mi5SUm4RKAqG6RQ0CZQv3AKMUt2Ooi1P+Jzlo3cV0+7mba7lkSoiYKBGRMP1Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xSWAjmpW0RzYA3fPKkCKeVEDXtQcv56hW8REsGhZQAw=;
 b=jsiRFxnwD9MAzsvO8nNXPttllKcEPI8rPAMEOIfSuca7UJvD+TmoIZtUlK+0ywD+GeV3pZ6sZNdAj+RSGlfYk0kkilJGHbIudtIAwmevyXblkHSaiqzHSXJW6Skb8nCcU3fwsU8m3U2zUKGQ4JXrsvbPOdwt4hcfecMIuiW1gl63cGI4b7hS+47lFiWMoXEfpsyTMIPNVAnL29FTTgA/ghS3ZYS9WhyChjmRd5p3B/cE4brxZlOYQutfBgSkyzGAKvrFFUHx0O/RoHopP6NjbiqZpt+nardaC6VLTIUfGwGBqmQXFnfpDaGmF0AQGAlCa2HCboN2s3SkHjpXhpUbwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xSWAjmpW0RzYA3fPKkCKeVEDXtQcv56hW8REsGhZQAw=;
 b=huMBTn3yOcPLBzeHli7RuCKORxmhx12/IJQK3VmsZP0+DOarQx8rvZhITzdgNGdIWfmglejx4Oo8685psx6dXsuewt1RBP6xz3QraILKEW7mJpbZhCaP6EEW+ljCe0eG57WIj99tqq7Kzt/n/4C2I+Rt0y364v0Rf8j4ixiwkH8=
Received: from MN2PR02CA0034.namprd02.prod.outlook.com (2603:10b6:208:fc::47)
 by CYYPR12MB8701.namprd12.prod.outlook.com (2603:10b6:930:bf::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.20; Thu, 28 Nov
 2024 18:54:26 +0000
Received: from MN1PEPF0000ECD9.namprd02.prod.outlook.com
 (2603:10b6:208:fc:cafe::6a) by MN2PR02CA0034.outlook.office365.com
 (2603:10b6:208:fc::47) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8207.14 via Frontend Transport; Thu,
 28 Nov 2024 18:54:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000ECD9.mail.protection.outlook.com (10.167.242.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8207.12 via Frontend Transport; Thu, 28 Nov 2024 18:54:25 +0000
Received: from MKM-L10-YUNXIA9.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 28 Nov
 2024 12:54:24 -0600
From: Yunxiang Li <Yunxiang.Li@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <christian.koenig@amd.com>,
 <tvrtko.ursulin@igalia.com>
CC: <Alexander.Deucher@amd.com>, Yunxiang Li <Yunxiang.Li@amd.com>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH v9 1/5] drm: add drm_memory_stats_is_zero
Date: Thu, 28 Nov 2024 13:54:00 -0500
Message-ID: <20241128185404.2672-2-Yunxiang.Li@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241128185404.2672-1-Yunxiang.Li@amd.com>
References: <20241128185404.2672-1-Yunxiang.Li@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD9:EE_|CYYPR12MB8701:EE_
X-MS-Office365-Filtering-Correlation-Id: 9158c3f8-b0e1-473d-503e-08dd0fde14ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MFg3MmlwQXJsMHVMSmZmZHdHbXp6VU0xRmtuK2NCaXVLc3BnWjVGSFN3OHox?=
 =?utf-8?B?YU5tR2VWZWNlWitQTTVCem5sQWtBeFdiQkEyK29vU0gvMFIwUTBzdWozb1Q3?=
 =?utf-8?B?azFZU3dkMWUzQ0JRWmsxTlhJMDQwL3JORWx5VjU4VS84Ymt4cGJhS3JDZGQr?=
 =?utf-8?B?UlI1RlpaVlhBZkw2d3oyY3ZrTmZpb0tEN1NLeDUwZlVmVENkdjhzYUlTM3VY?=
 =?utf-8?B?TWVpQVVnSjlZL0JsRUZlMEhMSnFTSEIvQ2p6ejVOTllTRUM1Q2VvZ0wyclha?=
 =?utf-8?B?dE9vZC9JRnNFeFpDbEZ5TlVMQ0srREZ1K2kvY2JjNzFmQ0FFQmQxSk5NOHU2?=
 =?utf-8?B?SXhxMkxkdHlUQjh4T0htNlJ3SDg3TC9CYVpGRmVHWjFiMGRLcFRzSGRuMEpr?=
 =?utf-8?B?TG00c245d3huNE16L0o4WmFBWG1uYk5Ddnk3SkVYZjhqVk44UzNlczZ2SXNv?=
 =?utf-8?B?QVdMMXNtUFVGZlRaQzV6a1BzNHhuaW0zV2JQREFJcTVkQTFWNUFBaTd5M0dH?=
 =?utf-8?B?R0RCUTJmVWFQVWluclpkMXRNbEJKc0l2TkM4eHY1S0xhT3R5b1EvbE16dFpk?=
 =?utf-8?B?YlppM1FMM0FrUHdnMThBVks4OUFMN3dyQUt2Mmc5WjlWMjcxU1g5VGgxVURh?=
 =?utf-8?B?TDZpYWx2M29FZE00QXh1d1c3MWQxNGtLSG40cGdBL2JvMUtYSnZLT3YvRzRa?=
 =?utf-8?B?d2hiRGJSZkhCcFNTZkMzZGh3THF6QlU5d1hma05jSXpYTFJCN2lkMi8xWU1O?=
 =?utf-8?B?NjlPRmFScDJ6MHZhWU12UCtLRWdtOHRsYzlOYkl4c2JPRmpZT0RCZmZjdVgx?=
 =?utf-8?B?VjlPUVdiNEtIUU9LektGZ3F4WEZxSEg5ZkplOHFHeVhNc0Jra3JYTFZFNkR2?=
 =?utf-8?B?dUNKRDhyMFNpQnF6Y2dJU0p1Q0g1NmFpTzAxS3lWakhEUVVvZHhMb2o1ZWhX?=
 =?utf-8?B?QVNGZ1FvT3ZzeWFIYUJzZnUxTlM4M2k4NmpFb01wdFhxTE1QK1labVRNbUhm?=
 =?utf-8?B?UzU5cWp3VTg0RjhBdWlRMXpUQXZhTlZRSUxzVFpETlNQTjNKK2hmSmtMNjMv?=
 =?utf-8?B?bXpwU205RVVtNTZHcXFISUQ5bUFWUDB2cTZObS9NenFsaFlLaXRqVnRycEFX?=
 =?utf-8?B?N3VTMWx4R0hGRFBFNjNIeGdBYkVqZzE4cGJJS2hxYlIzOUdjdFNMekxQMjVm?=
 =?utf-8?B?WFcyRXZpU05pclhNZFZpMmEveStWYTJjOWFSRmNVK1BhczBTL0xUYXp2WENi?=
 =?utf-8?B?KzNGUGZ4eUdJUFBzYy9mWHpESjZVRFc2a1J5dmxkT1l4QWxlOHB4STY5SUlu?=
 =?utf-8?B?MG8rQ2U1Q3RjZm01L2pvVDFPWGJuakpZU2gzU0oyaERQMnRXMGxGL0hpeGxX?=
 =?utf-8?B?LzFBWXB6NUwrWDA5cU1QZTNOR0FiVEU3REp6OVpEZVdoNU1RQUtFVlFRWGxp?=
 =?utf-8?B?OHZLb3VTQUFIN3J5ektxdlZKdGFGRXQ4R2YxWjRUejhnZnR4VnJqNWlwMDBr?=
 =?utf-8?B?VklGN1lpcm9zNFZKU01tb3daVWV1d1RtZW83VThYZWpWcjczUnEzNEdUY0xK?=
 =?utf-8?B?NXFRcUR1SzRGUW9EeitSMXBoMGhvaFFzVVR5b1FwUU15ellXRFYrd0s5S3lK?=
 =?utf-8?B?MDIwakVCNTYxRTVrY3gyU053d3JuU2hheHJ6Z3N1eEZKZld6eEVDalpyMGdH?=
 =?utf-8?B?ZFh5Y09ZVmRYRDE0RitnRERMNjFmRjZMNjJ6UnhZZlF5WHFXT2tRem85QUZ1?=
 =?utf-8?B?K3RvQ09Kc0h6cmM1QWcxTGZEOEZXUjBVVzBxTFFiZ3lOSnI0VVI2UVVmNFBk?=
 =?utf-8?B?NlorVmtzcmxmNmp5b1BMdG5pY1lmdElkMEY4alZSb0hac0IvNlhndDYzWHZs?=
 =?utf-8?B?ejNBSDhsRmtNT0V5QnZBOVFSSmlnVk8ybE5sNlEwYkNkZko3cjJIaExsczZR?=
 =?utf-8?Q?2MBxMWVISxqf1US7+s721WaRu/hcpUJa?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2024 18:54:25.9781 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9158c3f8-b0e1-473d-503e-08dd0fde14ab
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000ECD9.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8701
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
Reviewed-by: Christian König <christian.koenig@amd.com>
CC: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/drm_file.c | 10 ++++++++++
 include/drm/drm_file.h     |  1 +
 2 files changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
index 714e42b051080..e285fcc28c59c 100644
--- a/drivers/gpu/drm/drm_file.c
+++ b/drivers/gpu/drm/drm_file.c
@@ -859,6 +859,16 @@ static void print_size(struct drm_printer *p, const char *stat,
 	drm_printf(p, "drm-%s-%s:\t%llu%s\n", stat, region, sz, units[u]);
 }
 
+int drm_memory_stats_is_zero(const struct drm_memory_stats *stats)
+{
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

