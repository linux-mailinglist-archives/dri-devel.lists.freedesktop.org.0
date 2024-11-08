Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 618279C23D8
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2024 18:45:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C569810EA21;
	Fri,  8 Nov 2024 17:45:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Jf2Qa2om";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2044.outbound.protection.outlook.com [40.107.212.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA3B710E288;
 Fri,  8 Nov 2024 17:45:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q4sf8Ll3wn+7P+Lc/A9zzsfj+mFqi1qzuWU1eP1IDRjlMQTs6Z7zOhvyU5rStzKBmb8GfjGbWDcw0x9nOHlAmEBfXZbGi5xLlEkP25XiIb3TE4BaQZrPFuLcAkw/8NSzswRPbvGNwBu7+ivjS7ue5wmNf0Ufxy0RdyMvrw7+F+6EpORMM6FQPQxI33y0gzki5y3FjNPwsKwPV7HPWuKkJu83LtE1YgS691B5TQaY/jCmSAv9AmzVBIuMoYVwSR2VEQOXJlepLAp5nOm/8qgRjn5TI1GJNEOyYFIL8jfsAjyGcEhYKoPCfQHPVzI0p7HgbNnY8YCYgzjUBzCXHltguQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c0bFn7s5AnztkSml7Mkpgfi+8F/Op/Ne4LzRptz6w0o=;
 b=RLdWACcxv+Qm8JbeiUrbVc8C9V9PDBVFMxXlAKaRzqkFLGFNGQ4m/56YOU1yNxMODuY1cGWK+GVOr+qtwHS0LF0fhiEifj7V+fOF76onn9tntW2OkT28qXCPDeClDg0FIyGNjvA24OlMO+ftWxtSANzmEcXxB+kbFUA+qsLzBwj6G+b6BD0Las7XRlHQlETifNpR5Rwshmd8P4hj3OKiD26U9m4UtVsD5rUHVRzms9CFLZ2uvV3RGMDMMKfgPDNuqsu0xqSPLxSuQrc9PLoSUB2A/bZPN5Pzng0qtstXW2OmkOspKdTEPVB+hEAMhmAg6MZmq63XOrwaTRgqLDRWmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c0bFn7s5AnztkSml7Mkpgfi+8F/Op/Ne4LzRptz6w0o=;
 b=Jf2Qa2omxZYKpdq3fhfjRlUrGOdHdWZqf1lSsQyQSNKFfSGeVdmC0IH6tTCAbxkGEul/KPOeiQUsCU59m1g/uyS93gzrI1S45CkDS5LtBIs92/rhYM+sPy9nlJ6FeLjw2RTsYteGVyexNlI+6bJTY3rHQQS5Mc6HUb3iT7OX+ks=
Received: from MW3PR06CA0003.namprd06.prod.outlook.com (2603:10b6:303:2a::8)
 by DM6PR12MB4204.namprd12.prod.outlook.com (2603:10b6:5:212::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.20; Fri, 8 Nov
 2024 17:45:23 +0000
Received: from SJ1PEPF000023D7.namprd21.prod.outlook.com
 (2603:10b6:303:2a:cafe::d1) by MW3PR06CA0003.outlook.office365.com
 (2603:10b6:303:2a::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.20 via Frontend
 Transport; Fri, 8 Nov 2024 17:45:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ1PEPF000023D7.mail.protection.outlook.com (10.167.244.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8182.1 via Frontend Transport; Fri, 8 Nov 2024 17:45:23 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 8 Nov
 2024 11:45:22 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 8 Nov
 2024 11:45:22 -0600
Received: from jzuo-linux.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 8 Nov 2024 11:45:21 -0600
From: Fangzhi Zuo <Jerry.Zuo@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <lyude@redhat.com>,
 <jani.nikula@intel.com>, <imre.deak@intel.com>, <simona@ffwll.ch>,
 <wayne.lin@amd.com>
CC: <harry.wentland@amd.com>, <rodrigo.siqueira@amd.com>, Fangzhi Zuo
 <Jerry.Zuo@amd.com>
Subject: [PATCH v4 0/2] Refactor MST DSC Determination Policy
Date: Fri, 8 Nov 2024 12:41:57 -0500
Message-ID: <20241108174439.141418-1-Jerry.Zuo@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D7:EE_|DM6PR12MB4204:EE_
X-MS-Office365-Filtering-Correlation-Id: f982194d-e147-407b-43ef-08dd001d1f1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?DmzGYHMbzcuNInux7eb1jFsw7GM7wYqKtIGj1eie89K53xtRfQSItfDzegBX?=
 =?us-ascii?Q?fbXQhPyRDgdg+cPF0U4ZBYNopEbucOkFJRoF02yex+E6r2D97WPB11kFTAW0?=
 =?us-ascii?Q?uQMdCg9J1+vB3qk041HUVvHia6atHRiy6n6bypYlO0kXX8CbPAO6IVxSQiYU?=
 =?us-ascii?Q?VzS+vtVumC5S1iWM0ZXo9p2kdTgJh+q17AShgfUVqD+eIFwoPpoi8pOPZd/9?=
 =?us-ascii?Q?uPano42UVwpZxmvrrq2UAGXYLcaUQKLU1T5WE7vwLSm8lKNj19uvf9It0cGU?=
 =?us-ascii?Q?k5TGZU2jrmQ4+HzbVXDPNW1Xb5m6XT+C5zjwCqVewn2OHQbOAKtJxR+ortd1?=
 =?us-ascii?Q?JWGHDbvmtdu7Bib9ww0gvSg3ZbVXN/WI8C2eKxFGckRuKS21nuFf8dXZGtqC?=
 =?us-ascii?Q?DAiqu/6oAVSNGns7fmTVEQKnIwiPPDM6GOXemfMPgvMgSwB6wRTqSAR9SXJq?=
 =?us-ascii?Q?3SmkP4865CFRTnjmShbgmYFEf6wEcafRiUY4D6IusciZI7rvniLaXz0KB0X+?=
 =?us-ascii?Q?hQz2+HkWYRjsSUnBWbWAd86lx5xwyjZ8+TjE+KXQ4muZ5sS5wRDnIAJhI4R+?=
 =?us-ascii?Q?hczbbxJsNeRkT10ZwbFG1JXgITPNbbrjjVX+ujB07QCo2dvKtSl3Im/Rzdfh?=
 =?us-ascii?Q?8AnFIm3klaI6x4ytq1qhmpveRunYHtd5FH1fw/Hl/WZKtSVPq0woiXO68TbP?=
 =?us-ascii?Q?DVkvl6fefvDYUzgPlimm8Ka2ujg6r1PTjDAViUusrZqmIkwtVXlji24M9SYe?=
 =?us-ascii?Q?PiwgbaBLfY8fdrsscEe9b/dp3feBlWqB14JVU+SJjxzqiYX61m6tYN6NkBM7?=
 =?us-ascii?Q?H6b1lz1eYWz05e9S7RU5O8le1Aw9clLzKuXerQRaqu40ay8Y4Q4novr6x7V1?=
 =?us-ascii?Q?WRODxY/B+o8GDGROj9iOzuJlta7eEM49x8WztbvwOYTCNFUq/3OjB1sFyHFc?=
 =?us-ascii?Q?aidKNWieJYA6OdlakeagCijRARChTQg3N7U8kp+4RemtHLzyZ20rCipY9AaC?=
 =?us-ascii?Q?2CdD6PrwUmmzC6DR7AC8ezYaiBPims+aW1rLXlomnnJgqEosoeR3WBrFFmtm?=
 =?us-ascii?Q?4NiLQzzFuDJXVb/g5xUpwdSiyCUnCt1VPcHje/q1rj5pJ3lpc5EWZ66u5qHT?=
 =?us-ascii?Q?pC8uaIY3tWjVVPmOrrJOCGzCkyvRbuFBdm4F3A917QYeJw3QqgZsH9NlkzqY?=
 =?us-ascii?Q?C4VLWw0Epy3pSRKOZtvRkDfX4pRI6FteL5je70oER+t+1/9cNIb25rc0TulZ?=
 =?us-ascii?Q?G92Il46tETLKd/eQozi1OSlBVY4w0BwciMaYHRU+/9YjEIdJrl0RONKcLwOR?=
 =?us-ascii?Q?7QKqHBPyzHw0WDI2lh1JHipVRuUSwyV6Dd4YN64eBp2SyZe3N3CSSIeey4we?=
 =?us-ascii?Q?cSpcuik=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2024 17:45:23.0691 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f982194d-e147-407b-43ef-08dd001d1f1b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000023D7.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4204
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
v4: fix a ci issue 

Fangzhi Zuo (2):
  drm/display/dsc: Refactor DRM MST DSC Determination Policy
  drm/display/dsc: MST DSC Interface Change

 .../amd/display/amdgpu_dm/amdgpu_dm_debugfs.c |   2 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c |  20 +-
 .../display/amdgpu_dm/amdgpu_dm_mst_types.c   |  28 +-
 drivers/gpu/drm/display/drm_dp_mst_topology.c | 261 ++++++++----------
 drivers/gpu/drm/i915/display/intel_dp.c       |   2 +-
 drivers/gpu/drm/i915/display/intel_dp_mst.c   |   3 +-
 include/drm/display/drm_dp_mst_helper.h       |   9 +-
 7 files changed, 147 insertions(+), 178 deletions(-)

-- 
2.43.0

