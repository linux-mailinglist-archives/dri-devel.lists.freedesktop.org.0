Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 725E467B5BF
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 16:20:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E4BF10E7E5;
	Wed, 25 Jan 2023 15:20:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2069.outbound.protection.outlook.com [40.107.95.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CEC910E7E6;
 Wed, 25 Jan 2023 15:20:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ao7U2le7KMWQXJx31xDu8M4phABY/Ps97QE0m5a12OycQHu/bWvVgsC9Yx4GyW+pxoz6Y82rYaJcgoKfBM4B9wEGQY5hUfaSV1mAI5ttnv1+f+TRTEITiFacNoK2ZSrjfhpGeZ1rUqtgp41/7R9tD75ICDo/srIBogvYd9JsGkAtpiOKGGBsl+SxZjNJVUbfmR0mZ/mTNcIeu+SDsIpIyFR4g+IKLZLP8d+B+Cptq3lbuV4os8f6btKOPjqsDY4+rdn0tj5RZpWWWcN+yvZfq2ylaupYp7Nz1OE9AEXZ4i1ZP3KSnL9hv8tT9cx/oLdhps/BduQw7/Dc3b3qNnkL1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A22QUjgyBJt+DQEA8e/+iGgtcSFwuiFt/KkSM+Sx/6g=;
 b=d31ZYeG9bJdXofk5jlSu+toDY5kC/qQEJK+1XC2LzSSV7+A/5yqHUD0WpV4bAaqvNAflnLWgfxWygSanTUb5ASPOjrYBy4lDyBMuXm9DH1WHPBnZrbJgEV2D24dtZCvu3wWVzmP1PYzUWwCXYy+Y7IUONsKrYsMf/y7wq94XQgjth1wgl0OOQ2oNi3cYtYnjWFKWf072c4sexod769QKXG0bChBLJen84ubtfynE0HaKOcykfCeWXIj7ZSF51jXuRZTaC4Nj/3kHwB7Mzmp5c2+XGU4sP9muacdXDK8Wgx+3v+vCKycHzlUJVK2IP9/a2K0fSmA7tcNizraZjQzd3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A22QUjgyBJt+DQEA8e/+iGgtcSFwuiFt/KkSM+Sx/6g=;
 b=OYqSxpeAdYGmCfF2NlMLpVpnnzH23HdshxGQq6XU+M/eT2UDNaB7idwoQ43Vd6gfCuQmVvmbS7znL3Ul+rA5WDXt0QKjVs7UbxK9QuKm8wzPUOkS0SLN7nNk8fywgdfm88LMqaTbCxYfZTuGe8JEDC6dtPXz0S9v0fF7e2nnyBA=
Received: from BN0PR04CA0113.namprd04.prod.outlook.com (2603:10b6:408:ec::28)
 by IA1PR12MB7664.namprd12.prod.outlook.com (2603:10b6:208:423::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.17; Wed, 25 Jan
 2023 15:20:40 +0000
Received: from BN8NAM11FT102.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:ec:cafe::72) by BN0PR04CA0113.outlook.office365.com
 (2603:10b6:408:ec::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.21 via Frontend
 Transport; Wed, 25 Jan 2023 15:20:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT102.mail.protection.outlook.com (10.13.177.27) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6002.13 via Frontend Transport; Wed, 25 Jan 2023 15:20:40 +0000
Received: from amar-X570-AORUS-ELITE.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Wed, 25 Jan 2023 09:20:36 -0600
From: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <nouveau@lists.freedesktop.org>
Subject: [PATCH v4 2/4] drm/amdkfd: Use cursor start instead of ttm resource
 start
Date: Wed, 25 Jan 2023 20:50:04 +0530
Message-ID: <20230125152006.3945-2-Amaranath.Somalapuram@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20230125152006.3945-1-Amaranath.Somalapuram@amd.com>
References: <20230125152006.3945-1-Amaranath.Somalapuram@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT102:EE_|IA1PR12MB7664:EE_
X-MS-Office365-Filtering-Correlation-Id: 8343f944-4a37-4de9-1413-08dafee7b824
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: svMq//QQUHLQsqYSzkUHrpptaHmaH+dt2YsmMC+hm3uZ7RSzu3ZXIo//MRWuYp7LfVaq4LkCUyjvrIk+wNaL5EdV1C0Sjs2Pq5oi1mIYy5ACdgGIcbnWJDoMbU9tbwnsz7dD/0iLvp9WxpfyaF3Hy7se+pHXvdbu9b0Exld0ds8ywsyq3sJ7L/JFD4fpfSVo11h7f5Xqt0bmDYHywgazdiwivU6G7kMrpELVgq4OMGUjSgkNJ3atEmBKBqIY7ZuJsU4cLfZaALd31gtlHkUxgRydVupfwzjS1yjF0eBF7FciQk4U+/cwgQhD72gqHr/HHmaZFxnqRIO0ICdI6x0+vA6q5wLt0IihK5zS1mCzync9ThfnW5bS6y1GgE/+tDKeizY+CuFDwGfcwFBW1n01mEWankZXxwTYWk1RDzAGiOyl2as64lV57xA7zTWbEyzAx43skTNTzdjDUliZ9XyDdUeiZTTx9mLoeNasXgczLSlLTOJgNfHiQ5qPrMdRrieh/ITbiczE7Z6QYGmWCY7zAWT6xCBaeHjnROVa99nGjti6/vhbr8W/9sdqULaqDNTdvE5St2LcZZnQJ1hJdbrMmbFTZ44aeBvZI632pngTeXEtjiNUNZqW41DVVXsM2SWt6btaai9Nevc9LERpDGVc1c8AOrpufRvgZ7K/OFos6/jAgcgRE0my5ubEFEcot/wJw9kj9nUR+nxzk9T6sfLnhiyCDXGqBVgxyCmLSA84/nc=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(136003)(39860400002)(376002)(396003)(451199018)(40470700004)(46966006)(36840700001)(5660300002)(8936002)(2906002)(478600001)(70206006)(70586007)(4326008)(450100002)(8676002)(41300700001)(1076003)(7696005)(6666004)(186003)(16526019)(26005)(2616005)(336012)(426003)(83380400001)(82310400005)(47076005)(82740400003)(316002)(54906003)(110136005)(81166007)(356005)(86362001)(40480700001)(40460700003)(36756003)(36860700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2023 15:20:40.6150 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8343f944-4a37-4de9-1413-08dafee7b824
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT102.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7664
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
using amdgpu_res_first API.
v1 -> v2: reorder patch sequence
v2 -> v3: addressing review comment v2

Signed-off-by: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
index c06ada0844ba..9114393d2ee6 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
@@ -200,8 +200,12 @@ static int add_queue_mes(struct device_queue_manager *dqm, struct queue *q,
 	queue_input.wptr_addr = (uint64_t)q->properties.write_ptr;
 
 	if (q->wptr_bo) {
+		struct amdgpu_res_cursor cursor;
+
 		wptr_addr_off = (uint64_t)q->properties.write_ptr & (PAGE_SIZE - 1);
-		queue_input.wptr_mc_addr = ((uint64_t)q->wptr_bo->tbo.resource->start << PAGE_SHIFT) + wptr_addr_off;
+		amdgpu_res_first(q->wptr_bo->tbo.resource, 0,
+				 q->wptr_bo->tbo.resource->size, &cursor);
+		queue_input.wptr_mc_addr = cursor.start + wptr_addr_off;
 	}
 
 	queue_input.is_kfd_process = 1;
-- 
2.32.0

