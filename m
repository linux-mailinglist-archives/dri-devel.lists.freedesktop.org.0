Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC127C1E44F
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 04:50:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B60410E959;
	Thu, 30 Oct 2025 03:50:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ZHD60Lba";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012041.outbound.protection.outlook.com [52.101.43.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8478C10E94D;
 Thu, 30 Oct 2025 03:50:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ufo1KYnDJosgsj8w4Dy8sK56mmjVEwtKIeBtHtgH08hEWlFa5aKcxOVugmLDZAT/EjgpuxlhY+Xf/U+/n5N+VNpfyg20vtO4G8ay4jEKRlxGHXr0facjqOnguWVVDfTF62DqaalJ1Jgk1JG+v8XXFo74Q4wCK/qndUYfuxPukzWfE9n67NhKuN+QWvtPKVE9koZzeVcwNNreCcfxPNpkXWjjRuheV3MWfJ8aPToBbJ9EuPheEQknt2cJmJuvYlctczGqIFGuap32heFsGKh5Z+0GVwLoQfnfNd6fU4rbWvtbb50JcyWO7+Lm496udNKVpUbDJvut6+S4KmzI2XCbnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lczg07TuElj3A+7NUsQAihL9a5ZJIOJpua2JBMNrlVI=;
 b=O0+lZods29JyJ1JD7evofuCCdori2Gk4phZjCnGkuXR6mVziDaReaDTnjHRVnHgiAts89I4XxGMED1l8ou+wyKJP3sEGO9qpEil3smoof1lsOyR+rPggfDGYQMbf4jYLSf/iGtU/Wt3QChw3Efwu1vuoRXgm2VOOnKVEWpMJ08V5VkiBnwxrOwedtM0o5+YRUYKQMkX+pBYXkfvsQ87YJqO+1NQX5eux+Q/tpfgzmgwx4/JV7nIj03H9d9fEzyjeOet49LPlimRbcjxFRlaTX0VEAauwKlyMITyhjwMZ10yI953ZJ+vhhFrgjJ4VHAUpb6AU14riOyqwI+1AJraUEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lczg07TuElj3A+7NUsQAihL9a5ZJIOJpua2JBMNrlVI=;
 b=ZHD60Lbaizxi+vXXSbeAc0GDonq/5uLWgNgqqaN3k6UI3nEmX+zrCUl0a639nnynwLoVmJGZeDn2NEYbKQrUBzoIy8dTAuKf3TEI1g67qjrCmL6YyCrZfpEKZT1RzQ0oWXLasNpvIMz8uHjYCSlSvayfoQU7cKDrL1/Wg43UBU4=
Received: from BN9PR03CA0058.namprd03.prod.outlook.com (2603:10b6:408:fb::33)
 by LV8PR12MB9641.namprd12.prod.outlook.com (2603:10b6:408:295::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.17; Thu, 30 Oct
 2025 03:50:30 +0000
Received: from BN1PEPF00004683.namprd03.prod.outlook.com
 (2603:10b6:408:fb:cafe::63) by BN9PR03CA0058.outlook.office365.com
 (2603:10b6:408:fb::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.19 via Frontend Transport; Thu,
 30 Oct 2025 03:50:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN1PEPF00004683.mail.protection.outlook.com (10.167.243.89) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Thu, 30 Oct 2025 03:50:30 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 29 Oct
 2025 20:50:26 -0700
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
Subject: [PATCH V12 23/49] drm/amd/display: Ignore deprecated props when
 plane_color_pipeline set
Date: Wed, 29 Oct 2025 21:42:28 -0600
Message-ID: <20251030034349.2309829-24-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00004683:EE_|LV8PR12MB9641:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ed79775-11cf-4fd6-fe28-08de17677851
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|1800799024|7416014|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?wYF7qP0mPC0VGy5RSGmI8HlhoCImCZ/EXliZIlMvBEn/WyFunFgFz+1MYmU0?=
 =?us-ascii?Q?j7lq+yAu5FFbRBb0jOPLfkRxBQlHSqdkdhBZ1igGB+A2qmS57tNk1zJiBE5c?=
 =?us-ascii?Q?IDzMxQiOUdMbk2F2zu6+RD/gTXg5r3BZg9dN2vUpE+YaENpksXVaqyijqt+d?=
 =?us-ascii?Q?qeH9b38wH/xNB7GZClQ3108WWy8w6GNfMQtpZAoYlXcVFGnCL16xnIY5/W7y?=
 =?us-ascii?Q?1SEgWVphfo6I5Sv7ZtyX+5P9/bESPLsPBKNCj4hWILpTc+GB84VwQXBFqjXd?=
 =?us-ascii?Q?7Z/J3gyHeiYd0vn4xDQEnCvZuOzTRwDj16L2MIpAJTk0E4CV/eoBhaGc4q8K?=
 =?us-ascii?Q?Z4dpcihWAzknBk6trVsbjBkY+LtbxL0on5qAbPIOeCwQZSyuavyl8DShYDf/?=
 =?us-ascii?Q?KVLkzdKOcG9O7jnGQ73/SKdIli7RI183ZiPabFIZcPq4+9H51YcpdfHJRb0Y?=
 =?us-ascii?Q?tOE8if+4pMRwHOh+6yFEefkY0nxZRfgqhag/ArUEFdZvidpkuDUar+tyfm4I?=
 =?us-ascii?Q?xAg0NZIrc+8M0QCaEH5loGClQV+5fmmK3CMOHSbzA++/weE1z5OqkDa3PcdD?=
 =?us-ascii?Q?Tg6dAnWXe12EzZ5/yZTVRdS59qKRxvUTusEx/1SSvvS9a3gnQNQK7NgdYkWl?=
 =?us-ascii?Q?rOQ5zADXHaLoPjPjiZCt3cs7vRUM8ho9EGnVQdrRAD7gfFOsOiqiIOBYz2jL?=
 =?us-ascii?Q?Yisw029qUqYOJZB/s0f+DjYzv4pGMAVTY7H6qvV7clVCavyynB0bT9skixt2?=
 =?us-ascii?Q?iRO2bbznnPYKxl2iEi8tzg6lKqI+dfv+V6G6idE53TGLMMXh9AuB7dtcubii?=
 =?us-ascii?Q?f+sPJuVniRTEGrp1RbkJ5+6Ldjug4ZqXtsT8ff0p6grzNbxVnE9jN0YsNDtW?=
 =?us-ascii?Q?/6ahAusxUaTzOWKvhYbOTq/+EUXdrjPvh6lVdhat3H/TzHJOjjuPt1+EETCq?=
 =?us-ascii?Q?t1PVq+ZyDWz0gZUzld9XpLXFZ5IP/5GE8pGJWk0yB4MqVLZKFLNGi4jpxKxz?=
 =?us-ascii?Q?7nHp2Hh2tqAokq4C8XAcI7femsUIsjpSJ1uIyVMSuvyxLNlRZ3VK4m01XEnj?=
 =?us-ascii?Q?i1I1/aMOgOk1D4nEj820Uukt7IgEKZLNJNCE6EJswrqztduAkNdLBeESrGM5?=
 =?us-ascii?Q?l43jIyDE+oIPqpvVJVdjJ0Uxj7QCZzVPJqTwBiXV9VqDcmMTd9HqYNeNu1kA?=
 =?us-ascii?Q?voooqo+ia384ofi7RyxroezTHjl44p/nwhDHeKRvUoC8EyZAwfOLspKxDcxb?=
 =?us-ascii?Q?chzE9svyfK5Q5o7EEeDbdTRYeoCuBdPzC8J1MJgJBJBDrx7a37nSTOdU3enz?=
 =?us-ascii?Q?zf8GpjEWLn58ezw/OcJuL9dcjh/DlDxPfkojYPynLWzPxNWAqywLPp6KXfoC?=
 =?us-ascii?Q?FfBFAvjNDiKL2MbeWgbPMJfvBlBXfLPuTlvvJ3/vKnC8wng/VU1ZaRtYQ6v1?=
 =?us-ascii?Q?/CCmoJ/m27TovvUhDXwv7eZe7GV5T3BTT1ulJ4+lKKbmM5KJR4ORkIPBpPnr?=
 =?us-ascii?Q?+ncVpdbLtEpW4EloMoLnwjj3Phb2IkR9qnW9u7Wn6YLueGhDHzQNs1LP/3fo?=
 =?us-ascii?Q?N5K0PfVUCwUSZZkTK9I=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(1800799024)(7416014)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 03:50:30.0479 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ed79775-11cf-4fd6-fe28-08de17677851
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00004683.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9641
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
index 32f7850abc61..ac4933c67461 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -5793,6 +5793,10 @@ fill_plane_color_attributes(const struct drm_plane_state *plane_state,
 
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

