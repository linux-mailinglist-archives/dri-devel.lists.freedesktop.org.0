Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F0DC5FAF6
	for <lists+dri-devel@lfdr.de>; Sat, 15 Nov 2025 01:09:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76C4110EC16;
	Sat, 15 Nov 2025 00:09:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="aIOfyaL0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011020.outbound.protection.outlook.com [52.101.52.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D824510EC16;
 Sat, 15 Nov 2025 00:09:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NL/2HAsX+Jai4a3PjVFp6c3i9Hg7rafCll3D8Vs53WaGg6HbDsQjxZEi9jAkpOQq9yoH+3M59pnQtZ6focndoXiBzIN/qdRazlAq9UxHNq8l0OaXt0i6qndx4x4ghCdxRhfP3hI3hEo/pmJCwVJrn9h7ObUTv0SLH//7c7TzoEkF/z0nFfMUOp9k94fdYbTnN33B+CI/NVyzIbUz7SYS9aeE8Vk3xoK3Xh4LQMT7CkrxecQGDESr0Q1hG/WMRPFWwyYoBdpVAQ8jXgGShM0phZB6jqmrqQ1ImkkxaM5/ZjJHAeD1WlcbmuZWvkuCZTFrQCeH4wBruEczWClYOLxxAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Z4f2guqOZxGeOUlG1RWbL//u2sYWgAJpS44Aed6M6s=;
 b=PwBcgau1lLC0+hu8IrqQaECu0/n+1Yw6EVyrt5wnvGjjif7wDsmI32m8qlwr2R86OJKn/iuNQZRLN8K+8GxWYd1UuM2pTmwmANlQJ2iwCfOFYUYlLp40xuNwv4kwQR7EIRnpD1sahULtxfeTBk41Hu/trD86Q68y9hBGtRpZe2ipmIkC2043yEsl4RUJ0f1y6HEHpaNYgqLCkISaOG7PFUuODfI9V5gj9HZSrlsLYu6Znrk3NGvZWp3hpt5ep+u51yecFQGUjUZ8X9sUatNK+CwECN5aUXHyj8wRkta2YbBooLFl1zNXZrMFbhW1Z5Onlko7NOc+I776VtXN180Vjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Z4f2guqOZxGeOUlG1RWbL//u2sYWgAJpS44Aed6M6s=;
 b=aIOfyaL0saNJzq1k/h8A1oF/C9lktN5UTJWfLf8jWpeZbXFL2Zl0mYvRJMWgqoLSyxiRLH7Qz2I7KRShyTtHNJpfG/QFcjyDlp0RPbLNW658EYC8hDecNGFIWkSw2P0bS8O/+qCMaf0j4tgn8kHoi3c3PDxo03yyqk175rhFFB8=
Received: from CYZPR05CA0047.namprd05.prod.outlook.com (2603:10b6:930:a3::13)
 by SA3PR12MB8810.namprd12.prod.outlook.com (2603:10b6:806:31f::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Sat, 15 Nov
 2025 00:09:45 +0000
Received: from CY4PEPF0000EE30.namprd05.prod.outlook.com
 (2603:10b6:930:a3:cafe::f2) by CYZPR05CA0047.outlook.office365.com
 (2603:10b6:930:a3::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.8 via Frontend Transport; Sat,
 15 Nov 2025 00:09:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000EE30.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Sat, 15 Nov 2025 00:09:45 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 16:09:42 -0800
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
Subject: [PATCH V13 25/51] drm/amd/display: Ignore deprecated props when
 plane_color_pipeline set
Date: Fri, 14 Nov 2025 17:01:50 -0700
Message-ID: <20251115000237.3561250-26-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE30:EE_|SA3PR12MB8810:EE_
X-MS-Office365-Filtering-Correlation-Id: e6f4ff13-b40e-46ec-90f7-08de23db486a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Njm1IdDmVwVLhPFZDl2cQfjRyjGadD8mWyahyJK/QzdH8Km2p+ZJGHsPai7h?=
 =?us-ascii?Q?RKXYPVhCdTozYHLJSizMHsWhJz2ZbcQBI2WHPe+aET3XINrn4rlpJffX3FSI?=
 =?us-ascii?Q?aa1ip+DqK45WxOXa/CRJG/HtnCdz1KKS0N/UhAduYPtt7b8acgXASTwf7IZZ?=
 =?us-ascii?Q?DS5rIjHEUD3lY59Mcj7DPdokPrI9GHRoZ2eNucc8jj+BaQoGiN1WBbLFVhN7?=
 =?us-ascii?Q?1wr4wk9ImK5XQUz+YzpnBfwewRY41Th7mZU1yAKzLzv8wWlIrtGQavfw1Vc6?=
 =?us-ascii?Q?0lnIvtS5tL669J3y19T/QME2k94zfhEbdVNYAuAheUcllmVqXaE0mwEYdyNm?=
 =?us-ascii?Q?Qc4mNeyR0K6OSUiV1yfXn5pPayCdI4JIQuIjG/Bjj9hU4pZ2XHS/Xywwrv4s?=
 =?us-ascii?Q?YIYgqJaeIurEgOePojCU8ohmhJWxbi1Bh5yHiQ56/M6lRILncUloeFJqvqbS?=
 =?us-ascii?Q?PgkeXTtNb+y2xMjqxOur6sqbqEG3grXIBGkyTeM7uefrUFMetUlFpAwQqnW3?=
 =?us-ascii?Q?/p3XYqrbC4vEVAx7mWCRyxVhBz004+M+2Zi5ira9zjmJcwbB9Ll6f3erXUsO?=
 =?us-ascii?Q?Xk4e7xC07/XhWsmGwMCnC4nkzzLVsKnYnuu3Qu8qCYy24+/4ojOFrATAUt0I?=
 =?us-ascii?Q?+NbBU+HGSOKHuf4Zghx2qDxg79SC/binke2TDNlcET4D1cKSK7cCXN40u8a5?=
 =?us-ascii?Q?geTwIq3dzBr4SGVG3nfGWg7+r4Syf4vwMY+N3RVrzBfnHycRmeND4x6OkTeI?=
 =?us-ascii?Q?ewDzbtG3t3R8d8SZEAl7ZPo6UdHzXkkl8Zhty2Xl9aBhJ9NSoaK6RVc5q+xJ?=
 =?us-ascii?Q?+YOJFqs7Y6YXm8JGGeGCRuu4irE4ze6UjNWp7HjaXbTAThJyaseKvr40CDB0?=
 =?us-ascii?Q?qHHIMBBANSPultRXP1gE49sc49786VTDy6RcgoFhb/njCF3PVIgPSgUv204+?=
 =?us-ascii?Q?HAU9LnOiD9hrafAJyz2H9hwgXGM91wcdTwuc+rXFnCe3e8kLySVg+dB23ZDZ?=
 =?us-ascii?Q?kwSXMWMg080ZVnsxaDmbF7mz0buaz54dKWTx184NQugoRgs2lj6cMaaAT3+c?=
 =?us-ascii?Q?GTiIQQoKhX3dQNCjmsvnOYwvus6LhzVzDGA1FXtrHJXBiOIWt42IxxALeOcv?=
 =?us-ascii?Q?TTVtzBtLbPmCs4owUUnlnF3iVqhgtQyzMA+EAVW8Y9Ccc79K88xX29JrSXn4?=
 =?us-ascii?Q?YefqyUOgZAsNBr/qkbSG3WpqCwmrklBbspV1UPBp4AN5TZg/CbBf1dpzZe8B?=
 =?us-ascii?Q?lQSuG4VcP2aX6Y6XFppYYBcfNi3stGd67ggaRH0kbPgNNIp+Nx3Y5LSg9NU1?=
 =?us-ascii?Q?eG6TqivxaMU7Od1Wpyf/4GImyBW4Qz8lmI05aBarnf0/mqkFopTagEFOCyQ1?=
 =?us-ascii?Q?Eth9U7SZnFrFAW3BTiO5tHd+MLTxZXveZjrDVEarGiN5MWifjg4jo/MaPo/S?=
 =?us-ascii?Q?jhcKsBXqjYjSDGwrRUGV4clkb1YHipiLhUqHUWPIf/3EJ86PwCyYt/mpRPuZ?=
 =?us-ascii?Q?ao4zSDVYzQClEQ7KolgS5Ej8D1ZZ/B97JbXnlNlxEr1kY2pYwEOJOEwyEeL+?=
 =?us-ascii?Q?32WWEg4hUrZAOkcqvm8=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2025 00:09:45.2076 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e6f4ff13-b40e-46ec-90f7-08de23db486a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE30.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8810
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

When the plane_color_pipeline bit is set we should ignore
deprecated properties, such as COLOR_RANGE and COLOR_ENCODING.

Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Reviewed-by: Daniel Stone <daniels@collabora.com>
Reviewed-by: Melissa Wen <mwen@igalia.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index bb0fe91a1601..6e5c3e7afb09 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -5880,6 +5880,10 @@ fill_plane_color_attributes(const struct drm_plane_state *plane_state,
 
 	*color_space = COLOR_SPACE_SRGB;
 
+	/* Ignore properties when DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE is set */
+	if (plane_state->state && plane_state->state->plane_color_pipeline)
+		return 0;
+
 	/* DRM color properties only affect non-RGB formats. */
 	if (format < SURFACE_PIXEL_FORMAT_VIDEO_BEGIN)
 		return 0;
-- 
2.43.0

