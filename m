Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CDA067AF40
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 11:04:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E12E210E77A;
	Wed, 25 Jan 2023 10:04:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06E9210E777;
 Wed, 25 Jan 2023 10:04:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fP4QeDNq0GC2CAc7bahA49q5PgQr0caXs33jxycsbMHVxTipA/21UfoV3f1G1dlOOTHPoMAET2AkN3aZKM9Pfwf1jJlKyoB7HEs9lAA/7mZzJDuVbNvvHWk0esZXqPr6nFnq6oyiC79m8HR8/EWAOu3Bkr17Z6f/+2YeqvXKHVJFLsUVxkEwQd1fQr52j8bBhjXN8mDz/zqNvmrh0qEEzDSPr+5AImyWDoWWSKSnLKWkkOmafk13rLwsCuspDR1TVcSZWowbb1awXQeWGnZFjBHe9WBYEzz1m3wnakFAgtPffrbK68PSvkmQ1BZu2JKbHeMoTuTVjUGccYmiMVtNog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j/qeUh7S6/2i+kDiqlzhItj7sxHWJ7Ck9Me0toGfJUk=;
 b=bArRBX+0QW3lb3XjD00D0tJJ0PY4/3VwqKO/N0JbBY5uVcXoppXOY0Y0HYWUSUfp23t7j4vClPQZNqHg6hpVZFhLPrGebyI64oL0nKoNNHFqoM8pFssfwsfKUGI4ZPYsvViCB43XO8EIt4vV6s21JvWITac7LcDx0YF3iDlpuKAloaUi+8FoKM0Lg4n3F7pFW0SBY2Efcck8EOC71JVWjyFhKbYZd3W0Tc4L9D79aiMO0KBzdeY8LjxNR+OPhuWkv2Epy1VuVZbWe/JDlvl0VWGe5f1UeB7Dd8zHDwOCz6sRW+7y12YmllzrFXXwKcyvkuHleNiKlw6wYfmEYCLMRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j/qeUh7S6/2i+kDiqlzhItj7sxHWJ7Ck9Me0toGfJUk=;
 b=VZ6zAVBpKGRZv3uM8AdOxgBAHiVSZ6CoVzmpnArZVFHSS4f/FewQ9bDdKreRCQAiSo1lAHpI4VOrH4ovNOjdPp37vf5Ll4PYy6A+ewQZMg6B6w8sLauZnDVa24i31TRX0jk9kLPRdqolqtW4u+LjAkzuJhF7kYduLrXWV31ixxk=
Received: from DM6PR13CA0060.namprd13.prod.outlook.com (2603:10b6:5:134::37)
 by SJ0PR12MB6784.namprd12.prod.outlook.com (2603:10b6:a03:44f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Wed, 25 Jan
 2023 10:04:00 +0000
Received: from DM6NAM11FT114.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:134:cafe::30) by DM6PR13CA0060.outlook.office365.com
 (2603:10b6:5:134::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.16 via Frontend
 Transport; Wed, 25 Jan 2023 10:04:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT114.mail.protection.outlook.com (10.13.172.206) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6043.17 via Frontend Transport; Wed, 25 Jan 2023 10:03:59 +0000
Received: from amar-X570-AORUS-ELITE.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Wed, 25 Jan 2023 04:03:56 -0600
From: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <nouveau@lists.freedesktop.org>
Subject: [PATCH v4 4/4] drm/i915: Clean up page shift operation
Date: Wed, 25 Jan 2023 15:33:15 +0530
Message-ID: <20230125100315.6214-4-Amaranath.Somalapuram@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20230125100315.6214-1-Amaranath.Somalapuram@amd.com>
References: <20230125100315.6214-1-Amaranath.Somalapuram@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT114:EE_|SJ0PR12MB6784:EE_
X-MS-Office365-Filtering-Correlation-Id: 1beb53d3-7b64-4322-104d-08dafebb7acd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: F9qOXXRN1TSrtWdWdu3sz8L/omNDQQMt5Fyna9eoTWd9nseNiEjXlOYsbDQAP8Ea/lAVsxf24uhIUgbPPGFoD0c5Mz+i1qVEj8IqCl6DHTEsByTbDa73LUnAx8s3rwq09kv6K8QkWmw2YiqIwbvQRKSdwg4IuX3hwUa3mgNRt6owsABGEpW7f/T04h8c5fXR3C0YU3PnbwheRhDLc/bYbGCqgoEAnJpQ2MOjhliY5jyJgZrgCc7GkU8N6m9y55fAkuhtrsWRgdE5hs6RoSDJ6ohd9HMhjjs8svSjDnHlvjtGrC/k0uuHF7FoGWM+DTmnoNlTL/oNgADVAKRZE+W3klC2pplsqNEPPaQlO9CaUmWknIdYuERxCcpShGk1M/LdpNZT0pMwBetC/2F8nvzciXkySxwgbboRjJBS5Wj26TwbRtToFZgYks8U3jZa2R3kxkevbpGhhzd/FLAvS2ZHIvsCQlghtoeUPPz+9wGj7K7bqnAFWaIEa7L4O2UQVqT6gRSMSIOnfLTLNsnvMTpmkuMeWBwX0WML4I2KgNtT0zYy5kh1AhAibjuJDRjH6g0AYoAU1JAbhDabINnCB0KuNxXFV2JaqQLk/87LdSBdpsymRNwu/T7C9ESOiFua0sfD39Bidv5HQlY5b8C46yb/hb3h7ihIM8IzOw4WmH4t8tClohMZvC9blk4jN03V36nrjU5ePkNpIbGiNOZ3gCCDh7fer56tQNh/t9KkTv5HSbc=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(376002)(136003)(346002)(396003)(451199018)(46966006)(36840700001)(40470700004)(8676002)(316002)(86362001)(70586007)(70206006)(36860700001)(36756003)(54906003)(8936002)(5660300002)(336012)(47076005)(426003)(82740400003)(2906002)(40460700003)(82310400005)(4326008)(41300700001)(26005)(6666004)(40480700001)(186003)(450100002)(81166007)(1076003)(2616005)(16526019)(478600001)(83380400001)(356005)(7696005)(110136005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2023 10:03:59.8164 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1beb53d3-7b64-4322-104d-08dafebb7acd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT114.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6784
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
Cc: shashank.sharma@amd.com, arunpravin.paneerselvam@amd.com,
 Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>, arvind.yadav@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove page shift operations as ttm_resource moved
from num_pages to size_t size in bytes.

Signed-off-by: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
---
 drivers/gpu/drm/i915/i915_scatterlist.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_scatterlist.c b/drivers/gpu/drm/i915/i915_scatterlist.c
index 114e5e39aa72..bd7aaf7738f4 100644
--- a/drivers/gpu/drm/i915/i915_scatterlist.c
+++ b/drivers/gpu/drm/i915/i915_scatterlist.c
@@ -94,7 +94,7 @@ struct i915_refct_sgt *i915_rsgt_from_mm_node(const struct drm_mm_node *node,
 	if (!rsgt)
 		return ERR_PTR(-ENOMEM);
 
-	i915_refct_sgt_init(rsgt, node->size << PAGE_SHIFT);
+	i915_refct_sgt_init(rsgt, node->size);
 	st = &rsgt->table;
 	if (sg_alloc_table(st, DIV_ROUND_UP_ULL(node->size, segment_pages),
 			   GFP_KERNEL)) {
@@ -105,8 +105,8 @@ struct i915_refct_sgt *i915_rsgt_from_mm_node(const struct drm_mm_node *node,
 	sg = st->sgl;
 	st->nents = 0;
 	prev_end = (resource_size_t)-1;
-	block_size = node->size << PAGE_SHIFT;
-	offset = node->start << PAGE_SHIFT;
+	block_size = node->size;
+	offset = node->start;
 
 	while (block_size) {
 		u64 len;
-- 
2.32.0

