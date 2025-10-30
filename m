Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E45BC1E449
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 04:50:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94E3E10E956;
	Thu, 30 Oct 2025 03:50:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="C6mbcd11";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012067.outbound.protection.outlook.com [40.107.209.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2535B10E956;
 Thu, 30 Oct 2025 03:50:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GXkT5AIodaXEWSM7q0eHdXbCGSZuqDzMNoYs+XJDv3kxw3JSMPzZvqOvUrMsTS+vwNO7ds5l+HGyNfBVNZsu4M745l5zJbx8JY4BizMQH4SPrw+6u46P495b65GHlobdidTD8fWZxA73BlKuyD6bDZYxXEgpiXKHyWHPNd5pu6NGWihoilAmsmRMwa6VLKYu7aCCnb5nSjMow3c/vbl7sI0L2lpHfEae6MhJGBqgd6YoDvtGpGsQ7JuFSl+Zx8+VVBfQU9WgiaGSgCbL6m2F1ALrEN5zt0NZlJbapYfQrRoMX9QfYrGY1Ib2ASJ+CuyRiIk5/Y38nZg5KZ/jf3Jo/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZGFmhHUTDkrrZN8nu1ioR0W53Lx2lE/b5TLkDUoleCQ=;
 b=OcZfMT1To9wpvdpicy5wmBWhVH8FEnEroudirGryjqY0XBUoOHiIHgdaxK+6nunDIveuzWSWx3H8l0ERnr/EH4VrgrcsCtrhtQnkW640MT20kGOK1CW4QxvW8UYVfpMsYPSPeeD8FHFtyQ7SX+zU+DvjkE7Ti1lCzyLl6eBfHPQ3Vqpt8oDlT9gXYv92KrVg5DDG1cHEtu7orzTu6LDd1zpeiaQijiKGXzC/FLHjKW/TlUInZlMNHtvzBv3BYD7hhctTKyK/cDWEhHgWJp+a5x3Y7LG+jd2liv4aYaBYYHPhOkkfRwDXgMWjcANxwoS4zYMqO7DGs2M0EZsGMlAl1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZGFmhHUTDkrrZN8nu1ioR0W53Lx2lE/b5TLkDUoleCQ=;
 b=C6mbcd1101sOYqU59NNGZCndfYQXtxMPZ7W/qvit3ZqPW5PouDq0Uqxwz/pWKQPigKmKe6Ck0WpfsnFd8IRTZEHhUwcihIFqs806KyDsq0ImIN83ai++psv3tGoJ1MfKlRZudZHYcohxOvNn8RrLoGmpJlxjBRvg+WMIb4jBej0=
Received: from BN0PR04CA0111.namprd04.prod.outlook.com (2603:10b6:408:ec::26)
 by MW4PR12MB7263.namprd12.prod.outlook.com (2603:10b6:303:226::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.19; Thu, 30 Oct
 2025 03:50:15 +0000
Received: from BN1PEPF00004684.namprd03.prod.outlook.com
 (2603:10b6:408:ec:cafe::54) by BN0PR04CA0111.outlook.office365.com
 (2603:10b6:408:ec::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.13 via Frontend Transport; Thu,
 30 Oct 2025 03:50:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN1PEPF00004684.mail.protection.outlook.com (10.167.243.90) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Thu, 30 Oct 2025 03:50:14 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 29 Oct
 2025 20:50:11 -0700
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
Subject: [PATCH V12 22/49] drm/colorop: define a new macro
 for_each_new_colorop_in_state
Date: Wed, 29 Oct 2025 21:42:27 -0600
Message-ID: <20251030034349.2309829-23-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00004684:EE_|MW4PR12MB7263:EE_
X-MS-Office365-Filtering-Correlation-Id: d5072336-f65c-49c0-733f-08de17676f54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Fb8+8M0AXelIdLtEbs2/3tL67sm4eHcWmXlS0sKfKBSagqZ9EA7j16QSVzri?=
 =?us-ascii?Q?wC2Xv6SsF7tCT6dY4AGtuYZZI7g8zqPUwwcMgYcld3r6K/tNGIQdHycKlEwQ?=
 =?us-ascii?Q?14KQROLHNjj6eBInhbHtSY2C9D8079iUIAPnmQ1OuCr3qQuvGOHnyERW4a9X?=
 =?us-ascii?Q?bMlRCKsNhBx6jNCUejf5d5w9Rys5ZPlWevMgSfHYz9lXWADeB5+QgDBkHX+2?=
 =?us-ascii?Q?vJ41B3H6busZaTdOs9BVzJY+Rq4/3irh4HcwLNE/VuiWuvz1Rlxq4rSuzgOf?=
 =?us-ascii?Q?an76LmvNQqwrulvAbAVni3KX6uu8RPv8yHxCqBFWJ2sv7Wusof//ZJJGgk2S?=
 =?us-ascii?Q?keYks5h4/eJHHiOG9uxvXB9quBOj65Mb0n6Mgc3yjn4vbo4Vra7mA2bPCl/L?=
 =?us-ascii?Q?miI6SqcGoXCp83Ml4ezXa2leplucu+gqV1JSPQB1t84FfQUCf+FQvW4BaXg2?=
 =?us-ascii?Q?Ow0fDcmgTFER3bUrlgWCEshrIoNK6ucMho7Mj6zzP6cAfPQxxgyV0JVbOOiW?=
 =?us-ascii?Q?psB9f0b11+wMeDAZM1dqQVX5wb05jbCNQ+8AleaXB6oOYdlx+98xTQKmLZTd?=
 =?us-ascii?Q?61dnlDFEvHobPfTp7WpDlQriN8CP6tQViNi62w8ZeCXTXxFBa38eKUspr70C?=
 =?us-ascii?Q?fR3O2L78sOntlo7hc3yiiZFN8gA6pw5EHCSCTNX9ND+BZVYVLfFixtSnkxkr?=
 =?us-ascii?Q?plqZFhqT3EfcJSGQGZOUOIv2Xtfye0M7N8RGCkt9TRdopgjWIBbTdbei+mtx?=
 =?us-ascii?Q?VWSsWfcBZThgAnlhTKrC/t6Iwwj97AeaFnGgrTVHdM4d2LDkrJgYRjWsQUbt?=
 =?us-ascii?Q?3xO9TRAa3MLhB1tmMzNYqdL7vq+JdQbvVjt9Brn1lFSJMNaCzPoxYDUa7VGZ?=
 =?us-ascii?Q?OlL4CMJVufjtxVKdfAmWz1jGtbQSjKWDArveHrcW51Prg+/l4T2FW7QwPAtV?=
 =?us-ascii?Q?4YVxgFXE811tQO6pzSMuyBm5IxBLS6lJ35Hrmt0rQZaDyTSwfjoG9lBcNebO?=
 =?us-ascii?Q?rEWgRW9/A9AXI3ssk2VniEsmUZisg5p3Sd0YsjVnAb9hdn79zscYwnjM6x2d?=
 =?us-ascii?Q?biCSExFxG60SK2Yevzh4fAnPs3241WlWsYwtK57zo5tuDyIMudX9d5Jp7zg+?=
 =?us-ascii?Q?Tp0rswS5YuJpHfyKwZmwk+GfmCVUuKe3EUlTQfjdODfMEWWPXfs41U9sXGUx?=
 =?us-ascii?Q?N2C9eMQ+050d2arETbZcFumfFQAKwhYOyBzTF7m9r/O8N+vJjzNY9pOuNPGI?=
 =?us-ascii?Q?jcOM7AUFWaavRTTpn7POxn6TiuLsiO1NsI5VuBqO+aUORDEPiOTxCxQEosWV?=
 =?us-ascii?Q?oGkxt5cMvZPSpAnyBm+3T4CqzmpsRqT6Xetixro0sAFjqely/Pz/tJKpIi8h?=
 =?us-ascii?Q?1LhXFPhj3Jnn4F7S3a+6jPgE5xQlRlRAG4zU3DXfwxGRRCOi78Du+DCm0JBE?=
 =?us-ascii?Q?/d2WHURenbdgOUUbhanzILxysXZEi6QDyT29nksfH3BxRwWlbbHaM9PXc8Fd?=
 =?us-ascii?Q?bkQdRTaFUJKiyMIGYpaLFKEGRjSthUYaulOcIT9qMM7dDDrz1pSIVLMiavjm?=
 =?us-ascii?Q?CaTNkw4bt1Z/pVnIMdo=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 03:50:14.9635 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d5072336-f65c-49c0-733f-08de17676f54
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00004684.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7263
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
Reviewed-by: Sebastian Wick <sebastian.wick@redhat.com>
---
v10:
 - remove duplicated "is useful" in comments

 include/drm/drm_atomic.h | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
index 67cb0c602b7d..2d9cc2f21855 100644
--- a/include/drm/drm_atomic.h
+++ b/include/drm/drm_atomic.h
@@ -1081,6 +1081,26 @@ void drm_state_dump(struct drm_device *dev, struct drm_printer *p);
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

