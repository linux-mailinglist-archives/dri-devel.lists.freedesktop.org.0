Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CB289EEDF5
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2024 16:52:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A123C10ED52;
	Thu, 12 Dec 2024 15:52:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="REfu8VIg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2056.outbound.protection.outlook.com [40.107.92.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B88AB10EC31;
 Thu, 12 Dec 2024 15:52:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P3nIslyE+dfh46K42nYw8JEdrcrE21aK53ZgncpF6hVvKNnL4DEqFuZqB6OIVhGy7/Gw/Qz3a/UzKhpv7WSnUq5y3bbnveOYAll7XyWnM4K4KRVq1zZqCyso7CPZhaXHREDqqrVZK2eld0Flsayrpy7X9yLavDyyECf9qrSUYICDny8CqcfOzSZi3rWIWDDckkc5qamAolFLFu2paVt7A5jI0RcDTZO1XxtXNTN3XsCI8+hDLudlmOWN0nfvPwGZOtNe6Z7MS5P6iqWrWFBpHQzsZuDbu8x04fKi/43TCZiAkp+IUaERx2Vjo0sJ7bW1NciMU/krDYieLvAJSE6OmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SRUqXZM9KB5RNFX+tgA9pUwngXa3Qpk9wwq+lmYirjE=;
 b=gNmmxQC4UkODGX0NvQsaQV7Q+FoMmeNWphXHz3IZYq125voHitputxcIl+R8R2EVExlO4up+bJO4oSmK7E56hI2eSQ1lK/1PFlI/jPf9lN/Sw4Y3tL9uBbqhTGb7Fu5b5/4Rl7KE7NNNf1QIQqru1LgBlfB78FQgF4ToUVPy9+QSHvMX5ufZcXh3YBhZuEZiy5M2whi8DShH2QXdzBUKeyRoBd+3su+H4nt4ZIKIybe+BpCeAp51n7GHeANkJEKrtRB9K2HE92odaMqRl/d2QAphrLIYuXtNz9mq46h1E/vr7MOb3yWSmF2dJ8xyuoFVCrXRUoOBkSTbYO2GCMV8CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SRUqXZM9KB5RNFX+tgA9pUwngXa3Qpk9wwq+lmYirjE=;
 b=REfu8VIgrNpTjRHUBgFLF41w08ztn3Ii5sXsbglVOI4A1kNcTiA5pAGGVGqJjWnK348eozQ0hMi5mr0AF3koDAjvmqEMRra3UbFibcYfIxh0foBNjZswFG0pIAh6a8ilapRePPTCs94Mf4MHnG5SfP7WO/SoCaq0AswCdkgl4Cw=
Received: from CH2PR10CA0012.namprd10.prod.outlook.com (2603:10b6:610:4c::22)
 by SJ2PR12MB7896.namprd12.prod.outlook.com (2603:10b6:a03:4c6::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.16; Thu, 12 Dec
 2024 15:52:22 +0000
Received: from CH3PEPF00000012.namprd21.prod.outlook.com
 (2603:10b6:610:4c:cafe::e2) by CH2PR10CA0012.outlook.office365.com
 (2603:10b6:610:4c::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.16 via Frontend Transport; Thu,
 12 Dec 2024 15:52:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH3PEPF00000012.mail.protection.outlook.com (10.167.244.117) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8272.0 via Frontend Transport; Thu, 12 Dec 2024 15:52:22 +0000
Received: from MKM-L10-YUNXIA9.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 12 Dec
 2024 09:52:21 -0600
From: Yunxiang Li <Yunxiang.Li@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <christian.koenig@amd.com>,
 <tvrtko.ursulin@igalia.com>
CC: <Alexander.Deucher@amd.com>, Yunxiang Li <Yunxiang.Li@amd.com>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH v11 1/5] drm: add drm_memory_stats_is_zero
Date: Thu, 12 Dec 2024 10:52:02 -0500
Message-ID: <20241212155206.5030-2-Yunxiang.Li@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241212155206.5030-1-Yunxiang.Li@amd.com>
References: <20241212155206.5030-1-Yunxiang.Li@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000012:EE_|SJ2PR12MB7896:EE_
X-MS-Office365-Filtering-Correlation-Id: 4999fd35-6986-4875-39aa-08dd1ac4f794
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eloxTGNiMmNGNS9DSnIwQi9TZnFyL0s5M2ZoeitaNG5IUmdWYzA1bGhKNjc0?=
 =?utf-8?B?cHN6UUZDV1NKUzRIT2dMMStPN0dRbXl1QTI0Vk0rYnRwUFZjQWEyTTlpRUJl?=
 =?utf-8?B?VnVKZldGc0t2NWROa2ZteVpyWit6L1dZS1F4Q2ZRM05kQkY2eklZQXFmYm12?=
 =?utf-8?B?cDRUazBxREE2cll5dVFjSUU1bm12VUhCdWtzSndQSVhUNUQ4REw3bDhFMzBm?=
 =?utf-8?B?YWx1U0c4WXVkRzFRR0xxQ05YTlRPUHllOWZBNmxYZG5zSEZVTnRycnNvN1Jt?=
 =?utf-8?B?bDJEUTlOMFRST1FBQWpFRTA3YkI5UVRVOXF0OVQ2NzFFMEZPK0hMdUFoRWgr?=
 =?utf-8?B?QUNxVm9oTlhUQ0xOSUZQQUJwQm1NbkZqdE9iclF0YjVjQmQxdE9UY0wyYyts?=
 =?utf-8?B?YVN0UGZab1VMQ1kwRE1XczBqM0UzQXZHd0pQb3Z1Q2M0bWJ5ekF5NlBNeEJD?=
 =?utf-8?B?VnlVVnZ5VHZsanR2U3lIeTI3M0pHUWdqMnMvM3pKLy8rczg1L002OGpYcHQy?=
 =?utf-8?B?WXZHMmFDRDFYSWd2RE9nMldwQ2tPbElnVHR3K1U2MkNyRWFrMHljQlpDNmEy?=
 =?utf-8?B?SmI3UWlVTDZNelRIVHhPMURmd2g2Z2tDaVM4Ty9lNklqYkwrbEh5QU84dXF6?=
 =?utf-8?B?Qy92WDlLQng1MFJSZEpzbXdJZTRIMzBGblV5YnNTVGh5M0s1UVB0SG5KYXJn?=
 =?utf-8?B?MmkvNm9oTnJwWjh6U2p5bXJEQVlhQXNDYmp1Yzg5RFpaUzVGSDVPNU5jZkVE?=
 =?utf-8?B?ZUlENVJwaGVpNzdTbXlCKzY2S3MwMk85T3RlRi9kV2FwUUp1VEtQSGo4VUYv?=
 =?utf-8?B?aXA0SEQ0TnlhTmthOHYwWUdJOTEzckp1WWM2NXhkbHVoU3h2WVNOMDJyVHZQ?=
 =?utf-8?B?SmVPa1B4TmgwOTJTY1FNa1dNN09vWGJNNkFRMG85SjVkZWNFd0h2bHZLMHdL?=
 =?utf-8?B?YXVPT1B2Q1ZCa0lWNVBISFVRTFdtRVNWWmkwc0x0dktTYWdxNlRWVVZaTEVP?=
 =?utf-8?B?eVlzNkE5QzhZZnMybG1CVHllclZ2dGR0SUVmeUhvaFFVOFVWdjVoNElET3F5?=
 =?utf-8?B?MkhuNzNwOE5HSXFEYllIVTYrUnBBNzNCSTdnU2VzY2tNekNnLzRIWVF0MXds?=
 =?utf-8?B?YjVuYmNmeTl1Y052dkVQdERFSmZVTGVjQ0tQdG1ia0phdndITkFpakNWaENq?=
 =?utf-8?B?VFc0bVhtVDkwRitCSzFBOFZmdG82VDhEalFlUjBqbGhMcjZDaHR4dEpRWkIz?=
 =?utf-8?B?N1dJSVFyNjFvR3p5U244WVNoSERzVzRRZE1RaU1kK1dlb3NkVFkzd0p4WWE3?=
 =?utf-8?B?VFE1MTFWdHRmcVZEazhiZHptd0Q1YzBQWWp5NFBZaGZNOTQxdGFJakRMaGZo?=
 =?utf-8?B?YmE4VERiNzMrd1hlTzhoanYrbTA1eitsTVRDeHNLYy9CQkpySHZhTS9wYTl3?=
 =?utf-8?B?T0hBcnZnU0lGMVJtdEU4SzY3U2hRMmNDYzIzS0doMk1FbFJJVTFSM0gwOGlG?=
 =?utf-8?B?U0gxaEtYK0ZZTWtXYUh6RlZNcElHU1ZBR3NxUDdRdjdFdlVrcnhpS1BKZTJ5?=
 =?utf-8?B?TFlsOTlYWTVROFpsclFwTGlYRWxaMCtMNFl3YVpPUFp6RlRWZEJCOEVEemdM?=
 =?utf-8?B?Tm1JQWJRYXBMZWxuTVNFU2lhM1Z0WkdtVm1CcG1yMU5jeWwxbnNRcGtzNVZy?=
 =?utf-8?B?QmJlOFkxN0xqMTkvZ0FGRW5TZFhoanNzWkVLM3BMS1REcnlPZHU0RndENFlW?=
 =?utf-8?B?UWdlbG5WOXgxOUhudnd1R0dtVk1nTEpEbCt2R3k5ZUNQZ0c5V1VtUVlnOFAz?=
 =?utf-8?B?cXM2RmZDR0pQWUdNVnBzTmYxdmtFcjdHYzRNU1VXakszRC9WZWZvVnJqTjcx?=
 =?utf-8?B?RW9ySTEzNngvRm5XOGtOcFVaVjJKVnZxREJjczJmaEVhODVINlkvYWNvT1JM?=
 =?utf-8?Q?Re9P6VWus4Y8h7jpQDe17u/bcG4Az7eg?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2024 15:52:22.5295 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4999fd35-6986-4875-39aa-08dd1ac4f794
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF00000012.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7896
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
2.47.0

