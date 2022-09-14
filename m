Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD9C5B8D5A
	for <lists+dri-devel@lfdr.de>; Wed, 14 Sep 2022 18:45:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF6B910E989;
	Wed, 14 Sep 2022 16:45:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2055.outbound.protection.outlook.com [40.107.212.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7523210E989
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Sep 2022 16:45:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xy5uQsNhf2fgkX2EK4nUqhSMOBUKXviGkybVHHSd8pLD5ReMcl9mLZsl3dPW/O83GwAdkDK8UTYNCoj7pckw5s3ULRI8fRt8RGjPmLKA7DS7KYoSIEBWVsamf07/jJtbrcG0ANnqFPc3Ujpy6bmEzZheMzhGpKK5Z1ZbfulTGvhfd8TVB/q3SCNTMiqxLHsp9kknNZnBzl9JA87+lzb/YGl6w5ey9iW5GSfleswM5hPkxeQV0ldElvGbbdI+EsOnTPLezsI49TLFK7mKUMhiTNTzkmmTmgbcr6Tki21Z5XxRfKMQBKchh/BtewHp0ed2QmKvIPRtYYehxTCvNLsa6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EHKQo3CbRkA/356+OZefIRvz4ZXAuBE+hL6lilRuDE4=;
 b=I5Vbup2Uuf9rFsAB3Y5xu8zImvQbcA9/H6Jk2hHoPx7VWhs6DdyYzkev5GihJADsBFW33tXtIPYCXruBAK5eB+8MdKt6fbEl6cJmDGhAAS8NdsKQ2mB7i4dbHDbebOLT22SUdV68vlKFSikinWomX8Z+BPSXTkmzv8K/fVhpOIpznfu2zAZFgKbqu8+YBnVI0b4wxpvorAlEW+em8JTXUJHDjIpU3uBcYCFWa5FLFrFPnI2HMNyrmmunZ5fmekRO8PTR7CkGiZHYXbV/Al6r8JFH3L0yMFobMwRgmQZoJzTntmt2gOYLEDAuIXnCCTAEfeZNVsVBZeaPFKVaea4uqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EHKQo3CbRkA/356+OZefIRvz4ZXAuBE+hL6lilRuDE4=;
 b=LSSS96hhKQSV3AhNHtxdv9LDHkP2gJP+xkf7DemcGHMdj1jVGK6NF34xLpMXjxJVBA6CsBS+xDAvt9zMlz1q/B4tcuGoLnuGMVrNEjBiKXDF2dTTX6ws0DQg+4xj8yrtI+HjcFOqaJCxjM9kI8V3YiLwasGLhsdfJSD3+MT+ZwQ=
Received: from BN0PR08CA0030.namprd08.prod.outlook.com (2603:10b6:408:142::9)
 by MW4PR12MB7013.namprd12.prod.outlook.com (2603:10b6:303:218::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14; Wed, 14 Sep
 2022 16:44:57 +0000
Received: from BN8NAM11FT073.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:142:cafe::4a) by BN0PR08CA0030.outlook.office365.com
 (2603:10b6:408:142::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14 via Frontend
 Transport; Wed, 14 Sep 2022 16:44:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT073.mail.protection.outlook.com (10.13.177.231) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5632.12 via Frontend Transport; Wed, 14 Sep 2022 16:44:56 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Wed, 14 Sep
 2022 11:44:52 -0500
From: Arvind Yadav <Arvind.Yadav@amd.com>
To: <Christian.Koenig@amd.com>, <andrey.grodzovsky@amd.com>,
 <shashank.sharma@amd.com>, <amaranath.somalapuram@amd.com>,
 <Arunpravin.PaneerSelvam@amd.com>, <sumit.semwal@linaro.org>,
 <gustavo@padovan.org>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linaro-mm-sig@lists.linaro.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 2/6] dma-buf: set signaling bit for the stub fence
Date: Wed, 14 Sep 2022 22:13:17 +0530
Message-ID: <20220914164321.2156-3-Arvind.Yadav@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN8NAM11FT073:EE_|MW4PR12MB7013:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c6c9833-ff8a-4ebe-57a3-08da967074ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iPa48RNuGwLMybk1SNRLkEicIjC766KkT2LDIljdi3+FVr0kRRPerOtvb66ZvySqq9PztYYRS1qFZhh+jXDhQ59Nvdjl+Mzg7gw9PYxvj2ze/TGqgzBXLNfAWSKO7gJXfHGHvN1pxOfU/CgsnfHcrLdOUqYvkyRgE6IvzaFLD4GdC3ZnmsgzJi+0KDwyd1rGpYnaKaYhrleEcG4ZQfEivDJVqeyxgLt+whXz2g2hJQ0BMbkdgezpWjTXbmQTRSmsn4/g8UtQgH/XW/B/mI8I0gF3UOLff1Kr0az9YY4HxrRcd6TskHywd5Ic8GiCcg+X8Jgc6CCHmNdZYRCfsu7dKZvcEKyyu9yjC7+evWU7lAinXSwgr7hPh0JRjYFhbbNEjrQo7eJBWNPbwbv//2CJtkPrONtR4SEOuajWXG2ViB7X0WeImmGDInOwGAJmr3RrrzjxHE3lVB1jgyPF1HSRTQVUMOfw9Fm4r/FcY7TKwGAZZl28k4tuNF0gw5SRvtD0oiakAn2chF3B6wlkEkhK0ttGZDCmKBTkqsD064NfF9dIpSV7ZJ8XDQy7HOjdY1V2+ALFZN8Jy1/sKs3ReItoLjJUhqDoXhVslMRftv15KuZRJrMhni4d3H3fc2ymIgbEIaaXp7FL2EMLqquna6mY/f85DLWatLWMP+tvXAsa7B27RDii59+usIpHuKLuxhsWjl5I6X+RyjqRJTHiP5CDnrYhu7CXMxw1URbnyW0UOvRfcEwyU8xPkpUbNtLJ7I4sipd+kpJc4lX5dlCOoZgqKPQqEUIXiJoUS58fN00l2NIB/+AKkBxru9qvBTlckem90Kbolfzfeu18mgI6Tivx/n3JGw7cVvZyVE+2DQUB4kuBWfG0TOs0ztpRqrCQ8XPD
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(346002)(396003)(39860400002)(376002)(451199015)(40470700004)(36840700001)(46966006)(47076005)(82740400003)(81166007)(36756003)(356005)(426003)(921005)(336012)(316002)(2616005)(40480700001)(82310400005)(1076003)(6666004)(2906002)(8676002)(40460700003)(110136005)(66574015)(70206006)(186003)(7696005)(83380400001)(26005)(478600001)(86362001)(54906003)(41300700001)(70586007)(16526019)(5660300002)(4326008)(36860700001)(8936002)(83996005)(36900700001)(2101003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2022 16:44:56.4438 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c6c9833-ff8a-4ebe-57a3-08da967074ba
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT073.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7013
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
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Arvind Yadav <Arvind.Yadav@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Here's setting software signaling bit for the stub fence
which is always signaled. If this fence signaling bit is
not set then the AMD GPU scheduler will cause a GPU reset
due to a GPU scheduler cleanup activity timeout.

Signed-off-by: Arvind Yadav <Arvind.Yadav@amd.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
---

Changes in v1 :
1- Addressing Christian's comment to remove unnecessary callback.
2- Replacing CONFIG_DEBUG_WW_MUTEX_SLOWPATH instead of CONFIG_DEBUG_FS.
3- The version of this patch is also changed and previously
it was [PATCH 3/4]

Changes in v2 :
1 - perviously using  __dma_fence_enable_signaling() for enable
signaling.
2 - #ifdef CONFIG_DEBUG_WW_MUTEX_SLOWPATH  removed

Changes in v3 :
1 - Enable Signaling bit for dma_fence_allocate_private_stub.

---
 drivers/dma-buf/dma-fence.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
index 64c99739ad23..645c158b7e01 100644
--- a/drivers/dma-buf/dma-fence.c
+++ b/drivers/dma-buf/dma-fence.c
@@ -136,6 +136,10 @@ struct dma_fence *dma_fence_get_stub(void)
 			       &dma_fence_stub_ops,
 			       &dma_fence_stub_lock,
 			       0, 0);
+
+		set_bit(DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT,
+			&dma_fence_stub.flags);
+
 		dma_fence_signal_locked(&dma_fence_stub);
 	}
 	spin_unlock(&dma_fence_stub_lock);
@@ -161,6 +165,10 @@ struct dma_fence *dma_fence_allocate_private_stub(void)
 		       &dma_fence_stub_ops,
 		       &dma_fence_stub_lock,
 		       0, 0);
+
+	set_bit(DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT,
+		&dma_fence_stub.flags);
+
 	dma_fence_signal(fence);
 
 	return fence;
-- 
2.25.1

