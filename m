Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC9BA72778
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 00:54:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA7B610E7EE;
	Wed, 26 Mar 2025 23:54:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="zYKJ9++v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2042.outbound.protection.outlook.com [40.107.101.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B72589261;
 Wed, 26 Mar 2025 23:54:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=amoCCeqdNaMOZN4az41ruLgMcYt00ncnIHIpMemBM0cFkeDmCM+G6fDMIEj0pJN6wmtYsLHDCSifHaDWA6KfouqSgG3h4wSJrybMFVHkpooKC5u9tV3LFb1SeKlYHH9rucUvATatlE3J2AECnry9ylSb3CNz/f5ZVuzqaonZKDQE77lBohq82RQ5eH6xXudgM/DOhuXQQ8FZx71XQY2b3vVAxqetE5q5fdh39AFMq34+Lq/khvyrHCeEm5mMyeA3Q2Ew7Kcuwl0jbWoww6WXiaerCCos1YsRyRoPYj6cpaeFvIDwApZ8EKRPe4y9anOA444OGZR8AMlNgDH+qQMYNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1h87/s7CffN/JJwaNCE30zNqbebAHvW57JDkjFVeIrM=;
 b=xvJrW59mvQD9hs01I+xcIEgkjy+08tpZRGrZEGlPgCbsMUzX18Fw6D0p360DxJR7/w1r0di+BpiHK+qD4+BrGYCYcFIDBiArL5aXWJbgPp6dApJza27bAHHsFdwavssqrb86kctbLhxlqNicXhHobf2Tc8trmTtC4tmAnyez2w5GLMKBmr1EFQfGShbDa66p8o1qUpe2xIW/i5dwjf/9ZaXkOJc09u9/yKCduBKnjPbKmTVNI++gUHwSejE8dEKUQ02nuRp7iUa5b49ChGqH354Xb8rj0gn9J2m1TQMvZZVojyTYQBr10k1hgZa3kVDKwq+awKsBg29JtUOXnde5yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1h87/s7CffN/JJwaNCE30zNqbebAHvW57JDkjFVeIrM=;
 b=zYKJ9++vKS1tLCxxyP+Pkz/CpSNLZQjRfVtqyDUf+LI+5fhyEIKDVV3/0IJyp+LoBieoKgLe2V/g9XKusOI1//pQzbH2sCrMf5RMRnzcq44OyTkKbFL4Q8BmJY2O9R95809/QyZPscCOYc2MVAxg/yqXrvosGgQHS5pBAsO7J90=
Received: from MN2PR13CA0033.namprd13.prod.outlook.com (2603:10b6:208:160::46)
 by PH0PR12MB7472.namprd12.prod.outlook.com (2603:10b6:510:1e9::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Wed, 26 Mar
 2025 23:54:15 +0000
Received: from BL02EPF0001A0FE.namprd03.prod.outlook.com
 (2603:10b6:208:160:cafe::ad) by MN2PR13CA0033.outlook.office365.com
 (2603:10b6:208:160::46) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.42 via Frontend Transport; Wed,
 26 Mar 2025 23:54:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A0FE.mail.protection.outlook.com (10.167.242.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Wed, 26 Mar 2025 23:54:14 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 26 Mar
 2025 18:54:11 -0500
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
 <chaitanya.kumar.borah@intel.com>, <louis.chauvet@bootlin.com>
Subject: [PATCH V8 24/43] drm/amd/display: Skip color pipeline initialization
 for cursor plane
Date: Wed, 26 Mar 2025 17:47:05 -0600
Message-ID: <20250326234748.2982010-25-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250326234748.2982010-1-alex.hung@amd.com>
References: <20250326234748.2982010-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FE:EE_|PH0PR12MB7472:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c8d6eeb-17e4-4c80-5dbf-08dd6cc183a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|7416014|376014|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hlR76tkM3DhQUUUfei0bhkdtCU9qeHiR/7vm5oW4wjm+SkvznRsWC8f6oDGj?=
 =?us-ascii?Q?QaFw3uw5f4fkm3dBo876SgN9j9srsFII4TxS2Z3rvzb1w2V/W26VRbLqsJBK?=
 =?us-ascii?Q?nexRJiuel5RfKxkkFCWPBwyJv18QzKe4zFtaBPkJhliLyWBBj733IlkOjWwZ?=
 =?us-ascii?Q?E7fU3ie0pgwB79w8h9PdVtmMfmyjFaJjB26QhVh3PFHbI1PZf4xvfMgWwYA4?=
 =?us-ascii?Q?m0Lg2pyjd0DVfz8yinFJ6suXTgW6Ros+5M58mfAxpg+j6lN4AV3w99C9agUT?=
 =?us-ascii?Q?T4gK3m8CgPqFYqMIIMNJ5Pmo2JAFqE4TWRFImma6FyTMPnTmRBfTzVjht6J0?=
 =?us-ascii?Q?1LBP9x509El+/NUySsPFALYMPYZvTeQXQQQ7Ayys2Uz6fgam3l/FohoKo3qm?=
 =?us-ascii?Q?tGWVOdTJSdp2Fo3pscQsnScxyHxfw7ZoenH13B4ZW3l2CqHxsE4blG32jRGs?=
 =?us-ascii?Q?SYJlFTX5UXhm31GpeNV44Fjk4WBZugkcSojUDmtsfEkOtlIT3RwNqZx24EI3?=
 =?us-ascii?Q?jxD5sTMpb7OIj7UdvFfcYXQ6BUX9cbJ4fnQrZ0HH9sSGKry3GkdXKVEeaW5j?=
 =?us-ascii?Q?rVjSRFyLhhRDI47ysnp7GSPCtAkwSnwjwgL7xrHHUOKzqkivIi8ma2w/Kspu?=
 =?us-ascii?Q?8G7BMBb5giII2pkuxCAsAAjq5nnerMPhBVzav8MNgj+TTUDcngZ9UmeuGatt?=
 =?us-ascii?Q?C4fntocDfazJVZ9hcFL530REo9yKz1H0QSQsf8v0keU/0/+1pIbN0RXv8Nfv?=
 =?us-ascii?Q?mukT+jMnFT/3+iIqgzIp9TLWDmrKmzds49pUYv6ugOpEC01F9YQd5ZJqfVpQ?=
 =?us-ascii?Q?RX4fj71NBGRKKj8gn1rTPu2TavFijkLPGt2hkKKr/bYckVRbPz8CKb6ZUt+5?=
 =?us-ascii?Q?xcTKJRKpzRuBNVzTqnVHdtsRxA/K/UsyMiOz5Wy7EI07pq9fRhNSx+SE0F6w?=
 =?us-ascii?Q?/v9mE9WtxdDzIUtHTwJCqw0wveXpoRvsY3UCeZ6OFzefcWJLNAfpWjvErBRt?=
 =?us-ascii?Q?miTN1cIA4iKiMJ3ANBZX2BhNgWFNu7QCXuEjRkx/ZfXW7HLuZs8wAwB36Y9R?=
 =?us-ascii?Q?UpUQcmZLATfyS7ih/bIt8RY+gaEnNmsPbQQ4d9jykx+dKA7IJuunfguUkEW3?=
 =?us-ascii?Q?89TmEue8gRzm/gf9xnS6SdN157F6/lt+5kZdqY730cQBx7+F59cksm5VDmLX?=
 =?us-ascii?Q?457vlvz7lVMlBsMiVXi2TUPHBbBDYr3v7SzD0axnIEIo1v9faBDeCyjtPC/u?=
 =?us-ascii?Q?eGM8RJ18qrSVKfkqzK68fPbTEq3PEQrdq4kRZ6+ppn/4Dyz96Xau7RKsdqc2?=
 =?us-ascii?Q?7FvVGQlGR3It1/k2QN60I3l8bLHcSFYEELyJNnmD3zPAX36oy86LfGJdQP+/?=
 =?us-ascii?Q?RG8vi1vEyTVi+55dJFFnkVSN0xx+QoPOY02oAL8AlI3R3x9nOv3SfffDxDrk?=
 =?us-ascii?Q?fWpNixp2bXkm9uNPl6DeXTtaCvFddL+2BCPlAvm4wDu7/qihov+DKHxzDIh9?=
 =?us-ascii?Q?ptE9JYKczmqXT+c=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(7416014)(376014)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2025 23:54:14.9306 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c8d6eeb-17e4-4c80-5dbf-08dd6cc183a5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A0FE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7472
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
---
v7:
 - Add a commit messages

 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
index 9632b8b73e7e..b5b9b0b5da63 100644
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

