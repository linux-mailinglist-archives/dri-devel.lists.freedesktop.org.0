Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED4A5C5FABC
	for <lists+dri-devel@lfdr.de>; Sat, 15 Nov 2025 01:07:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5340B10EBD4;
	Sat, 15 Nov 2025 00:07:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="PBN5Cpa7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012027.outbound.protection.outlook.com
 [40.107.200.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03CB810EBAE;
 Sat, 15 Nov 2025 00:07:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OP3TBdJNXb5kCjpZf/kIXunh/IkAhX3P1jBRdSFR4NeSnUk4dCVMVTgcNblbARJiGhof3D05DVBwC6C0v8i4o5ZtbON9MZj0STwNbLzzv/wXQOUUyXz/qCItcObbsnd0gpLHKJZK5sCEQg2vHv2WGtjUYvDgufkgbQEnrwrAI/DAwB5U5X0wtnWHt3iCofG91+O2jOfAuctsGEP5enMOkKRCo13p7PFXrl+cJh0MCuwZI7KOQJqNBkWbc75DCXb3I/XmuLu+ljHrhSo/wkzngtCSinBYrTmfTcA0+qzdOujM2tVM6VRAeErUnFa+LvzE3KR2r11K0skDCqsRS3vS1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RUvrd37QerBhJq5YsQoatjkvTUdBft0kxWXP6Nzzxw0=;
 b=BLskDF7+/4WtMs3ehUWJHDkhvUCkYocg9IdAr5wM+cc3fIHMDZ62+VQuAzLfbRuqcxr5pE7g26Jb31AZZ6uwOug0U/lbHdHfrjwEtNOcHsBpJUobWFfCkvTzmO9JXNw4Ui8UkJ4foaD/+BlvNHTdPwdpr3jPmlXeFAzHIrpZ64IYy/fq87eqcnIBq/dIjGyaNTU/84g1KCI5/VboRGXJ8u6jCoNWZ/iBExEl3cjtDbwk+pmgpNIhz2ADeReakyFiJpkeaW/CfEX5coND7cICtbA3rIW2Pz9enl3LBeKnJJgcfNbDAzc/uG/S4lGeGWg/xdRT0Sz/BZNAWaBPBmDmpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RUvrd37QerBhJq5YsQoatjkvTUdBft0kxWXP6Nzzxw0=;
 b=PBN5Cpa7El9TGferB+AWXLC3ooiTAxPEXxCbAsY15q+/ennV9kEpEbToWxsK9esPvDpkgXk/xya32qPj/2V2O5cX70DPbpZLq+vmR310bnG8d968wtcIrqfgNmR+WMlxwlu0x+RFLoq3JLv8myqQ7Sop+VgKaAPMG/Ih+wNRd9g=
Received: from BY3PR05CA0053.namprd05.prod.outlook.com (2603:10b6:a03:39b::28)
 by IA0PR12MB7699.namprd12.prod.outlook.com (2603:10b6:208:431::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Sat, 15 Nov
 2025 00:07:37 +0000
Received: from SJ5PEPF000001D5.namprd05.prod.outlook.com
 (2603:10b6:a03:39b:cafe::21) by BY3PR05CA0053.outlook.office365.com
 (2603:10b6:a03:39b::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.7 via Frontend Transport; Sat,
 15 Nov 2025 00:07:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001D5.mail.protection.outlook.com (10.167.242.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Sat, 15 Nov 2025 00:07:37 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 16:07:33 -0800
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
 <mcanal@igalia.com>, <nfraprado@collabora.com>, <arthurgrillo@riseup.net>
Subject: [PATCH V13 16/51] drm/vkms: Add config for default plane pipeline
Date: Fri, 14 Nov 2025 17:01:41 -0700
Message-ID: <20251115000237.3561250-17-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D5:EE_|IA0PR12MB7699:EE_
X-MS-Office365-Filtering-Correlation-Id: 406391eb-14ca-492c-3639-08de23dafc45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|36860700013|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?NyU1oLswWT57IZ75sGUPnuigoajCKZkckZ1sVLss/yYd/Jf3jq4DGyB9KpQr?=
 =?us-ascii?Q?+8HWtOu/+W6ZuCMidZ5XjeDW5GklAoWRdrjfnfg6EmZfkpqLW2cmiSzhBu58?=
 =?us-ascii?Q?+NXaIBFIe9+2+ujoYR+Po1ro+x1pPzXfFVkvrW3BaUFdrAS3Gfs714e2M732?=
 =?us-ascii?Q?JqshEY8jwIP2eWB6Mfhk8YXTDrVrK2HTkIfub3wTAgfkezKSpy5mfBHuFMp8?=
 =?us-ascii?Q?E/+LYy6HmpuJm90oJkf+PaRSogtPlA+bY769Q2OoOXVFV/Fk2JeRdeDXa8Fa?=
 =?us-ascii?Q?fBJw/eeAKrCHX9JLcNxiEHv8AzkMjwLcPTghSZedYz5bsJ1UKUYekG3S5e4b?=
 =?us-ascii?Q?ulSpxGGB+5baPia27yiyKvvJva8qstWZqtUSya9Pll2u6hwrkTgHVXzR9zzX?=
 =?us-ascii?Q?YuWdyofwmfanZsmJhVquFILasdAn2w9f3qgAa3Z1vwlNHL3nXRRfRqiY1m3D?=
 =?us-ascii?Q?38PILqnhbxdMNx9XIndO7G8xDHQPb/8XtsyCFCoTN+TJ8jtF9NEC9339mLla?=
 =?us-ascii?Q?W1GNLSVWbWMMHDa//8MVZDe1ogvRH+zqSctNL7Rfp7x5GaZ2XdzwWQTyYLq/?=
 =?us-ascii?Q?UdPtpsTxRllURlREkw/PdlQEIpyts9TMmRhK8cpI0xFv8Rwj9h62d4xkhE93?=
 =?us-ascii?Q?VswCKs6AnkXwwhDm0gDnS+w5VrKTuJHe5kfIdOu4MKUA1/Mj0MWufOWWREBC?=
 =?us-ascii?Q?YW6W/HVZyd7i2HWFmBf/JqCU4BlqelfE7QBQGkq4vO0/4bepFoeJujnJIwI8?=
 =?us-ascii?Q?sRjn2RXl2IqF2+SchDeh9JU4mM0vhLCpIDRVm2MphWsXEY2LksrK8lfr8XZC?=
 =?us-ascii?Q?/kbuJrV2XVzWVOGBP+T6tco1lguksaH217sioLy3rnQyFh5MhpAUaRN+25xm?=
 =?us-ascii?Q?YxVyEC2Juj1NlRKQqf5UeuM+vXfWZS2FEjyiqHT7D556U/u0HaqBfY0c3ivj?=
 =?us-ascii?Q?hnCbxizmpYQT+opy8TuSDMPsnPj3VHGHMJI0lujz9SXAQg2rOehZ3t/0G+zx?=
 =?us-ascii?Q?GuQSIUGVwaw4T7VBYz+I6XdBjMyk0h8Z1GK6vkB+5CHE50UaOX3DOZBo0jID?=
 =?us-ascii?Q?YGlaTqerjDpGrqreU+GpMjD9BVwNNL4ocFPkU/VvGnW101jWM6UR1DB+7kMe?=
 =?us-ascii?Q?ytH45aSzA8uU5D7wGXLl6+OyKq6D+/UzQtwLyR0jVqvAtYI3UpEtonVHmnIj?=
 =?us-ascii?Q?xSL24EVV5kCjQJE4Vmqhxar/DroHTVDM9u1mnBW+cbYYK4fq9K5A3UOq9DgP?=
 =?us-ascii?Q?j8lIHV4miOrw8dF/FF36ej0qFebdWPOCGsOnhZoZ+G7phouQgRNjdHTO5717?=
 =?us-ascii?Q?iIh/R+k+Q/KkVYvdLmPWzhe1uTEUvjrIaMk2+Kqwoz7LWdEqkbpxXIhgJdkz?=
 =?us-ascii?Q?QUwaCtb7A4Qhzh0JVRbfhkxQW9pJARIthl1LD2He/oaDpKttxZ0rkaPwFtgF?=
 =?us-ascii?Q?iH4sgW4iIDh5SKXwRTb1Z+i4TpZ9BAojY9h5rPvLY57mc6qfH4y6GHJTXt1O?=
 =?us-ascii?Q?9/18mmqNkm2XT142TnCQhy6lQ19Z97DRBMMnGpMDSnMVBBVVY+cfZWvZaAcy?=
 =?us-ascii?Q?O5DBxMinANYHgyILviQ=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(36860700013)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2025 00:07:37.4078 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 406391eb-14ca-492c-3639-08de23dafc45
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001D5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7699
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

From: Louis Chauvet <louis.chauvet@bootlin.com>

With the introduction of color pipeline in VKMS, the default device may
have planes with color pipelines. To avoid breaking existing uAPI,
create a kernel argument to disable them by default and a vkms_config
field to configure the plane.

This field is not definitive and will be replaced once the uAPI will be
able to configure color pipelines. For now devices created with ConfigFS
will not have any color pipeline so we can decide later how the uAPI
will look like.

Reviewed-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
v13
 - a new patch in v13

 drivers/gpu/drm/vkms/tests/vkms_config_test.c | 47 ++++++++++++-------
 drivers/gpu/drm/vkms/vkms_config.c            |  7 ++-
 drivers/gpu/drm/vkms/vkms_config.h            | 28 ++++++++++-
 drivers/gpu/drm/vkms/vkms_drv.c               |  6 ++-
 drivers/gpu/drm/vkms/vkms_plane.c             |  3 +-
 5 files changed, 70 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/vkms/tests/vkms_config_test.c b/drivers/gpu/drm/vkms/tests/vkms_config_test.c
index d75a6252e4d2..1e4ea1863420 100644
--- a/drivers/gpu/drm/vkms/tests/vkms_config_test.c
+++ b/drivers/gpu/drm/vkms/tests/vkms_config_test.c
@@ -83,6 +83,7 @@ struct default_config_case {
 	bool enable_cursor;
 	bool enable_writeback;
 	bool enable_overlay;
+	bool enable_plane_pipeline;
 };
 
 static void vkms_config_test_empty_config(struct kunit *test)
@@ -108,14 +109,22 @@ static void vkms_config_test_empty_config(struct kunit *test)
 }
 
 static struct default_config_case default_config_cases[] = {
-	{ false, false, false },
-	{ true, false, false },
-	{ true, true, false },
-	{ true, false, true },
-	{ false, true, false },
-	{ false, true, true },
-	{ false, false, true },
-	{ true, true, true },
+	{ false, false, false, false },
+	{ true, false, false, false },
+	{ true, true, false, false },
+	{ true, false, true, false },
+	{ false, true, false, false },
+	{ false, true, true, false },
+	{ false, false, true, false },
+	{ true, true, true, false },
+	{ false, false, false, true },
+	{ true, false, false, true },
+	{ true, true, false, true },
+	{ true, false, true, true },
+	{ false, true, false, true },
+	{ false, true, true, true },
+	{ false, false, true, true },
+	{ true, true, true, true },
 };
 
 KUNIT_ARRAY_PARAM(default_config, default_config_cases, NULL);
@@ -132,11 +141,15 @@ static void vkms_config_test_default_config(struct kunit *test)
 
 	config = vkms_config_default_create(params->enable_cursor,
 					    params->enable_writeback,
-					    params->enable_overlay);
+					    params->enable_overlay,
+					    params->enable_plane_pipeline);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, config);
 
 	/* Planes */
 	vkms_config_for_each_plane(config, plane_cfg) {
+		KUNIT_EXPECT_EQ(test,
+				vkms_config_plane_get_default_pipeline(plane_cfg),
+				params->enable_plane_pipeline);
 		switch (vkms_config_plane_get_type(plane_cfg)) {
 		case DRM_PLANE_TYPE_PRIMARY:
 			n_primaries++;
@@ -368,7 +381,7 @@ static void vkms_config_test_invalid_plane_number(struct kunit *test)
 	struct vkms_config_plane *plane_cfg;
 	int n;
 
-	config = vkms_config_default_create(false, false, false);
+	config = vkms_config_default_create(false, false, false, false);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, config);
 
 	/* Invalid: No planes */
@@ -393,7 +406,7 @@ static void vkms_config_test_valid_plane_type(struct kunit *test)
 	struct vkms_config_encoder *encoder_cfg;
 	int err;
 
-	config = vkms_config_default_create(false, false, false);
+	config = vkms_config_default_create(false, false, false, false);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, config);
 
 	plane_cfg = get_first_plane(config);
@@ -474,7 +487,7 @@ static void vkms_config_test_valid_plane_possible_crtcs(struct kunit *test)
 	struct vkms_config_plane *plane_cfg;
 	struct vkms_config_crtc *crtc_cfg;
 
-	config = vkms_config_default_create(false, false, false);
+	config = vkms_config_default_create(false, false, false, false);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, config);
 
 	plane_cfg = get_first_plane(config);
@@ -493,7 +506,7 @@ static void vkms_config_test_invalid_crtc_number(struct kunit *test)
 	struct vkms_config_crtc *crtc_cfg;
 	int n;
 
-	config = vkms_config_default_create(false, false, false);
+	config = vkms_config_default_create(false, false, false, false);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, config);
 
 	/* Invalid: No CRTCs */
@@ -516,7 +529,7 @@ static void vkms_config_test_invalid_encoder_number(struct kunit *test)
 	struct vkms_config_encoder *encoder_cfg;
 	int n;
 
-	config = vkms_config_default_create(false, false, false);
+	config = vkms_config_default_create(false, false, false, false);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, config);
 
 	/* Invalid: No encoders */
@@ -541,7 +554,7 @@ static void vkms_config_test_valid_encoder_possible_crtcs(struct kunit *test)
 	struct vkms_config_encoder *encoder_cfg;
 	int err;
 
-	config = vkms_config_default_create(false, false, false);
+	config = vkms_config_default_create(false, false, false, false);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, config);
 
 	crtc_cfg1 = get_first_crtc(config);
@@ -587,7 +600,7 @@ static void vkms_config_test_invalid_connector_number(struct kunit *test)
 	struct vkms_config_connector *connector_cfg;
 	int n;
 
-	config = vkms_config_default_create(false, false, false);
+	config = vkms_config_default_create(false, false, false, false);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, config);
 
 	/* Invalid: No connectors */
@@ -610,7 +623,7 @@ static void vkms_config_test_valid_connector_possible_encoders(struct kunit *tes
 	struct vkms_config_encoder *encoder_cfg;
 	struct vkms_config_connector *connector_cfg;
 
-	config = vkms_config_default_create(false, false, false);
+	config = vkms_config_default_create(false, false, false, false);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, config);
 
 	encoder_cfg = get_first_encoder(config);
diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
index f8394a063ecf..8788df9edb7c 100644
--- a/drivers/gpu/drm/vkms/vkms_config.c
+++ b/drivers/gpu/drm/vkms/vkms_config.c
@@ -33,7 +33,8 @@ EXPORT_SYMBOL_IF_KUNIT(vkms_config_create);
 
 struct vkms_config *vkms_config_default_create(bool enable_cursor,
 					       bool enable_writeback,
-					       bool enable_overlay)
+					       bool enable_overlay,
+					       bool enable_plane_pipeline)
 {
 	struct vkms_config *config;
 	struct vkms_config_plane *plane_cfg;
@@ -58,6 +59,7 @@ struct vkms_config *vkms_config_default_create(bool enable_cursor,
 
 	if (vkms_config_plane_attach_crtc(plane_cfg, crtc_cfg))
 		goto err_alloc;
+	vkms_config_plane_set_default_pipeline(plane_cfg, enable_plane_pipeline);
 
 	if (enable_overlay) {
 		for (n = 0; n < NUM_OVERLAY_PLANES; n++) {
@@ -67,6 +69,7 @@ struct vkms_config *vkms_config_default_create(bool enable_cursor,
 
 			vkms_config_plane_set_type(plane_cfg,
 						   DRM_PLANE_TYPE_OVERLAY);
+			vkms_config_plane_set_default_pipeline(plane_cfg, enable_plane_pipeline);
 
 			if (vkms_config_plane_attach_crtc(plane_cfg, crtc_cfg))
 				goto err_alloc;
@@ -79,6 +82,7 @@ struct vkms_config *vkms_config_default_create(bool enable_cursor,
 			goto err_alloc;
 
 		vkms_config_plane_set_type(plane_cfg, DRM_PLANE_TYPE_CURSOR);
+		vkms_config_plane_set_default_pipeline(plane_cfg, enable_plane_pipeline);
 
 		if (vkms_config_plane_attach_crtc(plane_cfg, crtc_cfg))
 			goto err_alloc;
@@ -389,6 +393,7 @@ struct vkms_config_plane *vkms_config_create_plane(struct vkms_config *config)
 		return ERR_PTR(-ENOMEM);
 
 	plane_cfg->config = config;
+	plane_cfg->default_pipeline = false;
 	vkms_config_plane_set_type(plane_cfg, DRM_PLANE_TYPE_OVERLAY);
 	xa_init_flags(&plane_cfg->possible_crtcs, XA_FLAGS_ALLOC);
 
diff --git a/drivers/gpu/drm/vkms/vkms_config.h b/drivers/gpu/drm/vkms/vkms_config.h
index 4c8d668e7ef8..8f7f286a4bdd 100644
--- a/drivers/gpu/drm/vkms/vkms_config.h
+++ b/drivers/gpu/drm/vkms/vkms_config.h
@@ -49,6 +49,7 @@ struct vkms_config_plane {
 
 	enum drm_plane_type type;
 	struct xarray possible_crtcs;
+	bool default_pipeline;
 
 	/* Internal usage */
 	struct vkms_plane *plane;
@@ -203,7 +204,8 @@ struct vkms_config *vkms_config_create(const char *dev_name);
  */
 struct vkms_config *vkms_config_default_create(bool enable_cursor,
 					       bool enable_writeback,
-					       bool enable_overlay);
+					       bool enable_overlay,
+					       bool enable_plane_pipeline);
 
 /**
  * vkms_config_destroy() - Free a VKMS configuration
@@ -288,6 +290,30 @@ vkms_config_plane_set_type(struct vkms_config_plane *plane_cfg,
 	plane_cfg->type = type;
 }
 
+/**
+ * vkms_config_plane_get_default_pipeline() - Return if the plane will
+ * be created with the default pipeline
+ * @plane_cfg: Plane to get the information from
+ */
+static inline bool
+vkms_config_plane_get_default_pipeline(struct vkms_config_plane *plane_cfg)
+{
+	return plane_cfg->default_pipeline;
+}
+
+/**
+ * vkms_config_plane_set_default_pipeline() - Set if the plane will
+ * be created with the default pipeline
+ * @plane_cfg: Plane to configure the pipeline
+ * @default_pipeline: New default pipeline value
+ */
+static inline void
+vkms_config_plane_set_default_pipeline(struct vkms_config_plane *plane_cfg,
+				       bool default_pipeline)
+{
+	plane_cfg->default_pipeline = default_pipeline;
+}
+
 /**
  * vkms_config_plane_attach_crtc - Attach a plane to a CRTC
  * @plane_cfg: Plane to attach
diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index c659de653197..7eaa5c035f5f 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -51,6 +51,10 @@ static bool enable_overlay;
 module_param_named(enable_overlay, enable_overlay, bool, 0444);
 MODULE_PARM_DESC(enable_overlay, "Enable/Disable overlay support");
 
+static bool enable_plane_pipeline;
+module_param_named(enable_plane_pipeline, enable_plane_pipeline, bool, 0444);
+MODULE_PARM_DESC(enable_plane_pipeline, "Enable/Disable plane pipeline support");
+
 static bool create_default_dev = true;
 module_param_named(create_default_dev, create_default_dev, bool, 0444);
 MODULE_PARM_DESC(create_default_dev, "Create or not the default VKMS device");
@@ -227,7 +231,7 @@ static int __init vkms_init(void)
 	if (!create_default_dev)
 		return 0;
 
-	config = vkms_config_default_create(enable_cursor, enable_writeback, enable_overlay);
+	config = vkms_config_default_create(enable_cursor, enable_writeback, enable_overlay, enable_plane_pipeline);
 	if (IS_ERR(config))
 		return PTR_ERR(config);
 
diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
index 92345ba32b93..19fe6acad306 100644
--- a/drivers/gpu/drm/vkms/vkms_plane.c
+++ b/drivers/gpu/drm/vkms/vkms_plane.c
@@ -246,7 +246,8 @@ struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
 					  DRM_COLOR_YCBCR_BT601,
 					  DRM_COLOR_YCBCR_FULL_RANGE);
 
-	vkms_initialize_colorops(&plane->base);
+	if (vkms_config_plane_get_default_pipeline(plane_cfg))
+		vkms_initialize_colorops(&plane->base);
 
 	return plane;
 }
-- 
2.43.0

