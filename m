Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BB53658D79
	for <lists+dri-devel@lfdr.de>; Thu, 29 Dec 2022 14:38:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B84D10E05E;
	Thu, 29 Dec 2022 13:38:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E456F10E1F9
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Dec 2022 13:37:56 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::229])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id D36B8CAEC1
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Dec 2022 13:33:26 +0000 (UTC)
Received: from booty.fritz.box (unknown [77.244.183.192])
 (Authenticated sender: luca.ceresoli@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id DEB21FF80E;
 Thu, 29 Dec 2022 13:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1672320785;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CW64MxchVb9saBnb7wZiFjtE7xT/bCq9uwLuPiV613I=;
 b=IcrYx/bguyUZYs+cfdCWOZKBpYj9tOyR/uyKoCnbhNn511p6uce8S6pEgH79ipOpwfdfWI
 PULqa9PHCX62Fy380xq/DcIFGNRnTVbtSM6eUOo10mhqBbycLGIzlmSkzc8Lh7oAqR6IRy
 fKKsxQ/XagTMVei/I0VjseCFLdV+7jlTZ5khTRvW9KtIjgZqcAqztSyLbB9D4jEMz0BZ5X
 PIbSqyF33yvcg4cwZ/z5H5r7IhitRZRDUisxuYFXFoD9MPBJH7qGOUUpHmjXYv5218Yars
 j4B8lo9DAnixhULyqLbMQ67b3d3nV2pfFkIE010b9Pk/tO9kGoIdDWQYy+7J6Q==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Osipenko <digetx@gmail.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH v3 19/21] staging: media: tegra-video: add hooks for planar
 YUV and H/V flip
Date: Thu, 29 Dec 2022 14:32:03 +0100
Message-Id: <20221229133205.981397-20-luca.ceresoli@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221229133205.981397-1-luca.ceresoli@bootlin.com>
References: <20221229133205.981397-1-luca.ceresoli@bootlin.com>
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
 Richard Leitner <richard.leitner@skidata.com>, linux-media@vger.kernel.org
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

---

No changes in v3
No changes in v2
---
 drivers/staging/media/tegra-video/vi.c |  4 ++++
 drivers/staging/media/tegra-video/vi.h | 14 ++++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index 760606c65a97..4a066b61ab8e 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -92,6 +92,7 @@ tegra_get_format_by_fourcc(struct tegra_vi *vi, u32 fourcc)
 /*
  * videobuf2 queue operations
  */
+
 static int tegra_channel_queue_setup(struct vb2_queue *vq,
 				     unsigned int *nbuffers,
 				     unsigned int *nplanes,
@@ -107,6 +108,9 @@ static int tegra_channel_queue_setup(struct vb2_queue *vq,
 	sizes[0] = chan->format.sizeimage;
 	alloc_devs[0] = chan->vi->dev;
 
+	if (chan->vi->ops->channel_queue_setup)
+		chan->vi->ops->channel_queue_setup(chan);
+
 	return 0;
 }
 
diff --git a/drivers/staging/media/tegra-video/vi.h b/drivers/staging/media/tegra-video/vi.h
index d5e1ed4217e0..0503eb678556 100644
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
@@ -187,6 +195,12 @@ struct tegra_vi_channel {
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

