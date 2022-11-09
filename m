Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1551623DD4
	for <lists+dri-devel@lfdr.de>; Thu, 10 Nov 2022 09:49:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1E0610E686;
	Thu, 10 Nov 2022 08:47:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 299A589119
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Nov 2022 14:31:16 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (unknown [217.70.183.199])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id A9904C233E
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Nov 2022 14:20:09 +0000 (UTC)
Received: from booty.fritz.box (unknown [77.244.183.192])
 (Authenticated sender: luca.ceresoli@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id BA897FF819;
 Wed,  9 Nov 2022 14:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1668003606;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u7/iNfm4oerh3eWw2mnfLB/WRIyASBXURnoM2MXHFm4=;
 b=otW6ul+yRbDFj8p+1NecC4vsPuOUImJaJ6Dq76HQl/+LB4DcZeR6/h4S5PIk1mz+YLdGzK
 kMOAa4QTA6MqTc8VzN3PXe4P7qCR0BzGFVdbYmuHSZD9wM1v4X7qlD5LpZmRyoLX3b3VCG
 WBQ8zX85EdW/W6EpqCRuFM+TloCvcEKdEKecLpbEjopI9OfNyCBUDt2u9EHfMWZTMb6uCI
 OIkXLZ+Ib2nQVvFwXy5V4jd7WvFQZ6XzYA9/O6Q6kgf6yTHGy3xOekmvLWYSP2e4GuPvux
 IrVF2YaYjt93oPJd+ilM63Q81pvNTkcjM0B7gm0uoadl53N6sJ4Wu+GzJppuwg==
From: luca.ceresoli@bootlin.com
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH 18/23] staging: media: tegra-video: move syncpt init/free to a
 per-soc op
Date: Wed,  9 Nov 2022 15:18:47 +0100
Message-Id: <20221109141852.729246-19-luca.ceresoli@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221109141852.729246-1-luca.ceresoli@bootlin.com>
References: <20221109141852.729246-1-luca.ceresoli@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 10 Nov 2022 08:47:30 +0000
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
Cc: devicetree@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-tegra@vger.kernel.org,
 Richard Leitner <richard.leitner@skidata.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Luca Ceresoli <luca.ceresoli@bootlin.com>

tegra_channel_host1x_syncpt_init() gets the host1x syncpts needed for the
Tegra210 implementation, and tegra_channel_host1x_syncpts_free() puts
them.

Tegra20 needs to get and put a different syncpt. In preparation for adding
Tegra20 support, move these functions to new ops in the soc-specific
`struct tegra_vi_ops` .

No functional changes.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/staging/media/tegra-video/tegra210.c | 52 ++++++++++++++++++++
 drivers/staging/media/tegra-video/vi.c       | 52 ++------------------
 drivers/staging/media/tegra-video/vi.h       |  5 ++
 3 files changed, 60 insertions(+), 49 deletions(-)

diff --git a/drivers/staging/media/tegra-video/tegra210.c b/drivers/staging/media/tegra-video/tegra210.c
index 28d3d05c12c4..d47ba79bac75 100644
--- a/drivers/staging/media/tegra-video/tegra210.c
+++ b/drivers/staging/media/tegra-video/tegra210.c
@@ -179,6 +179,56 @@ static u32 vi_csi_read(struct tegra_vi_channel *chan, u8 portno,
 /*
  * Tegra210 VI channel capture operations
  */
+
+static int tegra210_channel_host1x_syncpt_init(struct tegra_vi_channel *chan)
+{
+	struct tegra_vi *vi = chan->vi;
+	unsigned long flags = HOST1X_SYNCPT_CLIENT_MANAGED;
+	struct host1x_syncpt *fs_sp;
+	struct host1x_syncpt *mw_sp;
+	int ret, i;
+
+	for (i = 0; i < chan->numgangports; i++) {
+		fs_sp = host1x_syncpt_request(&vi->client, flags);
+		if (!fs_sp) {
+			dev_err(vi->dev, "failed to request frame start syncpoint\n");
+			ret = -ENOMEM;
+			goto free_syncpts;
+		}
+
+		mw_sp = host1x_syncpt_request(&vi->client, flags);
+		if (!mw_sp) {
+			dev_err(vi->dev, "failed to request memory ack syncpoint\n");
+			host1x_syncpt_put(fs_sp);
+			ret = -ENOMEM;
+			goto free_syncpts;
+		}
+
+		chan->frame_start_sp[i] = fs_sp;
+		chan->mw_ack_sp[i] = mw_sp;
+		spin_lock_init(&chan->sp_incr_lock[i]);
+	}
+
+	return 0;
+
+free_syncpts:
+	for (i = 0; i < chan->numgangports; i++) {
+		host1x_syncpt_put(chan->mw_ack_sp[i]);
+		host1x_syncpt_put(chan->frame_start_sp[i]);
+	}
+	return ret;
+}
+
+static void tegra210_channel_host1x_syncpt_free(struct tegra_vi_channel *chan)
+{
+	int i;
+
+	for (i = 0; i < chan->numgangports; i++) {
+		host1x_syncpt_put(chan->mw_ack_sp[i]);
+		host1x_syncpt_put(chan->frame_start_sp[i]);
+	}
+}
+
 static void tegra210_fmt_align(struct v4l2_pix_format *pix, unsigned int bpp)
 {
 	unsigned int min_bpl;
@@ -758,6 +808,8 @@ static const struct tegra_video_format tegra210_video_formats[] = {
 
 /* Tegra210 VI operations */
 static const struct tegra_vi_ops tegra210_vi_ops = {
+	.channel_host1x_syncpt_init = tegra210_channel_host1x_syncpt_init,
+	.channel_host1x_syncpt_free = tegra210_channel_host1x_syncpt_free,
 	.vi_fmt_align = tegra210_fmt_align,
 	.vi_start_streaming = tegra210_vi_start_streaming,
 	.vi_stop_streaming = tegra210_vi_stop_streaming,
diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index d0c387873d4e..854ffb4b5617 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -973,21 +973,11 @@ static int tegra_channel_setup_ctrl_handler(struct tegra_vi_channel *chan)
 	return 0;
 }
 
-static void tegra_channel_host1x_syncpts_free(struct tegra_vi_channel *chan)
-{
-	int i;
-
-	for (i = 0; i < chan->numgangports; i++) {
-		host1x_syncpt_put(chan->mw_ack_sp[i]);
-		host1x_syncpt_put(chan->frame_start_sp[i]);
-	}
-}
-
 static void tegra_channel_cleanup(struct tegra_vi_channel *chan)
 {
 	v4l2_ctrl_handler_free(&chan->ctrl_handler);
 	media_entity_cleanup(&chan->video.entity);
-	tegra_channel_host1x_syncpts_free(chan);
+	chan->vi->ops->channel_host1x_syncpt_free(chan);
 	mutex_destroy(&chan->video_lock);
 }
 
@@ -1005,42 +995,6 @@ void tegra_channels_cleanup(struct tegra_vi *vi)
 	}
 }
 
-static int tegra_channel_host1x_syncpt_init(struct tegra_vi_channel *chan)
-{
-	struct tegra_vi *vi = chan->vi;
-	unsigned long flags = HOST1X_SYNCPT_CLIENT_MANAGED;
-	struct host1x_syncpt *fs_sp;
-	struct host1x_syncpt *mw_sp;
-	int ret, i;
-
-	for (i = 0; i < chan->numgangports; i++) {
-		fs_sp = host1x_syncpt_request(&vi->client, flags);
-		if (!fs_sp) {
-			dev_err(vi->dev, "failed to request frame start syncpoint\n");
-			ret = -ENOMEM;
-			goto free_syncpts;
-		}
-
-		mw_sp = host1x_syncpt_request(&vi->client, flags);
-		if (!mw_sp) {
-			dev_err(vi->dev, "failed to request memory ack syncpoint\n");
-			host1x_syncpt_put(fs_sp);
-			ret = -ENOMEM;
-			goto free_syncpts;
-		}
-
-		chan->frame_start_sp[i] = fs_sp;
-		chan->mw_ack_sp[i] = mw_sp;
-		spin_lock_init(&chan->sp_incr_lock[i]);
-	}
-
-	return 0;
-
-free_syncpts:
-	tegra_channel_host1x_syncpts_free(chan);
-	return ret;
-}
-
 static int tegra_channel_init(struct tegra_vi_channel *chan)
 {
 	struct tegra_vi *vi = chan->vi;
@@ -1066,7 +1020,7 @@ static int tegra_channel_init(struct tegra_vi_channel *chan)
 	chan->format.sizeimage = chan->format.bytesperline * TEGRA_DEF_HEIGHT;
 	vi->ops->vi_fmt_align(&chan->format, chan->fmtinfo->bpp);
 
-	ret = tegra_channel_host1x_syncpt_init(chan);
+	ret = vi->ops->channel_host1x_syncpt_init(chan);
 	if (ret)
 		return ret;
 
@@ -1129,7 +1083,7 @@ static int tegra_channel_init(struct tegra_vi_channel *chan)
 cleanup_media:
 	media_entity_cleanup(&chan->video.entity);
 free_syncpts:
-	tegra_channel_host1x_syncpts_free(chan);
+	vi->ops->channel_host1x_syncpt_free(chan);
 	return ret;
 }
 
diff --git a/drivers/staging/media/tegra-video/vi.h b/drivers/staging/media/tegra-video/vi.h
index 851c4f3fcb91..8fadca33bcc9 100644
--- a/drivers/staging/media/tegra-video/vi.h
+++ b/drivers/staging/media/tegra-video/vi.h
@@ -38,10 +38,13 @@ enum tegra_vi_pg_mode {
 };
 
 struct tegra_vi;
+struct tegra_vi_channel;
 
 /**
  * struct tegra_vi_ops - Tegra VI operations
  * @vi_enable: soc-specific operations needed to enable/disable the VI peripheral
+ * @channel_host1x_syncpt_init: initialize synchronization points
+ * @channel_host1x_syncpt_free: free all synchronization points
  * @vi_fmt_align: modify `pix` to fit the hardware alignment
  *		requirements and fill image geometry
  * @vi_start_streaming: starts media pipeline, subdevice streaming, sets up
@@ -52,6 +55,8 @@ struct tegra_vi;
  */
 struct tegra_vi_ops {
 	int (*vi_enable)(struct tegra_vi *vi, bool on);
+	int (*channel_host1x_syncpt_init)(struct tegra_vi_channel *chan);
+	void (*channel_host1x_syncpt_free)(struct tegra_vi_channel *chan);
 	void (*vi_fmt_align)(struct v4l2_pix_format *pix, unsigned int bpp);
 	int (*vi_start_streaming)(struct vb2_queue *vq, u32 count);
 	void (*vi_stop_streaming)(struct vb2_queue *vq);
-- 
2.34.1

