Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADB53743B1A
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jun 2023 13:48:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0BB810E15D;
	Fri, 30 Jun 2023 11:48:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2058.outbound.protection.outlook.com [40.107.237.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22E3C10E15D
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jun 2023 11:48:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PjcjOAV3g/58c+VTO9FWledL0hqp5JEkr8KC0MLJ/3niLvhOdlsvnDHdDDLLzYL9ZLLhsarVTN0nPiCdEJtvXMvUJrYrut1L8BqFqMBcS9LamrFTisNjdFomRap17XE3xBidGC+VkBfiPNH9wMG0Gd7oJ4NOGKZ8T155qA/CSwgbIm1ta41mkUpK7N9Ztg5uzr5zRxO6F2paav+7Y6SWLTJZS30nQlN34GprQO3lpLvx2/PIn8zOCaDhp0mTHChpHB94G9UyLdgZJKbgugJ6zGWpO+rd8/nA9IxHu64TiG4EkmG2+dmnc+rFqT4nhCcJivRpLqIvrW6LKDOfdLyXKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JHcOF/BB79qV8szHLF7p08JA9U2RL5WZz3pT0VRoTpI=;
 b=bpG8ogB4oGkIvlkgXG/L4HWFFW+mrzFgWUv1hNhK2m1NrNAknBJP74W9srANYpr5atXQL85cgy/SuaLK9FO47F+0DdShJtgISZGEP21fy3ZnVSR6ibg629WT31KxHt0gPw5vTAuFCveYbRf37GL6dX4tuQOVatsMnFG1VC5n8uuuIko5v27XGhLJ7Lenw7BYZEXkHyPIgudLIQsXFTN7D0EUutUerJ9zgozMTazDXJAbPp8laTPHELEi4UvYQCWUL90Ve9/ailt95GTsPuo9UMwsEPtydRzdziADq4OO/gWVGd532esCVhXJ8y4jJ82goMipFwryRfk9OM5WykyD5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JHcOF/BB79qV8szHLF7p08JA9U2RL5WZz3pT0VRoTpI=;
 b=TdPIoashH3w9WsWHcNd63XndT6AjnSgUSNfGDPbCn+Mk10vu94W+JDVPCbdDcEBqLtapMTBTBLisXmQEiGEUJguQ9RSNvVcQ3IeR9uQJ+bDutEhAzZWc78vH0eKGpqmgW1rOVdlDfuye1Oml8ENzUguupmuDXKpZ0etnZFdjumc=
Received: from BN0PR04CA0147.namprd04.prod.outlook.com (2603:10b6:408:ed::32)
 by SA1PR12MB7411.namprd12.prod.outlook.com (2603:10b6:806:2b1::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.21; Fri, 30 Jun
 2023 11:48:51 +0000
Received: from BN8NAM11FT033.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:ed:cafe::32) by BN0PR04CA0147.outlook.office365.com
 (2603:10b6:408:ed::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.22 via Frontend
 Transport; Fri, 30 Jun 2023 11:48:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT033.mail.protection.outlook.com (10.13.177.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6500.49 via Frontend Transport; Fri, 30 Jun 2023 11:48:51 +0000
Received: from jz-tester2.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Fri, 30 Jun
 2023 06:48:50 -0500
From: James Zhu <James.Zhu@amd.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm: support up to 128 drm devices
Date: Fri, 30 Jun 2023 07:48:38 -0400
Message-ID: <20230630114838.354806-1-James.Zhu@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT033:EE_|SA1PR12MB7411:EE_
X-MS-Office365-Filtering-Correlation-Id: 10acc44f-670e-4ce0-d7fb-08db795ff914
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: K9Jg5Xgy2Imtl8+ygv4tyAvXOxEXVOMxRcdkrytGZWQKwI/efte2BGlUC4jIapiFEfGOfWmcdJOsB5WPJeglLm+1iwT2FE60y+AsvowFI/ONpG9HPATJD6MD9hwNq4qcFV9gmnkNG2E7nih7f9BoSNCUHAd4MCmXGKBudMBUGcB+z7wz7Mr3OA5mm0lZZ+DBfF6giUPUUEoupZvowu2g9ntkVnnp+DLeaoIL4fQpd6lM6+HBYxQoxNnlaQaLITTxWW/I0wlevQG6tY5jmeg1Fh0Y0LmLezdwQOqnTTGYdJLk3d5Pbi+nOAR2EiS+IkXVZ+Y0jjsA8wZ88mZO0GSO5SdghJjZw1D2wMClZIplRV2ZLwD4mKXXzfHnigl2EG/2NppxMHcr+WeeHi2QSUnXFaRE7pBwBrfZAO7cDNtcXZvcIGU93w/L1u1tanP7AUcu5qMlVnUHEmKd51BmQoej3r+a0DM8ccILfLj5AFWuOugdtk6IrroHtpaMGt0h9wg5KHVUJ+8OB+6+eEeCSp2kGf/2Dao/LqbnK/7XMF4RxZj2wQX9B30QyFavobpc/NMr7kptNGSf6aRbKow0UhiRuCIc19BbhXNyk9Q8zOi3F0yhDCZ5EZHujF/wiJc5ecry5dGPRcSBFumaCSOYAHPNKEr/pHNN7zaYte9PSiXy7eG0gJEl5nEe6RVT3jYwZfpZbnsUi5Hu8ksgTTc4TYqEgmea6BQni7mk1JEmTFBCRspdWIdy4rQ3cd7llJPiJxcvlWKEXNOmsOGTetL4OsyVjA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(136003)(39860400002)(396003)(346002)(451199021)(36840700001)(46966006)(40470700004)(426003)(83380400001)(336012)(66574015)(47076005)(316002)(8936002)(7696005)(6666004)(8676002)(54906003)(4326008)(41300700001)(186003)(40460700003)(36756003)(36860700001)(40480700001)(82740400003)(86362001)(82310400005)(356005)(81166007)(5660300002)(70586007)(478600001)(6916009)(4744005)(16526019)(70206006)(26005)(2906002)(2616005)(1076003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2023 11:48:51.0335 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 10acc44f-670e-4ce0-d7fb-08db795ff914
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT033.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7411
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
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 jamesz@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Christian König <ckoenig.leichtzumerken@gmail.com>

This makes room for up to 128 DRM devices.

Signed-off-by: Christian König <christian.koenig@amd.com>
Signed-off-by: James Zhu <James.Zhu@amd.com>
---
 drivers/gpu/drm/drm_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 73b845a75d52..0d55c64444f5 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -137,7 +137,7 @@ static int drm_minor_alloc(struct drm_device *dev, unsigned int type)
 		r = idr_alloc(&drm_minors_idr,
 			NULL,
 			64 * type,
-			64 * (type + 1),
+			64 * (type + 2),
 			GFP_NOWAIT);
 		spin_unlock_irqrestore(&drm_minor_lock, flags);
 	}
-- 
2.34.1

