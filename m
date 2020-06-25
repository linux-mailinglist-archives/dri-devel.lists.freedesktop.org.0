Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C767820A47D
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jun 2020 20:13:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F18D66E128;
	Thu, 25 Jun 2020 18:13:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x144.google.com (mail-il1-x144.google.com
 [IPv6:2607:f8b0:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD8DE6E128
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jun 2020 18:13:47 +0000 (UTC)
Received: by mail-il1-x144.google.com with SMTP id t85so6224248ili.5
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jun 2020 11:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=VstA5hrEq9VpvC9DROyBs75UqvmVwR+Se8yYm9DGqa8=;
 b=I31uubtQCWSvMe8Iqy47DbzfqdY4vTS0AyF0c9aMR3nSofHfDs6pooTiZpWwu0Ddny
 AG0YNuJ3LxePJHdnFYLQv15HXN7vs5prvWu+No7OcgCm8DR78mPmal5Io+tr+BOuZ05C
 xW7uIk501Tm6ft94zX5c2IPaFKjKsVw3aU0qcqKeeP/+GzmAjVBgNjNDxFD5lUrhTzZi
 8dWk7sOZegMrWPKH8AUKg0LwmGb4fMwum0ce+UnmYIrkGzf9BuSiO8GnCSI9Up/D65rm
 /xIov4xTaFvU7XFFNLJqeP8OXIwas2P3oqnw8UPOgUUOgIRkuWRmz9zvZA4c/NEhhcfw
 Enew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=VstA5hrEq9VpvC9DROyBs75UqvmVwR+Se8yYm9DGqa8=;
 b=RiK7vSN5OygE0XDsEBLXu10EAoUqotHxYaTwM4aoNpk9yL8J8mcfnZeGXiJTN6qgzP
 GL5ZzMKPqJD71BkVD/Obz4zWsJhauRdEKUbctBZFuWoZghG85l6uIpK67BHHEWNngAUS
 PpFHoeuxiU2kqae119eqqBAWf5XDt4nn4Zsdy2xjwLw67sfpKfxczTalPYUkT5awP6UU
 0OcyuDnINBv6SfijK8Vxw7OTRcX4tvsolVLAeUaVOvyXubXx14WfjR8b+ZHh7g0c0Hwf
 IJU3Gv/D/I4K0//echA9UbWai2yY5NO0AdUMC044c/cMn5nBF/L931YyjhlwfDWYZQ9A
 6xFg==
X-Gm-Message-State: AOAM531yPf3brt+h5PSCLjiyT1pG47ii6KhKXZilIFv2XUZYYny0hZig
 1r8Vsxojxfw5BAk5PThjiAA=
X-Google-Smtp-Source: ABdhPJzPuKkgQN9PSa3H/rALa3DgRRRH2bIq+c4kfXGelizF/bHWQsLE3Injws6j1LhG4T4/8f+ZmA==
X-Received: by 2002:a92:da51:: with SMTP id p17mr25985989ilq.44.1593108826972; 
 Thu, 25 Jun 2020 11:13:46 -0700 (PDT)
Received: from majic.sklembedded.com (c-73-202-231-77.hsd1.ca.comcast.net.
 [73.202.231.77])
 by smtp.googlemail.com with ESMTPSA id f2sm7420163ioc.52.2020.06.25.11.13.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jun 2020 11:13:46 -0700 (PDT)
From: Steve Longerbeam <slongerbeam@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v2 3/3] gpu: ipu-v3: image-convert: Wait for all EOFs before
 completing a tile
Date: Thu, 25 Jun 2020 11:13:37 -0700
Message-Id: <20200625181337.11729-1-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200617224038.17889-3-slongerbeam@gmail.com>
References: <20200617224038.17889-3-slongerbeam@gmail.com>
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
Cc: dri-devel@lists.freedesktop.org, Steve Longerbeam <slongerbeam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use a bit-mask of EOF irqs to determine when all required idmac
channel EOFs have been received for a tile conversion, and only do
tile completion processing after all EOFs have been received. Otherwise
it was found that a conversion would stall after the completion of a
tile and the start of the next tile, because the input/read idmac
channel had not completed and entered idle state, thus locking up the
channel when attempting to re-start it for the next tile.

Fixes: 0537db801bb01 ("gpu: ipu-v3: image-convert: reconfigure IC per tile")
Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
---
Changes in v2:
- need to clear eof_mask at completion of every tile, not just in
  convert_start().
---
 drivers/gpu/ipu-v3/ipu-image-convert.c | 109 +++++++++++++++++++------
 1 file changed, 82 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/ipu-v3/ipu-image-convert.c b/drivers/gpu/ipu-v3/ipu-image-convert.c
index f8b031ded3cf..aa1d4b6d278f 100644
--- a/drivers/gpu/ipu-v3/ipu-image-convert.c
+++ b/drivers/gpu/ipu-v3/ipu-image-convert.c
@@ -137,6 +137,17 @@ struct ipu_image_convert_ctx;
 struct ipu_image_convert_chan;
 struct ipu_image_convert_priv;
 
+enum eof_irq_mask {
+	EOF_IRQ_IN      = BIT(0),
+	EOF_IRQ_ROT_IN  = BIT(1),
+	EOF_IRQ_OUT     = BIT(2),
+	EOF_IRQ_ROT_OUT = BIT(3),
+};
+
+#define EOF_IRQ_COMPLETE (EOF_IRQ_IN | EOF_IRQ_OUT)
+#define EOF_IRQ_ROT_COMPLETE (EOF_IRQ_IN | EOF_IRQ_OUT |	\
+			      EOF_IRQ_ROT_IN | EOF_IRQ_ROT_OUT)
+
 struct ipu_image_convert_ctx {
 	struct ipu_image_convert_chan *chan;
 
@@ -173,6 +184,9 @@ struct ipu_image_convert_ctx {
 	/* where to place converted tile in dest image */
 	unsigned int out_tile_map[MAX_TILES];
 
+	/* mask of completed EOF irqs at every tile conversion */
+	enum eof_irq_mask eof_mask;
+
 	struct list_head list;
 };
 
@@ -189,6 +203,8 @@ struct ipu_image_convert_chan {
 	struct ipuv3_channel *rotation_out_chan;
 
 	/* the IPU end-of-frame irqs */
+	int in_eof_irq;
+	int rot_in_eof_irq;
 	int out_eof_irq;
 	int rot_out_eof_irq;
 
@@ -1380,6 +1396,9 @@ static int convert_start(struct ipu_image_convert_run *run, unsigned int tile)
 	dev_dbg(priv->ipu->dev, "%s: task %u: starting ctx %p run %p tile %u -> %u\n",
 		__func__, chan->ic_task, ctx, run, tile, dst_tile);
 
+	/* clear EOF irq mask */
+	ctx->eof_mask = 0;
+
 	if (ipu_rot_mode_is_irt(ctx->rot_mode)) {
 		/* swap width/height for resizer */
 		dest_width = d_image->tile[dst_tile].height;
@@ -1615,7 +1634,7 @@ static bool ic_settings_changed(struct ipu_image_convert_ctx *ctx)
 }
 
 /* hold irqlock when calling */
-static irqreturn_t do_irq(struct ipu_image_convert_run *run)
+static irqreturn_t do_tile_complete(struct ipu_image_convert_run *run)
 {
 	struct ipu_image_convert_ctx *ctx = run->ctx;
 	struct ipu_image_convert_chan *chan = ctx->chan;
@@ -1700,6 +1719,7 @@ static irqreturn_t do_irq(struct ipu_image_convert_run *run)
 		ctx->cur_buf_num ^= 1;
 	}
 
+	ctx->eof_mask = 0; /* clear EOF irq mask for next tile */
 	ctx->next_tile++;
 	return IRQ_HANDLED;
 done:
@@ -1715,8 +1735,9 @@ static irqreturn_t eof_irq(int irq, void *data)
 	struct ipu_image_convert_priv *priv = chan->priv;
 	struct ipu_image_convert_ctx *ctx;
 	struct ipu_image_convert_run *run;
+	irqreturn_t ret = IRQ_HANDLED;
+	bool tile_complete = false;
 	unsigned long flags;
-	irqreturn_t ret;
 
 	spin_lock_irqsave(&chan->irqlock, flags);
 
@@ -1729,27 +1750,33 @@ static irqreturn_t eof_irq(int irq, void *data)
 
 	ctx = run->ctx;
 
-	if (irq == chan->out_eof_irq) {
-		if (ipu_rot_mode_is_irt(ctx->rot_mode)) {
-			/* this is a rotation op, just ignore */
-			ret = IRQ_HANDLED;
-			goto out;
-		}
-	} else if (irq == chan->rot_out_eof_irq) {
+	if (irq == chan->in_eof_irq) {
+		ctx->eof_mask |= EOF_IRQ_IN;
+	} else if (irq == chan->out_eof_irq) {
+		ctx->eof_mask |= EOF_IRQ_OUT;
+	} else if (irq == chan->rot_in_eof_irq ||
+		   irq == chan->rot_out_eof_irq) {
 		if (!ipu_rot_mode_is_irt(ctx->rot_mode)) {
 			/* this was NOT a rotation op, shouldn't happen */
 			dev_err(priv->ipu->dev,
 				"Unexpected rotation interrupt\n");
-			ret = IRQ_HANDLED;
 			goto out;
 		}
+		ctx->eof_mask |= (irq == chan->rot_in_eof_irq) ?
+			EOF_IRQ_ROT_IN : EOF_IRQ_ROT_OUT;
 	} else {
 		dev_err(priv->ipu->dev, "Received unknown irq %d\n", irq);
 		ret = IRQ_NONE;
 		goto out;
 	}
 
-	ret = do_irq(run);
+	if (ipu_rot_mode_is_irt(ctx->rot_mode))
+		tile_complete =	(ctx->eof_mask == EOF_IRQ_ROT_COMPLETE);
+	else
+		tile_complete = (ctx->eof_mask == EOF_IRQ_COMPLETE);
+
+	if (tile_complete)
+		ret = do_tile_complete(run);
 out:
 	spin_unlock_irqrestore(&chan->irqlock, flags);
 	return ret;
@@ -1783,6 +1810,10 @@ static void force_abort(struct ipu_image_convert_ctx *ctx)
 
 static void release_ipu_resources(struct ipu_image_convert_chan *chan)
 {
+	if (chan->in_eof_irq >= 0)
+		free_irq(chan->in_eof_irq, chan);
+	if (chan->rot_in_eof_irq >= 0)
+		free_irq(chan->rot_in_eof_irq, chan);
 	if (chan->out_eof_irq >= 0)
 		free_irq(chan->out_eof_irq, chan);
 	if (chan->rot_out_eof_irq >= 0)
@@ -1801,7 +1832,27 @@ static void release_ipu_resources(struct ipu_image_convert_chan *chan)
 
 	chan->in_chan = chan->out_chan = chan->rotation_in_chan =
 		chan->rotation_out_chan = NULL;
-	chan->out_eof_irq = chan->rot_out_eof_irq = -1;
+	chan->in_eof_irq = -1;
+	chan->rot_in_eof_irq = -1;
+	chan->out_eof_irq = -1;
+	chan->rot_out_eof_irq = -1;
+}
+
+static int get_eof_irq(struct ipu_image_convert_chan *chan,
+		       struct ipuv3_channel *channel)
+{
+	struct ipu_image_convert_priv *priv = chan->priv;
+	int ret, irq;
+
+	irq = ipu_idmac_channel_irq(priv->ipu, channel, IPU_IRQ_EOF);
+
+	ret = request_threaded_irq(irq, eof_irq, do_bh, 0, "ipu-ic", chan);
+	if (ret < 0) {
+		dev_err(priv->ipu->dev, "could not acquire irq %d\n", irq);
+		return ret;
+	}
+
+	return irq;
 }
 
 static int get_ipu_resources(struct ipu_image_convert_chan *chan)
@@ -1837,31 +1888,33 @@ static int get_ipu_resources(struct ipu_image_convert_chan *chan)
 	}
 
 	/* acquire the EOF interrupts */
-	chan->out_eof_irq = ipu_idmac_channel_irq(priv->ipu,
-						  chan->out_chan,
-						  IPU_IRQ_EOF);
+	ret = get_eof_irq(chan, chan->in_chan);
+	if (ret < 0) {
+		chan->in_eof_irq = -1;
+		goto err;
+	}
+	chan->in_eof_irq = ret;
 
-	ret = request_threaded_irq(chan->out_eof_irq, eof_irq, do_bh,
-				   0, "ipu-ic", chan);
+	ret = get_eof_irq(chan, chan->rotation_in_chan);
 	if (ret < 0) {
-		dev_err(priv->ipu->dev, "could not acquire irq %d\n",
-			 chan->out_eof_irq);
-		chan->out_eof_irq = -1;
+		chan->rot_in_eof_irq = -1;
 		goto err;
 	}
+	chan->rot_in_eof_irq = ret;
 
-	chan->rot_out_eof_irq = ipu_idmac_channel_irq(priv->ipu,
-						     chan->rotation_out_chan,
-						     IPU_IRQ_EOF);
+	ret = get_eof_irq(chan, chan->out_chan);
+	if (ret < 0) {
+		chan->out_eof_irq = -1;
+		goto err;
+	}
+	chan->out_eof_irq = ret;
 
-	ret = request_threaded_irq(chan->rot_out_eof_irq, eof_irq, do_bh,
-				   0, "ipu-ic", chan);
+	ret = get_eof_irq(chan, chan->rotation_out_chan);
 	if (ret < 0) {
-		dev_err(priv->ipu->dev, "could not acquire irq %d\n",
-			chan->rot_out_eof_irq);
 		chan->rot_out_eof_irq = -1;
 		goto err;
 	}
+	chan->rot_out_eof_irq = ret;
 
 	return 0;
 err:
@@ -2440,6 +2493,8 @@ int ipu_image_convert_init(struct ipu_soc *ipu, struct device *dev)
 		chan->ic_task = i;
 		chan->priv = priv;
 		chan->dma_ch = &image_convert_dma_chan[i];
+		chan->in_eof_irq = -1;
+		chan->rot_in_eof_irq = -1;
 		chan->out_eof_irq = -1;
 		chan->rot_out_eof_irq = -1;
 
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
