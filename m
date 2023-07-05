Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D918748E7F
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jul 2023 21:57:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6681E10E22B;
	Wed,  5 Jul 2023 19:57:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eae::600])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B811410E085;
 Wed,  5 Jul 2023 19:57:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aHTrNJjDXs4v+j6SF9Ife8ka1HaZkoG8M9u1L1jfwATbjVe8Kz27B5xbTLPyYvivcax8JancXR4ciIGlh3wLlnGsJCYMSCa9VCCwzj2BHbhbkuivo03bwHJQdR+TvrpcleCBev5OGA4SVzBEmIGPiwQWWZXX93G4S7lOz6hiGlV+SGhvrHFTUJn0NS2idWjnGizrGR/c0HMnhsXM0HYlGNbdzlWEw8cEvZLL2a8yUHjwzetvr3eRf86nlQ2LZ43MO+XEk3K6G1kbWofoASpvPLgQyaMkjRC+D4P1XWarb/Wp/3+zGXdhCFQpOjAgpWgI036FlM1gT+v/Ozfk2qHdww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D/Y/u0TZlbl9xphP1g/L1TMvxjfSTyGUygVz3nu4V6s=;
 b=JGFctDFbUdKks+flFUFf80PIagTRYScR26UqeWuTNdaCyG45Ishhf6reVR3jaPE5/DJz+CBNa+M3o12f9Uq92xJ3OXJ6RnTjhen6mqawJ7hgecumre2AuEtzUoSGksWSxgEaITrL9RjrIQzCCjw24rLKGs9tPiDFziQZcqwQHMEHsfpQAJaHczOXoOwihDfqehSonJTX/AB1Mlaq1gTkD3bfZArLX1b1e1pNFzunjeyPticc5dwn088wrXwIyLMIczjaDX/vlzF0big8YGc28D5bbS9JP348GiY8PVuLG6rzXP4HQ2ETaZoZ+JIu02JJZNXtyxGb7kuHmtow1engLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D/Y/u0TZlbl9xphP1g/L1TMvxjfSTyGUygVz3nu4V6s=;
 b=bpT6xMoia1XtGUzsnj+/QOS/loG6fUy6rBpKMuCaIARsb7z44dFe8LgXeOYQI9nduvGLok5CpuHH+ZSJYi2HDzfm9aLQ9+tZgVpxCuXmjwM5W2Nut5TRakdaEm5UdT1zl/UvsFv4iQb9RV5PLZ+dF6M0ZqiA0sX0QEM00mvckT0=
Received: from MW4PR03CA0274.namprd03.prod.outlook.com (2603:10b6:303:b5::9)
 by BY5PR12MB4098.namprd12.prod.outlook.com (2603:10b6:a03:205::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Wed, 5 Jul
 2023 19:57:24 +0000
Received: from CO1NAM11FT096.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b5:cafe::d2) by MW4PR03CA0274.outlook.office365.com
 (2603:10b6:303:b5::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.18 via Frontend
 Transport; Wed, 5 Jul 2023 19:57:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT096.mail.protection.outlook.com (10.13.175.84) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6521.45 via Frontend Transport; Wed, 5 Jul 2023 19:57:24 +0000
Received: from rajneesh-desk.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Wed, 5 Jul
 2023 14:57:21 -0500
From: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/ttm: Use init_on_free to early release TTM BOs
Date: Wed, 5 Jul 2023 15:57:01 -0400
Message-ID: <20230705195701.30141-1-rajneesh.bhardwaj@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT096:EE_|BY5PR12MB4098:EE_
X-MS-Office365-Filtering-Correlation-Id: d0fd6298-6bcc-4fd3-dc0c-08db7d920d45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: khnCM7tnU/k2FwSMHjJptkfpKMG7rJxBOX4BsRVeUk3y1a/LCMASmMSLs+MKujsVWNvXqh0rTP6aTavYWCOeqtIahrnD0dxvM2A1xYOG1zdSr+GxSVdwZD5yCA6qHkWKUba9QtttgxqdIJmePUovUbWeU78O9wdCRb8kQzsUZvmAO6kNKQNsBufHjjJ58G38WAJOphZN2SlAFZt3usk0nrA3fBqfpkx38w8E/umRLyhoPcM8t5v7gV0FQnHvbBIJyy0Fiea3h3BoDzZGIN1Dw5fD3gOKe5CbeTfz6/tQAvYd7JcZQKv71AJRcDf0gI4Qy6+1OcSPVlCjrbTKi4/nxPAqFIjVnfT8ryOm6KMcuAp4ewtCQzU08rTRKOkwRh9HqWZLc+MQddv0+7khMKJakUuB4qNWMdnHEwWVPKxWcbFveaYKknA2zR1/xQabLCJqh0R+//oPDdlDOMqpy92d76Kr725M+oVNJA+1VxDPMk0tUw5nXCkm/G5HXsQmgp2tyDHJL8Ux0deMLyVj+fsqToaR/6o6gVTX/JPbQHz3/TJLRXVLa5nxmLeYaw6X1QziUVVnqfZVb+QlAy5nc+/GKmkG2rcj5TajMrBzDJySG0Ob/yMB56fN+jW1im5qqVCYESMDIZLwe/LbPenptuP/HboMomymVRq0kafS3WWq1sYKGlku5LdhJs/UNFMSjqGoIZzlsLYn9fWzfEGquetLaWJ5bYkaUTjXosDcChZ5Ej9OS898wNzA+kYOadXcW3hfUoDYgMYIUK/cDfbuBfgDkQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(39860400002)(136003)(396003)(376002)(451199021)(46966006)(36840700001)(40470700004)(40460700003)(450100002)(70206006)(4326008)(6916009)(70586007)(2616005)(356005)(81166007)(82310400005)(186003)(86362001)(36860700001)(16526019)(1076003)(26005)(47076005)(83380400001)(426003)(6666004)(336012)(82740400003)(478600001)(7696005)(40480700001)(54906003)(36756003)(4744005)(41300700001)(8936002)(8676002)(2906002)(5660300002)(316002)(44832011)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2023 19:57:24.2874 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d0fd6298-6bcc-4fd3-dc0c-08db7d920d45
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT096.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4098
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
Cc: felix.kuehling@amd.com, Christian.Koenig@amd.com,
 dri-devel@lists.freedesktop.org, Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Early release TTM BOs when the kernel default setting is init_on_free to
wipe out and reinitialize system memory chunks. This could potentially
optimize performance when an application does a lot of malloc/free style
allocations with unified system memory.

Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 326a3d13a829..bd2e7e4f497a 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -347,6 +347,7 @@ static void ttm_bo_release(struct kref *kref)
 
 		if (!dma_resv_test_signaled(bo->base.resv,
 					    DMA_RESV_USAGE_BOOKKEEP) ||
+		    (want_init_on_free() && (bo->ttm != NULL)) ||
 		    !dma_resv_trylock(bo->base.resv)) {
 			/* The BO is not idle, resurrect it for delayed destroy */
 			ttm_bo_flush_all_fences(bo);
-- 
2.17.1

