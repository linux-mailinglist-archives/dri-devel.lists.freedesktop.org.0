Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C7588BCF33
	for <lists+dri-devel@lfdr.de>; Mon,  6 May 2024 15:39:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 508C010F07D;
	Mon,  6 May 2024 13:39:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="p8sgNmwX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2064.outbound.protection.outlook.com [40.107.237.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C5DF10F482;
 Mon,  6 May 2024 13:39:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fg8Hy26+hnt9rIyMyOoQOPMbd/cQevIqUpPn+xIFjAhLWjgEZ1McvtIPGCwYD00OsebyRBeM49KPkQgf7W0+80RXABDzJHZlxrLlOwuqmbYe9aWr2LE4n9umPNUHa7XoB9EJeAKSe6qK2Asxe1rKgLxUeC2+JECEzf4v28Dk4e3sWM7e2ed5je5wXMVADA4TZxby6dmjZ25YyAoGuLIGK5qIC29hgVvjhCr+U7kGL5dOJXhx5pYFC5fONCtpOhYfcTbjp70Li0TBt20HwdHQFBaWi83pQnXpVXyNYeIfsQS4xHe+LL8SJKrWm1hJQPUDK9UZTLaxOoacOmlVdp8Jig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wTpgg98Nt1ts44tywCNsjlPNRBlZZ1gySHOz/vS4eOM=;
 b=Q8QMVP+AXUDZ0qYju7RAqJnIvnlSrH4sRLdc8TvW6oleTTl/mC6xtPBU6Y35c/0GqvWVEEzAe3u4Zm6W19KVz7yG++vqOFNCbedGmBKgz9xlJCiTRjzeJJeJvGe/qXsaLWjWw0+d/CGWg476jNiKO8uiOSWzSSnYJX3BoQdtPVcUCyhgdiSwchELZ2v4npFR634ETSVyx8XivUZweCxckTXbqsR/LexgTChPPluRUVjmqDsEX5khiXH3c2uE8JtvFIMHQj92C2YyxBdXZH5WA+06scFTG/SrN+rrNwL3y4w+kQSDeu0RVnc0mkIiw/yizhSQg93pSWPU4bzNpHOjhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wTpgg98Nt1ts44tywCNsjlPNRBlZZ1gySHOz/vS4eOM=;
 b=p8sgNmwX2Qdk9vTWVX0xiIbGUfSh9d3wJErUm0m4nAHhsiDBq/1Qms37SMnVUu0cgSxQZHUhrZI7aPXeI+DYwIaVMFzqmw7qMWnlw9H+gs5cJC5OifI1ln7AFqeC5xpnb3yrqINOUS5Uyb7HiGU3zLo4tsVWJ1C4FARhZBRFaeg=
Received: from DS7PR05CA0066.namprd05.prod.outlook.com (2603:10b6:8:57::11) by
 DS0PR12MB8479.namprd12.prod.outlook.com (2603:10b6:8:155::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7544.41; Mon, 6 May 2024 13:39:13 +0000
Received: from DS2PEPF0000343A.namprd02.prod.outlook.com
 (2603:10b6:8:57:cafe::c7) by DS7PR05CA0066.outlook.office365.com
 (2603:10b6:8:57::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.42 via Frontend
 Transport; Mon, 6 May 2024 13:39:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF0000343A.mail.protection.outlook.com (10.167.18.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7544.18 via Frontend Transport; Mon, 6 May 2024 13:39:13 +0000
Received: from amd-X570-AORUS-ELITE.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 6 May 2024 08:39:11 -0500
From: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <matthew.auld@intel.com>
CC: <christian.koenig@amd.com>, <alexander.deucher@amd.com>, "Arunpravin
 Paneer Selvam" <Arunpravin.PaneerSelvam@amd.com>
Subject: [PATCH] drm/buddy: Fix the range bias clear memory allocation issue
Date: Mon, 6 May 2024 19:08:46 +0530
Message-ID: <20240506133846.4362-1-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343A:EE_|DS0PR12MB8479:EE_
X-MS-Office365-Filtering-Correlation-Id: ee81444d-3b73-4148-a96e-08dc6dd1eae5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|82310400017|36860700004|1800799015|376005; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?UM1guD8A3g03oPOz44F2al8QkCRswXRRrNiLGdZJyNzDhJ3lryjL9eCvpGrZ?=
 =?us-ascii?Q?smvkIWlNeS+1eQx5Y3zHkjnNJUhA1LzhItiluVXUeC1ayH0illpiojyQikR+?=
 =?us-ascii?Q?002rCP37tWVzc1tZaGwQ4ajIF0klvj1oiWxFZ/6H+JIlUt7kQiBdSppDXIZb?=
 =?us-ascii?Q?OhszL20XU7UrzJOKi7SdKN9wik/VcsXe1oTyhnLaWVJsYhle2PbW4yw+Df5m?=
 =?us-ascii?Q?BnO9un5Ak+LJmeU9rRTN79i4dij7dIKOPGay8bOEFWPUOKVd2pslpGJILBB0?=
 =?us-ascii?Q?qmlWOk4K2SUrGjeDioPklJ6Z5bZ85il2DOSOlkKGfhmnVLSCDPf9+P8M6v/s?=
 =?us-ascii?Q?hb6Cyb0lrxBmPovYn+J+PtS2d0aRINCVI8N9ptZunViwQD57unDhxJ+R2pkq?=
 =?us-ascii?Q?F9qEQo/YwolBFQIjftOZvy96ttUHEsu/6uXJSeQ+xJeXCXJXMYE7H0/IJti4?=
 =?us-ascii?Q?UjRfEmS6687F5KKV/r0hH3c4Lh7tiFdCyNhfMgHVPFG24K2O+oJPrCtt+TD3?=
 =?us-ascii?Q?Z6d8zDZMuF2lM5PIkaKCJL/vnoLXARyE4Tsr9GdawRYi8aawx/F8gVvhBwwv?=
 =?us-ascii?Q?Caountb+8LCn/amDWCSZ7D9CjZO6w0T4Z2giKprRpciqJOovF8hEj9BLupSb?=
 =?us-ascii?Q?VcRKh8vcYp1MKlxUhzgK/3mWkUsV7Me4jkNn0q7a73gU8eoHoGVWCbYSqiFc?=
 =?us-ascii?Q?jozbA3aLygGsW89WKAupGcUisVe8mLqX2+Pov51LK9gUGjxzV7p/8yRkgmMq?=
 =?us-ascii?Q?BA9rILcTzanijPFF4x+XPMij+iw2b6SNHcAXj96tgDBqZkmpe14MW6MXqP8G?=
 =?us-ascii?Q?C7ho8i1wR+xMeNN1WFn01QBWtNqgBzeRmqHAVycSBkyyuIidEG+xA8JHsK7G?=
 =?us-ascii?Q?0RXsB5G7bfBErsi4nbYcAmszkqeP8cNbVoapotSIIdR7aZkl9w421FD/s8YL?=
 =?us-ascii?Q?AU05l7i08YnU7QQQ4P+/ojjLv8A427foNAo6yiNIbmqMFhqo3DhIMRn+roSf?=
 =?us-ascii?Q?SoAc1Ko0jb7gAkZmCcvoy4tjEj2PKu3PMjrQX1kbIEXEjbaFMZn6qE34ZLTX?=
 =?us-ascii?Q?XT0IEc1uLMOhO+BOinSyIs8Nvz4lxQi6998htiUrdE8Ig0aS+xaetpnbyG5C?=
 =?us-ascii?Q?whxf9sFG50I29Z4h9ADx5dAYfL8GdSpUeXTQ1ReF5Kvtm11DWVwKOs8jQs/2?=
 =?us-ascii?Q?rdwyLrdYjQKyPJWeriQGVoBNTo7tikW54jTb01scr1xL3Q9uNDULDif7/8rM?=
 =?us-ascii?Q?sdRGHzIhyDIv8tQypxA2wjAkKxPCgoRYm5s+n8j5hm22JQDBz1SFStisNecB?=
 =?us-ascii?Q?KUQnfBS/qGaJIx06dmd2HMKut/4x653YrUuAyhUMiPoztfa89QBgVjpu/Ld2?=
 =?us-ascii?Q?MVP4J6rXfBBwP4xi6ZlzvOdLBy88?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(82310400017)(36860700004)(1800799015)(376005); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2024 13:39:13.5498 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ee81444d-3b73-4148-a96e-08dc6dd1eae5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8479
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

Problem statement: During the system boot time, an application request
for the bulk volume of cleared range bias memory when the clear_avail
is zero, we dont fallback into normal allocation method as we had an
unnecessary clear_avail check which prevents the fallback method leads
to fb allocation failure following system goes into unresponsive state.

Solution: Remove the unnecessary clear_avail check in the range bias
allocation function.

Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Fixes: 96950929eb23 ("drm/buddy: Implement tracking clear page feature")
---
 drivers/gpu/drm/drm_buddy.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
index 284ebae71cc4..831929ac95eb 100644
--- a/drivers/gpu/drm/drm_buddy.c
+++ b/drivers/gpu/drm/drm_buddy.c
@@ -574,7 +574,7 @@ __drm_buddy_alloc_range_bias(struct drm_buddy *mm,
 
 	block = __alloc_range_bias(mm, start, end, order,
 				   flags, fallback);
-	if (IS_ERR(block) && mm->clear_avail)
+	if (IS_ERR(block))
 		return __alloc_range_bias(mm, start, end, order,
 					  flags, !fallback);
 
-- 
2.25.1

