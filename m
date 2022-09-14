Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E79D45B8D5C
	for <lists+dri-devel@lfdr.de>; Wed, 14 Sep 2022 18:45:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 268C710E98D;
	Wed, 14 Sep 2022 16:45:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2042.outbound.protection.outlook.com [40.107.92.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AF4210E98D
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Sep 2022 16:45:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AcJCHpc1gRl15Hzee7Y5D31RL8L/jc8NuK+g0e6k+iSjj+CUWRpKk+57gtg7QLDKVK722Y33kGzvbyTZKZKFTaoLN+ruVdkC5f1nqjbpImCyQ+M3MeJOP09zLTIMIfz+exj/ABCfyTCSqmRdnEMCRvWRxkVp3KC7yaaoiC59I65vVl6xACEFzGMA+skUCBDjzVLrT6t2XnqQI/YUX7REBeFIXaLph/7ML8p27JEbgtij0t13cI1zYUcvfWVhqQOqnve/zyxzKrAaPJpusEpWDzXFv03gminxjlnG18lEXxygpOpyaEX5a54YlyDp6LdTNFkUwZF9Zkvt9rOwvHOsjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6ZzSUSxOvuyCkf0z40GZtftSHrd6mN/ynXq1eT8AQD0=;
 b=T+dWf9pV2v+k+g4k4LozooqWsoSn9PCCijHeWfE3uzXS7F1bF3lr7FTYtcBP6NCvSCk1FeeBuikLLphH1AdNwMhoLAlrh6MGlewEaR7A/xU+r7jmL2bQ/JJH4qD00FUzEyfx+Y5slFk8qRZfqXl8KrBGaiJrcvskcTme35V+Bpt09RWmK9ae9Nruk4xhFoqBDfUYBwVDft3HPo9XP9s5vCUF8puiIAfgo/hfO33gLKPiYKo+fJ25c2IIqTGmQfCFEAhuYtX0D5C04APTXSX/8bdu/H78fD+mb3Z/YbYPxdC9Yb6zvg7pdwegO6ZaZShyHaZkPVN+U+vYgboDUr9+rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6ZzSUSxOvuyCkf0z40GZtftSHrd6mN/ynXq1eT8AQD0=;
 b=0uvw0NKctlPDG8oqpmSRUobE7iB8rBLtSUtQYCHlTctNN6pg3DZ+m1mxFO7LfdserSo0oJYvr5JQ3Kx+SzetGnWMZFBGO7WPtNFgIUBo7VeRLEgNunrQMl4V0eE7lq+YytJthtWHUBXcIHZiHOpaGTkeAL8H/nV5H4nU0IOzmzE=
Received: from BN9PR03CA0736.namprd03.prod.outlook.com (2603:10b6:408:110::21)
 by CY8PR12MB7657.namprd12.prod.outlook.com (2603:10b6:930:9d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14; Wed, 14 Sep
 2022 16:45:10 +0000
Received: from BN8NAM11FT110.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:110:cafe::5a) by BN9PR03CA0736.outlook.office365.com
 (2603:10b6:408:110::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.14 via Frontend
 Transport; Wed, 14 Sep 2022 16:45:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT110.mail.protection.outlook.com (10.13.176.156) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5632.12 via Frontend Transport; Wed, 14 Sep 2022 16:45:09 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Wed, 14 Sep
 2022 11:45:05 -0500
From: Arvind Yadav <Arvind.Yadav@amd.com>
To: <Christian.Koenig@amd.com>, <andrey.grodzovsky@amd.com>,
 <shashank.sharma@amd.com>, <amaranath.somalapuram@amd.com>,
 <Arunpravin.PaneerSelvam@amd.com>, <sumit.semwal@linaro.org>,
 <gustavo@padovan.org>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linaro-mm-sig@lists.linaro.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 4/6] dma-buf: dma_fence_wait must enable signaling
Date: Wed, 14 Sep 2022 22:13:19 +0530
Message-ID: <20220914164321.2156-5-Arvind.Yadav@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220914164321.2156-1-Arvind.Yadav@amd.com>
References: <20220914164321.2156-1-Arvind.Yadav@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT110:EE_|CY8PR12MB7657:EE_
X-MS-Office365-Filtering-Correlation-Id: d893f585-94e8-4633-6294-08da96707c87
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Px3CnwKFXlejpA705iuXXqHEEdF7Kb9tMBIdNiMfQDw3iWla62y60C7n2rtDQme5jOM5Fsw4ko5oVYTmnKEJ+KA9EvzxvFGS13DdwtVe3rwIVVh7i1eKPfZ5uDYDJ5/yCI3roeiiXVmnf5WD5ywXX3+3ilzM2WKqlB6tiKR94VoKIq96cCUjuVcFJY1hOXJEwE/hcvuc93Mm0FP2MhNtQRxkZhrLFxga3qrKpKWqXUCcHFxopYr9X9mNL3SvYAUKV3WzUDWMZMS2MMPXAy5THOvE4snFJg2RNkGX3EpK1j+NAqhYXM+T8gcnVVrcK66t07vtm972twCsrnIzZvvIWc5HATgd0Fxyctniwwsz0rWYUCnCfivIlKr1Jg8iWijFETVAw5/nxhImE0WTaJ9eFHoicrzFM7dbJZByCajSw0D0C2SJnP4rCSjd6RytH61D276sRho1OYklyBagjeEZwFa18aocKUZ391mH/25fjsJmNP3JLWX+cD5UODGXYp43T8+QvlMsy/eH9VTP5ZRl3voyqe+SmfhdFfgfl58IygHV6YpRUxxBXAwB8oHsgZEyaHQY+1iGKt8TvCp3S0RDc5kJ7rxiqR6Jyj9E52eCv2G0RTC/ayRYFgIlwMWWKWLHEUtQHjAV0B1gAKwvkwafbjPYRypU5wccvp6iKW5dM99Qo0o3xhKHbxht63/zPL7oENz8oEV2O/CnILqVmnxTajGdto0j8cC3W9hoLtsFg5yrOAFZC4ebuQABQ6AJWLvlM062fVEMb5FU1w6bFIFMC1GtDcNxrYEr/4qmqwKBF2uSaRmGIDwMnpGF//HBZhV8barTQtmySep5vo/sHfRPRKu85KV0JOAFymPdNaUG+zrwom/Zz8UCMNQcM+jQE47p
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(376002)(39860400002)(136003)(396003)(451199015)(40470700004)(36840700001)(46966006)(40460700003)(6666004)(356005)(8936002)(16526019)(316002)(110136005)(47076005)(70586007)(478600001)(336012)(1076003)(36756003)(70206006)(36860700001)(86362001)(2906002)(41300700001)(2616005)(83380400001)(426003)(7696005)(4326008)(81166007)(4744005)(82740400003)(26005)(5660300002)(186003)(82310400005)(40480700001)(921005)(8676002)(2101003)(36900700001)(83996005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2022 16:45:09.5472 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d893f585-94e8-4633-6294-08da96707c87
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT110.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7657
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

dma_fence_wait() should always enable signaling even
when the fence is already signaled.

Signed-off-by: Arvind Yadav <Arvind.Yadav@amd.com>
---

Changes in v1..v3: This new patch was not part of previous series.

---

 drivers/dma-buf/dma-fence.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
index 645c158b7e01..a5fbf1c1e0ea 100644
--- a/drivers/dma-buf/dma-fence.c
+++ b/drivers/dma-buf/dma-fence.c
@@ -508,6 +508,8 @@ dma_fence_wait_timeout(struct dma_fence *fence, bool intr, signed long timeout)
 
 	__dma_fence_might_wait();
 
+	dma_fence_enable_sw_signaling(fence);
+
 	trace_dma_fence_wait_start(fence);
 	if (fence->ops->wait)
 		ret = fence->ops->wait(fence, intr, timeout);
@@ -771,9 +773,6 @@ dma_fence_default_wait(struct dma_fence *fence, bool intr, signed long timeout)
 		goto out;
 	}
 
-	if (!__dma_fence_enable_signaling(fence))
-		goto out;
-
 	if (!timeout) {
 		ret = 0;
 		goto out;
-- 
2.25.1

