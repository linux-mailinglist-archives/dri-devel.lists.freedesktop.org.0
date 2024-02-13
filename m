Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0669B85324E
	for <lists+dri-devel@lfdr.de>; Tue, 13 Feb 2024 14:52:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02FDA10E547;
	Tue, 13 Feb 2024 13:52:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="H7NRehpK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2083.outbound.protection.outlook.com [40.107.93.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1502410E50A;
 Tue, 13 Feb 2024 13:52:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b7GsuWZOue09rq2+bfZi6sQ8TYwpAY/2YbLUUCK6mjfJDxJumehJoNc0AvCyTio3dPbtYCaLaq/ONni8R/pyy8uRo8ygh0jKz1t2Y6ZhuOiAuRL+bU1tmu57tuMBgh61g8l8gIOuIFPagDeHi99apciJIS7nie1IOPK64msoa1TXE7GYW6kFoMszxoE/+Q/ZQHjfaR2fWuIH9P2+QQhg8KbeyNeM2wj7XNQVTLIjPxe9MsVNmMXfloyj3NgtT5xsM/krsWZj21H04nyLZO5A5mxOdbMtc2Fv4ENQ+vLSb6GeVchOCNLVj9lcKCa/SI/jwkbC0m/RaiAjN3prsMLYnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qkdu6Myyqg8Cmg4PTCDnX9YhrNcYLp3uOeKpuuacY9c=;
 b=PDkh3DRKr0zm87HRBB5KvOZcJ6cxhaq8sthf0aUDhnTCl/8duydm7wyA0CNi3KMYdU+eh3nDfEoxjN6/mbwGP+mTd2CJ4esPfNhcs6iA7K1CdTO1DwU18sdgjdPqvai2pbG70hXzGSeIsv2XFIsSlA6JlpqJZLVzZ0e0isNE73HxTLW2X7sFGzP0D70KRVLbE0L16FbxO5tm+1zB9i/ZdwybKgvtwCnAvQauDGDLtE4yCGVkVC6+JFP20POWumcGRDR526oBMIyVGUCBaW3ZdZqxTq46aJhBFY4Cp2BPFehc21wkGqpCUGvfYniurqGUMonmgqTrUSmK5d+PxAhW2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qkdu6Myyqg8Cmg4PTCDnX9YhrNcYLp3uOeKpuuacY9c=;
 b=H7NRehpK2QMevVH3yod4JheWK9cteY++5naOgSEtKTnM76NJyKlSa60JTN782MWI3B2AK1IzyUWtTblXUyz0FaS8q2BNi/CmEg+N0ZsDQevQ8rygr04xJFCGiTgnSFiz4W0G4ekgpeqPHCDxIDp2GnOsbbRyJTzSYbsixh2WQyI=
Received: from BN0PR04CA0152.namprd04.prod.outlook.com (2603:10b6:408:eb::7)
 by DM6PR12MB4894.namprd12.prod.outlook.com (2603:10b6:5:209::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.25; Tue, 13 Feb
 2024 13:52:27 +0000
Received: from BN2PEPF000044A2.namprd02.prod.outlook.com
 (2603:10b6:408:eb:cafe::98) by BN0PR04CA0152.outlook.office365.com
 (2603:10b6:408:eb::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.39 via Frontend
 Transport; Tue, 13 Feb 2024 13:52:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000044A2.mail.protection.outlook.com (10.167.243.153) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Tue, 13 Feb 2024 13:52:26 +0000
Received: from amd-X570-AORUS-ELITE.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 13 Feb 2024 07:52:23 -0600
From: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>
CC: <christian.koenig@amd.com>, <alexander.deucher@amd.com>,
 <matthew.auld@intel.com>, <mario.limonciello@amd.com>, <daniel@ffwll.ch>,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 <stable@vger.kernel.org>
Subject: [PATCH 1/2] drm/buddy: Fix alloc_range() error handling code
Date: Tue, 13 Feb 2024 19:22:02 +0530
Message-ID: <20240213135203.348050-1-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A2:EE_|DM6PR12MB4894:EE_
X-MS-Office365-Filtering-Correlation-Id: eafe824f-e4fc-4818-7cb5-08dc2c9b037d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DyqHOr59FuRgZPvbb8CHwvCdvrT4uqVQvvTfqFGkxMhXprg+7OlGUrTuVs7vzI118Kr5unSIWZOxm+soYYvFWa6p8Dn6hgsQKj7GaGcx/1PvZB45EkRbAKDseD9O8WJ1GXPzw3agm74EMFsCtSEsjVOjuGMZBZUQoGA2hnPcjEebw/iD91Xhnt62Kov/aWrTociJFFx3uVWlGDMnKsh/L//XIqlulqwfaEOBYyRhpy4e4gA/wkU8G5mmkm3jw5UzU4pQxdIzcXj81LYfVQsQtjBswSrRUXdZ2+R3ivL8Rv4IvuibDOVu+592316Ru1H9sbxgpw/JzDiLEQimE3lRIefF/5MGbxg6EnoRKUXiQtD//NBCday24ptwsUNgQ2pP4KNMNE5+/2mW6JiMmXTThAC/E0wOulZotRx5TCMV0d9s4MBVAAfUFgBVJEmrLC8tJ6dbGVxpKHr+4VAvY+R3lrVYYUR5jozh/NamCtZ2JW24jtuuY5gi4PeHrD94jxA65aFc9SKp0ksMc9RorXUH3tZZ9xHhkA261TQ+9vg+S7fDZ76DiJ/3R/eY7ceq56QF2qBz2URAfrLebkyKqt7CSQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(136003)(39860400002)(396003)(346002)(376002)(230922051799003)(1800799012)(64100799003)(451199024)(186009)(82310400011)(46966006)(40470700004)(36840700001)(8936002)(8676002)(5660300002)(70206006)(70586007)(2906002)(4326008)(16526019)(36756003)(81166007)(356005)(82740400003)(86362001)(83380400001)(110136005)(478600001)(316002)(7696005)(54906003)(6666004)(966005)(1076003)(26005)(426003)(41300700001)(336012)(2616005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2024 13:52:26.9407 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eafe824f-e4fc-4818-7cb5-08dc2c9b037d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000044A2.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4894
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

Few users have observed display corruption when they boot
the machine to KDE Plasma or playing games. We have root
caused the problem that whenever alloc_range() couldn't
find the required memory blocks the function was returning
SUCCESS in some of the corner cases.

The right approach would be if the total allocated size
is less than the required size, the function should
return -ENOSPC.

Cc: <stable@vger.kernel.org> # 6.7+
Fixes: 0a1844bf0b53 ("drm/buddy: Improve contiguous memory allocation")
Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/3097
Tested-by: Mario Limonciello <mario.limonciello@amd.com>
Link: https://patchwork.kernel.org/project/dri-devel/patch/20240207174456.341121-1-Arunpravin.PaneerSelvam@amd.com/
Acked-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
---
 drivers/gpu/drm/drm_buddy.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
index f57e6d74fb0e..c1a99bf4dffd 100644
--- a/drivers/gpu/drm/drm_buddy.c
+++ b/drivers/gpu/drm/drm_buddy.c
@@ -539,6 +539,12 @@ static int __alloc_range(struct drm_buddy *mm,
 	} while (1);
 
 	list_splice_tail(&allocated, blocks);
+
+	if (total_allocated < size) {
+		err = -ENOSPC;
+		goto err_free;
+	}
+
 	return 0;
 
 err_undo:

base-commit: 2c80a2b715df75881359d07dbaacff8ad411f40e
-- 
2.25.1

