Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3131B27767
	for <lists+dri-devel@lfdr.de>; Fri, 15 Aug 2025 05:57:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B58710EA44;
	Fri, 15 Aug 2025 03:57:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="OD89Y8M5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2066.outbound.protection.outlook.com [40.107.243.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23F8510EA3D;
 Fri, 15 Aug 2025 03:57:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hgos5JuALxRHv5SgGmZFNh9jD5Moh1KHCqPhhkcLkO78dp/o6J4KjEBrN/d/8NnxE93JIH0PCQ6sXHSBJByZffqMv11uekIr+GvbUzTP51Mi0Pnkz37bYwwYqB5Qq8UEJXglbhdFjojFHVk4dotcX6OOTN151NnXuFe6sXv6W2p/w9apd6nY57I7OVbJ4LXEwRCdY1kvmNKiHJf5YmqFPZcDGt/cSfrKTS+uYGPPylPlSzwFcqVsBZSBMAmDbKFLlA4PLJ5gAZoLJSUtNFpCwPIBVYqna64ZKIep1rENzI2SiyjHDrPb6g2bp277z/nbX1vaUD67FXG2zr9n7ndSfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zH86ss9JhWM5UQylvDcUIUNr1Qkr/BzdnsOgf02/4e4=;
 b=C2a0/fQpZT9e9dOMXRSu6CrQZyhOSUgi2ZHPtVg0iFGNF4pcaq3Vtz/B2gwxzD+Ho6UZ3prBru+1WqmHw1zd5B9YGqsGbfCH8+UT2Nv3iVspSvFT8lU1l3FJ4puAYLzNtRJMu5bdP2nsU40P54VVqOU3lj9QYBYfkvTfgG8HWGbJ8UR7qBGIzxurIEyqqE5Hv7050mA0/KR4r+At5NxaVLDzVUi9hu7vcIZahimhkZg66v1GedPazdpBWBu/NBQetjZtQGxKYakspZSjJW9fmzg7IS5yIkjEpLAngUPi8+SGM8LmcpCs6sUxrOdO8qaQd5h4X/jEKG3w8dn/gMYysw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zH86ss9JhWM5UQylvDcUIUNr1Qkr/BzdnsOgf02/4e4=;
 b=OD89Y8M5lkeaMH8zn8jH3oYCw6BbtpBIFllidBGaRQuwT8ZdEdlHbqne57getlZL6tL8cdbdn9sKuVDPCY9nVCH5cO2ghSS2d126+c9Bu1CpdAZvU8dipIJ4L8dKhTHdMKBxfOjhbIjFcG6MdEn+Bo5UYjaIeI0MI8KRZFUrMtc=
Received: from BL1PR13CA0004.namprd13.prod.outlook.com (2603:10b6:208:256::9)
 by SA5PPF5D41D38AD.namprd12.prod.outlook.com
 (2603:10b6:80f:fc04::8cb) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.16; Fri, 15 Aug
 2025 03:57:40 +0000
Received: from BN2PEPF00004FBC.namprd04.prod.outlook.com
 (2603:10b6:208:256:cafe::9d) by BL1PR13CA0004.outlook.office365.com
 (2603:10b6:208:256::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.7 via Frontend Transport; Fri,
 15 Aug 2025 03:57:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF00004FBC.mail.protection.outlook.com (10.167.243.182) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9031.11 via Frontend Transport; Fri, 15 Aug 2025 03:57:39 +0000
Received: from kylin.lan (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 14 Aug
 2025 22:57:36 -0500
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
Subject: [PATCH V11 25/47] drm/amd/display: Skip color pipeline initialization
 for cursor plane
Date: Thu, 14 Aug 2025 21:50:14 -0600
Message-ID: <20250815035047.3319284-26-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBC:EE_|SA5PPF5D41D38AD:EE_
X-MS-Office365-Filtering-Correlation-Id: f71fdc83-9d42-49f9-e892-08dddbafe11b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|36860700013|376014|7416014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?VnlLRL9icFHqgUMtFbXJ9/NC28D2AoBqtkY14jrcpZtkj+mZztLhGCRHunxV?=
 =?us-ascii?Q?s1pf45o14guZlLeJTrFrCIG6NAIJA8P9bpqzNUMmv3DoOX5kEKPBRV8twAj6?=
 =?us-ascii?Q?GUJny0/HjpAvWBOKJwt0HGGElWnNo8+HWhBuvMemQVoUh8/PqC8uO6nfIsHG?=
 =?us-ascii?Q?UK/MMB3XGIPB6G4TScK87kdwLXdfBqYwvFggZju1F9KbobC/AcuUhy3WfpM5?=
 =?us-ascii?Q?2T0/Hi39+2waFOymDu4HeRwTVf2z/lF8EEo/jF+hmJfDvHfZK1y+nKquS16Z?=
 =?us-ascii?Q?YwOlEjiZ3e0WTk1cFT0ZqX5l0JecznpqK0AT/qun04GZaCf5X5ChgQQNqsX9?=
 =?us-ascii?Q?iNZQ+S7mFucaO7ugWkNVvEHWZPdwW/3HCFwMS0v3wFgTSIuTIzpR42zRKhdn?=
 =?us-ascii?Q?U9mA9tcjupI4VjSCNDk/TL0LFAKF65JrESebFDk09xMQ5GsoaRiN/tnYUCA6?=
 =?us-ascii?Q?KKWDqF7jGxnKmTImDnynJu5h8LuZNIQbdpMTcOiR9+Aq1ybPqnNwmp5xiBvu?=
 =?us-ascii?Q?oE/I2xY8BY3JHdGJLqt5TAYhANfV6GdpoJEIIeXNCpaF5c5s21rcynHfp8IL?=
 =?us-ascii?Q?/T7u0dw2BiNL+S/UKhdfczzBCWPwbVe3YuPc6yKAmSsQAyebTlbvcGu9UXu5?=
 =?us-ascii?Q?Pl6vVl/a01Rmxdwec3bMfwOXh0L8bYpHO9TGQBguGO6BxDzgxuNlth2iO1y7?=
 =?us-ascii?Q?8DWITJRUsLVEI73IGFREWUFyPmKUIelJUX8uHBKHbmoDusajQSx5yKOXsAp/?=
 =?us-ascii?Q?odeFC1zA9Vb77l26B8h2pr1+5D/xBh+H2NOEszMy9amHbq6wiuYVXBy84Rs5?=
 =?us-ascii?Q?JrJaUvHUSDGKCT2hVlgivSblD7LDmfrIlVBQb+iAh9+OgLwNeojIvULLzgNE?=
 =?us-ascii?Q?BIPqgo6aGTkIYqifftmdw5aBjUTgiqz3XgOGlYnAi68wuiyH1B4D00k6GlYf?=
 =?us-ascii?Q?5ZgbzvK5xUMgcOvFDbfXjFpLGtVFFb6gv2Opfqt1YSwaRaArBQAFFa6i4kiU?=
 =?us-ascii?Q?D8CElcdDUPSaEYc2NJ2uABQvPq3ZkoiJdHSuiD/hGRvvmcZLHe/CrZAGL20s?=
 =?us-ascii?Q?SXlUeQUP7H6DnDrhlt/E0Ym/ycOeDvvnF9f+gJF1cb1jQSTIxJUXMev9Xkok?=
 =?us-ascii?Q?wfSrqp3GEiO99UnJZp4zrSxWWFEyIuUOmpz5u2XdtCWUd4ktgv2R2ST3lsJ+?=
 =?us-ascii?Q?2oyzfyHVgv1nXI8NRL/YOWhtSkXwmuZdp/YQzT+XxY0/7sBOAoBE0rjDTe3l?=
 =?us-ascii?Q?Vvxbe7tO/AuOcZkahGIrV91UbJLB2oa3XBMxodZPXG3eU9VMtkECDF19wsE7?=
 =?us-ascii?Q?PFn+3d6v4/mQScMcMd5PizzBr9Paj9O9GGctRKty4rKfsMTpDu13tSpVdu3A?=
 =?us-ascii?Q?32O/xuHP/tdo3133Sk0wLTQOAZd1+IP6ZujPhvvIQN42P3/7rahBcAGX2vep?=
 =?us-ascii?Q?v6+2y2IX2SRxujpGlg2q06WpHcHIlagyBgJX5D1dLnNwjDRFC55uGxG01XKq?=
 =?us-ascii?Q?VfktZC4MOBOpZzRehWKjQ1AayJHf5XHitjGI?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014)(7416014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2025 03:57:39.8504 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f71fdc83-9d42-49f9-e892-08dddbafe11b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF00004FBC.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPF5D41D38AD
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
Reviewed-by: Melissa Wen <mwen@igalia.com>
---
v7:
 - Add a commit messages

 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
index 7070e58856cb..8f5ce2262237 100644
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

