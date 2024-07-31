Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20253943840
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2024 23:50:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5E5D10E330;
	Wed, 31 Jul 2024 21:50:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="kiQgguL3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2061.outbound.protection.outlook.com [40.107.237.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B38D310E330
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2024 21:49:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wG7OdxWlhjH76rv4seCZ/1ocXjJ9Y+cL3BJuoi7t7YUmZECwIUqrbtjlS5JoS3+V4r9Wrv71gKJWhHna2UjI4akSo5OIj84Nd1b3UkCtAW+jcHdTx8KMhF7Q335ojw8bKghq/+fWozL3EEStsyOLJTbagn2loVFjuWo+gNTVQD2mimQ/xD/O55QnS7KxASd2UjjMerqRQWQomMiDgRKWzSjXMj9kxaevP3TfpO6SRjFELAIccs4Eej3haKxGH0032+PIGcV3XZw7WZkTiYxKKU57HoZeMMpOl5svB9XlYG3guB1sIsclGHXlZ/A+qjQuiLJMMMEdqOEF2x5ecy7sHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RvR2dThGH3UqLgVy3Oh+bkKd3KIUAx0Ojt8h2qqgUE8=;
 b=Q6U1UwFkDWV56xFOeL0x9Zy8AVgqe6chRGhJWjplP0cfBq5uftEu5bb1eAi+r6r5mc9MMbxrKdNzuVbKE5tQteieKNVrbI7m21ZTKAnssTe99QwIS/IOUdHS7fzCKsaFW5v5uCts9gak/4zy4rdGpCx85sgp9uPCIwjtHgVdXVVvqNDOwrVF2j8qU2n7mahtHEespUdWw7OQJqKYSCpnvttl0M7OYHzSCVxXtXgpB4KyNNHvifbYIxycN7+29uPfrQvJlCP7M1/Rr0yA9LhrN2FCsSToEGr79HX7BH5sAnxNsGoT7PumPRKKVE+fbwXqHjOdseOBuu5y8Jyjvm2jDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RvR2dThGH3UqLgVy3Oh+bkKd3KIUAx0Ojt8h2qqgUE8=;
 b=kiQgguL3YBiwEtLsNIscGv/wsLw5p1c4PZKDHL7w1dKCXNe0t4s1MuOw31JZEhfEJ3miOigMTFfVVuljGdUDJMrYKcY8WxaTsxOEW1+wS3D8q4zUhUpZyXXH3sv7zuPTPCDgB6fY7Xl2aTd5rLAt9f3r6B/JyqStvWDgfe//UsE=
Received: from SJ0PR13CA0174.namprd13.prod.outlook.com (2603:10b6:a03:2c7::29)
 by SN7PR12MB6959.namprd12.prod.outlook.com (2603:10b6:806:261::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.21; Wed, 31 Jul
 2024 21:49:55 +0000
Received: from CO1PEPF000044F3.namprd05.prod.outlook.com
 (2603:10b6:a03:2c7:cafe::18) by SJ0PR13CA0174.outlook.office365.com
 (2603:10b6:a03:2c7::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.6 via Frontend
 Transport; Wed, 31 Jul 2024 21:49:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044F3.mail.protection.outlook.com (10.167.241.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7828.19 via Frontend Transport; Wed, 31 Jul 2024 21:49:54 +0000
Received: from hamza-pc.localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 31 Jul
 2024 16:49:52 -0500
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
To: <dri-devel@lists.freedesktop.org>
CC: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Jani Nikula <jani.nikula@linux.intel.com>, Daniel Vetter
 <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>, Rodrigo Siqueira
 <rodrigo.siqueira@amd.com>, Harry Wentland <harry.wentland@amd.com>, "Hamza
 Mahfooz" <hamza.mahfooz@amd.com>, Karol Herbst <kherbst@redhat.com>
Subject: [PATCH v2] drm/edid: add CTA Video Format Data Block support
Date: Wed, 31 Jul 2024 17:49:41 -0400
Message-ID: <20240731214941.257975-1-hamza.mahfooz@amd.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F3:EE_|SN7PR12MB6959:EE_
X-MS-Office365-Filtering-Correlation-Id: 360683a6-d147-458d-c5c8-08dcb1aab6ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2k/R9sBiNYkI1/hctHqNJmfXTjaG9dRd4bVTSJ45LdvAyZIkd/uC3CsoVm8z?=
 =?us-ascii?Q?Rfy7eKRW8O5Z+RToVorzQ7fv0UJRzaQrE3j+MVGSpMMHbroOH8I+9U91b53H?=
 =?us-ascii?Q?fndUvXjTFFJwJI9tDkKKURnJbtPhcgjhI84ljTsbqleQkIvTIYeAs7y5wIPa?=
 =?us-ascii?Q?fWebtQfsJ4l5m/Of4xOIiGUvHeF19S63FTm+WEFTx4dK8mpz51X7VvDaGskf?=
 =?us-ascii?Q?4McTyjHNI0bepb3haSQNGXWnl+bEyyc45qkvetgqGTH0IuzXJuUoD3W6U482?=
 =?us-ascii?Q?L55iU4gH9QrTbMax9uiMTX6oTpMdgvAMzFfRMFOoelGe/s5aBafBPdHfGP3R?=
 =?us-ascii?Q?xy5lZRGT6+oaQBL4APUvrRMPRbuzKQAXvGq4kj1naao8mY9P7UyWWTN1lbb4?=
 =?us-ascii?Q?WC6uo13ZtxA+iIr0SBZ2nu/g+Veiwsu7eP+cXUFpaH9epkIK+qKlD3aeWiKI?=
 =?us-ascii?Q?VwgzvJ7ZEk/4cvpd06IFTLRggds7GWb7qIUDZVH3ie2heRoYk44ZM4QknAps?=
 =?us-ascii?Q?5+yZZPLgz+/bFk8S+TOSnntxOQ6rv2OCJuGQxtTdqDCCDHvgHqzmTIYOiSmQ?=
 =?us-ascii?Q?mRy0NVXqz5U/61K8JAZVwZGIQ/fVlxGXt2RcFNHqqVzB1ChXRrP1jok5GklC?=
 =?us-ascii?Q?woyZsjB7FPmJsAMz55ocmddTcrc1IB/e0TyRkh9YD+m5Qf60EyDGiar/7aoe?=
 =?us-ascii?Q?LqvHO+N2v73fJmr0XV0yOapDk+hvUzqX/HmJD6CQn3NHPPhYl/DrAaiIKmiW?=
 =?us-ascii?Q?vehonO0QqRVAPjHZKPEblYheqZS71W5T7WnWiwolqTzb05nlk7TFGrhfH6uH?=
 =?us-ascii?Q?W2UkgIaDiL7mQmmfNWjkKgX0eu9RFxoBLXPgQWAkcc6Jf2kc4/TTsmdgc6LB?=
 =?us-ascii?Q?fGKEO/wll8S2wcVJ8napyhbVvzYpNBtoe/Nr86oUjMIzx/Ys+qKyKyHkP0KJ?=
 =?us-ascii?Q?b1Kf8PaBl3IXmThlXpEDNPod3IOjSMLM60oIhG6u6Dk0M6pFiIKrNHWYQgw5?=
 =?us-ascii?Q?tj1m5k8+ioXnEwApY9WC7r3vjswdf1CzYPb+rnjI29G1iPnv7hq/JkAnyuRY?=
 =?us-ascii?Q?JnWe1D51zDssUqwsyTCsklGSSkNuW5Iw78HwS5c9r6ktxt+ztfzRAHA9DHwo?=
 =?us-ascii?Q?b5aNv+cJTRARp4uiV7sqSJPNJrSbQGgdsRAO3WnmVn2ifUaPAoQTEJfD8aaV?=
 =?us-ascii?Q?8FgIatIgGX67G3U+uEXIU4hTPgjpnOx/Y1MBCNSBf0L5QG5P6g11faYCWThi?=
 =?us-ascii?Q?3kZHptvacQwu3mnll75eWSs631Dbo+u2AvVCP7FjVzVNbO7A5dDhudI3JcC/?=
 =?us-ascii?Q?rNRYU9D5CcVCjH9MrsijTwYche91JrmJFIR2r6Zu4zU0ID5zqmwuuAkYumeP?=
 =?us-ascii?Q?Mz4CJ9I8xvrFVWOPUo2GeKHn2TN0cJyR+1XSLz/d92pzb+TbgB8EKqRALVl/?=
 =?us-ascii?Q?Csrx8YtZf/YvI1iwb44HhUzTFmCIXiIo?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2024 21:49:54.4600 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 360683a6-d147-458d-c5c8-08dcb1aab6ac
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044F3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6959
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

Video Format Data Blocks (VFDBs) contain the necessary information that
needs to be fed to the Optimized Video Timings (OVT) Algorithm.
Also, we require OVT support to cover modes that aren't supported by
earlier standards (e.g. CVT). So, parse all of the relevant VFDB data
and feed it to the OVT Algorithm, to extract all of the missing OVT
modes.

Suggested-by: Karol Herbst <kherbst@redhat.com>
Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
---
v2: address comments from Jani
---
 drivers/gpu/drm/drm_edid.c | 456 ++++++++++++++++++++++++++++++++++---
 1 file changed, 428 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index f68a41eeb1fa..f608ab4e32ae 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -31,6 +31,7 @@
 #include <linux/bitfield.h>
 #include <linux/byteorder/generic.h>
 #include <linux/cec.h>
+#include <linux/gcd.h>
 #include <linux/hdmi.h>
 #include <linux/i2c.h>
 #include <linux/kernel.h>
@@ -741,6 +742,93 @@ static const struct minimode extra_modes[] = {
 	{ 2048, 1536, 60, 0 },
 };
 
+struct cta_rid {
+	u16 hactive;
+	u16 vactive;
+	u8 hratio;
+	u8 vratio;
+};
+
+/* CTA-861-I Table 11 - Resolution Identification (RID) */
+static const struct cta_rid rids[] = {
+	/* RID 0-9 */
+	{ 0, 0, 0, 0 },
+	{ 1280, 720, 16, 9 },
+	{ 1280, 720, 64, 27 },
+	{ 1680, 720, 64, 27 },
+	{ 1920, 1080, 16, 9 },
+	{ 1920, 1080, 64, 27 },
+	{ 2560, 1080, 64, 27 },
+	{ 3840, 1080, 32, 9 },
+	{ 2560, 1440, 16, 9 },
+	{ 3440, 1440, 64, 27 },
+	/* RID 10-19 */
+	{ 5120, 1440, 32, 9 },
+	{ 3840, 2160, 16, 9 },
+	{ 3840, 2160, 64, 27 },
+	{ 5120, 2160, 64, 27 },
+	{ 7680, 2160, 32, 9 },
+	{ 5120, 2880, 16, 9 },
+	{ 5120, 2880, 64, 27 },
+	{ 6880, 2880, 64, 27 },
+	{ 10240, 2880, 32, 9 },
+	{ 7680, 4320, 16, 9 },
+	/* RID 20-28 */
+	{ 7680, 4320, 64, 27 },
+	{ 10240, 4320, 64, 27 },
+	{ 15360, 4320, 32, 9 },
+	{ 11520, 6480, 16, 9 },
+	{ 11520, 6480, 64, 27 },
+	{ 15360, 6480, 64, 27 },
+	{ 15360, 8640, 16, 9 },
+	{ 15360, 8640, 64, 27 },
+	{ 20480, 8640, 64, 27 },
+};
+
+/* CTA-861-I Table 12 - AVI InfoFrame Video Format Frame Rate */
+static const u16 cta_vf_fr[] = {
+	/* Frame Rate 0-7 */
+	0, 24, 25, 30, 48, 50, 60, 100,
+	/* Frame Rate 8-15 */
+	120, 144, 200, 240, 300, 360, 400, 480,
+};
+
+/* CTA-861-I Table 13 - RID To VIC Mapping */
+static const u8 rid_to_vic[][8] = {
+	/* RID 0-9 */
+	{},
+	{ 60, 61, 62, 108, 19, 4, 41, 47 },
+	{ 65, 66, 67, 109, 68, 69, 70, 71 },
+	{ 79, 80, 81, 110, 82, 83, 84, 85 },
+	{ 32, 33, 34, 111, 31, 16, 64, 63 },
+	{ 72, 73, 74, 112, 75, 76, 77, 78 },
+	{ 86, 87, 88, 113, 89, 90, 91, 92 },
+	{},
+	{},
+	{},
+	/* RID 10-19 */
+	{},
+	{ 93, 94, 95, 114, 96, 97, 117, 118 },
+	{ 103, 104, 105, 116, 106, 107, 119, 120 },
+	{ 121, 122, 123, 124, 125, 126, 127, 193 },
+	{},
+	{},
+	{},
+	{},
+	{},
+	{ 194, 195, 196, 197, 198, 199, 200, 201 },
+	/* RID 20-28 */
+	{ 202, 203, 204, 205, 206, 207, 208, 209 },
+	{ 210, 211, 212, 213, 214, 215, 216, 217 },
+	{},
+	{},
+	{},
+	{},
+	{},
+	{},
+	{},
+};
+
 /*
  * From CEA/CTA-861 spec.
  *
@@ -4140,6 +4228,7 @@ static int add_detailed_modes(struct drm_connector *connector,
 #define CTA_DB_VIDEO			2
 #define CTA_DB_VENDOR			3
 #define CTA_DB_SPEAKER			4
+#define CTA_DB_VIDEO_FORMAT		6
 #define CTA_DB_EXTENDED_TAG		7
 
 /* CTA-861-H Table 62 - CTA Extended Tag Codes */
@@ -4981,6 +5070,16 @@ struct cea_db {
 	u8 data[];
 } __packed;
 
+struct cta_vfd {
+	u8 rid;
+	u8 fr_fact;
+	bool bfr50;
+	bool fr24;
+	bool bfr60;
+	bool fr144;
+	bool fr48;
+};
+
 static int cea_db_tag(const struct cea_db *db)
 {
 	return db->tag_length >> 5;
@@ -5306,34 +5405,6 @@ static void parse_cta_y420cmdb(struct drm_connector *connector,
 	*y420cmdb_map = map;
 }
 
-static int add_cea_modes(struct drm_connector *connector,
-			 const struct drm_edid *drm_edid)
-{
-	const struct cea_db *db;
-	struct cea_db_iter iter;
-	int modes;
-
-	/* CTA VDB block VICs parsed earlier */
-	modes = add_cta_vdb_modes(connector);
-
-	cea_db_iter_edid_begin(drm_edid, &iter);
-	cea_db_iter_for_each(db, &iter) {
-		if (cea_db_is_hdmi_vsdb(db)) {
-			modes += do_hdmi_vsdb_modes(connector, (const u8 *)db,
-						    cea_db_payload_len(db));
-		} else if (cea_db_is_y420vdb(db)) {
-			const u8 *vdb420 = cea_db_data(db) + 1;
-
-			/* Add 4:2:0(only) modes present in EDID */
-			modes += do_y420vdb_modes(connector, vdb420,
-						  cea_db_payload_len(db) - 1);
-		}
-	}
-	cea_db_iter_end(&iter);
-
-	return modes;
-}
-
 static void fixup_detailed_cea_mode_clock(struct drm_connector *connector,
 					  struct drm_display_mode *mode)
 {
@@ -6018,6 +6089,305 @@ static void parse_cta_vdb(struct drm_connector *connector, const struct cea_db *
 	}
 }
 
+/* CTA-861 Video Format Descriptor (CTA VFD) */
+static void parse_cta_vfd(struct cta_vfd *vfd, const u8 *data, int vfd_len)
+{
+	vfd->rid = data[0] & 0x3f;
+	vfd->bfr50 = data[0] & 0x80;
+	vfd->fr24 = data[0] & 0x40;
+	vfd->bfr60 = vfd_len > 1 ? (data[1] & 0x80) : 0x1;
+	vfd->fr144 = vfd_len > 1 ? (data[1] & 0x40) : 0x0;
+	vfd->fr_fact = vfd_len > 1 ? (data[1] & 0x3f) : 0x3;
+	vfd->fr48 = vfd_len > 2 ? (data[2] & 0x1) : 0x0;
+}
+
+static bool vfd_has_fr(const struct cta_vfd *vfd, int rate_idx)
+{
+	static const u8 factors[] = {
+		1, 2, 4, 8, 12, 16
+	};
+	u16 rate = cta_vf_fr[rate_idx];
+	u16 factor = 0;
+	unsigned int i;
+
+	switch (rate) {
+	case 24:
+		return vfd->fr24;
+	case 48:
+		return vfd->fr48;
+	case 144:
+		return vfd->fr144;
+	}
+
+	if (!(rate % 25)) {
+		if (!vfd->bfr50)
+			return false;
+
+		factor = rate / 25;
+	} else if (!(rate % 30)) {
+		if (!vfd->bfr60)
+			return false;
+
+		factor = rate / 30;
+	}
+
+	for (i = 0; i < ARRAY_SIZE(factors); i++)
+		if (factor == factors[i] && (vfd->fr_fact & (1 << i)))
+			return true;
+
+	return false;
+}
+
+#define OVT_PIXEL_CLOCK_GRANULARITY	1000		/* Hz */
+#define OVT_MIN_HTOTAL_GRANULARITY	8		/* pixels */
+#define OVT_MIN_VBLANK_DURATION	460000000	/* ps */
+#define OVT_MIN_VBLANK_LINES		20
+#define OVT_MIN_VSYNC_LEADING_EDGE	400		/* us */
+#define OVT_MIN_VSYNC_LE_LINES		14
+#define OVT_MIN_CLOCK_RATE_420		590000000	/* Hz */
+#define OVT_PIXEL_FACTOR_420		2
+#define OVT_MIN_HBLANK_444		80		/* pixels */
+#define OVT_MIN_HBLANK_420		128		/* pixels */
+#define OVT_MAX_CHUNK_RATE		650000000	/* Hz */
+#define OVT_AUDIO_PACKET_RATE		195000		/* Hz */
+#define OVT_AUDIO_PACKET_SIZE		32
+#define OVT_LINE_OVERHEAD		32
+#define OVT_HSYNC_WIDTH		32
+#define OVT_VSYNC_WIDTH		8
+
+/* OVT Algorthim as specified in CTA-861-I */
+static struct drm_display_mode *
+calculate_ovt_mode(struct drm_connector *connector, const struct cta_rid *rid,
+		   u16 vrate)
+{
+	u32 max_audio_packets_per_line;
+	struct drm_display_mode *mode;
+	u32 htotal_granularity_chunk;
+	u32 resolution_granularity;
+	u32 vtotal_granularity = 1;
+	u64 min_pixel_clock_rate;
+	u32 htotal_granularity;
+	u32 max_vrate = vrate;
+	u64 pixel_clock_rate;
+	u64 max_active_time;
+	u64 min_resolution;
+	u32 vsync_position;
+	u32 min_line_time;
+	u32 min_line_rate;
+	u32 min_hblank;
+	u32 min_htotal;
+	u32 min_vblank;
+	u32 min_vtotal;
+	u32 htotal;
+	u32 vtotal;
+	u32 h;
+	u64 r;
+	u32 v;
+
+	/* step 1 */
+	switch (vrate) {
+	case 24:
+	case 25:
+		max_vrate = 30;
+		fallthrough;
+	case 30:
+		vtotal_granularity = 20;
+		break;
+	case 48:
+	case 50:
+		max_vrate = 60;
+		fallthrough;
+	case 60:
+		vtotal_granularity = 20;
+		break;
+	case 100:
+		max_vrate = 120;
+		fallthrough;
+	case 120:
+		vtotal_granularity = 5;
+		break;
+	case 200:
+		max_vrate = 240;
+		fallthrough;
+	case 240:
+		vtotal_granularity = 5;
+		break;
+	case 300:
+		max_vrate = 360;
+		fallthrough;
+	case 360:
+		vtotal_granularity = 5;
+		break;
+	case 400:
+		max_vrate = 480;
+		fallthrough;
+	case 480:
+		vtotal_granularity = 5;
+		break;
+	}
+
+	/* step 2 */
+	max_active_time = ((u64)1000000000000 / (u64)max_vrate) -
+		(u64)OVT_MIN_VBLANK_DURATION;
+
+	min_line_time = max_active_time / (u64)rid->vactive;
+
+	min_vblank = max_t(u64, (u64)OVT_MIN_VBLANK_LINES,
+			   DIV64_U64_ROUND_UP(OVT_MIN_VBLANK_DURATION,
+					      min_line_time));
+
+	min_vtotal = rid->vactive + min_vblank;
+
+	if (min_vtotal % vtotal_granularity)
+		min_vtotal += vtotal_granularity - (min_vtotal %
+						    vtotal_granularity);
+
+	/* step 3 */
+	min_line_rate = max_vrate * min_vtotal;
+
+	max_audio_packets_per_line = DIV_ROUND_UP(OVT_AUDIO_PACKET_RATE,
+						  min_line_rate);
+
+	/* step 4 */
+	min_hblank = OVT_LINE_OVERHEAD + OVT_AUDIO_PACKET_SIZE *
+		max_audio_packets_per_line;
+
+	min_htotal = rid->hactive + max(OVT_MIN_HBLANK_444, min_hblank);
+
+	min_pixel_clock_rate = max_vrate * min_htotal * min_vtotal;
+
+	htotal_granularity_chunk =
+		roundup_pow_of_two(DIV_ROUND_UP(min_pixel_clock_rate,
+						OVT_MAX_CHUNK_RATE));
+
+	htotal_granularity = max(OVT_MIN_HTOTAL_GRANULARITY,
+				 htotal_granularity_chunk);
+
+	if (min_htotal % htotal_granularity)
+		min_htotal += htotal_granularity - (min_htotal %
+						    htotal_granularity);
+
+	resolution_granularity = OVT_PIXEL_CLOCK_GRANULARITY /
+		gcd(OVT_PIXEL_CLOCK_GRANULARITY, max_vrate);
+
+	do {
+		/* step 5 */
+		min_resolution = 0;
+		v = min_vtotal;
+
+		goto loop_end;
+
+		while (!min_resolution || r <= min_resolution) {
+			while (r % resolution_granularity ||
+			       max_vrate * r / (h & ~(h - 1)) >
+			       OVT_MAX_CHUNK_RATE) {
+				h += htotal_granularity;
+				r = (u64)h * (u64)v;
+			}
+
+			if (!min_resolution || r < min_resolution) {
+				htotal = h;
+				vtotal = v;
+				min_resolution = r;
+			}
+
+			v += vtotal_granularity;
+
+loop_end:
+			h = min_htotal;
+			r = (u64)h * (u64)v;
+		}
+
+		pixel_clock_rate = max_vrate * min_resolution;
+
+		/* step 6 */
+		min_htotal = rid->hactive + max(OVT_MIN_HBLANK_420,
+						OVT_PIXEL_FACTOR_420 *
+						min_hblank);
+	} while (pixel_clock_rate >= OVT_MIN_CLOCK_RATE_420 &&
+		 htotal < min_htotal);
+
+	/* step 7 */
+	vtotal = vtotal * max_vrate / vrate;
+
+	/* step 8 */
+	vsync_position = max(OVT_MIN_VSYNC_LE_LINES,
+			     DIV64_U64_ROUND_UP((u64)OVT_MIN_VSYNC_LE_LINES *
+						(u64)pixel_clock_rate,
+						(u64)htotal * (u64)1000000));
+
+	mode = drm_mode_create(connector->dev);
+
+	if (!mode)
+		return NULL;
+
+	mode->clock = pixel_clock_rate / 1000;
+	mode->hdisplay = rid->hactive;
+	mode->hsync_start = htotal - OVT_HSYNC_WIDTH * 2;
+	mode->hsync_end = mode->hsync_start + OVT_HSYNC_WIDTH;
+	mode->htotal = htotal;
+
+	mode->vdisplay = rid->vactive;
+	mode->vsync_start = vtotal - vsync_position;
+	mode->vsync_end = mode->vsync_start + OVT_VSYNC_WIDTH;
+	mode->vtotal = vtotal;
+
+	return mode;
+}
+
+/* CTA-861 Video Format Data Block (CTA VFDB) */
+static int add_modes_from_vfdb(struct drm_connector *connector,
+			       const struct cea_db *db)
+{
+	struct drm_display_info *info = &connector->display_info;
+	int vfdb_len = cea_db_payload_len(db);
+	struct drm_display_mode *mode;
+	struct cta_vfd vfd;
+	int num_modes = 0;
+	int vfd_len;
+	int i;
+	int j;
+
+	if (!vfdb_len)
+		return 0;
+
+	vfd_len = (db->data[0] & 0x3) + 1;
+
+	if (!vfd_len)
+		return 0;
+
+	vfdb_len--;
+
+	vfdb_len -= (vfdb_len % vfd_len);
+
+	for (i = 0; i < vfdb_len; i += vfd_len) {
+		parse_cta_vfd(&vfd, &db->data[i + 1], vfd_len);
+
+		if (!vfd.rid || vfd.rid >= ARRAY_SIZE(rids))
+			continue;
+
+		for (j = 1; j < ARRAY_SIZE(cta_vf_fr); j++) {
+			if (!vfd_has_fr(&vfd, j) ||
+			    (cta_vf_fr[j] < 144 && rid_to_vic[vfd.rid][j - 1]))
+				continue;
+
+			mode = calculate_ovt_mode(connector, &rids[vfd.rid],
+						  cta_vf_fr[j]);
+
+			if (!mode)
+				continue;
+
+			mode->height_mm = info->height_mm;
+			mode->width_mm = info->width_mm;
+
+			drm_mode_probed_add(connector, mode);
+			num_modes++;
+		}
+	}
+
+	return num_modes;
+}
+
 /*
  * Update y420_cmdb_modes based on previously parsed CTA VDB and Y420CMDB.
  *
@@ -6831,6 +7201,36 @@ static int add_displayid_detailed_1_modes(struct drm_connector *connector,
 	return num_modes;
 }
 
+static int add_cea_modes(struct drm_connector *connector,
+			 const struct drm_edid *drm_edid)
+{
+	const struct cea_db *db;
+	struct cea_db_iter iter;
+	int modes;
+
+	/* CTA VDB block VICs parsed earlier */
+	modes = add_cta_vdb_modes(connector);
+
+	cea_db_iter_edid_begin(drm_edid, &iter);
+	cea_db_iter_for_each(db, &iter) {
+		if (cea_db_is_hdmi_vsdb(db)) {
+			modes += do_hdmi_vsdb_modes(connector, (const u8 *)db,
+						    cea_db_payload_len(db));
+		} else if (cea_db_is_y420vdb(db)) {
+			const u8 *vdb420 = cea_db_data(db) + 1;
+
+			/* Add 4:2:0(only) modes present in EDID */
+			modes += do_y420vdb_modes(connector, vdb420,
+						  cea_db_payload_len(db) - 1);
+		} else if (cea_db_tag(db) == CTA_DB_VIDEO_FORMAT) {
+			modes += add_modes_from_vfdb(connector, db);
+		}
+	}
+	cea_db_iter_end(&iter);
+
+	return modes;
+}
+
 static int add_displayid_detailed_modes(struct drm_connector *connector,
 					const struct drm_edid *drm_edid)
 {
-- 
2.45.2

