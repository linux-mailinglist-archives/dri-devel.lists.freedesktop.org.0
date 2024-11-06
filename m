Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B00959BF120
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2024 16:05:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 485A710E719;
	Wed,  6 Nov 2024 15:05:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="x8X+LaTM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2040.outbound.protection.outlook.com [40.107.101.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A407E10E70C;
 Wed,  6 Nov 2024 15:05:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wCCRYdRkdO0migYqM08N2I0clXfn/X9WCKXs/P0f/Eu++YgcQ3xsb+pnzJ8zJiMWYY7+nZbYyaJ1RBvM7Dg600F8yGa2pL5CzsDxqg9SwQ1PXCoHv8E8WlY5W/1YnmlemL6aK936kzAP/FPe/dLReCDOwkpZBcxFrompbEY6IKMZulSxqBE0ZfFr6CsaTm+Chfe7+N1RQA4AA9CJA+sqJK17d+xgkenD4hj4Yn00YE0ACe+lHU2DdoLTCdgcYNjWRG4X57daC+HSBBPwiJEV79HIPTMVSLhPAOxUYzGofy1pJK8cxrFC6zQPnnhMUBSaVLFlzyTg0LijqQRPJSYzzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kXglTitnOjAMuN9KsN6Dn8zzFMOBB8dNLjio1/a6v5E=;
 b=KCaa1MJ4IlFxqhVjoRmbTwAgvadHFNUo/FMZayRWDpziBfsm0xusDXD19mnoF+1Vd8Zhj+JDDZsyh0fiFLb7uL4vuPyO3cRK8DDQ60G3g7s/SOuRx9R2NKzPCwZGU+u/gFn/rouIuW3/E2IpX/AWb92LouYSAwPETNTD5zaswWBkw5QgtdIDFVV8k3w0mGG8CX6TRbuE4fQ1h3ZipC/ShTVnk6xKXP38/HEpB3ltBnRLD/vUfaz6jJ1eFHdXzBz2f9igeRQA8jeVeTfFC0uWKVGI4p2lFDIuKlf4MPgy0IDqjeRTgJ62i/6YKKl65zbup+CUxtycN4iNo+hTYcTHfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kXglTitnOjAMuN9KsN6Dn8zzFMOBB8dNLjio1/a6v5E=;
 b=x8X+LaTMP1GJRr/ukpS//nJQFIkDam77yIrckvij9slXTSrr1lyBxIOYNYTcdM2jlAMH/SkGXCUn2XOK34AcUnic+FZqBRH6wshsaCcQ1E3JZ3HllvgiogNlpsVzEd/DOl5c+85Hg4zRjp7xTk18+BHF54e5WbQMvOOpDNcZOMg=
Received: from BY3PR05CA0051.namprd05.prod.outlook.com (2603:10b6:a03:39b::26)
 by PH8PR12MB7304.namprd12.prod.outlook.com (2603:10b6:510:217::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19; Wed, 6 Nov
 2024 15:04:59 +0000
Received: from SJ5PEPF00000207.namprd05.prod.outlook.com
 (2603:10b6:a03:39b:cafe::3e) by BY3PR05CA0051.outlook.office365.com
 (2603:10b6:a03:39b::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.18 via Frontend
 Transport; Wed, 6 Nov 2024 15:04:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF00000207.mail.protection.outlook.com (10.167.244.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8137.17 via Frontend Transport; Wed, 6 Nov 2024 15:04:59 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 6 Nov
 2024 09:04:58 -0600
Received: from jzuo-linux.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 6 Nov 2024 09:04:58 -0600
From: Fangzhi Zuo <Jerry.Zuo@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <lyude@redhat.com>,
 <jani.nikula@intel.com>, <imre.deak@intel.com>, <simona@ffwll.ch>,
 <wayne.lin@amd.com>
CC: <harry.wentland@amd.com>, <rodrigo.siqueira@amd.com>, Fangzhi Zuo
 <Jerry.Zuo@amd.com>
Subject: [PATCH v3 0/2] Refactor MST DSC Determination Policy
Date: Wed, 6 Nov 2024 10:03:11 -0500
Message-ID: <20241106150444.424579-1-Jerry.Zuo@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: Jerry.Zuo@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000207:EE_|PH8PR12MB7304:EE_
X-MS-Office365-Filtering-Correlation-Id: c233880a-7b0f-4c93-9db9-08dcfe746212
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?uei2DMnQQE9Ox1SbrzI2B3gzJXA9qGxOfBrAtSVJbXu740gtNMhIITbuyBRB?=
 =?us-ascii?Q?0lVXqIFJSlS3ufMD/uHrxo5mFjN3m4zuXyRfqTbuNqNpVGJUpd7cpxDh+LuY?=
 =?us-ascii?Q?AUbhBj1LX908EMt/iSDB6igPzvFygGkW6facmZgxLY+yUZ08njJxFJ5FJyS4?=
 =?us-ascii?Q?HU0kFBpmJlkr+pXkgUSnjaXU+VAIoQaoEYSlY2Y9aGO6QAx6TJBq0fGww37z?=
 =?us-ascii?Q?c67NJKR4xIs3j8ogEle9tVnq/8aVlYE71THWvRVVeFRDSMlyfYYBaCoLJm5q?=
 =?us-ascii?Q?FjN7hnjzECe6kWFdSsWucgvhewBHzEDtbCWrd2vQ2ccoqKOqgrq5PdzKs1kE?=
 =?us-ascii?Q?fU1nm+JRFIpxOWcqKq36IJuMeSWdt8m5j3BksRPjcxA3Wu/2Pv4Pw0ZfaOHt?=
 =?us-ascii?Q?NXnx34JUCMto8mNJvnuNlaaaup9WMJPgUSC0XYPCKhsNCSJP9J+U7HHYBhMf?=
 =?us-ascii?Q?KhX0p1H6mXdNMWehAVl0kONi/b4C/qlMkN3tw1KIMmte4PaimYaGohopdMcY?=
 =?us-ascii?Q?8QXMLOYECKu9IdnSrQhmq0Ico5tpOI/aBl0RctXFC0O3NIUn5Tr3oLgIcnA4?=
 =?us-ascii?Q?WobknugiFu3kxnzCOOn9/BkRFy71E7yEhcUs2i0Dm8HQZTAgzujb/fT4W4lP?=
 =?us-ascii?Q?yQJtB7i732ERjIN/B4uNEtYNARgfI/vHITlsYjiS5Vpgujb7I4bDPnm96qBA?=
 =?us-ascii?Q?w6EL9FU8qSAU1KpR9HijZW3FQ+y2bQgX9K/b2fTwvA/wxYb2m7z7PPN3IfeM?=
 =?us-ascii?Q?Gn33NmVGjSWysj1glFVTGcrMk6Ob672b0IRnLwYNLTFO1JZBigVCZGOUrHn8?=
 =?us-ascii?Q?4XiFnRwh5Yu4NIbAC2vC3PThUbNXrN5WVpq+HtaMosWotYMxbDDRwbLBci++?=
 =?us-ascii?Q?Q71WTYe5idwGj1k75aNiZkMUVe2yFljOuWYZartUbQN9zdjqGPL+CV4BaRY0?=
 =?us-ascii?Q?+TCcQdqd+lVa46YIK8yymI15VHkyufQLnJzSmwlTPYPXkSwK+KVRaMkyyLOl?=
 =?us-ascii?Q?3QV6VUu23Cu+MCDNSTJRB8cO3Nj9oUNOsJz80olouNCVe1wDSdwGaRGlVJO9?=
 =?us-ascii?Q?HOmW777Ln6DF7JxsxhA1hG0nCmeH5T2xORxZhheC1sChQS9kr8aB0rkGTOIa?=
 =?us-ascii?Q?uJKm+7ca+/kqNiYhQm6eCiMIo8OK+npi5E5lqvha2rqGCF4+WzjpRFw1RzxD?=
 =?us-ascii?Q?RneQdey1Bvy8CrwgLxUzbCjGpwwIZtPq75bqeOLBh2rQCjz1t7ACjlEPFbdM?=
 =?us-ascii?Q?5BvAsDwPCMi+/TKVmGrZFKvHlwP4Uw58lNUfefxbqoBs4dq/d6+gC4s7fnJ0?=
 =?us-ascii?Q?8/m+k7nVhK2NvSco85SKYy7iukQ4e0jWFs8YOIEkssNpMXG2LoPRyEg1oyLN?=
 =?us-ascii?Q?dDY4i4na2p+wSx6dEgS/SSQf8qAw4++Vax7kWJFxceO5OoqVsA=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2024 15:04:59.3253 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c233880a-7b0f-4c93-9db9-08dcfe746212
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF00000207.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7304
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

v2: split original single patch into two
v3: rebase against the latest code

Fangzhi Zuo (2):
  drm/display/dsc: Refactor DRM MST DSC Determination Policy
  drm/display/dsc: MST DSC Interface Change

 .../amd/display/amdgpu_dm/amdgpu_dm_debugfs.c |   2 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c |  20 +-
 .../display/amdgpu_dm/amdgpu_dm_mst_types.c   |  28 +-
 drivers/gpu/drm/display/drm_dp_mst_topology.c | 258 ++++++++----------
 drivers/gpu/drm/i915/display/intel_dp.c       |   2 +-
 drivers/gpu/drm/i915/display/intel_dp_mst.c   |   3 +-
 include/drm/display/drm_dp_mst_helper.h       |   9 +-
 7 files changed, 144 insertions(+), 178 deletions(-)

-- 
2.43.0

