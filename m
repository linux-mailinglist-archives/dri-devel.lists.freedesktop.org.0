Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BE2B79897D
	for <lists+dri-devel@lfdr.de>; Fri,  8 Sep 2023 17:03:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59BEE10E909;
	Fri,  8 Sep 2023 15:03:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2069.outbound.protection.outlook.com [40.107.93.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B39E710E8F1;
 Fri,  8 Sep 2023 15:02:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Udjkr6ClaK7I9hNQaLf6tGrF/pIGBPHqlymIcyLAuPw5uKPtXins12JhDDd+YepzEkQ6fKRedOut0Iit1r6QIkMtUq3+qrdn4Wsy5OyxRK3eX9VE3DGblq2pMrzZlUm78eF1q0ylIqqpgzAF6RqywzFODbYXIIoAXlwceCIuSxQAkD+o1n1/RtgYNl89aXSWJF0Zexxm4Qx/UvHVTAhBgLn417qUclgkzkY3t5ihNKvUcVcygtzDkqyO9EPpjqMkAvqUxjnWnY3kjyn2GM/gtnWBlPhgyQEJPjmx5HL5kUJ9zC9hui3jlt4/Pw/Fq6qUqD/0BmJW3DYp1jcW4Atrlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ln/kY2dEO+CZorZvAmeVw4PalDK5U1+UI8nmy/1w0GY=;
 b=OELcJdVmBOBgTvII2uAxCeUknz45Gru5O5/Jk3hd1hiSxi3e8ShfqDZUQk4410z0fMFIvm62NdEOXjrMwl5lYg/RtW3impRWV07J4KS4Edlwv2dooJ3fpwAmMeaaSHlIq+fGEx+fiJY0H6inHNk3G4G9XqVY9eZFj0p/cP+cOGIYXfUfOx3GZCuECYQjiipiZLev8UQpJgkKSvDU9x6zrAM5SoOtm4rMxsMcA6aymRnYQkuIjD5FSEA50WvkrT5aR68LwqYkdMZRbE7FxD+Z9fVGO6wBqbniW+2W8LFLtOL4mYGh/4q8vbcUtu5o/dzhwqo6fR/thQO9bhxUTOx7/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ln/kY2dEO+CZorZvAmeVw4PalDK5U1+UI8nmy/1w0GY=;
 b=pkHURkWllGUkP41rdZciOA4zvRXZ2U7pd3ESdawAFx7elPESBp32iOZ43Gp6IHQongIcZxyUt29uhfj/sseYiXmEKqJ0vPIX+qFhRF4ziAE9EmWTAkQTFuGpfpgNMgrWkZ7tYStDfiPjbsDEJ3UixV/f+P997U6zRQ5hWHXMBwE=
Received: from CYXPR02CA0054.namprd02.prod.outlook.com (2603:10b6:930:cd::16)
 by IA1PR12MB7758.namprd12.prod.outlook.com (2603:10b6:208:421::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.30; Fri, 8 Sep
 2023 15:02:55 +0000
Received: from CY4PEPF0000EDD1.namprd03.prod.outlook.com
 (2603:10b6:930:cd:cafe::ba) by CYXPR02CA0054.outlook.office365.com
 (2603:10b6:930:cd::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.31 via Frontend
 Transport; Fri, 8 Sep 2023 15:02:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000EDD1.mail.protection.outlook.com (10.167.241.205) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6792.11 via Frontend Transport; Fri, 8 Sep 2023 15:02:55 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 8 Sep
 2023 10:02:54 -0500
Received: from hwentlanrmb.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Fri, 8 Sep 2023 10:02:53 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [RFC PATCH 10/10] drm/vkms: Add enumerated 1D curve colorop
Date: Fri, 8 Sep 2023 11:02:35 -0400
Message-ID: <20230908150235.75918-11-harry.wentland@amd.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230908150235.75918-1-harry.wentland@amd.com>
References: <20230908150235.75918-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD1:EE_|IA1PR12MB7758:EE_
X-MS-Office365-Filtering-Correlation-Id: 7562c719-7858-4ac8-2b9b-08dbb07cae63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +Aq1MJskFNX/529SKQRgI6/QlSl+BvrPmIQfJOxEPu+/JuUnBNyDDHYi3RmXzEoXmK/8I8mWYWmTZxFweMf5GMpkqEwIsGbVZoYz5CTz3jUkJuG0gWyUk+xFeHPfxJfaUH8qbJqUipznhvdXgerSLWPenQgRblv0nBESP4bYEEIeAonQk0NhGuKZPNPaPKQqF323IenZj4JQU25OqezB+aZmTs6Oe28H5Q9AYCuX9X+nbGpCWjUo4bZgDnct+3Fj45euPFb8t5rtLywiZuNAOWUYmOUCDLQFjGVfSRlRaXTdLOOULQLk7TCfcP5+jImhxdbtWpLYQy9lezOWGijCgp+POafj6mphA7DjNbAr6/kqW1QmawGabudDmrhY9zrlObavQvJBEz4LNwVVEFITCwrQrYIDBN08kt8GCetvJ6VDDjortkVEIsC40Y3Mt5Lv88/7AWp9/iowc+lE7EwK35ThIkWX65KSwXNNJB6W/MU/majEcPlkVDwS8jomdPGlnIQYAxlYXtNLykWM/M180tb2/qzSF5nIXBMMO1rLfokUX6ydGIDUMOiI9NdcSD5xGiFDg6GRf+AR3+VxHTIhyIEQNG0z9ziu6eEa/ZrEIeU4GGGkMH4ecWY+z3sJqI0NYNhYq2+1BrpQOupDhfr4WJa9Dkr5jKKqnR/WFvjob8qIWi6bAEBw+Hc7zXjUbfNrPY+BqBd0DzkqPgRrxju2l8WSF/ptoUQGfxRYkmiMnofO7/MNo7QZdSUaiHwjElxwEuf+BecRBVUyJVMElbTnEg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(346002)(376002)(136003)(396003)(39860400002)(1800799009)(82310400011)(186009)(451199024)(40470700004)(46966006)(36840700001)(6666004)(7696005)(426003)(478600001)(83380400001)(70206006)(66574015)(2616005)(26005)(30864003)(2906002)(4326008)(44832011)(7416002)(316002)(54906003)(41300700001)(5660300002)(70586007)(8936002)(8676002)(6916009)(1076003)(40460700003)(36860700001)(356005)(40480700001)(336012)(47076005)(81166007)(86362001)(36756003)(82740400003)(66899024)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2023 15:02:55.0131 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7562c719-7858-4ac8-2b9b-08dbb07cae63
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EDD1.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7758
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Shashank Sharma <shashank.sharma@amd.com>, Xaver Hugl <xaver.hugl@gmail.com>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <mdaenzer@redhat.com>,
 wayland-devel@lists.freedesktop.org, Melissa Wen <mwen@igalia.com>,
 =?UTF-8?q?Jonas=20=C3=85dahl?= <jadahl@redhat.com>,
 Uma Shankar <uma.shankar@intel.com>,
 Victoria Brekenfeld <victoria@system76.com>, Joshua Ashton <joshua@froggi.es>,
 Aleix Pol <aleixpol@kde.org>, Naseer Ahmed <quic_naseer@quicinc.com>,
 Christopher Braga <quic_cbraga@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
Cc: Simon Ser <contact@emersion.fr>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Melissa Wen <mwen@igalia.com>
Cc: Jonas Ådahl <jadahl@redhat.com>
Cc: Sebastian Wick <sebastian.wick@redhat.com>
Cc: Shashank Sharma <shashank.sharma@amd.com>
Cc: Alexander Goins <agoins@nvidia.com>
Cc: Joshua Ashton <joshua@froggi.es>
Cc: Michel Dänzer <mdaenzer@redhat.com>
Cc: Aleix Pol <aleixpol@kde.org>
Cc: Xaver Hugl <xaver.hugl@gmail.com>
Cc: Victoria Brekenfeld <victoria@system76.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Uma Shankar <uma.shankar@intel.com>
Cc: Naseer Ahmed <quic_naseer@quicinc.com>
Cc: Christopher Braga <quic_cbraga@quicinc.com>
---
 drivers/gpu/drm/vkms/Makefile        |   3 +-
 drivers/gpu/drm/vkms/vkms_colorop.c  | 108 +++++++++
 drivers/gpu/drm/vkms/vkms_composer.c | 316 +++++++++++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_drv.h      |   4 +
 drivers/gpu/drm/vkms/vkms_plane.c    |   2 +
 5 files changed, 432 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/vkms/vkms_colorop.c

diff --git a/drivers/gpu/drm/vkms/Makefile b/drivers/gpu/drm/vkms/Makefile
index 1b28a6a32948..bcf508873622 100644
--- a/drivers/gpu/drm/vkms/Makefile
+++ b/drivers/gpu/drm/vkms/Makefile
@@ -6,6 +6,7 @@ vkms-y := \
 	vkms_formats.o \
 	vkms_crtc.o \
 	vkms_composer.o \
-	vkms_writeback.o
+	vkms_writeback.o \
+	vkms_colorop.o
 
 obj-$(CONFIG_DRM_VKMS) += vkms.o
diff --git a/drivers/gpu/drm/vkms/vkms_colorop.c b/drivers/gpu/drm/vkms/vkms_colorop.c
new file mode 100644
index 000000000000..b3da0705bca7
--- /dev/null
+++ b/drivers/gpu/drm/vkms/vkms_colorop.c
@@ -0,0 +1,108 @@
+/*
+ * Copyright (C) 2023 Advanced Micro Devices, Inc. All rights reserved.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ *
+ * Authors: AMD
+ *
+ */
+
+#include <linux/slab.h>
+#include <drm/drm_colorop.h>
+#include <drm/drm_print.h>
+#include <drm/drm_property.h>
+#include <drm/drm_plane.h>
+
+#define MAX_COLOR_PIPELINES 5
+
+const int vkms_initialize_tf_pipeline(struct drm_plane *plane, struct drm_prop_enum_list *list)
+{
+
+	struct drm_colorop *op, *prev_op;
+	struct drm_device *dev = plane->dev;
+	int ret;
+
+	/* 1st op: 1d curve */
+	op = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
+	if (!op) {
+		DRM_ERROR("KMS: Failed to allocate colorop\n");
+		return -ENOMEM;
+	}
+
+	ret = drm_colorop_init(dev, op, plane, DRM_COLOROP_1D_CURVE);
+	if (ret)
+		return ret;
+
+	list->type = op->base.id;
+	list->name = kasprintf(GFP_KERNEL, "Color Pipeline %d", op->base.id);
+
+	prev_op = op;
+
+	/* 2nd op: 1d curve */
+	op = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
+	if (!op) {
+		DRM_ERROR("KMS: Failed to allocate colorop\n");
+		return -ENOMEM;
+	}
+
+	ret = drm_colorop_init(dev, op, plane, DRM_COLOROP_1D_CURVE);
+	if (ret)
+		return ret;
+
+	drm_colorop_set_next_property(prev_op, op);
+
+	return 0;
+}
+
+int vkms_initialize_colorops(struct drm_plane *plane)
+{
+	struct drm_device *dev = plane->dev;
+	struct drm_property *prop;
+	struct drm_prop_enum_list pipelines[MAX_COLOR_PIPELINES];
+	int len = 0;
+	int ret;
+
+	/* Add "Bypass" (i.e. NULL) pipeline */
+	pipelines[len].type = 0;
+	pipelines[len].name = "Bypass";
+	len++;
+
+	/* Add pipeline consisting of transfer functions */
+	ret = vkms_initialize_tf_pipeline(plane, &(pipelines[len]));
+	if (ret)
+		return ret;
+	len++;
+
+	/* Create COLOR_PIPELINE property and attach */
+	prop = drm_property_create_enum(dev, DRM_MODE_PROP_ATOMIC,
+					"COLOR_PIPELINE",
+					pipelines, len);
+	if (!prop)
+		return -ENOMEM;
+
+	plane->color_pipeline_property = prop;
+
+	drm_object_attach_property(&plane->base, prop, 0);
+
+	/* TODO do we even need this? */
+	if (plane->state)
+		plane->state->color_pipeline = NULL;
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index f6c311e8a87c..92ab9c62a554 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -12,6 +12,284 @@
 
 #include "vkms_drv.h"
 
+#define LUT_SIZE 256
+
+struct drm_color_lut srgb_array[LUT_SIZE] = {
+	{ 0x13, 0x13, 0x13, 0 },
+	{ 0x27, 0x27, 0x27, 0 },
+	{ 0x3b, 0x3b, 0x3b, 0 },
+	{ 0x4f, 0x4f, 0x4f, 0 },
+	{ 0x63, 0x63, 0x63, 0 },
+	{ 0x76, 0x76, 0x76, 0 },
+	{ 0x8a, 0x8a, 0x8a, 0 },
+	{ 0x9e, 0x9e, 0x9e, 0 },
+	{ 0xb2, 0xb2, 0xb2, 0 },
+	{ 0xc6, 0xc6, 0xc6, 0 },
+	{ 0xda, 0xda, 0xda, 0 },
+	{ 0xef, 0xef, 0xef, 0 },
+	{ 0x106, 0x106, 0x106, 0 },
+	{ 0x11e, 0x11e, 0x11e, 0 },
+	{ 0x137, 0x137, 0x137, 0 },
+	{ 0x151, 0x151, 0x151, 0 },
+	{ 0x16d, 0x16d, 0x16d, 0 },
+	{ 0x18a, 0x18a, 0x18a, 0 },
+	{ 0x1a8, 0x1a8, 0x1a8, 0 },
+	{ 0x1c7, 0x1c7, 0x1c7, 0 },
+	{ 0x1e8, 0x1e8, 0x1e8, 0 },
+	{ 0x20a, 0x20a, 0x20a, 0 },
+	{ 0x22e, 0x22e, 0x22e, 0 },
+	{ 0x253, 0x253, 0x253, 0 },
+	{ 0x279, 0x279, 0x279, 0 },
+	{ 0x2a0, 0x2a0, 0x2a0, 0 },
+	{ 0x2c9, 0x2c9, 0x2c9, 0 },
+	{ 0x2f4, 0x2f4, 0x2f4, 0 },
+	{ 0x320, 0x320, 0x320, 0 },
+	{ 0x34d, 0x34d, 0x34d, 0 },
+	{ 0x37c, 0x37c, 0x37c, 0 },
+	{ 0x3ac, 0x3ac, 0x3ac, 0 },
+	{ 0x3de, 0x3de, 0x3de, 0 },
+	{ 0x411, 0x411, 0x411, 0 },
+	{ 0x446, 0x446, 0x446, 0 },
+	{ 0x47c, 0x47c, 0x47c, 0 },
+	{ 0x4b4, 0x4b4, 0x4b4, 0 },
+	{ 0x4ed, 0x4ed, 0x4ed, 0 },
+	{ 0x528, 0x528, 0x528, 0 },
+	{ 0x564, 0x564, 0x564, 0 },
+	{ 0x5a3, 0x5a3, 0x5a3, 0 },
+	{ 0x5e2, 0x5e2, 0x5e2, 0 },
+	{ 0x624, 0x624, 0x624, 0 },
+	{ 0x666, 0x666, 0x666, 0 },
+	{ 0x6ab, 0x6ab, 0x6ab, 0 },
+	{ 0x6f1, 0x6f1, 0x6f1, 0 },
+	{ 0x739, 0x739, 0x739, 0 },
+	{ 0x782, 0x782, 0x782, 0 },
+	{ 0x7ce, 0x7ce, 0x7ce, 0 },
+	{ 0x81b, 0x81b, 0x81b, 0 },
+	{ 0x869, 0x869, 0x869, 0 },
+	{ 0x8b9, 0x8b9, 0x8b9, 0 },
+	{ 0x90b, 0x90b, 0x90b, 0 },
+	{ 0x95f, 0x95f, 0x95f, 0 },
+	{ 0x9b5, 0x9b5, 0x9b5, 0 },
+	{ 0xa0c, 0xa0c, 0xa0c, 0 },
+	{ 0xa65, 0xa65, 0xa65, 0 },
+	{ 0xabf, 0xabf, 0xabf, 0 },
+	{ 0xb1c, 0xb1c, 0xb1c, 0 },
+	{ 0xb7a, 0xb7a, 0xb7a, 0 },
+	{ 0xbda, 0xbda, 0xbda, 0 },
+	{ 0xc3c, 0xc3c, 0xc3c, 0 },
+	{ 0xca0, 0xca0, 0xca0, 0 },
+	{ 0xd06, 0xd06, 0xd06, 0 },
+	{ 0xd6d, 0xd6d, 0xd6d, 0 },
+	{ 0xdd6, 0xdd6, 0xdd6, 0 },
+	{ 0xe41, 0xe41, 0xe41, 0 },
+	{ 0xeae, 0xeae, 0xeae, 0 },
+	{ 0xf1d, 0xf1d, 0xf1d, 0 },
+	{ 0xf8e, 0xf8e, 0xf8e, 0 },
+	{ 0x1001, 0x1001, 0x1001, 0 },
+	{ 0x1075, 0x1075, 0x1075, 0 },
+	{ 0x10ec, 0x10ec, 0x10ec, 0 },
+	{ 0x1164, 0x1164, 0x1164, 0 },
+	{ 0x11de, 0x11de, 0x11de, 0 },
+	{ 0x125a, 0x125a, 0x125a, 0 },
+	{ 0x12d9, 0x12d9, 0x12d9, 0 },
+	{ 0x1359, 0x1359, 0x1359, 0 },
+	{ 0x13db, 0x13db, 0x13db, 0 },
+	{ 0x145f, 0x145f, 0x145f, 0 },
+	{ 0x14e5, 0x14e5, 0x14e5, 0 },
+	{ 0x156d, 0x156d, 0x156d, 0 },
+	{ 0x15f7, 0x15f7, 0x15f7, 0 },
+	{ 0x1683, 0x1683, 0x1683, 0 },
+	{ 0x1711, 0x1711, 0x1711, 0 },
+	{ 0x17a1, 0x17a1, 0x17a1, 0 },
+	{ 0x1833, 0x1833, 0x1833, 0 },
+	{ 0x18c7, 0x18c7, 0x18c7, 0 },
+	{ 0x195d, 0x195d, 0x195d, 0 },
+	{ 0x19f6, 0x19f6, 0x19f6, 0 },
+	{ 0x1a90, 0x1a90, 0x1a90, 0 },
+	{ 0x1b2c, 0x1b2c, 0x1b2c, 0 },
+	{ 0x1bcb, 0x1bcb, 0x1bcb, 0 },
+	{ 0x1c6b, 0x1c6b, 0x1c6b, 0 },
+	{ 0x1d0e, 0x1d0e, 0x1d0e, 0 },
+	{ 0x1db3, 0x1db3, 0x1db3, 0 },
+	{ 0x1e59, 0x1e59, 0x1e59, 0 },
+	{ 0x1f02, 0x1f02, 0x1f02, 0 },
+	{ 0x1fad, 0x1fad, 0x1fad, 0 },
+	{ 0x205b, 0x205b, 0x205b, 0 },
+	{ 0x210a, 0x210a, 0x210a, 0 },
+	{ 0x21bb, 0x21bb, 0x21bb, 0 },
+	{ 0x226f, 0x226f, 0x226f, 0 },
+	{ 0x2325, 0x2325, 0x2325, 0 },
+	{ 0x23dd, 0x23dd, 0x23dd, 0 },
+	{ 0x2497, 0x2497, 0x2497, 0 },
+	{ 0x2553, 0x2553, 0x2553, 0 },
+	{ 0x2612, 0x2612, 0x2612, 0 },
+	{ 0x26d2, 0x26d2, 0x26d2, 0 },
+	{ 0x2795, 0x2795, 0x2795, 0 },
+	{ 0x285a, 0x285a, 0x285a, 0 },
+	{ 0x2922, 0x2922, 0x2922, 0 },
+	{ 0x29eb, 0x29eb, 0x29eb, 0 },
+	{ 0x2ab7, 0x2ab7, 0x2ab7, 0 },
+	{ 0x2b85, 0x2b85, 0x2b85, 0 },
+	{ 0x2c56, 0x2c56, 0x2c56, 0 },
+	{ 0x2d28, 0x2d28, 0x2d28, 0 },
+	{ 0x2dfd, 0x2dfd, 0x2dfd, 0 },
+	{ 0x2ed4, 0x2ed4, 0x2ed4, 0 },
+	{ 0x2fad, 0x2fad, 0x2fad, 0 },
+	{ 0x3089, 0x3089, 0x3089, 0 },
+	{ 0x3167, 0x3167, 0x3167, 0 },
+	{ 0x3247, 0x3247, 0x3247, 0 },
+	{ 0x332a, 0x332a, 0x332a, 0 },
+	{ 0x340e, 0x340e, 0x340e, 0 },
+	{ 0x34f5, 0x34f5, 0x34f5, 0 },
+	{ 0x35df, 0x35df, 0x35df, 0 },
+	{ 0x36cb, 0x36cb, 0x36cb, 0 },
+	{ 0x37b9, 0x37b9, 0x37b9, 0 },
+	{ 0x38a9, 0x38a9, 0x38a9, 0 },
+	{ 0x399c, 0x399c, 0x399c, 0 },
+	{ 0x3a91, 0x3a91, 0x3a91, 0 },
+	{ 0x3b89, 0x3b89, 0x3b89, 0 },
+	{ 0x3c83, 0x3c83, 0x3c83, 0 },
+	{ 0x3d7f, 0x3d7f, 0x3d7f, 0 },
+	{ 0x3e7e, 0x3e7e, 0x3e7e, 0 },
+	{ 0x3f7f, 0x3f7f, 0x3f7f, 0 },
+	{ 0x4082, 0x4082, 0x4082, 0 },
+	{ 0x4188, 0x4188, 0x4188, 0 },
+	{ 0x4290, 0x4290, 0x4290, 0 },
+	{ 0x439b, 0x439b, 0x439b, 0 },
+	{ 0x44a8, 0x44a8, 0x44a8, 0 },
+	{ 0x45b7, 0x45b7, 0x45b7, 0 },
+	{ 0x46c9, 0x46c9, 0x46c9, 0 },
+	{ 0x47dd, 0x47dd, 0x47dd, 0 },
+	{ 0x48f4, 0x48f4, 0x48f4, 0 },
+	{ 0x4a0d, 0x4a0d, 0x4a0d, 0 },
+	{ 0x4b29, 0x4b29, 0x4b29, 0 },
+	{ 0x4c47, 0x4c47, 0x4c47, 0 },
+	{ 0x4d68, 0x4d68, 0x4d68, 0 },
+	{ 0x4e8b, 0x4e8b, 0x4e8b, 0 },
+	{ 0x4fb1, 0x4fb1, 0x4fb1, 0 },
+	{ 0x50d9, 0x50d9, 0x50d9, 0 },
+	{ 0x5203, 0x5203, 0x5203, 0 },
+	{ 0x5330, 0x5330, 0x5330, 0 },
+	{ 0x5460, 0x5460, 0x5460, 0 },
+	{ 0x5592, 0x5592, 0x5592, 0 },
+	{ 0x56c6, 0x56c6, 0x56c6, 0 },
+	{ 0x57fd, 0x57fd, 0x57fd, 0 },
+	{ 0x5937, 0x5937, 0x5937, 0 },
+	{ 0x5a73, 0x5a73, 0x5a73, 0 },
+	{ 0x5bb2, 0x5bb2, 0x5bb2, 0 },
+	{ 0x5cf3, 0x5cf3, 0x5cf3, 0 },
+	{ 0x5e37, 0x5e37, 0x5e37, 0 },
+	{ 0x5f7d, 0x5f7d, 0x5f7d, 0 },
+	{ 0x60c6, 0x60c6, 0x60c6, 0 },
+	{ 0x6212, 0x6212, 0x6212, 0 },
+	{ 0x6360, 0x6360, 0x6360, 0 },
+	{ 0x64b0, 0x64b0, 0x64b0, 0 },
+	{ 0x6604, 0x6604, 0x6604, 0 },
+	{ 0x6759, 0x6759, 0x6759, 0 },
+	{ 0x68b2, 0x68b2, 0x68b2, 0 },
+	{ 0x6a0d, 0x6a0d, 0x6a0d, 0 },
+	{ 0x6b6a, 0x6b6a, 0x6b6a, 0 },
+	{ 0x6ccb, 0x6ccb, 0x6ccb, 0 },
+	{ 0x6e2d, 0x6e2d, 0x6e2d, 0 },
+	{ 0x6f93, 0x6f93, 0x6f93, 0 },
+	{ 0x70fb, 0x70fb, 0x70fb, 0 },
+	{ 0x7266, 0x7266, 0x7266, 0 },
+	{ 0x73d3, 0x73d3, 0x73d3, 0 },
+	{ 0x7543, 0x7543, 0x7543, 0 },
+	{ 0x76b6, 0x76b6, 0x76b6, 0 },
+	{ 0x782b, 0x782b, 0x782b, 0 },
+	{ 0x79a3, 0x79a3, 0x79a3, 0 },
+	{ 0x7b1d, 0x7b1d, 0x7b1d, 0 },
+	{ 0x7c9b, 0x7c9b, 0x7c9b, 0 },
+	{ 0x7e1b, 0x7e1b, 0x7e1b, 0 },
+	{ 0x7f9d, 0x7f9d, 0x7f9d, 0 },
+	{ 0x8123, 0x8123, 0x8123, 0 },
+	{ 0x82ab, 0x82ab, 0x82ab, 0 },
+	{ 0x8436, 0x8436, 0x8436, 0 },
+	{ 0x85c3, 0x85c3, 0x85c3, 0 },
+	{ 0x8753, 0x8753, 0x8753, 0 },
+	{ 0x88e6, 0x88e6, 0x88e6, 0 },
+	{ 0x8a7c, 0x8a7c, 0x8a7c, 0 },
+	{ 0x8c14, 0x8c14, 0x8c14, 0 },
+	{ 0x8daf, 0x8daf, 0x8daf, 0 },
+	{ 0x8f4d, 0x8f4d, 0x8f4d, 0 },
+	{ 0x90ed, 0x90ed, 0x90ed, 0 },
+	{ 0x9290, 0x9290, 0x9290, 0 },
+	{ 0x9436, 0x9436, 0x9436, 0 },
+	{ 0x95df, 0x95df, 0x95df, 0 },
+	{ 0x978b, 0x978b, 0x978b, 0 },
+	{ 0x9939, 0x9939, 0x9939, 0 },
+	{ 0x9aea, 0x9aea, 0x9aea, 0 },
+	{ 0x9c9e, 0x9c9e, 0x9c9e, 0 },
+	{ 0x9e55, 0x9e55, 0x9e55, 0 },
+	{ 0xa00e, 0xa00e, 0xa00e, 0 },
+	{ 0xa1ca, 0xa1ca, 0xa1ca, 0 },
+	{ 0xa389, 0xa389, 0xa389, 0 },
+	{ 0xa54b, 0xa54b, 0xa54b, 0 },
+	{ 0xa710, 0xa710, 0xa710, 0 },
+	{ 0xa8d7, 0xa8d7, 0xa8d7, 0 },
+	{ 0xaaa1, 0xaaa1, 0xaaa1, 0 },
+	{ 0xac6e, 0xac6e, 0xac6e, 0 },
+	{ 0xae3e, 0xae3e, 0xae3e, 0 },
+	{ 0xb011, 0xb011, 0xb011, 0 },
+	{ 0xb1e7, 0xb1e7, 0xb1e7, 0 },
+	{ 0xb3bf, 0xb3bf, 0xb3bf, 0 },
+	{ 0xb59a, 0xb59a, 0xb59a, 0 },
+	{ 0xb778, 0xb778, 0xb778, 0 },
+	{ 0xb959, 0xb959, 0xb959, 0 },
+	{ 0xbb3d, 0xbb3d, 0xbb3d, 0 },
+	{ 0xbd24, 0xbd24, 0xbd24, 0 },
+	{ 0xbf0d, 0xbf0d, 0xbf0d, 0 },
+	{ 0xc0fa, 0xc0fa, 0xc0fa, 0 },
+	{ 0xc2e9, 0xc2e9, 0xc2e9, 0 },
+	{ 0xc4db, 0xc4db, 0xc4db, 0 },
+	{ 0xc6d0, 0xc6d0, 0xc6d0, 0 },
+	{ 0xc8c8, 0xc8c8, 0xc8c8, 0 },
+	{ 0xcac3, 0xcac3, 0xcac3, 0 },
+	{ 0xccc1, 0xccc1, 0xccc1, 0 },
+	{ 0xcec1, 0xcec1, 0xcec1, 0 },
+	{ 0xd0c5, 0xd0c5, 0xd0c5, 0 },
+	{ 0xd2cc, 0xd2cc, 0xd2cc, 0 },
+	{ 0xd4d5, 0xd4d5, 0xd4d5, 0 },
+	{ 0xd6e1, 0xd6e1, 0xd6e1, 0 },
+	{ 0xd8f1, 0xd8f1, 0xd8f1, 0 },
+	{ 0xdb03, 0xdb03, 0xdb03, 0 },
+	{ 0xdd18, 0xdd18, 0xdd18, 0 },
+	{ 0xdf30, 0xdf30, 0xdf30, 0 },
+	{ 0xe14b, 0xe14b, 0xe14b, 0 },
+	{ 0xe369, 0xe369, 0xe369, 0 },
+	{ 0xe58a, 0xe58a, 0xe58a, 0 },
+	{ 0xe7ae, 0xe7ae, 0xe7ae, 0 },
+	{ 0xe9d5, 0xe9d5, 0xe9d5, 0 },
+	{ 0xebff, 0xebff, 0xebff, 0 },
+	{ 0xee2c, 0xee2c, 0xee2c, 0 },
+	{ 0xf05c, 0xf05c, 0xf05c, 0 },
+	{ 0xf28f, 0xf28f, 0xf28f, 0 },
+	{ 0xf4c4, 0xf4c4, 0xf4c4, 0 },
+	{ 0xf6fd, 0xf6fd, 0xf6fd, 0 },
+	{ 0xf939, 0xf939, 0xf939, 0 },
+	{ 0xfb78, 0xfb78, 0xfb78, 0 },
+	{ 0xfdba, 0xfdba, 0xfdba, 0 },
+	{ 0xffff, 0xffff, 0xffff, 0 }
+};
+
+#if 0
+struct vkms_color_lut srgb_eotf = {
+	.base = NULL,
+	. lut_length = LUT_SIZE,
+	.channel_value2index_ratio = drm_int2fixp(0xffff)
+	// .channel_value2index_ratio = 0 //drm_fixp_div(drm_int2fixp(0xffff), drm_int2fixp(LUT_SIZE))
+};
+
+#else
+const struct vkms_color_lut srgb_eotf = {
+	.base = srgb_array,
+	.lut_length = 256,
+	.channel_value2index_ratio = 16711935ll
+};
+
+#endif
+
 static u16 pre_mul_blend_channel(u16 src, u16 dst, u16 alpha)
 {
 	u32 new_color;
@@ -136,6 +414,39 @@ static void apply_lut(const struct vkms_crtc_state *crtc_state, struct line_buff
 	}
 }
 
+static void pre_blend_color_transform(const struct vkms_plane_state *plane_state, struct line_buffer *output_buffer)
+{
+	struct drm_colorop *pipeline = plane_state->base.base.color_pipeline;
+	/* TODO this is probably wrong */
+	struct drm_colorop_state *colorop_state;
+
+	if (!pipeline)
+		return;
+
+	colorop_state = pipeline->state;
+
+	if (!colorop_state)
+		return;
+
+	for (size_t x = 0; x < output_buffer->n_pixels; x++) {
+		struct pixel_argb_u16 *pixel = &output_buffer->pixels[x];
+
+		if (pipeline->type == DRM_COLOROP_1D_CURVE &&
+			colorop_state->bypass == false) {
+			switch (colorop_state->curve_1d_type) {
+				case DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF:
+					break;
+				case DRM_COLOROP_1D_CURVE_SRGB_EOTF:
+				default:
+					pixel->r = apply_lut_to_channel_value(&srgb_eotf, pixel->r, LUT_RED);
+					pixel->g = apply_lut_to_channel_value(&srgb_eotf, pixel->g, LUT_GREEN);
+					pixel->b = apply_lut_to_channel_value(&srgb_eotf, pixel->b, LUT_BLUE);
+					break;
+			}
+		}
+	}
+}
+
 /**
  * @wb_frame_info: The writeback frame buffer metadata
  * @crtc_state: The crtc state
@@ -168,8 +479,13 @@ static void blend(struct vkms_writeback_job *wb,
 				continue;
 
 			plane[i]->plane_read(stage_buffer, plane[i]->frame_info, y);
+
+			/* do per-plane color transformations here */
+			// pre_blend_color_transform(plane[i], stage_buffer);
+
 			pre_mul_alpha_blend(plane[i]->frame_info, stage_buffer,
 					    output_buffer);
+			pre_blend_color_transform(plane[i], output_buffer);
 		}
 
 		apply_lut(crtc_state, output_buffer);
diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index 310b31f47928..c04f714cd486 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -168,4 +168,8 @@ void vkms_set_composer(struct vkms_output *out, bool enabled);
 /* Writeback */
 int vkms_enable_writeback_connector(struct vkms_device *vkmsdev);
 
+/* Colorops */
+int vkms_initialize_colorops(struct drm_plane *plane);
+
+
 #endif /* _VKMS_DRV_H_ */
diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
index b3f8a115cc23..cbffbdd7cbf9 100644
--- a/drivers/gpu/drm/vkms/vkms_plane.c
+++ b/drivers/gpu/drm/vkms/vkms_plane.c
@@ -237,5 +237,7 @@ struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
 
 	drm_plane_helper_add(&plane->base, funcs);
 
+	vkms_initialize_colorops(&plane->base);
+
 	return plane;
 }
-- 
2.42.0

