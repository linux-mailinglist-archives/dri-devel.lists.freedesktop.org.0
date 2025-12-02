Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D81CC9AF7C
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 10:51:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AC8C10E5E7;
	Tue,  2 Dec 2025 09:51:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="J4iXZn3M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012045.outbound.protection.outlook.com
 [40.107.200.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54AE910E5E5;
 Tue,  2 Dec 2025 09:51:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q+95xU1pGHA+ujfuMmM5FVjkXGFJjNwxELW1t0NY6qw0k8bla0U74ZaMmeSeleFpPbxupB+RRC//7JeKFBpbINCmajV+pxg8M7KFNT39ku/1ttpEm0VxYrCN5mImeYXoHBxCqdx/ZHkXyeOYlnUecpBNxqMrl7n5svtoZoadsvD4zPXxAlmeC26p6QlSI4VyHzKXhvn1EFWdkfOhXCc6Th/tfclz72mGKH0h5K6HMbDiV2iwlrvX/do3wSDKEMgqqK3Iojt3aC6vUgjU3YZNmMVeI+g7BMrnFzyEfuS89OTPbmqHHTC+UIzWxGSOmaaRpVW1qdKJK1Ry7Uwo7LMYeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tD9TH/HKeDunhxtE2q/fLTrWQ+1Ypl/E5EfYD8RyBEs=;
 b=bZuxGQ15ZbkMgK5BzY57rm9XBPP+IEB9MEAnb6KDpyTQsUPzN5XSmz15ZN29oQSa96AVbB+ZH6ZgMwNlfWSVZElp9bFCh9BoPpWOPAluW0Ow7qqb2U3OGtLBp71gt/+OEhx7tk40GHjWdGji50DLJFr7qUniej5rDQaGh+wxWvhewJHQtonMW5DEFgMD1pq05tCgxUUSn4OkSJZBS4KHj6PsHXHuakFgrxcvl/7GDSlDkl1obG4KKKk49KJjC2lhhpF4S6jt9QGIHczIsPfb9UNgJ2JvHqYBqiSS6dja0iMurPAspvjfaxbQRN0/wVTNUNXJIYuYDHh1seWVk9bJqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tD9TH/HKeDunhxtE2q/fLTrWQ+1Ypl/E5EfYD8RyBEs=;
 b=J4iXZn3M0xhaFHTckbYyHy2G4e7Q+wQ3FGdfwmjHOXmQ80C9uEA1Vupk1oEnWPRj03SQya8TAxzk21PSG7pzzytYc1uJDOe66S+jExwbIvYhhR1aNXrHBqR/7pa3ETsngSg+GETdQAOM5oe9Nf98ep1dId5ndNYBOwpZ8JcMI04=
Received: from MW4PR03CA0219.namprd03.prod.outlook.com (2603:10b6:303:b9::14)
 by DS5PPFEAC589ED8.namprd12.prod.outlook.com (2603:10b6:f:fc00::667)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 09:51:37 +0000
Received: from MWH0EPF000A6734.namprd04.prod.outlook.com
 (2603:10b6:303:b9:cafe::7d) by MW4PR03CA0219.outlook.office365.com
 (2603:10b6:303:b9::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Tue,
 2 Dec 2025 09:51:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MWH0EPF000A6734.mail.protection.outlook.com (10.167.249.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Tue, 2 Dec 2025 09:51:37 +0000
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 2 Dec 2025 03:51:28 -0600
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 10/13] drm/amdgpu: double AMDGPU_GTT_MAX_TRANSFER_SIZE
Date: Tue, 2 Dec 2025 10:47:20 +0100
Message-ID: <20251202094738.15614-11-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251202094738.15614-1-pierre-eric.pelloux-prayer@amd.com>
References: <20251202094738.15614-1-pierre-eric.pelloux-prayer@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6734:EE_|DS5PPFEAC589ED8:EE_
X-MS-Office365-Filtering-Correlation-Id: da4fa863-a170-48ca-ec11-08de318862c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RUhtY0dXV0Q1Q25QWmQxMDZueDhQalpIUk40TDhWY0lYNzg5MkllTS9CMG9Z?=
 =?utf-8?B?Q2IwVGpMd1dKQ3ppTUpjUjh3dzV6UHRhalppMFU1dG91NHlzNWpTd2RyRmhS?=
 =?utf-8?B?aFdZdStBazQ0ZVFzQlZ2cG13Y3FOcjVWd1Rka21OT2NabURscjlxS1NNNk9I?=
 =?utf-8?B?S1B3ZFhVVzFKZWUvM1FwT0xlYmVZVnhkUjBoNXVERndSak5OM0RZMWdjM1hw?=
 =?utf-8?B?TTg3TVF5VlZYM2t2NjVONVlPaWdtQmU1U1Z6OFdtV2VNZklhOU9IK2FKS1Nm?=
 =?utf-8?B?c2dHUzZLcFlrR1dDLzVHN2VPL0xzNGZqZ3U2LzFwdmY5enpnTkVUMmpiSVQ2?=
 =?utf-8?B?YjM1MGExZEd0VGd4WVN2bjgvUWRTNVZHdXgwOEUxc29sN2drMHkrdlRpNi9E?=
 =?utf-8?B?emY2MS9MdDZKbzhUdndScHdVQmxuODZibnovaEd6MHFZVzNBZUFuZytDMlgz?=
 =?utf-8?B?OGF1T29WdlZzanB4bTh0c3JmRUFHSDE5S0xGRGhyaGRvZng2Nm5ZSklITHgz?=
 =?utf-8?B?V3RkRkl0WmZGY2FDMGRMNHdhWHdvaEYvS3FyMEI0VDlvTERtUGZ2K1VjUlJ6?=
 =?utf-8?B?OGppcklhRmdHaG9CYUE2V1p0Nk1kczFHb3BrVlNRLzZwNVpnTG1TYTdkb0xS?=
 =?utf-8?B?bVIrQWE1VENxOGFWWW9sWE5FajRBUkJoQ3JHdlNJVlZnOHQzWjM3MUJjQW5R?=
 =?utf-8?B?ZkQ5R2xLNFVVNTQ4eXd0WE9IeitnZGVndjlVQndzRndyK2tsanFpekRlRWhM?=
 =?utf-8?B?NER2Q1RLaTB0S1p3WHYzeXJ6elhLSFRwVHBWc2F2Z2l5dkhnUURBSGVZNEQw?=
 =?utf-8?B?TDA0NnFGbVlPQU04OWxwdE5wQVV3MWRrZWZ6aDJpYWZkNlNjUTJvbDZFSlV3?=
 =?utf-8?B?NHNpYVFCQ01uMWhqVlUyLzUyU0dNRWJZNTBsSEhNSFJwVjhvQW5vSUFXSVo3?=
 =?utf-8?B?ZHBZVnVJVXNRd2VoUkt2bXQ2L1h0eW9PQStOSVZRYVpXcEFlY0dieTVRd1Nh?=
 =?utf-8?B?aGZDV1QyZnY1TFRFOXpYT2hNZUtJeHRON3VocTVHMndCVms0OW5NSUtxbTFI?=
 =?utf-8?B?QjN2SUF6eWN4WUQxMGMrb2FjVXBBZE82d0F5azZtYU4xekNJVWRiaUkzRUpF?=
 =?utf-8?B?L0QyQ1orcXk1VVVRUnBWZHRqamJlRWRhbnJ4ZU41SGQ0dUtVK21hTWpuR3gr?=
 =?utf-8?B?MUZiSHBWN1dnWE1MOG1zTk9TSHQrc1lzUVNTRC9KL2dIRExtQ3BoeWhCUSsw?=
 =?utf-8?B?dnFOU1p6MkJhUWZsdjd4N1B0aXBHSHNjMGo0ZVVUSUhOUDY3K3pYajhOSHdV?=
 =?utf-8?B?UUtqdHZiN1pMMWFuSmJMQW9SNjdFVlFIcGFpcW54eFQwVXNKbTVOV1p2QSs3?=
 =?utf-8?B?bGJCOU1lWTA4V21yR3cvcGttcmxoMUtjQkh2K2p1MUx4cEttY2s3NFllYXkx?=
 =?utf-8?B?VGdNYmcvVGdzY2x6eTl5bTVKTGVQajY5T3VwMUVTTjhoaHM3VldycVhROHRi?=
 =?utf-8?B?TGhtN3Rhei9IMnBtdzVnWGtqdUlUTVRGbkRMdmNvbXZXMnJvNWhnZE41TUx1?=
 =?utf-8?B?aEJjUDNmZVU4Z2JHVVdrUlIrMTRCYzYzcmV0MGdhaUVzR3Bac05qdVNSdDhp?=
 =?utf-8?B?VnBsSTdHMXlXQjR3aFBXYmQrbmd4VjkyaThTYlArRURXVjd5N3pObkd3bTFI?=
 =?utf-8?B?dlArU0QyYkYvLy9XcW1OcG5kQ1BtRlIzU3licHZLUUg0bFlya2xnVmxSTitS?=
 =?utf-8?B?aHRzM0JFRmlma2lsQTNrTnUrdnlmTkU2MGgxVGN4L1NucS8zcVZ0RytWeHlN?=
 =?utf-8?B?bGE4a2NaSmhyWjJJbC9NUkdMK1hyaWlHZWpaQSs2RTJyN2ZUR2lnekNNOVB4?=
 =?utf-8?B?RENjRkJjZFdJMmZhU1VhbTdsNi9rUnNHallYbWNQbUlCZzB4UDB1UDFwZjN2?=
 =?utf-8?B?RUVyakJEMkR5elhrZWRtQlBkV3BRLzV3Z3RFMnYrUHQ4N1h4emNKK3AvdTdu?=
 =?utf-8?B?Z0o3SS9iNkRDL1hVM1lHOFBYWjQxZk5sZFFRdHFZZG9pV0VtMUo4NkMzTTds?=
 =?utf-8?B?YmgxVE1sS1J3VHRGSTIybW51b2pwRUZlOFovQzFPcGNaQy9pRUl2QU9zS29B?=
 =?utf-8?Q?a8Nk=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 09:51:37.4045 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: da4fa863-a170-48ca-ec11-08de318862c1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000A6734.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPFEAC589ED8
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

Makes copies/evictions faster when gart windows are required.

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
index 2b9f143ab968..1f15157b3b3e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
@@ -39,7 +39,7 @@
 #define AMDGPU_PL_MMIO_REMAP	(TTM_PL_PRIV + 5)
 #define __AMDGPU_PL_NUM	(TTM_PL_PRIV + 6)
 
-#define AMDGPU_GTT_MAX_TRANSFER_SIZE	512
+#define AMDGPU_GTT_MAX_TRANSFER_SIZE	1024
 
 extern const struct attribute_group amdgpu_vram_mgr_attr_group;
 extern const struct attribute_group amdgpu_gtt_mgr_attr_group;
-- 
2.43.0

