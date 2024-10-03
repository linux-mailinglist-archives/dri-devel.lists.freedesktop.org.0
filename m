Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E58F698F792
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 22:02:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 070E610E92A;
	Thu,  3 Oct 2024 20:01:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="MnP7i1M6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2044.outbound.protection.outlook.com [40.107.100.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A3AD10E910;
 Thu,  3 Oct 2024 20:01:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ebz4uLV9pfx8fkEqXFytTKMZCg1F/ae5pRoU2kFEyZcT+GKtNCL1KFhNCNoMuxuB5M9o5qCeR2iIM7y2wQIOtpUTltb8U3J5UALm6/U0FD9yDMQNVUKyMlKMrB/BVtWAEddDNzI/zLaUO3+Z7O5Mjdh2LuCxEV2jtjlP9OtakRNY3tOHymzOmjTNJBWmYhFByL+nNLVnxBIBetflEBBANyV0AeoEjOspIRThelDE+CEop8w9KdwU50+F8dMojZ0OjZQOOaqUAWdkVxwQCHsOT7fC+5gRE5giumyHxjBIwDXSkMVMV/Aqp122zAp9J06lRLp1L/KnemtaIW+8wV4hrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FTw8vhtoPflEIJrUOoDA9LVUW1laJQQy3b+mJMeT35I=;
 b=bQD6BEVltUQfcVulfPRa0JkcYn79gSJyRJbjDnJ2B70FhrB1SUZjhgW2B+GWBOeRWySb2G5T5EPrpVwTt+fSEQOem5pdCBd+Ru22kU211ldUtz6/qx2IaF5j4FRJH3aMWoXOg37I/Sz0XzQseG4EVsi31la94MozPphrn3Hi/PKLqNNZGMt9Mf3CRTNVwb1Q8g60DCZI6uCZfke1LIgo7WuSdXDfQoVbvtpguCBnn26tbKTOSNVfgJkv4R+5U7+jS2EmKoD4gPmq3VZPP3HJn4J7REb225EgDXFZQ4WFPzi77D8dcVYY7eJXzfCG2XVWPEKsZYsh6vPd1mnmq/v/cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FTw8vhtoPflEIJrUOoDA9LVUW1laJQQy3b+mJMeT35I=;
 b=MnP7i1M6uX+HP9/ZZnA0DuEAdpbmnRPdbGf19zGiR707y/5l2VnFFgnldg5m445KzwAf4Zzfh623YfPPlz6QPjPAniPhAd8d36zBZmUyBtC978bf1NL1zitLhUGp5vAK8s+kndeSKrFaI302X5FnvSQFdpykcinWj7WMkmdEiGk=
Received: from CH2PR14CA0052.namprd14.prod.outlook.com (2603:10b6:610:56::32)
 by LV8PR12MB9183.namprd12.prod.outlook.com (2603:10b6:408:193::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.16; Thu, 3 Oct
 2024 20:01:40 +0000
Received: from DS2PEPF0000343E.namprd02.prod.outlook.com
 (2603:10b6:610:56:cafe::49) by CH2PR14CA0052.outlook.office365.com
 (2603:10b6:610:56::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.18 via Frontend
 Transport; Thu, 3 Oct 2024 20:01:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF0000343E.mail.protection.outlook.com (10.167.18.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8026.11 via Frontend Transport; Thu, 3 Oct 2024 20:01:39 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 3 Oct
 2024 15:01:38 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 3 Oct
 2024 15:01:38 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 3 Oct 2024 15:01:37 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, Harry Wentland
 <harry.wentland@amd.com>
Subject: [PATCH v6 09/44] drm/colorop: Add BYPASS property
Date: Thu, 3 Oct 2024 16:00:51 -0400
Message-ID: <20241003200129.1732122-10-harry.wentland@amd.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241003200129.1732122-1-harry.wentland@amd.com>
References: <20241003200129.1732122-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343E:EE_|LV8PR12MB9183:EE_
X-MS-Office365-Filtering-Correlation-Id: 2eca0d4b-6716-4d24-a279-08dce3e6317d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/HUkJBkDsoOIWyswGtmgQvYyjjwOxm+ZMiycvpkJ176sWdR+8qjezbFzT1QF?=
 =?us-ascii?Q?1g2dkuj7KBCQOmizYjzl6Bkcimv2XtRqrzyYFgkBMcgFTtvpW8qbhzdqdc7d?=
 =?us-ascii?Q?FJ2hnnS7x2wnCU14fOq8DWkaerWxK0Clxmtol3S8ll2X5lPh67GnXZUEANi1?=
 =?us-ascii?Q?CznLijokHpmRbgkvv3z1OO8dRATkFKlLd2LuTXXAYld/r0qNISI4q+1+A7vG?=
 =?us-ascii?Q?Ww7/pMsuFi+aDypPn2OuSn9kqI9ZLqLt5g3/ljpJYHTiSnAKaI0DNbNQETAG?=
 =?us-ascii?Q?Qj+RRVeyFNlVZAiVZmx89Zx+3ZKIXibFp1zltec0kgqmVW+vkz9XBprmBbFz?=
 =?us-ascii?Q?FPXwA4qXKNGwk7tnJy4p4w/kBhTnARrhUfMHgFOILdcNgabBhStPbDLwl0v3?=
 =?us-ascii?Q?c0EuZswmcm8vZXCydE1qA5qPW/MVvVQCBeNgAC7/g/f7brIWwAZDzr8WgIws?=
 =?us-ascii?Q?WYXSWrrcA6RKzbESTI6+GxTEVXMEqZdq1gWdZrGWstS9IF+PjF+oXsF4ihTm?=
 =?us-ascii?Q?8XybolNu7ytxN5ZCaH5x7vW8ZF7VW9a+j1HBPm6TzlGd6M7RPkKRMGnWpbOO?=
 =?us-ascii?Q?w/rOijTu0+tBzgBJYSHcy0cF1iagcclV4uqZvz7fL464QFbHZ7Wm+3Ir+LZp?=
 =?us-ascii?Q?yVIdLktpBeLovw2+P1CHKUHcbVedT3aHYhlMhFl5YR/BK2RdOk7m5PEED6C9?=
 =?us-ascii?Q?WHFjuxXts6ag9EuW70wA6DWQ2c2unI3iNUYTyq6rlICQjgv6gh7sJkiNI5Tk?=
 =?us-ascii?Q?1Q+4+DzFxRaI2OVjDSkJ5JTc+LXHsAB9mLWYSMY6vK7FGdXAJUEOzR5SCZk/?=
 =?us-ascii?Q?AxAkZ4AwpwKzNdZK1/fCcK9qAbct+IeZmf/GsDm9aQUxI55LUUfs1QNHhOpp?=
 =?us-ascii?Q?PVqDMoFKoK1Gezs6mYQkTXks19VdVPpl0844Exb097tscwPD1nTk85cpPrCe?=
 =?us-ascii?Q?kHDibJOk/8kQn897oZ1wNXewxOfYMeoZIZLL31wLx+NIAb2Obtewi6/nQXTT?=
 =?us-ascii?Q?H6APwJ1MxWGOlVYGskp+kNCfscXio5Dg9Hxio4mnkxs5A3cZlcIlqlCcfgTH?=
 =?us-ascii?Q?RGli+BkazX8K5tdGQfzaJGZqTA4/nvwMvxbRBSycIIFDZ2TKkEmh2Bqe4wbP?=
 =?us-ascii?Q?VFqfpgw4WJugk38cTwdYrdcjUQa3c5rc5wXMBq/6pvrXIIzfKkF14BDMhRbT?=
 =?us-ascii?Q?6lT385DvQrzPjlG/hOZ57XbC/W3OqNWBRwFQxQICuY3AmlC0OOTKjpSSmM4S?=
 =?us-ascii?Q?cf2xqQd6IgUCojtEznMBUrbistm1nck0wFQTsKsZ8CxmdcQKHp4XJ8sMfPs7?=
 =?us-ascii?Q?eIIAsRVLzKoun1pEQ3C5qqBFyza6cTlG8QvTomRNe+ya5wyy2GXquHtl1Xsf?=
 =?us-ascii?Q?o/tzIwk=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2024 20:01:39.0818 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2eca0d4b-6716-4d24-a279-08dce3e6317d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9183
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

We want to be able to bypass each colorop at all times.
Introduce a new BYPASS boolean property for this.

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---

v6:
 - clarify that bypass is only valid if BYPASS prop exists (Louis Chauvet)

 drivers/gpu/drm/drm_atomic_uapi.c |  6 +++++-
 drivers/gpu/drm/drm_colorop.c     | 15 +++++++++++++++
 include/drm/drm_colorop.h         | 22 ++++++++++++++++++++++
 3 files changed, 42 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index 9a5dbf0a1306..8a038e04be58 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -648,7 +648,9 @@ static int drm_atomic_colorop_set_property(struct drm_colorop *colorop,
 		struct drm_colorop_state *state, struct drm_file *file_priv,
 		struct drm_property *property, uint64_t val)
 {
-	if (property == colorop->curve_1d_type_property) {
+	if (property == colorop->bypass_property) {
+		state->bypass = val;
+	} else if (property == colorop->curve_1d_type_property) {
 		state->curve_1d_type = val;
 	} else {
 		drm_dbg_atomic(colorop->dev,
@@ -668,6 +670,8 @@ drm_atomic_colorop_get_property(struct drm_colorop *colorop,
 {
 	if (property == colorop->type_property) {
 		*val = colorop->type;
+	} else if (property == colorop->bypass_property) {
+		*val = state->bypass;
 	} else if (property == colorop->curve_1d_type_property) {
 		*val = state->curve_1d_type;
 	} else {
diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
index 5b844daabd44..054e7f01151b 100644
--- a/drivers/gpu/drm/drm_colorop.c
+++ b/drivers/gpu/drm/drm_colorop.c
@@ -109,6 +109,17 @@ static int drm_colorop_init(struct drm_device *dev, struct drm_colorop *colorop,
 				   colorop->type_property,
 				   colorop->type);

+	/* bypass */
+	prop = drm_property_create_bool(dev, DRM_MODE_PROP_ATOMIC,
+					"BYPASS");
+	if (!prop)
+		return -ENOMEM;
+
+	colorop->bypass_property = prop;
+	drm_object_attach_property(&colorop->base,
+				   colorop->bypass_property,
+				   1);
+
 	return ret;
 }

@@ -166,6 +177,7 @@ int drm_colorop_curve_1d_init(struct drm_device *dev, struct drm_colorop *coloro
 	/* initialize 1D curve only attribute */
 	prop = drm_property_create_enum(dev, DRM_MODE_PROP_ATOMIC, "CURVE_1D_TYPE",
 					enum_list, len);
+
 	if (!prop)
 		return -ENOMEM;

@@ -182,6 +194,8 @@ static void __drm_atomic_helper_colorop_duplicate_state(struct drm_colorop *colo
 							struct drm_colorop_state *state)
 {
 	memcpy(state, colorop->state, sizeof(*state));
+
+	state->bypass = true;
 }

 struct drm_colorop_state *
@@ -220,6 +234,7 @@ static void __drm_colorop_state_reset(struct drm_colorop_state *colorop_state,
 	u64 val;

 	colorop_state->colorop = colorop;
+	colorop_state->bypass = true;

 	if (colorop->curve_1d_type_property) {
 		drm_object_property_get_default_value(&colorop->base,
diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
index 6b8722ea22c7..29be3563eda1 100644
--- a/include/drm/drm_colorop.h
+++ b/include/drm/drm_colorop.h
@@ -78,6 +78,16 @@ struct drm_colorop_state {
 	 * information.
 	 */

+
+	/**
+	 * @bypass:
+	 *
+	 * When the property BYPASS exists on this colorop, this stores
+	 * the requested bypass state: true if colorop shall be bypassed,
+	 * false if colorop is enabled.
+	 */
+	bool bypass;
+
 	/**
 	 * @curve_1d_type:
 	 *
@@ -162,6 +172,18 @@ struct drm_colorop {
 	 */
 	struct drm_property *type_property;

+	/**
+	 * @bypass_property:
+	 *
+	 * Boolean property to control enablement of the color
+	 * operation. Setting bypass to "true" shall always be supported
+	 * in order to allow compositors to quickly fall back to
+	 * alternate methods of color processing. This is important
+	 * since setting color operations can fail due to unique
+	 * HW constraints.
+	 */
+	struct drm_property *bypass_property;
+
 	/**
 	 * @curve_1d_type_property:
 	 *
--
2.46.2

