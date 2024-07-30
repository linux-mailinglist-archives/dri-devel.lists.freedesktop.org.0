Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DBE19421D3
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2024 22:45:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C953E10E28E;
	Tue, 30 Jul 2024 20:45:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="TyI/dFa4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2067.outbound.protection.outlook.com [40.107.236.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6AC689FF7;
 Tue, 30 Jul 2024 20:45:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aF1WhAHjdRZFGGPOnwylqBY5bh+H0trGFQcJ6jBwc9ZAjHcWD5uIEBXWEatMm8NHcelVYD7ddPwfmknrogm3DF8gXAkM02+xVRsbXLNynlkenLYIUKvHp3LlEFkVBc9zDmRz3jSRF86NAtPsN6bVicj8Tqg/mLlvNoMj2k4CkZydKsShuZY1ESjk8etGp9R7algPv4RVP7GX+Tbj8MiNkdIR50EUmdzYCKAWeBlRF31DYeUlyAwQbeuHVb6+/4mrbvZonVyJZQuiz5LpGkT0ilPEa0cDYvrJ/cUyKBAEyKS4FnAzQuoeaI1fo9j5TQFDjq/fzDGlsyCUbM8WewgaOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rBfuhkPadi+wcBb4/RagXrybICXVmo/aXuUIvT+XLdw=;
 b=k5P8rIa7Ii9i9hpm0R9YDlEPARWnLBGOd/W+yWIFMc79vW2vPBx9xmPOhtVhFo/yoXjqh0/2LFNeM0F667S9iX/YC1kjtBjUxqh3w7M8XB8tBcNwf3GcYu+BLjZAj1LYfnc5y8nrN53SYmwezu9BpDSQJ3VjfZ//8VBNRLNtu8LfQMyD/fPdnfXPD1kyhtxghv2/r2yhyUeJLY96B64bbhSJXjhHOfVRXcGLsk+yaPLHaiQAPuDhSIAbFc5bUCYhKJNDiWi5zeD0Dl6FdPUV7AuCO3YeqqcbNw7DqkpGEp1erzPF/n7OqL87W6oV6U5bRBqhrcRIkdshrSLV+Fz+Xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rBfuhkPadi+wcBb4/RagXrybICXVmo/aXuUIvT+XLdw=;
 b=TyI/dFa4CEup0PoV1XsUul78xNgom857DKTaIGnpw6MBdGxc6oEmN8PmGb4fWkweOWeDS0QKEYCyQJyjKe+MkylWjda/wylanH5rxl/UXrV15MQOGJkXrPTAOfjmGWvB6+mVOrh+RUebEVENnysl11KuaKm/UJOk1gFn9arC6UM=
Received: from DS7PR03CA0077.namprd03.prod.outlook.com (2603:10b6:5:3bb::22)
 by MW3PR12MB4347.namprd12.prod.outlook.com (2603:10b6:303:2e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Tue, 30 Jul
 2024 20:45:35 +0000
Received: from DS2PEPF0000343F.namprd02.prod.outlook.com
 (2603:10b6:5:3bb:cafe::3a) by DS7PR03CA0077.outlook.office365.com
 (2603:10b6:5:3bb::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.35 via Frontend
 Transport; Tue, 30 Jul 2024 20:45:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF0000343F.mail.protection.outlook.com (10.167.18.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7828.19 via Frontend Transport; Tue, 30 Jul 2024 20:45:34 +0000
Received: from hamza-pc.localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 30 Jul
 2024 15:45:33 -0500
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
To: <dri-devel@lists.freedesktop.org>
CC: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Alex Deucher
 <alexander.deucher@amd.com>, <amd-gfx@lists.freedesktop.org>, "Rodrigo
 Siqueira" <rodrigo.siqueira@amd.com>, Harry Wentland
 <harry.wentland@amd.com>, Mark Broadworth <mark.broadworth@amd.com>, Hamza
 Mahfooz <hamza.mahfooz@amd.com>, Karol Herbst <kherbst@redhat.com>
Subject: [PATCH] drm/edid: add CTA Video Format Data Block support
Date: Tue, 30 Jul 2024 16:45:20 -0400
Message-ID: <20240730204520.282133-1-hamza.mahfooz@amd.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343F:EE_|MW3PR12MB4347:EE_
X-MS-Office365-Filtering-Correlation-Id: ad216f30-2b51-4ad0-11fc-08dcb0d88f9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9jeDNgxDMEov9cD7doXMndl9+0qYyF1tWSkTlI9ndwZwAeI1qp+y60el/m6M?=
 =?us-ascii?Q?wL+Yxd2+7pfu1Yh1vZl22Fg8w28QGrhwv+wMIIWcgR+x3SWxHkhtxSZdVElz?=
 =?us-ascii?Q?1bAK8q0X55xMo93lG1BcLIhpSt3loqbNpwLZkrXuh8WbeGgt2rvf46BQXEXX?=
 =?us-ascii?Q?Y98828C+ikFjQU2Uug7rLSsx4kC6BtzK1TXL2l7GOZwQSrjdbft7rJIIdUR4?=
 =?us-ascii?Q?L82WL3OMFNpDeZI0huajIJy4UWUGMa1TENwlcoDosUnpPH+MpyPK2/edmy5s?=
 =?us-ascii?Q?AczgasbE+MC15M4pTKLLevVcwlPrZRZEW4DEZ0IScnjaH03fI7Sd2wh498Ut?=
 =?us-ascii?Q?ToVycfNZkkWEP4XnfOzZYjorGLV5XjwIXzhOU9xC46pFWJ5gMS5Qd/Y3yD7E?=
 =?us-ascii?Q?oGYSUMB3XoorU3aVfo3OQcc6f3jyJc+dv52qY4Tbkfq2WWyzEIdFgUhwCILH?=
 =?us-ascii?Q?AJ3IpnqsccA69Su5pcdp8oqLue9TyHIepqYC8sQHOCoqCKKctlQQ3Oud7QfJ?=
 =?us-ascii?Q?qUAocW62B4U1MULr1nDXZP52H6fEljy7jILEyK36mOdbPhqwon8A/YTsT+bc?=
 =?us-ascii?Q?E0aufKNTkafUX/hjGpvjm8vP6fHkg8hYQA37YnJwv4+gxD7/s1Pv5Ku8cJWO?=
 =?us-ascii?Q?sD/D8+P/dh7W9i+JzbTv3Cg40jczVRoqYHDNzgBoWB0CDAWi6p4ypkLKftF5?=
 =?us-ascii?Q?qe4ODGD3DbCShfs2fRgmVPbVrDZC+7YY7F8raJ8Jo8NOMoyYhjvZjJut4fTJ?=
 =?us-ascii?Q?Tz1KNWzp9fFUNHP3CA4rToQnYMSDnqimtAC+VL5r56Qh3nIc7VBd/3yVQYx3?=
 =?us-ascii?Q?/8xa2pvD6AkVa9BnkwCU029UZL2d4dRfsWoemooToCIoQHARyQwgVsYY4dz3?=
 =?us-ascii?Q?PsqiumVyK3ZVjviJgbrVoADikGhEdXBHwBKx7kJyqItQKWYF3JDgsCKzabbu?=
 =?us-ascii?Q?Hh6EMncN5A7qzEFjrnysqJMpzXFPjl9Ublw+iVkjH3GoG7kZdJe/Cyvqb75E?=
 =?us-ascii?Q?1b4YwA9AvfsZ1pqD99rK9K8chu0LQ0wQFD40evrFqPcy7YBGhQMysVcXw60I?=
 =?us-ascii?Q?XHhm31aqLBg50z1EPQnDWoY5RiNb1vtBf5zD3eC7i+griStn53IdnFp1WfPX?=
 =?us-ascii?Q?oQerkwl48D6v55sZv2cWX9RwjeZYXICx3BvG5Xv7r85en/zz0VMa8pPynvh7?=
 =?us-ascii?Q?ZIqBw1IXMjUxI9YiIcYRYEDpXfVEywDK7iF4MkiUP4WKFn5qPO95jWP3sQht?=
 =?us-ascii?Q?asWTem6r73r5BjYFsaz+n9AmR5OuQ0HTDMC3mNU4mqlw9T1RqQV1VcWEpl6D?=
 =?us-ascii?Q?LkqCR/hiwD0KUdKT2Dm7EctLiiK1I5WAApDD6ov/XEJZYqYe0oi8ZxBLn65z?=
 =?us-ascii?Q?VTxiegoNLrmDEmfqQfgu69xURYvE?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2024 20:45:34.7534 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ad216f30-2b51-4ad0-11fc-08dcb0d88f9d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4347
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

Link: https://gitlab.freedesktop.org/drm/amd/-/issues/1442
Suggested-by: Karol Herbst <kherbst@redhat.com>
Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
---
 drivers/gpu/drm/drm_edid.c  | 426 ++++++++++++++++++++++++++++++++++++
 include/drm/drm_connector.h |  12 +
 2 files changed, 438 insertions(+)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index f68a41eeb1fa..112a0070c4d5 100644
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
@@ -6018,6 +6117,307 @@ static void parse_cta_vdb(struct drm_connector *connector, const struct cea_db *
 	}
 }
 
+/* CTA-861 Video Format Descriptor (CTA VFD) */
+static void parse_cta_vfd(const u8 *data, int vfd_len, struct cta_vfd *vfd)
+{
+	vfd->rid = data[0] & 0x3f;
+	vfd->bfr50 = data[0] >> 7;
+	vfd->fr24 = !!(data[0] & 0x40);
+	vfd->bfr60 = vfd_len > 1 ? (data[1] >> 7) : 0x1;
+	vfd->fr144 = vfd_len > 1 ? !!(data[1] & 0x40) : 0x0;
+	vfd->fr_fact = vfd_len > 1 ? (data[1] & 0x3f) : 0x3;
+	vfd->fr48 = vfd_len > 2 ? !!(data[2] & 0x1) : 0x0;
+}
+
+static bool vfd_has_fr(const struct cta_vfd *vfd, int rate_idx)
+{
+	static const u8 factors[6] = {
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
+static struct drm_display_mode *calculate_ovt_mode(const struct cta_rid *rid,
+						   u16 vrate,
+						   struct drm_device *dev)
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
+	for (;;) {
+		/* step 5 */
+		min_resolution = 0;
+		v = min_vtotal;
+
+		for (;;) {
+			h = min_htotal;
+			r = (u64)h * (u64)v;
+
+			if (min_resolution && r > min_resolution)
+				break;
+
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
+		}
+
+		pixel_clock_rate = max_vrate * min_resolution;
+
+		/* step 6 */
+		min_htotal = rid->hactive + max(OVT_MIN_HBLANK_420,
+						OVT_PIXEL_FACTOR_420 *
+						min_hblank);
+		if (pixel_clock_rate >= OVT_MIN_CLOCK_RATE_420 &&
+		    htotal < min_htotal)
+			continue;
+
+		break;
+	}
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
+	mode = drm_mode_create(dev);
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
+static void parse_cta_vfdb(struct drm_connector *connector,
+			   const struct cea_db *db)
+{
+	struct drm_display_info *info = &connector->display_info;
+	int vfdb_len = cea_db_payload_len(db);
+	int vfd_len = (db->data[0] & 0x3) + 1;
+	struct drm_display_mode **modes;
+	struct drm_display_mode *mode;
+	struct cta_vfd vfd;
+	int mode_index = 0;
+	int i;
+	int j;
+
+	if (!(vfdb_len - 1) || (vfdb_len - 1) % vfd_len)
+		return;
+
+	modes = krealloc_array(info->ovt_modes, ((vfdb_len - 1) / vfd_len) *
+			       (ARRAY_SIZE(cta_vf_fr) - 1),
+			       sizeof(*info->ovt_modes), GFP_KERNEL);
+
+	if (!modes)
+		return;
+
+	for (i = 1; i < vfdb_len; i += vfd_len) {
+		parse_cta_vfd(&db->data[i], vfd_len, &vfd);
+
+		if (!vfd.rid || vfd.rid >= ARRAY_SIZE(rids))
+			continue;
+
+		for (j = 1; j < ARRAY_SIZE(cta_vf_fr); j++) {
+			if (!vfd_has_fr(&vfd, j) ||
+			    (cta_vf_fr[j] < 144 && rid_to_vic[vfd.rid][j - 1]))
+				continue;
+
+			mode = calculate_ovt_mode(&rids[vfd.rid], cta_vf_fr[j],
+						  connector->dev);
+
+			if (!mode)
+				continue;
+
+			mode->height_mm = info->height_mm;
+			mode->width_mm = info->width_mm;
+
+			info->ovt_modes[mode_index++] = mode;
+		}
+	}
+
+	info->num_ovt_modes = mode_index;
+}
+
 /*
  * Update y420_cmdb_modes based on previously parsed CTA VDB and Y420CMDB.
  *
@@ -6439,6 +6839,8 @@ static void drm_parse_cea_ext(struct drm_connector *connector,
 			parse_cta_vdb(connector, db);
 		else if (cea_db_tag(db) == CTA_DB_AUDIO)
 			info->has_audio = true;
+		else if (cea_db_tag(db) == CTA_DB_VIDEO_FORMAT)
+			parse_cta_vfdb(connector, db);
 	}
 	cea_db_iter_end(&iter);
 
@@ -6585,6 +6987,7 @@ static void drm_update_mso(struct drm_connector *connector,
 static void drm_reset_display_info(struct drm_connector *connector)
 {
 	struct drm_display_info *info = &connector->display_info;
+	int i;
 
 	info->width_mm = 0;
 	info->height_mm = 0;
@@ -6611,6 +7014,13 @@ static void drm_reset_display_info(struct drm_connector *connector)
 	info->mso_pixel_overlap = 0;
 	info->max_dsc_bpp = 0;
 
+	for (i = 0; i < info->num_ovt_modes; i++)
+		drm_mode_destroy(connector->dev, info->ovt_modes[i]);
+
+	kfree(info->ovt_modes);
+	info->ovt_modes = NULL;
+	info->num_ovt_modes = 0;
+
 	kfree(info->vics);
 	info->vics = NULL;
 	info->vics_len = 0;
@@ -6849,6 +7259,21 @@ static int add_displayid_detailed_modes(struct drm_connector *connector,
 	return num_modes;
 }
 
+static int add_ovt_modes(struct drm_connector *connector)
+{
+	struct drm_display_info *info = &connector->display_info;
+	int i;
+
+	for (i = 0; i < info->num_ovt_modes; i++) {
+		drm_mode_probed_add(connector, info->ovt_modes[i]);
+		info->ovt_modes[i] = NULL;
+	}
+
+	info->num_ovt_modes = 0;
+
+	return i;
+}
+
 static int _drm_edid_connector_add_modes(struct drm_connector *connector,
 					 const struct drm_edid *drm_edid)
 {
@@ -6872,6 +7297,7 @@ static int _drm_edid_connector_add_modes(struct drm_connector *connector,
 	 *
 	 * XXX order for additional mode types in extension blocks?
 	 */
+	num_modes += add_ovt_modes(connector);
 	num_modes += add_detailed_modes(connector, drm_edid);
 	num_modes += add_cvt_modes(connector, drm_edid);
 	num_modes += add_standard_modes(connector, drm_edid);
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 5ad735253413..35b5eb344ea8 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -829,6 +829,18 @@ struct drm_display_info {
 	 */
 	u32 max_dsc_bpp;
 
+	/**
+	 * @ovt_modes: Array of @num_ovt_modes OVT modes. Internal to EDID
+	 * parsing.
+	 */
+	struct drm_display_mode **ovt_modes;
+
+	/**
+	 * @num_ovt_modes: Number of elements in @ovt_modes. Internal to EDID
+	 * parsing.
+	 */
+	int num_ovt_modes;
+
 	/**
 	 * @vics: Array of vics_len VICs. Internal to EDID parsing.
 	 */
-- 
2.45.2

