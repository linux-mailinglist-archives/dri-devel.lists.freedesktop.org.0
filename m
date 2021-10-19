Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 536564341C7
	for <lists+dri-devel@lfdr.de>; Wed, 20 Oct 2021 00:55:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 113C56E18F;
	Tue, 19 Oct 2021 22:55:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2048.outbound.protection.outlook.com [40.107.237.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 800236E10F;
 Tue, 19 Oct 2021 22:55:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FpQPUUFAqZ9QX1W8d/W9FF3wxWQ0dNAyuOH1HmcJTZ67WQ3DxuIaTMy/qhYKLcocKj2LkVPifmKfKhAL7e+xat+C3shJGkcAZFGYvBSgMaJhWlLBNHi8hrt3QeMkCODndQZFLFom1uRjR6e2c+s6eO2OMjapQnsyerDWAiqOdgWiSKJDyKmzITy8/IsyXLZeMlZkOP/vhTFd2uWO44yMYOaR3FyRAVirOW7E7JoGj9aPty+5pTPfuk3VMeTZZ2wOcEgdmSIbDQQzZtFlH69xydqNTVlik+lD2cFdsGZk8/k2JnszcFf7T+/B1iG6jlbkXzuMIlOUfkfXAtyxnVr8GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MQBxOKpU7l/Tsjl3JpfxDHXDll0N3U7MesOsKmCfOSE=;
 b=PthQtVZtQY5gV6AqMWZz5QHOHRlK7wTlou2dqdgc0f3dXJO+pDffWwGMhAD/47nOU+mOzEJgOQMz9UEiGHRSi5tnlNjkLYo+JMeYT6rwed7ikDsl6UieuELsI88Vhe6FjK6BVkNXqgVamPAgmeVW8M7nDFbCuWoT7FOd3zWQg8m2AQpy7RQ6ibUiKgUQD43guhqo8hi2nLU8fItRGrf78gyht6LeL7zqWJ2bgPo6Dw+9uoFlP0ZpvQKgBS1fTr4s2HWcm7lsvFI6mYdkrK+UMUfBxVZ1kaS1vc1NF2j46bDVts+0O0qNMVpvwaKs8zYqHaJn7Eyu7n/jBxZLndZZbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MQBxOKpU7l/Tsjl3JpfxDHXDll0N3U7MesOsKmCfOSE=;
 b=0zSN8DRbQaIrbM6hDY447bt3SxLiYe/qGS8mgqpWWeiisnd31fTREyOjOqdVJ6x8/Uhj43ZXXtGvpfY945nDZqUv9o+si1dYpinsIFR4Uc2XLW5ldadTIXyGe11JDAPpfSgPCwgk3UglhEQlydY0M19KDLhT36Xe0Rm2SCH90cg=
Received: from MW3PR06CA0001.namprd06.prod.outlook.com (2603:10b6:303:2a::6)
 by BN6PR12MB1219.namprd12.prod.outlook.com (2603:10b6:404:1c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.18; Tue, 19 Oct
 2021 22:55:21 +0000
Received: from CO1NAM11FT035.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:2a:cafe::dc) by MW3PR06CA0001.outlook.office365.com
 (2603:10b6:303:2a::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.15 via Frontend
 Transport; Tue, 19 Oct 2021 22:55:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT035.mail.protection.outlook.com (10.13.175.36) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4608.15 via Frontend Transport; Tue, 19 Oct 2021 22:55:20 +0000
Received: from rtg-amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Tue, 19 Oct
 2021 17:55:18 -0500
From: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <amd-gfx@lists.freedesktop.org>
CC: <christian.koenig@amd.com>, <daniel@ffwll.ch>, <matthew.auld@intel.com>,
 <alexander.deucher@amd.com>, Arunpravin <Arunpravin.PaneerSelvam@amd.com>
Subject: [PATCH 07/13] drm: Implement method to free unused pages
Date: Wed, 20 Oct 2021 04:24:03 +0530
Message-ID: <20211019225409.569355-8-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211019225409.569355-1-Arunpravin.PaneerSelvam@amd.com>
References: <20211019225409.569355-1-Arunpravin.PaneerSelvam@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cf5a7105-5c4e-44d8-cc4f-08d993538739
X-MS-TrafficTypeDiagnostic: BN6PR12MB1219:
X-Microsoft-Antispam-PRVS: <BN6PR12MB121983D769A50AC36F4D5907E4BD9@BN6PR12MB1219.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:765;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iwQS/NVJYsJlVXU12VGucMgmJcttxuPt09p+UPmloqlUIvECrX1wlp1mI5g1eE0ZlnvCV6lNLfvZ8qOp3VkRPSBYjItImVoDn2hFwXNBPx62tG/a6Q7nVaCJfXFR8QTBmrtDiCMP7Y9xYs+7p/OQ+yNX1fv8JZR8spfsl7GkYN9UpDZV5i3VwQkHdr3Y1nIcwY/fQZa/rWTM52JX6xOBYUQp4quO4AJGT4TNroxzdWwQMUCAsgfkeXfyrfycv/FczYMZO/hGFJJowCb8Em2gilIYYnnYswVLIo93/tfNc6JhN1teKI6rawFez/Dz7TeZFW3YvX2bshiaYg1V8s9TauQTvy7q0fY+zOF74SYwindLZ32NPg0oiIRTPqpCkIFonsI0HrfpigpbPYTJsTJfQqW2rfICV81CsyS0X4+qgU/XhlMe+pobwqAEK70zQj6HqgHbXsezxQBR+c0mDkEvLFgkit/Oy/kY2d9ND7atosnCzqeszhedpbnH//XXU3ZPcVTI1/nWh0eoC650Y6oqAtL7N2vMf5xvWwZyzY4lFNLs6/kA3c/tYi2rxSAUWY2AFPeNHAXJUZlz5X5g5o6IPAh1N3BNDbsfsVi2o+6olRglh15VEdMhdvbGobHNqQ3q20mCwnO0fkUzEbs5nWCrzgqn1n1x8FS8mzD/1Tb/yDV2Pe1grSNWJxewNwsXiD1Bj7xRMWSbHVFI/N7tkvPbqmg+Hs5QJ2XufbnEd8zs9Zw=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(426003)(70586007)(86362001)(16526019)(81166007)(186003)(5660300002)(8676002)(4326008)(83380400001)(47076005)(356005)(36860700001)(336012)(316002)(2906002)(7696005)(110136005)(508600001)(8936002)(26005)(6666004)(82310400003)(36756003)(2616005)(70206006)(54906003)(1076003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 22:55:20.8307 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cf5a7105-5c4e-44d8-cc4f-08d993538739
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT035.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1219
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

On contiguous allocation, we round up the size
to the nearest power of 2, implement a function
to free unused pages.

Signed-off-by: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
---
 drivers/gpu/drm/drm_buddy.c | 87 +++++++++++++++++++++++++++++++++++++
 include/drm/drm_buddy.h     |  4 ++
 2 files changed, 91 insertions(+)

diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
index 42ce4f8f4e0e..3e3303dd6658 100644
--- a/drivers/gpu/drm/drm_buddy.c
+++ b/drivers/gpu/drm/drm_buddy.c
@@ -256,6 +256,93 @@ static inline bool contains(u64 s1, u64 e1, u64 s2, u64 e2)
 	return s1 <= s2 && e1 >= e2;
 }
 
+int drm_buddy_free_unused_pages(struct drm_buddy_mm *mm,
+				u64 actual_size,
+				struct list_head *blocks)
+{
+	struct drm_buddy_block *block;
+	struct drm_buddy_block *buddy;
+	u64 actual_start;
+	u64 actual_end;
+	LIST_HEAD(dfs);
+	u64 count = 0;
+	int err;
+
+	if (!list_is_singular(blocks))
+		return -EINVAL;
+
+	block = list_first_entry_or_null(blocks,
+					 struct drm_buddy_block,
+					 link);
+
+	if (!block)
+		return -EINVAL;
+
+	if (actual_size > drm_buddy_block_size(mm, block))
+		return -EINVAL;
+
+	if (actual_size == drm_buddy_block_size(mm, block))
+		return 0;
+
+	list_del(&block->link);
+
+	actual_start = drm_buddy_block_offset(block);
+	actual_end = actual_start + actual_size - 1;
+
+	if (drm_buddy_block_is_allocated(block))
+		mark_free(mm, block);
+
+	list_add(&block->tmp_link, &dfs);
+
+	while (1) {
+		block = list_first_entry_or_null(&dfs,
+						 struct drm_buddy_block,
+						 tmp_link);
+
+		if (!block)
+			break;
+
+		list_del(&block->tmp_link);
+
+		if (count == actual_size)
+			return 0;
+
+		if (contains(actual_start, actual_end, drm_buddy_block_offset(block),
+			(drm_buddy_block_offset(block) + drm_buddy_block_size(mm, block) - 1))) {
+			BUG_ON(!drm_buddy_block_is_free(block));
+			/* Allocate only required blocks */
+			mark_allocated(block);
+			mm->avail -= drm_buddy_block_size(mm, block);
+			list_add_tail(&block->link, blocks);
+			count += drm_buddy_block_size(mm, block);
+			continue;
+		}
+
+		if (drm_buddy_block_order(block) == 0)
+			continue;
+
+		if (!drm_buddy_block_is_split(block)) {
+			err = split_block(mm, block);
+
+			if (unlikely(err))
+				goto err_undo;
+		}
+
+		list_add(&block->right->tmp_link, &dfs);
+		list_add(&block->left->tmp_link, &dfs);
+	}
+
+	return -ENOSPC;
+
+err_undo:
+	buddy = get_buddy(block);
+	if (buddy &&
+	    (drm_buddy_block_is_free(block) &&
+	     drm_buddy_block_is_free(buddy)))
+		__drm_buddy_free(mm, block);
+	return err;
+}
+
 static struct drm_buddy_block *
 alloc_range(struct drm_buddy_mm *mm,
 	    u64 start, u64 end,
diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
index 19c7e298613e..993312841140 100644
--- a/include/drm/drm_buddy.h
+++ b/include/drm/drm_buddy.h
@@ -145,6 +145,10 @@ int drm_buddy_alloc(struct drm_buddy_mm *mm,
 		    struct list_head *blocks,
 		    unsigned long flags);
 
+int drm_buddy_free_unused_pages(struct drm_buddy_mm *mm,
+				u64 actual_size,
+				struct list_head *blocks);
+
 void drm_buddy_free(struct drm_buddy_mm *mm, struct drm_buddy_block *block);
 
 void drm_buddy_free_list(struct drm_buddy_mm *mm, struct list_head *objects);
-- 
2.25.1

