Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB399B01FAE
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jul 2025 16:54:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B64E210E26C;
	Fri, 11 Jul 2025 14:54:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="pde5Md3I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2041.outbound.protection.outlook.com [40.107.243.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FDDB10E26C
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 14:54:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oWEUsL+5IgU3rAPCAWdeHcHKr7LGpLCd8rzkYhvenwk20I33FEKYMGExv5TSclTs5YqER8IlDavuNF8f/qbe6pp+6JIkpXZZA6uDpL9EdAg7dHKdzevBRhf0/ovaSfstuv4Bi0eLFiNDgOcgO982yVvS+zWz5gAKNMU9X542d6AAxpS7EQ/jeoh2Y/x61sJft6UJYyrW3Ll+TLp8Km3JN6zw+sKenUYq8+nQoaW2JwjZVFPaZ03zki96etCwlCPpxS0ckuJLa8NH3nYcFSbKDq96UIVTHusfL2+F+KIA9VXWNwErcPeH7GD1jQlhY4cwJ/1j9RBwcsbtXJqTwYkPEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Op/4CQCv8vAdVnOR5cXlA3d0z/sRlC/9N0Psrs1zgac=;
 b=LfSyCWBMWBV/BE6p8ZxVgwsUYw0XuDkFYC/uujk1YFrjz8TncVGU9llTbeAv5BpJrV2IDa/9cNaYRYl5etEUua/DjoQr4sxrzKZC5IHlsBZusMwxt0bi50bIUVkIMDB3K/f2A5oMPlHwBw6Ejfic9obOt45t1DYM8UPHREQ0nAlhFy4bZMATuEoq/n2mnS+Nr48O+Ith97yjZlOZJ32n6ACCjzkmyjKuXOcVfoFdPk4uudPwnickuDOQj2gNezInL9TJXKq4kqEECapIkGmfAnowGLUvuJbUylWgnh2k9k89+J2K4RC2QERqCfbOTkoYunanrJZBCsSDEtdtGjPlmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Op/4CQCv8vAdVnOR5cXlA3d0z/sRlC/9N0Psrs1zgac=;
 b=pde5Md3IpBc1p8MH2hejC0kdNTN1djs7qPKebfhtMG6x9R3lihHhCmWTjEF8ZZpHhfyGWbAXhF01A+BAaDnpST1r87NRD/gxYXKxE0Z6V/uJ6WAPDFg50YABbTlvZg0TTsEPI/+8uePgGDDND4FrZ3BhE1aoSrB1beGvb0en848=
Received: from SJ0PR03CA0020.namprd03.prod.outlook.com (2603:10b6:a03:33a::25)
 by SA3PR12MB9226.namprd12.prod.outlook.com (2603:10b6:806:396::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.27; Fri, 11 Jul
 2025 14:53:58 +0000
Received: from SJ5PEPF000001CC.namprd05.prod.outlook.com
 (2603:10b6:a03:33a:cafe::9e) by SJ0PR03CA0020.outlook.office365.com
 (2603:10b6:a03:33a::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.22 via Frontend Transport; Fri,
 11 Jul 2025 14:53:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001CC.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8922.22 via Frontend Transport; Fri, 11 Jul 2025 14:53:58 +0000
Received: from fdavid-dev.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 11 Jul
 2025 09:53:56 -0500
From: David Francis <David.Francis@amd.com>
To: <dri-devel@lists.freedesktop.org>
CC: <tvrtko.ursulin@igalia.com>, <Felix.Kuehling@amd.com>,
 <David.YatSin@amd.com>, <Chris.Freehill@amd.com>, <Christian.Koenig@amd.com>, 
 <dcostantino@meta.com>, <sruffell@meta.com>, <simona@ffwll.ch>,
 <mripard@kernel.org>, <tzimmermann@suse.de>
Subject: Add CHANGE_HANDLE ioctl for drm gem v2 
Date: Fri, 11 Jul 2025 10:53:40 -0400
Message-ID: <20250711145342.89720-1-David.Francis@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CC:EE_|SA3PR12MB9226:EE_
X-MS-Office365-Filtering-Correlation-Id: adf1500c-7cee-4d83-32b8-08ddc08ac414
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?nsWNcLQ4Be+cK27HDe0AyT+Ssuhogv6b64T31Pxq6ZpwOK2f465EA6atuTf2?=
 =?us-ascii?Q?2z3Ppc3YXm+w/JAZPx0PctIoVjuoEPFuc9g2yzwn7mht4svvxgpPn9ad7pYT?=
 =?us-ascii?Q?FthWMM6aee3zqH/R0/TgOvgLed0XmS1zChlSJ5c/LURJOY1S4jV93Z07e1+v?=
 =?us-ascii?Q?+aXdS2d6Hy+KsJWdWc3Fc5PtuxkZ3J9qBoEK+rQVE2Lt2E7yuAxAtm1bTvL5?=
 =?us-ascii?Q?aZOhgS/2q0hSRbAuAI4q9gqxhO2jb+iAD/n80qnLyWjQ31miiY5P4qtfiUiG?=
 =?us-ascii?Q?cwP1ELnKWBI8gYRDrM2Pn5hB0/IuOXapiW99GuQRQ40pGUq8lKv6XXSM3zmP?=
 =?us-ascii?Q?eCTY1SZIDN76adZB8OjuxbcBHeau+Dzmf/wOaEKK7EBrNcNRpB7gCAwb+3jc?=
 =?us-ascii?Q?tVJKLnqTccelhmwoGeFr6IcsvNVGYF0Adcac5gNHETC4jY+CteKMdV6pTVqY?=
 =?us-ascii?Q?l+BaZ/3fqAIYCcMbw+qEnpUG1WJF080RgLPv5bTGBVn0BkCJoH0OTydDJ6kV?=
 =?us-ascii?Q?AgfYyX0Txzxfdz3e8YrH2tBv+kFbAxwjZ77HWcvaqnQwa0a6uOxEYbuvaQJ7?=
 =?us-ascii?Q?3NnFZGxSDkQbDLFsB5qMtD5HUvT59w2EmhaHCfKIyNFajzyYchILnQ11lqey?=
 =?us-ascii?Q?6ZepJvfdwLwXzSBcTse+a+giImyCLWk08dTWGZIV9oWBYd8U/JGmTHJ3UscN?=
 =?us-ascii?Q?P/Z5lVWjMnPo2nRuVjSyjhKXWMmTuA62X7eRtNNzYm1R4tVpZunjGsPxOnfn?=
 =?us-ascii?Q?twdVJ8fYqGgjPYenbo0rKUi7o2ARxu40hbDR7jykkCYb86XyYAawaBnrF5ot?=
 =?us-ascii?Q?bYIXpPdhpMDoSW3MdlPBhEaEdSOpSz5gaSCtXP3y+M3ZvA4OeMATIRHBW0Y6?=
 =?us-ascii?Q?SHnrTXwa2+g1rTxRKBUxiCW0fa2yNIcy5c0JORU3rZSu8/IHZP4j/dLx5ot8?=
 =?us-ascii?Q?NVHOefWvCiWzzvKOtNpnP0ai21EbFWhrxL8UbiLNW3jOhv/rrfUyn/pDy13J?=
 =?us-ascii?Q?rPL/8FwEhiwzfC1nc2p0UkUX4OOv0egpNQgIqlpo3yOXntP49y7YoSjdsyPt?=
 =?us-ascii?Q?TOAsu/6FSx38WNXDdY3sdPjNNPTcVNWS3w1TiNet/bTHdBeJNIzXk8SNhfto?=
 =?us-ascii?Q?APP8822crTeOYe8ihXl/I+IfaVW4jS4fdeekLmXJNyTkbcMpqZtQg3pEKp3g?=
 =?us-ascii?Q?ExLt4G3p+OEjiUJfbPgjKaNik0u4cLUh5dDoRewpTNwDw4K5yFZZ1OxAOFqV?=
 =?us-ascii?Q?4VeGnsBxz8yiTBLR1MA+qyX6rNEBrJoPwomSelqpDBEJEwJ8m0Quq+BX1LjD?=
 =?us-ascii?Q?6uAU6ebRxoio2CUJ4+T6yf9tgg7bIZOP7MC2rW+hE15aOn669gJ8dXamECjO?=
 =?us-ascii?Q?hVt0JCgAZYx4gQbEhTc4A827KIORLm0ibBYxq2FblrHqNDRFlRM5BXNOlNUN?=
 =?us-ascii?Q?N4KcwWEasZD1WMfHFN1gJL8LQX/5+bStNhdT0If8H1aKAFPabxCL1g=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2025 14:53:58.2796 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: adf1500c-7cee-4d83-32b8-08ddc08ac414
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001CC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9226
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

This patch adds a new ioctl GEM_CHANGE_HANDLE which is needed by
amdgpu CRIU for dmabuf.

The ioctl allows a user to move a gem object to a new handle.

In this version, I have added kerneldoc comments for the new ioctl
in drm.h and have moved over the other drm_gem.c ioctl docs
to drm.h.

Accompanying changes:
kernel (for dmabuf CRIU support)
https://lore.kernel.org/dri-devel/20250617194536.538681-1-David.Francis@amd.com/
igt (for this ioctl)
https://gitlab.freedesktop.org/fdavid-amd/igt-gpu-tools
CRIU (for dmabuf CRIU support)
https://github.com/checkpoint-restore/criu/pull/2613


