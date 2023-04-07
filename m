Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A7BEB6DADE1
	for <lists+dri-devel@lfdr.de>; Fri,  7 Apr 2023 15:40:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 961F310EDB1;
	Fri,  7 Apr 2023 13:40:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 376F710ED97
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Apr 2023 13:40:49 +0000 (UTC)
Received: from booty.fritz.box (unknown [77.244.183.192])
 (Authenticated sender: luca.ceresoli@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id C72121BF212;
 Fri,  7 Apr 2023 13:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1680874847;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1XY+GZZPfJG8F5hYsArtflSof3ph6lx6NExlH+2vp4E=;
 b=gYM3RMU55Z+PvnFLn6zeclEItiYEd5YW0XQbZXrgP7s+2gfXMuD+x2mF6CaLPY89sRnHBT
 X5w7czZyc1mlFVLJ60rUdZAb5S4R7mBJ5kUW3+1/I3B+Sg1lEb+hw8fznVeYVRxjPl/u0D
 SxZ73mK4sk0kIc9dSdm8GLdD4HKjEnrxnA6wt9PVy/Is8KAYibrcWtjyRyWLXd66IOVg4J
 NMVCBEkedRVFHcV3hX1ZRallYuNBNu01Ka61tP0H/URQ3N2lQL1REK+Pc0Ugbi8rFs74Qg
 e6V8+YzR3iSsDXjYk4Gd7Qv2d9ZVhH+eZZDbK4FSnm+YU43hhl0i3A4NdbZCig==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: linux-tegra@vger.kernel.org
Subject: [PATCH v5 18/20] staging: media: tegra-video: add hooks for planar
 YUV and H/V flip
Date: Fri,  7 Apr 2023 15:38:50 +0200
Message-Id: <20230407133852.2850145-19-luca.ceresoli@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230407133852.2850145-1-luca.ceresoli@bootlin.com>
References: <20230407133852.2850145-1-luca.ceresoli@bootlin.com>
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

Tegra20 supports planar YUV422 capture, which can be implemented by writing
U and V base address registers in addition to the "main" base buffer
address register.

It also supports H and V flip, which among others requires to write the
start address (i.e. the 1st offset to write, at the end of the buffer or
line) in more registers for Y and, for planar formats, U and V.

Add minimal hooks in VI to allow per-SoC optional support to those
features:

 - variables in struct tegra_vi for the U and V buffer base offsets
 - variables in struct tegra_vi for the Y, U and V buffer start offsets
 - an optional per-soc VI operation to compute those values on queue setup

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Reviewed-by: Dmitry Osipenko <digetx@gmail.com>

---

No changes in v5

Changed in v4:
 - Added review tags

No changes in v3
No changes in v2
---
 drivers/staging/media/tegra-video/vi.c |  4 ++++
 drivers/staging/media/tegra-video/vi.h | 14 ++++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index b74cdd1d1c82..5ab24977ec46 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -102,6 +102,7 @@ tegra_get_format_by_fourcc(struct tegra_vi *vi, u32 fourcc)
 /*
  * videobuf2 queue operations
  */
+
 static int tegra_channel_queue_setup(struct vb2_queue *vq,
 				     unsigned int *nbuffers,
 				     unsigned int *nplanes,
@@ -117,6 +118,9 @@ static int tegra_channel_queue_setup(struct vb2_queue *vq,
 	sizes[0] = chan->format.sizeimage;
 	alloc_devs[0] = chan->vi->dev;
 
+	if (chan->vi->ops->channel_queue_setup)
+		chan->vi->ops->channel_queue_setup(chan);
+
 	return 0;
 }
 
diff --git a/drivers/staging/media/tegra-video/vi.h b/drivers/staging/media/tegra-video/vi.h
index 02f940f2e2eb..cadf80b742a8 100644
--- a/drivers/staging/media/tegra-video/vi.h
+++ b/drivers/staging/media/tegra-video/vi.h
@@ -47,6 +47,7 @@ struct tegra_vi_channel;
  * @channel_host1x_syncpt_free: free all synchronization points
  * @vi_fmt_align: modify `pix` to fit the hardware alignment
  *		requirements and fill image geometry
+ * @channel_queue_setup: additional operations at the end of vb2_ops::queue_setup
  * @vi_start_streaming: starts media pipeline, subdevice streaming, sets up
  *		VI for capture and runs capture start and capture finish
  *		kthreads for capturing frames to buffer and returns them back.
@@ -58,6 +59,7 @@ struct tegra_vi_ops {
 	int (*channel_host1x_syncpt_init)(struct tegra_vi_channel *chan);
 	void (*channel_host1x_syncpt_free)(struct tegra_vi_channel *chan);
 	void (*vi_fmt_align)(struct v4l2_pix_format *pix, unsigned int bpp);
+	void (*channel_queue_setup)(struct tegra_vi_channel *chan);
 	int (*vi_start_streaming)(struct vb2_queue *vq, u32 count);
 	void (*vi_stop_streaming)(struct vb2_queue *vq);
 };
@@ -148,6 +150,12 @@ struct tegra_vi {
  * @queue: vb2 buffers queue
  * @sequence: V4L2 buffers sequence number
  *
+ * @addr_offset_u: U plane base address, relative to buffer base address (only for planar)
+ * @addr_offset_v: V plane base address, relative to buffer base address (only for planar)
+ * @start_offset:   1st Y byte to write, relative to buffer base address (for H/V flip)
+ * @start_offset_u: 1st U byte to write, relative to buffer base address (for H/V flip)
+ * @start_offset_v: 1st V byte to write, relative to buffer base address (for H/V flip)
+ *
  * @capture: list of queued buffers for capture
  * @start_lock: protects the capture queued list
  * @done: list of capture done queued buffers
@@ -189,6 +197,12 @@ struct tegra_vi_channel {
 	struct vb2_queue queue;
 	u32 sequence;
 
+	unsigned int addr_offset_u;
+	unsigned int addr_offset_v;
+	unsigned int start_offset;
+	unsigned int start_offset_u;
+	unsigned int start_offset_v;
+
 	struct list_head capture;
 	/* protects the capture queued list */
 	spinlock_t start_lock;
-- 
2.34.1

