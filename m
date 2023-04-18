Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 207416E5B4A
	for <lists+dri-devel@lfdr.de>; Tue, 18 Apr 2023 10:02:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACD1410E6E7;
	Tue, 18 Apr 2023 08:02:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8274610E6CC
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 08:01:57 +0000 (UTC)
Received: from booty.fritz.box (unknown [77.244.183.192])
 (Authenticated sender: luca.ceresoli@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id 40241240002;
 Tue, 18 Apr 2023 08:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1681804916;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WHtXu443TJRJ6GwgsTbQlfRYlzvdX8VV6/Serf3ZnwY=;
 b=aCYRKFDbcbpSSwmY3f7//lwHf52xby6RZcxxhcTBMaGC7fuLf5jev5tBEBXAKlEgGOjyGu
 V05OQys+bWYSCW6bvph1nEm7Gu7Xeuu6E5/j403vBw9x3LBqkK18MiqpQqvPnolhN1TQ8D
 KJE6/6pfIwxDjjnwtY1RtmpVxP/qw9R+zI7jGlHKKau5KCX7oE4ttwggdYA7D7D/E+dQGE
 /vXQSW7QhRzR11MRNeDhXMv1zqmdSc/SITmkMi2jBAjrSsau1Xloyl9WGhKWg4XVISgqJS
 0xtdEdz/APe4hcKi2PZocrUrvbACqHxvTpg6sLJ1bj14KnouNO8By+xQ4X4OxA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: linux-tegra@vger.kernel.org
Subject: [PATCH v6 14/20] staging: media: tegra-video: move MIPI calibration
 calls from VI to CSI
Date: Tue, 18 Apr 2023 10:00:48 +0200
Message-Id: <20230418080054.452955-15-luca.ceresoli@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230418080054.452955-1-luca.ceresoli@bootlin.com>
References: <20230418080054.452955-1-luca.ceresoli@bootlin.com>
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
Cc: devicetree@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Richard Leitner <richard.leitner@skidata.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>, dri-devel@lists.freedesktop.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Dmitry Osipenko <digetx@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The CSI module does not handle all the MIPI lane calibration procedure,
leaving a small part of it to the VI module. In doing this,
tegra_channel_enable_stream() (vi.c) manipulates the private data of the
upstream subdev casting it to struct 'tegra_csi_channel', which will be
wrong after introducing a VIP (parallel video input) channel.

This prevents adding support for the VIP module.  It also breaks the
logical isolation between modules.

Since the lane calibration requirement does not exist in the parallel input
module, moving the calibration function to a per-module op is not
optimal. Instead move the calibration procedure in the CSI module, together
with the rest of the calibration procedures. After this change,
tegra_channel_enable_stream() just calls v4l2_subdev_call() to ask for a
stream start/stop to the CSI module, which in turn knows all the
CSI-specific details to implement it.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Reviewed-by: Dmitry Osipenko <digetx@gmail.com>

---

Changed in v6:
 - Fix unlock imbalance on Tegra210 (thanks Hans for reporting!)

No changes in v5

Changed in v4:
 - Added review tags

No changes in v3
No changes in v2
---
 drivers/staging/media/tegra-video/csi.c | 44 ++++++++++++++++++++
 drivers/staging/media/tegra-video/vi.c  | 54 ++-----------------------
 2 files changed, 48 insertions(+), 50 deletions(-)

diff --git a/drivers/staging/media/tegra-video/csi.c b/drivers/staging/media/tegra-video/csi.c
index 9a03d5ccdf3c..91d9febb8fd8 100644
--- a/drivers/staging/media/tegra-video/csi.c
+++ b/drivers/staging/media/tegra-video/csi.c
@@ -328,12 +328,42 @@ static int tegra_csi_enable_stream(struct v4l2_subdev *subdev)
 	}
 
 	csi_chan->pg_mode = chan->pg_mode;
+
+	/*
+	 * Tegra CSI receiver can detect the first LP to HS transition.
+	 * So, start the CSI stream-on prior to sensor stream-on and
+	 * vice-versa for stream-off.
+	 */
 	ret = csi->ops->csi_start_streaming(csi_chan);
 	if (ret < 0)
 		goto finish_calibration;
 
+	if (csi_chan->mipi) {
+		struct v4l2_subdev *src_subdev;
+		/*
+		 * TRM has incorrectly documented to wait for done status from
+		 * calibration logic after CSI interface power on.
+		 * As per the design, calibration results are latched and applied
+		 * to the pads only when the link is in LP11 state which will happen
+		 * during the sensor stream-on.
+		 * CSI subdev stream-on triggers start of MIPI pads calibration.
+		 * Wait for calibration to finish here after sensor subdev stream-on.
+		 */
+		src_subdev = tegra_channel_get_remote_source_subdev(chan);
+		ret = v4l2_subdev_call(src_subdev, video, s_stream, true);
+
+		if (ret < 0 && ret != -ENOIOCTLCMD)
+			goto disable_csi_stream;
+
+		err = tegra_mipi_finish_calibration(csi_chan->mipi);
+		if (err < 0)
+			dev_warn(csi->dev, "MIPI calibration failed: %d\n", err);
+	}
+
 	return 0;
 
+disable_csi_stream:
+	csi->ops->csi_stop_streaming(csi_chan);
 finish_calibration:
 	if (csi_chan->mipi)
 		tegra_mipi_finish_calibration(csi_chan->mipi);
@@ -352,10 +382,24 @@ static int tegra_csi_enable_stream(struct v4l2_subdev *subdev)
 
 static int tegra_csi_disable_stream(struct v4l2_subdev *subdev)
 {
+	struct tegra_vi_channel *chan = v4l2_get_subdev_hostdata(subdev);
 	struct tegra_csi_channel *csi_chan = to_csi_chan(subdev);
 	struct tegra_csi *csi = csi_chan->csi;
 	int err;
 
+	/*
+	 * Stream-off subdevices in reverse order to stream-on.
+	 * Remote source subdev in TPG mode is same as CSI subdev.
+	 */
+	if (csi_chan->mipi) {
+		struct v4l2_subdev *src_subdev;
+
+		src_subdev = tegra_channel_get_remote_source_subdev(chan);
+		err = v4l2_subdev_call(src_subdev, video, s_stream, false);
+		if (err < 0 && err != -ENOIOCTLCMD)
+			dev_err_probe(csi->dev, err, "source subdev stream off failed\n");
+	}
+
 	csi->ops->csi_stop_streaming(csi_chan);
 
 	if (csi_chan->mipi) {
diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index b88532d8d2c9..c76c2a404889 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -197,49 +197,15 @@ tegra_channel_get_remote_source_subdev(struct tegra_vi_channel *chan)
 
 static int tegra_channel_enable_stream(struct tegra_vi_channel *chan)
 {
-	struct v4l2_subdev *csi_subdev, *src_subdev;
-	struct tegra_csi_channel *csi_chan;
-	int ret, err;
+	struct v4l2_subdev *subdev;
+	int ret;
 
-	/*
-	 * Tegra CSI receiver can detect the first LP to HS transition.
-	 * So, start the CSI stream-on prior to sensor stream-on and
-	 * vice-versa for stream-off.
-	 */
-	csi_subdev = tegra_channel_get_remote_csi_subdev(chan);
-	ret = v4l2_subdev_call(csi_subdev, video, s_stream, true);
+	subdev = tegra_channel_get_remote_csi_subdev(chan);
+	ret = v4l2_subdev_call(subdev, video, s_stream, true);
 	if (ret < 0 && ret != -ENOIOCTLCMD)
 		return ret;
 
-	if (IS_ENABLED(CONFIG_VIDEO_TEGRA_TPG))
-		return 0;
-
-	csi_chan = v4l2_get_subdevdata(csi_subdev);
-	/*
-	 * TRM has incorrectly documented to wait for done status from
-	 * calibration logic after CSI interface power on.
-	 * As per the design, calibration results are latched and applied
-	 * to the pads only when the link is in LP11 state which will happen
-	 * during the sensor stream-on.
-	 * CSI subdev stream-on triggers start of MIPI pads calibration.
-	 * Wait for calibration to finish here after sensor subdev stream-on.
-	 */
-	src_subdev = tegra_channel_get_remote_source_subdev(chan);
-	ret = v4l2_subdev_call(src_subdev, video, s_stream, true);
-	err = tegra_mipi_finish_calibration(csi_chan->mipi);
-
-	if (ret < 0 && ret != -ENOIOCTLCMD)
-		goto err_disable_csi_stream;
-
-	if (err < 0)
-		dev_warn(csi_chan->csi->dev,
-			 "MIPI calibration failed: %d\n", err);
-
 	return 0;
-
-err_disable_csi_stream:
-	v4l2_subdev_call(csi_subdev, video, s_stream, false);
-	return ret;
 }
 
 static int tegra_channel_disable_stream(struct tegra_vi_channel *chan)
@@ -247,18 +213,6 @@ static int tegra_channel_disable_stream(struct tegra_vi_channel *chan)
 	struct v4l2_subdev *subdev;
 	int ret;
 
-	/*
-	 * Stream-off subdevices in reverse order to stream-on.
-	 * Remote source subdev in TPG mode is same as CSI subdev.
-	 */
-	subdev = tegra_channel_get_remote_source_subdev(chan);
-	ret = v4l2_subdev_call(subdev, video, s_stream, false);
-	if (ret < 0 && ret != -ENOIOCTLCMD)
-		return ret;
-
-	if (IS_ENABLED(CONFIG_VIDEO_TEGRA_TPG))
-		return 0;
-
 	subdev = tegra_channel_get_remote_csi_subdev(chan);
 	ret = v4l2_subdev_call(subdev, video, s_stream, false);
 	if (ret < 0 && ret != -ENOIOCTLCMD)
-- 
2.34.1

