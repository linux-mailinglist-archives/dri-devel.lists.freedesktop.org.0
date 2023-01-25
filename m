Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD7D67AF1E
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 11:01:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 538D910E760;
	Wed, 25 Jan 2023 10:01:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2080.outbound.protection.outlook.com [40.107.94.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE04410E760;
 Wed, 25 Jan 2023 10:01:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C+W8wXfRfGFK/dul2NB8XVVmCo57KwwbsouPg175rEYr23Dwxn/nUs7XNceCnSsTOYD2zzAbSUEP/rSAmCbqBL+1rRcCCyg1ULv9pemREAKul9In8pExnjhwd7M+E5n8mDHbDdebXVpzj0219uMqaa9cP7IrXn19ZcrEv789cL4uTjByN+CaNpZUojd4kh/X7jblvKuJn11jwMeXYVfvxBXpRlpz7krbKceUaGS8brMXnbJNf+MKXgpBlZyg9N6SNGKZvJqkzVNnyyICUa6ZcbXUIr1t1oWB4xLHjjFnqkeWeF/YJMz9+yqaxwA/jHegVoCWJbGE4QehZuyC9lj3OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7r3JfSAfhnn3KRCPJFXp1OeRcIc18o5+h8G6Bv4ocCQ=;
 b=Y8S0sJpzpNZiUVX2qYlNXsVeRdnSO3SmR/Np7zffZ6kcGBxhMEcki5upHOVwCYP5jC8sRZ8vDAp6TUYI/Qnx1ZewgFb1Ijv5M1rJI/N9Mp7FaVC8g3jfx6f580ozX4eX6EDKog2GbS3B05jt7eLZBNimgXMbY2VvlgqFrVN4zHO4c1Cyv/gaU3I3kIbVf04OZNGWxPjZx4Fq8VWDRn+/Kdd1AAy//yM5km6a7Kh24oEVjFKv3R3RZjJUittyEwXUbHgRlOIFqDZ9DjksgS34JdA1efk6x7zhcIOwiqYcaLf4FfyrdgELHoUNMmnoTLw4V94J/HAZS11izUrYjOFGHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7r3JfSAfhnn3KRCPJFXp1OeRcIc18o5+h8G6Bv4ocCQ=;
 b=Gxh3usbTys7USM8GNCUbgt25318pDWhYYEwn/3TOjC//DsuqNqtT6w3W9vM8bQuBXTzoJuP3zeiOuXFrhVIjBL8C5sNzakcCd0ok+NaMJjupRMtpkUmgt4PMEog+zAYD/FQqW+iX4wNasNzYUpm17JncbIBBOJjBnUMsigARdUE=
Received: from MW4PR03CA0132.namprd03.prod.outlook.com (2603:10b6:303:8c::17)
 by SJ0PR12MB6903.namprd12.prod.outlook.com (2603:10b6:a03:485::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Wed, 25 Jan
 2023 10:01:11 +0000
Received: from CO1NAM11FT029.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8c:cafe::e7) by MW4PR03CA0132.outlook.office365.com
 (2603:10b6:303:8c::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.21 via Frontend
 Transport; Wed, 25 Jan 2023 10:01:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT029.mail.protection.outlook.com (10.13.174.214) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6023.16 via Frontend Transport; Wed, 25 Jan 2023 10:01:10 +0000
Received: from amar-X570-AORUS-ELITE.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Wed, 25 Jan 2023 04:01:07 -0600
From: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <nouveau@lists.freedesktop.org>
Subject: [PATCH 1/4] drm/amdgpu: Movie the amdgpu_gtt_mgr start and size from
 pages to bytes
Date: Wed, 25 Jan 2023 15:30:23 +0530
Message-ID: <20230125100026.5086-1-Amaranath.Somalapuram@amd.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT029:EE_|SJ0PR12MB6903:EE_
X-MS-Office365-Filtering-Correlation-Id: 0abe643d-87e0-4692-9d54-08dafebb1623
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zMWdEmQKO5J3wDLRKstZS3+6QfX+snH95UoAUD2ugRo7YjL7BRWth18pcaqSu4OTyH0a+LMCHyO/R3WTajkHepv3ssB7ogfIdXEZsW4wuWQVgV9x2CrU7GjhgfU/BTBKzUqlkJz8mjWwVWTLOycE1q4TwbM1kEivkYBUwaTlR7qLh2EUoOw8BcEMqR76K64IbIUOpIEMd2Z6C4NpdWiBfgX/y3Jndv/Ea63sjnG9cXNAzQJ/MZDRl4fEmk8O6CWEvj8blRfo9+zz9Lpcu0K1HPqpsZW2YCRQkMDK56O/WK2zOgGalf9+ZhW0PEIZvH4p4lVkiEXzu2hZtMXH4kSn2hCd8YvzRr43FJ7rzUT1E5K2lqAdj04ak1TpfAhpHSSby5zGPKK+2ZTLmLvP+0yVtTCAf+05T5ZlikLS7vBvcRmdQM22UAIUjahPQ4yBYvucq2W8YMC9wQpqfKIjOMV/zIu/89DWZOCGtPmnb1JZtL3KCMeDgVI1nsxM7c3F84QOkhTXJnDgRBOV/mJ/Kcxuzslxi16OsRqB6Z2sOvqrhMNGIPQiO90nlWYo/x/+fu3qWkPrQ4sLc2jfjEzf7PXl5Df0p1dBHev8nwxgSIf9Nl3sh64U0BeZr2/mjDmFFf1cRH8mIRoPAcqyyhNzQViNCQ99OVUBXmZ5cnb4kZZI7Qbjz6XhrBTUKALd0CFKdwP1yvRfXoqlHyW03IbouoiyzJoLsr6arQli1cAEypPLvyE=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(39860400002)(136003)(346002)(396003)(451199018)(46966006)(36840700001)(40470700004)(36860700001)(83380400001)(426003)(336012)(54906003)(47076005)(2616005)(478600001)(8676002)(186003)(450100002)(36756003)(1076003)(70206006)(70586007)(110136005)(7696005)(356005)(2906002)(86362001)(82740400003)(41300700001)(26005)(81166007)(5660300002)(16526019)(316002)(40480700001)(40460700003)(6666004)(4326008)(82310400005)(8936002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2023 10:01:10.8556 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0abe643d-87e0-4692-9d54-08dafebb1623
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT029.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6903
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

To support GTT manager amdgpu_res_first, amdgpu_res_next
from pages to bytes and clean up PAGE_SHIFT operation.

Signed-off-by: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h
index 5c4f93ee0c57..5c78f0b09351 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h
@@ -94,8 +94,8 @@ static inline void amdgpu_res_first(struct ttm_resource *res,
 		while (start >= node->size << PAGE_SHIFT)
 			start -= node++->size << PAGE_SHIFT;
 
-		cur->start = (node->start << PAGE_SHIFT) + start;
-		cur->size = min((node->size << PAGE_SHIFT) - start, size);
+		cur->start = node->start + start;
+		cur->size = min(node->size - start, size);
 		cur->remaining = size;
 		cur->node = node;
 		break;
@@ -155,8 +155,8 @@ static inline void amdgpu_res_next(struct amdgpu_res_cursor *cur, uint64_t size)
 		node = cur->node;
 
 		cur->node = ++node;
-		cur->start = node->start << PAGE_SHIFT;
-		cur->size = min(node->size << PAGE_SHIFT, cur->remaining);
+		cur->start = node->start;
+		cur->size = min(node->size, cur->remaining);
 		break;
 	default:
 		return;
-- 
2.32.0

