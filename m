Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62C27B2775B
	for <lists+dri-devel@lfdr.de>; Fri, 15 Aug 2025 05:56:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 916AE10EA07;
	Fri, 15 Aug 2025 03:56:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="5r/wySeU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2042.outbound.protection.outlook.com [40.107.236.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24F4F10EA03;
 Fri, 15 Aug 2025 03:56:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Uf61Bm1R3+xwnqS6IYex30BivdLx+4K6e/M/AE2TfK1v52V7MlzeDwOkraEuG834KXjpPK//vOGWmywFc0Po3YxOrAwNaXvr3J5sENuXrI8w5f6wm8G5mpFzjxzpXDmAw+iYULY0aPXQFTIxTovN22FHjNRxvTk2ijc7L582RB4RaChTM8knbUmrCiwhhoADUYpCCzRciJxN6plDesc6B9lSUZ1bK8d0vio2vbvHFLTrS5DIn28AaIhkiXLuhcsYKS0RJVBJFSFnRRXQDVa1Wqiqf3JuDmomtddVW6j8b/5FUpj9Ocsjq3mnDhbFGgerGJfi4v5jLf3QyK3sB0NdJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=arlIm+Y30qAyuW6UxL2gxeqprsqHn8W0Gmdd+EKiI04=;
 b=klIZNGi9Mdd9AlmIxMSHJXBgwjEyEi2lFkkvFHk9lg0kf7pwYNqXBMxj70YFbIMBKzRWlAj+h8nx+x6wTyTsfIU9nBnPdRS3Ma/iQygYTg04INKU819NimDCNIcq6qe257/3glZv8jYYXxlvBK7XQvz/HLr7CuIK4QPb9M9oxBMOcSKj2scKW2VGv4wRM5+YudTqC55vsc8Uy8FTssgz9kIU3dfZq+SUfkOWLga9WN2dVXFKDzFnNdAbvQuY2rtGSio1+VDY7CkbguZ9LLq+2CrzcXfNS9fiL4JmpGMWKGE4FwftUoqnMbVigz+H/4LroEeVU6zVzErWzXRqm6ECQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=arlIm+Y30qAyuW6UxL2gxeqprsqHn8W0Gmdd+EKiI04=;
 b=5r/wySeUei74DAGU8Go2ONWr7C+RR3zquCTWLRf+7INbBW/upv8tC4EMDIhQ9C6WXaqZFIUcpFhkax+tNLU1nLBDYP19GNlCZmsJ6BKyEgSKSj+/M6/yjw9Rkx0FoXxEY8q2lVeXfCZHsPkRi6iSUpUCF3uGENBSwyeckw3kNm0=
Received: from DM6PR11CA0018.namprd11.prod.outlook.com (2603:10b6:5:190::31)
 by SJ5PPF5D591B24D.namprd12.prod.outlook.com (2603:10b6:a0f:fc02::994) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.15; Fri, 15 Aug
 2025 03:56:43 +0000
Received: from CY4PEPF0000FCC3.namprd03.prod.outlook.com
 (2603:10b6:5:190:cafe::43) by DM6PR11CA0018.outlook.office365.com
 (2603:10b6:5:190::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.18 via Frontend Transport; Fri,
 15 Aug 2025 03:56:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000FCC3.mail.protection.outlook.com (10.167.242.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9031.11 via Frontend Transport; Fri, 15 Aug 2025 03:56:42 +0000
Received: from kylin.lan (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 14 Aug
 2025 22:56:38 -0500
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
 <mcanal@igalia.com>, <nfraprado@collabora.com>, Daniel Stone
 <daniels@collabora.com>
Subject: [PATCH V11 21/47] drm/colorop: pass plane_color_pipeline client cap
 to atomic check
Date: Thu, 14 Aug 2025 21:50:10 -0600
Message-ID: <20250815035047.3319284-22-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250815035047.3319284-1-alex.hung@amd.com>
References: <20250815035047.3319284-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC3:EE_|SJ5PPF5D591B24D:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a2dac1f-f825-4f54-1b97-08dddbafbeef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|82310400026|7416014|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?7MEaKyfnxOlHhjAtD+SGP0GqQea0fMOZ6G9s4rZ5N6Ty4AR9lpj6Sb2Ysux6?=
 =?us-ascii?Q?sG4XaGKYUdlXHtrHfCv4aDS/S+sI+0CWabxAos83gDSYYBQcgbakbsdagAmW?=
 =?us-ascii?Q?gBYm3pjDZ3sNltI7AbhcauThhVwyhvw5jyQpX77Ooa3UULQNA9sFPwvK4ePm?=
 =?us-ascii?Q?h4HpWvgBzUBKP0VQfc4rowTMAIESY69iZIvF7nSfcsMOLDIgZ4Z06CcrbJ+1?=
 =?us-ascii?Q?HYb4HD0v29TpGzmiFYxBRcHn7t8RNfXBVqkSVui7FRPVskrXYlMVR4Rk1c7t?=
 =?us-ascii?Q?o2WD6frJKvbQdpRzSC/QQZ83kbdxt3q9P8zuGDcEzKsPsAs1e4Pw4sFgcf3j?=
 =?us-ascii?Q?MB1MkbqosO1hHc+PvmJLkXWj3Dc6hKzXTx7QgBPXQ1RFvMN8gH9neCZ85Itw?=
 =?us-ascii?Q?3Z2M+FAHWyZAIy8WAE5eugJN+mWtZkvGxwkweLLMYxjYzzO8tsxkaAV42Z4I?=
 =?us-ascii?Q?N1BO5yj/maYM0sU4q7qsZes72665007mbsJvMfuycW1+1LwTEfTvL9a/SqAi?=
 =?us-ascii?Q?fBdPfilDfLhmYhRQd28GIUdj07r0NwwyGsnCsVaJCVKUE2/EuJa5/G3QUkBk?=
 =?us-ascii?Q?J3PU7UX2eetxztBcQLhO7bq9aPhK4vXHGzTPvvc/QpWjc9aGgIWMPsioBe+e?=
 =?us-ascii?Q?VWbIKIncTZGc0NYDLVxgoMeTC6LXltObHMxuoJgLje9rUWPj6wkPUTUULaYE?=
 =?us-ascii?Q?S7dQykC0lhxayYMnmZpSDIaqBz/59PdLCRKPIK2T9OXGOD4LZRyTAicMqRRR?=
 =?us-ascii?Q?fr+gm+raNgCU9AwS16F0qXDgQhYdtrPaucXptAs41JPBoy08YiGkzfxXr4Ey?=
 =?us-ascii?Q?dUGhf24hnaRkPBcrc67w3/QAevZRrOGZyUuzJPMFdR9g7GZEYiWvFlKY64jc?=
 =?us-ascii?Q?V6tG7/itdsFdTnzT+vdTv1zecNsRLLhOlxBO59BKCJAlevIFuOAqDtoCrd7y?=
 =?us-ascii?Q?ZwiJx1MnZi7ho+4MoyGAUq0AtZlSf6M4o/kxyxmQvhl2Ty21d/k6nGzZeFSv?=
 =?us-ascii?Q?A3ad8ZYI1x8ZzcbzDhGjdZDZ8nezwe/jwhomT0nwstxLTv0RFptLgZ7eoS2/?=
 =?us-ascii?Q?jlxpurUAtElNWuAP/gXPshyi+uYxYMGA42QzQihgPcg1dboeb4yHE8DGogJF?=
 =?us-ascii?Q?BnhtBbpre/5LW0zsTqOSUPRvfleigMQHO32md6gcnDpkEWl1KiM8zaH3+jH4?=
 =?us-ascii?Q?WfenFHnecHLvSRIE42baVWdf4LjioC5mM2FqUWh/vSqS0JI46Z1MqsXbzUup?=
 =?us-ascii?Q?hEkT6UKXWmh6oCHh4/rFfbYS3L81Evy4rqOHLxhkGFD/4KyQ+W+RSKzkZ/+w?=
 =?us-ascii?Q?gauUqUd7+dk45hhryLLGRV9OK6fPJ7vyF5jqKdQxLhvjdndDEkZfNwG0I/39?=
 =?us-ascii?Q?MdCf3ZjsFjmdFCjtB/R3ohQw6Ktr0p/Jpdy8QGSP8RKJZfLfj5sGKpGgdBB+?=
 =?us-ascii?Q?PIRNFLZvycr6O2H7xjP3pTaC81SLH+giFT5xQ5kvaPhAwlFvap/x/cVJGSky?=
 =?us-ascii?Q?20NpJcMtBEtlZBi0O47Jl2izzGPJXyrHuYAp?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(82310400026)(7416014)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2025 03:56:42.4700 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a2dac1f-f825-4f54-1b97-08dddbafbeef
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000FCC3.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF5D591B24D
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

From: Harry Wentland <harry.wentland@amd.com>

Drivers will need to know whether an atomic check/commit
originated from a client with DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE
so they can ignore deprecated properties, like COLOR_ENCODING
and COLOR_RANGE.

Pass the plane_color_pipeline bit to drm_atomic_state.

Reviewed-by: Simon Ser <contact@emersion.fr>
Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Reviewed-by: Daniel Stone <daniels@collabora.com>
Reviewed-by: Melissa Wen <mwen@igalia.com>
---
v5:
 - Fix kernel docs

 drivers/gpu/drm/drm_atomic_uapi.c |  1 +
 include/drm/drm_atomic.h          | 18 ++++++++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index 775e51f3ee06..fe59dd1f2c07 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -1582,6 +1582,7 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
 	drm_modeset_acquire_init(&ctx, DRM_MODESET_ACQUIRE_INTERRUPTIBLE);
 	state->acquire_ctx = &ctx;
 	state->allow_modeset = !!(arg->flags & DRM_MODE_ATOMIC_ALLOW_MODESET);
+	state->plane_color_pipeline = file_priv->plane_color_pipeline;
 
 retry:
 	copied_objs = 0;
diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
index 7904a38caa77..4a30ed8ab1a8 100644
--- a/include/drm/drm_atomic.h
+++ b/include/drm/drm_atomic.h
@@ -464,6 +464,24 @@ struct drm_atomic_state {
 	 */
 	bool duplicated : 1;
 
+	/**
+	 * @plane_color_pipeline:
+	 *
+	 * Indicates whether this atomic state originated with a client that
+	 * set the DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE.
+	 *
+	 * Drivers and helper functions should use this to ignore legacy
+	 * properties that are incompatible with the drm_plane COLOR_PIPELINE
+	 * behavior, such as:
+	 *
+	 *  - COLOR_RANGE
+	 *  - COLOR_ENCODING
+	 *
+	 * or any other driver-specific properties that might affect pixel
+	 * values.
+	 */
+	bool plane_color_pipeline : 1;
+
 	/**
 	 * @colorops:
 	 *
-- 
2.43.0

