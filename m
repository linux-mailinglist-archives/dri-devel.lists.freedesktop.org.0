Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3E1F9FC954
	for <lists+dri-devel@lfdr.de>; Thu, 26 Dec 2024 08:02:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A0CD10E771;
	Thu, 26 Dec 2024 07:02:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="IURBx7Lt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2068.outbound.protection.outlook.com [40.107.243.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26C9010E771;
 Thu, 26 Dec 2024 07:02:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IGG8Z3cMaLRpgJ5uC+vMfmz6vSTjo9yzv+gzy5PzfaPSGtLoh/DFS+PRkyQ6+inIrU1N5P+nAzzuZrR9fiGZBrBKksQ2XxxePqt4AedVD298K8qw71LWGNzitzc/tKJbEMPM2B8q4gWc+UAGe2IfV4KORMdCpyl+LTsYvWCNMz1QZfxwMHnFaNb94gJaePEXfTZaaNSzG9y0ouq4FCt2ki/UhVVGUOZGBKGe8R+LGFhjubC/l834TMAhjKcsesT9Yefvr/L6PW5dGT2jsPFnOx8qFhikRXkAkIaRbpk/iP4GLbXHPrhMFGc8gK7EBV6bHXyjoHhJ1SSKPTX5eudkZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aWth6srRmDegIkzsqY1k48tkqENt/uY5OTE0Gdjqxgw=;
 b=Kgriu1BGqidnStg1hQqZ1ATB5+uRyWC2mKMzK+2h8A4tcZ1dH32oThj3FJtjmcOT7WywhCNhnx4UIAPyBTMC7jF4pwnNZ7h3OKOkAnrpmPgFMIlX8F1AiPr+R8fngXoE2KJw8+18VNZEoRaMvbjcc3fGaoT0CIDBQzVAdmd7BTS+OgE/OsXsLyOZntZviqjBRL36/14SnGJymVzQPG6qt2vVWs5O5lKAUJ0oesoQXQKnPHP/dKbi3razl7NPhNgixaIhGfiViS2SKPI50MdmHS9uJKvQ5Cv89V995VeZDNFUYARVpaBeAHFrlN/Z0P9rOD4XSRXx1C+7Z+Sy+FRtAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aWth6srRmDegIkzsqY1k48tkqENt/uY5OTE0Gdjqxgw=;
 b=IURBx7LtAkEfzokQafAaHL94H1HSgiEY3wqkukZphrAH8QkwZBkudeMRzHsm1PRVLEDNjidvMNazd1p1gU19D7VUHHT41KGlCC373CrHhyw+efVTqWpKiEUr/eLdgn0h58R65F/4nOhWJH9vrCWHYALyaEA0zJ1z0+Ex7ULNDqU=
Received: from SN7PR04CA0040.namprd04.prod.outlook.com (2603:10b6:806:120::15)
 by IA1PR12MB7493.namprd12.prod.outlook.com (2603:10b6:208:41b::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.14; Thu, 26 Dec
 2024 07:01:38 +0000
Received: from SN1PEPF00036F3D.namprd05.prod.outlook.com
 (2603:10b6:806:120:cafe::c5) by SN7PR04CA0040.outlook.office365.com
 (2603:10b6:806:120::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8293.14 via Frontend Transport; Thu,
 26 Dec 2024 07:01:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF00036F3D.mail.protection.outlook.com (10.167.248.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8293.12 via Frontend Transport; Thu, 26 Dec 2024 07:01:38 +0000
Received: from amd-X570-AORUS-ELITE.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 26 Dec 2024 01:01:35 -0600
From: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <matthew.auld@intel.com>
CC: <christian.koenig@amd.com>, <alexander.deucher@amd.com>, "Arunpravin
 Paneer Selvam" <Arunpravin.PaneerSelvam@amd.com>, "Lin . Cao"
 <lincao12@amd.com>
Subject: [PATCH v2 1/2] drm/buddy: fix issue that force_merge cannot free all
 roots
Date: Thu, 26 Dec 2024 12:31:15 +0530
Message-ID: <20241226070116.309290-1-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3D:EE_|IA1PR12MB7493:EE_
X-MS-Office365-Filtering-Correlation-Id: 5da3bf37-4193-4587-0034-08dd257b24c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|36860700013|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?VcOyDNaseH84L46RTa+dQuxAnGMTi/Do3nNjgDiOn7/0MdeWjvQbpLewqzOG?=
 =?us-ascii?Q?MIJBsbiQ0u2PGgp6SZTbtDRlzTE8faRYUuQkN4MYdWmClmKRI52f5FP71+jv?=
 =?us-ascii?Q?vTN84t5PFIiqKt7SwontNXHSokETwGk72MiCpwGVs07MffeDWZMPLGdqsjgH?=
 =?us-ascii?Q?We0Qr1E1+r70WA+2l/WHxOz2fxd8WoVbGAtP3M+yVbe7ePxJqoIB/QH5qvnA?=
 =?us-ascii?Q?6uuWjhSBN9X7aEPEgcFCodqeNixAlNKJxV16Kuwx9v6la9CjOa8a0BZWNOg9?=
 =?us-ascii?Q?7/DLqMUQpU0oeqsomdGaQGQNxJayMcV8zi0LSfa7wXIxCGf74vLBaAzbape2?=
 =?us-ascii?Q?YnG1AUSL2G/9gpEIsRAPrNaP7p17A6Xtp9ah6NfCSfydKm4pa/NesN+agqvq?=
 =?us-ascii?Q?2WQO8QyR65NiiWOcOnNlWBK1Zfxs2gstUbDsbh8Ooulcbr+mhpBgSaMr4kFw?=
 =?us-ascii?Q?bBfcPdz221FCXec3Ot2GC/zi6IFMx/Hlirg0/r5bqgBYSXXvMJelZ6naK7AY?=
 =?us-ascii?Q?Dwoie0n20H6c3CMVKAD0vk70/Me5rszI9KDil5aF37hzhCKmkwEDyfZWEE2H?=
 =?us-ascii?Q?E+2isrWIfCeqopxeDcrDhYEwAK///jdhYUGk4fLYXHbCYio2PMlyHPzVD4lF?=
 =?us-ascii?Q?pSn4lUoucmvx9itX+QUCLJbyJY5YZrdxZKOXyoVKr9CcRnSeABQ00Hd6FdtL?=
 =?us-ascii?Q?vjDbvonvImfcHGWJkv1pnbP/PMCMeeDPgoGw91gUpPicaJEdtc7+U6zodvue?=
 =?us-ascii?Q?J3aGIZo+0xPabTv8ukdrnIgOkQzPre06Bnxh75myT0iQBZBRafB8Ahu+oXe3?=
 =?us-ascii?Q?vQ1+bxmEdnEdrAazpraOUlP9pP8GUQjDeA9Iuw1oYyXkDN4R9jmDyJfH4RYL?=
 =?us-ascii?Q?4lJCPpfrh381ST2c96y+kZNdr4GkC+w+xrENm+DXmdlTSYVx6J1+NSVxRY6o?=
 =?us-ascii?Q?KJ7bYWoiRWhVTjuuyqMagLajkR0HqksZGILkwGfqUH/ayoyajNP6M3455SoN?=
 =?us-ascii?Q?q52IqLzZHUtMImuhE8OBvPUkwestRkKlaPkJeKDe7QXelgzAndXzKed6kFIn?=
 =?us-ascii?Q?d9WwsnOK1Vnhur7tzoLilSmCJbuluDt0kARkQN/eyaHFp+b5kOgpIz3Ihe8w?=
 =?us-ascii?Q?B6L07SGXUl+0ua4G4ihjTbBgfKn/16h6t3RsHlLBbk1Lvdyqv1OpoF5Uj5Pa?=
 =?us-ascii?Q?9EnYhcVxu2Qoe8a1Q3yu5aCAhJryUyL2yBPXm63eDNhf6pb6v3Ztb07yGX+o?=
 =?us-ascii?Q?bdxMvB5ba5S1rC/y8WR/B7jRZK3HsEkUHsmooaGQLyhSKN6oXLnp1kyhIKct?=
 =?us-ascii?Q?Hdk8wO5agkBQ1lQNAngojCsSz/d9ASXF7UG8m3DqXb0ML9pJ7+VbBJdZTtKs?=
 =?us-ascii?Q?VK39EcfNPTj8y1FBgy1oXYCAUUq2FrXOvBIeekh4C/EpHtc0vUiyrbjeReVL?=
 =?us-ascii?Q?ic0Y443HnLFhEvqUUJjGhBoJmER6MPiMZ8qHsQeYsE3DU/v+Nbnrz0W99Mr6?=
 =?us-ascii?Q?d/AgvU5LTCBJ0LQ=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Dec 2024 07:01:38.3702 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5da3bf37-4193-4587-0034-08dd257b24c6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF00036F3D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7493
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

From: Lin.Cao <lincao12@amd.com>

If buddy manager have more than one roots and each root have sub-block
need to be free. When drm_buddy_fini called, the first loop of
force_merge will merge and free all of the sub block of first root,
which offset is 0x0 and size is biggest(more than have of the mm size).
In subsequent force_merge rounds, if we use 0 as start and use remaining
mm size as end, the block of other roots will be skipped in
__force_merge function. It will cause the other roots can not be freed.

Solution: use roots' offset as the start could fix this issue.

Signed-off-by: Lin.Cao <lincao12@amd.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/drm_buddy.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
index 103c185bb1c8..ca42e6081d27 100644
--- a/drivers/gpu/drm/drm_buddy.c
+++ b/drivers/gpu/drm/drm_buddy.c
@@ -324,7 +324,7 @@ EXPORT_SYMBOL(drm_buddy_init);
  */
 void drm_buddy_fini(struct drm_buddy *mm)
 {
-	u64 root_size, size;
+	u64 root_size, size, start;
 	unsigned int order;
 	int i;
 
@@ -332,7 +332,8 @@ void drm_buddy_fini(struct drm_buddy *mm)
 
 	for (i = 0; i < mm->n_roots; ++i) {
 		order = ilog2(size) - ilog2(mm->chunk_size);
-		__force_merge(mm, 0, size, order);
+		start = drm_buddy_block_offset(mm->roots[i]);
+		__force_merge(mm, start, start + size, order);
 
 		WARN_ON(!drm_buddy_block_is_free(mm->roots[i]));
 		drm_block_free(mm, mm->roots[i]);
-- 
2.25.1

