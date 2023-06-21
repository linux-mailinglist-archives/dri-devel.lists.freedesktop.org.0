Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB5B7389FF
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 17:43:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66C908935C;
	Wed, 21 Jun 2023 15:43:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2066.outbound.protection.outlook.com [40.107.212.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7058E8935C
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jun 2023 15:43:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AOHgapTO1xvLY80M/AeqmmVUnXpGezI7sTAL7kQz6CRQ2ByxgWOcGRYxdZ9RP6SW8+ENcLE2P6hap2rtw1iURgOVOR4+b3e19BwSm62cFc2ectqdfs3Vrvpa+oqcJDAaYVhaC4RkPzzKfiHCOTirIims12qBkCH2W7/qecu5dNg6Pe/KPIr2qLtg4Yu9AeB/VR5Zst/hkmoSwCVapJQNLF9V/cTEDGGMo7j2XV9LjaAPhaFGQ5m9CqTbpZ3XELaE2965DA+3T19JazlSG7sy65ZTLcZZ3MQGABaP5QIe9YfHapX+jzixzVr1tcye8SvbtyL4n12RHtPhuiZx5/GMjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mXW/TGdOuungqdCwOGSnyr6B4HMYhfM5Shs/L5dXWyI=;
 b=iJtb36khN6eJVN8+CzYzmoIyFTxFktn6aUzKRJbW0v8F2Gbhngvr7rA0Y1UmamLilAxyNXa5RKvTGzg9A1rSQEYLe7JYKQjvQpFiHpFYvzZa9d7iOym/QUg7mv0YfxH+QxiyFtE/04VqVeZ57Cv6Mrl1azYVF+vRWkQakJ5P1Ff4X/gq/DHMQhfCUm6pzFVlDPHPxnxE8y6KlN9QIKsyW3kSQoPbI2zQO9X+K1/C5/yO3MgBkc1myDS3KtDvZ3PTy/cfUSEEw0oEzqZsbnKO18uIbdwnL+F14bl66K3QBGxzBpxlk/dTuEj/217P8ChcvbB1scC05Xeuk3r7T0tyvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mXW/TGdOuungqdCwOGSnyr6B4HMYhfM5Shs/L5dXWyI=;
 b=IdqK3MES4O+gdU3lwkFmVwgy12bQZAMHoKw5uKB5bDfRPq/TnykauPYurQz/50/BNno5hblGRFxDUWmftIxivN5+taxr9CFvye8QCxjqjLED0Y0mMorL6wzM9hsiRyJqJgJ5N3F8LGl4/nWLr6YnuuIWb9lgzCLFKxKIghD3VwI=
Received: from MW2PR16CA0072.namprd16.prod.outlook.com (2603:10b6:907:1::49)
 by CY8PR12MB7706.namprd12.prod.outlook.com (2603:10b6:930:85::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23; Wed, 21 Jun
 2023 15:43:42 +0000
Received: from MWH0EPF000971E4.namprd02.prod.outlook.com
 (2603:10b6:907:1:cafe::64) by MW2PR16CA0072.outlook.office365.com
 (2603:10b6:907:1::49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24 via Frontend
 Transport; Wed, 21 Jun 2023 15:43:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000971E4.mail.protection.outlook.com (10.167.243.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6521.19 via Frontend Transport; Wed, 21 Jun 2023 15:43:41 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Wed, 21 Jun
 2023 10:43:40 -0500
From: Yunxiang Li <Yunxiang.Li@amd.com>
To: <dri-devel@lists.freedesktop.org>, <Christian.Koenig@amd.com>,
 <Alexander.Deucher@amd.com>
Subject: [PATCH] drm/ttm: fix bulk_move corruption when adding a entry
Date: Wed, 21 Jun 2023 11:42:59 -0400
Message-ID: <20230621154314.6976-1-Yunxiang.Li@amd.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E4:EE_|CY8PR12MB7706:EE_
X-MS-Office365-Filtering-Correlation-Id: 864e89c3-047e-4415-0b5b-08db726e4a16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VCGS/ry9cxD7q/ZuPifn8ZnnW2BBvgfAtUttTTqZ3HTjTVNm3JCqNAroT6itT5KJXonInz8UGD5xXBODXmZDkQxelxHo2OQXKvtcV+P/xxaI3ZjtdIIJobInBeuG75EPJs8JOpjQKd7eu6VaaZ0MG0ne8EhkCYO8iOyHD1zeQtmEVRgaVug9zYkhJNoXIaH+1jI51xvnuvpQvOO0LGJfKww/b8WXxTdZrDZbydezuDLgsl1Z9AZp3EodcHoNDe+1ysFNappddcELxlQiE6usFc83mD0Juhf9AMPYhVcGCDgZlHOIrFZcyrIbVvrqE/R+SRBYF+Mrzk0cLCQxmzmRWnjVrCW+KkE0fF4JPnemB1+bv3lJgEOYKazJqaDljUOWIG6leYoDWOpRlP7MiMThL6h8/yKgZVuLH4/n8Qya6IuNmw6RB2s9WzXWNcTm9eEIToTuYUpgysjw7w3ByNsGwVw781hBk3RIo0X40OtuKJE4TrCfPpVPwa/NrRgdNMIfN771HUwH/TEkqpuOnPMCRb3OhKEBT48cI9vJhfHGgLcJLD9zmWZ1RY62kfpwPyz7HBlfLubDez01A8gqBFisGe2zyZJ4e15XiuPJdbyugdYZDb82gGi+9hN0CteqDjF9+qrsJ0rDOQWw3zNM4eWnZihRTMYPFlieryLF02U6EvZpUdXbqbGolOCafp0JCn2u0RU31c34/81ehQuX0Fz6L55Slpgf5K0BH7LW//6ZQct0tBsbCcV7XI1KGzSeHCD7M5rdMvJ2zxAOlYDPU5KyWw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(376002)(136003)(346002)(39860400002)(451199021)(40470700004)(36840700001)(46966006)(26005)(1076003)(36860700001)(41300700001)(36756003)(110136005)(316002)(82740400003)(47076005)(2906002)(426003)(86362001)(336012)(186003)(16526019)(6666004)(83380400001)(40460700003)(5660300002)(2616005)(8676002)(8936002)(6636002)(478600001)(40480700001)(81166007)(82310400005)(356005)(70206006)(70586007)(4326008)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2023 15:43:41.5328 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 864e89c3-047e-4415-0b5b-08db726e4a16
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000971E4.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7706
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
Cc: Yunxiang Li <Yunxiang.Li@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When the resource is the first in the bulk_move range, adding it again
(thus moving it to the tail) will corrupt the list since the first
pointer is not moved. This eventually lead to null pointer deref in
ttm_lru_bulk_move_del()

Fixes: fee2ede15542 ("drm/ttm: rework bulk move handling v5")
Signed-off-by: Yunxiang Li <Yunxiang.Li@amd.com>
---
 drivers/gpu/drm/ttm/ttm_resource.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
index 7333f7a87a2f..4b84cfb5f916 100644
--- a/drivers/gpu/drm/ttm/ttm_resource.c
+++ b/drivers/gpu/drm/ttm/ttm_resource.c
@@ -86,6 +86,9 @@ static void ttm_lru_bulk_move_pos_tail(struct ttm_lru_bulk_move_pos *pos,
 				       struct ttm_resource *res)
 {
 	if (pos->last != res) {
+		if (pos->first == res) {
+			pos->first = list_next_entry(res, lru);
+		}
 		list_move(&res->lru, &pos->last->lru);
 		pos->last = res;
 	}
@@ -111,7 +114,9 @@ static void ttm_lru_bulk_move_del(struct ttm_lru_bulk_move *bulk,
 {
 	struct ttm_lru_bulk_move_pos *pos = ttm_lru_bulk_move_pos(bulk, res);
 
-	if (unlikely(pos->first == res && pos->last == res)) {
+	if (unlikely(!pos->first)) {
+		WARN(1, "ttm_lru_bulk_move_pos is corrupt");
+	} else if (unlikely(pos->first == res && pos->last == res)) {
 		pos->first = NULL;
 		pos->last = NULL;
 	} else if (pos->first == res) {
-- 
2.41.0

