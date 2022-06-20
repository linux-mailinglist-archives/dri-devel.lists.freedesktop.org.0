Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AFDB5526CF
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jun 2022 00:03:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EBEC10F733;
	Mon, 20 Jun 2022 22:03:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2073.outbound.protection.outlook.com [40.107.223.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02F9710F71A;
 Mon, 20 Jun 2022 22:03:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nlxUYuE4JIUbbukviJ4pnGhH0u569tQFY4n7kN5dt55oqKcMZHHAkW5u9Gf56WSRqsXBUl1UX91Kd9OPXeKML+/bwGMVhBFi9JOXGwY4zr18UAnFZ4FJojExOMMHHLD3vxF4ne2IoXdjLfoxb8mhc62tbCRZQxOofsnS4kAEz4ywMSCkzG/uWxrknYBiAFPA7BiQyBBFHkcBg8XWvEqMioi1NAieNPn2MczU3+78/rn6eklOfcE4rXjiDT6zJvN6uR8MLDqWYv2Q6b9jYslwbHTVn0Ly+d0DQ/x9z+fLeapspa34cFBHmFzw0snjY6Qrcuu0snUaYWXOuHz3CfA/SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IhcHFtYWc28Slyzx/KOSERtchaMmg24dOdiu1M0Q2dk=;
 b=mzyYlTmMp6rPtPchwrVnfM6lPBv8A67GLuMDfkzToEj36R6ZObbRuFsLDaYc7hraxa6+0B4Vta6UvpBK6pqcrRr2Nm7TXVc5Hop9yx1RxXFNwdYHh8k7aobnao7LjtyjqwisCc2p9DLvUmxn9l/Gp1FEoLGmXhf2J5goT9rizcotlSwqW5qs79nXOcygEaJzl5hnT5hV7d55C6rcINZr6T3IVvolLy7WS8xyjIN7FBX3v8xxhJM0M25hEqAd/uTL38LRwJKNao7GiZIugk5bA7Zn+HAedC6i7ajbAKGNMDuh1ZyTKezKt502MDNMe/2kAzhvnGzhkTOFF/hmMxyCqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IhcHFtYWc28Slyzx/KOSERtchaMmg24dOdiu1M0Q2dk=;
 b=4HkJf6PdWBIqj855AHatcLxLLPLVZ6GPv1pLgLMS3+5Lv8mvlrOhEVfWvdKiJiKblCkLZMiWFZ9a+Q5KoZ2DXA2j2SFNLchRzX0F3iVTPH3L8byABg0hF10sG9aWaWisKaFHmRJjWZm5itqCMYPS4fQKQvC3C9jQIYuBm2YwgT0=
Received: from MWH0EPF00056D03.namprd21.prod.outlook.com
 (2603:10b6:30f:fff2:0:1:0:d) by MW3PR12MB4394.namprd12.prod.outlook.com
 (2603:10b6:303:54::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.13; Mon, 20 Jun
 2022 22:03:41 +0000
Received: from CO1NAM11FT054.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eab::207) by MWH0EPF00056D03.outlook.office365.com
 (2603:1036:d20::b) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.2 via Frontend
 Transport; Mon, 20 Jun 2022 22:03:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT054.mail.protection.outlook.com (10.13.174.70) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5353.14 via Frontend Transport; Mon, 20 Jun 2022 22:03:39 +0000
Received: from agrodzovsky-All-Series.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 20 Jun 2022 17:03:37 -0500
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 2/5] drm/amdgpu: Add put fence in
 amdgpu_fence_driver_clear_job_fences
Date: Mon, 20 Jun 2022 18:02:59 -0400
Message-ID: <20220620220302.86389-3-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220620220302.86389-1-andrey.grodzovsky@amd.com>
References: <20220620220302.86389-1-andrey.grodzovsky@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d9e23b26-b014-47f0-0fc4-08da5308bb6b
X-MS-TrafficTypeDiagnostic: MW3PR12MB4394:EE_
X-Microsoft-Antispam-PRVS: <MW3PR12MB43943365F09B56161D211016EAB09@MW3PR12MB4394.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aRxSlp0nd+H1LNszTw0FYHPM+j+uLOX2yIYZN0vNx+n+geq7FdG6uyjvO5YY1Z8p5BlEZlc+/5rGsaY7Bf51SvjoEV+pI0AItz9Eb6Q1xVJcXMGlgZz0Up9djL6TvsucXOPp7VRTkzDrSMhcyGGk87EhWzQQakLmhjMI4PSswZuJxXJqwmSj1yjEERwdegFR+7dtqBiN6Y0skExjbdZAC/M32wwDCyVQnhELKBOt7NNC5td/0aKKkvQZdMlpvg1x7BVQ3+BMenVElncjdgRGwNT+2+P3hdJ78FJWW4GXFCuxU25G07yTMT/6V7Pun6r+mfy3Kd4879FMA4ZJHA2fq+PyFJ6fjIDpo8Zw+doAIMns/JV0hkNvKCrRg6QnqvaOmts9cqZknREwcPthNPzGXfDd9SFz2u9ZJoTL8vpdCTKp2/q0oPQpEshxussMewQfeVCEuN4A5Yknnkg/D/TV/Qh+HTQ2CP+3M66KO55t1/Dh3EFkEQzLabF89r63kTw4GdozABu4AD2Jmcrc8ZD/41MAk3q/NMn0BlA0iF0uUTgDxhPB8ubpYSMcNQ6nQWfQXxuUz+JXxqNdp110DyAt/I8qJuKwsA5QgDR92ITVkBxeV5mxQMs6Fbs+Xcd0EH7GhbvhwjfPzIZ6f/jkHVpUslM7+LSeSdOaghiz1QklzQdj+KvCbEAV2RLsf/XEMzq34yUouhISbLHhqtqQSTmhkyzK5eW3tjPFQ+zn+6ilxu9oX6xvNrQKq/HLcldJwn2o
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(346002)(39860400002)(396003)(376002)(46966006)(40470700004)(36840700001)(4744005)(41300700001)(44832011)(2616005)(5660300002)(316002)(356005)(6666004)(81166007)(2906002)(7696005)(36860700001)(40460700003)(82740400003)(26005)(82310400005)(86362001)(8676002)(4326008)(336012)(40480700001)(426003)(83380400001)(70206006)(70586007)(36756003)(450100002)(478600001)(47076005)(1076003)(186003)(110136005)(16526019)(8936002)(54906003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2022 22:03:39.3671 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d9e23b26-b014-47f0-0fc4-08da5308bb6b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT054.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4394
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
Cc: jingwen.chen2@amd.com, Christian.Koenig@amd.com, monk.liu@amd.com,
 yiqing.yao@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This function should drop the fence refcount when it extracts the
fence from the fence array, just as it's done in amdgpu_fence_process.

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
index 957437a5558c..a9ae3beaa1d3 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
@@ -595,8 +595,10 @@ void amdgpu_fence_driver_clear_job_fences(struct amdgpu_ring *ring)
 	for (i = 0; i <= ring->fence_drv.num_fences_mask; i++) {
 		ptr = &ring->fence_drv.fences[i];
 		old = rcu_dereference_protected(*ptr, 1);
-		if (old && old->ops == &amdgpu_job_fence_ops)
+		if (old && old->ops == &amdgpu_job_fence_ops) {
 			RCU_INIT_POINTER(*ptr, NULL);
+			dma_fence_put(old);
+		}
 	}
 }
 
-- 
2.25.1

