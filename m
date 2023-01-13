Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 274B5668B6C
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jan 2023 06:35:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A457F10E1DC;
	Fri, 13 Jan 2023 05:35:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2080.outbound.protection.outlook.com [40.107.243.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D30A910E1DD;
 Fri, 13 Jan 2023 05:35:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fQlqF9DrOE7LPaAwYKW9lOWahnXggJbziXkLLlUGxTykiz46cqas9seeygweZX+8isBJ8J4z/V+onhhuDL4HOwHGFcqbyqRWusd/4xawf40Tlj4YKBRKhKdLyGiTcr076iwq6du03706cQQhJvIXgHBJhJMQ/Jztk9js5H5zraVDD85BTWHHzMtrQpdUbpB6hn3txBXDY8e77Rde6w6h8r6J50yD/VbUANQvlmE9ekVjC148AsN/yvW2PgMoKBa/RWEVFYY4D8sBtrEkT3m5RgG7KIFdmhKffwyrA7Bud86l1c+0pOVHqZXUQ/EbDk2TomvHFcXYpBY6gF2CyL/5wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=choGr10mv4Jw02lHsn+igcL9vrhWG6+64bQ7e/LvknY=;
 b=eD//GMMnHIG8bdFsBgQ9141Dl3wx1gftj7EYGOI2xzz0dFd1s0ZJSmlp89AXSm6gqAjeHoNxWtDk/ZSyvFFhB47OUl7U5pZWZ04GnPu3B3WVoft/HTYn27Pg5cZFSXrOIdszwwlOLy7IYza4ZMrlo4NhI6xBfkrgYB4SXfqjaYAGsNZJDWQ2iMq7Gu8j05Tvt59/R/TjkDp5GSkUT+g1TR2qAqEA4IyrYQEAEDK8v398bgBTC3NrLkYFVa1WHtGfygPlZU3Lp16YvkjcPNy40PFa/tfWPHbhZaKhovLlhzXp+zXGzuSwBkxlbZAnwy6b923w1ZeKod9gflUHxXG7fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=choGr10mv4Jw02lHsn+igcL9vrhWG6+64bQ7e/LvknY=;
 b=RyJIAfgZ20DuEHo+0Kh31ZeXe59PWxt9btksl3lq2AnghYkchBRQxKz65AW2qb4aO7donO0JX+2M1H+gt5FHTWwHy11HvwNn20lUEcmGNk87fz3S4MK9Uu2bEI1q9f+L+E/C3iZYu20pR+IbeObwBG2VyHBUaZ58Uli+nqguDqw=
Received: from BN9PR03CA0696.namprd03.prod.outlook.com (2603:10b6:408:ef::11)
 by BN9PR12MB5097.namprd12.prod.outlook.com (2603:10b6:408:136::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Fri, 13 Jan
 2023 05:34:59 +0000
Received: from BN8NAM11FT082.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:ef:cafe::fa) by BN9PR03CA0696.outlook.office365.com
 (2603:10b6:408:ef::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.14 via Frontend
 Transport; Fri, 13 Jan 2023 05:34:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT082.mail.protection.outlook.com (10.13.176.94) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6002.13 via Frontend Transport; Fri, 13 Jan 2023 05:34:59 +0000
Received: from majun-mlse-vm.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 12 Jan
 2023 23:34:55 -0600
From: Ma Jun <Jun.Ma2@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 1/2] drm/ttm: Check ttm_debugfs_root before creating files
 under it
Date: Fri, 13 Jan 2023 13:34:15 +0800
Message-ID: <20230113053416.2175988-1-Jun.Ma2@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT082:EE_|BN9PR12MB5097:EE_
X-MS-Office365-Filtering-Correlation-Id: e53fceba-495c-474c-0892-08daf527e962
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Q4rmgoAS0zFJNRlN6KRo9Mf2mcJ8Ygml28f4DTSGLizoa9wyAxRmhiqa70mINWbNGHml1uZ4vEGnSaixMnBXtmfSCnTMDtPF9iF3okf5yrcJx7iKKPmfRsg0chrHadxxKYGg5tEulJAJ9flm79fy//BjTRvq34NxyTqE6QaE0fHaTFYq+IrUXl7QfFC+0aN+KryRopw/j0Ytv2r3gajxpyK1U0CIWAVhbcwJ7aSTDqdpT+QJthpxocLGufD8GpqmIZXweEr36ajekKdCXJspqLl4F5C22Iueq9Dun7YKBcYEa6JKl7xRu6WLsiLDVRnR/MMZv7dnrX5ZliYE6ajq52ZmIYBkd+yLwiw8aZI8EigShGORgZHsYN1ke/fyFIPF5dpXnPC+MuRp4QkQ47MY8a7qTc10E1Ha9BALyvOpgBQ4rDibRHdINWqp0+3bb1+wGsopnRrbk9Ca/gNn1my7txen9QQjE+/W0qp6EaqOdTf27YF7Vs6U7PZCLlRqkR2cegiPwFhSqkir+N6zsdlHeZiMAW1iOQdvc1TNM+QJbYikrJu5nde88ND0S40N7xz07qZpvrRuqlsAqn1b/mCX9UJwm/OPblSKeT1R/kr6HxDMdfiPzPDixpFXe8O5gsL7XUpj4Wr+ySTV34ZC5UifEyoP6nvKYY9bm6Ab/wC7xXp9ua5xMytSr6Iu8KC+Zr5wk3slWBCqQGN3ixAmu8fVTh4O8pnynZ2lqQq+WE27MP8=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(136003)(346002)(39860400002)(376002)(451199015)(36840700001)(46966006)(40470700004)(36860700001)(6666004)(2906002)(70206006)(16526019)(36756003)(5660300002)(83380400001)(8936002)(4326008)(8676002)(47076005)(478600001)(82740400003)(81166007)(356005)(41300700001)(426003)(450100002)(26005)(336012)(70586007)(40480700001)(7696005)(82310400005)(186003)(1076003)(86362001)(40460700003)(2616005)(316002)(110136005)(54906003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2023 05:34:59.4079 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e53fceba-495c-474c-0892-08daf527e962
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT082.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5097
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
Cc: Ma Jun <Jun.Ma2@amd.com>, christian.koenig@amd.com, majun@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Check the ttm_debugfs_root before creating files under it.
If the ttm_debugfs_root is NULL, all the files created for
ttm/ will be placed in the /sys/kerne/debug/ but not
/sys/kernel/debug/ttm/

Signed-off-by: Ma Jun <Jun.Ma2@amd.com>
---
 drivers/gpu/drm/ttm/ttm_device.c |  3 ++-
 drivers/gpu/drm/ttm/ttm_pool.c   | 10 ++++++----
 drivers/gpu/drm/ttm/ttm_tt.c     |  5 +++--
 3 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
index e7147e304637..967bc2244df3 100644
--- a/drivers/gpu/drm/ttm/ttm_device.c
+++ b/drivers/gpu/drm/ttm/ttm_device.c
@@ -105,7 +105,8 @@ static int ttm_global_init(void)
 	INIT_LIST_HEAD(&glob->device_list);
 	atomic_set(&glob->bo_count, 0);
 
-	debugfs_create_atomic_t("buffer_objects", 0444, ttm_debugfs_root,
+	if(ttm_debugfs_root)
+		debugfs_create_atomic_t("buffer_objects", 0444, ttm_debugfs_root,
 				&glob->bo_count);
 out:
 	if (ret && ttm_debugfs_root)
diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
index 21b61631f73a..d95a65f759df 100644
--- a/drivers/gpu/drm/ttm/ttm_pool.c
+++ b/drivers/gpu/drm/ttm/ttm_pool.c
@@ -713,10 +713,12 @@ int ttm_pool_mgr_init(unsigned long num_pages)
 	}
 
 #ifdef CONFIG_DEBUG_FS
-	debugfs_create_file("page_pool", 0444, ttm_debugfs_root, NULL,
-			    &ttm_pool_debugfs_globals_fops);
-	debugfs_create_file("page_pool_shrink", 0400, ttm_debugfs_root, NULL,
-			    &ttm_pool_debugfs_shrink_fops);
+	if(ttm_debugfs_root) {
+		debugfs_create_file("page_pool", 0444, ttm_debugfs_root, NULL,
+				    &ttm_pool_debugfs_globals_fops);
+		debugfs_create_file("page_pool_shrink", 0400, ttm_debugfs_root, NULL,
+				    &ttm_pool_debugfs_shrink_fops);
+	}
 #endif
 
 	mm_shrinker.count_objects = ttm_pool_shrinker_count;
diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
index d505603930a7..fec443494ef0 100644
--- a/drivers/gpu/drm/ttm/ttm_tt.c
+++ b/drivers/gpu/drm/ttm/ttm_tt.c
@@ -394,8 +394,9 @@ DEFINE_SHOW_ATTRIBUTE(ttm_tt_debugfs_shrink);
 void ttm_tt_mgr_init(unsigned long num_pages, unsigned long num_dma32_pages)
 {
 #ifdef CONFIG_DEBUG_FS
-	debugfs_create_file("tt_shrink", 0400, ttm_debugfs_root, NULL,
-			    &ttm_tt_debugfs_shrink_fops);
+	if(ttm_debugfs_root)
+		debugfs_create_file("tt_shrink", 0400, ttm_debugfs_root, NULL,
+				    &ttm_tt_debugfs_shrink_fops);
 #endif
 
 	if (!ttm_pages_limit)
-- 
2.25.1

