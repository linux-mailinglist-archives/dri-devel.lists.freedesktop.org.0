Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D301639245B
	for <lists+dri-devel@lfdr.de>; Thu, 27 May 2021 03:31:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02DE26E8AF;
	Thu, 27 May 2021 01:31:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2058.outbound.protection.outlook.com [40.107.101.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 476516E8AD;
 Thu, 27 May 2021 01:31:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ehY+WPtvqk+Qb3SL67Jsof91p+BR/UUhwaJOC0gf1OH0p7FrWH8vJHq/Doy0jWjWAXI/1KdIXtf3dlL6GS7rAUw1u3TrtgnvzulDdW583ixvXN7E+PjYw0PSvBFnsfEChfH+N31yYzeMafN/TXt3RA6MZeZwJ7R+Law2WZ1NpW/LpmmZo0hWHu1LBCfu2q02jQoaVgtGanKxjIcbK5kNCbcFnFMUE0djEP1sqlCUErp1ncTarZSX6gYfOZmDUpd43Db8oqCGUxDBTANbMBUxjzRuq/uI5vYRX/Cc8rPkeRX9BXVKc1svafzGpbGwBmcJNKU7wBkL9JE+GVif3i+aIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ixZp1EWtKYKOu8KEhIvJmMaz4Fvzf86SAPrzGJYfyjw=;
 b=gy0W/M09H0mM2k0NWIoxQ07LWdgY+ia/42bxejJ+FMnbQGzLbT6IxX5iaxsq209wz41gOxpMvjB4n0QOdGh+nqLvv7sGUmM5F69eD7wl+u1JHGHJqLC2Eq16r2cDIfhdgwMmuVXJkgBqdhwFH14sfPu+9ziAECcHb4xMzDw8koSpubGMrWDd1XrruAng+jTm5ZPnJM2ZgyI0+Sso7R0Dg1dcnW/O2SAGh/b6GOCEZkw7P/kvlHWhYsvRXqZSAhzbcaGM8jreAnv3my8AdJRsWQ8z3pYOFUpUiTAxG8bpCIFxs0efDgP5f6hOusXuIscqgCNvif+xL6pDomCJEisI6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=none sp=none pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ixZp1EWtKYKOu8KEhIvJmMaz4Fvzf86SAPrzGJYfyjw=;
 b=1eoovKbBuFrMl5oX+ivRI6fv8CWaccz78GJZMBpTO1obAf4Krf5rMJK3wtvfMr+ccVQJ82/3Urj7WOFqcdi1dG0b245jwO6XuDAuhNlJKyTOWZUeI2D2bI8YI3oiYKy0tUTOso/hyW8sjSr0U3a1LhISCJH7AHuDuUBBjvIjxRw=
Received: from MWHPR21CA0062.namprd21.prod.outlook.com (2603:10b6:300:db::24)
 by DM5PR12MB1339.namprd12.prod.outlook.com (2603:10b6:3:70::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.23; Thu, 27 May
 2021 01:31:13 +0000
Received: from CO1NAM11FT045.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:db:cafe::94) by MWHPR21CA0062.outlook.office365.com
 (2603:10b6:300:db::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.2 via Frontend
 Transport; Thu, 27 May 2021 01:31:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT045.mail.protection.outlook.com (10.13.175.181) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4129.25 via Frontend Transport; Thu, 27 May 2021 01:31:13 +0000
Received: from lang-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Wed, 26 May
 2021 20:31:10 -0500
From: Lang Yu <Lang.Yu@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 1/2] drm/ttm: cleanup and add TTM_PL_FLAG_TEMPORARY
Date: Thu, 27 May 2021 09:30:50 +0800
Message-ID: <20210527013051.4302-1-Lang.Yu@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 794f0694-86f3-42ac-d367-08d920af1d48
X-MS-TrafficTypeDiagnostic: DM5PR12MB1339:
X-Microsoft-Antispam-PRVS: <DM5PR12MB13396DEE61AC5AFBC8C2951BFB239@DM5PR12MB1339.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1xdA1SUr6hWA69kxihoJb0RMnINRoYI4+y3HX4tDHBdq/CgkLGMbThHU1jw/H14Pmz4X6/mxZUcP/ocZctpeI/K7nn8A6udjOhcm4mLbzp5YnDRJolbRrhu/Afoalr/zoqUrp9l99yETUaINVwdvx6gEtM71C4Z4pZDPgT6TKUNOaffEJBAx+gXoYQrlSy6rjKHjZwho2QoRRP9XMO8xCVy+9Uj7Ut54n9c5f4HgxuhwhiKdnyHFxBE4m07hzqwbcefUxS09TNrQjH3Wo79yO4Wo8l2aBAkN8MbsxaxGDMIvyuO9X3mWyqBWFr3Vyw3t0HvGAAAQtd3VfMWNL2DwaTRrrIjgvgmt0sC4mF6sVJJRabvEkOTj9Qd1TuXTEK0pmwSXFVX00lQy3JIh+iFsMborEK2ZcSiC8sWlyjLc46nZrK06Bc4sOfeEQXPb5+AuRnW6s1YxUv+GPmNGkLaOX3uWFPiQP/7WQyS70OdkmlmabxV/SIDyXjTGp3TOJYdOMKFATNNqZzwca//yeJ2nWmVASg229Xeos+pEal7Mp1mC+8E3mkehx950S2cYqsXwbiV5/EHe4FF1UfTJ8oPNpDqifCVyIbGT3xHMSh20WAElX1lZqeYQO6ahlQOcF1vs/U2jyEkrXb9TDbB2FpXDhOn35GsRlLS72j/rPSXZpuBhpUoEbQkgaTRdrLeXk6AD
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(396003)(346002)(39860400002)(136003)(376002)(46966006)(36840700001)(47076005)(356005)(5660300002)(110136005)(4744005)(8936002)(426003)(2906002)(478600001)(316002)(81166007)(4326008)(2616005)(36860700001)(336012)(54906003)(450100002)(186003)(82740400003)(86362001)(16526019)(7696005)(8676002)(26005)(70586007)(36756003)(70206006)(82310400003)(83380400001)(1076003)(6666004)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2021 01:31:13.0774 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 794f0694-86f3-42ac-d367-08d920af1d48
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT045.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1339
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Huang Rui <ray.huang@amd.com>,
 Lang Yu <Lang.Yu@amd.com>, Christian Koenig <Christian.Koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Make TTM_PL_FLAG_* start from zero and add
TTM_PL_FLAG_TEMPORARY flag for temporary
GTT allocation use.

Signed-off-by: Lang Yu <Lang.Yu@amd.com>
---
 include/drm/ttm/ttm_placement.h | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/include/drm/ttm/ttm_placement.h b/include/drm/ttm/ttm_placement.h
index aa6ba4d0cf78..9f5cfc7c2d5a 100644
--- a/include/drm/ttm/ttm_placement.h
+++ b/include/drm/ttm/ttm_placement.h
@@ -47,8 +47,9 @@
  * top of the memory area, instead of the bottom.
  */
 
-#define TTM_PL_FLAG_CONTIGUOUS  (1 << 19)
-#define TTM_PL_FLAG_TOPDOWN     (1 << 22)
+#define TTM_PL_FLAG_CONTIGUOUS  (1 << 0)
+#define TTM_PL_FLAG_TOPDOWN     (1 << 1)
+#define TTM_PL_FLAG_TEMPORARY   (1 << 2)
 
 /**
  * struct ttm_place
-- 
2.25.1

