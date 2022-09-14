Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EFFFC5B8D56
	for <lists+dri-devel@lfdr.de>; Wed, 14 Sep 2022 18:44:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C331810E98C;
	Wed, 14 Sep 2022 16:44:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2088.outbound.protection.outlook.com [40.107.94.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6BCF10E989
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Sep 2022 16:44:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b1/XTMSMAPT06yOTmfutAMcH8+aQofpWxm4ZptZxEXb/SXr38qYSiwh12SwhF4ioKmPtpTDxh/+BeDbA8AKrtAbAjSgdny4f9jSmEZtLr9Ni5AmdAB1rmIoy3I77oaUhfinjXCFZJ/i1bY53bl/76McXWIeOL2lruCdlL2GJxXYAJuCsfyKUViQa61WLZRHhUF3BxNiDsBRLReiouk7/iq16O5fOknsUL4m9Z1HSBEAhlavp3Oj2OLNKFd1u62WFHm0R3Y5dmgElptT5JscZncoXOkVsRqj5dAHjiJmLUSx+1pughpFjyPI/cholhmwYXusED7SaZWPdKNtjJZ0ZVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gchUWKBAKuchaeGM+DQztQFBRXMefRz7sl/QTpXGgP8=;
 b=OOIgCEd6I1cRPdP0HLsXFxuXQ3CdYrdl3X+O/SxUxA2kiCn88Ye6EuXyThRoJ6U4KsENI9GeYSu8WAtecZ4OpYlcQw41HxdTtQvNgceobpwBDGIvrJQHzWjoNStVNq6aA7gHw2NJnSYouong5WDxblRpNilJKyKM/CiBLyxY5GGGkd61FGvwogJFzPQY3YwiExAfwD16O2l3YtlLWSHnsZFPbo3c8hE4TRgkKqyc462P/NkRfMorOG4ivCGQyEp0/68vxpncAIh81xlo3ZZ8GRV1mP4Lt7IEDlYsi/QGnwI6xTRaevSrarXvQUxf3PEpPC4C0b4NZPfz0g6k1WXaiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gchUWKBAKuchaeGM+DQztQFBRXMefRz7sl/QTpXGgP8=;
 b=j2bRW8NSDzT7jxbOTQJS+DnBLJM4jtjVG6RxQ+DDc81LEloJaxqVl3MzqF+4bM4ZHdor6DXmK1BFDoW1xHkPskBitKp/1MJc9y0JTdc3wh7stpL6/DyIjDNgy/YcRm7Ncc6CdIA8COOHwHEpHgqrrUq8gBoXSQPW9pUI0EsXtLU=
Received: from BN9PR03CA0362.namprd03.prod.outlook.com (2603:10b6:408:f7::7)
 by DM6PR12MB4314.namprd12.prod.outlook.com (2603:10b6:5:211::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.20; Wed, 14 Sep
 2022 16:44:31 +0000
Received: from BN8NAM11FT034.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f7:cafe::6d) by BN9PR03CA0362.outlook.office365.com
 (2603:10b6:408:f7::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.14 via Frontend
 Transport; Wed, 14 Sep 2022 16:44:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT034.mail.protection.outlook.com (10.13.176.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5632.12 via Frontend Transport; Wed, 14 Sep 2022 16:44:31 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Wed, 14 Sep
 2022 11:44:26 -0500
From: Arvind Yadav <Arvind.Yadav@amd.com>
To: <Christian.Koenig@amd.com>, <andrey.grodzovsky@amd.com>,
 <shashank.sharma@amd.com>, <amaranath.somalapuram@amd.com>,
 <Arunpravin.PaneerSelvam@amd.com>, <sumit.semwal@linaro.org>,
 <gustavo@padovan.org>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linaro-mm-sig@lists.linaro.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 1/6] dma-buf: Remove the signaled bit status check
Date: Wed, 14 Sep 2022 22:13:16 +0530
Message-ID: <20220914164321.2156-2-Arvind.Yadav@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN8NAM11FT034:EE_|DM6PR12MB4314:EE_
X-MS-Office365-Filtering-Correlation-Id: 699c2846-648f-45c6-f20d-08da967065a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rAUPCm2+IJkxVWWUQSXFgO0H7VInCjG8F3NVAGWFqQY8IlHUPHG9Ofd1MoLX+iF8HYpRhCePFhvVU2GU8P5n3aEq3EQc79nCRSxhf1CE5rR8jEfOX+wAHRp/RYNHGpMc4wUSTfhY0uetC7VYo2vuTFZ05pyXMsMwnrjtQpE0gnZgAFjbARk2fqh76UDDUKa5aKiedavEd9etdpeimjdYyr9jNxh4R1JTIMRcfZCqoTUEyG7dsTRfA+Iu5EANiXb/lrpn0/UIW0oWA+bDvrlRhuriRPqb/Eerhtwl1aiZFYXtnip6TKz2Mufbwf76P4OmkOjhrHvcW1wjmeevuLhU1vxPnX6ZGOEIEqvAbUVWJxbCOMVqZr7nRd4kYSEgxhFszuBhV4kzf47fJGWtOoIHYG0LsEvLiOOP0DEhzgbG5CqHeljZqTAfqN05Qh5ij38coMAtaJim6FSfNzD7CqtiJX5kLN8kkV+CIxJUj/mVOac9jFB9HWeiNfY5La9A3WDKij85O6JPCf2ctwhNMGhsCZafHuAZNgGBo9TEQScoeViGmdhV55P0k34P+TotbU8F/8rqcNYAY2F+AX0pllpCke5vXfq+jkFhcXHFwLC1RRpzPazFXPc6U2B1j4juVW/7Dm/nGox5RCwDMv9Jt/bGJ0IW+5mOR+l3ij1z+D1GZLcICaTmqXM9211UuDeueZ1JG5G07Q1I69mYS+iCxrNsTUDjU3thp9NUGrQy3qQvqccE5O/nSGd1W8USZwr+KaQWew4Xpx6dQ8MVJFFxORWB12S1nUIX8qSt3aGRZCkJ23iTzMODNtWD42vTYTSscwZicYx7nqMPB8PJZwMh10obHMmQayLSAM/P26SfeVx83FA=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(376002)(396003)(346002)(39860400002)(451199015)(46966006)(40470700004)(36840700001)(26005)(70206006)(1076003)(316002)(7696005)(47076005)(36860700001)(70586007)(5660300002)(8676002)(4744005)(41300700001)(83380400001)(6666004)(66574015)(8936002)(82310400005)(356005)(40480700001)(86362001)(2616005)(921005)(2906002)(82740400003)(36756003)(4326008)(336012)(81166007)(54906003)(40460700003)(16526019)(110136005)(186003)(478600001)(426003)(83996005)(36900700001)(2101003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2022 16:44:31.1664 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 699c2846-648f-45c6-f20d-08da967065a6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT034.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4314
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

Remove the signaled bit status check because it is returning
early when the fence is already signaled and
__dma_fence_enable_signaling is checking the status of signaled
bit again.

Signed-off-by: Arvind Yadav <Arvind.Yadav@amd.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
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

