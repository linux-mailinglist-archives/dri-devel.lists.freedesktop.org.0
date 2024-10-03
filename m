Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3DB598F776
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 22:01:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ACA310E8E9;
	Thu,  3 Oct 2024 20:01:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ERJhMfdv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2047.outbound.protection.outlook.com [40.107.243.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB63510E8E9;
 Thu,  3 Oct 2024 20:01:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k6rzGjv19t6fOWQ72OZZHBr0qMv59lLCm6+89Na2aDzzV0jiOPMNt71argef9HfSKBm7do1r7i08gOpxuvR0L3uqeu5Gcij6SMUEms7Jo46lvw1UHrAcLvo1hDmL7sMXn5fnK9MfQZ5RaPoZ74tfmdbRD5JPUOX23Kn2kHI2bAS3i3sW0YO5ZkQlnlMMrq/QCyK0ZKbxK71yWQ1ei3dhGTVpxuzLTxFpanxWXSvxtbSjfkHJnBrZ8EonljHtCxHY/apJbRfSlRAHnsqDW/XlzwyPErg++cO61RTMa7xiLWGd7ZLNwXTMNuiErZke/nszCuwnX8Fvs2l4HyflW9dkxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GI+kFDyq5HszBkiyRQhQfquEU27BOxBkE8J3J2UAn4Y=;
 b=aiFYqr1SE9uy8xtBMmq+zS51b7ZbR9WQNmx4prRf4sCuJF2VhzP40/Yl6TlUjcBBTO8+o7iyOYxU5Qj49TNHRT/Xsg1b82DJrBnyOXjrADrFtZSa1ZNMZNdMtgmJXjBQ2sZt3beU50xb6t2vdlWGGSV1nYKDicUAhn2IJIa7sH0HXKaIX6Jy8B4jzuniHy1lkdAx2gq0yOqUXjxrxI6EaRJXWvto14gywWL4TLUqZ1pmvzGPwPMMN0KBoZVdPE/GM9Ydo7+mIQ17AJ9b/9nrKmeYKuy6D75DH7Wv2b2KAsyLZv+03GTPkic/Bv1tl++cMPj6pTMTGm/zR/zT7IGr/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GI+kFDyq5HszBkiyRQhQfquEU27BOxBkE8J3J2UAn4Y=;
 b=ERJhMfdvEilHbXID/PNuf2PUHdXH6GEddYDSC4HfRADrNyLBGdBP7ZecCmprYt9dWHyaE/K7FfC1T9Z87ArWXqgtI4PW0vtGFVanERPYhG5i5l6JeFnbwdX4aNvxHOWqyEcFEul7vp9eV6AEtUefoLVbJjlq18v3ArXRfO/WbmU=
Received: from CH2PR14CA0052.namprd14.prod.outlook.com (2603:10b6:610:56::32)
 by CY8PR12MB7313.namprd12.prod.outlook.com (2603:10b6:930:53::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.27; Thu, 3 Oct
 2024 20:01:37 +0000
Received: from DS2PEPF0000343E.namprd02.prod.outlook.com
 (2603:10b6:610:56:cafe::4a) by CH2PR14CA0052.outlook.office365.com
 (2603:10b6:610:56::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.18 via Frontend
 Transport; Thu, 3 Oct 2024 20:01:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF0000343E.mail.protection.outlook.com (10.167.18.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8026.11 via Frontend Transport; Thu, 3 Oct 2024 20:01:37 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 3 Oct
 2024 15:01:35 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 3 Oct 2024 15:01:35 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, Harry Wentland
 <harry.wentland@amd.com>
Subject: [PATCH v6 06/44] drm/colorop: Add TYPE property
Date: Thu, 3 Oct 2024 16:00:48 -0400
Message-ID: <20241003200129.1732122-7-harry.wentland@amd.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241003200129.1732122-1-harry.wentland@amd.com>
References: <20241003200129.1732122-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: harry.wentland@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343E:EE_|CY8PR12MB7313:EE_
X-MS-Office365-Filtering-Correlation-Id: 12dbc7ab-ccf2-4fd1-ebaf-08dce3e63042
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?eKgtv1742ygGv5f8zTpqGUHcdv07eBUsqsYDUOvtwfBBTkh9MF0yliJmSZGq?=
 =?us-ascii?Q?HpjFAAkrFG5XqBJKsQN5LLC8p651vG5Z5hcmIYIp6ZvTnerQ18i2Sn2kLU7w?=
 =?us-ascii?Q?fUiT7KqvT/tRK6qCIVDdU9F+WnLB5vTIkzAd9IQUHjSqINPPWV5qh8GdrWRz?=
 =?us-ascii?Q?PNUyp2sbnikhvuq3ODULO8jNkRe+rT0Si/EaFCepsSL8WLiKwA9VlIJFoaF5?=
 =?us-ascii?Q?hQLnHTuoVIo6p2PqDUso0sFS1rHH0bvn6XmuPxtOcAoPTrEm6EO7NeXz1Yum?=
 =?us-ascii?Q?6PjVYchoEqaXDDJ3VVSCIrvH4VCkIm8bFZxTOU65hGGOz+q4C76xcnRZyJgg?=
 =?us-ascii?Q?VPAojwSb67W88+tlVrCEHjvjz7evZfeMO8WH/I9ZFm79mcWoRx9RQxESJgHJ?=
 =?us-ascii?Q?IKA+L4E7BKQoBshRfWAcLoYCTSl0yPbXX/8v7YVINngJNScpbfQFn4xp/56v?=
 =?us-ascii?Q?sapov9TV89y7v+ILY3+Bcakn0U9w/MXOM1jih0TtrbvZng2mjSstIuAZcVYR?=
 =?us-ascii?Q?rIR7VfMsATIRvKlBOefMdeIkm+QIlo0uRYpeqV2v8JKcW3rtf5arjCngInOT?=
 =?us-ascii?Q?Wkqu/NUa7RaStl63HftcxBmCz4PwrkLXSG4g/WQsCTgk2R2n2OMqYH6cpfAU?=
 =?us-ascii?Q?UGvlE71D07GRl7lCStAt4j3l7ShS71eUeR3nCYQKINiLufBGrsn8Pas6KyYF?=
 =?us-ascii?Q?6W29PKY4i9l+Cn8xPJXpY/eMKvgx6jCZsWb8IAtUrT6CrZDUwdtzx/Hgsqd8?=
 =?us-ascii?Q?3bVSHj78OD7ydDwpAbdqIZjbOJknOBxctcFu9tPyELSBqb3rQGOGE0+bCN8J?=
 =?us-ascii?Q?PF8290dQCpyJakmNFF1Waj3KDx2NAoFQawiL/W+efV61qoRUipES8V7fCiTK?=
 =?us-ascii?Q?s54uVKuLlsYtT9VS/ElsPWSoKwGx51Q+ZeM/s3+mXxJM7Wvz+Po79n6SmyE4?=
 =?us-ascii?Q?UsSkLSacGVhOaAamah4t5EalmC6bJvF0A9lwgScvcUV0PoXwV/Bq7+8JmKyN?=
 =?us-ascii?Q?1G82yLPmHLaeyIh8ZJka01kKbSyoZUlPP2thFKOR7uO5cJswONq74jrHzsGN?=
 =?us-ascii?Q?2pI9oYpnrRMNudcap27T0EVzEqKN+A0DTQi8Eq1RJvsc16SspsKGIjZwC4sf?=
 =?us-ascii?Q?MvUDORNKiQOT7m1XQQShunxnEww62GUQWCa72eQVx+Kz2ZZD0icP3ro9vabW?=
 =?us-ascii?Q?ozcWNcrbjF9cKEI5cTICaYglE+cbN3Pn4WAJ/cUKMy7EpacGYjotr/JbZTNr?=
 =?us-ascii?Q?HhI8Neu1YTodn6+VsFLOv28yS/1X7o/QnoxPN2W+1htDqyfzLV1V3DqSkDVB?=
 =?us-ascii?Q?oNXFnJbi8wDNmpm5Fr3Od3lko5dZMBGZGrIiZI8NwHBf2WZ8QQd7Wb/1ycDZ?=
 =?us-ascii?Q?HiCcMSFP3lT6CiAIvvx3x3EM61ZC?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2024 20:01:37.0193 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 12dbc7ab-ccf2-4fd1-ebaf-08dce3e63042
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7313
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

Add a read-only TYPE property. The TYPE specifies the colorop
type, such as enumerated curve, 1D LUT, CTM, 3D LUT, PWL LUT,
etc.

For now we're only introducing an enumerated 1D LUT type to
illustrate the concept.

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---

v6:
 - fix doc typo (Alex Hung)

v5:
 - Add drm_get_colorop_type_name in header
 - Add kernel docs

v4:
 - Use enum property for TYPE (Pekka)

v3:
 - Make TYPE a range property
 - Move enum drm_colorop_type to uapi header
 - Fix drm_get_colorop_type_name description

 drivers/gpu/drm/drm_atomic.c      |  4 ++--
 drivers/gpu/drm/drm_atomic_uapi.c |  8 +++++++-
 drivers/gpu/drm/drm_colorop.c     | 12 ++++++++++++
 include/drm/drm_colorop.h         | 23 +++++++++++++++++++++++
 include/uapi/drm/drm_mode.h       | 17 +++++++++++++++++
 5 files changed, 61 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 327d906c48c5..44c5b5dd8b33 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -631,8 +631,8 @@ drm_atomic_get_colorop_state(struct drm_atomic_state *state,
 	state->colorops[index].new_state = colorop_state;
 	colorop_state->state = state;

-	drm_dbg_atomic(colorop->dev, "Added [COLOROP:%d] %p state to %p\n",
-		       colorop->base.id, colorop_state, state);
+	drm_dbg_atomic(colorop->dev, "Added [COLOROP:%d:%d] %p state to %p\n",
+		       colorop->base.id, colorop->type, colorop_state, state);

 	return colorop_state;
 }
diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index cfc1485b592e..59fc25b59100 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -660,7 +660,13 @@ drm_atomic_colorop_get_property(struct drm_colorop *colorop,
 		const struct drm_colorop_state *state,
 		struct drm_property *property, uint64_t *val)
 {
-	return -EINVAL;
+	if (property == colorop->type_property) {
+		*val = colorop->type;
+	} else {
+		return -EINVAL;
+	}
+
+	return 0;
 }

 static int drm_atomic_set_writeback_fb_for_connector(
diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
index e005aba7d28a..79af42b349a0 100644
--- a/drivers/gpu/drm/drm_colorop.c
+++ b/drivers/gpu/drm/drm_colorop.c
@@ -101,3 +101,15 @@ void drm_colorop_reset(struct drm_colorop *colorop)
 	if (colorop->state)
 		__drm_colorop_reset(colorop, colorop->state);
 }
+
+static const char * const colorop_type_name[] = {
+	[DRM_COLOROP_1D_CURVE] = "1D Curve",
+};
+
+const char *drm_get_colorop_type_name(enum drm_colorop_type type)
+{
+	if (WARN_ON(type >= ARRAY_SIZE(colorop_type_name)))
+		return "unknown";
+
+	return colorop_type_name[type];
+}
diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
index df127b4b2123..877e3054e46e 100644
--- a/include/drm/drm_colorop.h
+++ b/include/drm/drm_colorop.h
@@ -106,6 +106,21 @@ struct drm_colorop {
 	/** @properties: property tracking for this colorop */
 	struct drm_object_properties properties;

+	/**
+	 * @type:
+	 *
+	 * Read-only
+	 * Type of color operation
+	 */
+	enum drm_colorop_type type;
+
+	/**
+	 * @type_property:
+	 *
+	 * Read-only "TYPE" property for specifying the type of
+	 * this color operation. The type is enum drm_colorop_type.
+	 */
+	struct drm_property *type_property;
 };

 #define obj_to_colorop(x) container_of(x, struct drm_colorop, base)
@@ -160,5 +175,13 @@ static inline unsigned int drm_colorop_index(const struct drm_colorop *colorop)
 #define drm_for_each_colorop(colorop, dev) \
 	list_for_each_entry(colorop, &(dev)->mode_config.colorop_list, head)

+/**
+ * drm_get_colorop_type_name - return a string for colorop type
+ * @type: colorop type to compute name of
+ *
+ * In contrast to the other drm_get_*_name functions this one here returns a
+ * const pointer and hence is threadsafe.
+ */
+const char *drm_get_colorop_type_name(enum drm_colorop_type type);

 #endif /* __DRM_COLOROP_H__ */
diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index d49cded6c568..53985d2b7eea 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -858,6 +858,23 @@ struct drm_color_lut {
 	__u16 reserved;
 };

+/**
+ * enum drm_colorop_type - Type of color operation
+ *
+ * drm_colorops can be of many different types. Each type behaves differently
+ * and defines a different set of properties. This enum defines all types and
+ * gives a high-level description.
+ */
+enum drm_colorop_type {
+	/**
+	 * @DRM_COLOROP_1D_CURVE:
+	 *
+	 * A 1D curve that is being applied to all color channels. The
+	 * curve is specified via the CURVE_1D_TYPE colorop property.
+	 */
+	DRM_COLOROP_1D_CURVE
+};
+
 /**
  * struct drm_plane_size_hint - Plane size hints
  * @width: The width of the plane in pixel
--
2.46.2

