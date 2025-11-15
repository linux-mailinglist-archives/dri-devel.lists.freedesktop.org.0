Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A2F1C5FA7A
	for <lists+dri-devel@lfdr.de>; Sat, 15 Nov 2025 01:05:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 585E610EB63;
	Sat, 15 Nov 2025 00:05:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="fuTYsYgM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013060.outbound.protection.outlook.com
 [40.93.201.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94C7810EB5E;
 Sat, 15 Nov 2025 00:05:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H5EpHO6oq+XVXuSiAoBDCfSBGFw2SmJoeBxb9kwTRE/6Z9J2pPkJp6M/KquadDF4pAnNXRTlqKHckKh6WzvWP9CwY83kSLEAtHjV0nLpPFeQjORZVqMKCy/jJCSklGqvRDMX47CwxigANhaHqamBDHrVdRPx8s4qf95BJQv1/4sR7HOUsuhhUfzEUWEamKH2lZZDOxKZIhScR3nDiL3pT6iB7kZgm9XyD1uwP+ANNJBtxosslsuxCBaOi9JsHsdztuTurE7Cb7LulqzLq326//MQvAJCSOWCU/5YshZGskKkvcVLomdW/hUCDhRuEVBmDk7hk4swasYFyafnet9YZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KMDNudtq+JxbkwUIfruFL3HTWE7O3F7/Ae+EXlZ8XpQ=;
 b=f9QNId7aYUFi24NB0DXfWsh29tuGBKVk58Frjij49+UgJPNXStImnRN4RMKwtW8o027s6DkUJMMd9riQsqzDLqoudhBqNb/TmFTjfk6G/MZyyfsj/cEZ9hQNNrGPbIlolKbwxjGpVNqW7qLpVv5O6r29/nLT7uZzFw9MQLx11O4BX7WbIsrOLnm5PPb+QJhQ29tp0rBjMzGxnzmEcaf3ki7oeXE5QuP/btA7A0N6t/J3/idFCSsWq+qpyn2r1HgvjVPTCT9/sHS91+iLKT7hnt1E/uiRYcb5syjXwdecSu/RgxAkrRIpOuvQ08vWjmLq+Sl/qRpeF6vRXSOr8K4+ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KMDNudtq+JxbkwUIfruFL3HTWE7O3F7/Ae+EXlZ8XpQ=;
 b=fuTYsYgMkhmnbNtMdEp67qQyPy0QhzEuaq3hh7+hnF+O+tN46TqXCrSQaACbs7kBMstErPRYMeZZG60kwvcXTAoOiCvwpCfC2eIciXHkvkOJpC9743UN3cY95KvRASN6j9rCRbSr2J50cRAD3hc5Bgfv511tk3KCfQtq6Ps/+mk=
Received: from BYAPR06CA0004.namprd06.prod.outlook.com (2603:10b6:a03:d4::17)
 by IA0PPF12042BF6F.namprd12.prod.outlook.com
 (2603:10b6:20f:fc04::bc8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.18; Sat, 15 Nov
 2025 00:05:01 +0000
Received: from SJ5PEPF000001D7.namprd05.prod.outlook.com
 (2603:10b6:a03:d4:cafe::dd) by BYAPR06CA0004.outlook.office365.com
 (2603:10b6:a03:d4::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.18 via Frontend Transport; Sat,
 15 Nov 2025 00:04:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001D7.mail.protection.outlook.com (10.167.242.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Sat, 15 Nov 2025 00:05:00 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 16:04:55 -0800
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
Subject: [PATCH V13 05/51] drm/colorop: Add TYPE property
Date: Fri, 14 Nov 2025 17:01:30 -0700
Message-ID: <20251115000237.3561250-6-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D7:EE_|IA0PPF12042BF6F:EE_
X-MS-Office365-Filtering-Correlation-Id: f85ca228-b492-401a-f2ea-08de23da9efc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|7416014|376014|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?pfsgzOmHSRSMPrmlguIGN19ak5AU6mRSEtLTJykCahfcIzNF/DWCLxtkXcie?=
 =?us-ascii?Q?aDrONZ2xEIyxOl6rGVeNFgF+c0K9SDtdTmc6EwppxoSX3PuavrvazS2vXmo5?=
 =?us-ascii?Q?gl8zxVDCyeenS3tzchKsvOE52Y4brJHl9RKyE1jv59Bof6sT3fXVR14MjoAT?=
 =?us-ascii?Q?+PWyygfxP/aJvRzWaSEHK80f/FRuCa2CpyGJhzQ+dsod5qg322NHAmZhOP9p?=
 =?us-ascii?Q?7jzFovyPBlyx2T/IIXycYs/LzdRaiBuhZwaSLBgsjUlk+JP1aKeIvRnttoma?=
 =?us-ascii?Q?Ngie6fE8HN7r+LTOIsBrUTxxif7lMyvAgbkLGw8I/bfci/9HcEQAt5LH0DVC?=
 =?us-ascii?Q?aQOOPInuns3xRNc5PijKpiQseZSA/wRJkuFEo3zRePvDNMiJG8C2UIdJfqP8?=
 =?us-ascii?Q?kPy5nqEuwETouPsGcqHDqBcFY9+nbCthhsaAN7ToVR5ImDQiPq3UQHW8aAd4?=
 =?us-ascii?Q?XhflfQf9EFSiSWVFb5xCyFKqPlFcXLME3XxkOukYGQSb2SzQ1Slx6wAywe0+?=
 =?us-ascii?Q?oGlB9bMlJJP1ju03K/xtMn6ubDPugzcZIXbCzCjtvM7hZA4esPvAbJ3T7vE6?=
 =?us-ascii?Q?vHb8MKjs6heZNNqOCkNuZaHKSuOW6Ba7EEutxMyhwcJHQhIkOXxQBnXZiQF8?=
 =?us-ascii?Q?ubSuAmTPsqM813y86fCe/tfztqet0fBLf2RgOGSvhxZ+yNgKO8Zwelm6HZ5H?=
 =?us-ascii?Q?SbLl3eW0Ex8HR7+pGrynzEHoI5kD+xt1YYxeVFMVSECycROKNAvLcTr8a2MF?=
 =?us-ascii?Q?cyhTNI4pMpm8idr/SfMSE/wucctFrqhLofggdQSt2vRObnPVkS7exD66DbP9?=
 =?us-ascii?Q?fs1xgWCbt3pHbBowryg+33tr4S4TNRQugWzoso7Kr4s08GKzG4xg7Mwcmow5?=
 =?us-ascii?Q?V4FQbTYHw7MQ8nsKu54dPWEbek+ImQf8BFj1G9XHk6x7rSshEuD4HeVmtVdg?=
 =?us-ascii?Q?fFd+pmk9pFykcra1JLpt2BRuCntyPh98kSzRwGOAvYDKzPEp28GBzRkoGQJ5?=
 =?us-ascii?Q?SR/2ioecWSDmIICp7tT+RQgqxaXQQ5TXv9zRqXHFQ8i/sjgfD+1ghzQDykhp?=
 =?us-ascii?Q?MCG8N2pQ3rdxqUzRd95YrMiGeD02wHGXV9rODpRzwlmX5doyVIVygPb7q0P5?=
 =?us-ascii?Q?ZivJV/fLOXy3RmcicM4CE41sR92PgTBlk74xWlnxU2ucwbwBAyxH0zrgulPo?=
 =?us-ascii?Q?H/tkvmYUU4fzF4c+pLMIOMaoGKSlgH0IjwHQ0722MEvRTaw4GrFi65eVWR+g?=
 =?us-ascii?Q?uBv9gDQewsvubRWfCTA4/cIvyq4XaJaPm5Cq/BsdwDmJjY+mTiY61OXdu9MW?=
 =?us-ascii?Q?kKMpOD3fKIyTA1rWk2qb++vc0YOXKaxjc904zVi9jnNgMy6AxHJH5aVDaxl5?=
 =?us-ascii?Q?pfENB3h/CPJtsAdI1QJ1UwHplCJ73jLKog8M/h8myCy8bAzWmmqdm8836I2B?=
 =?us-ascii?Q?mMG+Lh6RPz+s2v7PR8Pt90npo+MiKq4rl0SyFJ3XivPLRUjJGDPYKfMk6Nn8?=
 =?us-ascii?Q?gUsEZhcIvfWhx2oMmYzTMirjER6SHmJ9Ui6zegOIMT/SqLnzHRETgQlZ6dM3?=
 =?us-ascii?Q?aUGFlpef6FMODFxW6oE=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(7416014)(376014)(82310400026)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2025 00:05:00.9035 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f85ca228-b492-401a-f2ea-08de23da9efc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001D7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPF12042BF6F
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

Add a read-only TYPE property. The TYPE specifies the colorop
type, such as enumerated curve, 1D LUT, CTM, 3D LUT, PWL LUT,
etc.

For now we're only introducing an enumerated 1D LUT type to
illustrate the concept.

Reviewed-by: Simon Ser <contact@emersion.fr>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Reviewed-by: Daniel Stone <daniels@collabora.com>
Reviewed-by: Melissa Wen <mwen@igalia.com>
Reviewed-by: Sebastian Wick <sebastian.wick@redhat.com>
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
 include/uapi/drm/drm_mode.h       | 19 +++++++++++++++++++
 5 files changed, 63 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index ba6378986d40..cfd3acdeda75 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -635,8 +635,8 @@ drm_atomic_get_colorop_state(struct drm_atomic_state *state,
 	state->colorops[index].new_state = colorop_state;
 	colorop_state->state = state;
 
-	drm_dbg_atomic(colorop->dev, "Added [COLOROP:%d] %p state to %p\n",
-		       colorop->base.id, colorop_state, state);
+	drm_dbg_atomic(colorop->dev, "Added [COLOROP:%d:%d] %p state to %p\n",
+		       colorop->base.id, colorop->type, colorop_state, state);
 
 	return colorop_state;
 }
diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index f6917bfb8d9c..2e2269b2ed37 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -666,7 +666,13 @@ drm_atomic_colorop_get_property(struct drm_colorop *colorop,
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
index d215e22c9d20..1459a28c7e7b 100644
--- a/drivers/gpu/drm/drm_colorop.c
+++ b/drivers/gpu/drm/drm_colorop.c
@@ -102,3 +102,15 @@ void drm_colorop_reset(struct drm_colorop *colorop)
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
index 008665d2d960..9c9698545f63 100644
--- a/include/drm/drm_colorop.h
+++ b/include/drm/drm_colorop.h
@@ -112,6 +112,21 @@ struct drm_colorop {
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
@@ -167,5 +182,13 @@ static inline unsigned int drm_colorop_index(const struct drm_colorop *colorop)
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
index ec27125c2928..c419f93eb94d 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -858,6 +858,25 @@ struct drm_color_lut {
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
+	 * enum string "1D Curve"
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
2.43.0

