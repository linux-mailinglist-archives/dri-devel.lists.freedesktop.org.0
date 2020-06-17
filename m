Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D5A61FD914
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jun 2020 00:40:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6015C6EA09;
	Wed, 17 Jun 2020 22:40:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50B5A6E8E4
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jun 2020 22:40:47 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id l63so1963535pge.12
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jun 2020 15:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=SoPMTXvqN+c9eLGuj7ute01VMh5hNI9a49zXdLhCV9s=;
 b=Pjvb1KC/wgVYFAixCZ6ZJtZSkgpiF+/xehBsICyTk7NBUv0o/B3h2IsNeW6TXqIGGq
 qQnR60qnzrEdLRF34zszX1iNTBN8XGs9yEtLoyvaiZLTJKWEM/YvfsThlfsPpw8le8o1
 zW2i5PI3mbBzJNzFvOEHH2/e+k1L5ZzFsJG+Tr0Wc/jrhNkkeg4yYHZ39LiwCUhRZJWX
 Y9fPWCWebJ4ki3mSWPWVCPrSHc0nEuvog7Ax6Gd7xuDfMD2F76A8c7oYL9llcJXBwM+b
 HQ2eAE/VRDgMRdbJS+sb4ZZDMMz/UpzDNXVzkgNwymf03OS5NqHCoqzoZoq9dWpFICBV
 2Xgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=SoPMTXvqN+c9eLGuj7ute01VMh5hNI9a49zXdLhCV9s=;
 b=htIsrc30G7nhny1xyUIZiah4K4+t5eARHh2aADA/xW4kn0mn2iznDo4lIjRf09d0na
 znwV0o67DLOB9lZroT3b0RG5BN8uqq7JAmXvoqYaq8psBG1jc0g8jwc/gzqQjvbCSANl
 Lwfp5snZ86z1aEPquaI+wY902w2wmUzh91HP3Q4JzHVLLqFxxBKs4jFPG00UHgHrV1VF
 BYAnb7wmT8/HgNnfAta7vrvNxTIcn/31lPLnVrd8N1AkC/cMw1t/PPBVcalc/vHrqKEj
 z3A/8qbCBb8nY5QjTgR8hzTzYekMH0Teu9BZVNCHv3XWAh9HGgZmXEm3Zl9CQoZatLFD
 0Nnw==
X-Gm-Message-State: AOAM532s+1N9Qy99pNh45tAyO30/J61WrkDS92ylt7tUHZ/8GmlybJy+
 dj68hNKA7jpeq1yNzxfNmco=
X-Google-Smtp-Source: ABdhPJyNogq5pyroi5y5jhPEauxrgHQen8TBiBXdjZ9tsUAkPhogEPL+HvS9ww2piDW5O1QUsUnIdg==
X-Received: by 2002:a62:7f44:: with SMTP id a65mr916441pfd.258.1592433646853; 
 Wed, 17 Jun 2020 15:40:46 -0700 (PDT)
Received: from majic.sklembedded.com (c-73-202-231-77.hsd1.ca.comcast.net.
 [73.202.231.77])
 by smtp.googlemail.com with ESMTPSA id x20sm486431pjr.44.2020.06.17.15.40.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2020 15:40:46 -0700 (PDT)
From: Steve Longerbeam <slongerbeam@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH 2/3] gpu: ipu-v3: image-convert: Combine rotate/no-rotate irq
 handlers
Date: Wed, 17 Jun 2020 15:40:37 -0700
Message-Id: <20200617224038.17889-2-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200617224038.17889-1-slongerbeam@gmail.com>
References: <20200617224038.17889-1-slongerbeam@gmail.com>
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

Combine the rotate_irq() and norotate_irq() handlers into a single
eof_irq() handler.

Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
---
 drivers/gpu/ipu-v3/ipu-image-convert.c | 58 +++++++++-----------------
 1 file changed, 20 insertions(+), 38 deletions(-)

diff --git a/drivers/gpu/ipu-v3/ipu-image-convert.c b/drivers/gpu/ipu-v3/ipu-image-convert.c
index eeca50d9a1ee..f8b031ded3cf 100644
--- a/drivers/gpu/ipu-v3/ipu-image-convert.c
+++ b/drivers/gpu/ipu-v3/ipu-image-convert.c
@@ -1709,9 +1709,10 @@ static irqreturn_t do_irq(struct ipu_image_convert_run *run)
 	return IRQ_WAKE_THREAD;
 }
 
-static irqreturn_t norotate_irq(int irq, void *data)
+static irqreturn_t eof_irq(int irq, void *data)
 {
 	struct ipu_image_convert_chan *chan = data;
+	struct ipu_image_convert_priv *priv = chan->priv;
 	struct ipu_image_convert_ctx *ctx;
 	struct ipu_image_convert_run *run;
 	unsigned long flags;
@@ -1728,45 +1729,26 @@ static irqreturn_t norotate_irq(int irq, void *data)
 
 	ctx = run->ctx;
 
-	if (ipu_rot_mode_is_irt(ctx->rot_mode)) {
-		/* this is a rotation operation, just ignore */
-		spin_unlock_irqrestore(&chan->irqlock, flags);
-		return IRQ_HANDLED;
-	}
-
-	ret = do_irq(run);
-out:
-	spin_unlock_irqrestore(&chan->irqlock, flags);
-	return ret;
-}
-
-static irqreturn_t rotate_irq(int irq, void *data)
-{
-	struct ipu_image_convert_chan *chan = data;
-	struct ipu_image_convert_priv *priv = chan->priv;
-	struct ipu_image_convert_ctx *ctx;
-	struct ipu_image_convert_run *run;
-	unsigned long flags;
-	irqreturn_t ret;
-
-	spin_lock_irqsave(&chan->irqlock, flags);
-
-	/* get current run and its context */
-	run = chan->current_run;
-	if (!run) {
+	if (irq == chan->out_eof_irq) {
+		if (ipu_rot_mode_is_irt(ctx->rot_mode)) {
+			/* this is a rotation op, just ignore */
+			ret = IRQ_HANDLED;
+			goto out;
+		}
+	} else if (irq == chan->rot_out_eof_irq) {
+		if (!ipu_rot_mode_is_irt(ctx->rot_mode)) {
+			/* this was NOT a rotation op, shouldn't happen */
+			dev_err(priv->ipu->dev,
+				"Unexpected rotation interrupt\n");
+			ret = IRQ_HANDLED;
+			goto out;
+		}
+	} else {
+		dev_err(priv->ipu->dev, "Received unknown irq %d\n", irq);
 		ret = IRQ_NONE;
 		goto out;
 	}
 
-	ctx = run->ctx;
-
-	if (!ipu_rot_mode_is_irt(ctx->rot_mode)) {
-		/* this was NOT a rotation operation, shouldn't happen */
-		dev_err(priv->ipu->dev, "Unexpected rotation interrupt\n");
-		spin_unlock_irqrestore(&chan->irqlock, flags);
-		return IRQ_HANDLED;
-	}
-
 	ret = do_irq(run);
 out:
 	spin_unlock_irqrestore(&chan->irqlock, flags);
@@ -1859,7 +1841,7 @@ static int get_ipu_resources(struct ipu_image_convert_chan *chan)
 						  chan->out_chan,
 						  IPU_IRQ_EOF);
 
-	ret = request_threaded_irq(chan->out_eof_irq, norotate_irq, do_bh,
+	ret = request_threaded_irq(chan->out_eof_irq, eof_irq, do_bh,
 				   0, "ipu-ic", chan);
 	if (ret < 0) {
 		dev_err(priv->ipu->dev, "could not acquire irq %d\n",
@@ -1872,7 +1854,7 @@ static int get_ipu_resources(struct ipu_image_convert_chan *chan)
 						     chan->rotation_out_chan,
 						     IPU_IRQ_EOF);
 
-	ret = request_threaded_irq(chan->rot_out_eof_irq, rotate_irq, do_bh,
+	ret = request_threaded_irq(chan->rot_out_eof_irq, eof_irq, do_bh,
 				   0, "ipu-ic", chan);
 	if (ret < 0) {
 		dev_err(priv->ipu->dev, "could not acquire irq %d\n",
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
