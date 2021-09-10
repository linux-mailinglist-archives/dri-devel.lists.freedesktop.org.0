Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CCB8E40667A
	for <lists+dri-devel@lfdr.de>; Fri, 10 Sep 2021 06:30:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD3716E957;
	Fri, 10 Sep 2021 04:30:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2081.outbound.protection.outlook.com [40.107.92.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4348E6E956;
 Fri, 10 Sep 2021 04:30:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fltmOZiGAkEjaB9If80v2qju9lCBIvTpErAm0p1tjKUcuUHcTpFrQ3O3B3JPf95oOIDDPwoPQwqW+uJDYHavb51h0so6n3wX+4IUN9i/H35lRBRqddEKfs4TuNDs2NPNYXbJ1j6ICgP09ccclVuB4GaJR3Ss7SnIRZLV0SEBDbPkujSI6+3ajZW+w9z4oZOlU66DjiW5YtvyimwdYPWf+mHq0DhaeilU1wbMzgvDysc0GoNEzwhKWVuFZfcIgfq4jwc9nKuSFGBrfODpHYjhE6VaZP/E9Z+6bxcgGrqe2/Rth7YyCHzWbW2d00nDzLSmNK0WgOhNiKm01wZY407Qow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=oJCD1enuaUe81Bx4iP+hIMOo+hpWSCOogis3ulZCIOA=;
 b=I0o/zAOoSQ2afzgN8dD/6SQoqV56SCClZgcFpc0GI3uOvUlJncTJRbsUwq7EQxY+D0ffDfhaAyg3YSRbsy9qmf5Oir8SlSNBFsBxxa5/KAjZeF/ZGG/3J0+pNTmQyZQKKAFskZm7amxgw0NSx903MtiuMYS5u0tC5Xh32YpRRhHThkSr0MoSlKN3FTwWbgfV1OPUDuXvK/xEVexcy1MbqzdeNU6pAHQ+QwbFFha1050wZAc1k9GdJ968j1vF4wekeUsxry2KBB6Xpdfw3/mpIsOYVRd/E8NwLsaQenNStYg8bDbBwX3u47T0kMotZPf8t5gyveqF+djbOgcfkog/ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oJCD1enuaUe81Bx4iP+hIMOo+hpWSCOogis3ulZCIOA=;
 b=tq+aojEr/KT7b+ntqNqoM8pIer/Zx0GTgom6ovRDRCkkTjUHQlTBQvE4OdQ+W0cVJFBaFb90RVuleQ0vafBR64IQ2AMZwH2umQD9aO6W9MA7wo36b9Pu56LkXHTwr/fEfmrxb6bfyNpyK3n3d5FqJ0/cz6myQGyN0sAaEv6++cc=
Received: from DM6PR17CA0021.namprd17.prod.outlook.com (2603:10b6:5:1b3::34)
 by MWHPR1201MB2494.namprd12.prod.outlook.com (2603:10b6:300:de::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Fri, 10 Sep
 2021 04:30:33 +0000
Received: from DM6NAM11FT005.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:1b3:cafe::62) by DM6PR17CA0021.outlook.office365.com
 (2603:10b6:5:1b3::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14 via Frontend
 Transport; Fri, 10 Sep 2021 04:30:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT005.mail.protection.outlook.com (10.13.172.238) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4500.14 via Frontend Transport; Fri, 10 Sep 2021 04:30:31 +0000
Received: from guchchen-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Thu, 9 Sep 2021 23:30:29 -0500
From: Guchun Chen <guchun.chen@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <christian.koenig@amd.com>, <xinhui.pan@amd.com>, <alexander.deucher@amd.com>
CC: Guchun Chen <guchun.chen@amd.com>, Leslie Shi <Yuliang.Shi@amd.com>
Subject: [PATCH] drm/ttm: add a BUG_ON in ttm_set_driver_manager when array
 bounds
Date: Fri, 10 Sep 2021 12:30:14 +0800
Message-ID: <20210910043014.529-1-guchun.chen@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 876d17b4-0ae3-4440-2d56-08d97413b98c
X-MS-TrafficTypeDiagnostic: MWHPR1201MB2494:
X-Microsoft-Antispam-PRVS: <MWHPR1201MB2494BE0AEEF255976644610AF1D69@MWHPR1201MB2494.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1107;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dK6PjJd1qQomTqV/lue/hg3y0byttmAjEZvatYsPS9FussGOY1OZM4Y8+5Ychl+l2vRE7sRaI2nqFvSNgir/r8FC3tDCzOQVZapMB3sGz8/D4rAANCPT+ODwEQoQ+mb+SRSpkDA61+7fTG7Ay9ugkxue5DYnI6iHNRn+qHY2vF3myfMbP9zEV90Vi6d5PaQfmXDYgSKLR3rdD2iATZu+xg4w59+uY4SJ/69MrwSCZsE5+zubKlZX85Zd+lltckAxyKObLDusUrdIri3y/apBNasApsrmelVTPTwBludJ/FSjDWbHGav3sQaYAv9oWPKIMxg5WDMKktukblln1Ivt3ASL1+BRqBojFT08/s1dNgOgcUMRk/OAfFaQmKSu+kS+soxxUpJaxBpyGGVsodSBJhs/VZvYD/OUXlfcQcu+msOfoflCMngnQ5SVA1QsihmDfMrrdQz6PwLJZIbn0iNvANDRoFqSLL5chCLU/bo64p/V/hhzdQJmAYLrXd6rnVQ7NZKu5OdEWxgy+ibDykDB9zkPTSdxAy2bftl63n7mXkCHDpkAcU1M0UL2n9JNs2fdJigrSPgutFUki4FtudptnDx53BlLgEdAmvV1N4mLt45WGIXQFrZHO5+XQ+y/Cw8HLJcJVKVdt5bLW2NpRBn7ylZ6r5XzRYB5hfYzuA+XXfdXA+VJQD8kxozE9w1AuslBROUyKrmq9EPXF12yx9twMtK+iAFLri6SdsE99kQwJo8=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(346002)(136003)(396003)(46966006)(36840700001)(6666004)(8676002)(4326008)(186003)(4744005)(316002)(16526019)(2906002)(54906003)(7696005)(110136005)(6636002)(47076005)(26005)(36756003)(426003)(36860700001)(8936002)(1076003)(5660300002)(2616005)(450100002)(44832011)(478600001)(70586007)(356005)(81166007)(82740400003)(70206006)(82310400003)(336012)(86362001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2021 04:30:31.4878 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 876d17b4-0ae3-4440-2d56-08d97413b98c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT005.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB2494
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Vendor will define their own memory types on top of TTM_PL_PRIV,
but call ttm_set_driver_manager directly without checking mem_type
value when setting up memory manager. So add such check to aware
the case when array bounds.

Signed-off-by: Leslie Shi <Yuliang.Shi@amd.com>
Signed-off-by: Guchun Chen <guchun.chen@amd.com>
---
 include/drm/ttm/ttm_device.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/drm/ttm/ttm_device.h b/include/drm/ttm/ttm_device.h
index 7a0f561c57ee..24ad76ca8022 100644
--- a/include/drm/ttm/ttm_device.h
+++ b/include/drm/ttm/ttm_device.h
@@ -308,6 +308,7 @@ ttm_manager_type(struct ttm_device *bdev, int mem_type)
 static inline void ttm_set_driver_manager(struct ttm_device *bdev, int type,
 					  struct ttm_resource_manager *manager)
 {
+	BUG_ON(type >= TTM_NUM_MEM_TYPES);
 	bdev->man_drv[type] = manager;
 }
 
-- 
2.17.1

