Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 214CE587DB7
	for <lists+dri-devel@lfdr.de>; Tue,  2 Aug 2022 15:57:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 231CC12B91E;
	Tue,  2 Aug 2022 13:57:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E5BB12B4B8;
 Tue,  2 Aug 2022 13:56:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YlCY2hm8HjhoQj2B9H1O5vG2d69HwC6MEhR0WwUKBbvQ223buzvLcbnd6dAe95Z5BvRCgi5Iig8r+NP4V7hemgvG7NBnHDw4EZYwT4oF2pJeRmm3uJ2DUceczmEBVvCGzT0oIQMFHDpGIUuTT54d8CwxD5a3Ky02jfi1NcfSYM2U2jKeoSXl2to4tDkBIlTQUGX1jvdV1fST8nh0FycqEKnKXCLgZhE4A9tBCaKLDRm05hboeb3HJ16OePzEzwPhgyo6G7D0npAqVN0/JoXk8K8jYdqklMmemS9pOu15gmAIAi+o8HWRbz9Rt8xItOo7scf2RFcD+zqwS+UyBf6f4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=07rKqOfi8idh2z9f04pFc8dPa0f0rUOJ0gYwYAiuTIY=;
 b=gutRrrhQBOShOEkvtP/9bvxUjjS9OdwhLt6PE/1GOaB4/kEBZY6FfAW3b5dgRD0E+o91HZlIGq+a6q2G8zzCbNnLro5xClGIeRZWNzRCCtnUzWI2cespTbggECPNR8+PdIo2dU9Erd9VTtDd33SBL14ZiLSsoVHOc0GQzSQ2MZPPi9e5/KAZF4y2ILNV1MxwZxB7ydzzEK8ycZthfJCKbAHBta4paNU7ijqyiexf6zcdt0UmpdwCj+4qbDyS+eGjgJNb6WSGi023Z94S5omd51QzXQrGeYOtgyWGJIjcIFkaPpGuot201VE2fKf3QyvXWBtdTagEdtCwFLJEkL7O7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=07rKqOfi8idh2z9f04pFc8dPa0f0rUOJ0gYwYAiuTIY=;
 b=YH9a5yoO8gn/twnRXaeH4DmzhckxXAcNGIRqYY6oHlcnZp2xnhV6UPm2A8C3s+vfDcgctlJZr+U7NDH9N++VZPlZBU37Iq/JLSdF5OwNzecVN2TSeecO6sbrAO3jk6Eg02fQLE4b7gU2gK3EWDpsupRepEeXC+8dlwPHjj3ygak=
Received: from DS7PR05CA0014.namprd05.prod.outlook.com (2603:10b6:5:3b9::19)
 by DM6PR12MB4009.namprd12.prod.outlook.com (2603:10b6:5:1cd::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.14; Tue, 2 Aug
 2022 13:56:40 +0000
Received: from DM6NAM11FT020.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b9:cafe::ca) by DS7PR05CA0014.outlook.office365.com
 (2603:10b6:5:3b9::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.7 via Frontend
 Transport; Tue, 2 Aug 2022 13:56:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT020.mail.protection.outlook.com (10.13.172.224) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5482.10 via Frontend Transport; Tue, 2 Aug 2022 13:56:40 +0000
Received: from shashanks-target.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 2 Aug
 2022 08:56:39 -0500
From: Shashank Sharma <shashank.sharma@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] amdgpu: add context creation flags in CS IOCTL
Date: Tue, 2 Aug 2022 15:55:58 +0200
Message-ID: <20220802135558.6324-1-shashank.sharma@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6e2b447b-d1d8-44a7-08e0-08da748ed37b
X-MS-TrafficTypeDiagnostic: DM6PR12MB4009:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fJu1WrJgmV+60qWZQXxKxdH83oSot1r4dX5qHFrEcWoBtYiiG+XdtsX4VnvVmUgMwRlxDLvkebYMGMjJi2g3vZlBx15we2m7a7ZESf4VYG5flxxC1v7Uj4HxGgPO3m83Gi+duDXa/S+nBOFWG15bIQuRMG1ZpFXQnTjycj71ZWvq9AD+LCCgmazYrvB9ITqwZWspgs181XiCN4K6xzat56oPzyRTCe3ZZpZKOYBjfUpgt/xIkOpOifiPCdA7DWzqDs1E0kw9qzq7UCgaMc/E0sPbdpBoSbWcZEXpqUdbeEX0lRmaBpqmrA/Mm2BgQn5Vlle7EAd90zfDoyHsUgIsbBEJ4+iablzkWs/c+JbQ4CJXVJr4dQ1Ub/8Pw08TAdzCmDwzxlSBThnUZOx47hTYMDnmqsrKkRXiY7FT4YfUM4mLvwcE8Je6m5LmKjAn4tmsBDw7hAdvnimGHPBSBorqGhN5O/UyrWmuo5l3hGU6Rqmnbb5QHX4j8JtCjZC5Kb+9CIpLtjOklXNwoVNvDkZ8qQrvVksmslArGRcJNqakROJLIvA697pAxzSuELtD+P9Z3qyzmrTzQLc4UZv6Tk8tXPYKr5JQiEKAAqsLDyWv3+OMUXNQcrN0DWzLGNOLYwRkXXaWDSQI4zQTZ/MJIUvNYG9m4xMlaAvb4LTPan16AsjidI1fJUHpLQd4WqlrgXM7pZ/jal6zQTdwgdxaREOGbeW00cRsFJlSpK/1cvKb7KvwXYYjny1J00JkhdtAminNluGqDp2RBWBvFLLCPOUyq8mShHmoaasf0l1W59SHiTi4059BTtn9ehiEL4ioZz5hJe2rJdW0yOOoIXxbZCet4g==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(136003)(39860400002)(376002)(346002)(46966006)(36840700001)(40470700004)(40480700001)(83380400001)(6666004)(54906003)(2906002)(7696005)(316002)(70586007)(5660300002)(450100002)(86362001)(81166007)(356005)(82740400003)(70206006)(8676002)(4326008)(110136005)(40460700003)(44832011)(8936002)(36860700001)(41300700001)(16526019)(82310400005)(478600001)(36756003)(186003)(1076003)(426003)(336012)(47076005)(26005)(2616005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2022 13:56:40.7486 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e2b447b-d1d8-44a7-08e0-08da748ed37b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT020.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4009
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Marek Olsak <marek.olsak@amd.com>,
 Amarnath Somalapuram <amaranath.somalapuram@amd.com>, Christian
 Koenig <christian.koenig@amd.com>, Shashank Sharma <shashank.sharma@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch adds:
- A new input parameter "flags" in the amdgpu_ctx_create2 call.
- Some new flags defining workload type hints.
- Some change in the caller function of amdgpu_ctx_create2, to
  accomodate this new parameter.

The idea is to pass the workload hints while context creation, so
that kernel GPU scheduler can pass this information to GPU FW, which in
turn can adjust the GPU characterstics as per the workload type.

Signed-off-by: Shashank Sharma <shashank.sharma@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Marek Olsak <marek.olsak@amd.com>
Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Amarnath Somalapuram <amaranath.somalapuram@amd.com>
---
 amdgpu/amdgpu.h          |  2 ++
 amdgpu/amdgpu_cs.c       |  5 ++++-
 include/drm/amdgpu_drm.h | 10 +++++++++-
 3 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/amdgpu/amdgpu.h b/amdgpu/amdgpu.h
index b118dd48..1ebb46e6 100644
--- a/amdgpu/amdgpu.h
+++ b/amdgpu/amdgpu.h
@@ -874,6 +874,7 @@ int amdgpu_bo_list_update(amdgpu_bo_list_handle handle,
  *
  * \param   dev      - \c [in] Device handle. See #amdgpu_device_initialize()
  * \param   priority - \c [in] Context creation flags. See AMDGPU_CTX_PRIORITY_*
+ * \param   flags    - \c [in] Context flags. See AMDGPU_CTX_FLAGS_*
  * \param   context  - \c [out] GPU Context handle
  *
  * \return   0 on success\n
@@ -884,6 +885,7 @@ int amdgpu_bo_list_update(amdgpu_bo_list_handle handle,
 */
 int amdgpu_cs_ctx_create2(amdgpu_device_handle dev,
 			 uint32_t priority,
+			 uint32_t flags,
 			 amdgpu_context_handle *context);
 /**
  * Create GPU execution Context
diff --git a/amdgpu/amdgpu_cs.c b/amdgpu/amdgpu_cs.c
index fad484bf..d4723ea5 100644
--- a/amdgpu/amdgpu_cs.c
+++ b/amdgpu/amdgpu_cs.c
@@ -44,12 +44,14 @@ static int amdgpu_cs_reset_sem(amdgpu_semaphore_handle sem);
  *
  * \param   dev      - \c [in] Device handle. See #amdgpu_device_initialize()
  * \param   priority - \c [in] Context creation flags. See AMDGPU_CTX_PRIORITY_*
+ * \param   flags    - \c [in] Context flags. See AMDGPU_CTX_FLAGS_*
  * \param   context  - \c [out] GPU Context handle
  *
  * \return  0 on success otherwise POSIX Error code
 */
 drm_public int amdgpu_cs_ctx_create2(amdgpu_device_handle dev,
 				     uint32_t priority,
+				     uint32_t flags,
 				     amdgpu_context_handle *context)
 {
 	struct amdgpu_context *gpu_context;
@@ -74,6 +76,7 @@ drm_public int amdgpu_cs_ctx_create2(amdgpu_device_handle dev,
 	memset(&args, 0, sizeof(args));
 	args.in.op = AMDGPU_CTX_OP_ALLOC_CTX;
 	args.in.priority = priority;
+	args.in.flags = flags;
 
 	r = drmCommandWriteRead(dev->fd, DRM_AMDGPU_CTX, &args, sizeof(args));
 	if (r)
@@ -97,7 +100,7 @@ error:
 drm_public int amdgpu_cs_ctx_create(amdgpu_device_handle dev,
 				    amdgpu_context_handle *context)
 {
-	return amdgpu_cs_ctx_create2(dev, AMDGPU_CTX_PRIORITY_NORMAL, context);
+	return amdgpu_cs_ctx_create2(dev, AMDGPU_CTX_PRIORITY_NORMAL, 0, context);
 }
 
 /**
diff --git a/include/drm/amdgpu_drm.h b/include/drm/amdgpu_drm.h
index 0cbd1540..d9fb1f20 100644
--- a/include/drm/amdgpu_drm.h
+++ b/include/drm/amdgpu_drm.h
@@ -238,10 +238,18 @@ union drm_amdgpu_bo_list {
 #define AMDGPU_CTX_PRIORITY_HIGH        512
 #define AMDGPU_CTX_PRIORITY_VERY_HIGH   1023
 
+/* GPU context workload hint bitmask */
+#define AMDGPU_CTX_FLAGS_WORKLOAD_HINT_MASK    0xFF
+#define AMDGPU_CTX_FLAGS_WORKLOAD_HINT_NONE    0
+#define AMDGPU_CTX_FLAGS_WORKLOAD_HINT_3D      (1 << 1)
+#define AMDGPU_CTX_FLAGS_WORKLOAD_HINT_VIDEO   (1 << 2)
+#define AMDGPU_CTX_FLAGS_WORKLOAD_HINT_VR      (1 << 3)
+#define AMDGPU_CTX_FLAGS_WORKLOAD_HINT_COMPUTE (1 << 4)
+
 struct drm_amdgpu_ctx_in {
 	/** AMDGPU_CTX_OP_* */
 	__u32	op;
-	/** For future use, no flags defined so far */
+	/** AMDGPU_CTX_FLAGS_* */
 	__u32	flags;
 	__u32	ctx_id;
 	/** AMDGPU_CTX_PRIORITY_* */
-- 
2.34.1

