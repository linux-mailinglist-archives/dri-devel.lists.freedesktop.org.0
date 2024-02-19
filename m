Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C21CE85A08E
	for <lists+dri-devel@lfdr.de>; Mon, 19 Feb 2024 11:09:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF3D110E1F2;
	Mon, 19 Feb 2024 10:09:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7757C10E1F2
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Feb 2024 10:09:36 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 009491FB;
 Mon, 19 Feb 2024 02:10:16 -0800 (PST)
Received: from a077854.blr.arm.com (a077854.arm.com [10.162.41.80])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 801233F762;
 Mon, 19 Feb 2024 02:09:33 -0800 (PST)
From: Faiz Abbas <faiz.abbas@arm.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Cc: liviu.dudau@arm.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 Faiz Abbas <faiz.abbas@arm.com>
Subject: [PATCH 2/3] drm/arm/komeda: Move pipeline prints to after the entire
 pipeline has been enabled
Date: Mon, 19 Feb 2024 15:39:14 +0530
Message-Id: <20240219100915.192475-3-faiz.abbas@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240219100915.192475-1-faiz.abbas@arm.com>
References: <20240219100915.192475-1-faiz.abbas@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The komeda driver prints a pretty verbose log in komeda_pipeline_dump()
detailing the components of each of the two pipelines. This gets printed
multiple times during boot as komeda EPROBE_DEFERs waiting for the
remote bridge drivers to come up. Move this log to after this has
happened indicating that the printed pipeline is actually completely up.

Signed-off-by: Faiz Abbas <faiz.abbas@arm.com>
---
 drivers/gpu/drm/arm/display/komeda/komeda_crtc.c     | 2 ++
 drivers/gpu/drm/arm/display/komeda/komeda_kms.h      | 1 +
 drivers/gpu/drm/arm/display/komeda/komeda_pipeline.c | 4 ++--
 3 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c b/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
index b645c5998230..92ac09dc033b 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
@@ -667,6 +667,8 @@ static int komeda_crtc_add(struct komeda_kms_dev *kms,
 
 	drm_crtc_enable_color_mgmt(crtc, 0, true, KOMEDA_COLOR_LUT_SIZE);
 
+	komeda_pipeline_dump(pipe);
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_kms.h b/drivers/gpu/drm/arm/display/komeda/komeda_kms.h
index a4048724564d..83e61c4080c2 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_kms.h
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_kms.h
@@ -191,5 +191,6 @@ void komeda_crtc_flush_and_wait_for_flip_done(struct komeda_crtc *kcrtc,
 struct komeda_kms_dev *komeda_kms_attach(struct komeda_dev *mdev);
 void komeda_kms_detach(struct komeda_kms_dev *kms);
 void komeda_kms_shutdown(struct komeda_kms_dev *kms);
+void komeda_pipeline_dump(struct komeda_pipeline *pipe);
 
 #endif /*_KOMEDA_KMS_H_*/
diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_pipeline.c b/drivers/gpu/drm/arm/display/komeda/komeda_pipeline.c
index 4b7d94961527..4b64ed9e9df5 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_pipeline.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_pipeline.c
@@ -9,6 +9,7 @@
 #include <drm/drm_print.h>
 
 #include "komeda_dev.h"
+#include "komeda_kms.h"
 #include "komeda_pipeline.h"
 
 /** komeda_pipeline_add - Add a pipeline to &komeda_dev */
@@ -246,7 +247,7 @@ static void komeda_component_dump(struct komeda_component *c)
 		  c->max_active_outputs, c->supported_outputs);
 }
 
-static void komeda_pipeline_dump(struct komeda_pipeline *pipe)
+void komeda_pipeline_dump(struct komeda_pipeline *pipe)
 {
 	struct komeda_component *c;
 	int id;
@@ -350,7 +351,6 @@ int komeda_assemble_pipelines(struct komeda_dev *mdev)
 		pipe = mdev->pipelines[i];
 
 		komeda_pipeline_assemble(pipe);
-		komeda_pipeline_dump(pipe);
 	}
 
 	return 0;
-- 
2.25.1

