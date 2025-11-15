Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17339C5FA5E
	for <lists+dri-devel@lfdr.de>; Sat, 15 Nov 2025 01:04:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D38710EB4F;
	Sat, 15 Nov 2025 00:04:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="TOzP+Adu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010020.outbound.protection.outlook.com [52.101.201.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DE7510EB4F;
 Sat, 15 Nov 2025 00:04:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wNUpkZlgIug/raDC1GH1y5AtOET4RvkNUjPxAj4TU9eTPiHA0sB+sT9IWpRsiEvh91DdEIvMJ20a7ntErVn1UBFZJOU3uAN0cUSrTU8YntXdQCN5LvXFlpfXTaKdX3lbb2EXpSsU9LrHDGL8BHKKR/FiXB0oSDLZFRZDzSgcJXtgsZKzktVv88JJkBLxvWF6XE6mHLc4Ox97TX0dwYFeUsc4wJ0BHKjS54tv0BzxeZcgYHTIMDdukqFHXOsZptWZnW+REE+EA7GygsD+xqRUVe6sLeGAVLOwg/77FaMkTPEanKSsGDBOErZRXwLu3u5/WQb4xSQxV+umuPTxiSaVUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NyPl6O4k2j9ekv8PzAkOJQ1d9EJGvpl9vSeHy7snt+M=;
 b=Z3wOYjnA+LTqI+CUDGOmRnC1ZlCi8E3S58gWCqfNvPGwePwVJGA5wmQnUlTYSglEstA6/zBcboOqrgCwTNGv4z5k2u8g5eeDNgRNxHFDqrSCnAOP4PZTkrG7Xn7gJJKDoCdgJlrBb/0WYZpo690L8t/34AG+wxyJwW94DqkWXt8NqV+x/xbwhcPgsRQexBUNconhxNEG+dihDvjkbQG3Gxt8JVUJexuammczkyPdq/krNHjmcEEJcYGs2wQsRf7GskgvBcD8kaQwanm+v8xyczOXW5Yn9iUY+jx2U8/+ZH7lrxm+yt0viUd0Zmf1JH3R6yQpet83CpxvNQeTOgVitw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NyPl6O4k2j9ekv8PzAkOJQ1d9EJGvpl9vSeHy7snt+M=;
 b=TOzP+Adul1n1o20307C9NQfS9HqVx67yKg/edDLgglbKwZeJAt2hazRGFqOJ7nV1O5aDHg1LRsI+Tkcf/ILiGgKcqGZLLdUz0lo5Y1PHVjHKAO+t6A7CaWGFKRNbkrx04XxnCvi5cGq/fdoHqVCm32Dhh8mNaSv9WNDbVEXIVBw=
Received: from BYAPR08CA0064.namprd08.prod.outlook.com (2603:10b6:a03:117::41)
 by CY5PR12MB6621.namprd12.prod.outlook.com (2603:10b6:930:43::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.18; Sat, 15 Nov
 2025 00:04:02 +0000
Received: from SJ5PEPF000001D2.namprd05.prod.outlook.com
 (2603:10b6:a03:117:cafe::ae) by BYAPR08CA0064.outlook.office365.com
 (2603:10b6:a03:117::41) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.18 via Frontend Transport; Sat,
 15 Nov 2025 00:04:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001D2.mail.protection.outlook.com (10.167.242.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Sat, 15 Nov 2025 00:04:01 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 16:03:57 -0800
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
Subject: [PATCH V13 01/51] drm: Add helper for conversion from signed-magnitude
Date: Fri, 14 Nov 2025 17:01:26 -0700
Message-ID: <20251115000237.3561250-2-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D2:EE_|CY5PR12MB6621:EE_
X-MS-Office365-Filtering-Correlation-Id: 97f26460-9b59-4151-aa99-08de23da7bb2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|82310400026|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/R9bTSMI6csWxgh342f80WDzKIz+sBv3W452tz4EZrXq7kdw7W2z4iIj9VFj?=
 =?us-ascii?Q?nuzkR8+w+C8ptbjWR4L603uJgObKiN6lhNjF0wXSrU7G8v8CEwMWeCCnP+ND?=
 =?us-ascii?Q?KZz9GKR0fJ5LGSu4FRh92xDYKLf92BqdFYtnmV+AO5DrXq9496D4fHZUoowh?=
 =?us-ascii?Q?wtXxI7lxd895NQ24IpnZ5FK83aLjyJHTdfwbRFQ6AhcQZqMCfoztXGoo8OIC?=
 =?us-ascii?Q?YYEavRaAMtiz53nS/aNlpPO0z4Cdeg8ai8zZko8CgT+lte+Gttvjetz+MFXv?=
 =?us-ascii?Q?76tGIHqXx64DDMYGhOMv/O91JopPPI4zrJSFVm4bt8F6XouMkzcMxlGHDJ/B?=
 =?us-ascii?Q?VRaT7hEeJq31l9toZYIT6eQ5zevtGm5jmH/l7zK1cz+z1dT/xFNA4U7oK30H?=
 =?us-ascii?Q?0lM7WqR5SoRg3Fxln0nWhclDBNLZ/ZYeNmddUTgauWHG0ncabw5Mit6RsEBD?=
 =?us-ascii?Q?w/aoQpYzFttO47M/gpu1sAdBt27JtN42+XUrwSLq/mrdoK/6hPMbPU9jexw8?=
 =?us-ascii?Q?wHJQNAIo2F9Oa2FAwE6z5JlBG0rYg3mzV4VnQSxPfiVHnWwuzQFOQLOzYq5U?=
 =?us-ascii?Q?yJgtbrS6yHRXMDxfRxpcmWPajpCv90lV75ieeCFfHihRld1IAEJ7OPz96S7N?=
 =?us-ascii?Q?+B2rKMg3YQFihe96o3sE7bbT77n74HajbJNi2ildI4NUJpCuamggJsD0oYOC?=
 =?us-ascii?Q?3Y/vkQSO4kJiBlhWBx1JqW5VJsOO/NAb1K7k+Gkz+udpXEQC6H3+4O0t2I33?=
 =?us-ascii?Q?ENV90vgylnLVcC/QtcbhbuxJbc23gWJNe3v0tZZG0bWscLlwJZc3Jcrx0Br6?=
 =?us-ascii?Q?aOkbBj3Ts7j2eTaTXkbR45rx9jQjVVM8zzAS0ET/tw6gt/Bk8C+Zw84+3jMi?=
 =?us-ascii?Q?FzghwxtR+8NrnndIAwOAD9Ce1fZRbvD4akQTncGGVdxnopiN3CZqOlgL1I7t?=
 =?us-ascii?Q?edjFKoxizn0F46n38J4X6msnx3K/fGpLiGCIx4MdlxGStUclZ/ToM0HOgXcM?=
 =?us-ascii?Q?EJcykfOjLlPYoyy00ma1UDL181PD0TKXI2PCMe2XCxmSB99sGk43km6SmEkb?=
 =?us-ascii?Q?+Rs8t6yGGdT4CqbYcWyl45qJuOazxWa9lKvwLLGvPXLKrRsT0XdgjkrgGQ3r?=
 =?us-ascii?Q?u8CLU5TGthauyvhM4ffwC9lkjbUQq7GDwaZDKol5imnTnLEoNocJl0aKBwI+?=
 =?us-ascii?Q?PkM8tYO/towDdFgMdWBi1V4bf2yegHlRfwS8/DPUtcy3j5s6IGnSnFXKTXEp?=
 =?us-ascii?Q?s3f1L3FBNaRxBSNGYspQfqz8HAFHhNreaLq8nrNgPLtxQSO0YenvuwrFl8ad?=
 =?us-ascii?Q?bRgSZQz5SfMmB29I4sdgnVUCgsvVcZrB4jxEqq29QQTFgpDXlgr8zMm/Fwbd?=
 =?us-ascii?Q?8v2g/5khOXgQVdXe9ULwTQXWwq49prnj3z3Aj9GZHOInTfUd3Y0ZvDzWkXNH?=
 =?us-ascii?Q?ctGgN7owlBdiPE+iv14ngg6x+IDgs6AxRtH6oZPMlkbNTua94Nq2gPatEFT3?=
 =?us-ascii?Q?M3me3FhyvdlK50v6171i9x6v00NdoipgSjzHbtKDtG/BIs+QpFJuVusT1wJ2?=
 =?us-ascii?Q?JIpB1WV3NiOHoDZr+Vs=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(82310400026)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2025 00:04:01.6998 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 97f26460-9b59-4151-aa99-08de23da7bb2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001D2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6621
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

