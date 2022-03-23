Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B290C4E4D65
	for <lists+dri-devel@lfdr.de>; Wed, 23 Mar 2022 08:34:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E929010E5DB;
	Wed, 23 Mar 2022 07:34:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2073.outbound.protection.outlook.com [40.107.92.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FCD610E5D9;
 Wed, 23 Mar 2022 07:34:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=doB2rn4hcJ0DSYCkFNbVKKx7PYd4sphP+xRtakfn0e5dEzFHwVmxEBAhacaM5DGZ6/cx9vavmH2Lh5Zp32ZPvbcJY07VZb8W2Zb4QYi/b6A5lefotSXPeH7Ll/61NYmghmUi10rYc060c0huy2qY7NmmPv9rg5R4k/73WETvAKy7sZSRkwl+AgRz1ravBIKzReSIZ7pCuq9naVmZGKGdEh2TgiYPQ/TnCXBmiwqkLVKxDvnpgWHEul0M+6AurgZExe8XIg+YQXFutYkZASfYb0ycmOUXBCOmszybv5NFEUkVm5Tkl+vRN/tMDGmfzIm/mHvptqSZ8euSDuakvQGNDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hm6WZ2/paKoxVrsr5w/B2sQLiLicpaO+6IWb99ZZXjU=;
 b=Z/HSOAmvW0IwYnyopxIKY9w3ZnJ5bcElR/GkONmk3OZ22WioQfNRc7gVt9faOX0GU0fjQsk9Wlg2IRsAY3L3/wxWiJo1EXLwdYNekg+KQJqiE9hnWNQT+Sgug6M+qvTLvbwmWVS6xV7+knmAYC5CIRh8FH/L5m/AYvpY/2sFDesq0uYVIDiIvJvNvtMgnoVpsPfj3LrVp8AWieKzl9qDJkeOzbF9TLhMIA6QdEvG4gqJjkoHAfbMEeMGBInw0LErUgAQWsGTBOae0djBSC0EUyjLyi3FX6v4nqbS4QinX7QkEPuWk4X2fP+B0RGrTvDkHOrjKzcOGWhyeJcf5jPypA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hm6WZ2/paKoxVrsr5w/B2sQLiLicpaO+6IWb99ZZXjU=;
 b=j3cvNv9/BLoU0uLzeuz8+Eg3h0xwuDbETYa4zQKkEG66Ek58ny+zZ8Uy6dSv9WCidbXdLkriAt9HK9zY/v/5wMF8jro8mFe401fuOSu7lN0vOtnRWhsd5fRlfbgnyjj8GJmHqNgq6fQA11uBi/2WWlEy32TMsEcBqF0N52bao9M=
Received: from DM5PR22CA0012.namprd22.prod.outlook.com (2603:10b6:3:101::22)
 by BN6PR1201MB0114.namprd12.prod.outlook.com (2603:10b6:405:4d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.16; Wed, 23 Mar
 2022 07:34:46 +0000
Received: from DM6NAM11FT051.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:101:cafe::86) by DM5PR22CA0012.outlook.office365.com
 (2603:10b6:3:101::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.17 via Frontend
 Transport; Wed, 23 Mar 2022 07:34:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT051.mail.protection.outlook.com (10.13.172.243) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5102.17 via Frontend Transport; Wed, 23 Mar 2022 07:34:46 +0000
Received: from rtg-amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 23 Mar
 2022 02:34:41 -0500
From: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
To: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v2] drm: add a check to verify the size alignment
Date: Wed, 23 Mar 2022 13:04:26 +0530
Message-ID: <20220323073426.228866-1-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a36283ef-3aa6-4565-5fc3-08da0c9f9ac3
X-MS-TrafficTypeDiagnostic: BN6PR1201MB0114:EE_
X-Microsoft-Antispam-PRVS: <BN6PR1201MB011429C7D55B4210A02FF67DE4189@BN6PR1201MB0114.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oSCwdDVjXR8FGTeSME0++zvx+QRnrgCt3aNEMuE5nHG3H7VAOSr9UagEzUlK+MJUq5lc0jayvfXWfA4d07trzvJFTuV/GdXqmmsMJklDnLK761sfdPUOHhi1peeUniK29Gk31Fe7e05PBJ0L5p54VJGhC3pqVJYYiwqGHeeCmJwO9aCWZZt9Ligji9bu9LMSqK3V8Cj5MVDcj2tQiJx4in7fyxCwcn/DFGmTe+b2hOQ+e6/ZYfvH3rDDpZK/WMBWUJP0A2xHEyiekmm5wD/5rdlF4hKueJnGe+Kjtl33tnx8BEjElo93ayQHTtNocCxNOuXI9b0s3MOy1Cy2Wmvkvq0UKBGNRCSbn0vSjSnqAJXgJtk9PaqxjX6CSwPlPf/O+TiLQpImQLyBNm+UsEzK7wKdXzVRL5osqO8IV/53COkIlXxuo6lFvqiQiw22s/qv2Zb/RDI2UbYa1EWTvxnwDKdA5oqe8/xtC0wCAJXMpc+ZF3ypiCz7T7IqUm6vVoVS0YScP5eSsMw19rNatpxiZzgEegKylJ3Wr5mK2qnV+wmMRzvNPMy2wuCZVjWYbfKkgh0i8Ls5XlFxInzkqfc/Sd+LjrtycKD+tvTboPpA0a5kewsLzgyGPgcUsTagrvR90YQooj0otay2LBDtSr4hli9sWE7egtxyowQkjS1pJic3pXz83I2U9Ffn9qFQIwBcM+fE9nG8igwlU9zvF6/H5w==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(508600001)(83380400001)(4326008)(110136005)(426003)(82310400004)(70206006)(70586007)(8676002)(2906002)(26005)(186003)(86362001)(2616005)(16526019)(7696005)(1076003)(40460700003)(336012)(5660300002)(8936002)(6666004)(54906003)(36860700001)(36756003)(316002)(81166007)(356005)(47076005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2022 07:34:46.1081 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a36283ef-3aa6-4565-5fc3-08da0c9f9ac3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT051.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1201MB0114
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
Cc: pmenzel@molgen.mpg.de, Arunpravin Paneer
 Selvam <Arunpravin.PaneerSelvam@amd.com>, matthew.auld@intel.com,
 alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a simple check to reject any size not aligned to the
min_page_size.

handle instances when size is not aligned with the min_page_size.
Unigine Heaven has allocation requests for example required pages
are 257 and alignment request is 256. To allocate the left over 1
page, continues the iteration to find the order value which is 0
and when it compares with min_order = 8, triggers the BUG_ON(order
< min_order). To avoid this problem, we added a simple check to
return -EINVAL if size is not aligned to the min_page_size.

v2: Added more details to the commit description

Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Suggested-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/drm_buddy.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
index 72f52f293249..b503c88786b0 100644
--- a/drivers/gpu/drm/drm_buddy.c
+++ b/drivers/gpu/drm/drm_buddy.c
@@ -661,6 +661,9 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
 	if (range_overflows(start, size, mm->size))
 		return -EINVAL;
 
+	if (WARN_ON(!IS_ALIGNED(size, min_page_size)))
+		return -EINVAL;
+
 	/* Actual range allocation */
 	if (start + size == end)
 		return __drm_buddy_alloc_range(mm, start, size, blocks);

base-commit: 056d47eaf6ea753fa2e21da31f9cbd8b721bbb7b
-- 
2.25.1

