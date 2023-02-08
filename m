Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6446268EA56
	for <lists+dri-devel@lfdr.de>; Wed,  8 Feb 2023 10:02:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBD5610E6E7;
	Wed,  8 Feb 2023 09:02:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2076.outbound.protection.outlook.com [40.107.102.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1920410E6FB;
 Wed,  8 Feb 2023 09:02:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EyTAYUpU8j+N22WM1HFyF6KmlB/9VbcbqmcXHQdbVVdtC8vc6iuTREDa6FoCMJ4f3VZpaqQaK+2QdZF6yT9yG/PgHYbthRMmukorxOoE0LxS6nDlUg6fkseAMaCcfejsvyAGA9rua1P5sbRkTmNZ8A+RmmGo1KC/LAp8rZBP52Zy9Bkv5bplM4xKaKOl9eeEXlVmCpBhHIZjNi2cg5YYHvjuoBqKQYD1hoy1V42mM5nEwDeVH/ohglaXyw5so2SrYfDZ04jH0fpWl3zSkEnuPP9nWBiZ4Id1zL82SYR8uxef6FqfIcKn4e6RZk2VfKttYXuDRRM5c4Sal7HPyiLR2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qq1NTmmvf6gpMJ8tY6KJk7MPsdFUaad6aobSTKwETdk=;
 b=WokhJdSqgRCJ/Tpwhv+Srlv9GgSPaQV4mOfRdypOHeVzriZYL3nFCto62bHViczCGpXG17ykqSBLB7LmFhAez9REqJ9N/7UjUOD8/Lx8I7KZnGyz8yr8BKoSvw91NNaR4q2LZuQBxdD2xFutuQV+4yg9x6K53pP5EBY2m+MFM8/rKfXTKOtXDYLDxl5yGCTL+6TJkDaW6H+oLeylS4ThdRGzbA2rIz0EX4+P6+Vnd61nsuQz1UE1EfLk8l5FAK/LTOGDrDV7hzai0yp+YoXiF3i5U25AX2IwbfEDCmYeQAxaDM4K/6yDKsMnyQ+IbvPgoAbPrMkz4Uw5JRPPfX9uXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qq1NTmmvf6gpMJ8tY6KJk7MPsdFUaad6aobSTKwETdk=;
 b=EoxXikZlOgtm2W5ohHZCFghF69borwKTCG20r5JbSb1xdzolsoPFsf8rt+kRzCzenKPL6YSgVFz05cBC2J2A0vHyCmrt+N48CA9b7KXZUA6GNf0/kTVpsiwDlo16FfQRqvfLxgIW9RpVjlg5qfMvXIl+zskpeH/k3IDl51LiwvA=
Received: from BN8PR07CA0012.namprd07.prod.outlook.com (2603:10b6:408:ac::25)
 by SJ2PR12MB7944.namprd12.prod.outlook.com (2603:10b6:a03:4c5::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.35; Wed, 8 Feb
 2023 09:01:57 +0000
Received: from BN8NAM11FT055.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:ac:cafe::83) by BN8PR07CA0012.outlook.office365.com
 (2603:10b6:408:ac::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.17 via Frontend
 Transport; Wed, 8 Feb 2023 09:01:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT055.mail.protection.outlook.com (10.13.177.62) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6086.17 via Frontend Transport; Wed, 8 Feb 2023 09:01:57 +0000
Received: from amar-X570-AORUS-ELITE.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Wed, 8 Feb 2023 03:01:45 -0600
From: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <nouveau@lists.freedesktop.org>,
 <linux-graphics-maintainer@vmware.com>
Subject: [PATCH 1/6] drm/gem: Remove BUG_ON in drm_gem_private_object_init
Date: Wed, 8 Feb 2023 14:31:01 +0530
Message-ID: <20230208090106.9659-1-Amaranath.Somalapuram@amd.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT055:EE_|SJ2PR12MB7944:EE_
X-MS-Office365-Filtering-Correlation-Id: 636e20ec-a108-4929-70a0-08db09b321ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bTu6tHK4J4kLc5G5fjiOhR9saZXE5e5YYZTXM40I/vCW4o4bn25aSMuHiAh0Yf8fUEsjVpPHL75M5hXCl69uD9jSrbhM0nSF+xKyhGCt+umHEEDp0aKXNTTLv9MbRB/8TKq3C5rpSKttbmJ8kgva/hj1wjj8c413Op6+oMGjGM36rYOe5d89YZM0Du67PpMRPG/81mH9T7lKhcvZIJHgXCCuRM8vLgkUqp8E4kGk/WOgamfGTJbZ2Ho3SF/23xuGhXVUg8fTzDZhFcw/GTKcnEyXQWHTpXqRIl/SAj6Hc3pZrSnx3K4dFngXlCJxb12EXATNj8nRyZoWkWhG13JxEGv1TIfNw3Ui4Vd0ON4oCMSvJ9tsx7pHsC255CAkRctmykXNvkrSnxaiR0WItStvG2mvf0va7nIiRGNb1r3XeFEpRNXgkPaNH3h4YlsJqA1JggZ/MlvfDHH8D2toBHnWjOPse2tBZbu06xH0LRh0rR3CutP9WInd8Bw1X2aahxYo5In2Je89Xkm660oJAwks4x5tK07loN1HOO/Mx5QZWLbt9mvsfDIXbnANqMmW1iGohTrjPQnr09V9AoleoC76s5IfLs7TyeTOpn/CN4vMeitIrgLnF/cdfVmkmvw4fUThpT3fINWFDnlQxuHuZbap9fK1NdvLZ4xBnVz7FsznC4MfcbALOb0PhlIaAST1XzsJZOWSydNN32N297zXBr7QpxwODgi3wqroTnJLbQvAw6I=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(376002)(39860400002)(396003)(136003)(451199018)(36840700001)(40470700004)(46966006)(2906002)(82310400005)(4744005)(36756003)(47076005)(5660300002)(8936002)(41300700001)(426003)(336012)(83380400001)(40460700003)(70206006)(70586007)(36860700001)(2616005)(4326008)(316002)(16526019)(186003)(86362001)(110136005)(356005)(81166007)(54906003)(1076003)(8676002)(40480700001)(26005)(478600001)(82740400003)(7696005)(6666004)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2023 09:01:57.1268 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 636e20ec-a108-4929-70a0-08db09b321ab
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT055.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7944
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
Cc: shashank.sharma@amd.com, arunpravin.paneerselvam@amd.com,
 Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>, arvind.yadav@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ttm_resource can allocate size in bytes to support less than page size.

Signed-off-by: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
---
 drivers/gpu/drm/drm_gem.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index 59a0bb5ebd85..ee8b5c2b6c60 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -152,8 +152,6 @@ EXPORT_SYMBOL(drm_gem_object_init);
 void drm_gem_private_object_init(struct drm_device *dev,
 				 struct drm_gem_object *obj, size_t size)
 {
-	BUG_ON((size & (PAGE_SIZE - 1)) != 0);
-
 	obj->dev = dev;
 	obj->filp = NULL;
 
-- 
2.32.0

