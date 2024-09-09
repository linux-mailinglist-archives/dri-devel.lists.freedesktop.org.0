Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D9BE972024
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2024 19:17:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BEF810E5EB;
	Mon,  9 Sep 2024 17:16:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="OzolalrP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2055.outbound.protection.outlook.com [40.107.223.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFEA310E5EB
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Sep 2024 17:16:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wzURO6f/WJ06whWs+Gw8+HKt8jWuaUVp6PI/V7qFEtVlRMIR8ihrqoruBB0IRHaTT0DfhpMPqKlw8mLKG2XODwzKKWtZfQYyo2CvAF2RCreuS4jNXExr+BTcwyF+VL/Nrsa1C6zWWiVkfPga7kL0riBU43m4eI0P8hU6chnkZJgIpXuaR5K6DDQaMyOvn1H4fv3a+rod1AebNyodnvhuWWgbW3cR5bOTgGWYZrat9K1Cr38KDCQ7fC5exjWKHPHNIVeSkDswA0m/GhAIgNX+drYGmUXjlPiVi1nkCWa316P/BEDY65wsGPOSW+o/iZxAmb5rDAlSLPl529JwFVt1oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1nb5iLGz46IeOCgrlSV+X68OKe5FiWCZonIq19xQntg=;
 b=T9UwjVp9fFokzJTGdqj1IiqBNp4i1dY370Ud0zCovnMguRHx+TiFV4d5qmsEACHsMV9fVZHSbGiI1amc54PhdH46zWRMOmm72LWN8eogfsic9soRyi/7gSVTL/pFHxOPlyj4XtlHLtckEAAx9MvRVMnWOrbIK+8qZcRy8OfZMVOeg1R3E1yXdzaoCReFr8CoyXou1MlgaWfFPSKg0lO5t2Rxp37e1PsIuf5I+QJr/DxIPhsUZTZaJMgySXiMknlGP/Wpsdo4CjaqJfe0py3gcGqyiv5MFDlQorU1vNGxVMd964OPbt1eDZXjABOEa66MwdyGsWEB3CAwFvoGtB9ZtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1nb5iLGz46IeOCgrlSV+X68OKe5FiWCZonIq19xQntg=;
 b=OzolalrPjblmoJQ/ke4Y/9xro4ABVzL9I8xsfEAlgviY31ZGIVehYyUCREGUNmAOKjFTRyHVpkOjoPyFRWjKkPXn3m2Q8rXoLDVw2js5MarDWpzpgg2T+hljoqJSCtWgL+yMtS+MqoMs2cNSDnvNJFre+ZkNH1XDIbwoHUHIxCs=
Received: from CH5P221CA0011.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:1f2::21)
 by CH2PR12MB4102.namprd12.prod.outlook.com (2603:10b6:610:a9::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.23; Mon, 9 Sep
 2024 17:16:48 +0000
Received: from CH1PEPF0000A346.namprd04.prod.outlook.com
 (2603:10b6:610:1f2:cafe::22) by CH5P221CA0011.outlook.office365.com
 (2603:10b6:610:1f2::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24 via Frontend
 Transport; Mon, 9 Sep 2024 17:16:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH1PEPF0000A346.mail.protection.outlook.com (10.167.244.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Mon, 9 Sep 2024 17:16:47 +0000
Received: from hamza-pc.localhost (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 9 Sep
 2024 12:16:46 -0500
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
To: <dri-devel@lists.freedesktop.org>
CC: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Jani Nikula <jani.nikula@linux.intel.com>, Simona Vetter
 <simona.vetter@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>, "Rodrigo
 Siqueira" <rodrigo.siqueira@amd.com>, Harry Wentland
 <harry.wentland@amd.com>, Hamza Mahfooz <hamza.mahfooz@amd.com>, Karol Herbst
 <kherbst@redhat.com>
Subject: [PATCH v4] drm/edid: add CTA Video Format Data Block support
Date: Mon, 9 Sep 2024 13:12:28 -0400
Message-ID: <20240909171228.148383-1-hamza.mahfooz@amd.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB03.amd.com
 (10.181.40.144)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A346:EE_|CH2PR12MB4102:EE_
X-MS-Office365-Filtering-Correlation-Id: 42228278-fd50-418e-8b5d-08dcd0f32fde
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?MTEoeEna8N2Q7xGHsQs9xCYsCWP7xa+X1xmt91R+HIyZ8//KWoeiRM4fxN2m?=
 =?us-ascii?Q?4uhmiF6vIWeqyDu06KRJZaFUY7AGhFf6tUUgn4/g6YYhf6YArcxbKK76fLfN?=
 =?us-ascii?Q?hUHCNthloCyGWljql+kNy4vhqOQcG8lLarF6hAPWrRxTo0mA0XB75waUGxzU?=
 =?us-ascii?Q?7UzbbJ9/7qcrf9NbbTv6qa2zhpD9l1YlBjw9ca+9/apRZMq0AB6IlkA9LMRF?=
 =?us-ascii?Q?NPn2P8B8b9oTTKRIvHWZ3CZc7sGQxfpD881vwG/cHqos9lQBNOb/9ugyk020?=
 =?us-ascii?Q?KjAvITwrV2SS36nhZDxWPt/z5VQfS7lu9GRrG01EjTxazNIMMwFz29+O95RB?=
 =?us-ascii?Q?pGJ9XEH4E6mS4MbJcPxw78qoZHqZPdAL6RWx6PGf9io3xRIUM+v4XIIJS00y?=
 =?us-ascii?Q?WqzXLg40y/FMnjTgkj+o++f5ppRDEwH2ewO3wsYzxhnJeksjW549VHUaDYxs?=
 =?us-ascii?Q?elNsnK2B0c66ZIFvPm8LYA6Dx/znjcnYPbjWnS+ijeCGasNkFQRdFVCSVQH3?=
 =?us-ascii?Q?RpyzFzvB5a+QyZeFXss0EaIunLW47kieNtjBng4JcrAiJQZTpRyJ551J0P4M?=
 =?us-ascii?Q?ZdQSNGUZXWOJqfUsHmtMZ5TqPJyi/YOLz2F3UuboVIr0pxCzLEi+CA81057l?=
 =?us-ascii?Q?1g4C591JvcrRznBHj8LuZASdNQquWIRPdNSRIqe8M0x0ABfZewhbq7NZA6PR?=
 =?us-ascii?Q?djsqTG9DMB6YFr1XFgqJREooEyfX5uCCS0cbYSeWD5nwUXkZPFjN/CFUu5uH?=
 =?us-ascii?Q?fRh55g2h1swflXLJwl2vjfmyMKmNxLtxXAU1o+obfWZbnB4esb9JZ0id3sU2?=
 =?us-ascii?Q?4e4IjAbFPVQk0DamgLfoYse+Y5DI6aB8SEb4oVVUUqjb/7lWnDixDgtA1oHP?=
 =?us-ascii?Q?SxeCZkIKCFhICWmYex31n0N806fonLMvHseLLCPIFBFbvapdNVBCn2I+IQwt?=
 =?us-ascii?Q?eX2LUgoKy21gqIi3QMzteiFhr0kCNyw8neoI6OTBfWgGGGdSCO0BLxr12kbB?=
 =?us-ascii?Q?DzZ3JWj1Q9VJBKkxSIx9ZVFRvbhtfWTaZKPjpMGE+Pe0s461hum2LitIVVE+?=
 =?us-ascii?Q?iy3pNR+cyBxHo6WvThLWNBt8hGbyosGwYjyScZj5WSL6GR4EXUeBpLfXhBaF?=
 =?us-ascii?Q?AtlrRrLzL9jFP1lEj4qK9X3zMX7vtKMf7atqDpoi/C26O6b6QAlpStD/Nt1S?=
 =?us-ascii?Q?8dIm3VzhIv2HhFwKTPur2BN8P1HLyOevp+vTfVgPzmssE1EbkLmrLS/TA2PU?=
 =?us-ascii?Q?LvZqw+XScxISRwCLX0yhjpXnS4NuDIU9ot6khttdZesJH9zKDUX3K2weCb8y?=
 =?us-ascii?Q?dD9sekDk/Re/nZ4iBOzmHIB38fRI6VJBqLAvh8rQroF6yEzncprilU+1vTgP?=
 =?us-ascii?Q?Pt/7/8VX7XfG4XGNBD0s27BpEV9ktvBgdIi+BwlkkdbJCg3bZzQmMuFTCP6h?=
 =?us-ascii?Q?S8XvuUI9rdSWhebPrhGLU65fPgpfm3mU?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2024 17:16:47.7105 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 42228278-fd50-418e-8b5d-08dcd0f32fde
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000A346.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4102
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
v3: move ovt stuff above add_cea_modes() and break up
    calculate_ovt_mode() to make it easier to read.

v4: fix 32 bit build and constify read-only vars.
---
 drivers/gpu/drm/drm_edid.c | 452 +++++++++++++++++++++++++++++++++++++
 1 file changed, 452 insertions(+)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 855beafb76ff..01de2117aaf2 100644
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
@@ -4131,6 +4219,7 @@ static int add_detailed_modes(struct drm_connector *connector,
 #define CTA_DB_VIDEO			2
 #define CTA_DB_VENDOR			3
 #define CTA_DB_SPEAKER			4
+#define CTA_DB_VIDEO_FORMAT		6
 #define CTA_DB_EXTENDED_TAG		7
 
 /* CTA-861-H Table 62 - CTA Extended Tag Codes */
@@ -4972,6 +5061,16 @@ struct cea_db {
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
@@ -5250,6 +5349,357 @@ static int edid_hfeeodb_extension_block_count(const struct edid *edid)
 	return cta[4 + 2];
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
+static u32 calculate_ovt_min_vtotal(const struct cta_rid *rid, u64 max_vrate,
+				    u32 vtotal_granularity)
+{
+	u64 max_active_time;
+	u32 min_line_time;
+	u32 min_vblank;
+	u32 min_vtotal;
+
+	/* step 2 */
+	max_active_time = div64_u64(1000000000000, max_vrate) -
+		(u64)OVT_MIN_VBLANK_DURATION;
+
+	min_line_time = div_u64(max_active_time, rid->vactive);
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
+	return min_vtotal;
+}
+
+static u32 calculate_ovt_min_htotal(const struct cta_rid *rid,
+				    const u32 max_vrate,
+				    const u32 min_vtotal,
+				    u32 *min_hblank,
+				    u32 *htotal_granularity)
+{
+	u32 max_audio_packets_per_line;
+	u32 htotal_granularity_chunk;
+	u64 min_pixel_clock_rate;
+	u32 min_line_rate;
+	u32 min_htotal;
+
+	/* step 3 */
+	min_line_rate = max_vrate * min_vtotal;
+
+	max_audio_packets_per_line = DIV_ROUND_UP(OVT_AUDIO_PACKET_RATE,
+						  min_line_rate);
+
+	/* step 4 */
+	*min_hblank = OVT_LINE_OVERHEAD + OVT_AUDIO_PACKET_SIZE *
+		max_audio_packets_per_line;
+
+	min_htotal = rid->hactive + max(OVT_MIN_HBLANK_444, *min_hblank);
+
+	min_pixel_clock_rate = max_vrate * min_htotal * min_vtotal;
+
+	htotal_granularity_chunk =
+		roundup_pow_of_two(DIV64_U64_ROUND_UP(min_pixel_clock_rate,
+						      OVT_MAX_CHUNK_RATE));
+
+	*htotal_granularity = max(OVT_MIN_HTOTAL_GRANULARITY,
+				  htotal_granularity_chunk);
+
+	if (min_htotal % *htotal_granularity)
+		min_htotal += *htotal_granularity - (min_htotal %
+						     *htotal_granularity);
+
+	return min_htotal;
+}
+
+static u64 calculate_ovt_pixel_clock_rate(const struct cta_rid *rid,
+					  const u32 max_vrate,
+					  const u32 min_hblank,
+					  u32 min_htotal,
+					  u32 min_vtotal,
+					  const u32 htotal_granularity,
+					  const u32 vtotal_granularity,
+					  u32 *htotal, u32 *vtotal)
+{
+	u32 resolution_granularity;
+	u64 pixel_clock_rate;
+	u64 min_resolution;
+	u64 rem;
+	u32 h;
+	u64 r;
+	u32 v;
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
+			goto inner_loop_end;
+
+			while (rem || div64_u64(max_vrate * r, (h & ~(h - 1))) >
+			       OVT_MAX_CHUNK_RATE) {
+				h += htotal_granularity;
+				r = (u64)h * (u64)v;
+inner_loop_end:
+				div64_u64_rem(r, resolution_granularity, &rem);
+			}
+
+			if (!min_resolution || r < min_resolution) {
+				*htotal = h;
+				*vtotal = v;
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
+
+	} while (pixel_clock_rate >= OVT_MIN_CLOCK_RATE_420 &&
+		 *htotal < min_htotal);
+
+	return pixel_clock_rate;
+}
+
+/* OVT Algorthim as specified in CTA-861-I */
+static struct drm_display_mode *
+calculate_ovt_mode(struct drm_connector *connector, const struct cta_rid *rid,
+		   u16 vrate)
+{
+	struct drm_display_mode *mode;
+	u32 vtotal_granularity = 1;
+	u32 htotal_granularity;
+	u32 max_vrate = vrate;
+	u64 pixel_clock_rate;
+	u32 vsync_position;
+	u32 min_hblank;
+	u32 min_htotal;
+	u32 min_vtotal;
+	u32 htotal;
+	u32 vtotal;
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
+	min_vtotal = calculate_ovt_min_vtotal(rid, max_vrate,
+					      vtotal_granularity);
+
+	min_htotal = calculate_ovt_min_htotal(rid, max_vrate, min_vtotal,
+					      &min_hblank, &htotal_granularity);
+
+	pixel_clock_rate = calculate_ovt_pixel_clock_rate(rid, max_vrate,
+							  min_hblank,
+							  min_htotal,
+							  min_vtotal,
+							  htotal_granularity,
+							  vtotal_granularity,
+							  &htotal, &vtotal);
+
+	/* step 7 */
+	vtotal = vtotal * max_vrate / (u32)vrate;
+
+	/* step 8 */
+	vsync_position = max(OVT_MIN_VSYNC_LE_LINES,
+			     DIV64_U64_ROUND_UP((u64)OVT_MIN_VSYNC_LE_LINES *
+						pixel_clock_rate,
+						(u64)htotal * (u64)1000000));
+
+	mode = drm_mode_create(connector->dev);
+
+	if (!mode)
+		return NULL;
+
+	mode->clock = div_u64(pixel_clock_rate, 1000);
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
  * CTA-861 YCbCr 4:2:0 Capability Map Data Block (CTA Y420CMDB)
  *
@@ -5318,6 +5768,8 @@ static int add_cea_modes(struct drm_connector *connector,
 			/* Add 4:2:0(only) modes present in EDID */
 			modes += do_y420vdb_modes(connector, vdb420,
 						  cea_db_payload_len(db) - 1);
+		} else if (cea_db_tag(db) == CTA_DB_VIDEO_FORMAT) {
+			modes += add_modes_from_vfdb(connector, db);
 		}
 	}
 	cea_db_iter_end(&iter);
-- 
2.46.0

