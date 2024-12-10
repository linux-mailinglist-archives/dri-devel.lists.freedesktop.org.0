Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B7669EB8E0
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2024 19:00:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82DAD10E05B;
	Tue, 10 Dec 2024 18:00:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="5M4PwEd5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2075.outbound.protection.outlook.com [40.107.244.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31EDF10E05B;
 Tue, 10 Dec 2024 18:00:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CX97PEpRrsaJEM33ygok9ZzZMnQO3k1pSqbxcMQ4hRrAPZScCLPcxXuQmlDzcwfPdlR0JH9Ll4LvvlbBKrWcbIa3LHUHnQc8wpkAwbSLcobhqB3WC3i0cybL7x3MbvZHanhlRnE4XWPS7Vx0L8OkRueB96FHHwD18YucGUfvQ2R8aUCe+KaeM82FM1fYFcuYFdO5tF0M/QCC+SmTRIMQl+cRxAYHlMh4o9CCSme046mUZ/bbX4rLR7v8scYlJCqfrIuLRvb3A+SeAbxhXvMKweanIclk0sQwfMfhJpq2x3v8ZOKdORE5imcuyIEj70fFfzyAVtLNIui57lvPw74MBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wqrJLe1wi/RHT9PAGF3vluo3AzmDZF4MRJgepVb6Jqw=;
 b=P8QJaES20shWkA/sn8y/So2g5wDYdOD6pcC9DidNLUrQvINJfkjH53pr+2WH8dACKqfBFeGEb493qldjS2MZpmZh4q3O1jP5m7qpKmrSuqBqLYE7gWA2EkWk1HtJBZuCtIKSkr/O7+i8A6IDCOhJitfbOKdttss+7vISLkNciHU5ruOfYbEEnmxoxq09b+v2d666brvnFKX18HsZFhVonf5hrBDkPxvZgx+rIm0UFtLez9RRP8pmti9daePzQm/NrmqhEAMxIvJTbKSA+M5hdRI1mfblhNuWLJTokFS/bRCzQT5N8oI8tHSh57mlgv1RyDn9SunzslMHpqPqJvsIaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wqrJLe1wi/RHT9PAGF3vluo3AzmDZF4MRJgepVb6Jqw=;
 b=5M4PwEd5Iogl9/Uimze+4/42lj675+9Eyb2C//CgL9PuGboTC2mkA3nHuLsiRnL0EH0GooOsysL501ijOCu/Duf1qZ8hrhdYtTOKCse/m6QWj3LQQ07bEo1XDFvYIVhUt1BqE7i/dJ1KNbwtX8nfad3lPC370Fv7WK3P/ydnhe0=
Received: from SJ0PR05CA0056.namprd05.prod.outlook.com (2603:10b6:a03:33f::31)
 by DS0PR12MB9445.namprd12.prod.outlook.com (2603:10b6:8:1a1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.15; Tue, 10 Dec
 2024 18:00:05 +0000
Received: from CO1PEPF000042AC.namprd03.prod.outlook.com
 (2603:10b6:a03:33f:cafe::c3) by SJ0PR05CA0056.outlook.office365.com
 (2603:10b6:a03:33f::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.9 via Frontend Transport; Tue,
 10 Dec 2024 18:00:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000042AC.mail.protection.outlook.com (10.167.243.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Tue, 10 Dec 2024 18:00:04 +0000
Received: from MKM-L10-YUNXIA9.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 10 Dec
 2024 12:00:02 -0600
From: Yunxiang Li <Yunxiang.Li@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <christian.koenig@amd.com>,
 <tvrtko.ursulin@igalia.com>
CC: <Alexander.Deucher@amd.com>, Yunxiang Li <Yunxiang.Li@amd.com>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH v10 1/6] drm: add drm_memory_stats_is_zero
Date: Tue, 10 Dec 2024 12:59:34 -0500
Message-ID: <20241210175939.2498-2-Yunxiang.Li@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241210175939.2498-1-Yunxiang.Li@amd.com>
References: <20241210175939.2498-1-Yunxiang.Li@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AC:EE_|DS0PR12MB9445:EE_
X-MS-Office365-Filtering-Correlation-Id: 54d5ecb9-6236-4e74-f9ee-08dd194479c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RVFDdFhwOVpYWGNtc0pReVRVM0FSNFpPZnpaM1FGSmpjYjRpcGcvaWNhMTBW?=
 =?utf-8?B?Mjh0Y1dCSVFGWXkvWTdyU1NsWGQ5Q1p2Nk1rZ2NjamVCYm00QnNzSXdidUtQ?=
 =?utf-8?B?RXdYOElIZjA1UGwvZ1hqYmRkK0Z0T29Mdk91a0prQWR5Vk1PbjVQMitYWmtN?=
 =?utf-8?B?QUZVVUtjVmkwbHZ2N1V4VlUvc3pjb2pUR3lVNzlEcXNHSWVnb1hYeitLdTVJ?=
 =?utf-8?B?WGNPV3NvTTB5bEQxYkU3c2xpbFBud0VyNE1vUEJMRGRTMmdsNk5oRWJjaGtL?=
 =?utf-8?B?cHRJYzNyZC9qRzQ2T0VQNDQ3NjdwTWM1U2E3MWp5SFFRcVhVUWJ0YlljRzNE?=
 =?utf-8?B?QXk4cEpESmtSaUNiNmFzeUJlZDdwcmgrVGQzbkVhZTcwTS9CQTBaaDhsVko1?=
 =?utf-8?B?UWk1bEUzblBzdDMwYUFQb1ovVldJTUFHNDN4ZW03K1ZMMHNxaUFEcnR3dkds?=
 =?utf-8?B?TlNFYnFZbksxU3kvWjdTWnlZc21OaUFQS1V5WStNYU9HYUVnYUhvUExvNmpH?=
 =?utf-8?B?ZDBHUzcrOG5QQmJNa3NwUDRJMHNkYzZFeVdEcjlsdjFmOHdoTGNmRTJDRDk1?=
 =?utf-8?B?UmFXcnJFYWdXNGxCMDREU0xGa20xL1kydHZmSFh5S1VGVm5ZdVRXQUJJZ2Vh?=
 =?utf-8?B?YWpianFKWWF1eVc2c2dybGxzdHBIWlJ6TWRaLzM0SGN4cUcwam9zeGhkaHN3?=
 =?utf-8?B?VTRyRExwWS8xSWRiMUpuTkRnVnRCRzVsYWwvV0xXZy9DblB5dDE2bFdCRW96?=
 =?utf-8?B?aHhhTHFLR0ZKb0dvUnd2NlBJSjM1eUk2NmE2ZG1TclFaN1pRNURDMzV5aS81?=
 =?utf-8?B?RzNHL2JnbGhXUWpRbGw0MnUvUzBDdU8rRG5PMUlHU2ZJSkdidjBXY1p2M0xq?=
 =?utf-8?B?QUxMUzZkdjNJL3RFOE4zNS83NnpUeUpRRE5zTHUwWTcvL2ZFaEdRSFl0NGp2?=
 =?utf-8?B?Z2dlclJ5V0toeGxZdnJkUm5yczBENzMzbHZZQ29zNjYyby9RdkhZSmFDcE5R?=
 =?utf-8?B?cXh1R0tBOG9iWTJycFdNRHFKWHZLdHpXR21JRDdxWDZzckdidGVTVDJmZHFm?=
 =?utf-8?B?ektvdXlCM1BXTzZqZkp1RkxkTW5WalRTbllYVi9jTUNKYmpIUlgxTTlTeHpr?=
 =?utf-8?B?enpWQmtvWTgvMHVHNVlUeGRuc1VIYXpGRnNaWTNrRXVEYTFpZWcrbUs4L0sv?=
 =?utf-8?B?NlZ2MnAxVEl2ekdCSHB3eWFUMzN5TkFMZlpaRkRwL0szckJzOGlwT0lhdTQr?=
 =?utf-8?B?TEMraVlHNEpkbEo5ZEk0Y3BvODRkS1RKRXI5eFNOR1FST1hubG5xNDRNN0hZ?=
 =?utf-8?B?SlBoSERnMlJwRWZtNFhsZDM4RVRpQ29rSkFnbTJjOFV2anN5dkVJN3Myc0RP?=
 =?utf-8?B?Uzh4eWpQdUVSYVQ3SzFMdjJUWGhhVi9zOVpWWm9iUkFtOTZCZUJmWGI0OHVn?=
 =?utf-8?B?ZW05SkVOdlpXNWFiOWZ1UjlEVnZoV3VHTXhRa3ZUVFNPMGIwSXFMeEw2OVUv?=
 =?utf-8?B?UlNGUElhQlNPQWJwM1hXeHc5RlIrVUlSYVVESTdEaEx2dUtzWmpOSGdhVVlh?=
 =?utf-8?B?QzJVajdrNjYyaWJEZVREZVFmVnA3ak9LMGFycjFnNkd0UXQ3TXorNTQ3ajdm?=
 =?utf-8?B?c3dJQzJ0bmo0b2VZVU5aV2ZyRjRCYVJhYzRrZjI4Q1ZBK2gzcDZaT3FzTlhI?=
 =?utf-8?B?bzFOZnB0ekhKempvUjVTMjVjRzNHRUNMVHlscWMvcW50TDJaWGNuNTE4cjE3?=
 =?utf-8?B?eTk0S01Xa2FkdEVHWURHZTRDTEhQdGlmYitRZ01Wbnhlenp0VHRIUWlBYjdT?=
 =?utf-8?B?WktkZUEydW9wR0loWTBRalhaWlA5blQ0WCtKakFPNU9pMFovOXM3Q1hBaXlp?=
 =?utf-8?B?TGEyTVdiZFVZclliK002ZGFOdmR4Z1NCQitmYTVkanBLeGlCMU1QWVFuNFp3?=
 =?utf-8?Q?ju1uU4RTOLHSis0BwggsK0meeZis4yHg?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2024 18:00:04.4866 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 54d5ecb9-6236-4e74-f9ee-08dd194479c3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000042AC.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9445
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

