Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0IixE56JhWkWDQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 07:26:38 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F4100FAA22
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 07:26:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FF5510E36D;
	Fri,  6 Feb 2026 06:26:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="E52GP3tS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010068.outbound.protection.outlook.com
 [52.101.193.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDC1C10E36D;
 Fri,  6 Feb 2026 06:26:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QAjfVgnRwnfM5e6AHKY4ubbxvgYbhE3O2DbRUeMCIntsstZ1l3j//l/VG3A9IM6KM56OVgiRszqPua0Hnv6xhGH7OyxkkwIJxJmWV7GOXGTlfPtTFhS3XzUBZzJpBanezQsUozsN0zEzVMjWjsMD8W+JihxO3FtholGxRnmxgcW38DNr6CZ2Zzs36Bsk4mRv+htvcSzsKasYrP3fpPrAZrSDidY7qQA8ycdn17HU5rPr2BrNo62EoXTGnf6tGLzcrQeWCMS1dGOWWuEJc7NkcYMY+IV+oGDOk7g00hhwZz32qgIO88lYCNoCXjV1u3HFgTKei2pQ+FkbSurZeLcjcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gsZZ4o6mRj0OJ0EHF4vm92cMxvD2fFY+PNgD3TZMx5M=;
 b=uAzwhYRnV+/GTMWkwe1ayay2eKch5oDqWyv1/dx4IxhvqxUiawDbLOE9qAGlrG59YhXo3E20IXxuctY0SocPJ/SOwesX23pnHQe7yif/laoGptLFQ7XXb+3oWkk1CrMRAwJkrfKB57U2NQDMSSSgteL5A8L3Lk6xgkm8HXa0PTfYj4cJmjAMI7oSyPNPREdbEY8F6wFy2+NoZEs9P/94ihFHCdS5a9UkjuD6AetMp09dM3WMDUpQGI658vPQSqvu+NwNc3436qflYUIf8kdntjiaMrueo3jf1wxkRfa2h656Kv1Gvjy5wIa8DpwaHokwOcABelxwCRkS3kspZ78pWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=collabora.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gsZZ4o6mRj0OJ0EHF4vm92cMxvD2fFY+PNgD3TZMx5M=;
 b=E52GP3tSN+aPhhBV5EacrOZ1LBI9K116Mqe0ZPoMmR1RsPiO0d6okFp42pfeaj9UhYSu+bYD/oGS3tRF5zg1P5gQ/m5s94yWTHkouUyLuskyHhTj/euVb8krmSVmKyPdrb58t1HK3cIlkPpjGzreXxbfGGgvxtwQv5YmKEvgsqQ=
Received: from MN2PR06CA0024.namprd06.prod.outlook.com (2603:10b6:208:23d::29)
 by MN2PR12MB4358.namprd12.prod.outlook.com (2603:10b6:208:24f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.16; Fri, 6 Feb
 2026 06:26:30 +0000
Received: from BL6PEPF00022570.namprd02.prod.outlook.com
 (2603:10b6:208:23d:cafe::86) by MN2PR06CA0024.outlook.office365.com
 (2603:10b6:208:23d::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.16 via Frontend Transport; Fri,
 6 Feb 2026 06:26:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF00022570.mail.protection.outlook.com (10.167.249.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Fri, 6 Feb 2026 06:26:30 +0000
Received: from honglei-remote.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 6 Feb
 2026 00:26:26 -0600
From: Honglei Huang <honglei1.huang@amd.com>
To: <Felix.Kuehling@amd.com>, <alexander.deucher@amd.com>,
 <christian.koenig@amd.com>, <Ray.Huang@amd.com>
CC: <dmitry.osipenko@collabora.com>, <Xinhui.Pan@amd.com>,
 <airlied@gmail.com>, <daniel@ffwll.ch>, <amd-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <linux-mm@kvack.org>, <akpm@linux-foundation.org>, <honghuan@amd.com>
Subject: [PATCH v3 3/8] drm/amdkfd: Implement interval tree for userptr ranges
Date: Fri, 6 Feb 2026 14:25:52 +0800
Message-ID: <20260206062557.3718801-4-honglei1.huang@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260206062557.3718801-1-honglei1.huang@amd.com>
References: <20260206062557.3718801-1-honglei1.huang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00022570:EE_|MN2PR12MB4358:EE_
X-MS-Office365-Filtering-Correlation-Id: 304e631d-d894-450c-b010-08de6548aa63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?uBYYNF5W2hJOHl3vSPtjJx00DxiKpqxVQ8QqsUmYom5v+/EzEAqg0jkeFBac?=
 =?us-ascii?Q?KjUNqTIKemLPP+rykGj1DZdKaedfA+5sZtbJbSZ2YsJAPXqyYbYUDuxSUe9d?=
 =?us-ascii?Q?p0YJ2SCfsbVaJTaQ7kU1uipWwQ3Hv3nDITiCBDznN3nKs25NpUxwjI0YvUqJ?=
 =?us-ascii?Q?di7YfpXoXp1tz/XLUegh2Mdb+O10YwzgUZnwKMst/QHpJFkEiVX40vUOCPkn?=
 =?us-ascii?Q?vMmLmZW3kFkgZKl+rg6N19n4F6lvULXQs3e2S+gWLy/Ay+cvgE3NbLlFxss3?=
 =?us-ascii?Q?SaKOZD6TC0J8rLK3kGxoBHTIcSrIRjO8chFRyiDDk9GKPJv4vu+4sEBr8cgX?=
 =?us-ascii?Q?JzKoit+HE78BqypoxflE6fgF2xGZDweyJey+dLAmZOePjXca6UvKqSSqmH8D?=
 =?us-ascii?Q?IHSAmU1x2wLGUvquKn1elLLG+PFREJvHFY6eaoC/PIAoWfhAb8VwIUGz6lZo?=
 =?us-ascii?Q?wVBALdJUetSf+7eYuUhNuZb+zkoiS8FZRl0jwEWHaSkEVZXtbHzp6vmArm0K?=
 =?us-ascii?Q?bpa06ryKCplK/7RudSvmoJulwlYx/GKb0A6Myy3LaaRf+52X38a7X7rsuepD?=
 =?us-ascii?Q?+JBPNdNKCm9qHUOwmgWSc0cpucTai0lpDhFshALOR2wrh97y4QbLWiXxEOWh?=
 =?us-ascii?Q?3p467LUl6WjenFsiOdNyS2JutT1WImH5Mxt9YG+thpyFAMCiQMtiRQVtpZMF?=
 =?us-ascii?Q?nu5uUPXeEZ7Yeb6lYJrko8zqiGQwJULNajh1cfim5vDEzOSeLQbM4waszImO?=
 =?us-ascii?Q?H9gMxXKRckcvZmnfjzgpQt5AkDBJNUC2koxWnboxUntShcoKR5CCWIUiOXPE?=
 =?us-ascii?Q?GBe7PzcYDxo7VjzdZjNdij0vv6xnGBjkcTidF/JL22AQ2Kg1DPKfcU7OXtZt?=
 =?us-ascii?Q?mFK8QC8A/TdOivmV3Iqi20e9XPABqPapX2I2uY94regk9uBUub2Mz/3R1KD7?=
 =?us-ascii?Q?FJOOBn5yujG/BJYi5nnlvx7p5BbEaprvbIKDUm3Mb0eguDA0v4s98PVQO6mI?=
 =?us-ascii?Q?Ex01K7ftkMRMsWz5tFGf1QhetA/ZXmO6AIGcg7VMj1YSo1wHv6vHY/eZlHYV?=
 =?us-ascii?Q?R0FmBUXhmB5bUG9tkbERESCmDjLaS6MajE76b3+QbOEqlykq5ScE1BQQTm47?=
 =?us-ascii?Q?nlXwVVGvswO0eZOkkdiobxp2g3rttpEhZi9mnZyZX8fWWNhDQ7Am1/ERjY30?=
 =?us-ascii?Q?sKZRhEUxi/nKG+8gqct55xHJFT9my4x5dFrC8v8hDRdR3+iDCrDarxpaedHI?=
 =?us-ascii?Q?rlJjk1xMT3yWFpX2QLDXkCOsR1jk0r1WHlRJpMceb1YrW9RWjeP7Q4O9Ly74?=
 =?us-ascii?Q?79y2MLW0plv97YFddFouXUPmpQzuQuX+DLbP75TM9xcaT1wGl7VzRGIGjFH8?=
 =?us-ascii?Q?uvqhg3Ql+nMAJsBgd/a5trEZv3w3141csrOZJdAfjGrlJwa6pcrfm0UH+02p?=
 =?us-ascii?Q?1IvZCFDpg7ftbwyhgJM3JqOafb7IcSYUXs+SKHtNrkWa/b67ZRANb5+iBZMm?=
 =?us-ascii?Q?CkYpD9NFMQwuXvN24GEi7EEzI4FM2IVHlHbR//5GjyqVug0Lglo9jAfVCHnG?=
 =?us-ascii?Q?Ey2w2fc4r93EsLwoU9KP6VzhoLdc7c7QCDJaWAIMevn8X+eh2HdNap+A7gOK?=
 =?us-ascii?Q?Il6S1iMomYYovAd63xGou6HaTditMjlBFLQZW1M9w2Kg2oeJaThNwq3IPxeX?=
 =?us-ascii?Q?EFmh+Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: +EKnwzOSxvealA/2HtYHgUKACMr9U75OFFe9hvrRWqeDtgJYBh2xfAnEUrHYefqrvIAHP7FozOAGjz31l3RJd0KE9jV7Il50fczNV965MFnaD07yIskbPFbnBt4mds2zUw35882aAoRsiP081g6EYul2dgCNUokB/Df9rnbcEOqW1VoaLkBj8whdr+7iKtLsNGutouMAxd0FzXjRRalDO7db4vzdKo+k7p7bbK9of2t/Z7e3v4gLxusfPRrMZWxOrNJyec4hlzloLeTwylzELEeUQhO2mXNpiuYQ6J/Ew6gRVmJo7PQf7g7wyjfb+KPJmUwAhYCHduRDzy9LrKGxJxmgQxNv7iRW8jVrvKZG5m098gHPx0br14lwb8TV1aoNuMXF7YUNrl3ua+rLb41ndJwdNQ8aMgEUCmLM1ZPFZ+96R8H9AD+iNhpa2OF3xY7F
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 06:26:30.3461 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 304e631d-d894-450c-b010-08de6548aa63
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF00022570.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4358
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[collabora.com,amd.com,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org,kvack.org,linux-foundation.org];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[honglei1.huang@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	HAS_XOIP(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:dkim,amd.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: F4100FAA22
X-Rspamd-Action: no action

From: Honglei Huang <honghuan@amd.com>

Add interval tree support for efficient lookup of affected userptr
ranges during MMU notifier callbacks.

add:
- Include linux/interval_tree.h
- mark_invalid_ranges() function that uses interval tree to
  identify and mark ranges affected by a given invalidation event

Signed-off-by: Honglei Huang <honghuan@amd.com>
---
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
index a32b46355..3b7fc6d15 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -25,6 +25,7 @@
 #include <linux/pagemap.h>
 #include <linux/sched/mm.h>
 #include <linux/sched/task.h>
+#include <linux/interval_tree.h>
 #include <drm/ttm/ttm_tt.h>
 
 #include <drm/drm_exec.h>
@@ -1122,6 +1123,26 @@ static int init_user_pages(struct kgd_mem *mem, uint64_t user_addr,
 	return ret;
 }
 
+static bool mark_invalid_ranges(struct kgd_mem *mem,
+				unsigned long inv_start, unsigned long inv_end)
+{
+	struct interval_tree_node *node;
+	struct user_range_info *range_info;
+	bool any_invalid = false;
+
+	for (node = interval_tree_iter_first(&mem->user_ranges_itree, inv_start, inv_end - 1);
+		 node;
+		 node = interval_tree_iter_next(node, inv_start, inv_end - 1)) {
+		range_info = container_of(node, struct user_range_info, it_node);
+		range_info->invalid++;
+		any_invalid = true;
+		pr_debug("Range [0x%llx-0x%llx) marked invalid (count=%u)\n",
+			 range_info->start, range_info->start + range_info->size,
+			 range_info->invalid);
+	}
+	return any_invalid;
+}
+
 /* Reserving a BO and its page table BOs must happen atomically to
  * avoid deadlocks. Some operations update multiple VMs at once. Track
  * all the reservation info in a context structure. Optionally a sync
-- 
2.34.1

