Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 580725B8D63
	for <lists+dri-devel@lfdr.de>; Wed, 14 Sep 2022 18:45:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 519F410E98E;
	Wed, 14 Sep 2022 16:45:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2044.outbound.protection.outlook.com [40.107.95.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 995FA10E98E
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Sep 2022 16:45:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c2pBOfYEE0K6PXJ6wVX3ER8qVuitEz/loWAAHyXaNOLRtn7YU/ZxU/rTWXkdVmdtrXKNuIqFsVl7oUnFtTdoERosBszVWlXIFdBt4JJiNpGwicrA6eZPVg/noSqwBRN+Cw3tupU9S8nz6f1kxMuF28JC1TGgoGwEjymwj4BYYceNPz9tVTA3IjyiYVNmwxgUs9c6t/qrBZtJJ4QaCsjZ3Mh10psYlsa8Oryn/Ls2K4QYIrN+OkQv8ASzQ9gZX+9ZC4xAvl4WDwLITJKNZ4r2zVkj6GrJ5+U/BkO0sNYgHp6FYjHKaGp9YcwkjYrxev2wUJjMROH7Dknm2DSlK0SBWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dw9IR5MMDiZdAPbhcsufZeUb0iTvdlY6ZZ/KqPzOlIs=;
 b=lDQ0K8yuVgbfoz5aS/PWxrlFYsKBiS1Q4noftYn0USajq2dhl5q/wN2Yc9ZBz1nn1pQO/upTTtXbwwBO4JtlTYIgweihBz4AQqB8GSrTQzArDFfjQ1xAnIuZYA/gQUpRcTUGva7dSXJjlElenBPpjoBDZGW3vYCuocnzt8txCfj2civSwPh8MjxBGFlkLhYiDSvi3HMoQZYaM156aOdR45OKwOAnAlpZlknZqQjUf0QPk/RIBqgxvcrC1MzBXo4EFFkLSO3ubhFgBzH4v4gK7qwobv1VzL6NI3LqqPVI7ynjHXvy9+0ckvfgqeicV1i/UPygU/3kOT3KLHBquk4lUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dw9IR5MMDiZdAPbhcsufZeUb0iTvdlY6ZZ/KqPzOlIs=;
 b=PF8vn4ZMQopZKbG2fVNW1A9BFKkSoccK2ZiFEYqj9A95Ve6ogOB4zZM0ZMO1h+8RN9lBSIoTA/MepU1uLOUUG9Itj2O9WIk/QyttShdw9Iml6hnZs6n5akhSRMDHKX9/KdFMa01UUdDmEjF+QNMwF4wF50LMdAxg/owDf1pKGns=
Received: from BN9PR03CA0158.namprd03.prod.outlook.com (2603:10b6:408:f4::13)
 by SA1PR12MB7341.namprd12.prod.outlook.com (2603:10b6:806:2ba::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14; Wed, 14 Sep
 2022 16:45:24 +0000
Received: from BN8NAM11FT072.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f4:cafe::8e) by BN9PR03CA0158.outlook.office365.com
 (2603:10b6:408:f4::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.12 via Frontend
 Transport; Wed, 14 Sep 2022 16:45:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT072.mail.protection.outlook.com (10.13.176.165) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5632.12 via Frontend Transport; Wed, 14 Sep 2022 16:45:24 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Wed, 14 Sep
 2022 11:45:19 -0500
From: Arvind Yadav <Arvind.Yadav@amd.com>
To: <Christian.Koenig@amd.com>, <andrey.grodzovsky@amd.com>,
 <shashank.sharma@amd.com>, <amaranath.somalapuram@amd.com>,
 <Arunpravin.PaneerSelvam@amd.com>, <sumit.semwal@linaro.org>,
 <gustavo@padovan.org>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linaro-mm-sig@lists.linaro.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 6/6] dma-buf: Check status of enable-signaling bit on debug
Date: Wed, 14 Sep 2022 22:13:21 +0530
Message-ID: <20220914164321.2156-7-Arvind.Yadav@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220914164321.2156-1-Arvind.Yadav@amd.com>
References: <20220914164321.2156-1-Arvind.Yadav@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT072:EE_|SA1PR12MB7341:EE_
X-MS-Office365-Filtering-Correlation-Id: 77829df5-388c-4f70-88aa-08da96708531
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hhmhOhzONlaYYao0J3YtV8GewMIF9Mdhq8XX6Cb6bHlgsbYYQP1aA8qtmSICiL8zhwfyEayx6rKZyeq71aNi5GgWzY2T6aJfFGPcBkHADs/C/XJOqJPd4cBMp54wDeHF18LjA0kLfmeit4ACpKADWQ1joEXKH/a/t5GdZHTGbViI9V95pBY9T81AngKQmNv5hLzopYHKj4JOA8ZoeeDHs8X5ijJbFE6J7qfjX7eIwqDK5wG/tkBc9cmXoNn88J+/bkhnf6ot/KOJDqylhvfa4CHc2tW3zfLkPvYV7rLiGROZuue1s7oKHJWCHwyFZYD4DDivB7mwxz8ba7lxrlo5Upa/D7CVC6bGHoVbDMUoiXAKY3IHj4h+PdtDaOFhlEkXV9pKejUCDrO0hFoW7+YcXr4ARc6ttf9dEkjhF4LMdteFUbu1qJAw3ZCEGQRaGQqTnhnDngqxPBty03q4ITAa+jj0yaoElWVQV+0Iv3XUxoiPqZTtwRmqmJ9In7jR9VskqEHNp74+kGIijgyjk3QQ25r/5qio8nyiGDDYcDcrfiBs1immy8od3dlKYtE/8va8tEpjkhcGJ3rMiXndUuC/vXVmxF8gmysAztHGercNtDajswwDfz++5tHgqudhw952OadujVZmYQnSvLoP+gTFBb6c6tdpfnRIs2/hcgvlAGEq2rYYvcunp9rcb0nDaJKmf3iu3WJMUM+S+K7dtxfwE6SZf259y5WwGFJRjigaOwmiNU4VcgdOq7iNFk5cvNfphzfQkAfD0bTGGkXNZb4zPhUjfp1XqDlv5fiEPwfmGdtNigKVzdeOE5xsP+LpFrgT6x0nw4X7y12diujEfKqnMGYxQlzgbMnETR5ZyHsiD2g=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(136003)(39860400002)(346002)(396003)(451199015)(40470700004)(36840700001)(46966006)(41300700001)(82310400005)(356005)(70206006)(86362001)(8676002)(81166007)(4326008)(7696005)(6666004)(47076005)(40460700003)(316002)(40480700001)(186003)(70586007)(426003)(110136005)(2906002)(16526019)(336012)(5660300002)(36860700001)(26005)(921005)(1076003)(82740400003)(8936002)(83380400001)(478600001)(2616005)(36756003)(2101003)(36900700001)(83996005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2022 16:45:24.0841 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 77829df5-388c-4f70-88aa-08da96708531
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT072.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7341
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
this ensures correct behaviour when DMABUF_DEBUG_ENABLE_SIGNALING
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

Changes in v3: 
1 - Adding new config DMABUF_DEBUG_ENABLE_SIGNALING.
2 - Replace CONFIG_DEBUG_WW_MUTEX_SLOWPATH to new
CONFIG_DMABUF_DEBUG_ENABLE_SIGNALING.

---
 drivers/dma-buf/Kconfig   | 7 +++++++
 include/linux/dma-fence.h | 5 +++++
 2 files changed, 12 insertions(+)

diff --git a/drivers/dma-buf/Kconfig b/drivers/dma-buf/Kconfig
index e4dc53a36428..c991e6a51510 100644
--- a/drivers/dma-buf/Kconfig
+++ b/drivers/dma-buf/Kconfig
@@ -65,6 +65,13 @@ config DMABUF_SELFTESTS
 	default n
 	depends on DMA_SHARED_BUFFER
 
+config DMABUF_DEBUG_ENABLE_SIGNALING
+	bool "DMA Fence enable signaling debug checks"
+	default n
+	depends on DMA_SHARED_BUFFER
+	help
+	  This option enables additional checks for software signaling of fence.
+
 menuconfig DMABUF_HEAPS
 	bool "DMA-BUF Userland Memory Heaps"
 	select DMA_SHARED_BUFFER
diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
index 775cdc0b4f24..01e1fa4d3cec 100644
--- a/include/linux/dma-fence.h
+++ b/include/linux/dma-fence.h
@@ -428,6 +428,11 @@ dma_fence_is_signaled_locked(struct dma_fence *fence)
 static inline bool
 dma_fence_is_signaled(struct dma_fence *fence)
 {
+#ifdef CONFIG_DMABUF_DEBUG_ENABLE_SIGNALING
+	if (!test_bit(DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT, &fence->flags))
+		return false;
+#endif
+
 	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
 		return true;
 
-- 
2.25.1

