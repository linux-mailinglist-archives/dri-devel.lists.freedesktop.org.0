Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E8C796A80F
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 22:10:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDE2210E362;
	Tue,  3 Sep 2024 20:10:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="4m7DhKrC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2057.outbound.protection.outlook.com [40.107.223.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F08210E362;
 Tue,  3 Sep 2024 20:10:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jGyLsoenP5dKA20suOwB2p8LyITuMFmFffLhC3oeR6XAEHhL8BjeDRmP8qhN3cp8tgXcdxLKlzR4GBbcv8Ho91mg4EXA7Sfm6RLLN/CfZq2Qs1X70jQSnAtlyv5RfDzGvzINPraLwHK+fXzTsmZ3RRMq/qbqPsL+cyNriTedJwyvgeL44r6JLQaoWIifuecD/e8JqO6rug4H0YSjFpJkiAwH9BfvVlvj960PpqcZ8sIvUaRQPcW5ELMll8DiwOz8q+hAfSnaKeumC0XwJlfIdxrwCMOvMEQiZOB1gZ7+/M3uiRxfkcdXQGCzSHxg06VHdPZ6Bwg9aoCHdodR8zvuGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SAMQiBmdUhsES6Jf+THfWZZBnOLScWMbibdjWAzdj+s=;
 b=vOty7LDPo8oZ5YbetugYFVwbcAqQXD9Kd8hOSNsXJe2wDk1oOdZxBXjqileBd5ZoQ9SPuveO77iEVatdLloZCMfXK/tWRsWF3CpYa1MPlhAZ3mi2JbM7czirg4BI4gRbq/bMuSdVZzxNpvwVV4muWcJ4D/DBWAy61Lv1d7UjuQQEO33emYJNMpW+4wJh2X+M/5jBD1xow1e7sPlICXCmekX0rPfufcx3NqpJyxKhJmml8+fprVJCuxWbNOW8Ttxjh+tvH7hyqrIqxg7ZVRuHtDdNg+sy0pYjQ2GV4nDEJslv6jMPyoPNMbaLXOhXtyNYFQ8s2XHsYUm51bWbK6U04A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SAMQiBmdUhsES6Jf+THfWZZBnOLScWMbibdjWAzdj+s=;
 b=4m7DhKrC/iKo7NKfmCPWSxfXtercqlm1SVGRA/M3ysdGAocx1zwnCt1i7BOLc+lC/xzYEhApE6j6e9gf/YJFfJD6XqbsbY5aal8GLe+S9pkV0PS/MxesKEJr41anVAV0Hg+NCC/nmkdvHZKRMCwOgivHYqm+Kyo0F4M4Eml3MAk=
Received: from SA1P222CA0029.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:22c::24)
 by PH7PR12MB5829.namprd12.prod.outlook.com (2603:10b6:510:1d4::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Tue, 3 Sep
 2024 20:10:09 +0000
Received: from SN1PEPF00036F3F.namprd05.prod.outlook.com
 (2603:10b6:806:22c:cafe::b7) by SA1P222CA0029.outlook.office365.com
 (2603:10b6:806:22c::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27 via Frontend
 Transport; Tue, 3 Sep 2024 20:10:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SN1PEPF00036F3F.mail.protection.outlook.com (10.167.248.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Tue, 3 Sep 2024 20:10:08 +0000
Received: from hamza-pc.localhost (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 3 Sep
 2024 15:10:07 -0500
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: <dri-devel@lists.freedesktop.org>, Alex Deucher
 <alexander.deucher@amd.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, Jani Nikula <jani.nikula@intel.com>,
 <linux-kernel@vger.kernel.org>, Hawking Zhang <Hawking.Zhang@amd.com>, "Hamza
 Mahfooz" <hamza.mahfooz@amd.com>
Subject: [PATCH] drm/amdgpu: enable -Wformat-truncation
Date: Tue, 3 Sep 2024 16:09:53 -0400
Message-ID: <20240903200953.292717-1-hamza.mahfooz@amd.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB03.amd.com
 (10.181.40.144)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3F:EE_|PH7PR12MB5829:EE_
X-MS-Office365-Filtering-Correlation-Id: b0d55659-0126-4b3a-8ed6-08dccc5468da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?IaDCjhBsdoJFTVE5TYS1jniSqEEYUddtjyb69MoBPX+OZfizDYINoezIUPUo?=
 =?us-ascii?Q?SjwyT7Xl6hwjnk5MqYaoTda9tXLzab9CwTKldQBHJ7MXgDOGr0QSk8lPlTsB?=
 =?us-ascii?Q?faZV/6QnnoqbBccyPQ/Lc1nLxNYXSyhaT0kv3eWFf1Di6IfJvf/gT4T07OA8?=
 =?us-ascii?Q?5vuseO8davTGq/IrjMZAHJX8jjNGyQWgBW4iLtQ4NdeGJo0Y3zRy+0esdNYx?=
 =?us-ascii?Q?86poB5en6URYez+u2IzcmmFL8gzeuQZqm2fZCM6OtuNmpGLgzVYTqMPBsTS+?=
 =?us-ascii?Q?4rvwiiOyk7uLEaWzShW7JG4AH1tYawAZwNIaELX9UV4e/LnyMVgO9dyffpS4?=
 =?us-ascii?Q?4+yDW1pwjJTpbgaYhScNZxONA8/TmAOrbpj1R8Z3o4NHhut3cSIsd18uMMjb?=
 =?us-ascii?Q?+zQ02IHXqwPmJ/VVzFtZZbi9psmpADiDtvPbh8OjglLXHvA8fRIxGY6sD4N8?=
 =?us-ascii?Q?GfqTQLnLY6q+d5TxIdmSXYVXcnxHdlwfCPmxyEyXVHWoelbrYBKjoTGpcHQ3?=
 =?us-ascii?Q?pyvOmr0hrwMgMktJFQxqC2Kms0+zUw/UusbtdFFtifsQWrmVfhT6fO9AxERM?=
 =?us-ascii?Q?B5VXnH+w+rkjhwdadSFhCRcVzmcSbl+FSqOqUHL4dKp9tq8SQukWJqM/kNYP?=
 =?us-ascii?Q?ofbJoK/yNjVpXbFVZkvMAIVxxFKkZyCEWVeTeXzQIDrsfa5Wk7p/gcAvm/dY?=
 =?us-ascii?Q?gC6x0xQLJm4Ro9eZbJ4Hs3AVY+MZy1xCLuZIsQEPe6IR6oNAAFKTjtgJ2N5e?=
 =?us-ascii?Q?glOcOQV0BZIPii4sJCq2KsnqrRoELb6FPMxEvsh5PmCf/WZLSlglZ627RZgV?=
 =?us-ascii?Q?bl7VSOQQnmaihv3BHuPXK0l8l6W1vHKcDy4b6033v91TUDfglps9291ybiPq?=
 =?us-ascii?Q?4+VSH9CfWagqrH3TX4RnpkkbsG5V2A/akmui20GiM1GuLwmTfTUkfB6akpNB?=
 =?us-ascii?Q?pLMITeWi65rSgrw7eyZd8+va77OZ+0WzL3hCj2QtBnPb5i8G25l7fqOqHBSV?=
 =?us-ascii?Q?AS8JmaPXBDGtvXa3QW8V7YrOOYjB+/eqNpSWnyG61KgFfVcyi94W439Z2/vB?=
 =?us-ascii?Q?nq5MIq2XTpyU04O0Ch19jcmlAUIXDYTuYPzgaHzAVp75nq3KuKMQT9mXX/3Q?=
 =?us-ascii?Q?KDzv3uYY5N9sb4mrkallo5lBRMb6o2MYVLBb8dDdJKzy9dctp+6B1dgJ6S7C?=
 =?us-ascii?Q?BKlMbKmRYl2fJSc0YVcKxw1FX1f/DNFiGlPgrfuUVa2zRphCJsAXm6sqw7hp?=
 =?us-ascii?Q?7YtRxo10dWofSwTPw/Qou2sQnnMFB66e86UycY6H54E7R1rEORw6sL/1t3LU?=
 =?us-ascii?Q?eAnen1WmwTsvXQMF/BWRu883j9oSn1NRJ+Oqclm+BHBuDlVYsoDYGr+x6wl3?=
 =?us-ascii?Q?cx6OXAI6P0xow6xUzQKaSgQw7yhJhmRROYQ+/+Lac6PbEWiri54uO1q4BQHB?=
 =?us-ascii?Q?C+1BCtJWV0fsVnilNZRKIqRywo+tNXSa?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2024 20:10:08.2303 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b0d55659-0126-4b3a-8ed6-08dccc5468da
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF00036F3F.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5829
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

It is enabled by W=1 and amdgpu has a clean build with it enabled. So,
to make sure we block future instances of it from showing up on
our driver, enable it by default for the module.

Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/Makefile b/drivers/gpu/drm/amd/amdgpu/Makefile
index 34943b866687..64adadb56fd6 100644
--- a/drivers/gpu/drm/amd/amdgpu/Makefile
+++ b/drivers/gpu/drm/amd/amdgpu/Makefile
@@ -41,6 +41,7 @@ ccflags-y := -I$(FULL_AMD_PATH)/include/asic_reg \
 
 # Locally disable W=1 warnings enabled in drm subsystem Makefile
 subdir-ccflags-y += -Wno-override-init
+subdir-ccflags-y += $(call cc-option, -Wformat-truncation)
 subdir-ccflags-$(CONFIG_DRM_AMDGPU_WERROR) += -Werror
 
 amdgpu-y := amdgpu_drv.o
-- 
2.46.0

