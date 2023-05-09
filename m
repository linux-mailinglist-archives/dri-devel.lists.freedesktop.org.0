Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 448506FD26B
	for <lists+dri-devel@lfdr.de>; Wed, 10 May 2023 00:15:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C3CF10E41A;
	Tue,  9 May 2023 22:15:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2072.outbound.protection.outlook.com [40.107.220.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 682F310E41A;
 Tue,  9 May 2023 22:15:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sa82gcPWt6leez/CiTaDImREuNcNvO/zhfVg8KcCvDznm3nLhpXLUFAPao7tL1fwE5lncXaI7HlhkB/0gwSLimExNu4F2MqgsnJ//vsyxYX8Q7SdyVxqm4lrHiNUYYottaYqnmdTY4K69mzIWLwo9/IHdJK0JKt73Ex+7INN9ZsV9zXaFbmLPdsuEz5lkFr263KDSlm0xk2EYCAuyBY8hmc1V213KZUgSs9jkXJ2NKUs2LT1/4sf9ZM6SGdYmAJz8rQVvRAo1IU4GbfmgGryYUx1hjYirPF2KOaNmK/oWBtE56qrFKVoLpwxvS0iwO66qXFC39us20dBkvTDRWMfMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9sGacVdxtVfcZfVn4cGDXzfQKmh3YLDw8k4VkubKKIg=;
 b=cuR5dY3FEALdGtoqUKKz71WgOVMk7FMVfanCItLRuNl6mDVkM1f4yjuF+xNldE+6HGSSgKLDUU6EWkl6vTJ6wwWUmCcfADRwpeTMHC0zKpD4Uzp+IjQjIfRjUAkgvP8BhduDpjxel7YpahydmOXccf5jmEWiHT0APAj3wIME5l/uSSG/1AFGrV977PC7RwIPDCdFVrAShL9bbxJWnN167EAesBdHY7x9d0COaEnqiOZ6UE1uBGrbHkpQKkXFDRNeX4IMmrVxR8bU7sz1FBU4IicY1c7eFLRIaj6p1KDMVZuFmPhwKFStW/buf5avJroxEwi8kuFtTi8F4DQLUXOkEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=bestguesspass action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9sGacVdxtVfcZfVn4cGDXzfQKmh3YLDw8k4VkubKKIg=;
 b=5FtW9WSkVb14RjQmF6Lk1wJ17SyiNtayimisAd8ifbCKsw3I/WenSkfBBQfpH1cmMO8/8AwnUQM43IGFFpMCg6OkYCLJYQx0xoSZo3DsTAWyKAL/O20jCkvFDriSzE6pGHsVRX3TcHn8qh+0FPw4Z+TzXC+FeQgwcFp3CfJXPrc=
Received: from BN8PR12CA0035.namprd12.prod.outlook.com (2603:10b6:408:60::48)
 by CH3PR12MB8545.namprd12.prod.outlook.com (2603:10b6:610:163::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33; Tue, 9 May
 2023 22:15:30 +0000
Received: from BN8NAM11FT113.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:60:cafe::ec) by BN8PR12CA0035.outlook.office365.com
 (2603:10b6:408:60::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.18 via Frontend
 Transport; Tue, 9 May 2023 22:15:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT113.mail.protection.outlook.com (10.13.176.163) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6387.18 via Frontend Transport; Tue, 9 May 2023 22:15:28 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 9 May
 2023 17:15:28 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 1/3] drm/ttm: export ttm_pool_fini for cleanup
Date: Tue, 9 May 2023 18:15:14 -0400
Message-ID: <20230509221516.477025-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT113:EE_|CH3PR12MB8545:EE_
X-MS-Office365-Filtering-Correlation-Id: b0f63184-4be8-4118-156a-08db50dae5a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: E9Z8hEXJVzP3M8go9yfxOO+ZBZHTJKMKvsfUzYX4hzQrO3L8EXxOH174oDz3oJelJW3LqxRgQ43/3LfpS3VaQs4+w+eL+j6oZ9Z1/FMB5mbF6VtZVJro7BYSuu6PS5CtXd+L6p2S47okC2YzQ0szz8PafxlV+NYQx0ZSxeIkeXpdNe7xn8LAPcSNxC4qLWbb4erk1ACLfzLWUQwMklvL5lW/GrOSVRBFoZhq+f33p84yfpV9XG63szt7plKN0ZXaXkEGGMa2m60bCL2ECkPKoYLJpFyQaj32FGruzrwA8T3MNbchx2W9net4itScsUO3OC17JNpSdU+ZFWC44A67Xm+MISsGSZ2PvCfy7MzJt/LukBzWixKlSuB3UgQ6YRPiHaaBx/jhNOrZRhxjVigPRWUD2QYkRgoJew3XNOuLtAK9oeradLN1VhhFTE3RmNKOuroaqvNmi1vg+UbLrg4diR9hbr7svcYQ4jqqCQu5MjXEFJfn9CoVNlHHwSggjuYnLtoBtQJqnKZHpXgEg6fxhPCxMTsmAXzRZ/qLcHaK21Q12BAlSd5a2Gsh4y1LjehcrE61tsCuGDW8BAdV2atFo+NkiDj1q7192Fi1mxdwjA0Ftr+zuBpITDR6iX8cMBCqnhn8X5Tsm9H/1XN086F/n/ezTu8zk+rdJVWlJeeSPYrWaQ18I/cXMhehQ0SAeyLEa0Wk1Ukp1aK1t5jDq6+uy8qORP8Y/kJbKmYrqCrcoWY=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(346002)(396003)(376002)(39860400002)(451199021)(46966006)(40470700004)(36840700001)(5660300002)(6666004)(4326008)(26005)(316002)(81166007)(41300700001)(82310400005)(356005)(82740400003)(86362001)(54906003)(1076003)(70586007)(110136005)(70206006)(2906002)(4744005)(450100002)(8936002)(8676002)(16526019)(186003)(7696005)(36756003)(478600001)(36860700001)(40460700003)(47076005)(2616005)(426003)(336012)(40480700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2023 22:15:28.8744 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b0f63184-4be8-4118-156a-08db50dae5a9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT113.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8545
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>

ttm_pool_init is exported and used outside of ttm subsystem with
amdgpu_ttm interface, similarly export ttm_pool_fini for proper cleanup.

Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/ttm/ttm_pool.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
index 1068a41cded1..d4f6cc262e9a 100644
--- a/drivers/gpu/drm/ttm/ttm_pool.c
+++ b/drivers/gpu/drm/ttm/ttm_pool.c
@@ -573,6 +573,7 @@ void ttm_pool_fini(struct ttm_pool *pool)
 	 */
 	synchronize_shrinkers();
 }
+EXPORT_SYMBOL(ttm_pool_fini);
 
 /* As long as pages are available make sure to release at least one */
 static unsigned long ttm_pool_shrinker_scan(struct shrinker *shrink,
-- 
2.40.1

