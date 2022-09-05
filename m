Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5A6C5AD79C
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 18:35:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FD3610E43C;
	Mon,  5 Sep 2022 16:35:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2056.outbound.protection.outlook.com [40.107.237.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD52210E436
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Sep 2022 16:35:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LEpLeTfoNX2AJLidXGOJxlEymCFhtWnWIbZ4gUWBwcV/+YTwqKOofhDW2mlKfPpvqlb9sowNszdcb7uhKtqAZTvB9HPi0xckMbzuQg88LnQZhBWClN2r7YbUv5KWdK8xF2CmmCgVkp/s2bp3xjSSFmq8mRDsk5qK4WkSR4ZqYcFO1akO4GoS2UGy+J2CCkdtC5lt5sT9hUO6BgkmGKBRDmyWwELkCNths5kI0bMPdCJuGCKLYiJ005si2f+b0kdvDgl6a2pLrzG2DOvNdBqua3/De5AdbhejDfQUP71/UG+sR8k54qH7SoreMbPoiC1XAHaSVNZtMkQJGaalAeeMaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Je78deXMKT2fn6zFo/xx4UZymz9aqFvRovpe8pddmZ0=;
 b=DUcj0ENn4AHKyeuzBRsFfZbMzNw5LL9W1R8ed198p0wF2l0Y0zbu31XIEbtkoK21bQM203bx7QyOsgM/pgvUOUWq9WxFkbDDOt1a0Dq9+N0wBsLrFHsZd752juuMGCaK4/d76xK9x99JpWrKIs8RjBZweSwT14t0NDDAyAdMjc9RfBeSZ3X8qxbxp4Z/hH1WUZD1nn/I6NtFEKOlLIVn/uC/En44X8zXPOwawrqeBpKESj/hOL+CaanGO7W+X6mMl6893Yy1u0dhia2qlnNu1b2WE3Pewde9ncL/qhdbmwxmXM/R81xq8oPLmANb9L1xy/qMMDIGfrLhn+Q3ppp15w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Je78deXMKT2fn6zFo/xx4UZymz9aqFvRovpe8pddmZ0=;
 b=kVgAANCihInNUZ7JR9Yf8kfBgngLhY4SgEoOv4BhrEMRLfgRd4f2Gs0dOR15upvv2Ub8xCuxehOePAPcTqgovvvGkugQPtNgvsYHnVhiEvOVCKSsxINSpdDWG698YtTEf2nXMeVkMhPFZ0X/oNk3xk03AtExAAumk6qfbkAlWCc=
Received: from BN0PR03CA0044.namprd03.prod.outlook.com (2603:10b6:408:e7::19)
 by MN2PR12MB4456.namprd12.prod.outlook.com (2603:10b6:208:266::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.15; Mon, 5 Sep
 2022 16:35:36 +0000
Received: from BL02EPF0000C402.namprd05.prod.outlook.com
 (2603:10b6:408:e7:cafe::83) by BN0PR03CA0044.outlook.office365.com
 (2603:10b6:408:e7::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10 via Frontend
 Transport; Mon, 5 Sep 2022 16:35:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0000C402.mail.protection.outlook.com (10.167.241.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5612.10 via Frontend Transport; Mon, 5 Sep 2022 16:35:36 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Mon, 5 Sep
 2022 11:35:31 -0500
From: Arvind Yadav <Arvind.Yadav@amd.com>
To: <Christian.Koenig@amd.com>, <andrey.grodzovsky@amd.com>,
 <shashank.sharma@amd.com>, <amaranath.somalapuram@amd.com>,
 <Arunpravin.PaneerSelvam@amd.com>, <sumit.semwal@linaro.org>,
 <gustavo@padovan.org>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linaro-mm-sig@lists.linaro.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 0/4] dma-buf: To check enable signaling before signaled
Date: Mon, 5 Sep 2022 22:04:58 +0530
Message-ID: <20220905163502.4032-1-Arvind.Yadav@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0000C402:EE_|MN2PR12MB4456:EE_
X-MS-Office365-Filtering-Correlation-Id: a1c7b0ec-6356-4afb-f38a-08da8f5ca946
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hae0J8TA5AlhxAwbhUOClcoTqX0Hik6VcWBF8FWVsobT0vjd/pQbs9jDBOnaTvSi6fFUxa2lrGsNvvkqcu/lZkImHZO0F0b+HvqzZTzyXj3cN9Wd8zlHZVr4+4erQnzVyeArU2aEweB1FFjRUVJQb7i4q06/7Z2y//1/gWM1Hlhi35s2UCtbM5Lul8Q+4AZAOd+6DCT//QT7FJRDuyR5tc0X9lcL+lmNSGpPodCaGL1CfsgKu6oFzPg9OsE6Frqkth7B7kU8gHMpas6rVJLJQuBQO+IGcgn8faGuaU4RfTa8g9lC/48xjq+4WZNPfNHmDB1ROihxwTuaG505NE4olFMrfsuQiAeRNqsdNhm10YvIYIPJCI+AuGaQ/Pa89Njk1hOdaZQryCdMtXM7ml0E3q8gnhOXWSuyBWDIowM1Ku6aTuToNuvpoIY59XPIrctnHJZwWBOgpXElHyWdB8EhfZc4ZE9jf30tciByoJen1kL2PyNVYpkRhNOe4muQY8yd5lIQYhAsv7FR5ohXCJzm9ZpTqc5jAoCIXG25ncGrW7Ps/Qiw42qYHAYTjcdC+TcNyIGnGupES7KECNBt/RiOaZRYqGvuPBxb8MmPAqLALSPo5F5JierJlacEQ8mYGf6xUtgFoSvxCQzxTX7zUp4pPkSFtVVd1teBxqgaEYVNvRDqEQwXIhJrCv5syhU4ORCEWnrNiLLUIOJd9TLz94P/xEtbvl6z9zVB7uQfnpCrNNgTsHOSY53ku4r000RYKmTv1xbmQQ2iCZ67Fa8sWLaZtP7Ky0KKda2RbKy/Dr3XXi7tDTwI675O0Kw0bzeHIAJjUZd4sV8qjMnn3Q7oq7QzQ+B4Pe5mgN3BVL7KWSTe948okvnnBWmHu3qiUV8KHOT2
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(396003)(376002)(136003)(346002)(40470700004)(46966006)(36840700001)(186003)(1076003)(26005)(426003)(83380400001)(82310400005)(2616005)(336012)(16526019)(40480700001)(41300700001)(478600001)(7696005)(47076005)(6666004)(86362001)(921005)(356005)(82740400003)(40460700003)(81166007)(36756003)(8936002)(2906002)(110136005)(70206006)(316002)(36860700001)(70586007)(8676002)(5660300002)(4326008)(2101003)(83996005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2022 16:35:36.5327 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a1c7b0ec-6356-4afb-f38a-08da8f5ca946
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0000C402.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4456
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
Cc: Arvind Yadav <Arvind.Yadav@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TTM, GEM, DRM or the core DMA-buf framework are needs
to enable software signaling before the fence is signaled.
The core DMA-buf framework software can forget to call
enable_signaling before the fence is signaled. It means
framework code can forget to call dma_fence_enable_sw_signaling()
before calling dma_fence_is_signaled(). To avoid this scenario
on debug kernel, check the DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT bit
status before checking the MA_FENCE_FLAG_SIGNALED_BIT bit status
to confirm that software signaling is enabled.


Arvind Yadav (4):
  [PATCH v2 1/4] drm/sched: Enable signaling for finished fence
  [PATCH v2 2/4] dma-buf: enable signaling for the stub fence on debug
  [PATCH v2 3/4] dma-buf: enable signaling for selftest fence on debug
  [PATCH v2 4/4] dma-buf: Check status of enable-signaling bit on debug

 drivers/dma-buf/dma-fence.c            |  7 ++++
 drivers/dma-buf/st-dma-fence-chain.c   |  8 +++++
 drivers/dma-buf/st-dma-fence-unwrap.c  | 44 ++++++++++++++++++++++++++
 drivers/dma-buf/st-dma-fence.c         | 25 ++++++++++++++-
 drivers/dma-buf/st-dma-resv.c          | 20 ++++++++++++
 drivers/gpu/drm/scheduler/sched_main.c |  2 ++
 include/linux/dma-fence.h              |  5 +++
 7 files changed, 110 insertions(+), 1 deletion(-)

-- 
2.25.1

