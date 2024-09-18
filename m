Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AB6097C175
	for <lists+dri-devel@lfdr.de>; Wed, 18 Sep 2024 23:39:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D57E10E64E;
	Wed, 18 Sep 2024 21:39:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="h3j3EYjW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2075.outbound.protection.outlook.com [40.107.212.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A43C10E649;
 Wed, 18 Sep 2024 21:39:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=awSAEkkbc+m/NZkDfnR/m3J8dq5r9u1+EWrollAhhutjjHDq2h/sRXNussrUbnNuFyFu6Qw09NugGYGckf6RfthT/L455CbjuBZkdkPJh92yVKNxsQu+YOLaLdOVJyUQ2mWKvLQem+lO8MroLcWIIOzMAqRfFxWqo9jNDuRxb/KeUkMjqmpJDvH4WNzDeLA9FqFAgH3BerfB6SyrTzlcFOBhmwqLw1K6Zrwcvk5x/95o18xSdhyg+DIqCQNxmm7ABiUH+nkhUsy/A+4cmpPboRxNymTPpLSjbjySSB8cpxOV4P11z6WDFSAxMP0USZTc0YaMJPwnWiusQ3a9lOTyJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kjOV2JBhDTzkzHL6x5LOZ+myPhUZ2zm+dUvayAMEqQY=;
 b=QHlVSHMeQ3DCNPa1ihae5PMhX35KdKlO0XomP0J4MGEEOHdl7zfSWXROJTpmyjYdz7ZZFfYHlBYot2RrlLE54+tYKElxOVNk1jGzI6qZ26LeTL8Bb+UvvvSB8i5RBn9wXeZBLsiK34X8zsbZ8ObdDkmO8wdnJirQr4S1H2gEw9Do8ZTbQk9g+5B7+lTgmVcKTfeFAhMczXVEjJtNGgNimMTQSRpLtFvkPj+qN/iRLmdRgxfw+zmQ7Lg0Mzher+cN71rcPWyTbY3irehsUoBbiDmLeTMP4XWC4vYJS2Q92JlBFFeRkbIeFcvJY2daz4w6I3l/ZVFnBEOZ0spdsAJ39A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=igalia.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kjOV2JBhDTzkzHL6x5LOZ+myPhUZ2zm+dUvayAMEqQY=;
 b=h3j3EYjWnv2FjPMHTZa7BOGOUMwoVUuPTHUkoNRxxUpydv67pgZt95rFufhHXt7VEQu51CA1m93Wqa7SaCzaMpul6lJsmsDaYRi3MnTp0mzEO1BX920PLeAE7+2yknkxPHnr2lnaoWEGIdsfwhkOIR6Pr2mVK4UhEAkYXwrb9L8=
Received: from SN6PR01CA0030.prod.exchangelabs.com (2603:10b6:805:b6::43) by
 MN6PR12MB8541.namprd12.prod.outlook.com (2603:10b6:208:47a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.24; Wed, 18 Sep
 2024 21:39:14 +0000
Received: from SA2PEPF000015C7.namprd03.prod.outlook.com
 (2603:10b6:805:b6:cafe::eb) by SN6PR01CA0030.outlook.office365.com
 (2603:10b6:805:b6::43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.30 via Frontend
 Transport; Wed, 18 Sep 2024 21:39:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF000015C7.mail.protection.outlook.com (10.167.241.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Wed, 18 Sep 2024 21:39:12 +0000
Received: from AUS-P9-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 18 Sep
 2024 16:39:11 -0500
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Hung <alex.hung@amd.com>, Alexander Deucher
 <alexander.deucher@amd.com>, Melissa Wen <mwen@igalia.com>
CC: <kernel-dev@igalia.com>, <amd-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <harry.wentland@amd.com>,
 <sunpeng.li@amd.com>, Mark Pearson <mpearson-lenovo@squebb.ca>, "Mario
 Limonciello" <mario.limonciello@amd.com>
Subject: [PATCH v7 02/10] drm/amd/display: switch to setting physical address
 directly
Date: Wed, 18 Sep 2024 16:38:37 -0500
Message-ID: <20240918213845.158293-3-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240918213845.158293-1-mario.limonciello@amd.com>
References: <20240918213845.158293-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C7:EE_|MN6PR12MB8541:EE_
X-MS-Office365-Filtering-Correlation-Id: 89bb2fbd-6d92-4751-e806-08dcd82a5673
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6OsINQcVh2OETMtUx1IMDxI7aN08zmDjLFAhw8Vc3aRVl2NfSo73GvcCrdkm?=
 =?us-ascii?Q?htkym3OVylTZlnVTQrYmbTh+CKseTVU9PueBgAIEt5HqGjnQPIWJkj463Ddu?=
 =?us-ascii?Q?aRATMdduqtTZ8co4qFcR7LnJZ2ks0Qk/ELBzW2Jm/H5Y2F3/x8knEAtVegFG?=
 =?us-ascii?Q?wJhdqVaYp9ZR20PttZU4m95xCxxDJOuysbl5sedpgUekcUTm92wjz9Yx6WWQ?=
 =?us-ascii?Q?mz3kdb+d6XCqv+38nF+/2ycaH6BCfTt5vz8HRJa9K4nMWsgu9KgCGfvarptl?=
 =?us-ascii?Q?jVO9aw90d7Py1f8NPG6Q+QPGas2qcEcZGBY46L94jeur/ZiLiTxZrZTI+Kcn?=
 =?us-ascii?Q?0C7CIRmkKwN0QLnkIqcFA6P3/KQfunIJV9uXMPw5qGuUwnhN1rGWYtwpynqx?=
 =?us-ascii?Q?gy2qdTnMhHBMbGC4KlH0IZcUTU7VF36P7u6y2errm3rylcJ3tW++RL80ZVLN?=
 =?us-ascii?Q?W0S8aCJZRXdRdkwu3ucabVJ+TXzWb4gM5FK2TkgIMeUM0KjTrj5ZVIgmuyo/?=
 =?us-ascii?Q?k09CXucLHtxlcTav+YL6mzmudnA0TipZ/36cUYjtkgW7M1kCR6jxV76w0HWY?=
 =?us-ascii?Q?ITSj4fZTdmpmHcdghCA9J/vtXktpk67ICXcRns+BCsSEKihFhYrcOMXdGcWO?=
 =?us-ascii?Q?CCLCIfR/RPRJCdZONbUbDHE6ixk33Ye6onIChyHWi13xolXIPOj6oQsYr54c?=
 =?us-ascii?Q?M75iTfx2dRYQj26E9UThnoEcW9xFtqdb9nWUnmIgCQJUMSScJcbUFYQ2najI?=
 =?us-ascii?Q?oaQmQeP8wupPGJses3JC9ClVOSOt0cOIXvTXw6fycsLr2NoHnaCDI/6thKOI?=
 =?us-ascii?Q?9pajNhNOUb/wfTyXpVBWpbNlZfcaiP/Pfkn/2xBtlUVPCiDrzZxLmLjpB06M?=
 =?us-ascii?Q?gWYQzRJl822TwxSX4nrChhjqYhX0gUSQNn4/QX791Susc/aGGaIwUmEm7m2r?=
 =?us-ascii?Q?etJqW1fanPUDViIqx/T3jvpfdCqJbpxJVJA5NJFfSRoxoZQ/xUb1npKoe/5M?=
 =?us-ascii?Q?7oa1nIjmAw4eTiEkli2+W9AAIJE8Z2bWr11d5O/9Ifgp2zj0mKcLQodSTSay?=
 =?us-ascii?Q?tq23Y6sTtWfpljmd9jcIgv58ICicTDlOoDFQIi7x/Ni9c/m1P4tiLcOQRp9g?=
 =?us-ascii?Q?BSiiV+48kbyO1wNITndz5FksiFlrTICOp6m14eeJbyF5XZDaEr5LUcWdM7/l?=
 =?us-ascii?Q?bkCCYkR3ztQedmbf4Ia50Aj5XY043h+7MdQvo6jqjMXxSMpS6YSuhwBp1hTl?=
 =?us-ascii?Q?gfwuVcoxosu6VBIO6B75ZqZSEugw8gSlLQANXMtWuKzhHL8u5Qe8cOeWms+R?=
 =?us-ascii?Q?iSxtnW32M5E1OYDFMTBSZ4wDkU/kL4kkQyaxkd7oCo90bL0B8RArcacMLnTl?=
 =?us-ascii?Q?enXxxOVQQzbtmcmQChgselOaYrVX9rJE/Mxi2EpjB+woXPoYxfYaqDMYhFdN?=
 =?us-ascii?Q?lHaWa1/2rBHjW2KcLEHWnhwMGISrYkTa?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2024 21:39:12.9492 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 89bb2fbd-6d92-4751-e806-08dcd82a5673
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF000015C7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8541
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

From: Melissa Wen <mwen@igalia.com>

Connectors have source physical address available in display
info. Use drm_dp_cec_attach() to use it instead of parsing the EDID
again.

Signed-off-by: Melissa Wen <mwen@igalia.com>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index b7d93787667c..0b6c936be7a6 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -3548,8 +3548,7 @@ void amdgpu_dm_update_connector_after_detect(
 		if (sink->dc_edid.length == 0) {
 			aconnector->drm_edid = NULL;
 			if (aconnector->dc_link->aux_mode) {
-				drm_dp_cec_unset_edid(
-					&aconnector->dm_dp_aux.aux);
+				drm_dp_cec_unset_edid(&aconnector->dm_dp_aux.aux);
 			}
 		} else {
 			const struct edid *edid = (const struct edid *)sink->dc_edid.raw_edid;
@@ -3558,7 +3557,8 @@ void amdgpu_dm_update_connector_after_detect(
 			drm_edid_connector_update(connector, aconnector->drm_edid);
 
 			if (aconnector->dc_link->aux_mode)
-				drm_dp_cec_set_edid(&aconnector->dm_dp_aux.aux, edid);
+				drm_dp_cec_attach(&aconnector->dm_dp_aux.aux,
+						  connector->display_info.source_physical_address);
 		}
 
 		if (!aconnector->timing_requested) {
-- 
2.34.1

