Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F2796FE15
	for <lists+dri-devel@lfdr.de>; Sat,  7 Sep 2024 00:43:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2090B10EB1E;
	Fri,  6 Sep 2024 22:43:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Xi9OV5gK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2044.outbound.protection.outlook.com [40.107.93.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A64D010EB1E
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Sep 2024 22:43:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qs7RvogaMD6CQrjo0q1K89/yUg0kd5tCJ4pdCdZodIaA/S/svAHVVLJ/Q5ktAVT1reP62D9TzJ+jQygUi7nmqOml3XWb6xKsqNdqXHfPjSbmny2sqxjvhp2dakNv4eAD60WBMLUouKj2jG5kM85K/mr7SUZfjb2gov3RvXUW3lA5pjc9k2/AHxJaChXBwFYheI7OfWzF1992DMLmGq5I5FNBcU2zEDDmkxLjETIGZptAFDFconWeiA85+qLFAxRz2CZAf/zcC8JEpjGtuAourXSu/FOQb3mhc0YOv2hCNA9s8zeHiIluHAgr4MVE0UwC0maeR5K761KGW8irgfhi5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zLQYHJmBDDc1shb2SjdTMXUOqEQ6ge5U2JuQciUi3fg=;
 b=r9FImmCzFYspFrYKMFlBtdlIwaqg8FBOTlUb4YEiDNkxIhau+5cgcNu1N/PWwpzRk0GRDCGV5cKlQ5ot/HXVKcZFZfbfocFSa2+dRhgbFMu/EccwukfY/zUw3JFRByosGVTlDl8ZkerB59bHGqfmyjPihqEaMsDg/lctlgZheuAIUe+uWZdAyqsh4Z4sb3jGDmrjgw0KWLknVW5UsW0KpzSBF8AmSU4UeAdu7w5s4nwkCbQ4Y5kAmQpK2dzio+X3zBcQLUBmomBLYsQFmGD2OobxgRfS51WBjo+b0xqWKoepuPk+tV3Nhh+0R/i3tDsy8/hIqgLmrTRaDH7IhS8FUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zLQYHJmBDDc1shb2SjdTMXUOqEQ6ge5U2JuQciUi3fg=;
 b=Xi9OV5gKO/o/H3Vx9xMEgkmSKtTy7aFFJBlUDIAfiUGg3ipLFVJTDTke0D4ubK6ePRBJ4tpLzRPsQiGG7Rqa8enz6Tl8eHQNThVUbRoXpV5eqhHEC0Az09uK554sHSJvr73lEd9s3CVtYghdPYJscy4iUWGRFi4T2dxbDyMIEaI=
Received: from DM6PR03CA0062.namprd03.prod.outlook.com (2603:10b6:5:100::39)
 by SA1PR12MB8163.namprd12.prod.outlook.com (2603:10b6:806:332::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Fri, 6 Sep
 2024 22:43:19 +0000
Received: from DS3PEPF000099D8.namprd04.prod.outlook.com
 (2603:10b6:5:100:cafe::99) by DM6PR03CA0062.outlook.office365.com
 (2603:10b6:5:100::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.14 via Frontend
 Transport; Fri, 6 Sep 2024 22:43:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS3PEPF000099D8.mail.protection.outlook.com (10.167.17.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Fri, 6 Sep 2024 22:43:19 +0000
Received: from hamza-pc.localhost (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 6 Sep
 2024 17:43:18 -0500
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
To: <dri-devel@lists.freedesktop.org>
CC: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Jani Nikula <jani.nikula@linux.intel.com>, Simona Vetter
 <simona.vetter@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>, "Rodrigo
 Siqueira" <rodrigo.siqueira@amd.com>, Harry Wentland
 <harry.wentland@amd.com>, Hamza Mahfooz <hamza.mahfooz@amd.com>, Karol Herbst
 <kherbst@redhat.com>
Subject: [PATCH v3] drm/edid: add CTA Video Format Data Block support
Date: Fri, 6 Sep 2024 18:43:07 -0400
Message-ID: <20240906224307.423250-1-hamza.mahfooz@amd.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB03.amd.com
 (10.181.40.144)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D8:EE_|SA1PR12MB8163:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d649ff3-c9c7-4572-5347-08dccec54e59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?RhmEr6gq7qBRYkOogmRciaaYMOwWbFyZ/ZHV7byaTh7TJLZYhpZy0ztmAfOZ?=
 =?us-ascii?Q?8kV0W/PQit4UHZwDH1jTWr1McSyCFvebfTK+5bZBlOlinZC/FAdBSmq7xYY5?=
 =?us-ascii?Q?1DVRQD69Shb1ff9osEp7oxI0RWVN6jAKOfAZ8NkD7OzOB5M1/pJdAMci3+ru?=
 =?us-ascii?Q?8tQrXDDHj5Uei80wsR6eWZR2kTU6ljkZAJUH3tvoYJ9xz/bIS5AoKZR73B7I?=
 =?us-ascii?Q?hlVkwTeKHnMPFx/J4CnCUEQTkAGiLq0+f5H9utECVU+h3KTbklfHN3WrxCtS?=
 =?us-ascii?Q?VZzqpVuLqRweqvzQpbUuhdSM7bBKxlGxXbHSNur/quaYvGpD3avA7tRJvZqS?=
 =?us-ascii?Q?vfK0EtdvCkxeR+aZ0cSaoQLjtkIgVi1S0E0G6GBkejThtVE7hp4n+j/kAZQ0?=
 =?us-ascii?Q?fcKRPEMuwh2os8Q68QhW5irT1/fBO1302QBOoHNwpRayAXJ/Nc02znd6/JvA?=
 =?us-ascii?Q?JRHxVK+TA6vD5h2hqA1ETzT1INiodHnXqWXgPHDudcZw2QPdcLnkAOYnn1Y/?=
 =?us-ascii?Q?5P6NHIyWJy99oIJ9segaQOxOOUJkgzcsZc1KPGIlmWr5E01s42eV3qr9Iq7V?=
 =?us-ascii?Q?/OhtItr2bdpGrKrEc4XnvrDh0Wd0Q69xNYiI0j6hyNVqYhx7xgnqtzYymO84?=
 =?us-ascii?Q?RTm0tRL4GZprzWKX8nuoGrdOaDuA9yuFqhNYtefOleZ8kd6JOwU5Zz5eVNO5?=
 =?us-ascii?Q?b+5VTySKkPhARHsTD/hHR7kAXvvk7APTSiYjZ0irFosPkNQqehNJKlx627vM?=
 =?us-ascii?Q?unoyTTznfecaHh2vHBHN7/wtW8HqRjCtYmByCfxEqHwGlvjdXquIVvEDScxm?=
 =?us-ascii?Q?GbF6XfsdolkpwLJh2U4SrFnbBK68nDJS5cT6kQW6Cze6rN+oNd+2R8FOdoNu?=
 =?us-ascii?Q?vQDyUzXCzxmFd5lI+r/wMuzApSImMpXcMgr6lIAHd3fJz4PBUBSqeoZgqvun?=
 =?us-ascii?Q?rFi3zHmXa1Jw082T37O8lCcZAh/1woq6ube6vQCCgi309vwB4DxXSIrQWiPp?=
 =?us-ascii?Q?Pn9eWB7TB45XVn7jStKzD9MuRPh96uuSSMKuO0hELGFxzOx8iWqxOip6CSrF?=
 =?us-ascii?Q?hVyNdKxIOq2KpthVvThi9AsYjYZ24wIkm/2fFetrqVdCW9lXe5DhQf4Ug8yF?=
 =?us-ascii?Q?hDP4phtG7AIfcBY9knjJ098E9ST6qkvyjz7uyj4njG+FgsK/Yya7Y6lJy8GH?=
 =?us-ascii?Q?DvprFTnAhToTLFIDXa664w3RrGmvNQTD3+BRgB83rWwXoVne042RVqBpj0S2?=
 =?us-ascii?Q?Jz/L4xebyjgQ1YtbQn/xN1UtcCHlPghhuVLWUSPohqWDfkg6DUwEKisvj6MZ?=
 =?us-ascii?Q?+8zDWPF8nMjcvzMvT9wSRvo/qCHwkcMO5yK+ajB5+0K6Oi4JgluPabS2tmx1?=
 =?us-ascii?Q?NDbde0av5M1k7AhiN0pK3y59qCa1RjEDBYDpxEjEuqcE/PX/9PDdxDfpd17v?=
 =?us-ascii?Q?dcpdbKq4Hli8A+uSNabAlPoFb2mwYbBv?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 22:43:19.6248 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d649ff3-c9c7-4572-5347-08dccec54e59
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099D8.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8163
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
---
 drivers/gpu/drm/drm_edid.c | 443 +++++++++++++++++++++++++++++++++++++
 1 file changed, 443 insertions(+)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 855beafb76ff..5df915955c5f 100644
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
@@ -5250,6 +5349,348 @@ static int edid_hfeeodb_extension_block_count(const struct edid *edid)
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
+	min_line_time = div64_u64(max_active_time, rid->vactive);
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
+static u32 calculate_ovt_min_htotal(const struct cta_rid *rid, u32 max_vrate,
+				    u32 min_vtotal, u32 *htotal_granularity,
+				    u32 *min_hblank)
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
+		roundup_pow_of_two(DIV_ROUND_UP(min_pixel_clock_rate,
+						OVT_MAX_CHUNK_RATE));
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
+					  u32 max_vrate, u32 min_htotal,
+					  u32 min_vtotal, u32 min_hblank,
+					  u32 htotal_granularity,
+					  u32 vtotal_granularity, u32 *htotal,
+					  u32 *vtotal)
+{
+	u32 resolution_granularity;
+	u64 pixel_clock_rate;
+	u64 min_resolution;
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
+			while (r % resolution_granularity ||
+			       max_vrate * r / (h & ~(h - 1)) >
+			       OVT_MAX_CHUNK_RATE) {
+				h += htotal_granularity;
+				r = (u64)h * (u64)v;
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
+					      &htotal_granularity, &min_hblank);
+
+	pixel_clock_rate = calculate_ovt_pixel_clock_rate(rid, max_vrate,
+							  min_htotal,
+							  min_vtotal,
+							  min_hblank,
+							  htotal_granularity,
+							  vtotal_granularity,
+							  &htotal, &vtotal);
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
  * CTA-861 YCbCr 4:2:0 Capability Map Data Block (CTA Y420CMDB)
  *
@@ -5318,6 +5759,8 @@ static int add_cea_modes(struct drm_connector *connector,
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

