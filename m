Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63BA4851F10
	for <lists+dri-devel@lfdr.de>; Mon, 12 Feb 2024 22:05:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7A2610E649;
	Mon, 12 Feb 2024 21:04:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="LYwb13iW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2083.outbound.protection.outlook.com [40.107.244.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF10310E22D;
 Mon, 12 Feb 2024 21:04:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VNglfy8NHyZ8Dslpsj4D1lX4SgQDwsL3jGNzaSR5qyvTUtLnT3n236+IyAZIg9c/FL/iTdbDTMdIUTxun3e92+HEBohN7yIgkuOPHFh1WP28r3p28UBdF0M4PQQKTJpiIhPpQqnv05h4+W78MdBdWez0RZBzIU4Szo/GP31AAEwxT8fA79s5ojpVUuKttIxmgZyAFhWmurLzC2wz4LrVyO0pKuz3Ry49dX2RwX3c7XlbbszG5kJKnE3CYtI1mAAmFjfD42KQgCziCW5o5VEva4Y3x8FnS2xwSjMaK354UqKoshsXU5AUUqpEVmbiAbrl3//f2VEbxRdNnH3KwrrUjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XBOTU3gLXyog1pj6k0Xvv+X/e5HLrfrfl6QX1SZIVkQ=;
 b=cz123V1palqdeI5DJFwI34Q6OcmZOiUDxtnk5kzfDZrQn9Bl4YGr05iuMVCXquDTBCXFfc5UUp0oEnG/iZfAbRrY7hiQDNcI73nGB7QnwZax/CZAQsMDDJA5wb6c0gceOWIVZao8SU546795iyERB6G+FuxqVHk/7a4N0F9KscZAOnujRVou1nO9dSSatINbkUL0ksfODodobhNFebTu2/IEbY22slLXnYdLoI/NrZydimC35gdedaMXIGPCQ92W8kANoKSDTfrn8HqKpJKTfWw1f7PDmOcLxRpbokjjy0vPqUOa4uU0u0CWgUcqT5fK44ke/p25zrDVLnXk0OaNaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XBOTU3gLXyog1pj6k0Xvv+X/e5HLrfrfl6QX1SZIVkQ=;
 b=LYwb13iW9JRlJ3DYwEQarBy/zxfVE14fAfaNOKZUcNTACdbyv5NWKuBwGuOA6DUBtyfqIoXjnzUeOE0zji7qkhAnqkH8rjVIdKHw4CjTl6cfVbC7RDbOrCuFozFmnLticNOropbo6/uzyIx8O1MDJlGLn2qpZo9x5UOKNrmW7Dg=
Received: from CH0PR04CA0061.namprd04.prod.outlook.com (2603:10b6:610:74::6)
 by PH0PR12MB7486.namprd12.prod.outlook.com (2603:10b6:510:1e9::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.25; Mon, 12 Feb
 2024 21:04:46 +0000
Received: from CH3PEPF0000000E.namprd04.prod.outlook.com
 (2603:10b6:610:74:cafe::d6) by CH0PR04CA0061.outlook.office365.com
 (2603:10b6:610:74::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.39 via Frontend
 Transport; Mon, 12 Feb 2024 21:04:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH3PEPF0000000E.mail.protection.outlook.com (10.167.244.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7249.19 via Frontend Transport; Mon, 12 Feb 2024 21:04:45 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 12 Feb
 2024 15:04:44 -0600
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <tvrtko.ursulin@linux.intel.com>, <daniel@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>, Tvrtko Ursulin
 <tvrtko.ursulin@intel.com>
Subject: [PATCH 2/6] drm: add drm_gem_object_is_shared_for_memory_stats()
 helper
Date: Mon, 12 Feb 2024 16:04:24 -0500
Message-ID: <20240212210428.851952-3-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240212210428.851952-1-alexander.deucher@amd.com>
References: <20240212210428.851952-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000E:EE_|PH0PR12MB7486:EE_
X-MS-Office365-Filtering-Correlation-Id: 922fb86c-d671-4f24-445c-08dc2c0e3ddd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zgK8Lpx18KXe2JpXG6MaGgUWby7gJwqo3QTtzyEkDY3VDWvPLbRkuz7An9U3JVrch8Azbsr5lBHpI2UM6MYx6MoC9/oYNsrH3gawn+4OjtXcUI0gQZkq6ZmibGrDQRwExF5mdv2XsBIlXPCgzUtnDwS3oMZIddUrb28h4kzn4CFUVs5J4HaUqQvyCp6LjqlhSNYu82nkTLtoQA81ADyQgcNl2madIW2ekBty0wYL5hCXo/r8IUHwfeKcOFfyfa3Bzy/DMWDu0JX502+17lIStLoCDYcKic6Pem2jenrk8PWUC9q2x97Wh1L3von6avz+asVeT5yfE9L7MN+/5W5skmSLuvHTl2XQBulySES+JGp99eFzfMQFMMoWHLjemux5GYNBsDyo0s95aEYxCABAx0Q6eG2c+S89npSPhM5NiXzwbE+LdssH0Gio2T6n1d0iCY8Bkz2ZfZk54+l6Nq/Ct+z1p5xQYtnjnjo1T/b92KVzuiFrIeZMMXA1zJblO9tc4kAAPn7GoyLm8e6j0ofp08tSo+B3F1oDN4gGVsAm3WyPIfwhQ+CYuiiWQ+iFk1AEtO36hHb7vqe+NZITk8wCwA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(136003)(376002)(346002)(39860400002)(396003)(230922051799003)(64100799003)(451199024)(1800799012)(82310400011)(186009)(36840700001)(46966006)(40470700004)(2906002)(8936002)(4326008)(8676002)(5660300002)(336012)(426003)(83380400001)(2616005)(1076003)(26005)(82740400003)(36756003)(16526019)(356005)(86362001)(81166007)(110136005)(316002)(70586007)(70206006)(54906003)(7696005)(6666004)(966005)(478600001)(41300700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2024 21:04:45.8374 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 922fb86c-d671-4f24-445c-08dc2c0e3ddd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF0000000E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7486
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

Add a helper so that drm drivers can consistently report
shared status via the fdinfo shared memory stats interface.

In addition to handle count, show buffers as shared if they
are shared via dma-buf as well (e.g., shared with v4l or some
other subsystem).

v2: switch to inline function

Link: https://lore.kernel.org/all/20231207180225.439482-1-alexander.deucher@amd.com/
Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com> (v1)
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 include/drm/drm_gem.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
index 369505447acd..2ebec3984cd4 100644
--- a/include/drm/drm_gem.h
+++ b/include/drm/drm_gem.h
@@ -553,6 +553,19 @@ unsigned long drm_gem_lru_scan(struct drm_gem_lru *lru,
 
 int drm_gem_evict(struct drm_gem_object *obj);
 
+/**
+ * drm_gem_object_is_shared_for_memory_stats - helper for shared memory stats
+ *
+ * This helper should only be used for fdinfo shared memory stats to determine
+ * if a GEM object is shared.
+ *
+ * @obj: obj in question
+ */
+static inline bool drm_gem_object_is_shared_for_memory_stats(struct drm_gem_object *obj)
+{
+	return (obj->handle_count > 1) || obj->dma_buf;
+}
+
 #ifdef CONFIG_LOCKDEP
 /**
  * drm_gem_gpuva_set_lock() - Set the lock protecting accesses to the gpuva list.
-- 
2.42.0

