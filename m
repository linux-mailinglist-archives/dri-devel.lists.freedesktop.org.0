Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EBC4F5B3DAB
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 19:10:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C32AE10ECC1;
	Fri,  9 Sep 2022 17:10:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2048.outbound.protection.outlook.com [40.107.95.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D52E610ECC1
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Sep 2022 17:10:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mdYUB/7oBOqebL4t/xVMf/vUvXnNL/YgL7yjklInQnKEDvzbmIZTU2NfEEnsTU7C4w7ZEfyh3LggsZJvx1ZCUFpfvPjEc31RMb7X9zK9o/zqO0BbsHUz8akRJxCoU4aJ5wRJpBaaq1bV4MeRq474D/HHVUOv63aaIaxhxZ2OaOpKEvSvVOAkJ9XsMjVXbKpAGUwfdWiRaq6WSSz8aOOF1fJn+ozAzFfRjwty9+NUa8G7Fi22SGN6NyY/8bsPf+Razx34zrvYp3X+ItP9EN7upQascVINBicFJeomafj1qFIi/DdusX3az6VGIS+heyippPrYFCa0VNqe0oJoxy6l3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z2kY9enqd2JgwVLK3YjiptmpdNY6zRgDaDZMDn23ulA=;
 b=Zo5hhE6IR40IDKxhK+9Hxa8rv1ct11U29Vp0HEIEyjHydpSiMNmNHCO7vlrWt12gzv4ev0YVb9f+hdPlVQy8EBHbQv9MWpyGkITCTCLMUtKbKg3MlLLz8LLKsOeX2Pz6erUDgl1SUm0MvHf2my9MjgKYOfaL1I/uvXepullAHvT6MdG7b0XVcuYGcUrvzw73+ESP8Rwp2jK38lzeONpDH4sO/tTThvcxnSc7KfcPQW3DwPqPoXLFF8hF727nHPpWARCw/fj1YgI3Qd9acTiKOpILKblrsfZ40f5XmMWdKUV65udbZ+4n6k/hupmgkaa5uApJaLQRwe91jRowLzdbQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z2kY9enqd2JgwVLK3YjiptmpdNY6zRgDaDZMDn23ulA=;
 b=b/4/beoPE6jqMmvWBYCZiR1rRQGskjD2JTZz/ntoOnQjKek5kf8wZOy3zh8xdMHPM7OvGkHQqOnjNiibNLuCUgpRT+jbo909NmmQdRcStwLdtyjmkvpi0VoaTpqC+Aw5RKdgL0fb/CT6GT4Oqr5kBn8J3vSkZpOlqo3UL+MgbRU=
Received: from MW4PR04CA0279.namprd04.prod.outlook.com (2603:10b6:303:89::14)
 by CH3PR12MB7667.namprd12.prod.outlook.com (2603:10b6:610:14f::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.18; Fri, 9 Sep
 2022 17:10:04 +0000
Received: from CO1NAM11FT087.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:89:cafe::a8) by MW4PR04CA0279.outlook.office365.com
 (2603:10b6:303:89::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14 via Frontend
 Transport; Fri, 9 Sep 2022 17:10:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT087.mail.protection.outlook.com (10.13.174.68) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5612.13 via Frontend Transport; Fri, 9 Sep 2022 17:10:04 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Fri, 9 Sep
 2022 12:09:59 -0500
From: Arvind Yadav <Arvind.Yadav@amd.com>
To: <Christian.Koenig@amd.com>, <andrey.grodzovsky@amd.com>,
 <shashank.sharma@amd.com>, <amaranath.somalapuram@amd.com>,
 <Arunpravin.PaneerSelvam@amd.com>, <sumit.semwal@linaro.org>,
 <gustavo@padovan.org>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linaro-mm-sig@lists.linaro.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 1/6] dma-buf: Remove the signaled bit status check
Date: Fri, 9 Sep 2022 22:38:40 +0530
Message-ID: <20220909170845.4946-2-Arvind.Yadav@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220909170845.4946-1-Arvind.Yadav@amd.com>
References: <20220909170845.4946-1-Arvind.Yadav@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT087:EE_|CH3PR12MB7667:EE_
X-MS-Office365-Filtering-Correlation-Id: 252f4c8e-2aef-493a-16cf-08da92862374
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: udKVlX88kXzBdgvrLBSy23ZnLNqkWtd09/amUJ6ajW1EHXz2Mmf7ZEMgP3ZqsZ6z3u+qyrhV6rEyi6MjeBfeHjKrdkhts8L1e8B+cVBKDT6Ewi5XD0fcXD6mELzFLqYeU6FauhMSsEkjCZ8dUJypTPvDWxMWkWVvnoy4w4nSBGqp0PV9vYxgY21BveSYX4hYmu7ttDnjLJMZSvIwR7RxacSziCaq4cX7iFabAWDbI1mk2+/BTKKlOaSnHR5M6UjwEn428tCUT5IhXVjJK0Qo+9oZ9z1KX+zLZxD+b1cUurHJKt39uKKNs2gKLdL6tKOyzglFPO2aZ6wgIfXOPZgTHF2/eD12P3tnAYlRo8+kYQ9jkkWzu6kNYDLHak34VM20inpmZaSLKXA8P72b40hWP4wW1daiYQK+QPzAHL2EAVkESxQ6v4Yo+N7JYn2u0nPNoEWmh/BEMl6r9m8S+HbLAOxRbld8ZPTPiWySuZIBvHlcRwU3VEDh9AgxUenxbX2rK6pDagDag+RW1iurRs65jY/UDZt5dktIzxfcMzVe3TJyBKiM/mce9dGpYqEtuhUk+hG68O3Hkfu9DjVgIHUsDWLnGxKvbyb7sPwLt49vCIXzzexkNycFLVq+xkB2Mp/CBvlme7DGS/ZPoD4qsI82iNkKsO4FbRR14qJAHNks1//gRlNIP2d3tCsN3LhwZ/4/+IwYitKAHVNqIOYnp8tkUN2RkS+P8yws0PfcnFltyzSpLcfMmb7bsLuGGdAKRq5Rn7G8Z8UEvbLyUJow/srMPJjW5prvH6PFo24yCFFDnoEJVIUAorBfKabSmb6Y+E4fyQEfnkH6feltJTPAe63pQLdslIOxKvszCUlermcWqkY=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(39860400002)(346002)(396003)(376002)(36840700001)(46966006)(40470700004)(26005)(426003)(47076005)(1076003)(82740400003)(8936002)(36756003)(82310400005)(83380400001)(2616005)(16526019)(5660300002)(336012)(186003)(7696005)(36860700001)(2906002)(6666004)(40460700003)(70206006)(4744005)(41300700001)(70586007)(8676002)(356005)(4326008)(40480700001)(81166007)(921005)(478600001)(86362001)(316002)(110136005)(83996005)(36900700001)(2101003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2022 17:10:04.2242 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 252f4c8e-2aef-493a-16cf-08da92862374
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT087.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7667
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

Remove the signaled bit status check because it is returning
early when the fence is already signaled and
__dma_fence_enable_signaling is checking the status of signaled
bit again.

Signed-off-by: Arvind Yadav <Arvind.Yadav@amd.com>
---

Changes in v1, v2: This new patch was not part of previous series.

---
 drivers/dma-buf/dma-fence.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
index 066400ed8841..64c99739ad23 100644
--- a/drivers/dma-buf/dma-fence.c
+++ b/drivers/dma-buf/dma-fence.c
@@ -601,9 +601,6 @@ void dma_fence_enable_sw_signaling(struct dma_fence *fence)
 {
 	unsigned long flags;
 
-	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
-		return;
-
 	spin_lock_irqsave(fence->lock, flags);
 	__dma_fence_enable_signaling(fence);
 	spin_unlock_irqrestore(fence->lock, flags);
-- 
2.25.1

