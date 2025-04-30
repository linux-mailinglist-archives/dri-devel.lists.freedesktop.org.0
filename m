Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C6BDAA405B
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 03:18:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4406E10E64C;
	Wed, 30 Apr 2025 01:18:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="P/O9zf2J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2052.outbound.protection.outlook.com [40.107.243.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E26610E648;
 Wed, 30 Apr 2025 01:18:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x38rqTZJMU5OD+80QmrKFVg+Ge2sIa5AWvTOVCjlCmdLq9vF2aJh4sTKue8qDVyt5npXBBg1dTlxVEUuK1PHiCEedB4GvZnb4mGU2SgPeYmIztatIZbE/SOmnJELdLLed5fcsRegcd/heu7GofRv0fiwDA05nH9pdQzzG8oPpZLbBC8UbznKwde+ZJ2b+BSeJ+Wz0blTxSdhysx+sFaY7T/lDRHAVtLBysb2NaRgUfhL4Vsg7Rs0xoQBGznwQZ+8LoV7x8aTn/rTAwGg2TXFVsEkChanXiHLzoPrLiVPfCXFvqNyZd7ciokvEhD1e52fi5SUHgAXS9C/RpUxGfqdlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aZjcISFDHEz9Gbg2GC3tTxkAKCYWf4N3if92UcIep+A=;
 b=UuBsV94H+Ofa8v7zZCd8rNPhG4QW2aFPpE4FDSrFDz/2hIOuQr5PH9N4vnDX+z/NDvxObfe+nS/KYfgdv9TS5t1fMPYj5quMAr1qhLcfrEmZx3Svb2u3dNtvW+bqXTUjFPCRsrBFh5Cvypq7Sz1mpWVhwgZOsulwXdTbH5KNTzCndkTzcdaNb80BuRfwatwLtvdqaPm15SOE14fNfn0IFDIR1P2Lbq3yhL3YjyIjLhW+NeTyz5v5B79twDNhfChkkHuDH4GLMfK/JUv7l3yfBeyZD0MwfX/hPR7lL6dpox47NKqII6GrNcgvd9mVD6shp0Wgnw647lCgVwyTrTQdnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aZjcISFDHEz9Gbg2GC3tTxkAKCYWf4N3if92UcIep+A=;
 b=P/O9zf2JZ31FjAb3JEfTrn1v0SfWpHfL/G8Dn4MLlY1fyZ1vlHkGTptK3N3vbZuCgMTEtGadlWYuj6toEf/cTt4TKiIG4eThIWcZvEycsVOWvybkq2Pjnt5y/UfnSdc4i8K+48HUbwanFqwcEGq3Jwl+jycpBqcw4vDFlGzfIE0=
Received: from MN0P223CA0025.NAMP223.PROD.OUTLOOK.COM (2603:10b6:208:52b::20)
 by SN7PR12MB8058.namprd12.prod.outlook.com (2603:10b6:806:348::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.31; Wed, 30 Apr
 2025 01:18:02 +0000
Received: from BN2PEPF000055DC.namprd21.prod.outlook.com
 (2603:10b6:208:52b:cafe::81) by MN0P223CA0025.outlook.office365.com
 (2603:10b6:208:52b::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.38 via Frontend Transport; Wed,
 30 Apr 2025 01:18:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000055DC.mail.protection.outlook.com (10.167.245.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.2 via Frontend Transport; Wed, 30 Apr 2025 01:18:02 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 29 Apr
 2025 20:17:59 -0500
From: Alex Hung <alex.hung@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, <harry.wentland@amd.com>,
 <alex.hung@amd.com>, <leo.liu@amd.com>, <ville.syrjala@linux.intel.com>,
 <pekka.paalanen@collabora.com>, <contact@emersion.fr>, <mwen@igalia.com>,
 <jadahl@redhat.com>, <sebastian.wick@redhat.com>, <shashank.sharma@amd.com>,
 <agoins@nvidia.com>, <joshua@froggi.es>, <mdaenzer@redhat.com>,
 <aleixpol@kde.org>, <xaver.hugl@gmail.com>, <victoria@system76.com>,
 <daniel@ffwll.ch>, <uma.shankar@intel.com>, <quic_naseer@quicinc.com>,
 <quic_cbraga@quicinc.com>, <quic_abhinavk@quicinc.com>, <marcan@marcan.st>,
 <Liviu.Dudau@arm.com>, <sashamcintosh@google.com>,
 <chaitanya.kumar.borah@intel.com>, <louis.chauvet@bootlin.com>, Daniel Stone
 <daniels@collabora.com>
Subject: [PATCH V9 25/43] drm/amd/display: Skip color pipeline initialization
 for cursor plane
Date: Tue, 29 Apr 2025 19:10:55 -0600
Message-ID: <20250430011115.223996-26-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250430011115.223996-1-alex.hung@amd.com>
References: <20250430011115.223996-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DC:EE_|SN7PR12MB8058:EE_
X-MS-Office365-Filtering-Correlation-Id: 49fa8ef7-cf27-44f8-9f1b-08dd8784da60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|7416014|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?bZ3gB25wDHwXJaCgznHfZj9Fiuufcg59fOx4TNL+/092zhEv8FEu44ndJUFK?=
 =?us-ascii?Q?kYnIPMAihWrjHwfWWYwwb05iTw53kBt5p4Drjdan5mRHC1ZrEchZ0IYcL47i?=
 =?us-ascii?Q?sxNLOHRbz5PB6f2t0gLyD8Nfw5oq3mj1Intg8pJE1JvSZR3yDSaQVPcgjcqe?=
 =?us-ascii?Q?5QHf1JkAzVonOZpdVE/bHPxoFrN16OPxjj4iLoPYVLm87FyDqIyqp4H70S5b?=
 =?us-ascii?Q?Pr6YEhsVMhJOhuxJsRr1coVbTrrMfwiKdw15IItb18AA4JfqeLlmmc48dlim?=
 =?us-ascii?Q?X2S1aohZoMcRHvEx2i1brROWiYz67A8Y6WvxdvHzOZ08TAAO4GmPS7xw9ZWy?=
 =?us-ascii?Q?BQlNvLEzkA1jzIDpwBKqoT2qwHeePCZvDpGYbuzHnwdT0LLK6tdyIN8/GnB6?=
 =?us-ascii?Q?pHFvYLt/v9GKofgTTk/42BiAHcZEvtoF3H3G857RVDZ1/ZLG5T2NDvSU3bvg?=
 =?us-ascii?Q?i2gpDuxGXqLR2EEook905h7sUGdHJCdEDJeMNerJNANx+Paw/uJb7vkldnSK?=
 =?us-ascii?Q?DNbD8SUwalhSP6p1aunGyXmJilp/sX7Pe7OT8iyti5iapJ5X1RZBLRG8cZjC?=
 =?us-ascii?Q?2WiwDChHvXTo0z+viyHbviXOhXXaL1gBdVsxx3CjLxi932bgS2+9bUSGAzSq?=
 =?us-ascii?Q?qR0I60Dd0KJLL3oAYBQ2D3Y6Ljog9ZMSo5T4eB59WsKQr42TtoVO1ScukuFG?=
 =?us-ascii?Q?/Io9oTCLG2AaP5WJ5hIP00NfSHvKrN5mdC0S6WU81GMuauGK1ro577Uwy/KC?=
 =?us-ascii?Q?ZNU9Qxrrep8eKRVLiJ3jX9OZcFgj+CYjdzhw2oLq8B1ILzr/BI+8cwF0y6ZO?=
 =?us-ascii?Q?0uSSYzrLPhNmgH6MxlR0t636t801ojbAQOVdJXyCuVYLlzTLmVSO5AtRiPXw?=
 =?us-ascii?Q?DHTo7ESabfn+WaVdbTl9Hs7kYZX2iUD0W256GsfIPkGBDq+6mRRBIrHieoXK?=
 =?us-ascii?Q?H5qefFl/RktxTADcfJowuudkek6r/Z4vtpBRacmnZkSYrSRlfr4NdnXxnLn1?=
 =?us-ascii?Q?YYhObbxq4um5ByoQ/Ucdgzuy34Gu1KiJwOZ7xaujniW+VkMlXqJTb0UVjNI8?=
 =?us-ascii?Q?/r6mHXxDuzcrdzxxfVUsQl9r4NqDmh5GJfjrYx/uxyqpOVS2Hi2MRmKn4Ef7?=
 =?us-ascii?Q?3atkUAkbE+KLM2O+3zgmLbZBheCqSQlfSRtxfGHue/MvnRZoep51tzpOJXIX?=
 =?us-ascii?Q?+AUJQf0NkM4Nji/+OQZyXhmhXli5WZekslj6LtL4lqagl9L+KxGTihJgdI8/?=
 =?us-ascii?Q?yJO9N/mNYRw6XdEtoSI1Z6/JGHW/JyyhakqOnX2dUiLdanOxKhJp8x00AGpG?=
 =?us-ascii?Q?LNbZXRwcF3mziXLS59g8Su/le0MM6j6x3OSqB3G8jIKQJLuA5lHnYEqxII5o?=
 =?us-ascii?Q?1yToYP0n7TCJ4HS30iAutuhtcqJXjla76SF+/+ADCAwDFL+FnMh8Npjqgfma?=
 =?us-ascii?Q?Wm9WIkW7szRdBAlDRAqsnGbyTd3Aqk1HSfX12RJoqJuiTBbQ8tcf53XT1CwH?=
 =?us-ascii?Q?1l7eIn89dTTCvqgj9fZ6Dxff3KJV4UdxT+B/?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(7416014)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 01:18:02.5401 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 49fa8ef7-cf27-44f8-9f1b-08dd8784da60
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000055DC.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8058
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

cursor plane does not need to have color pipeline.

Signed-off-by: Alex Hung <alex.hung@amd.com>
Reviewed-by: Daniel Stone <daniels@collabora.com>
---
v7:
 - Add a commit messages

 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
index fb6f07603050..feb4b99bf629 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
@@ -1792,6 +1792,9 @@ dm_plane_init_colorops(struct drm_plane *plane)
 	struct drm_prop_enum_list pipelines[MAX_COLOR_PIPELINES];
 	int len = 0;
 
+	if (plane->type == DRM_PLANE_TYPE_CURSOR)
+		return 0;
+
 	/* Create COLOR_PIPELINE property and attach */
 	drm_plane_create_color_pipeline_property(plane, pipelines, len);
 
-- 
2.43.0

