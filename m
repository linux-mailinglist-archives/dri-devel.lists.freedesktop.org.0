Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6E95B2775D
	for <lists+dri-devel@lfdr.de>; Fri, 15 Aug 2025 05:57:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAB4B10EA14;
	Fri, 15 Aug 2025 03:57:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="R3D0Z9+0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2075.outbound.protection.outlook.com [40.107.223.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 529A410EA14;
 Fri, 15 Aug 2025 03:57:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L3FAFdEViUZCmkwKInfabsRqb7us+f6Mj4zvaqR7eTz1DI40Ok8TXGwXGMRZaSUCykkPcrK5bX24RB/9SUq3pfHKlu0lOfufwF2CYJktEsXf3/7iOK4/UJ3pbgIASjIh0ZMjb/5f+qvg3dJn4HYgRg9qQXlcrBFRXpkHEN3fwz/PAwcm2wKVMOm8AmjPcVxRLYS4GF0jo1LzLJv6jYMSFmeTbkI5xHTCtQdi/zMdVgUtNll6jDZ+skKuDC53ZYJVbOq8wOpwdlCFRhdQELJruVRSYxcY5pntwhWwHuCHh+9xUTz0mA+/2Hk/yie4sKDfRcEM19nmyJXXO/TfKbOUBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Eq1UTx+LqMwM0hAbOsjwbRYxDpRET+0XsCnASTCr+oQ=;
 b=MFlM6YATvPbQUNufKeYjmaBhDc7GVJ4MFsV/RnNVfdJvf9tst5n4gGZDQmUUYgAazR3yya3IiSKeIUF4mTsfIiEsqOSJgkln1SjMtuAJrEiOPghVi9+1OdQ0RvQBn3sHHXeoKJoRAYHAozNvlnB+2hE+GeSevu5gjQ3bUbAGfUx/U4UK64u+CGIm+bXoS0Ix9qWnI18kBxWDz0Pq1GdS1TDekqdH7icNm7cGAeqbN333QxF8ZWX9qGn3dtUKYezLlSN2v8WOf12fNHTiZf2z3HQgj6tRTbeOjryQyt91NSmjnBU2vdoi9zKS9o0hciJUtUodezlu4/tasI7hoVWujw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Eq1UTx+LqMwM0hAbOsjwbRYxDpRET+0XsCnASTCr+oQ=;
 b=R3D0Z9+0iRaZWH/WEB7Gfp8V0rgSu686jHGcxCifsqEMmBvml93OqG4HHQcAMqAIpp+sfN2aG0AiWfQLw/8O9hUI9IYqwgnuTSi0ordztV4qC8PDrTxxPXpTXM7M8v6uahrE//hC1lwiDw7ll3EyXvSN28BKWzjHUTgPIKptYcc=
Received: from BY5PR13CA0009.namprd13.prod.outlook.com (2603:10b6:a03:180::22)
 by SJ2PR12MB8034.namprd12.prod.outlook.com (2603:10b6:a03:4cb::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.20; Fri, 15 Aug
 2025 03:56:57 +0000
Received: from CY4PEPF0000FCC4.namprd03.prod.outlook.com
 (2603:10b6:a03:180:cafe::72) by BY5PR13CA0009.outlook.office365.com
 (2603:10b6:a03:180::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.7 via Frontend Transport; Fri,
 15 Aug 2025 03:56:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000FCC4.mail.protection.outlook.com (10.167.242.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9031.11 via Frontend Transport; Fri, 15 Aug 2025 03:56:56 +0000
Received: from kylin.lan (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 14 Aug
 2025 22:56:53 -0500
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
Subject: [PATCH V11 22/47] drm/colorop: define a new macro
 for_each_new_colorop_in_state
Date: Thu, 14 Aug 2025 21:50:11 -0600
Message-ID: <20250815035047.3319284-23-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC4:EE_|SJ2PR12MB8034:EE_
X-MS-Office365-Filtering-Correlation-Id: 14f49690-cc5d-412c-605b-08dddbafc791
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|36860700013|7416014|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?CAGgs0WTLqUERHhkUYbwa4olB+b4fkSMNGPPhJEaGVdEThqcs0cPHyDp20r4?=
 =?us-ascii?Q?bMDaRH1jIfodB94oDNLcRms4beSEnqGQRcK/qwzKC+n8Rtmv/1lpy43NGQGs?=
 =?us-ascii?Q?+t31gQIp3+urScyGeQXGTR26I6pE9N/B/48tsZHm7z4qM9FWsu2KSVGgRPXR?=
 =?us-ascii?Q?GAjePcXeJyvaLVUc36rg7vf0am4ZmzRKbvlMFJHn1qYyQo4f9BVKpbydjAHI?=
 =?us-ascii?Q?S3r4Bn7nmvaqIDja1hqtknyRM0seglHpdYee4/Rx9ED2Vm8dn5S6EMT22QOj?=
 =?us-ascii?Q?wA1cDbHkSZCCHMiv9YIt8lmfxaQ5IPs/kj3to8sm2vHMU7SF8xZNig33WJZe?=
 =?us-ascii?Q?tWdJOTA3N2lBcU8NqCItzPCnZg+tSo7omSx8ju2Rybv2Y4uvLFoUO/y2Azps?=
 =?us-ascii?Q?IOSGEG+PYhIyQEWGNpZ6xdExDXVPqZyNDcTOfAcku2ws/g2CpBPipX7B3LJT?=
 =?us-ascii?Q?RayT+xib27GGSG8TeHRdjFeRutpc2IHvxZzFdauSmEQv/piNfAyrp8a2xV/4?=
 =?us-ascii?Q?c/85bXlGGv+uv1jt0JUQDBYpSjG9ThSROECZ+jLMKCJAZOI6/bYDVvhoPFJC?=
 =?us-ascii?Q?TF67uaodG5pAJL0tmfDfJPaHo0vS8o0FK2jcmzs6Y81j31MK9dBstZn5a5Qu?=
 =?us-ascii?Q?jjY1B5uNeNndMJO42teQ7CfIoFNjlegePTtVyYh3WoxJF9dzRvFLcfguiz3e?=
 =?us-ascii?Q?q8Pn7IeClpSY4wEDH1WhuhOxvLwILHryRmAEWUbAU/QwRUX9+ATEFcm/BZvU?=
 =?us-ascii?Q?bxp9N6VAAWtUWDrzyc1J3I0k1y7T/b8ZlGmS9+Z+aIslUE7KWX0MJW74KtOX?=
 =?us-ascii?Q?ED6iHwfCuZ8X+4zkq+R3/vm52WKErdn0l8CBNUHza6dnt0zJhvfXV7Be+2pY?=
 =?us-ascii?Q?1IZXFlOV2dLIBkAXMAmAdIrHRQH47TlPF3ALCzT90su19U/a6Wio4Sp8aFnl?=
 =?us-ascii?Q?tL06RzFtCfF1TKGfnYkuUbaMEU06BVIrlX0AdysJWefzxKj5OMAcvHyVD7OL?=
 =?us-ascii?Q?VbNNOSNEYcnxP2/c+7FHXuj1YiC2ZqcVpsVmL57eE4zfMuD5F0AAU+1vnApo?=
 =?us-ascii?Q?UnXjSDgeChaza3SlPhO41oQJCD/CDOReA7H4NHh1hLnifCrfzIhaKUT6v90Q?=
 =?us-ascii?Q?S49fvXVrGE+hgrG2QQg0prXBQXsiQgZaCr1ovXjsuiRjd2sQGRucKui2xGP0?=
 =?us-ascii?Q?1cCdNBjLgDKhFyIfR+tAszmgkC4IJvKYo5hJhgfXI1fwhorvECeIwndk2hR6?=
 =?us-ascii?Q?sxC0s9CcMJTCm0KtvzerXKqjDENCljlGN/UsDz2ADAM4kibW/uMGpM2ip1Wc?=
 =?us-ascii?Q?JHYTsG283H7cnUvQRt5HmdDIvPmiyGTR5fZMU6PN8V2fjKlikZ17UI4ueQVP?=
 =?us-ascii?Q?NVANXo364yp1V5VltL1NPvgnWs1DCeHCeaXvP9HcPgUZ/4GHaeufdmcvEJYb?=
 =?us-ascii?Q?OmTjaKgzrHo2SJzDJ+jfAr0E5y5Q7p/DPHfKfe/Lp0B31BmrUnX/TXy2XL5a?=
 =?us-ascii?Q?VE9qQweWmwQtGos9jKam+C9Vs79iQoGwN+oo?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(36860700013)(7416014)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2025 03:56:56.9504 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 14f49690-cc5d-412c-605b-08dddbafc791
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000FCC4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8034
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
Reviewed-by: Melissa Wen <mwen@igalia.com>
---
v10:
 - remove duplicated "is useful" in comments

 include/drm/drm_atomic.h | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
index 4a30ed8ab1a8..678708df9cdb 100644
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
+ * useful in places where the state delta needs to be considered, for example in
+ * atomic check functions.
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

