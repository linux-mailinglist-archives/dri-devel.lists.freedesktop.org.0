Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F8F19B9A2E
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2024 22:26:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF7C610E161;
	Fri,  1 Nov 2024 21:26:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="V7D9L2vU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2042.outbound.protection.outlook.com [40.107.243.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D28C910E161;
 Fri,  1 Nov 2024 21:26:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VIssfzek7jZ4PeDbup/IDJQx3R41Q+OAwZ8X+HIEWdOWV2gKP3iO9gv0nnAjYso31laUOu/9cPlaWDnkvm5DZ5yKIPHY2V+SsN0IV1ClTgNyd5A+6bVhm71tKbGTPFoLMxgZ8Vea972lZT+EbiL79X3a3bjLo3mRD7WuN47bs4fFjctUZ3BglRwTTLxgZaPC/GElDY0dzQuvjGldhuIlBcEjbkSTZSZvjK5ZUD7ERh6jZ7pkw5961tskNVb1QKXbZwbNmoo1kULtK9i+hdcCpHcTUrHiTDhbBCkNbdm/NJNE7EH98+KPApS9hM1wt2jPPHDrgHEKnstITqR/8MWflA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2tYaTkG/AQ2z7uuEyoiZ/xXEtC0YGGWrK/eatL5AqT8=;
 b=U8wU06ykqrH7skTqVCCwjiUjjwo8xU6aLYtIgvu7rhD+rMpGnt2kIEN1YcHz0vk8+gV5frHYaNtLzCrdisBLFZLG3Rl42dw90Jg/Xg4bkNN1nzbLol1bOIfvFM+xX4tOtdr97hKRrxoDmyjpQhNp3qHumTOTwWGRtdzOY5EfBmuPMCoDFbAPpSXjZoThZtTCLVAet792EDSzdJoTgallXFElj2vfOrDQ8jNmuMuu8o2dWBbqXFB0zA1jvDRqh4cCCLgQ7RyVgGrs9mN5iH88I+GyyxPuDoBl9C9sLuFGbENKJxEBHqLdYayQkfOKpkw7tPgWpGivp0RFzhFcERXZLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2tYaTkG/AQ2z7uuEyoiZ/xXEtC0YGGWrK/eatL5AqT8=;
 b=V7D9L2vUeoILQhn5z3Q6TuYIjJpkucvoQ2kVCRxYIDjZAhMvApqKP+edtakUkD8q3OQwYHZfZFzKMggaH70dwd5up1UTZzpS56HYNw8Jp68c7HhITc/flYw+TWGkqW6Sl1tyXsPqUuJ4zcbd2jXV3oe6NpIgvn0FkIH1w8pEHF0=
Received: from DM6PR11CA0035.namprd11.prod.outlook.com (2603:10b6:5:190::48)
 by CY5PR12MB9053.namprd12.prod.outlook.com (2603:10b6:930:37::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.27; Fri, 1 Nov
 2024 21:26:01 +0000
Received: from DS2PEPF0000343E.namprd02.prod.outlook.com
 (2603:10b6:5:190:cafe::7c) by DM6PR11CA0035.outlook.office365.com
 (2603:10b6:5:190::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.22 via Frontend
 Transport; Fri, 1 Nov 2024 21:26:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS2PEPF0000343E.mail.protection.outlook.com (10.167.18.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8114.16 via Frontend Transport; Fri, 1 Nov 2024 21:26:01 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 1 Nov
 2024 16:26:01 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 1 Nov
 2024 16:26:00 -0500
Received: from jzuo-linux.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 1 Nov 2024 16:26:00 -0500
From: Fangzhi Zuo <Jerry.Zuo@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <lyude@redhat.com>,
 <jani.nikula@intel.com>, <imre.deak@intel.com>, <simona@ffwll.ch>,
 <wayne.lin@amd.com>
CC: <harry.wentland@amd.com>, <rodrigo.siqueira@amd.com>, Fangzhi Zuo
 <Jerry.Zuo@amd.com>
Subject: [PATCH v2 0/2] Refactor MST DSC Determination Policy
Date: Fri, 1 Nov 2024 17:24:15 -0400
Message-ID: <20241101212546.4060-1-Jerry.Zuo@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343E:EE_|CY5PR12MB9053:EE_
X-MS-Office365-Filtering-Correlation-Id: eb297048-c16b-4411-d12b-08dcfabbc8f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?b9p5o5N1jaUtzm4JIuRF1M/2VbmmGerAfCV2ECu6uVYeqN/amf2nM2SJJbHe?=
 =?us-ascii?Q?g8bpmV9zHgUDw4IhA+I1NgRU6ime15pCwg5clRPxLkAZL6yrqxOEp7kzKDaw?=
 =?us-ascii?Q?jkVti+eRpF5QLzmM1c/bKSAVxLU/uQ82PZxOQidA8hw+bRQfDZAkPi6Qd/Yb?=
 =?us-ascii?Q?fydvS7gCDF7H8Mx/JPwZVHvuFUkLalLLBmBvI01Yg2qfjpkhjH0BgPiVpQVG?=
 =?us-ascii?Q?tc/4zqnc7wbmE9mTTqM55b1duzDSQm4VRlQ/uneWuF+vSrTYLIFXZ5vo2ups?=
 =?us-ascii?Q?p1mMdjugSVySI7A9GdHA3lnE6nEnz7Wvcw18s5UKs4FNitMMdEyehH9/LXxF?=
 =?us-ascii?Q?Xu516Eor99M/AbTjkqN4phbYuK8xD7KH8msdnFXtMp1GJuQY3EuKz+oqlXPW?=
 =?us-ascii?Q?7oy4JXtPXDBSfRQMSvkCNqqEh5ebWnj3bj68ZKLOY19Nh+d/DRfS313+PI47?=
 =?us-ascii?Q?lE7uUh8xRvl1v68b51qxm0M5NmEZXqyGdW23aQPsBkwjsNH1XLu1t7TsRkte?=
 =?us-ascii?Q?hmk+6+zpHhqtLKz4obWxIzGVLJ44zdvR7kNv4nfJhiGAnhk+rn/LLp6RZtfz?=
 =?us-ascii?Q?Y9U+puL1P21qLRZfjLOocgTxCwQC5TB8qoPYts0ucZ1EwyBtaI/IuUzCuMwk?=
 =?us-ascii?Q?q+R5gNT9TziRu2OGFTeCmvtTDBwfnnJ4Lcm9CuXDvYIbOF+XFAj3vS9gaXM7?=
 =?us-ascii?Q?gtKdP59J5yaNKBkKYl8ruHZZg58XwNd4iikemNqF/GYi+eLnnXGvVrtrfuZM?=
 =?us-ascii?Q?yOpHpQiC5Wd+PYGwXzrFShYFds9AVcWaq6/UP6RawwvFafauJwrAzX0QPgyI?=
 =?us-ascii?Q?JOB8473lnmWRRxNik0HvuozsZjRKowTOmf0pfB4QpXbKaMFrByXdoNOFGLad?=
 =?us-ascii?Q?sPv6E7p15iFelgVv0gBUJiAKBI8Zltq+ltmNNBvicyPP1TJnEU4Viq0Uuab4?=
 =?us-ascii?Q?ffczJ6i3gHaKnRoyhan95oPo9l/wl1ER50i206x4/Ss8dTp8lpjb6P/FtGIz?=
 =?us-ascii?Q?ftSDOeGkDTikWoYrWPV8jHZYwqezYZpS4fjJT1R5WF7dRrJWxWiAVfcvvZCX?=
 =?us-ascii?Q?1qJUPoM3wKBkRhyvyYlJRL5okkEbCf5Yl2mjfNaRdsamdF7P7mcFFKqeD2wP?=
 =?us-ascii?Q?qFaNnYcMg1osc3CzXuCpEB4fMsTOA+lTDM0ecKY7oUIx0cOwr39Po2JM+zA3?=
 =?us-ascii?Q?M09RJJilGyTlHyJUAe15UaGsxHKRv+nnEdaKVyU3sNIb8VJepYbDeDHchJHr?=
 =?us-ascii?Q?2Up9lw1nF2qer7Zd2yaDpDoYfUc28aodTzIhORNvmYz0WNsqHPhS6s6gsWRJ?=
 =?us-ascii?Q?k9+y84dJJVEoL1f4gMeS/jrp4kkVsz75LUUNk809JGG2gIoZ+WbZiSyNiUw0?=
 =?us-ascii?Q?9JErFTHBm+jiZQTU0K7UJ9hdKd2KDUgUmaHAQd8zuqOeTyCPjA=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2024 21:26:01.6211 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eb297048-c16b-4411-d12b-08dcfabbc8f5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB9053
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

The patch series is to refactor existing dsc determination policy for
dsc decompression and dsc passthrough given a mst output port.

Original routine was written based on different peer device types
which is not accurate and shows difficulty when expanding support of
products that do not fully comply with DP specs.

To make the routine more accurate and generic, the series includes below changes:
1. Refactor MST DSC determination policy solely based on
   topology connection status and dsc dpcd capability info.
2. Dependency changes required for each vendor due to interface change.

Fangzhi Zuo (2):
  drm/display/dsc: Refactor DRM MST DSC Determination Policy
  drm/display/dsc: MST DSC Interface Change

 .../amd/display/amdgpu_dm/amdgpu_dm_debugfs.c |   2 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c |  20 +-
 .../display/amdgpu_dm/amdgpu_dm_mst_types.c   |  30 +-
 drivers/gpu/drm/display/drm_dp_mst_topology.c | 258 ++++++++----------
 drivers/gpu/drm/i915/display/intel_dp.c       |   2 +-
 drivers/gpu/drm/i915/display/intel_dp_mst.c   |   3 +-
 include/drm/display/drm_dp_mst_helper.h       |   9 +-
 7 files changed, 145 insertions(+), 179 deletions(-)

-- 
2.43.0

