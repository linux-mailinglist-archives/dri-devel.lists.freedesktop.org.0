Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 628C8472123
	for <lists+dri-devel@lfdr.de>; Mon, 13 Dec 2021 07:35:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB25310EAC8;
	Mon, 13 Dec 2021 06:35:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2055.outbound.protection.outlook.com [40.107.220.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D07310E734;
 Mon, 13 Dec 2021 06:35:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aZYKXOvKSAdeES6m3vNpb2mpHYaBvJfgFVLlNHbgPm29K3CfPupxouGXGIQmHRo4Gnl+nY+PMq+jdO6d3UR1J9pia3KCnsNQwSnDYg6KDKXOZZZgk++7BQlGN90KE2cxRQF6XJMIdv1FcRLRNmXB4GurE4MBRZrzTI5NCHacoDGTqyu3gjHLRUeE/ViKL9cBK8RalJDAhrYWJ+Zw5YcUXVVBE8QI4OfsdmElB1su24ABBvBSmpgnJlIGRrTEElfXyODR6x6TMFuP51MICL1+/6pkry3Q+zLAciphoGXrsgjat8YIUFydLB0KhzdGqrwoRH04YnNF0HR+jgdM39kFDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OtFaLkXyIDaegFPZ1ycvUm7Tna4b2hyRVXN0VAM4SYE=;
 b=PFLLSbOn6YR9ILz/NEvb1jtJ08EdhgDnO57FIKUFGbBZs149BC+XMjbTSDhMEDp+62JkDtFZg1umR+FSvM2g/UTu/9q3i+lNAnx2lAlooCAMnPBn6Xrx5Xcv6AsB0BFpzcwgZPqq8B5PmkafsdXObKJi8QmbpV7z707/lQDU7HZFdS14MzOiYDUGwctv/PzF0207ao13BpyYZg+JN2UC0wPyTfd8IAjEMD6hIdTTDOifhM0xjkQF4frRkQrHiBNxbieqSLizbKRHN/66vu9Zbdk5wGYGK2gu5xrgu8AHNFdvNdcZOI8Y83wRdOGQqqpneAxo5fq3i69wpyQM3wJlBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OtFaLkXyIDaegFPZ1ycvUm7Tna4b2hyRVXN0VAM4SYE=;
 b=vW0oj2M2ZZfCOiqv9mwbpN9ap0pDNf7yselfdqBSUb2wbzHXofjFdji0MxPw0HmpgMDGb0iJt7Ad/3leYDx8iwSdpIrIAkaE+7dRJ+VTNZ5VNDiPHHb8zwh68sRaDOZCzcOm69akVFoQoFvJiI2sG8Bh2vyJSjLUk/FfgpeBStA=
Received: from DM5PR21CA0016.namprd21.prod.outlook.com (2603:10b6:3:ac::26) by
 MN2PR12MB3325.namprd12.prod.outlook.com (2603:10b6:208:ce::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4778.17; Mon, 13 Dec 2021 06:35:00 +0000
Received: from DM6NAM11FT018.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:ac:cafe::77) by DM5PR21CA0016.outlook.office365.com
 (2603:10b6:3:ac::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.5 via Frontend
 Transport; Mon, 13 Dec 2021 06:35:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT018.mail.protection.outlook.com (10.13.172.110) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4778.13 via Frontend Transport; Mon, 13 Dec 2021 06:34:59 +0000
Received: from hr-amd.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Mon, 13 Dec
 2021 00:34:56 -0600
From: Huang Rui <ray.huang@amd.com>
To: <dri-devel@lists.freedesktop.org>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, "Sumit
 Semwal" <sumit.semwal@linaro.org>
Subject: [PATCH 1/3] dma-buf: make the flags can be configured during dma
 fence init
Date: Mon, 13 Dec 2021 14:34:20 +0800
Message-ID: <20211213063422.2232155-1-ray.huang@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB03.amd.com
 (10.181.40.144)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 75041765-a86d-444e-c086-08d9be02af91
X-MS-TrafficTypeDiagnostic: MN2PR12MB3325:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB332542E459D14DF33673EDDAEC749@MN2PR12MB3325.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vVecrs46S7J0or84IWwwun6frnIFPRwBwJ0bZeAiDFTV1VfI/Jk7h1/aUsz4tP890srgL8vTA+u1xA+tgv3jdHvNHA3X30GI3fqfVM6/Xwd4Oyp1+82JNuCyyQ5FAiVrrBNJIN/g0zIZFKEdVXkTHBKX6ict5KERdWpG4gIvZUCJyK+UvWWJ3AfR3P1kVtkS3DzpziWw30cDN/1igfm0ey1ASG5+A/52kZGWG2p10jxvwFIOmwKiCL4buMV9EoRirSV+Yks4cUSB8Luk7OEP+SzxHBppjeo7zn53fdogap/AuCRjWN4EdInNZSrloa1H+tmM32X/C+bL9guvL5QYIGKkuSfSGXL3s1a+15OIE3SXPuZoJ1yvV70YEPCr5DAvK5rXqEYXyL83mO2hIeAsXoD0jI40Yf91rfZqx0SsbyO01EZ8zYiBqun0XWhUAvr52lb76gMCiqgloDw9tEDW8OMrwNyyCAMs+cZ9KdKsZMzseEuKqccLvIlTkHfXvcPIGhLLd1xEjZxqEVoz3vXl467wzs6E+heEfyRqL9d/0BLfTl3+nHaZTJ8EAspekeiBCdu6XA6Cb3nUVP7hzS0khhyeI1eHzj2TCbwC7Y+TIQjoW7reRua3cM4ipVTLZ0c/gRms5rt60aNizz0riyMaMUR/lFYKY2mbZSNBGhV9Umv1ZmVFW8vRgOwpQSC33OGI8tAk1ZyHuGn5aDAHOAZvnMkHeszcViEYTNc41aC8AF7YgY73G+NvTOVGls//efdBhSqOS+rOC6BCEh+KjfT3pE6COwsmF2QBB5uRibcYPPQ=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(40470700001)(70586007)(36860700001)(5660300002)(110136005)(54906003)(47076005)(40460700001)(316002)(81166007)(508600001)(4326008)(26005)(186003)(16526019)(70206006)(426003)(336012)(2616005)(6666004)(83380400001)(1076003)(8936002)(356005)(8676002)(86362001)(36756003)(82310400004)(2906002)(7696005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2021 06:34:59.3631 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 75041765-a86d-444e-c086-08d9be02af91
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT018.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3325
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Huang Rui <ray.huang@amd.com>,
 Monk Liu <Monk.Liu@amd.com>, amd-gfx@lists.freedesktop.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In some user scenarios, the get_timeline_name callback uses the flags to
decide which way to return the timeline string name. Once the
trace_dma_fence_init event is enabled, it will call get_timeline_name
callback to dump the fence structure. However, at this moment, the flags
are always 0, and it might trigger some issues in get_timeline_name
callback implementation of different gpu driver. So make a member to
initialize the flags in dma_fence_init().

Signed-off-by: Huang Rui <ray.huang@amd.com>
---
 drivers/dma-buf/dma-fence.c | 2 +-
 include/linux/dma-fence.h   | 7 +++++++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
index 066400ed8841..3e0622bf385f 100644
--- a/drivers/dma-buf/dma-fence.c
+++ b/drivers/dma-buf/dma-fence.c
@@ -952,7 +952,7 @@ dma_fence_init(struct dma_fence *fence, const struct dma_fence_ops *ops,
 	fence->lock = lock;
 	fence->context = context;
 	fence->seqno = seqno;
-	fence->flags = 0UL;
+	fence->flags = ops->init_flags;
 	fence->error = 0;
 
 	trace_dma_fence_init(fence);
diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
index 1ea691753bd3..f9270c5bc07a 100644
--- a/include/linux/dma-fence.h
+++ b/include/linux/dma-fence.h
@@ -131,6 +131,13 @@ struct dma_fence_ops {
 	 */
 	bool use_64bit_seqno;
 
+	/**
+	 * @init_flags:
+	 *
+	 * The initial value of fence flags (A mask of DMA_FENCE_FLAG_* defined).
+	 */
+	unsigned long init_flags;
+
 	/**
 	 * @get_driver_name:
 	 *
-- 
2.25.1

