Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7D07BD1250
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 03:56:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8A0D10E350;
	Mon, 13 Oct 2025 01:56:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="LWzw94R4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013010.outbound.protection.outlook.com
 [40.93.201.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7802B10E32B;
 Mon, 13 Oct 2025 01:56:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uxw1nI/yQScH/AqSdntNRE7PXErMqiUmAu2BJ3JMz9MgwRRMHTBZe1ORqELZgLBOHvoxATwVRAXTfQtWl3cK5frvqW6hghMOG5YAZ6DXuI8cXR2CYXejbGQ2PIGVy51nQdhOSQ0W5OVTVFlW3EQYnOZeWqJjMhNVNj2wgOrdAs3H9GAv7txHbVuH97wdbVY/xFJJJD7xoCPHWBGAuk0r0qDXpckjcSRCU41L7Nmu/9dhOoUVr8el42Ues6xp0DyFmdVfaY0UtdLC/18iZFaaX44UgxKUZvA1q1Mv0jF/u8qw7GtAFVNiw9F7ARxZWPqzDZpvoIsAztdMu5jAhVwuaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FkKuFlAozf65Ni/9gQrx3JQiBAX++vdT0yzR/temEbU=;
 b=HGQvBKpKOe5bQfD/P2Mm/DqL9Yx7u59HW8py0VgLLIg8dOidYVAzRxT98lqQT70urixZ8P7koPw0QZ8JWI0NEApi6vtBqObKniHtmqLU8J8SENX8gGHWSVMp1G5g+Oru0MeNaqpxytw26xyoutTGvfzdpoh/nYjeAm6moQqVRiQg4IErcZA82X7trwrMy8lmJCGucZTKE2cQtShZnLW9cdA0Ze5Fd7oaRKyWrUfafKl4PbUUzEUWD29oiy7pbh+7+69Z2bRiSRY+i0zx3ZYQrlHlBF5LottIYky+Iem+ohkLmWEZrtl5pChnMmxC9+xZyEd552OHYLxjlfFw3c7k2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FkKuFlAozf65Ni/9gQrx3JQiBAX++vdT0yzR/temEbU=;
 b=LWzw94R4o2FE2r9NwoH8uvKO/Igs70gnyrzL1xu/EYAghgkFQoLX7AfrC6HHeILPyHyzmoB+5nuVUa7Tbb/xDTIPU8F1X6v4N3Y2OVvvFQ25IHBYlJ9x9zyb+ku/MPkUId9zzhQqtZo+dFTyBMRMUF6eXGjqUF2vShoCItKGTuE=
Received: from CH0PR03CA0003.namprd03.prod.outlook.com (2603:10b6:610:b0::8)
 by BN5PR12MB9462.namprd12.prod.outlook.com (2603:10b6:408:2ac::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Mon, 13 Oct
 2025 01:55:59 +0000
Received: from DS3PEPF000099E0.namprd04.prod.outlook.com
 (2603:10b6:610:b0:cafe::2b) by CH0PR03CA0003.outlook.office365.com
 (2603:10b6:610:b0::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9203.10 via Frontend Transport; Mon,
 13 Oct 2025 01:55:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 DS3PEPF000099E0.mail.protection.outlook.com (10.167.17.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.7 via Frontend Transport; Mon, 13 Oct 2025 01:55:58 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Sun, 12 Oct
 2025 18:55:57 -0700
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sun, 12 Oct
 2025 20:55:57 -0500
Received: from JesseDEV.guestwireless.amd.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17
 via Frontend Transport; Sun, 12 Oct 2025 18:55:50 -0700
From: Jesse.Zhang <Jesse.Zhang@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: <Alexander.Deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>, 
 Jesse.Zhang <Jesse.Zhang@amd.com>, Philip Yang <Philip.Yang@amd.com>,
 "Jesse Zhang" <jesse.zhang@amd.com>
Subject: [PATCH] drm/ttm: Add NULL check in ttm_resource_manager_usage
Date: Mon, 13 Oct 2025 09:54:51 +0800
Message-ID: <20251013015550.1317222-1-Jesse.Zhang@amd.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: Jesse.Zhang@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099E0:EE_|BN5PR12MB9462:EE_
X-MS-Office365-Filtering-Correlation-Id: 5fe9a9cf-d9e2-4b2a-948e-08de09fba761
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?EbLNtVvSsByptZcrGRce+cFsb6t23nTeNbxDrGhsKRPKGOowlHQ5XoFPiw1V?=
 =?us-ascii?Q?CTWJqg9N6/Xh6LgP5BXmHCTn3HpWnyCpLj6tP0ifXod6HlmF1c2McWkHbjF3?=
 =?us-ascii?Q?sDDdFWuqyxWdZ8UkF5GOYwzuudqGtb2UvxT3ny+cMX3SHlmNVtmVPjDeNbdP?=
 =?us-ascii?Q?EDXQgNkEFygliUEHuwDEcRqI3O6DxASv6JdWOIBjjtfFi+Wdn92srQXgr7sH?=
 =?us-ascii?Q?5Pb9GQV+1eDEhzVCP4+fnSpf8vG8+XJwFOYeSh75uqAQRThLFi6lS+8xuc7H?=
 =?us-ascii?Q?0e9UGzMvG8UkbqODjlAjW2VHbgz7yyOynuuhEiy3E/3czEcW8JT56g5gMb/f?=
 =?us-ascii?Q?YpQntX1TV4vkdWv/iB+RHeHgouV7TzXMDXQtNffFeRSNEsCRN9ZXDoMRI+V7?=
 =?us-ascii?Q?OoclY4h2itk1uV7mQQibcmn6rCQ3UPAgrB+nV/0s6KNm0+sg1SdNtoK0Uk25?=
 =?us-ascii?Q?vvv/D7IwOVHqaQrICtWWIol0+p+2miDu7tvNScP3h/2cqqqfILNoabinw2JW?=
 =?us-ascii?Q?OmXGPHtGQAetMya81XrEkEtycBpBf01+PQjoBZ2t69jSIyBy90AunV2owvm1?=
 =?us-ascii?Q?NXqNvxxhqrv49IeYEc4GQJzaFbwvRfLSeEvudSo3R+FQQYEaOIcS58TLCQ4V?=
 =?us-ascii?Q?KLMaZZgT+loyJV5AmCcVJ0d2ScozoroI4XVd24XwFMs+siuLW9xtDNyO4Dty?=
 =?us-ascii?Q?scIqPVogLDg+v/5HS7QSM14jD+KBHf5md2TyudSzt/+jcecRXzBhq4Ol/XE4?=
 =?us-ascii?Q?0RswIV7Xt54a/ML/d+sBiNBdPIfmf4mGSfOTGQiyUbWr6ZClVLNKEpj6kYVZ?=
 =?us-ascii?Q?viN1Z3MQTjTvoWgm6qua20LvIC8j9z9wWUamdpIwxsNWTAjt4v4Ou7L+quwk?=
 =?us-ascii?Q?nvv2+FOzPQx8Cn41zBSQfz7GYE6r/R0FaC41SzgIPF02USwc7bP5yfPqY59X?=
 =?us-ascii?Q?kkw5t2/OkSHBJFtcnSuewtmKqiYWkgFDiuTjUCJZfuSPWMv8COSprVWySeY4?=
 =?us-ascii?Q?bsTwSTUgTZLyLYMhkkPrdyyxmTNP/0FFbBAcXq3uygOMFBojNj+grrFDnd1F?=
 =?us-ascii?Q?c1sJhKP/eoH8gj0cT9juq72gzZyAsakMVAPEv1xnS4RQCp3b2bGmSijGNvgv?=
 =?us-ascii?Q?qk2gOi5+JYCfV6fRRUwZgTN5LEkDYRDH+i3neYmvGIS7fwPmrr9yXk5zzaVV?=
 =?us-ascii?Q?6RbAPMv8v2SIu5+8sndJBqFO1OI2w96m7k1mFcpqcU6SZSqbMNtmsjIXgoKh?=
 =?us-ascii?Q?h9de5WY8YdmNJASaEsKYimysN/Tl+2ihMI37Uw0Pr1AiFGGI/LBKBN6Dc1TW?=
 =?us-ascii?Q?PuU+aBoTGqXb6MEegF9/kn+X1fXonw/WM4Jwt+1hzDsVzvrDCl4DDbL0ISSq?=
 =?us-ascii?Q?yDhfhzG0KdLEqYFRWQyFq7IeBk/ym4C/ggGQhyGVQuMs4P2/aqKoxT7lRtVx?=
 =?us-ascii?Q?KbK5YYA9KPyulZRUtWjvs0z+i3jIAdZrSS1n1X7yZfdLtDZHSbIcdep5Ds+C?=
 =?us-ascii?Q?sdrB1PegfNq3GCTOPyliuZU1GEVXlgorMBzEgR+nwxl+629I1knNBIRfpDwj?=
 =?us-ascii?Q?Sml0n596NervooiRuT4=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 01:55:58.2036 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fe9a9cf-d9e2-4b2a-948e-08de09fba761
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099E0.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN5PR12MB9462
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

Add a NULL pointer check in ttm_resource_manager_usage() to prevent
kernel NULL pointer dereferences when the function is called with
an uninitialized resource manager.

This fixes a kernel OOPS observed on APU devices where the VRAM
resource manager is not fully initialized, but various sysfs and
debug interfaces still attempt to query VRAM usage statistics.

The crash backtrace showed:
    BUG: kernel NULL pointer dereference, address: 00000000000008f8
    Call Trace:
     amdttm_resource_manager_usage+0x1f/0x40 [amdttm]
     amdgpu_mem_info_vram_used_show+0x1e/0x40 [amdgpu]
     dev_attr_show+0x1d/0x40
     kernfs_seq_show+0x27/0x30

By returning 0 for NULL managers, we allow callers to safely query
usage information even when the underlying resource manager is not
available, which is the expected behavior for devices without
dedicated VRAM like APUs.

Suggested-by: Philip Yang <Philip.Yang@amd.com>
Signed-off-by: Jesse Zhang <jesse.zhang@amd.com>
---
 drivers/gpu/drm/ttm/ttm_resource.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
index e2c82ad07eb4..e4d45f75e40a 100644
--- a/drivers/gpu/drm/ttm/ttm_resource.c
+++ b/drivers/gpu/drm/ttm/ttm_resource.c
@@ -587,6 +587,9 @@ uint64_t ttm_resource_manager_usage(struct ttm_resource_manager *man)
 {
 	uint64_t usage;
 
+	if (!man)
+		return 0;
+
 	spin_lock(&man->bdev->lru_lock);
 	usage = man->usage;
 	spin_unlock(&man->bdev->lru_lock);
-- 
2.49.0

