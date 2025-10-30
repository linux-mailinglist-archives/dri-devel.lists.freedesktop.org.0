Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 167A1C1E3BC
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 04:44:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 490E710E882;
	Thu, 30 Oct 2025 03:44:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="0KPkgxLN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011056.outbound.protection.outlook.com
 [40.93.194.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1976C10E882;
 Thu, 30 Oct 2025 03:44:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lRUK/50DPkL659c1B1rsMPzU28Fr/Oc8igW5zUoSwuLSHNfCSSYstqr9WnTQy9t52h8MxfkcTU5tuhq6ekD6A7Ol+3EY1tb8u6C8PFw/Rwr2Cpna9OTPBnxygtQX8Nzg8jNmuPVR6J0OBi5L0mION+NlLP9cRF2CL3b16JJkTGfT59pRu4EqkXrdQV3LhlAmTVcxUCBlHrNfSEy9fqrAleye041oJZJndVzoY3Wui+HmBlbSd2Op/CMmZJbXpMwUk0kdl8kl/uBcyJ0fUKSCgdYAr23NEjOSZv4Vn/UOtacfQsxykmLei3XHMv9gqQSVgRnlraHmgJdP0DFwHuKLzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NyPl6O4k2j9ekv8PzAkOJQ1d9EJGvpl9vSeHy7snt+M=;
 b=DcK9l4lYbGuYNQQp1pNUgGLdwocT9cMh8L6YmO5fxM4tQpVNektquhDim23WdTLrG3oYansrwpz6q9QlOr6vcOmC2xqIu5+ptjZ+wvQV4J8agHtFk+3Iexoh7KQJWZVW1UaHwlJivHRntbX8eCW8bjer3Ho1LaMk2fP+7h+wiXQ9UL1sZZ+0rGaFrIEZ0hi3Je0TKCHhlfhi7JFmMyVzownzisn8rtUno2I3SrjBJ9SEhvK+wBHta3gPRX8hkSRncs6ZymuKr8kI9xFr9+UxhBXjCyj5FaNWlZCCK3eGBDaOrXRcL9bWNQKJY9gt8H73QEacGD1+k7RqSFX//rCPxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NyPl6O4k2j9ekv8PzAkOJQ1d9EJGvpl9vSeHy7snt+M=;
 b=0KPkgxLNEpg2qFsC/0VsUrcvHNVFXMXZFCVCLo6qGiYfMdvkgLYf4A4MJg12Ky/m71Yqa9zbiAS7pvPNU/IVnJUPFvMb0oXGtlIMjx66X+9uaQyqeBuZrARQHl9h4ncIReD4B/GOq4wswC5To1Jer5SJhnDqW3KatDd8VWRB6H4=
Received: from BN9PR03CA0292.namprd03.prod.outlook.com (2603:10b6:408:f5::27)
 by DS7PR12MB5933.namprd12.prod.outlook.com (2603:10b6:8:7c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.12; Thu, 30 Oct
 2025 03:44:42 +0000
Received: from BN3PEPF0000B374.namprd21.prod.outlook.com
 (2603:10b6:408:f5:cafe::60) by BN9PR03CA0292.outlook.office365.com
 (2603:10b6:408:f5::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.14 via Frontend Transport; Thu,
 30 Oct 2025 03:44:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF0000B374.mail.protection.outlook.com (10.167.243.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.0 via Frontend Transport; Thu, 30 Oct 2025 03:44:41 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 29 Oct
 2025 20:44:38 -0700
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
Subject: [PATCH V12 01/49] drm: Add helper for conversion from signed-magnitude
Date: Wed, 29 Oct 2025 21:42:06 -0600
Message-ID: <20251030034349.2309829-2-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B374:EE_|DS7PR12MB5933:EE_
X-MS-Office365-Filtering-Correlation-Id: 4558039e-f0ad-4d0c-d458-08de1766a8bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|7416014|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?JWRg6JQsDAfb8UuJvFZAaNPHVzHJtxYXtN9z4BL7tZ7vV4QLXP7N1NOe2yGB?=
 =?us-ascii?Q?0uVviiKmsRqCu+7uS+n+2O9GGIr/Fo/PrR+Fe0i8DcByLvl3Cs6wKRh5q6OX?=
 =?us-ascii?Q?ufVIaDPG6uI0lkgEe+hXgP+d6sU4TBgAhCl0TLWSffxfAGzH0FqQGvXVCyTb?=
 =?us-ascii?Q?Ur1TJ6zoNv/Y3m4SJk8CXvt/VwE41A9IaLrHRN2XpkCD7B9GkMZy4F9cpJZT?=
 =?us-ascii?Q?vvivLia8QbO3h+R0OXknNB3m7seQ5AhmLLynGJI3a72qLeJCkfPAsUQB8X/f?=
 =?us-ascii?Q?e9NdUxYLFP/LP0rtOjgOmuhrB+WhrVCM7KxR7fkCPXsZapf6E0AIjdRtMdrM?=
 =?us-ascii?Q?MhCmxF1gtaxGvht5ajVfb9LWfhDLiYI2I8ZByTCNV7uvJRQ9QK0qSBdsDcLJ?=
 =?us-ascii?Q?uZDLrKHS6ucuBtknZRKmEDJCUY5pcr7VuJoE0ddC8MRS4PuhPIBAco7P38F8?=
 =?us-ascii?Q?9btsSZEFc23uqI5JQedVVeeX5GkhFcli9KcM4G9+fPINmCXQbwE/Hc4SR3Su?=
 =?us-ascii?Q?OlfY7ZusD7IDR3Gw2RJHKQUeeTi6LtVyJ7g4ihjEOjt/x2HvaG8ORzZr3HRX?=
 =?us-ascii?Q?0y89zIwAlHdpZCgWFeRr/hkbuH/WVTTV5K3IhtU6jtpePLonU7Qwa8yF8Qek?=
 =?us-ascii?Q?KwC2T1D06f9kI8v1x5MTP6V2PzLDNJADegn3VJ/f9NcXRg+dcDHaqtwz7Kw7?=
 =?us-ascii?Q?2d5ZslxHWo8Zkuuo1DvMF5Hml1EGQ08DOnfUhykNLkb21dUVqYJSW4CSLpDt?=
 =?us-ascii?Q?pW6/AqECqL/0oVzyo7HS97oDMNl/g+SXImAFDu+MtTbXy6HLit/98UUCrAm1?=
 =?us-ascii?Q?wHaOvoikJCyl1LdQwtu9mmP114bOPpzPfmSZ2yywIf6t2Adm7KN2YtHnvP2u?=
 =?us-ascii?Q?yfGa9gRKcZjT6IMrRHk9W08rgWAFwrn32hmF9iWeKl3kpcpkAKgVzS8Ba/gB?=
 =?us-ascii?Q?SapOubtgvfkIVK8BD9J3taTCtQTr+985TCiX7BEtQ3BxFB7NmLLEhoMfklS4?=
 =?us-ascii?Q?C6HiS43Gfvbd6jHHJV8vIT9tx6h7hyeZMRYFLf5WtnKEkiBZrIOj0GRyCWJb?=
 =?us-ascii?Q?qQXrSIl+aW7qFdD2E83lE2xXRDRb4YRpIerHtUDNjCZeJ7djG36f7b6bGD51?=
 =?us-ascii?Q?/mVzBoueKmkyzygqE3dBRa9DRsHIbP5sBgWur6nAuTyAuzK5rzO33Xawgw6p?=
 =?us-ascii?Q?TmXsYPvK+lXUgxy1F29a2KZOTn7Jb577mQSBM2hFATmGZV1hdU/wgBNTAmec?=
 =?us-ascii?Q?QAqIqlsBgObbuGYLLniVdBu5ilPNj/idkkYM0txgVvVjkc3ImjTP7WCEm2qK?=
 =?us-ascii?Q?1IfL2HsuHn102SdJQKEKCFekatRSWTtslKRCkUKOyXFGnJtZQ4Y/2fjz/KCu?=
 =?us-ascii?Q?abekE+l7+MViX9RcVyWOpJJLEkcoCfy67JSE8wifUXID0reqc3tDEc7sLPCR?=
 =?us-ascii?Q?8+w+GNO6QrCBK9DYcpiwXvK2CMSX99oOvkwgcCKZ/jqhBCuavcny2YErb7sF?=
 =?us-ascii?Q?vC/x8drizMVVCfqg2uVx4OOvyltb9zECTG8w0aLQ9uJJ9HeUw6yBEK783e9/?=
 =?us-ascii?Q?21nZMkz30CFNn5Cdpvc=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(7416014)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 03:44:41.7816 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4558039e-f0ad-4d0c-d458-08de1766a8bc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B374.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5933
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

CTM values are defined as signed-magnitude values. Add
a helper that converts from CTM signed-magnitude fixed
point value to the twos-complement value used by
drm_fixed.

Reviewed-by: Sebastian Wick <sebastian.wick@redhat.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Reviewed-by: Daniel Stone <daniels@collabora.com>
Reviewed-by: Melissa Wen <mwen@igalia.com>
---
 include/drm/drm_fixed.h | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/include/drm/drm_fixed.h b/include/drm/drm_fixed.h
index 1922188f00e8..0b44f2f294ce 100644
--- a/include/drm/drm_fixed.h
+++ b/include/drm/drm_fixed.h
@@ -78,6 +78,24 @@ static inline u32 dfixed_div(fixed20_12 A, fixed20_12 B)
 #define DRM_FIXED_EPSILON	1LL
 #define DRM_FIXED_ALMOST_ONE	(DRM_FIXED_ONE - DRM_FIXED_EPSILON)
 
+/**
+ * @drm_sm2fixp
+ *
+ * Convert a 1.31.32 signed-magnitude fixed point to 32.32
+ * 2s-complement fixed point
+ *
+ * @return s64 2s-complement fixed point
+ */
+static inline s64 drm_sm2fixp(__u64 a)
+{
+	if ((a & (1LL << 63))) {
+		return -(a & 0x7fffffffffffffffll);
+	} else {
+		return a;
+	}
+
+}
+
 static inline s64 drm_int2fixp(int a)
 {
 	return ((s64)a) << DRM_FIXED_POINT;
-- 
2.43.0

