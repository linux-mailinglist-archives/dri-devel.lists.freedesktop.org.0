Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C62BFC5FAE3
	for <lists+dri-devel@lfdr.de>; Sat, 15 Nov 2025 01:09:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22FA510EC21;
	Sat, 15 Nov 2025 00:09:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="TUdUnKLh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010051.outbound.protection.outlook.com
 [52.101.193.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 210AB10EC21;
 Sat, 15 Nov 2025 00:09:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LigiseBWAWiN/StJY0PGJC/SrCJRdM4CdZ+5LzHacPYZAEleOTX2Q2tzsMrqZPGDVdaFBI71rGCD+ot4bySM3WmmRz1dFc7+EfXRPYT7hSR6Iuv6XVw7JbILGfpEYdDgnYYz7F9TCnZVT93DlGx5/fJmnzUTEnYlNil15oI+tgpsuZ6VX09Weny/UN1+avnYOariOAKtLRnr8liH/Isb7fRmCiLArxFOBfrW71vAdg6RGc437B5d61bSGtfyIh2c1/PJkbYuFV6uZpc88QD8sl4Biw/qqsfgZ4ntUFfPaeqi+yi5UHVFRCc1RUiRSiX4oZvGD9fI+8aA7a+Dkcyx8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=imi1Iu/HilFPts1PB69MHlAT2wtKz1xCKC8af68aSf0=;
 b=Z5vr/9xWPNvNE7JDMKc1wyHZmm6ijsD53G+xJLoYf9fDLXZwuFMA17RCvOBgU0iPrprd0N8Zqsu3UxAw+MLTdTTXc7YDSF8SMHDCf2qpJyFv2ZXFeH3/sIh8yHrDAJAxF9p5vRtvf5uuGwgM+sjVvA9UjWAuKQyT2p8JfuH220PtNB6PsMMwgHCBd32pMWQp3zB3QKzzslNRGN45fAsyH9kUnQ+el11/z6/OMjUXok6TQcFBVIF4rj4I/uBR+h96gzF/nDA1Ozl5dsYZ5sxg4W4ysnrrOV+d/w1JR4YjN0nyc38+1VcaY0vEyDfUrqzCfeorEktQDmGOuqKTHYfy4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=imi1Iu/HilFPts1PB69MHlAT2wtKz1xCKC8af68aSf0=;
 b=TUdUnKLhBFKOjb0rUcOcTfMvLdPYy04EynO3wGUi9KVw2yiRMTXnWHdmsiFzrqGbx6fQ3KTDnfJ+rYgGrRZzOkTyVZvhR+xaGel7N2p5El/cLJT7MpKuuRxdjrc0+QvAo8iYgQfvN9cU/Zck0DXqVmJlGYXjXe5LvrKQMPGqPlU=
Received: from CYZPR19CA0024.namprd19.prod.outlook.com (2603:10b6:930:8e::7)
 by DS7PR12MB6238.namprd12.prod.outlook.com (2603:10b6:8:96::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Sat, 15 Nov
 2025 00:09:16 +0000
Received: from CY4PEPF0000EE37.namprd05.prod.outlook.com
 (2603:10b6:930:8e:cafe::99) by CYZPR19CA0024.outlook.office365.com
 (2603:10b6:930:8e::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.18 via Frontend Transport; Sat,
 15 Nov 2025 00:09:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000EE37.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Sat, 15 Nov 2025 00:09:16 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 16:09:13 -0800
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
Subject: [PATCH V13 23/51] drm/colorop: pass plane_color_pipeline client cap
 to atomic check
Date: Fri, 14 Nov 2025 17:01:48 -0700
Message-ID: <20251115000237.3561250-24-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251115000237.3561250-1-alex.hung@amd.com>
References: <20251115000237.3561250-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE37:EE_|DS7PR12MB6238:EE_
X-MS-Office365-Filtering-Correlation-Id: 85da8ba2-3769-4112-3176-08de23db374f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|7416014|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Q3IYnafAOdmklTDP9S32RTXpPkOXkMWhmovg5l26fkhrS6GAfzxVF/V7Ul5C?=
 =?us-ascii?Q?L8pNNR6RrYmRPT2KkefUagYIEIo367wKA1GPVyfVWZSIeEEbduLGXz68FqGA?=
 =?us-ascii?Q?pCtE4Oj/viVxOIm3oRSMiBFuBEA2ILprAhTy4sFeVx7FjF/9lanLvmHwfWRS?=
 =?us-ascii?Q?w0BUpwRWgsPV7+ygW3CbDpjJ3o45tLqEFL+EOS6G8bOcjsGiss9oqp9Ws/ie?=
 =?us-ascii?Q?T6cGjHZzps11bYDYZKNqXjtVasGX35eZfTRDefZcPRi+Ec+WUlRUY+Tj8ugH?=
 =?us-ascii?Q?TZgk5laI0uHhz1U6B5i8u+exvVgesRjlvoeUnzP2BGFfCF/0v5rb3CpGDb4+?=
 =?us-ascii?Q?jjF//jj5wuoPV+d7D0weDpK9QYMy4Xk+L1idpeAZYPNxmQfbiWir7uQtV7+V?=
 =?us-ascii?Q?7WKR9iipl3fdkZP5vIYKLJZ4rqWt6oAjglNVWqliNsN4s08+NxKLenv6y1aC?=
 =?us-ascii?Q?6euahpZe7yN/g5tonY7UOqgv2CRw7nJPRNk/UGxuu6FPecAbtud61KTrUL+o?=
 =?us-ascii?Q?P47ADjgCiReyuTDbpnNZYQFIxD38eSeSsz9gWny/uHbWoaeE93rNYH8LIM5h?=
 =?us-ascii?Q?DsqA2q8kOjH1qM9t/Wze/hfl1t4bV78FBe4wrisYqSxZPrxWL7KsoIyUmZ26?=
 =?us-ascii?Q?gZcRw87EvkYwuc+L5EgbE6Eu+jVXB85qAhoK6RKPQmFQ+Ud//M8gurTJz6xQ?=
 =?us-ascii?Q?614eaRgcZ9GI+DJHey3DKDlhVE6izqlW9dLwhS1MeFg1o5K47Av5f/HjwDby?=
 =?us-ascii?Q?uaEfxL/G2f4bkRiQkRudkOSCQBBteHVfD6ZK42yChkBRL81iJ3tp1uygUCF/?=
 =?us-ascii?Q?Y/UdmI38htCFFGS4qtcm9Y7BCI+iEd3TS9soe85urOEhVt/X5BevmKR8Q/oq?=
 =?us-ascii?Q?pZKh+8nETN5fxcznrsjmsS0BxUzgRzNlimU5Nv1c4ux6AZJ4NzkxGctyU1iT?=
 =?us-ascii?Q?7hGaX64wqu3AQDq4ETTe0fFWmNY/UjVeTszPUx/0Y6Qu/7h5CYkb7qwxgMzs?=
 =?us-ascii?Q?02ba5IoxMpi1715c3dxpJ1OQ2k0tLY7euwhPpeJpe4rHvn7sMSALuY2ULdF3?=
 =?us-ascii?Q?vmPZ0mtC8vxI2e0UYJCl3YIR6RFzr1W4FggXWpog/U4ZEGkmBbm0Y1Ydix8m?=
 =?us-ascii?Q?fulGUOW7s9zEYdytGWjn8uEy0BQ3qtf8Vs1Tn+eJu8D9Y3KpnsvMxf6lDaEm?=
 =?us-ascii?Q?BlQrboLVZmSkqfJzePVKR7jmtDjmvQHigXKEZ457Uqk8GU8ePec4JGEDHCWO?=
 =?us-ascii?Q?nTNruxCmNFeIE9Pg9dT//l3v5dl9ZWGjDilN5Wcw6Wq48o7J/G58Opj0zzOG?=
 =?us-ascii?Q?LJv1vMNKN/uZ1RYWMhQNTd5TH7sPI1r9fyL5qyFG3VsRycO44CTNnHMORhPh?=
 =?us-ascii?Q?NE90537O/oUDSsc9+jWgW1LgvYVxBRs5QYy5IDv0IyUY9Z0fHSLXrUAC/jUW?=
 =?us-ascii?Q?wWVm9wRVaYl/i7GYnNfvTHcxhTwveZ7crIZfiPmzNPmk0BKB9LoSGbvPBtbJ?=
 =?us-ascii?Q?7s8XkILd1DcLrfcrbTGKjX1Xfu6bi+QtsrZi7WUkh4Bh7Egum3+rRczweh88?=
 =?us-ascii?Q?7SZujxiuP3gQv91jIsc=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(7416014)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2025 00:09:16.5060 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 85da8ba2-3769-4112-3176-08de23db374f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE37.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6238
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
Reviewed-by: Sebastian Wick <sebastian.wick@redhat.com>
---
v5:
 - Fix kernel docs

 drivers/gpu/drm/drm_atomic_uapi.c |  1 +
 include/drm/drm_atomic.h          | 18 ++++++++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index e502f6becbb4..75fcc95197ac 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -1587,6 +1587,7 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
 	drm_modeset_acquire_init(&ctx, DRM_MODESET_ACQUIRE_INTERRUPTIBLE);
 	state->acquire_ctx = &ctx;
 	state->allow_modeset = !!(arg->flags & DRM_MODE_ATOMIC_ALLOW_MODESET);
+	state->plane_color_pipeline = file_priv->plane_color_pipeline;
 
 retry:
 	copied_objs = 0;
diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
index 65e619e75387..ed989f0cd8d5 100644
--- a/include/drm/drm_atomic.h
+++ b/include/drm/drm_atomic.h
@@ -537,6 +537,24 @@ struct drm_atomic_state {
 	 */
 	bool checked : 1;
 
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

