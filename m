Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4740267B44B
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 15:25:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C23810E7D3;
	Wed, 25 Jan 2023 14:24:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2052.outbound.protection.outlook.com [40.107.244.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5804110E7CF;
 Wed, 25 Jan 2023 14:24:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Eh2HFFLHpnQExS/B6NIRTek5xG5DhTLBdm1KCKFfeW0a5I64Q19PajdbsL0fcT9rCtU+DANJfOVEuUMcrmZsSnBoL+qsJxTK8A3MDT9xrE+rHc9HXCshj8NoAwZ2RReDSPMcn3/CuN65hlqVX6Z+Ftv8Okz2gDjTg7hDVYFS/LW0GWTch9bUeKNazNzQhe9YziVUyRX8oVy3jck2p2JtLwt2afQfUslKp9mnHs/dUWQ0f3DsojQmVq/zkoumFAM8iGQ+n1VHuS++IDLV+CiyROEOiYH6bN52g5/HNsEq1BY8z1Whv6WwkmOCZf3wLdudrXgZOg1rYhgNJUm2vTSO1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A22QUjgyBJt+DQEA8e/+iGgtcSFwuiFt/KkSM+Sx/6g=;
 b=WqUBV/ni+oBXRQqjfYJSbGv9h6uWf+p1VUnyLi6j3s6dQxLO6Aavy4wXeoIac06uSbTaxQ07CmiQFf8QImCcPxl2BrENMyTDmDbIzinJd+Hmqulbn9nCAfW3JUKJiwIBlZhCzMszrCH3tGPEPwoVkXF0RwvwkBJtA47GEPlJIn6m61SsCfdi2BUKwTK0wV4c+ph8mHsVjfs7O6achAm1oxFSG/ouUpxxNaxVHSrx99/1ePCwTJkWmUq3L6u0HkIe0LCLLDq/uNd5WMuUJk3ASyDkBhDlNgZ0SNSyXA+2zHUr3Xuxs/B+9rmBW0sGnGMeEuFV2fZhbPXHxHqZgVJgig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A22QUjgyBJt+DQEA8e/+iGgtcSFwuiFt/KkSM+Sx/6g=;
 b=0CQjdJBlgVu31z09nCbAFFeqRF60CF9A6IT4MqQdoFBaCrH3d5FjpVT4CjAwbSRYqOp2tySUpROBfU1fKZZt3WCCPJ7NQwtji7AqGVwXF+a04iIBRR9wAL2nAB0EgjPkvVSS+xTg77L+EsUepEcAh5vyADXWRWz7/efRIy1Dskg=
Received: from BN8PR03CA0024.namprd03.prod.outlook.com (2603:10b6:408:94::37)
 by MN2PR12MB4080.namprd12.prod.outlook.com (2603:10b6:208:1d9::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.21; Wed, 25 Jan
 2023 14:24:50 +0000
Received: from BN8NAM11FT109.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:94:cafe::5b) by BN8PR03CA0024.outlook.office365.com
 (2603:10b6:408:94::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.21 via Frontend
 Transport; Wed, 25 Jan 2023 14:24:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT109.mail.protection.outlook.com (10.13.176.221) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6043.17 via Frontend Transport; Wed, 25 Jan 2023 14:24:50 +0000
Received: from amar-X570-AORUS-ELITE.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Wed, 25 Jan 2023 08:24:46 -0600
From: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <nouveau@lists.freedesktop.org>
Subject: [PATCH v3 2/4] drm/amdkfd: Use cursor start instead of ttm resource
 start
Date: Wed, 25 Jan 2023 19:54:13 +0530
Message-ID: <20230125142415.18546-2-Amaranath.Somalapuram@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20230125142415.18546-1-Amaranath.Somalapuram@amd.com>
References: <20230125142415.18546-1-Amaranath.Somalapuram@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT109:EE_|MN2PR12MB4080:EE_
X-MS-Office365-Filtering-Correlation-Id: 1dab5202-a2a0-4731-891a-08dafedfeb09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qG9j4JlY1E/i6yj3PSRXQ85d0EAbQyjqxgZAmHsKKFQoK4TK/BdualHqa3X2ube3nbEJ1ATo6hkV3wofP7Ncn0XxcZ0WffxHnOBtdf4H5W2PZ9U0bNGEqMQuS8+8cP97cfTK4WqhUyt9Umyu10sWpjmhhaZKhU0eGUj2Cga/bOtk8F8fUUKx8/z4J3jjCk7wwEOnSRlZtcn2ZVvYtdvc1dQdAHy4M4k2jfsj38qQKzLKz6LFNGzWmleNi1vVcj+R5RA41WZZOWm4RonzCWRDodRE9kQ/j4uagr5KV3zeRsxOuGB7s0bf4/lkV1nQI5yQqb8wqMbfbRjy16NgBslpfvR+TaLKNZIimzpsEzjy7MlNYdDYjURewwaXu7+QUhjEuNIaywqdnPiChdU96m5i9cjmSNXqJJY1Cay+SBVMIWipP19Jibnkmc6gl4rq0J0dDanMt7nSAipGLt3hnHNm7LrCEgVgLdlTyy3lCRFB5fAXJdPTCrUeEL+MsbG9N/SnPDRH3L5n/zxNqSwn9i7GSZRDFUfS1QommwVDnsXcPOghFnHhfEAuvS3GbQMzmnYPeWxBQKh2sCY7lW6bqeifbF68pKfkIrYyCLBDaFgG7I7Vfb0T55su5JT1avZVxuLsqud2N8lqrfiwfnuV9UfIFVQjN6oyNpMsI99o0rlEn8J4MvlC8QraqS51TKsYKBQ1XupDtm4EnD3Xt5f1Qj3fRdTNWUDU/4/xJRu7EUZX8m4=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(376002)(346002)(396003)(39860400002)(451199018)(40470700004)(36840700001)(46966006)(86362001)(5660300002)(40460700003)(36756003)(2906002)(478600001)(83380400001)(36860700001)(6666004)(16526019)(1076003)(316002)(426003)(47076005)(336012)(26005)(2616005)(186003)(450100002)(54906003)(41300700001)(110136005)(8936002)(8676002)(70586007)(70206006)(4326008)(82740400003)(82310400005)(81166007)(40480700001)(7696005)(356005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2023 14:24:50.0310 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dab5202-a2a0-4731-891a-08dafedfeb09
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT109.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4080
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

