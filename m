Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 23F1A2F65B5
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jan 2021 17:24:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D6326E1D3;
	Thu, 14 Jan 2021 16:24:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A00C089F0A
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jan 2021 16:24:09 +0000 (UTC)
Received: from Q.local (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net
 [86.31.172.11])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 898998EF;
 Thu, 14 Jan 2021 17:24:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1610641446;
 bh=zORDbomIFkIlxQcbzHxSvw0hoVYkwxy+GP1jaPdQttI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BVRHKfLuvX2oIcA3436bIz+udANvVwJ/h0tXTOS8t4bSjGbOizrMIMhyAYbXsKUak
 6RzdIUVSqlZPpkH5JLYMfUrJsUqD0u0q/0vvVenD49cX5MOP+/BNNzc4XlUZIFV1RY
 +ZESZkSoJcjjVPgrLhLUyMivXa7l8MKKE4okZdzU=
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v4 02/10] media: vsp1: drm: Don't configure hardware when the
 pipeline is disabled
Date: Thu, 14 Jan 2021 16:22:47 +0000
Message-Id: <20210114162255.705868-3-kieran.bingham+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210114162255.705868-1-kieran.bingham+renesas@ideasonboard.com>
References: <20210114162255.705868-1-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
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
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Ulrich Hecht <uli+renesas@fpond.eu>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

The vsp1_du_atomic_flush() function calls vsp1_du_pipeline_configure()
to configure the hardware pipeline. The function is currently guaranteed
to be called with the pipeline enabled, but this will change by future
rework of the DU driver. Guard the hardware configuration to skip it
when the pipeline is disabled. The hardware will be configured the next
time the pipeline gets enabled.

Reviewed-by: Ulrich Hecht <uli+renesas@fpond.eu>
Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
 drivers/media/platform/vsp1/vsp1_drm.c | 13 ++++++++++++-
 drivers/media/platform/vsp1/vsp1_drm.h |  2 ++
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/vsp1/vsp1_drm.c b/drivers/media/platform/vsp1/vsp1_drm.c
index 2bac80014bf4..fa79cac32e49 100644
--- a/drivers/media/platform/vsp1/vsp1_drm.c
+++ b/drivers/media/platform/vsp1/vsp1_drm.c
@@ -723,6 +723,8 @@ int vsp1_du_atomic_enable(struct device *dev, unsigned int pipe_index,
 	/* Configure all entities in the pipeline. */
 	vsp1_du_pipeline_configure(pipe);
 
+	drm_pipe->enabled = true;
+
 unlock:
 	mutex_unlock(&vsp1->drm->lock);
 
@@ -799,6 +801,8 @@ int vsp1_du_atomic_disable(struct device *dev, unsigned int pipe_index)
 	pipe->brx->pipe = NULL;
 	pipe->brx = NULL;
 
+	drm_pipe->enabled = false;
+
 	mutex_unlock(&vsp1->drm->lock);
 
 	vsp1_dlm_reset(pipe->output->dlm);
@@ -991,7 +995,14 @@ void vsp1_du_atomic_flush(struct device *dev, unsigned int pipe_index,
 	}
 
 	vsp1_du_pipeline_setup_inputs(vsp1, pipe);
-	vsp1_du_pipeline_configure(pipe);
+
+	/*
+	 * We may get called before the pipeline gets enabled, postpone
+	 * configuration in that case. vsp1_du_pipeline_configure() will be
+	 * called from vsp1_du_atomic_enable().
+	 */
+	if (drm_pipe->enabled)
+		vsp1_du_pipeline_configure(pipe);
 
 done:
 	mutex_unlock(&vsp1->drm->lock);
diff --git a/drivers/media/platform/vsp1/vsp1_drm.h b/drivers/media/platform/vsp1/vsp1_drm.h
index e85ad4366fbb..d780dafc1324 100644
--- a/drivers/media/platform/vsp1/vsp1_drm.h
+++ b/drivers/media/platform/vsp1/vsp1_drm.h
@@ -20,6 +20,7 @@
 /**
  * vsp1_drm_pipeline - State for the API exposed to the DRM driver
  * @pipe: the VSP1 pipeline used for display
+ * @enabled: true if the pipeline is enabled
  * @width: output display width
  * @height: output display height
  * @force_brx_release: when set, release the BRx during the next reconfiguration
@@ -31,6 +32,7 @@
  */
 struct vsp1_drm_pipeline {
 	struct vsp1_pipeline pipe;
+	bool enabled;
 
 	unsigned int width;
 	unsigned int height;
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
