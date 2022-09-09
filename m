Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 146B45B3DB5
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 19:11:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4280410ECD6;
	Fri,  9 Sep 2022 17:11:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2050.outbound.protection.outlook.com [40.107.96.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B006F10ECD4
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Sep 2022 17:10:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ql2fpg+6JcEvAXY1UNhN28m3MDCmymHjeBsHNizPEuplZPMqURX2wTqeaTpB5xNteoJhA6AEIw7mkwlX2SvjZNwxhHdVF65m2zZdG47KTye9ukf5aWrmkNxzpjmoJgAyOYKzTMyFVAFFTS2dqT+g5Yv1sMLsA6kZEMrerbXgthRqtm//oWrsz5o7rldS6hyYW5GvMGsUzABaSxV4Em/sxZ+lg/yadP8y6ZCCjM4QL3+MT4manIfE0dLUGh5YfXPm5ZrfpI7ujTB95rxkGyzAKtFpWAJg1SIh7/iNmLO1XKjrsQtHGEm0TCyEZRgaXwMmqDyCZpc87qaiZl+F40ZYvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jN5zHMAS5qCzEG2s2Awu4a0yhtajsUBmQZQF9De4neE=;
 b=A3b5EUNqXa6hPQT4CPBOv/iGGN5R1LklnKa/A5EGzcCJrnIc5tbV7SlIGwETmuwW/VsSVzC9wuwpgt6rfAPiZouGEaKKwOe0JBw03ggCgI10ucKRYd4hrJOncW3IihRZWTKuJ7Rag1uOauXV8yl5OVNKlDDvbKPlbKD06zLi1X7Ivd8i8YNk5WmplBpfuqEeSe2BB06SQ4kTaOFxODTRMADtZS1lCchuqOlJ1FQzAuP8KqydZcHuMYf67jYouGrSNyc0FpXQCA5tokWyD4TBROItqLQx76utvlRHX9/2wWfihogopMcb1gENg+BBnObdtGJyrRPjKVtHQnH64r7ZUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jN5zHMAS5qCzEG2s2Awu4a0yhtajsUBmQZQF9De4neE=;
 b=lJzzi9ieVaBaRod5bpG6wtJB3AhAzHMQE84ceKscdvP4k013E4zaq503oKsiIsJDwJYwnRAJdsSXg8RlFevBv5wK3FKxglca6mZdDSrDxQALsQBQ1Shlk6ymC1SM7kQbWNvjiEDbFjBi5D5XOZ5cso9ujvLoXI8HQjNIqqbRQXU=
Received: from BN0PR02CA0009.namprd02.prod.outlook.com (2603:10b6:408:e4::14)
 by SN7PR12MB7372.namprd12.prod.outlook.com (2603:10b6:806:29b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.18; Fri, 9 Sep
 2022 17:10:56 +0000
Received: from BN8NAM11FT104.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e4:cafe::e1) by BN0PR02CA0009.outlook.office365.com
 (2603:10b6:408:e4::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.12 via Frontend
 Transport; Fri, 9 Sep 2022 17:10:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT104.mail.protection.outlook.com (10.13.177.160) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5612.13 via Frontend Transport; Fri, 9 Sep 2022 17:10:56 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Fri, 9 Sep
 2022 12:10:51 -0500
From: Arvind Yadav <Arvind.Yadav@amd.com>
To: <Christian.Koenig@amd.com>, <andrey.grodzovsky@amd.com>,
 <shashank.sharma@amd.com>, <amaranath.somalapuram@amd.com>,
 <Arunpravin.PaneerSelvam@amd.com>, <sumit.semwal@linaro.org>,
 <gustavo@padovan.org>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linaro-mm-sig@lists.linaro.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 6/6] dma-buf: Check status of enable-signaling bit on debug
Date: Fri, 9 Sep 2022 22:38:45 +0530
Message-ID: <20220909170845.4946-7-Arvind.Yadav@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220909170845.4946-1-Arvind.Yadav@amd.com>
References: <20220909170845.4946-1-Arvind.Yadav@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT104:EE_|SN7PR12MB7372:EE_
X-MS-Office365-Filtering-Correlation-Id: 6bf1b7dd-d50a-4efb-cc07-08da92864267
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JDgxQvs09GAUpOeuKuLIIyvZ95+8K4Jq1kPcW9eYHVZgwhF6V0TU2XW9QmzhXln88KQeqXS/ovbQi1tqrokA0F7dLHwUQIi1/HoSGSHP8uLI+pqyKSx1JyXKu5xjGNVxYumVshILjEnulScuBeDkvyltrIVIX17c+Z8opbCr6+WV/OQBG5F0w2nT9m6YAEL+ZydwNOxIYeXo8TP6IMT2lGoAQsnGaCiYY47sQzH6dDuCSy+iwQ+RvPNattv7kGToW75iYdjUdFs8avlIMIQVzyWd5qHGW13CeHHE0owp06GrB/pyJQYbivQmDy6XucwuYiEZfbdSChavAOd5BnEC0j8NYG76PiLB++tJFV4HtxExgVkj5lpwm2Yymu0ktAg6YCBNhQ1QgEOU3LDk7qsnBzARDffazOIzqPf7D4QlydO1/ow7gdaApp8e+aFiEx7ZJRKAENBfhXhjJGtRfLm9SGdsSd+eZINLoj+8rLYz4VJoYD+bltCkjkJkkS9Ak9iyvsfv70xul0Jjf1s7EOlrVjscRgj4yGaVNTts4KNl6BuQCl69IR2efv8RMBqjetrhbQy1yGLNH3ym5iOa0Cts39RaRogPI8A/nQbAnylE6qJhvmFll8YzoyY+xQs+N6O+erFXFREv4FDxtx12cuTVhloFyAJ2foT6XgcO3Dn/iWEduUIyZzi3napWGKbDYlZ65aIbK27eXdQcfE0JUdcN0TzpCCwhvhKby0XTYkC/5wVvZYPyjU0ZtNJs66IkkE+Gd0M3mC/Pd7bxSrudOUo1Fz75u19rQxFaJylE3Rz4lKJxLBnzUhnNnYdf174lJcFezGpKqIqIzh0TJiOgDgNQjvDRMPrkUGRePJS/Uk1t1oQ=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(376002)(396003)(136003)(39860400002)(40470700004)(36840700001)(46966006)(7696005)(316002)(36860700001)(356005)(8676002)(336012)(921005)(70586007)(70206006)(4326008)(2616005)(82740400003)(1076003)(81166007)(41300700001)(426003)(16526019)(186003)(47076005)(6666004)(110136005)(26005)(40460700003)(83380400001)(86362001)(8936002)(2906002)(5660300002)(478600001)(36756003)(82310400005)(40480700001)(83996005)(36900700001)(2101003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2022 17:10:56.3093 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bf1b7dd-d50a-4efb-cc07-08da92864267
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT104.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7372
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

Fence signaling must be enabled to make sure that
the dma_fence_is_signaled() function ever returns true.
Since drivers and implementations sometimes mess this up,
this ensures correct behaviour when DEBUG_WW_MUTEX_SLOWPATH
is used during debugging.
This should make any implementation bugs resulting in not
signaled fences much more obvious.

Signed-off-by: Arvind Yadav <Arvind.Yadav@amd.com>
---

Changes in v1,v2 :
1- Addressing Christian's comment to replace
CONFIG_DEBUG_WW_MUTEX_SLOWPATH instead of CONFIG_DEBUG_FS.
2- As per Christian's comment moving this patch at last so
The version of this patch is also changed and previously
it was [PATCH 1/4]

---
 include/linux/dma-fence.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
index 775cdc0b4f24..ba1ddc14c5d4 100644
--- a/include/linux/dma-fence.h
+++ b/include/linux/dma-fence.h
@@ -428,6 +428,11 @@ dma_fence_is_signaled_locked(struct dma_fence *fence)
 static inline bool
 dma_fence_is_signaled(struct dma_fence *fence)
 {
+#ifdef CONFIG_DEBUG_WW_MUTEX_SLOWPATH
+	if (!test_bit(DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT, &fence->flags))
+		return false;
+#endif
+
 	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
 		return true;
 
-- 
2.25.1

