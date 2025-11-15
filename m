Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBE78C5FB1C
	for <lists+dri-devel@lfdr.de>; Sat, 15 Nov 2025 01:11:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14CCE10EC7B;
	Sat, 15 Nov 2025 00:11:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="JCIyLt9/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012071.outbound.protection.outlook.com [52.101.48.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAB4D10EC87;
 Sat, 15 Nov 2025 00:11:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v25m3SOnRXhEcZP8cYbaTgieR/7P9TsRF9W3A+TTHM487N/L5yUi28I/g9a2JJaJdxZf8mnQAiqaVzUeLQDGhDlpdoUMEXsj77KgClZFWV7K2TK/sFb2EwqNQqsoJEKw2gbz6LtKSdH0uqCIV3JPCdUZ5SxDEo+ZaXuSNcizGQ8VMLMWJNDrFdeXFSL258WFNuXlhTzHV5VE54hvIIQ5hDBFl1RUNyc7pei+NSHKdO04nq+yzOLGlK8j+IN8hUdeMs7i+YMIlcMu1sFcjO3TNRwPtbBECgvGG4RQlqQtf7m7CaaMSvcBWGo1VTvUBGqO8+UDZrRCFHEtKenmqbaoLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IIhUHk7pCICHvuVLwQg1paW1WcLdxum7F2DgcutrVdQ=;
 b=WuAoiG0Q8YLIQlhn1Rl58ZIUlcCv+9z1n44HJcZCoDIS972atzcOiDp1WkJGOWZSgJVLzCTzjRqIb3S5T0GAY7ugNaVJBExtgFOh2sQ1Dd8jYEIfsNkrbrpb1oPkNxalq0oNl4UA2ykmJ5qm74PgMuUWAI+Ycj1uAetoT3J9g+er9mfbqh8fCobSmP936KU6Hx0dhS2prNAGKWodrY96MXjBEMMtebb/LpnYaCHfoFL7UD/25G3jJZjWVKoRfiA8aMf4wo3laHfoQLpmFKfQPqyLQz1wCeYjTgKHw1xc4AsqKII6ya1fownhidRdpFfSl9CdQdPhgmrE34uKBm78qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IIhUHk7pCICHvuVLwQg1paW1WcLdxum7F2DgcutrVdQ=;
 b=JCIyLt9/9T5xIyleF7uSyPuC7BazXvNEwfBJa3RGRwPkmegZaaMNHOomDiwykHagNdx1QnDib15aHFAH7LPZUdkqkLyl2q1lS91ZhevZ8Lc9JQr61ksI25wvrPtgO9XN3EZ91/k3cAr3jJcUe/csqZmDHdc42XTbgTW45VAn6Eg=
Received: from PH2PEPF00003850.namprd17.prod.outlook.com (2603:10b6:518:1::72)
 by LV2PR12MB5872.namprd12.prod.outlook.com (2603:10b6:408:173::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.18; Sat, 15 Nov
 2025 00:11:12 +0000
Received: from CY4PEPF0000EE37.namprd05.prod.outlook.com
 (2a01:111:f403:f912::2) by PH2PEPF00003850.outlook.office365.com
 (2603:1036:903:48::3) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.18 via Frontend Transport; Sat,
 15 Nov 2025 00:11:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000EE37.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Sat, 15 Nov 2025 00:11:12 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 16:11:08 -0800
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
Subject: [PATCH V13 31/51] drm/colorop: Add PQ 125 EOTF and its inverse
Date: Fri, 14 Nov 2025 17:01:56 -0700
Message-ID: <20251115000237.3561250-32-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE37:EE_|LV2PR12MB5872:EE_
X-MS-Office365-Filtering-Correlation-Id: 3df3b2e6-51e0-4a84-476a-08de23db7c39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|376014|7416014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?GarbYyIg/JrMvRaXr1TbzumtEe6vwKUgywh/MNS3/ZFmg0UoZmdfDrAdYpWL?=
 =?us-ascii?Q?VuvfHGpzaOYq/KxgBWokRA6zKXcvdUhkllWCZYsLopbd7r5xsmWzoczSoA2S?=
 =?us-ascii?Q?LpuDlkvVC1KXTQygd7pz7z+ki8uFRDXmu2ixGV95vznT2fbVGtDNpQ+5Iyxb?=
 =?us-ascii?Q?BYGI3ng/THd4tCB5SqZTzG4FxQVu0y6x68Bh1mwwDY6bPYX839btg+WGYWru?=
 =?us-ascii?Q?60wEt0he2NMQxVBKEMQA0z3RJSwSVOpvYN4VxNim5rikwDzHJR/XkXHaXVr5?=
 =?us-ascii?Q?q8q6X7fk2w/vM/1G0BBd3QGGb8F06NizZ4ECFOIjr2METY6wKYABHctv5+ZW?=
 =?us-ascii?Q?o9dr0uVWIf8P3zPIAi19ATTkGCDpjJQoi5lxoppoRCYw9M8qPb1pJ6SfsE2d?=
 =?us-ascii?Q?m6HjcjocyGo3O/rUBDYRRM6ZJFivPqu5vx4N7RxLViBmetauyzHf0s+0NSyW?=
 =?us-ascii?Q?KN4agRfBNQiKlQ9UNDnJ4/CGLAnJL0KLUTVsYRvZ3BuxXu7kyMSSiakXev1Z?=
 =?us-ascii?Q?MrU0w8O3TIuKbkPYUdunrpHziA16S2X2vStWQs4ri95sIVvOxbYARpE5dc9O?=
 =?us-ascii?Q?hV+0kQVJC0Q+DLsuMXgDg9EYR2ygyX2w33DT7KemWFIipdn0eGb8lKORVjSy?=
 =?us-ascii?Q?0bZdhKRNadYxUw1LTd7eetY67o/7nLTKfQv2CrQq69UddWZbjlGyDfQjaJ0w?=
 =?us-ascii?Q?k+KJUGUYOiYdV/c49fLDvJ1VBAfWzzzy7zyRNZu7H36pXk5MGb6Kw+2vw6Hc?=
 =?us-ascii?Q?aEqjnjeHbJdaUlLwFDJRV2/msC7mgpsGe9xVb57QOYpGscGKjRzIyK1NkzTe?=
 =?us-ascii?Q?3VuKJKi7gw1dyV1TbI//toCzo7g3vPmI5fb49Kvckzzi56mdRX/MtjW6EW1S?=
 =?us-ascii?Q?8p99MAXsvFyFrTiDS2MkMuG5r5XGB1p7eM3fxjrGjfC2GYyvZUbqOqb/MUp7?=
 =?us-ascii?Q?MOekyFQ+eeKplrbCFHGgBCMAh4NacVidqCqryCWb6ce2utauXJB1RDKagU2R?=
 =?us-ascii?Q?QD9A3hPlqGpMY+dh/81LR8YcIVa+HD4Zpva6CnELIdWLdzneI+0C4/hnx/It?=
 =?us-ascii?Q?zZoLo187MA9/vQqZVSB7qwws65waPKX11vNKgsv1MvTwLLXg9LSKNFCYtHnA?=
 =?us-ascii?Q?UHmrDSplL41tAynO5ld9rD5+BE/ORPnBgy+3nl/F6XVh9OrUFZMrdpdICTHa?=
 =?us-ascii?Q?CPhxIv69M1HKaex4796c+6Y7D8TC1l/GaisRxv5du2t+8aFNsfGwyNnnjgOA?=
 =?us-ascii?Q?7I/e1O8tW9AHp7JJjCulOsk1KXYs0tacs0jsvLgpC03rLRsQo96h5sD/l/td?=
 =?us-ascii?Q?hWWRJg7ZzhSPMHEqAMWGvav1mO6ZyV3T/O38afV+AQHMAFY8v8TyxI2ZklP8?=
 =?us-ascii?Q?E4gDaA3lN0OgxTxvyFPzKhoZ3sEK8HkV6ybcO/rqVdHTIRQpXmaPVO66kdzC?=
 =?us-ascii?Q?Sy2szvPq4IU3i6ZYXyrKlGi3yAzc4JMQSEB2aicxcK4NCFYmbfEMRyOHrfVq?=
 =?us-ascii?Q?2J1OBaWbwGwAeb8LuweVnW0ubrllMZGb26ViSqb9wXK2qhP+gufNc/T/zL4b?=
 =?us-ascii?Q?KPp8rMQ9EKi5qi4kM8Y=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(376014)(7416014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2025 00:11:12.1260 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3df3b2e6-51e0-4a84-476a-08de23db7c39
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE37.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5872
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

The PQ function defines a mapping of code values to nits (cd/m^2).
The max code value maps to 10,000 nits.

Windows DWM's canonical composition color space (CCCS)  defaults
to composing SDR contents to 80 nits and uses a float value of
1.0 to represent this. For this reason AMD HW hard-codes a PQ
function that is scaled by 125, yielding 80 nit PQ values for
1.0 and 10,000 nits at 125.0.

This patch introduces this scaled PQ EOTF and its inverse as
1D curve types.

Reviewed-by: Simon Ser <contact@emersion.fr>
Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Reviewed-by: Daniel Stone <daniels@collabora.com>
Reviewed-by: Sebastian Wick <sebastian.wick@redhat.com>
---
 drivers/gpu/drm/drm_colorop.c |  2 ++
 include/drm/drm_colorop.h     | 24 ++++++++++++++++++++++++
 2 files changed, 26 insertions(+)

diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
index aca02ca05785..5951db1c385d 100644
--- a/drivers/gpu/drm/drm_colorop.c
+++ b/drivers/gpu/drm/drm_colorop.c
@@ -70,6 +70,8 @@ static const struct drm_prop_enum_list drm_colorop_type_enum_list[] = {
 static const char * const colorop_curve_1d_type_names[] = {
 	[DRM_COLOROP_1D_CURVE_SRGB_EOTF] = "sRGB EOTF",
 	[DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF] = "sRGB Inverse EOTF",
+	[DRM_COLOROP_1D_CURVE_PQ_125_EOTF] = "PQ 125 EOTF",
+	[DRM_COLOROP_1D_CURVE_PQ_125_INV_EOTF] = "PQ 125 Inverse EOTF",
 };
 
 
diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
index 1c313257cc89..1032d8988886 100644
--- a/include/drm/drm_colorop.h
+++ b/include/drm/drm_colorop.h
@@ -59,6 +59,30 @@ enum drm_colorop_curve_1d_type {
 	 */
 	DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF,
 
+	/**
+	 * @DRM_COLOROP_1D_CURVE_PQ_125_EOTF:
+	 *
+	 * enum string "PQ 125 EOTF"
+	 *
+	 * The PQ transfer function, scaled by 125.0f, so that 10,000
+	 * nits correspond to 125.0f.
+	 *
+	 * Transfer characteristics of the PQ function as defined by
+	 * SMPTE ST 2084 (2014) for 10-, 12-, 14-, and 16-bit systems
+	 * and Rec. ITU-R BT.2100-2 perceptual quantization (PQ) system,
+	 * represented by H.273 TransferCharacteristics code point 16.
+	 */
+	DRM_COLOROP_1D_CURVE_PQ_125_EOTF,
+
+	/**
+	 * @DRM_COLOROP_1D_CURVE_PQ_125_INV_EOTF:
+	 *
+	 * enum string "PQ 125 Inverse EOTF"
+	 *
+	 * The inverse of DRM_COLOROP_1D_CURVE_PQ_125_EOTF.
+	 */
+	DRM_COLOROP_1D_CURVE_PQ_125_INV_EOTF,
+
 	/**
 	 * @DRM_COLOROP_1D_CURVE_COUNT:
 	 *
-- 
2.43.0

