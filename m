Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C31F19CFCAE
	for <lists+dri-devel@lfdr.de>; Sat, 16 Nov 2024 05:45:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDA0510E037;
	Sat, 16 Nov 2024 04:45:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Se7XBrct";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2060.outbound.protection.outlook.com [40.107.223.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECB6110E037;
 Sat, 16 Nov 2024 04:45:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oCLC3CtvZ8g5SgQWGiThv5rr11lQAvV8f+IDqZt90Uw0HD+u9jJkUUkYHU+zxeyO7Sn1JISAqItE5+menD66f/fuxwLg2AhDKjnSEHUVTvbgZunTJ2fKtLgphbAGX7IxhvFBEfyEMsmeQwIq69p7bFET/2tC6Z5Dv/8Q5hQkvAS/Ea2GfytSqNVPavS76CSjhzWW2QCJuGIb6ZRRGn3SY222rDoYTUHNO1/lP5aXElObeVp7KpchyF+cLbmqpVjRMUt01xIovZ60T72jpD5lpvuFFL2aYo0T62i5wEk0aS9nAN0HJCIgrY+xtqfR6FToIMUSonbT2FSsFo8TOEtWTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xSWAjmpW0RzYA3fPKkCKeVEDXtQcv56hW8REsGhZQAw=;
 b=J5JSJ5sJgfoK0X9unfL8geNk1kgOH9scMSIgCDRQFnduT4awwz4q49lqMTeETEAkF6NIFisyWhE5AtiBtXdtZoKIqxoQ0RoByY97tqeX2zcLlanf/C2Rrqc9wA7rHjIJQ+huSJBX5cWmC+cnhCB8Xk0UVuzIht9o/0WCoE0o7V8lOmeJusSDq0RoK0TKoz2+0q6BnpsMt5IZ4AgYJIxaagH5gh2sY2k3XHu3q69ifOUJwoCvt/cKSb8pm4Je905bwCV5baHlm4D+G3ddR7F0OUPh8tWejDRL9swYkipIm5flZbT5KOeUfQz9sbCDieASaAon0KTWKJKJ1I256m7azQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xSWAjmpW0RzYA3fPKkCKeVEDXtQcv56hW8REsGhZQAw=;
 b=Se7XBrct0lpwAlEfaMkT1yDVBDDfx7+25Yr4ojzrdAkZdYx5QrmOXJtNv4use5Tg+DqV92HVH0HLNhgbN3CD9L2OJc8lKleqd8M4P5YmTsBSk4hG5IYn5BzoVO63R6/8Xi6/FUPvqtWORyOcUbENl1vboSBn/aB8OwGevbyzYTg=
Received: from MW4PR03CA0150.namprd03.prod.outlook.com (2603:10b6:303:8c::35)
 by DS7PR12MB6286.namprd12.prod.outlook.com (2603:10b6:8:95::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.19; Sat, 16 Nov
 2024 04:45:14 +0000
Received: from SJ5PEPF000001F7.namprd05.prod.outlook.com
 (2603:10b6:303:8c:cafe::9b) by MW4PR03CA0150.outlook.office365.com
 (2603:10b6:303:8c::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.18 via Frontend
 Transport; Sat, 16 Nov 2024 04:45:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ5PEPF000001F7.mail.protection.outlook.com (10.167.242.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8158.14 via Frontend Transport; Sat, 16 Nov 2024 04:45:13 +0000
Received: from MKM-L10-YUNXIA9.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 15 Nov
 2024 22:45:11 -0600
From: Yunxiang Li <Yunxiang.Li@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <christian.koenig@amd.com>,
 <tvrtko.ursulin@igalia.com>
CC: <Alexander.Deucher@amd.com>, Yunxiang Li <Yunxiang.Li@amd.com>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH v8 1/5] drm: add drm_memory_stats_is_zero
Date: Fri, 15 Nov 2024 23:44:48 -0500
Message-ID: <20241116044452.5925-2-Yunxiang.Li@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241116044452.5925-1-Yunxiang.Li@amd.com>
References: <20241116044452.5925-1-Yunxiang.Li@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB03.amd.com
 (10.181.40.144)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F7:EE_|DS7PR12MB6286:EE_
X-MS-Office365-Filtering-Correlation-Id: f55f8679-6d32-413e-d9f5-08dd05f975f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S0Q2MDhtZVVFaVhsVHJzSzRNbXdZbUVVc1FtZ210WXdId2xIQ2thbzU2VGVN?=
 =?utf-8?B?K3VvbGdpcHVxQ3h2c1J0VzhyZ054YXk2M3NKTFp1a2lvVkxMTzFMMG1iaDUy?=
 =?utf-8?B?c09TczJZcDJTZDc2YmcyWVJ4d0RqeWwrZU12ODBjemFMNkszZjZmRGRZcS81?=
 =?utf-8?B?bld4V3ZGcUIxOHRiQWphZEVaVUdNU2pLN25VUW9VcU82bFlxMFMvS2VFODY3?=
 =?utf-8?B?K21qcHg0bXZjYys4OUFEOUhmVXRqem5yN21UN2lyUG1OQTJ4NGRvcVozaGta?=
 =?utf-8?B?ZXJhTk5pUTYyTUN2SU90QU4raDNYdThsVDNXSFIvc3cvWGZGZDhRc2FnRnRz?=
 =?utf-8?B?dW95bjFsNkFhZGI2ZVNUdnROYkRIWk9TQ3JWUlFrdkxXdDhibmhUT0ZEZW1J?=
 =?utf-8?B?blF4S2RnNzl4RzloNXFpcjE1UEJLN2hiRmFUNVhISHg5aGEzclJYdk5PWGh3?=
 =?utf-8?B?am1peXpPTys5bm12aFJsMHNLZlphVDc4QlZJbzcvcW9FN1hFQ2k3RkkrNk84?=
 =?utf-8?B?ZkxnTERvSkEvMmsyVXk5V3R6aXA2Z1NQbEZ2RUFlL3F1RWtuUWFBVXhrSGJP?=
 =?utf-8?B?RUhOOXd5QlRrNVpmRXh3blBCaytaVkRkaU5DRGVNaUNXaEo5Vi90REJqRUpp?=
 =?utf-8?B?Y0EyZlU1aDZ4ZCtaYitPU2laelNnOFRXZno0WXFUZTZJdU5WMFpMRHk2UHdX?=
 =?utf-8?B?c3VBNWVOM0t3MnhlM2JYM2p4WXZ6RUpSSkluMXUzZHUxcndVQ3NnYS8rQUtI?=
 =?utf-8?B?MWoyY2l2YkJ3SUFpUE9La2RkTHhHRDZMTGtGbTBhUVRlbHcxWEVUTWZKQTlE?=
 =?utf-8?B?YStER00xZDJrVVlUcnpVZTIwbmlZR0ErWnU5VlUyZDR0blNmT3lnT0xxSWhV?=
 =?utf-8?B?N0xXd3B4QlhSL1FRMUk5UFl6VWdaWnRMZENrMVdjdDh4dzhTZFR6a0szU2Fu?=
 =?utf-8?B?V255UkxFcmw0Mk9QVTk4Q1dpaEtWcnM3MFgzWkNtNVdlWVR2V0FKbmFkVEpr?=
 =?utf-8?B?enFyRFVLNXNCMWwxcVN3TVk2TitIMUl5aTRiQVIwTk1sdEwyRWlCelhOUzBM?=
 =?utf-8?B?NlYxV1dMWktycVNSaEJ6elZOcVVaOFRjRmRManBXd3g5U25Ka1dnQ1orODRV?=
 =?utf-8?B?NVF3dzBSV2RFUk4rVzFhbFhjK2o5YjB3eTNnL0FCci8ya0g1cXkyMVZDbnY5?=
 =?utf-8?B?N1hOTFNnUHhMdEg2Yys5dWlSNUtGY1hmNHhodWhHMjVJNFp5MHcrY01pbElm?=
 =?utf-8?B?ZW16Zm53Y1d3L1dCRnA1d2UyalZFS1FuTHNqampmQUdNRndhdzR4Qzh5TjFF?=
 =?utf-8?B?QS96NjFiM09mNGZ5ejg0a2xjYzY1N0RsdG5uK1NEM1Qva1dHdGRTMFhqbzh0?=
 =?utf-8?B?THdyUERHbFNtOHVSQktOdTBWNnBndTdpQThsK040akI5VTZXbnJ3M3VxVXRZ?=
 =?utf-8?B?eG8wTkl6WEdtRGRlc3pNZWc1MFJDQlN2S2FrR3ZRcnl0TmtkYXdVRllzUzRr?=
 =?utf-8?B?WlBEYU1CU0pQYWw4ZTNaemx1MU9MM1Z0UmtTT2tiTnB2anZmZ3MyUXZrL1hH?=
 =?utf-8?B?OXJmRW9xOFFhWEU3Wm50dHdUT1RkYmgwamdZQnE4MVBNS2tOOVhIZGZydXI5?=
 =?utf-8?B?K0c5R3E2K2FXSzREcHlGcjBIWHdqL0lvcDFrNWxKRHVZeGx0dEZFKzJGQmJx?=
 =?utf-8?B?Yk5DSDZTS0RyWG5kRDAwQjY3SG9XTUFWK3ZlZDdGUWc1QXYwc2Z2eXhXTkhl?=
 =?utf-8?B?dXI2ckNTdWZFMkFKNHJVbUp5UzBXSWh5VXNOWlREazErU3VHemVVNnNEdkdt?=
 =?utf-8?B?MnFtQ2RFZ25YSDZ2RnJSUjNmczRHSVdmYTVjR2Q1cjJQdEZVaXpndU5iakVk?=
 =?utf-8?B?L1dySGRBM2hUSHJnV0RGeUlENU5DQk1sSXYvVVJVSWdGSXc9PQ==?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2024 04:45:13.9310 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f55f8679-6d32-413e-d9f5-08dd05f975f8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001F7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6286
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

