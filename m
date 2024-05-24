Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 415D98CE983
	for <lists+dri-devel@lfdr.de>; Fri, 24 May 2024 20:28:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C4E610EC65;
	Fri, 24 May 2024 18:28:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="TmX9b2kW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f100.google.com (mail-wm1-f100.google.com
 [209.85.128.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE5A210EC27
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2024 18:27:56 +0000 (UTC)
Received: by mail-wm1-f100.google.com with SMTP id
 5b1f17b1804b1-4202ca70318so64599685e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2024 11:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1716575275; x=1717180075;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=94Kgj4XNRFYduQRTRfIrQIcXqS9keoQhSCwvILhnmSs=;
 b=TmX9b2kW8MfD24SFhZH2kUzsloDeIvDdartMQ7eR4hFcZgHfBxeKC3MT1GKjRgM97B
 UZeD7EgJHXfQJtw/0b7MNOLRlpsHmjwwyeaIf92oO2hopvfoOvxQKUn3BQeN8QYs/ORn
 KJ3HHjjCTlmNVJCGjJRD7897m35NqryyMhNc0mxhMn9lAoOc2Bm5YId6medvJhCH25o3
 owI9+KsCpB+OS20behSbcsq1UBzUJiwvqdxJXa9gZHIfMmjveQtEyPvhSfZqlfzWO5n4
 yZbiw4YlYUsM2vmbBPcQM/5gLN7SjVcq9mZLHuIrabJNNGbYddwaakcRAq7l7+VDa3ez
 GRZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716575275; x=1717180075;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=94Kgj4XNRFYduQRTRfIrQIcXqS9keoQhSCwvILhnmSs=;
 b=AzVvv/sZ/CVHMwXksAA5UDPxBq1GlNAmY9389JQ++xSjfijR15KqbxyxaGFoUpMse0
 IID79Apx3EIMBELcYVnDYb55FSXVPvev3OpWOFMolaMaZUEQVKQcwq89NDwQfuoBbyYC
 27UwqQpGLOpHJXF0tMBf1hmexzgDddICXahkU4sR0GEpywIbeiu80QM29UrPqWdmc+1Q
 ITAErBtRIVF4d6wN0hWRX0sgjdATExByMb/ohRtc5lyUgBt1ge4u6zMKex5Dbb0b5rg0
 XR3ij26eIWIe62hrIweBXswXrozGj0EFywQBzxLiSilAdQR82YkQqdijs2rAFEACYB2a
 5m6g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWmLS9LbMltx8PdTVS2T95TnDmp1aEwXNQTXmF59eJ2OCQ107cJMIYwmOJCcu2VKczTuueDtYPfSGfINvHsz04C54TofU/Fy8CnSQFdx7Mv
X-Gm-Message-State: AOJu0Yyh345Nt1AF7L2+wOAfki2V3w92JGWSzOWGJZ1dgje6PUMTOA06
 hawseDMm1It2wueA0ZPWxgT9z+iAvp7N5ZJZvpl+zQSiZeDDeqC9Wzf0Erqv5JzVFla7JdzJi6k
 fx3rr2qxN6L1pLdzwWHuwHaR1QugSnouD
X-Google-Smtp-Source: AGHT+IGesJtEvV+unRtxxlqVpvfAyXBqt4L3VhNP7OXMl0+5bcpxZXNW6Yligrt0JA2P+vgera6GBoU5TmNu
X-Received: by 2002:a05:6000:248:b0:34d:b605:ec68 with SMTP id
 ffacd0b85a97d-35526c37d2emr2209418f8f.17.1716575275087; 
 Fri, 24 May 2024 11:27:55 -0700 (PDT)
Received: from raspberrypi.com ([188.39.149.98])
 by smtp-relay.gmail.com with ESMTPS id
 ffacd0b85a97d-35579d7beacsm64758f8f.21.2024.05.24.11.27.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 May 2024 11:27:55 -0700 (PDT)
X-Relaying-Domain: raspberrypi.com
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Vinod Koul <vkoul@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Ulf Hansson <ulf.hansson@linaro.org>,
 Mark Brown <broonie@kernel.org>, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Robin Murphy <robin.murphy@arm.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Vladimir Murzin <vladimir.murzin@arm.com>,
 Phil Elwell <phil@raspberrypi.com>, Stefan Wahren <wahrenst@gmx.net>,
 Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc: devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 dmaengine@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mmc@vger.kernel.org, linux-spi@vger.kernel.org,
 iommu@lists.linux.dev, linux-sound@vger.kernel.org,
 Stefan Wahren <stefan.wahren@i2se.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH 07/18] dmaengine: bcm2385: drop info parameters
Date: Fri, 24 May 2024 19:26:51 +0100
Message-Id: <20240524182702.1317935-8-dave.stevenson@raspberrypi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240524182702.1317935-1-dave.stevenson@raspberrypi.com>
References: <20240524182702.1317935-1-dave.stevenson@raspberrypi.com>
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

From: Stefan Wahren <stefan.wahren@i2se.com>

The parameters info and finalextrainfo are platform specific. So drop
them by generating them within bcm2835_dma_create_cb_chain().

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/dma/bcm2835-dma.c | 83 +++++++++++++++++++--------------------
 1 file changed, 40 insertions(+), 43 deletions(-)

diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
index d6c5a2762a46..e2f9c8692e6b 100644
--- a/drivers/dma/bcm2835-dma.c
+++ b/drivers/dma/bcm2835-dma.c
@@ -287,13 +287,11 @@ static void bcm2835_dma_desc_free(struct virt_dma_desc *vd)
 		container_of(vd, struct bcm2835_desc, vd));
 }
 
-static void bcm2835_dma_create_cb_set_length(
-	struct bcm2835_chan *chan,
-	struct bcm2835_dma_cb *control_block,
-	size_t len,
-	size_t period_len,
-	size_t *total_len,
-	u32 finalextrainfo)
+static bool
+bcm2835_dma_create_cb_set_length(struct bcm2835_chan *chan,
+				 struct bcm2835_dma_cb *control_block,
+				 size_t len, size_t period_len,
+				 size_t *total_len)
 {
 	size_t max_len = bcm2835_dma_max_frame_length(chan);
 
@@ -302,7 +300,7 @@ static void bcm2835_dma_create_cb_set_length(
 
 	/* finished if we have no period_length */
 	if (!period_len)
-		return;
+		return false;
 
 	/*
 	 * period_len means: that we need to generate
@@ -316,7 +314,7 @@ static void bcm2835_dma_create_cb_set_length(
 	if (*total_len + control_block->length < period_len) {
 		/* update number of bytes in this period so far */
 		*total_len += control_block->length;
-		return;
+		return false;
 	}
 
 	/* calculate the length that remains to reach period_length */
@@ -325,8 +323,7 @@ static void bcm2835_dma_create_cb_set_length(
 	/* reset total_length for next period */
 	*total_len = 0;
 
-	/* add extrainfo bits in info */
-	control_block->info |= finalextrainfo;
+	return true;
 }
 
 static inline size_t bcm2835_dma_count_frames_for_sg(
@@ -352,7 +349,6 @@ static inline size_t bcm2835_dma_count_frames_for_sg(
  * @chan:           the @dma_chan for which we run this
  * @direction:      the direction in which we transfer
  * @cyclic:         it is a cyclic transfer
- * @info:           the default info bits to apply per controlblock
  * @frames:         number of controlblocks to allocate
  * @src:            the src address to assign
  * @dst:            the dst address to assign
@@ -360,22 +356,24 @@ static inline size_t bcm2835_dma_count_frames_for_sg(
  * @period_len:     the period length when to apply @finalextrainfo
  *                  in addition to the last transfer
  *                  this will also break some control-blocks early
- * @finalextrainfo: additional bits in last controlblock
- *                  (or when period_len is reached in case of cyclic)
  * @gfp:            the GFP flag to use for allocation
+ * @flags
  */
 static struct bcm2835_desc *bcm2835_dma_create_cb_chain(
 	struct dma_chan *chan, enum dma_transfer_direction direction,
-	bool cyclic, u32 info, u32 finalextrainfo, size_t frames,
-	dma_addr_t src, dma_addr_t dst, size_t buf_len,
-	size_t period_len, gfp_t gfp)
+	bool cyclic, size_t frames, dma_addr_t src, dma_addr_t dst,
+	size_t buf_len,	size_t period_len, gfp_t gfp, unsigned long flags)
 {
+	struct bcm2835_dmadev *od = to_bcm2835_dma_dev(chan->device);
 	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
 	size_t len = buf_len, total_len;
 	size_t frame;
 	struct bcm2835_desc *d;
 	struct bcm2835_cb_entry *cb_entry;
 	struct bcm2835_dma_cb *control_block;
+	u32 extrainfo = bcm2835_dma_prepare_cb_extra(c, direction, cyclic,
+						     false, flags);
+	bool zero_page = false;
 
 	if (!frames)
 		return NULL;
@@ -389,6 +387,14 @@ static struct bcm2835_desc *bcm2835_dma_create_cb_chain(
 	d->dir = direction;
 	d->cyclic = cyclic;
 
+	switch (direction) {
+	case DMA_MEM_TO_MEM:
+	case DMA_DEV_TO_MEM:
+		break;
+	default:
+		zero_page = src == od->zero_page;
+	}
+
 	/*
 	 * Iterate over all frames, create a control block
 	 * for each frame and link them together.
@@ -402,7 +408,8 @@ static struct bcm2835_desc *bcm2835_dma_create_cb_chain(
 
 		/* fill in the control block */
 		control_block = cb_entry->cb;
-		control_block->info = info;
+		control_block->info = bcm2835_dma_prepare_cb_info(c, direction,
+								  zero_page);
 		control_block->src = src;
 		control_block->dst = dst;
 		control_block->stride = 0;
@@ -410,10 +417,12 @@ static struct bcm2835_desc *bcm2835_dma_create_cb_chain(
 		/* set up length in control_block if requested */
 		if (buf_len) {
 			/* calculate length honoring period_length */
-			bcm2835_dma_create_cb_set_length(
-				c, control_block,
-				len, period_len, &total_len,
-				cyclic ? finalextrainfo : 0);
+			if (bcm2835_dma_create_cb_set_length(c, control_block,
+							     len, period_len,
+							     &total_len)) {
+				/* add extrainfo bits in info */
+				control_block->info |= extrainfo;
+			}
 
 			/* calculate new remaining length */
 			len -= control_block->length;
@@ -434,7 +443,9 @@ static struct bcm2835_desc *bcm2835_dma_create_cb_chain(
 	}
 
 	/* the last frame requires extra flags */
-	d->cb_list[d->frames - 1].cb->info |= finalextrainfo;
+	extrainfo = bcm2835_dma_prepare_cb_extra(c, direction, cyclic, true,
+						 flags);
+	d->cb_list[d->frames - 1].cb->info |= extrainfo;
 
 	/* detect a size missmatch */
 	if (buf_len && (d->size != buf_len))
@@ -682,9 +693,6 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_dma_memcpy(
 {
 	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
 	struct bcm2835_desc *d;
-	u32 info = bcm2835_dma_prepare_cb_info(c, DMA_MEM_TO_MEM, false);
-	u32 extra = bcm2835_dma_prepare_cb_extra(c, DMA_MEM_TO_MEM, false,
-						 true, 0);
 	size_t max_len = bcm2835_dma_max_frame_length(c);
 	size_t frames;
 
@@ -696,9 +704,8 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_dma_memcpy(
 	frames = bcm2835_dma_frames_for_length(len, max_len);
 
 	/* allocate the CB chain - this also fills in the pointers */
-	d = bcm2835_dma_create_cb_chain(chan, DMA_MEM_TO_MEM, false,
-					info, extra, frames,
-					src, dst, len, 0, GFP_KERNEL);
+	d = bcm2835_dma_create_cb_chain(chan, DMA_MEM_TO_MEM, false, frames,
+					src, dst, len, 0, GFP_KERNEL, 0);
 	if (!d)
 		return NULL;
 
@@ -714,8 +721,6 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_slave_sg(
 	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
 	struct bcm2835_desc *d;
 	dma_addr_t src = 0, dst = 0;
-	u32 info = bcm2835_dma_prepare_cb_info(c, direction, false);
-	u32 extra = bcm2835_dma_prepare_cb_extra(c, direction, false, true, 0);
 	size_t frames;
 
 	if (!is_slave_direction(direction)) {
@@ -738,10 +743,8 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_slave_sg(
 	frames = bcm2835_dma_count_frames_for_sg(c, sgl, sg_len);
 
 	/* allocate the CB chain */
-	d = bcm2835_dma_create_cb_chain(chan, direction, false,
-					info, extra,
-					frames, src, dst, 0, 0,
-					GFP_NOWAIT);
+	d = bcm2835_dma_create_cb_chain(chan, direction, false, frames, src,
+					dst, 0, 0, GFP_NOWAIT, 0);
 	if (!d)
 		return NULL;
 
@@ -757,13 +760,9 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_dma_cyclic(
 	size_t period_len, enum dma_transfer_direction direction,
 	unsigned long flags)
 {
-	struct bcm2835_dmadev *od = to_bcm2835_dma_dev(chan->device);
 	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
 	struct bcm2835_desc *d;
 	dma_addr_t src, dst;
-	u32 info = bcm2835_dma_prepare_cb_info(c, direction,
-					       buf_addr == od->zero_page);
-	u32 extra = bcm2835_dma_prepare_cb_extra(c, direction, true, true, 0);
 	size_t max_len = bcm2835_dma_max_frame_length(c);
 	size_t frames;
 
@@ -814,10 +813,8 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_dma_cyclic(
 	 * note that we need to use GFP_NOWAIT, as the ALSA i2s dmaengine
 	 * implementation calls prep_dma_cyclic with interrupts disabled.
 	 */
-	d = bcm2835_dma_create_cb_chain(chan, direction, true,
-					info, extra,
-					frames, src, dst, buf_len,
-					period_len, GFP_NOWAIT);
+	d = bcm2835_dma_create_cb_chain(chan, direction, true, frames, src, dst,
+					buf_len, period_len, GFP_NOWAIT, flags);
 	if (!d)
 		return NULL;
 
-- 
2.34.1

