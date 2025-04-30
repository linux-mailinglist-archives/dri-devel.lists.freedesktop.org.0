Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0174EAA4055
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 03:17:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA36210E661;
	Wed, 30 Apr 2025 01:17:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="lOmnEoPQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2042.outbound.protection.outlook.com [40.107.93.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69FF210E668;
 Wed, 30 Apr 2025 01:17:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Waqzq9K0Zir2r63U0zII7ZXop1nyigD7RXcUsTw0u/9QcO1CCynnlC3iPxOG8TjTjaBXNxTn7cyLAamKJH6Gkri3gICuZHxH730DAxSEwDMYkVfqEq9EpQg7kAK5UteTOS7M0wF95KIEqCHTy/PiatJcMjbxQFeW4ct+Qhbfp4XF3ts5aZnFv9pSu6+nkOyzbs2rs05x0y9XRf+CqQ0WtGluBpwm9epRkBnKhRA/trV/pn2KE/YDivEAN2X8a39AQiUWmmTEG37OEflGUua0tKhdz2OSiCUqkG1F62WDLsQpDPH2PJ3dfh3YR8NqS/iBx60M7BqcjEqiC1l6jCgpJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8GiwEaNqkI5RIFEBOy2CSHbfrTg47fv3n9Z2z5KVUv0=;
 b=OYpRBpnY4mTR6npFJ66JvtrYCLEzyrWxcyg38rjTQZrkOCnbncDPjHF0bLSugbpTJmnUQeDgTHO3Oi/lvzbldgu1yA14DCNYE3eVQfpmxhM0elNl4Iw5COtCrs3DoTYGF5HLGIpZsi33pGJIBCmPtkZGKOOCNR+Ty9++61iVQj9e5SPvaViDVcWRZbp4jPqaiJCZf/fSclHjsjRAgeVU/PQHia52aYp4Z/IezbZaLyaCpKiPdc3Ar/Jzt+f1dNCwmJ7rAf1hGBPPcYnGNKaRzmTCEKm/pl04YAsEyW/K/R53JgOWMOgX8ZD9sPkz2hav5/CVtT+Nqo2L8Hw0bf8kpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8GiwEaNqkI5RIFEBOy2CSHbfrTg47fv3n9Z2z5KVUv0=;
 b=lOmnEoPQiV+a9Iqw0CKv209tRJ2dDC0Z5lv85vHrre/ex+ScI0KnI48PQFGUdNcrRadFUPbQP7ISVPYuAggFsOcqdpuIDchbOadgc4X/uo+95qUVeNdLZdsl331AOqv8/hiwOCXGswl+F/j//fog9BIXENRJd4r3xFbifYG7NwM=
Received: from BN0PR04CA0154.namprd04.prod.outlook.com (2603:10b6:408:eb::9)
 by MN6PR12MB8491.namprd12.prod.outlook.com (2603:10b6:208:46f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Wed, 30 Apr
 2025 01:17:18 +0000
Received: from BN2PEPF000055DD.namprd21.prod.outlook.com
 (2603:10b6:408:eb:cafe::94) by BN0PR04CA0154.outlook.office365.com
 (2603:10b6:408:eb::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.35 via Frontend Transport; Wed,
 30 Apr 2025 01:17:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000055DD.mail.protection.outlook.com (10.167.245.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.2 via Frontend Transport; Wed, 30 Apr 2025 01:17:18 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 29 Apr
 2025 20:17:15 -0500
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
Subject: [PATCH V9 22/43] drm/colorop: define a new macro
 for_each_new_colorop_in_state
Date: Tue, 29 Apr 2025 19:10:52 -0600
Message-ID: <20250430011115.223996-23-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DD:EE_|MN6PR12MB8491:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f5458fe-f2fb-4e3b-08cd-08dd8784c04c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|376014|7416014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hK/JQapLgWNlb6Bl8OP4FFIKbmI07XbwZa1lUxm6fwybVQ+F/pesh10XbYyF?=
 =?us-ascii?Q?opsA2TfVewAXt4tuD9sCAnfyH/xEXC7c/ZPdF5jemgZSWsXAQx/tJDFMuMvy?=
 =?us-ascii?Q?L7fHWV75LgbpIaH+MnJPtFwBVsFYOJuKaK2vzWLdUMQ3qrnWGP0+usLfPYkn?=
 =?us-ascii?Q?o0mMGOvfYBknVS7n8aZ3YrYkvHvaHNyjN8ui9M+TRT6/MjGDV3hRS9PhrbbR?=
 =?us-ascii?Q?54tzr9eBnopIjE/+JZ8rN6m5ub9e/S3Fvqv3mFGkTU9PmJ9M2HJN693UbxGJ?=
 =?us-ascii?Q?y754U3A5RWLoP5LqimQ8fkExIJIiUvJU0OIEk4HdvdWJCEGKn82utW02B9FE?=
 =?us-ascii?Q?ch735aehZDTXzUjRz2UqTaGaTq4gzN/fw5u9GXqfhjc2J62/Lgr+XogHGaRO?=
 =?us-ascii?Q?5yKIlVpSgv6Q4613EX4WvXS6nGSwXb7mv3OGS2UZa2JD1ELoXBnUvfZjVqso?=
 =?us-ascii?Q?3Wpa0fkw+630QiEnOKx015P7hvUsr7O5V85dBsmrsVd1Vz0FLQIVuyy+WpRP?=
 =?us-ascii?Q?QaJWbSogPQKzjVTGk5Cbzo7DC1KfTUEVjQXoMIvizlreIP3yM6PHYodkrxnt?=
 =?us-ascii?Q?2C/ASyJHqjIq1Mr2H3nwtI7r3xW7vwwHOywd4iEVPcZ2q/oscwDBC6k9HSws?=
 =?us-ascii?Q?fCHvjW8k7FDhiRSrDevRmB8FkBMJVosZSddBqFo/Sz0jEEN0sghOF84hKeez?=
 =?us-ascii?Q?OXfdZRFfG0jJhXY1f6LceNjsxHaHo8lI43ikP6RevPvsk8gkNUmJq+sbTZHa?=
 =?us-ascii?Q?oQvuECO4GVSfM/yIV3srUGyZU1Jvsoa/VMbgjUe7y9+TXVX9G3P1GjjHPzRe?=
 =?us-ascii?Q?5XXIEaFShmPk4SuQdRwv4rxReGwu0Oey2u3+xnhnEdqjv4/KoFuggkkkTted?=
 =?us-ascii?Q?TPjpZS3o4FzRsWQjzAGjT0StL3y3Qw+7YgVrlsFgyy6j22Io6ldfoQfnoR4W?=
 =?us-ascii?Q?YIRyh9h8sDXjw5DVG2zmzhHuJKBD0LBMsR+8szKeDS/t4OqJyyipZHsRxeYX?=
 =?us-ascii?Q?hc2uhQxB3eXdu2j8Wh8Hcfudx3wVtkCwnH0Ib1Pxihr+2yGa/UPvV7q4TvO9?=
 =?us-ascii?Q?U2BOt1bk5BjUIRecA2zu4ftAqZittSY2ZKET+IGzxpyQFqU1u8FERx7UIj7j?=
 =?us-ascii?Q?fpi+KDc8La3s0SF4yvRXgCnsBtpENSpXlAHXkUF6Vub06mfD3vvQuw005rtV?=
 =?us-ascii?Q?V1UVIgPEsia/iNZW1WofOOzMG5ximkbzjT+6WFyOnr+4Cs++42XiC5XwPNlv?=
 =?us-ascii?Q?ANqs8P3xN0ftrr3t+OjZvlZSAndZtdMf6ooRfFPy5Yt6ehqPnWRiQWhm7z0k?=
 =?us-ascii?Q?prYs6I6d5G962S3ZG8knJMsV5hsqinP+AMPSfo2qYbOWhhWNYiZpHunTnKiZ?=
 =?us-ascii?Q?Xx/suIN8gNOE+SBBiNvLh3W00nGLIuyA+WHG835zLh/gvAAuv2MmG+ivNXyZ?=
 =?us-ascii?Q?3PEd/3F7BLYZ3BgCfR+TxfwJC2GwxXRXFkYZO/KqL+igwdjMrn0Iv+G0F0E7?=
 =?us-ascii?Q?3BCWD47N+GHB7baeMzH9hhOwAouxEcIpp0vx?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(376014)(7416014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 01:17:18.7851 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f5458fe-f2fb-4e3b-08cd-08dd8784c04c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000055DD.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8491
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

Create a new macro for_each_new_colorop_in_state to access new
drm_colorop_state updated from uapi.

Reviewed-by: Simon Ser <contact@emersion.fr>
Signed-off-by: Alex Hung <alex.hung@amd.com>
Reviewed-by: Daniel Stone <daniels@collabora.com>
---
 include/drm/drm_atomic.h | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
index 4a30ed8ab1a8..4b3bd459a1eb 100644
--- a/include/drm/drm_atomic.h
+++ b/include/drm/drm_atomic.h
@@ -1069,6 +1069,26 @@ void drm_state_dump(struct drm_device *dev, struct drm_printer *p);
 			      (new_colorop_state) = (__state)->colorops[__i].new_state, 1))
 
 
+/**
+ * for_each_new_colorop_in_state - iterate over all colorops in an atomic update
+ * @__state: &struct drm_atomic_state pointer
+ * @colorop: &struct drm_colorop iteration cursor
+ * @new_colorop_state: &struct drm_colorop_state iteration cursor for the new state
+ * @__i: int iteration cursor, for macro-internal use
+ *
+ * This iterates over all colorops in an atomic update, tracking new state. This is
+ * useful is useful in places where the state delta needs to be considered, for
+ * example in atomic check functions.
+ */
+#define for_each_new_colorop_in_state(__state, colorop, new_colorop_state, __i) \
+	for ((__i) = 0;							\
+	     (__i) < (__state)->dev->mode_config.num_colorop;	\
+	     (__i)++)							\
+		for_each_if ((__state)->colorops[__i].ptr &&		\
+			     ((colorop) = (__state)->colorops[__i].ptr,	\
+			      (void)(colorop) /* Only to avoid unused-but-set-variable warning */, \
+			      (new_colorop_state) = (__state)->colorops[__i].new_state, 1))
+
 /**
  * for_each_oldnew_plane_in_state - iterate over all planes in an atomic update
  * @__state: &struct drm_atomic_state pointer
-- 
2.43.0

