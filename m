Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D0FB66B276B
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 15:44:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFCA110E842;
	Thu,  9 Mar 2023 14:44:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 737E310E842
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Mar 2023 14:44:21 +0000 (UTC)
Received: from booty.fritz.box (unknown [77.244.183.192])
 (Authenticated sender: luca.ceresoli@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id 6A242FF809;
 Thu,  9 Mar 2023 14:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1678373060;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eAvKkQlWuYYr6YxU/goHqRoXYfDwpGVohln81j6K6R8=;
 b=eT/4q1Q7Jo5RTgzWZvhGuXRq7XTUBl+XmFekQqZFh4ZEW2kIMJOq7Nj5oyDKOF0mpT2cIu
 0bz/pW32PfKXVdtIFcCNep/5TUGcFvSs23NgB3pK1paLY0jVSUO9ax84B9yxAYYZf+2+M7
 IAU1qXAN8Zcd/ggaupqiiUFrK8gOklVlZ0zNwOG8gP/jk1Ddf9TZaYl/n7OsuTwNLvmuIp
 oeao6oTcUFlTRLWbGqLQmCCmspSJJ33+zMTQbHzE21LQ9rGy2shoCvJGH7NNw0VOGTrLRr
 /8P6eRQ5j+T5zxJAyAMefytWdarbqCEcRnspdXfZXxAX3rMeucJ0DM/TdsVLRQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Osipenko <digetx@gmail.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [RESEND PATCH v4 17/21] staging: media: tegra-video: move syncpt
 init/free to a per-soc op
Date: Thu,  9 Mar 2023 15:43:16 +0100
Message-Id: <20230309144320.2937553-18-luca.ceresoli@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230309144320.2937553-1-luca.ceresoli@bootlin.com>
References: <20230309144320.2937553-1-luca.ceresoli@bootlin.com>
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
Cc: devicetree@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-tegra@vger.kernel.org,
 Richard Leitner <richard.leitner@skidata.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

tegra_channel_host1x_syncpt_init() gets the host1x syncpts needed for the
Tegra210 implementation, and tegra_channel_host1x_syncpts_free() puts
them.

Tegra20 needs to get and put a different syncpt. In preparation for adding
Tegra20 support, move these functions to new ops in the soc-specific
`struct tegra_vi_ops` .

No functional changes.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Reviewed-by: Dmitry Osipenko <digetx@gmail.com>

---

Changed in v4:
 - Added review tags

No changes in v3
No changes in v2
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
index 22f6d6478d3e..760606c65a97 100644
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

