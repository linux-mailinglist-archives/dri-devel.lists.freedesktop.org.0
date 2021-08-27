Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7996D3FA0B3
	for <lists+dri-devel@lfdr.de>; Fri, 27 Aug 2021 22:39:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A8806E9C6;
	Fri, 27 Aug 2021 20:39:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2055.outbound.protection.outlook.com [40.107.244.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 635D06E9C4;
 Fri, 27 Aug 2021 20:39:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nsE6E9b1kaLJA2lT+4MSLAieTpIWi7HaqQE3Y7a5h/Nx9uKawBlRfjvrU8dTqOp364yjtzJ3v1MXhtw8AFrehrsi+IQwdfNGovMIoGOug7lhIw3KROxoPSmPXp1wRqEzWXYbIlg5yyqmW8Wf+/mSCR+856rsHnxwM23zxSn5c9/b6gxEOdcK5LMVMXrfaYo/01c5KKhona9W/MGQJHNQhbw0eQaarIpBKX0Yqia8LniMCV1EAqeFKWUZEHb98PZVDg8DnNiZo8GqT5qTpwU5ESGWvK9N2wKY9BWdbyhxAOysRuhRzmY7AY8dk3wYOHue5Sgq9+q3ii/AxxCR4nK43Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8RCxkVSnIiuESSryJAyDhBVJSPBV+Cn0g1VMezY9JM8=;
 b=Ontq4X7b7mibMt9T/zOWS0/kkcz3nsHI3BIsX03F4cR+DYMtWBC9yBMCA4OqlP3uVSy6GYY6DSf4ScO8MQCrr21qgZZ91tmthqtx190UuhHrepMoKTeiyeRsoXrd4q9OFEdWwQI23UlrN5bk2qegWK27G58FGncBMiBfcg0AoRxy04Y392vC6md4K22tNOqbXl2YOD7olEsFVZlQs3gEUn7/h7nn2rIzJ/4J2oKruiUvkpk/FNS5tjEt3WydB6ElT/37tJoWIm3HHLyEY7wADY+UNrlF+BBml6SFO5xFTb7g77vircCc5mjfGjAOBAVas5dja9vZ6c7ZX7GGwgkyNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8RCxkVSnIiuESSryJAyDhBVJSPBV+Cn0g1VMezY9JM8=;
 b=eDS3Ee3+Ach1N5pHWAPdEZeLZ5Sxb5vgujVleWtb/Gm9SoelVvQZAFT6aDfUaaVtV9kgzPZuy0rWYVlkb7qmHEGNNRwnCyfURbUFzUVImbiRfuUVjiveQeOASL0vg2yNuZ6vvnFED5c+ZQQ11eKUwe0quaedpCnweQNrigrQxlc=
Received: from BN6PR1101CA0017.namprd11.prod.outlook.com
 (2603:10b6:405:4a::27) by BL0PR12MB5538.namprd12.prod.outlook.com
 (2603:10b6:208:1c9::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.23; Fri, 27 Aug
 2021 20:39:22 +0000
Received: from BN8NAM11FT050.eop-nam11.prod.protection.outlook.com
 (2603:10b6:405:4a:cafe::49) by BN6PR1101CA0017.outlook.office365.com
 (2603:10b6:405:4a::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.20 via Frontend
 Transport; Fri, 27 Aug 2021 20:39:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT050.mail.protection.outlook.com (10.13.177.5) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4457.17 via Frontend Transport; Fri, 27 Aug 2021 20:39:22 +0000
Received: from agrodzovsky-All-Series.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Fri, 27 Aug 2021 15:39:21 -0500
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <ckoenig.leichtzumerken@gmail.com>, Andrey Grodzovsky
 <andrey.grodzovsky@amd.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
Subject: [PATCH v3 1/4] drm/ttm: Create pinned list
Date: Fri, 27 Aug 2021 16:39:07 -0400
Message-ID: <20210827203910.5565-2-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210827203910.5565-1-andrey.grodzovsky@amd.com>
References: <20210827203910.5565-1-andrey.grodzovsky@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2ca27049-87ba-4b3c-dc96-08d9699ac04c
X-MS-TrafficTypeDiagnostic: BL0PR12MB5538:
X-Microsoft-Antispam-PRVS: <BL0PR12MB553830BF4D1BD3A026E30A4AEAC89@BL0PR12MB5538.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2512;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6TxiFgiqWrhq939l+NZwXKbQXPnERdysItQmiTFAOx5K//5JnTB3XNxt1V9r3Q6ZV/vmyMzqwVkneeXDGHyRkP987GG1LUS13FtW+bSZchO422QyzzTsnND3kH3zp9Ht4GcYDUv10yMDq2nppJWe768T3m8lwcuAQiR+Xcj7lGn1yIKB8Kt6m/jL8e6P/dunVZ+YG0pBFWANaBUGlNwRheuauXtwvxFgNVncxGlNkCzi7Yk2pq4m9TNK9V+XyR39YKFYlZdMGNubd5l34brjvyOXGZ6ae+QUb8p1EsPmdCuxdfesKvWnVyCeH6DOG+SsPvrPVmxL9MvqXOqcwfYAw61sWSgdO6ym4loEKDETiqlWrSGa4bp580YCo6RU5r8FSsxgNvnOEr/ekkqhRQQ/JJq6fb1w6dw8+l1k09zuxRYepHIkEPVheQ71Khvk6jn4Jah+OlmYyr5Td8x7b2IDNkSGKqwgjnlglkjCG4ZCePl/xHgKdzmjb7oVa19647PLWhEN2ojMVhaxUIYZ2GdgVcRj51hKeJx6oT+VyXW4XZZHaiOVLebsqV5nRfKpcelPFsxKG8XdUuPJU/4h5s4/Mtc99MRbBHca671s+/keSHf3yD6vzd0O5MNNeBVKKj4xKTbjQVhx5yKFbKZsFaZm3YSesLw+3fOVlohl7e9+ePPk20GFwj4BFuSXPIzDE8w3lbKhfDjJ4xpGOZA+Cn4qn8e+ZbCiUTaAaF9OARyXdY8=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(136003)(376002)(346002)(46966006)(36840700001)(36860700001)(8936002)(2616005)(336012)(5660300002)(478600001)(47076005)(426003)(2906002)(26005)(36756003)(8676002)(86362001)(6666004)(70586007)(7696005)(82310400003)(54906003)(356005)(82740400003)(70206006)(81166007)(16526019)(44832011)(186003)(316002)(83380400001)(110136005)(4326008)(1076003)(66574015)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2021 20:39:22.1348 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ca27049-87ba-4b3c-dc96-08d9699ac04c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT050.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB5538
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

This list will be used to capture all non VRAM BOs not
on LRU so when device is hot unplugged we can iterate
the list and unmap DMA mappings before device is removed.

v2: Reanme function to ttm_bo_move_to_pinned
v3: Move the pinned list to ttm device

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Suggested-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c     | 18 ++++++++++++++----
 drivers/gpu/drm/ttm/ttm_device.c |  1 +
 include/drm/ttm/ttm_device.h     |  1 +
 3 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 1b950b45cf4b..1fedd0eb67ba 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -69,7 +69,17 @@ static void ttm_bo_mem_space_debug(struct ttm_buffer_object *bo,
 	}
 }
 
-static void ttm_bo_del_from_lru(struct ttm_buffer_object *bo)
+static inline void ttm_bo_move_to_pinned(struct ttm_buffer_object *bo)
+{
+	struct ttm_device *bdev = bo->bdev;
+
+	list_move_tail(&bo->lru, &bdev->pinned);
+
+	if (bdev->funcs->del_from_lru_notify)
+		bdev->funcs->del_from_lru_notify(bo);
+}
+
+static inline void ttm_bo_del_from_lru(struct ttm_buffer_object *bo)
 {
 	struct ttm_device *bdev = bo->bdev;
 
@@ -98,7 +108,7 @@ void ttm_bo_move_to_lru_tail(struct ttm_buffer_object *bo,
 		dma_resv_assert_held(bo->base.resv);
 
 	if (bo->pin_count) {
-		ttm_bo_del_from_lru(bo);
+		ttm_bo_move_to_pinned(bo);
 		return;
 	}
 
@@ -339,7 +349,7 @@ static int ttm_bo_cleanup_refs(struct ttm_buffer_object *bo,
 		return ret;
 	}
 
-	ttm_bo_del_from_lru(bo);
+	ttm_bo_move_to_pinned(bo);
 	list_del_init(&bo->ddestroy);
 	spin_unlock(&bo->bdev->lru_lock);
 	ttm_bo_cleanup_memtype_use(bo);
@@ -1154,7 +1164,7 @@ int ttm_bo_swapout(struct ttm_buffer_object *bo, struct ttm_operation_ctx *ctx,
 		return 0;
 	}
 
-	ttm_bo_del_from_lru(bo);
+	ttm_bo_move_to_pinned(bo);
 	/* TODO: Cleanup the locking */
 	spin_unlock(&bo->bdev->lru_lock);
 
diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
index 5f31acec3ad7..530a9c36be37 100644
--- a/drivers/gpu/drm/ttm/ttm_device.c
+++ b/drivers/gpu/drm/ttm/ttm_device.c
@@ -208,6 +208,7 @@ int ttm_device_init(struct ttm_device *bdev, struct ttm_device_funcs *funcs,
 	INIT_DELAYED_WORK(&bdev->wq, ttm_device_delayed_workqueue);
 	spin_lock_init(&bdev->lru_lock);
 	INIT_LIST_HEAD(&bdev->ddestroy);
+	INIT_LIST_HEAD(&bdev->pinned);
 	bdev->dev_mapping = mapping;
 	mutex_lock(&ttm_global_mutex);
 	list_add_tail(&bdev->device_list, &glob->device_list);
diff --git a/include/drm/ttm/ttm_device.h b/include/drm/ttm/ttm_device.h
index cd592f8e941b..03fb44d061e0 100644
--- a/include/drm/ttm/ttm_device.h
+++ b/include/drm/ttm/ttm_device.h
@@ -265,6 +265,7 @@ struct ttm_device {
 	 */
 	spinlock_t lru_lock;
 	struct list_head ddestroy;
+	struct list_head pinned;
 
 	/*
 	 * Protected by load / firstopen / lastclose /unload sync.
-- 
2.25.1

