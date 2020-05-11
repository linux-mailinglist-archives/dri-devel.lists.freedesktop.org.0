Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58CB11CD90E
	for <lists+dri-devel@lfdr.de>; Mon, 11 May 2020 13:56:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 045566E443;
	Mon, 11 May 2020 11:55:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2077.outbound.protection.outlook.com [40.107.236.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CCFE6E07B
 for <dri-devel@lists.freedesktop.org>; Mon, 11 May 2020 11:55:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I71sEfM+40el2QRHd5crI4HqDZC/s1ToeFhmzqCOJgmPREAzfoR51ymSr/CciFm3U3CrNPVUhqJkZU1PeY7LiIs6LWV3dyMsHM4XV7PsTSAdOEL4I/jXnW/wlvl6nI1pcAjAa8bGmoD6m8xkTeFENyzx4azRSMnowpu5uueAh1DQyPZ0NIY0QAoim7TwpuJONGc3HD/AZgF7bduGZX+zV8ypqIfIzXvJGoaHZUSlHeOeNv8p2R567Edu4X5LVbASTWEdcecSFRJoz/WbOml9h+IrLR51g/HJ0k2Jxw6pqBVlEG20ZjIVlO7lAKnWzLNwP5aMrNb+153GMhL0Ax0GLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tJMBkV0wyvCPLmBSC2MY8+eXDbG1R/7GzhMspqICHcU=;
 b=iYO+X7+mfWHnrC9Saykju9vO6IisOrqG4/YPiG4kKg2vCP87caIq0T8Cb0r6dpDmcdRiqZQ88x7A29RYJSPt5dZ4mK01Xb9CBth4EbaiialogMDG1EfXE18Hh0YLL58Y7Xa87Q81FIow0AKzc4SK0uSNAo3OyPkpxV3xpwNwHI1gaSedtTQeMstjQ2EbvXzdawzXIdmwkSfIVy5N3JKQJDsQEpSFLfXKFOf/PkELr6Gs/wB7fIBGUXIADjVNNtL9oezlV6hj3t12EMRZraGcBx9KBUgQNneTdWfs+8KMrQEXZ2SRGx2b7AQUZ0Gaz13Pxiz5GY2taswS1P23hqvZJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tJMBkV0wyvCPLmBSC2MY8+eXDbG1R/7GzhMspqICHcU=;
 b=utK2ldakdLgL9Dp6iFSYgmg/USHS3rkU2HmGG55YqUAXi+nr6JfFbZwHof8sb+1MwrBwcR7hXkayYNnkOdyi36VXc4MK/PukhTKB+7TFp2HEnWeirtoF8KjKBsSt6lS8EpBgSHrnD7mQH9z5qTQpprqOFIpps+j3YujU20ndF+0=
Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=amd.com;
Received: from CY4PR12MB1159.namprd12.prod.outlook.com (2603:10b6:903:36::17)
 by CY4PR12MB1944.namprd12.prod.outlook.com (2603:10b6:903:127::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.28; Mon, 11 May
 2020 11:55:43 +0000
Received: from CY4PR12MB1159.namprd12.prod.outlook.com
 ([fe80::e9c0:2506:396c:70b7]) by CY4PR12MB1159.namprd12.prod.outlook.com
 ([fe80::e9c0:2506:396c:70b7%10]) with mapi id 15.20.2979.033; Mon, 11 May
 2020 11:55:43 +0000
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
To: Brian Starkey <brian.starkey@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Daniel Vetter <daniel@ffwll.ch>, Simon Ser <contact@emersion.fr>,
 Leandro Ribeiro <leandro.ribeiro@collabora.com>,
 Helen Koike <helen.koike@collabora.com>
Subject: [PATCH V4 3/3] drm/vkms: Add support for writeback
Date: Mon, 11 May 2020 07:55:24 -0400
Message-Id: <20200511115524.22602-4-Rodrigo.Siqueira@amd.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200511115524.22602-1-Rodrigo.Siqueira@amd.com>
References: <20200511115524.22602-1-Rodrigo.Siqueira@amd.com>
X-ClientProxiedBy: YT1PR01CA0104.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2c::13) To CY4PR12MB1159.namprd12.prod.outlook.com
 (2603:10b6:903:36::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from atma2.hitronhub.home (2607:fea8:56a0:11a1::2) by
 YT1PR01CA0104.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2c::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2979.28 via Frontend Transport; Mon, 11 May 2020 11:55:42 +0000
X-Mailer: git-send-email 2.26.2
X-Originating-IP: [2607:fea8:56a0:11a1::2]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a62877ef-2a4e-4765-3f2c-08d7f5a23bb9
X-MS-TrafficTypeDiagnostic: CY4PR12MB1944:
X-Microsoft-Antispam-PRVS: <CY4PR12MB1944C898472A37EE0AC2D0B398A10@CY4PR12MB1944.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:466;
X-Forefront-PRVS: 04004D94E2
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: prdt/S9Qutt9fiK+cOVp+/SHnV+gWb2xnIoRjOm59jhd07TU04jVy6UBfxuCsF6K7VECt9r7GgztKzDxGRXUGhrxvAV4oY5fA82gCe07Biwt5JXvg/CKEng2NunioPzMQygNS41E64Mr/94/P1QuJpwUKOf7PNy+6jlLTvjmc9xj8/RsvG101yf6sma2CeEHSv0sulQm4CsQjsBf5AwcWlyMDf1ASUd/nxgb6FYT067KZ5y7b1bbpLER2al0KtvQxGLlmz1nLSy97HELvZZk0rB/hrm4CnbL70pic8crmevoLapza1LxukoOHagGjNWBUJpcdKesUF/BqOUv2SlvWzpC/aminEHTI4c88U2WomqI9yTftL5QhJj4PVcEXlb1l7zQAwIB0asS+0nWYfJVeKd2srL3ZeeHfECtBpcYgD4Wx39mpmEi/NVaNhgiZYIIrs3+kvg8tFyS0ChUH9PbYxbHvnwIpuFIdtIpLFLXj8uPPvop2qcjdnhRjt9WeHp322gT4Kht+nDDVFE9CFd3KQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR12MB1159.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(376002)(396003)(136003)(366004)(39860400002)(346002)(33430700001)(36756003)(66946007)(66476007)(86362001)(66556008)(1076003)(6666004)(6506007)(16526019)(52116002)(186003)(316002)(110136005)(2616005)(4326008)(478600001)(6512007)(2906002)(6486002)(5660300002)(33440700001)(8676002)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: 4dM651CoXLIO4Uvm01jaM/G0skB+Nf1I+1I7CEyi+bdXiRpuGHVnL+jMqxLkYaOU3K8VcQTHNHr0+HEiftM94ZmaYN45B9fC/B5zVl6QGCFaXPTv37i+p5GId0j3/XY8cpVjZtKtOw2SyGK0rgGUAYQPNWmb0RyHbnS1lFpOBg3+RfPHtCSxRZx8gGNHkwKx3KFe8Rto2CC62u7ERYmanD8D4uXcZ8pmCY5c6FePM4u/61cAL9nEnQMIgT8Vd+WaZxdnnhrJBLltocO+0Of0OOGliM0fSgyNXdd++/WshzOFlw9IiLCZmoYnRuGCqrz5UoOWJ3l7mI+6dkKc91qiXKblt3GrVlBBLR1efBkZrdpi7s6SzuqTqX3TDWHJd4g50NUvgTuXf73hAj4G7ppsVcy2vLOEtTRQCLyRhTsN8quK6ZLB86z/Iyi5XXW7gz2w2B1x06zOVB7wQQk1NFdEkBPmp7VAmsc3QG+DiZWWkwbJVxoZFZR9iT6bEfSQndpx
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a62877ef-2a4e-4765-3f2c-08d7f5a23bb9
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2020 11:55:43.3706 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wqRkrsYl2z85ICMMiKhjGTwQx0SvZkxVDuxi0qcaG2GEA9sg5Ysz0Q1uDeho9w0CybO6gMakPkZC/PPeYqFWKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1944
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
Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>

This patch implements the necessary functions to add writeback support
for vkms. This feature is useful for testing compositors if you don't
have hardware with writeback support.

Change in V3 (Daniel):
- If writeback is enabled, compose everything into the writeback buffer
instead of CRC private buffer.
- Guarantees that the CRC will match exactly what we have in the
writeback buffer.

Change in V2:
- Rework signal completion (Brian)
- Integrates writeback with active_planes (Daniel)
- Compose cursor (Daniel)

Signed-off-by: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
---
 drivers/gpu/drm/vkms/Makefile         |   9 +-
 drivers/gpu/drm/vkms/vkms_composer.c  |  16 ++-
 drivers/gpu/drm/vkms/vkms_drv.c       |   4 +
 drivers/gpu/drm/vkms/vkms_drv.h       |   8 ++
 drivers/gpu/drm/vkms/vkms_output.c    |  10 ++
 drivers/gpu/drm/vkms/vkms_writeback.c | 142 ++++++++++++++++++++++++++
 6 files changed, 186 insertions(+), 3 deletions(-)
 create mode 100644 drivers/gpu/drm/vkms/vkms_writeback.c

diff --git a/drivers/gpu/drm/vkms/Makefile b/drivers/gpu/drm/vkms/Makefile
index 0b767d7efa24..333d3cead0e3 100644
--- a/drivers/gpu/drm/vkms/Makefile
+++ b/drivers/gpu/drm/vkms/Makefile
@@ -1,4 +1,11 @@
 # SPDX-License-Identifier: GPL-2.0-only
-vkms-y := vkms_drv.o vkms_plane.o vkms_output.o vkms_crtc.o vkms_gem.o vkms_composer.o
+vkms-y := \
+	vkms_drv.o \
+	vkms_plane.o \
+	vkms_output.o \
+	vkms_crtc.o \
+	vkms_gem.o \
+	vkms_composer.o \
+	vkms_writeback.o
 
 obj-$(CONFIG_DRM_VKMS) += vkms.o
diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index 686d25e7b01d..19849e39f8b9 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -160,16 +160,17 @@ void vkms_composer_worker(struct work_struct *work)
 	struct vkms_output *out = drm_crtc_to_vkms_output(crtc);
 	struct vkms_composer *primary_composer = NULL;
 	struct vkms_composer *cursor_composer = NULL;
+	bool crc_pending, wb_pending;
 	void *vaddr_out = NULL;
 	u32 crc32 = 0;
 	u64 frame_start, frame_end;
-	bool crc_pending;
 	int ret;
 
 	spin_lock_irq(&out->composer_lock);
 	frame_start = crtc_state->frame_start;
 	frame_end = crtc_state->frame_end;
 	crc_pending = crtc_state->crc_pending;
+	wb_pending = crtc_state->wb_pending;
 	crtc_state->frame_start = 0;
 	crtc_state->frame_end = 0;
 	crtc_state->crc_pending = false;
@@ -191,9 +192,12 @@ void vkms_composer_worker(struct work_struct *work)
 	if (!primary_composer)
 		return;
 
+	if (wb_pending)
+		vaddr_out = crtc_state->active_writeback;
+
 	ret = compose_planes(&vaddr_out, primary_composer, cursor_composer);
 	if (ret) {
-		if (ret == -EINVAL)
+		if (ret == -EINVAL && !wb_pending)
 			kfree(vaddr_out);
 		return;
 	}
@@ -206,6 +210,14 @@ void vkms_composer_worker(struct work_struct *work)
 	while (frame_start <= frame_end)
 		drm_crtc_add_crc_entry(crtc, true, frame_start++, &crc32);
 
+	if (wb_pending) {
+		drm_writeback_signal_completion(&out->wb_connector, 0);
+		spin_lock_irq(&out->composer_lock);
+		crtc_state->wb_pending = false;
+		spin_unlock_irq(&out->composer_lock);
+		return;
+	}
+
 	kfree(vaddr_out);
 }
 
diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index 1e8b2169d834..34dd74dc8eb0 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -39,6 +39,10 @@ bool enable_cursor = true;
 module_param_named(enable_cursor, enable_cursor, bool, 0444);
 MODULE_PARM_DESC(enable_cursor, "Enable/Disable cursor support");
 
+bool enable_writeback;
+module_param_named(enable_writeback, enable_writeback, bool, 0444);
+MODULE_PARM_DESC(enable_writeback, "Enable/Disable writeback connector");
+
 static const struct file_operations vkms_driver_fops = {
 	.owner		= THIS_MODULE,
 	.open		= drm_open,
diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index f4036bb0b9a8..35f0b71413c9 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -8,6 +8,7 @@
 #include <drm/drm.h>
 #include <drm/drm_gem.h>
 #include <drm/drm_encoder.h>
+#include <drm/drm_writeback.h>
 
 #define XRES_MIN    20
 #define YRES_MIN    20
@@ -19,6 +20,7 @@
 #define YRES_MAX  8192
 
 extern bool enable_cursor;
+extern bool enable_writeback;
 
 struct vkms_composer {
 	struct drm_framebuffer fb;
@@ -52,9 +54,11 @@ struct vkms_crtc_state {
 	int num_active_planes;
 	/* stack of active planes for crc computation, should be in z order */
 	struct vkms_plane_state **active_planes;
+	void *active_writeback;
 
 	/* below three are protected by vkms_output.composer_lock */
 	bool crc_pending;
+	bool wb_pending;
 	u64 frame_start;
 	u64 frame_end;
 };
@@ -63,6 +67,7 @@ struct vkms_output {
 	struct drm_crtc crtc;
 	struct drm_encoder encoder;
 	struct drm_connector connector;
+	struct drm_writeback_connector wb_connector;
 	struct hrtimer vblank_hrtimer;
 	ktime_t period_ns;
 	struct drm_pending_vblank_event *event;
@@ -144,4 +149,7 @@ int vkms_verify_crc_source(struct drm_crtc *crtc, const char *source_name,
 /* Composer Support */
 void vkms_composer_worker(struct work_struct *work);
 
+/* Writeback */
+int enable_writeback_connector(struct vkms_device *vkmsdev);
+
 #endif /* _VKMS_DRV_H_ */
diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
index 85afb77e97f0..19ffc67affec 100644
--- a/drivers/gpu/drm/vkms/vkms_output.c
+++ b/drivers/gpu/drm/vkms/vkms_output.c
@@ -80,6 +80,16 @@ int vkms_output_init(struct vkms_device *vkmsdev, int index)
 		goto err_attach;
 	}
 
+	if (enable_writeback) {
+		ret = enable_writeback_connector(vkmsdev);
+		if (!ret) {
+			output->composer_enabled = true;
+			DRM_INFO("Writeback connector enabled");
+		} else {
+			DRM_ERROR("Failed to init writeback connector\n");
+		}
+	}
+
 	drm_mode_config_reset(dev);
 
 	return 0;
diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c b/drivers/gpu/drm/vkms/vkms_writeback.c
new file mode 100644
index 000000000000..868f0d15ca9f
--- /dev/null
+++ b/drivers/gpu/drm/vkms/vkms_writeback.c
@@ -0,0 +1,142 @@
+// SPDX-License-Identifier: GPL-2.0+
+
+#include "vkms_drv.h"
+#include <drm/drm_fourcc.h>
+#include <drm/drm_writeback.h>
+#include <drm/drm_probe_helper.h>
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_gem_framebuffer_helper.h>
+
+static const u32 vkms_wb_formats[] = {
+	DRM_FORMAT_XRGB8888,
+};
+
+static const struct drm_connector_funcs vkms_wb_connector_funcs = {
+	.fill_modes = drm_helper_probe_single_connector_modes,
+	.destroy = drm_connector_cleanup,
+	.reset = drm_atomic_helper_connector_reset,
+	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
+};
+
+static int vkms_wb_encoder_atomic_check(struct drm_encoder *encoder,
+					struct drm_crtc_state *crtc_state,
+					struct drm_connector_state *conn_state)
+{
+	struct drm_framebuffer *fb;
+	const struct drm_display_mode *mode = &crtc_state->mode;
+
+	if (!conn_state->writeback_job || !conn_state->writeback_job->fb)
+		return 0;
+
+	fb = conn_state->writeback_job->fb;
+	if (fb->width != mode->hdisplay || fb->height != mode->vdisplay) {
+		DRM_DEBUG_KMS("Invalid framebuffer size %ux%u\n",
+			      fb->width, fb->height);
+		return -EINVAL;
+	}
+
+	if (fb->format->format != DRM_FORMAT_XRGB8888) {
+		struct drm_format_name_buf format_name;
+
+		DRM_DEBUG_KMS("Invalid pixel format %s\n",
+			      drm_get_format_name(fb->format->format,
+						  &format_name));
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static const struct drm_encoder_helper_funcs vkms_wb_encoder_helper_funcs = {
+	.atomic_check = vkms_wb_encoder_atomic_check,
+};
+
+static int vkms_wb_connector_get_modes(struct drm_connector *connector)
+{
+	struct drm_device *dev = connector->dev;
+
+	return drm_add_modes_noedid(connector, dev->mode_config.max_width,
+				    dev->mode_config.max_height);
+}
+
+static int vkms_wb_prepare_job(struct drm_writeback_connector *wb_connector,
+			       struct drm_writeback_job *job)
+{
+	struct vkms_gem_object *vkms_obj;
+	struct drm_gem_object *gem_obj;
+	int ret;
+
+	if (!job->fb)
+		return 0;
+
+	gem_obj = drm_gem_fb_get_obj(job->fb, 0);
+	ret = vkms_gem_vmap(gem_obj);
+	if (ret) {
+		DRM_ERROR("vmap failed: %d\n", ret);
+		return ret;
+	}
+
+	vkms_obj = drm_gem_to_vkms_gem(gem_obj);
+	job->priv = vkms_obj->vaddr;
+
+	return 0;
+}
+
+static void vkms_wb_cleanup_job(struct drm_writeback_connector *connector,
+				struct drm_writeback_job *job)
+{
+	struct drm_gem_object *gem_obj;
+
+	if (!job->fb)
+		return;
+
+	gem_obj = drm_gem_fb_get_obj(job->fb, 0);
+	vkms_gem_vunmap(gem_obj);
+}
+
+static void vkms_wb_atomic_commit(struct drm_connector *conn,
+				  struct drm_connector_state *state)
+{
+	struct vkms_device *vkmsdev = drm_device_to_vkms_device(conn->dev);
+	struct vkms_output *output = &vkmsdev->output;
+	struct drm_writeback_connector *wb_conn = &output->wb_connector;
+	struct drm_connector_state *conn_state = wb_conn->base.state;
+	struct vkms_crtc_state *crtc_state = output->composer_state;
+
+	if (!conn_state)
+		return;
+
+	if (!conn_state->writeback_job || !conn_state->writeback_job->fb) {
+		DRM_DEBUG_DRIVER("Disable writeback\n");
+		return;
+	}
+
+	spin_lock_irq(&output->composer_lock);
+	crtc_state->active_writeback = conn_state->writeback_job->priv;
+	crtc_state->wb_pending = true;
+	spin_unlock_irq(&output->composer_lock);
+	drm_writeback_queue_job(wb_conn, state);
+}
+
+static const struct drm_connector_helper_funcs vkms_wb_conn_helper_funcs = {
+	.get_modes = vkms_wb_connector_get_modes,
+	.prepare_writeback_job = vkms_wb_prepare_job,
+	.cleanup_writeback_job = vkms_wb_cleanup_job,
+	.atomic_commit = vkms_wb_atomic_commit,
+};
+
+int enable_writeback_connector(struct vkms_device *vkmsdev)
+{
+	struct drm_writeback_connector *wb = &vkmsdev->output.wb_connector;
+
+	vkmsdev->output.wb_connector.encoder.possible_crtcs = 1;
+	drm_connector_helper_add(&wb->base, &vkms_wb_conn_helper_funcs);
+
+	return drm_writeback_connector_init(&vkmsdev->drm, wb,
+					    &vkms_wb_connector_funcs,
+					    &vkms_wb_encoder_helper_funcs,
+					    vkms_wb_formats,
+					    ARRAY_SIZE(vkms_wb_formats));
+}
+
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
