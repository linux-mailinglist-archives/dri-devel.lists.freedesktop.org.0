Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C473F2F65AF
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jan 2021 17:24:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C863989FA5;
	Thu, 14 Jan 2021 16:24:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2607289F0A
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jan 2021 16:24:11 +0000 (UTC)
Received: from Q.local (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net
 [86.31.172.11])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 715EAB87;
 Thu, 14 Jan 2021 17:24:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1610641447;
 bh=eWZL3uR7aIaMFvyWgGOxEbslCY/dFvdleeP2xAGhhDg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=W9KLsOrpczllt9lyqicPWCff9nzZsNFVW28Younfwh0azwkWUigcMMXGnrBfqH46I
 U16VSVUbdgn3myMQ7GehfNDbR5fehvLd3+Z4ijHiVzjU0Dj7IRLnL+DIZqUj8aMR4n
 ls+bHqrs29ZmqBb7Pomy7dSc+m/PZ6/Hl9XQJLvs=
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v4 04/10] media: vsp1: drm: Remove vsp1_du_setup_lif()
Date: Thu, 14 Jan 2021 16:22:49 +0000
Message-Id: <20210114162255.705868-5-kieran.bingham+renesas@ideasonboard.com>
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
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Ulrich Hecht <uli+renesas@fpond.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The vsp1_du_setup_lif() function is deprecated, and the users have been
removed. Remove the implementation and the associated configuration
structure.

Reviewed-by: Ulrich Hecht <uli+renesas@fpond.eu>
Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/platform/vsp1/vsp1_drm.c | 46 --------------------------
 include/media/vsp1.h                   | 22 ------------
 2 files changed, 68 deletions(-)

diff --git a/drivers/media/platform/vsp1/vsp1_drm.c b/drivers/media/platform/vsp1/vsp1_drm.c
index fa79cac32e49..46692460f8a6 100644
--- a/drivers/media/platform/vsp1/vsp1_drm.c
+++ b/drivers/media/platform/vsp1/vsp1_drm.c
@@ -814,52 +814,6 @@ int vsp1_du_atomic_disable(struct device *dev, unsigned int pipe_index)
 }
 EXPORT_SYMBOL_GPL(vsp1_du_atomic_disable);
 
-/**
- * vsp1_du_setup_lif - Setup the output part of the VSP pipeline
- * @dev: the VSP device
- * @pipe_index: the DRM pipeline index
- * @cfg: the LIF configuration
- *
- * Configure the output part of VSP DRM pipeline for the given frame @cfg.width
- * and @cfg.height. This sets up formats on the BRx source pad, the WPF sink and
- * source pads, and the LIF sink pad.
- *
- * The @pipe_index argument selects which DRM pipeline to setup. The number of
- * available pipelines depend on the VSP instance.
- *
- * As the media bus code on the blend unit source pad is conditioned by the
- * configuration of its sink 0 pad, we also set up the formats on all blend unit
- * sinks, even if the configuration will be overwritten later by
- * vsp1_du_setup_rpf(). This ensures that the blend unit configuration is set to
- * a well defined state.
- *
- * Return 0 on success or a negative error code on failure.
- */
-int vsp1_du_setup_lif(struct device *dev, unsigned int pipe_index,
-		      const struct vsp1_du_lif_config *cfg)
-{
-	struct vsp1_du_modeset_config modes;
-	struct vsp1_du_enable_config enable;
-	int ret;
-
-	if (!cfg)
-		return vsp1_du_atomic_disable(dev, pipe_index);
-
-	modes.width = cfg->width;
-	modes.height = cfg->height;
-	modes.interlaced = cfg->interlaced;
-
-	ret = vsp1_du_atomic_modeset(dev, pipe_index, &modes);
-	if (ret)
-		return ret;
-
-	enable.callback = cfg->callback;
-	enable.callback_data = cfg->callback_data;
-
-	return vsp1_du_atomic_enable(dev, pipe_index, &enable);
-}
-EXPORT_SYMBOL_GPL(vsp1_du_setup_lif);
-
 /**
  * vsp1_du_atomic_begin - Prepare for an atomic update
  * @dev: the VSP device
diff --git a/include/media/vsp1.h b/include/media/vsp1.h
index 253db8029752..a4eda8c9d048 100644
--- a/include/media/vsp1.h
+++ b/include/media/vsp1.h
@@ -20,28 +20,6 @@ int vsp1_du_init(struct device *dev);
 #define VSP1_DU_STATUS_COMPLETE		BIT(0)
 #define VSP1_DU_STATUS_WRITEBACK	BIT(1)
 
-/**
- * struct vsp1_du_lif_config - VSP LIF configuration - Deprecated
- * @width: output frame width
- * @height: output frame height
- * @interlaced: true for interlaced pipelines
- * @callback: frame completion callback function (optional). When a callback
- *	      is provided, the VSP driver guarantees that it will be called once
- *	      and only once for each vsp1_du_atomic_flush() call.
- * @callback_data: data to be passed to the frame completion callback
- */
-struct vsp1_du_lif_config {
-	unsigned int width;
-	unsigned int height;
-	bool interlaced;
-
-	void (*callback)(void *data, unsigned int status, u32 crc);
-	void *callback_data;
-};
-
-int vsp1_du_setup_lif(struct device *dev, unsigned int pipe_index,
-		      const struct vsp1_du_lif_config *cfg);
-
 /**
  * struct vsp1_du_modeset_config - VSP display mode configuration
  * @width: output frame width
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
