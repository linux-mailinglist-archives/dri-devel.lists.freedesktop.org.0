Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 403A74D8C96
	for <lists+dri-devel@lfdr.de>; Mon, 14 Mar 2022 20:41:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CF9810E2DF;
	Mon, 14 Mar 2022 19:41:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2080.outbound.protection.outlook.com [40.107.212.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 184AA10E290;
 Mon, 14 Mar 2022 19:41:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=POuNZ4oI/cfUQcCdVa5GNLK9a7Y5OfursqkWZoh5r63yyCpyMbLsahHfu0a2Y6nKUOwLOMps5Zc6vlR2wGpfbbyTisHDTlPlEEDuiKfOwZM0d8csGuiuDhlZ9qA0WKBcwWua8OW/JiKRic4PW7B1csYKwJrD2CTZzYMew7HMncuEhZ0EhoNBDdX9QIr/eBjoc1rypXIkf7ISd5D/wiExzQyABc+0j2sNcSb6joL60fTDYJ6Jwhkqw90TrX+f/f/UwNCQ8PKg/ZO2I4tJvd5Lt/hzT4BpVHo7dnSGl8buDqPhVReTwCLPLdO84/1NkG5u4J3NNQQIHg9DtQWfIW0FfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mL9uE0uhDepPi7cZE3CoeT2eNjaXSb4fO9QO/5bqkjs=;
 b=dCkOssZ/SeoVy2+kaCrdQrPpPEl/zImw/H8KdVJ6CQTWtqlV78r2CZnoygELLr7NQxMCB3XAYOK+HbhRp9JRbr6xSj7p+Qtb8f/cJARa2ai0iijhxoHp/IjKW5zvfuPZ7QkXRo++HFiPr2Oa8Zf/Pdfr7Hlxdlw7UiJFulon1Nb1Lc49sNxAgLxvQn1adwFZeZURq3w3iuWei9nb3LdqeyTCLRcoQMtXTwsw9NlYxlzlkdRMy3XSI7A6zRr4j+G8zm2E4d1TmSuA/Etdx6iKim+Gn/TB3Zj2wuM01oHS+zhs2+YsHCWYlDh8e2fu6RfeBtiRf1Q0/8Ed3eqJCkN35w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mL9uE0uhDepPi7cZE3CoeT2eNjaXSb4fO9QO/5bqkjs=;
 b=kuhp/CfkoeQmL7mORrxYTgSpwEFrPYUtIN3+4rLeD/1Lh7auXhHfTOA6kiFegTCq1zj2dS/FURGtp8aTlRrkxnsZj5HjNQ6zo0oUkhagf+XNfjfnsGvwBwiTlF6fcNn4aMDD8a61GL4wi8K0Iwv+TZYN1pC+FzIUJCPJW6otdsc=
Received: from BN9PR03CA0557.namprd03.prod.outlook.com (2603:10b6:408:138::22)
 by DS7PR12MB5886.namprd12.prod.outlook.com (2603:10b6:8:79::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5061.25; Mon, 14 Mar 2022 19:41:11 +0000
Received: from BN8NAM11FT029.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:138:cafe::6) by BN9PR03CA0557.outlook.office365.com
 (2603:10b6:408:138::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.25 via Frontend
 Transport; Mon, 14 Mar 2022 19:41:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT029.mail.protection.outlook.com (10.13.177.68) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5061.22 via Frontend Transport; Mon, 14 Mar 2022 19:41:10 +0000
Received: from rtg-amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Mon, 14 Mar
 2022 14:41:06 -0500
From: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
To: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm: Fix a infinite loop condition when order becomes 0
Date: Tue, 15 Mar 2022 01:10:49 +0530
Message-ID: <20220314194049.534471-1-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7f6d34e3-b6f9-4d70-1f0a-08da05f29739
X-MS-TrafficTypeDiagnostic: DS7PR12MB5886:EE_
X-Microsoft-Antispam-PRVS: <DS7PR12MB588658CAA35EE6AAAD697451E40F9@DS7PR12MB5886.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: W2qnB2DYxhs+9M8kDAylimIc8ka19ZJo+uakAL0pPFVFU1JcprTVUDINB67GF/lAuvgwUqku/MVh8+zKyal4wp4hOwZwzbIXhvt4hwE+0UeDEHWuLDhFjhTS8pvcJRjsjpx1ZyqjjLlF7oJb0IsUioxoWjD582yFXbAD0fJLtt7m5OOaNBoKfbldkoe0bPXR6jKvlvGc7tfreZFJ/5a5uxZKY2g7HKzYJsosnng8PYpFQc/vwSG/CW288HofXJy8SFnN4Jk0JiIU1CquUzT7Nsp8h/hkvQqj3SKrl/bDlch7LlL1Ngdx4Vdau1Y/JdwHAJ6IqE1q0opzYw6Lbn6Zlo4+NU1hnVaDSp8ycsEYt2qAc7CjBp6/Ee8YNQFvWpfvQKv+btOu9seIi4G+iEXfp9Yk3UF0GUPWWn2ptGvzQC6CPMYICyD55ys5hd4KdTQPBzLopDespQgYfnFQSyhSQ7/dGPKWsx9GdHjttgSauEe6KWWIkGGqqdSckzfFgC3lnTSm7QJ37DianIxv5v8NtVxjnwg598cLiGclmEYXCxRv3C9ByVJzz+3vvYh/rmwaf/K5OTQrkcAIYQ5rs7CJrWOjrK4ilUvbvqzu9kfCIrJh8o1/CceDPe/TD+nI7eWUgdGhEhejo46Tn1h+9Bt+TZ8LUq/KTXdzGRdYTxlqHWbrYyyc9KWXGDM2PztXBR6Kl1lq0CIseoRQc7Q7JzIZvw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(47076005)(40460700003)(4744005)(83380400001)(2906002)(8676002)(6666004)(82310400004)(7696005)(4326008)(110136005)(54906003)(336012)(508600001)(5660300002)(426003)(316002)(36860700001)(36756003)(186003)(26005)(16526019)(1076003)(81166007)(70586007)(356005)(8936002)(2616005)(70206006)(86362001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2022 19:41:10.3049 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f6d34e3-b6f9-4d70-1f0a-08da05f29739
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT029.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5886
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
Cc: alexander.deucher@amd.com, Arunpravin <Arunpravin.PaneerSelvam@amd.com>,
 matthew.auld@intel.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

handle a situation in the condition order-- == min_order,
when order = 0, leading to order = -1, it now won't exit
the loop. To avoid this problem, added a order check in
the same condition, (i.e) when order is 0, we return
-ENOSPC

Signed-off-by: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
---
 drivers/gpu/drm/drm_buddy.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
index 72f52f293249..5ab66aaf2bbd 100644
--- a/drivers/gpu/drm/drm_buddy.c
+++ b/drivers/gpu/drm/drm_buddy.c
@@ -685,7 +685,7 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
 			if (!IS_ERR(block))
 				break;
 
-			if (order-- == min_order) {
+			if (!order || order-- == min_order) {
 				err = -ENOSPC;
 				goto err_free;
 			}
-- 
2.25.1

