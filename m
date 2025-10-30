Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6B38C1E4C1
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 04:54:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A5AA10E955;
	Thu, 30 Oct 2025 03:54:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="0R1mxykN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013034.outbound.protection.outlook.com
 [40.93.196.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5076210E955;
 Thu, 30 Oct 2025 03:54:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y6m8mY9HDsOwiDSywMUpMdI7pBi1Wyq1yF7LB+3Kc8+L6uoqob1aVk1gGOwLD4xaZ4+mUuVk1sQtxPDZix3NQmsMrGE6MFmdLAp48SjGZa7xcU19NayK2fWeXJaRIVCa01S1NlNEFF1C2dBJNJgPka1r0QmvgXe7ZuOIybLgC4NpCiP03aI84jpBAWD/PYV8ILetw9Pzis3oMd9LqO8MRI6O0GDF/nAMHWtF1JYBP0wV1UBkOcxFgLk+14chJ3D6JAj95PDWARuXfMFB04fFxOvibW4PJx7M9ng9X0ldXh682tE8xQ8Rv1ULpWiF+2cfpxUxryB03bb+WEOvTR1JYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=emZZO5qokimuOTJTuWIFaHPV0XKNSv6+yW8LAN4t86I=;
 b=Ada3G4ssIT8qICgoMwiiV9mnjn8vsSZ4/J6A2wT4Rd8tEQN3NfX/HfFK74snkVZA3chtud/x59HY3TFOpo5mj0ABf20j9j4x+uBCB1XnbNdDXgsetIjd6ELTkZdKCXzzaehkLAVnwcfPYwZdAZ/4yjGC6UJjWpLEfwM64X9SSPu6ZVeogKO7XytfSXrwaq1za1KQjI/bzJH1hKxLM3hHV705FjSF6MZ2OPwq3UlW7TOubTtiVQdJq4Cz4xxLqomh4rp50s6COb+a6wRvCxcGEdUFJN0v9+9/5uaR8fUCL5Zjk/80IvdL8jdBFR8CJuFZch3eBRPB55k1j4Mtnoejow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=emZZO5qokimuOTJTuWIFaHPV0XKNSv6+yW8LAN4t86I=;
 b=0R1mxykN4FrpGq0S5zIC/oF2RcrPPk8cp5+9JMN5KqCdxdWxzHij3MUZzEuNfQszguhTmpsLHbcTNjIQrevNkvhvbXzmN2LruqURy7Ju09cJsNi+GaMdiVBFrRSoRO1TPK7iNO6J65juef2Mtze9sBiKU7bw5n1xuBq7vdfj3+0=
Received: from BL1P223CA0002.NAMP223.PROD.OUTLOOK.COM (2603:10b6:208:2c4::7)
 by MW4PR12MB7166.namprd12.prod.outlook.com (2603:10b6:303:224::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Thu, 30 Oct
 2025 03:54:44 +0000
Received: from MN1PEPF0000ECD7.namprd02.prod.outlook.com
 (2603:10b6:208:2c4:cafe::ea) by BL1P223CA0002.outlook.office365.com
 (2603:10b6:208:2c4::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.14 via Frontend Transport; Thu,
 30 Oct 2025 03:54:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MN1PEPF0000ECD7.mail.protection.outlook.com (10.167.242.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Thu, 30 Oct 2025 03:54:43 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 29 Oct
 2025 20:54:40 -0700
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
 <chaitanya.kumar.borah@intel.com>, <louis.chauvet@bootlin.com>,
 <mcanal@igalia.com>, <nfraprado@collabora.com>, <arthurgrillo@riseup.net>,
 Daniel Stone <daniels@collabora.com>
Subject: [PATCH V12 40/49] drm/amd/display: Swap matrix and multiplier
Date: Wed, 29 Oct 2025 21:42:45 -0600
Message-ID: <20251030034349.2309829-41-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251030034349.2309829-1-alex.hung@amd.com>
References: <20251030034349.2309829-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD7:EE_|MW4PR12MB7166:EE_
X-MS-Office365-Filtering-Correlation-Id: aa84c8c3-554d-4f12-0a3a-08de17680f98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|7416014|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?csgvKT4I1CjVLlZ0i9Sc/08+bHn752x2rfVD/IF/TAeQloRfaIkbGXIMaW3I?=
 =?us-ascii?Q?eRF3yB/FErVHWKOP6M7ZwoqKW7ET8tkZ2xWKM+8uKvRyYXQMSMWYHXOhbiqe?=
 =?us-ascii?Q?zLVianlwYwfBVljPyLi0Qt7tcuHVhMjUYZImMkNhgmVJO+FaO7spnJ4hARq7?=
 =?us-ascii?Q?btssfPkNrI/lkFg8lUv9ZW8NeLECawosLV1380RQbJYnNA3MN2UbfNDSuZ+T?=
 =?us-ascii?Q?eS5g3Pqp2mMTvbWXYg8lWOrsimAmphKc28zsN8gYD7Phs/w57bt7agGIgr/7?=
 =?us-ascii?Q?Dj3hbebXX+wTJ4T6jwPQP2RuuhKvrBqPGCA4HCoELGPq+FHENqXBnGUFAL2g?=
 =?us-ascii?Q?mXIYRI3EWJLJf5tv9zwcx6LkUxZfIQNtm2SFz8aEf83XKfbR+m7GcShZih5i?=
 =?us-ascii?Q?HNMZ3wXPIeNfhYyDE4Aatu7WcMSa2ixXWpIiTXfcP/GLNMbdpqmoOYT+SbPj?=
 =?us-ascii?Q?JCtkMHb/tlJbMmpwGS+BitZJOSOT5PaOAJ5YXsKoEi1WSUyxGmrYbufiGzsK?=
 =?us-ascii?Q?INRzBEjmgc09cMKmCdEF37rU+o+ok3C19iI5ascnl0LDEgIGlPq9zMVGJ/xE?=
 =?us-ascii?Q?jy05ivvAz2QOi70wRP8mV0wJHRjQTDdw8zLXW7sOGP0EVlmrBpGLJvtBfLvP?=
 =?us-ascii?Q?gaSLgRxwJQTo74Mprj7/J4o3aFAlQR/CojjCHO4jlTGnMqM6M3qaDQWNJHn6?=
 =?us-ascii?Q?wcy83DYg06ZX4DeJzivITOnZSG+xvlY5AwjuwHAPsrCAoHyQ23UqeoIJHXZe?=
 =?us-ascii?Q?5uEqSWc8LvGVewUcJaKQarDCmm5fkQgzfumIZRAUEl/H8pZ71ZPTaNcicVDf?=
 =?us-ascii?Q?QzRwQEOxYhAFPcHaJCZY/RwrYXwAeKhBCEgFusWqxAsBLgGARiPXD3/w25mX?=
 =?us-ascii?Q?V09SJWzttuznUqem/NhQFBYCvXY4vSImzjxFtn/XYVfcENkkoKRZyXb6MRap?=
 =?us-ascii?Q?+zYFeQ327kvIySO7f1olZEvILyD7JhvpUDkxwluzTS61p0B1WWIrGFJoNzeg?=
 =?us-ascii?Q?uOX65+KgNN9drcermbY+QRfJOg+G6G2b4rIhpbpMXsliPwKAJPgOk0RRPpvZ?=
 =?us-ascii?Q?IZHcsECu9le/MR88S/nnFpks3+4+j3D8B5zB/HU6hNMd0poXsqfrk1LAlMv6?=
 =?us-ascii?Q?EvwDA4nwyBg8pnjHS+hEdXG0h2hJGhRLP8MVyWLL2H5XO7eGMliuK1kRCiSG?=
 =?us-ascii?Q?x5le4nuzKW1S9mKt0AQFZp+2LJv9cEdnSd3vXSy4dlWq1LhcVYP0RYzocRtJ?=
 =?us-ascii?Q?aHeWWAyOOc/NwZE/uqp5ibkxZ0+PSrDRjuH8slJsmhx9DKh+inDihy+VyBdE?=
 =?us-ascii?Q?HlFGU09AVVAxNJ7Up9jkVs9vclHEoU5bFm0E6qp0frWLAm2mfZq92oYQvviq?=
 =?us-ascii?Q?jxDkpT82DgPo50rvW7nb2cfwHmdiVwNBnmNczZYyvhU4p/a+GXYbad/9zDPH?=
 =?us-ascii?Q?TYJmQDJW9YZaTTmRRN42lgQ5hfkVgd0e+BmNHQnRkfkpsk0P7pRCKaEwvlee?=
 =?us-ascii?Q?Tdi1OhovGVFEasShJ15bIX5TTOI5Sb9KSwKqkorX5tLOX4ntyEjbkC8laoGu?=
 =?us-ascii?Q?EYsiGexmQdWgrYe8Fhs=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(7416014)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 03:54:43.8410 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aa84c8c3-554d-4f12-0a3a-08de17680f98
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000ECD7.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7166
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

Swap the order of matrix and multiplier as designed in hardware.

Signed-off-by: Alex Hung <alex.hung@amd.com>
Reviewed-by: Daniel Stone <daniels@collabora.com>
Reviewed-by: Melissa Wen <mwen@igalia.com>
---
v9:
 - Update function names by _plane_ (Chaitanya Kumar Borah)

 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c  | 12 ++++++------
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c    |  8 ++++----
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index 2ec85a830788..5914b5688a8d 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -1651,25 +1651,25 @@ amdgpu_dm_plane_set_colorop_properties(struct drm_plane_state *plane_state,
 	if (ret)
 		return ret;
 
-	/* 3x4 matrix */
+	/* Multiplier */
 	colorop = colorop->next;
 	if (!colorop) {
-		drm_dbg(dev, "no 3x4 matrix colorop found\n");
+		drm_dbg(dev, "no multiplier colorop found\n");
 		return -EINVAL;
 	}
 
-	ret = __set_dm_plane_colorop_3x4_matrix(plane_state, dc_plane_state, colorop);
+	ret = __set_dm_plane_colorop_multiplier(plane_state, dc_plane_state, colorop);
 	if (ret)
 		return ret;
 
-	/* Multiplier */
+	/* 3x4 matrix */
 	colorop = colorop->next;
 	if (!colorop) {
-		drm_dbg(dev, "no multiplier colorop found\n");
+		drm_dbg(dev, "no 3x4 matrix colorop found\n");
 		return -EINVAL;
 	}
 
-	ret = __set_dm_plane_colorop_multiplier(plane_state, dc_plane_state, colorop);
+	ret = __set_dm_plane_colorop_3x4_matrix(plane_state, dc_plane_state, colorop);
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
index 888494d17509..934cbfca0168 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
@@ -74,14 +74,14 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
 
 	i++;
 
-	/* 3x4 matrix */
+	/* Multiplier */
 	ops[i] = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
 	if (!ops[i]) {
 		ret = -ENOMEM;
 		goto cleanup;
 	}
 
-	ret = drm_plane_colorop_ctm_3x4_init(dev, ops[i], plane);
+	ret = drm_plane_colorop_mult_init(dev, ops[i], plane);
 	if (ret)
 		goto cleanup;
 
@@ -89,14 +89,14 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
 
 	i++;
 
-	/* Multiplier */
+	/* 3x4 matrix */
 	ops[i] = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
 	if (!ops[i]) {
 		ret = -ENOMEM;
 		goto cleanup;
 	}
 
-	ret = drm_plane_colorop_mult_init(dev, ops[i], plane);
+	ret = drm_plane_colorop_ctm_3x4_init(dev, ops[i], plane);
 	if (ret)
 		goto cleanup;
 
-- 
2.43.0

