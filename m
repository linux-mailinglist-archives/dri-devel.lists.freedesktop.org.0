Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E01767B04C
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 11:49:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9C5810E0EE;
	Wed, 25 Jan 2023 10:49:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2074.outbound.protection.outlook.com [40.107.101.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2E4910E77F;
 Wed, 25 Jan 2023 10:49:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yr6WDDjeuf1aYtpz3c69aVGBUsfKUPZIWZ7f6FbOaiohlzamEliOnarSH5WDS6Tri8DmkK27izQOG1mN02vGBTtPhnJH4rRTMcZtR7YxGerbKAHo3BG3d5+vnLCi6D0cdPAXHcxM36s2pRyXjro3t3kPB5qxZPwpK9pTQ8cfjh+dckLxti5HFTj8Hn02LXFuA9vliiCWfVpQEDz6i9WFgbPvqzgJMZO8ZCLSmpO+SfUGmQvJ+0xwcG8WjvTARLGgqR+8Z7xViG5HcHBwZb/BNgKtRYnk6T3Yovlr3IW2ryUNtw6ti8tmW3ASJOUzTKukkP482ZVay13tkGHedh/YCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2OjU3Uf1jKly6VGS2xb6CAxNsnFfr7d/YjQufQfdGUo=;
 b=U8lHuYM0EJhNHHmMlwEKmvsAWAv8QRCKUmKePEncH/OvKvvD3xxMqOoxHkG0r06+Eaf7AP8VygQ34ZfAIPuZAI74SrqjdM07WmHLazZxZcMQ0rFGDFJm7kkTEdoLMVlGIreuIcFyI26ou6ZamAgP9zb3G5vCBVDrZr+3PgRKLMk0Hj7c8GVii+AKia8/2aq/mQ+HqfjoXOs2VSwSU3Uq26vsL21UEJ6nPCN2wxrEYcEjqCeLkk/QOwd5NMz6MrTEhj4HXsBHmXJ6f0kmzbUKi9PYTEBhe5iRW3Q40/CSnX7SdngIgBSUXW02yBhDdRAFYoWZ4IzSHPwIri1cXBCJeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2OjU3Uf1jKly6VGS2xb6CAxNsnFfr7d/YjQufQfdGUo=;
 b=sFDIos5OA+V+CvYNdi27q0xMeL7y1NlNLKrl+1sWj1BbU56OwO0Th/VIHSvgrb/jmRGPcADg2/feLt0nTGHJ0b2iOVeDHl1wSyE5t7YFKyEIWqxE3KTyrWs1VupeCl8WlHO87fgS2fzcWZI9m4PRttRnLS3WZRtV+KyrbWaBQgc=
Received: from BL1PR13CA0113.namprd13.prod.outlook.com (2603:10b6:208:2b9::28)
 by CY5PR12MB6179.namprd12.prod.outlook.com (2603:10b6:930:24::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.21; Wed, 25 Jan
 2023 10:49:11 +0000
Received: from BL02EPF000108EB.namprd05.prod.outlook.com
 (2603:10b6:208:2b9:cafe::6c) by BL1PR13CA0113.outlook.office365.com
 (2603:10b6:208:2b9::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.21 via Frontend
 Transport; Wed, 25 Jan 2023 10:49:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF000108EB.mail.protection.outlook.com (10.167.241.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6043.12 via Frontend Transport; Wed, 25 Jan 2023 10:49:11 +0000
Received: from amar-X570-AORUS-ELITE.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Wed, 25 Jan 2023 04:49:08 -0600
From: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <nouveau@lists.freedesktop.org>
Subject: [PATCH v2 2/4] drm/amdkfd: Use cursor start instead of ttm resource
 start
Date: Wed, 25 Jan 2023 16:18:36 +0530
Message-ID: <20230125104838.23596-2-Amaranath.Somalapuram@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20230125104838.23596-1-Amaranath.Somalapuram@amd.com>
References: <20230125104838.23596-1-Amaranath.Somalapuram@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF000108EB:EE_|CY5PR12MB6179:EE_
X-MS-Office365-Filtering-Correlation-Id: d98a8ae0-d6c8-4a00-31f3-08dafec1cadc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sLP7jlOT1Nwu4/tgOorwq3AGbnknzNCiIFXwE6dZ8prSxe0FUISoPE/xZprVNUInxrYqUdOCFEraHcfqLpPdLobwrhn9/Fo6MgZ6c26eUws2m/8gZYxNUbngPgrzReKdqyM+HYFXPNvr1lQZ0Tjqs+v1PKUryr9reHU6HdKfWIhMvabF/CWff5vlxnw+AtG7ShUUzJBfNS00EdJKCCMmBvBb4RT48DBkUh3ZK8LCXtSxRkvEi9+nSsgtHbKNODhD2m5so3dfTQvuGflIXvQ2hxz09j7NXkQ19X0P3jhBMLIQoMK04BhyVDy8PQ7KmupbNmuhlrTYZl+iYIcum667yRkj2k05VqE/TiIZdAWFr+eS0w0ImCXZvj1f7ybrgkCq6B5F0gErc23jbEVQUscnRqYjYyhvIFHstTCGXjmpQs1LQd15nQokOZe9DLzcwCom6Jwh81pon8kuvmMPhl9U5DN864dGvTBotIUJqk4nel0NE3M7TfJ4ywiXwr6p5dOK6qrglnjpAw9Oa6CjH2nCJZ2F5s8+Kqmq65vUoDyDgjQeGxFm7Rp8ome61Qeh1YXViIUtz0msQ4DgVK8m1pJU5trWoBk5Op0uQrk8WtZ8HcCw98soekMnFxI724ycmP/h/oJDDx9bn6G6iDvpgLnTjYPkirevvmxTf53gpgOCP8Cl1wBdL3JmX9YgxRKeR/Js1C6P/WoCLXgxROop+3t1DWP7umnoEtGyI1loprdUDEM=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(396003)(136003)(346002)(376002)(451199018)(40470700004)(36840700001)(46966006)(47076005)(82310400005)(54906003)(86362001)(40460700003)(36756003)(40480700001)(81166007)(356005)(36860700001)(82740400003)(110136005)(316002)(2906002)(41300700001)(4326008)(8936002)(70206006)(70586007)(8676002)(450100002)(5660300002)(16526019)(186003)(26005)(1076003)(2616005)(83380400001)(7696005)(426003)(6666004)(478600001)(336012)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2023 10:49:11.1605 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d98a8ae0-d6c8-4a00-31f3-08dafec1cadc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF000108EB.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6179
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

cleanup PAGE_SHIFT operation and replacing
ttm_resource resource->start with cursor start
using amdgpu_res_first API
v1 -> v2: reorder patch sequence

Signed-off-by: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
index c06ada0844ba..f87ce4f1cb93 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
@@ -200,8 +200,11 @@ static int add_queue_mes(struct device_queue_manager *dqm, struct queue *q,
 	queue_input.wptr_addr = (uint64_t)q->properties.write_ptr;
 
 	if (q->wptr_bo) {
+		struct amdgpu_res_cursor cursor;
 		wptr_addr_off = (uint64_t)q->properties.write_ptr & (PAGE_SIZE - 1);
-		queue_input.wptr_mc_addr = ((uint64_t)q->wptr_bo->tbo.resource->start << PAGE_SHIFT) + wptr_addr_off;
+		amdgpu_res_first(q->wptr_bo->tbo.resource, 0,
+				 q->wptr_bo->tbo.resource->size, &cursor);
+		queue_input.wptr_mc_addr = cursor.start + wptr_addr_off;
 	}
 
 	queue_input.is_kfd_process = 1;
-- 
2.32.0

