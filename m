Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDC8F1F4A73
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jun 2020 02:51:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E75C6E35D;
	Wed, 10 Jun 2020 00:51:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com
 [IPv6:2607:f8b0:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89A236E35D
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jun 2020 00:51:20 +0000 (UTC)
Received: by mail-il1-x141.google.com with SMTP id p5so303138ile.6
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jun 2020 17:51:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=b+0wEPqP1gRD//dOMrPEa9eijfAxkaREz8rLoK9osa4=;
 b=KtWrrlapGaEE2Mbv/L8wwTjimcRQdqVuOjtZ8z98GDIl5PuuQKPKubWu+ghsIm3HDf
 sd7L8r/EAC62rv94MP36eandSPF2aLXLZbDTLIBSuVLbGzo/DyY1Q08iCwyoO1IMyYCa
 mOMtXCQkuffjovKeqWhFVPMNtTjoo0guyh7DgisqfZ9n0iY33dsllItEMXMnrpruLj7q
 2L7034UvMBZyozoNph3bFUylrTe4/Y4u7KFRYhxssQFDCWg19UIha+8DXIwHi6p9ePFE
 u/2qNATB2x2i1dX4vIn9fWCsAPXX3Yq8SQdSMVt41gLjITPtJY9i+n8XWmgOKitQHpan
 RUPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=b+0wEPqP1gRD//dOMrPEa9eijfAxkaREz8rLoK9osa4=;
 b=HOVbpbbd5DTGWMQvfp+CTNrxlkU8XBaNXbo+O9BqRsaH+b/fpRTmJVCWEY9PBw9+ii
 nrPylvbVF4kXFT/0UdxnRWpTw3ow6LAV1ea7IJKllFLrf/6HD+GpDb1EKQBvVUDiKw3h
 ImXCaj5GhGvkKHoxoTkZ8Nutka2heFWpnA1WDsT/GOvX1FiRLwyZrKcWgiZuUrW85nHP
 RD149WhN6xyiGq4e8pR8SXGFxHF4gisG6+WujwbSylJ7Un2cCKkaL81ccSJNig09swpR
 6pgxirGTeMq7T7Aha8h7XtYwXKYFPXRK5sjW1l8otcYQATy6EV1yLy5E2lYNtO7R8Ern
 QIxw==
X-Gm-Message-State: AOAM533kQ4lEngJbMvoax57xS7QpebyXplduPmKb3xjDeebx7b88RU3j
 sL1gtrRhk71lM24wVYMGOTU=
X-Google-Smtp-Source: ABdhPJxLlxYt0huloXisPIzKbPdi8OHNwnCvIvwsBwEm15uOqGBgRd+Cm9jARahd10agkTLsYMUZAw==
X-Received: by 2002:a92:1b97:: with SMTP id f23mr651194ill.217.1591750279757; 
 Tue, 09 Jun 2020 17:51:19 -0700 (PDT)
Received: from majic.sklembedded.com (c-73-202-231-77.hsd1.ca.comcast.net.
 [73.202.231.77])
 by smtp.googlemail.com with ESMTPSA id z9sm9982875ilq.22.2020.06.09.17.51.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2020 17:51:18 -0700 (PDT)
From: Steve Longerbeam <slongerbeam@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH] gpu: ipu-v3: image-convert: Wait for channels before disabling
Date: Tue,  9 Jun 2020 17:51:10 -0700
Message-Id: <20200610005110.18096-1-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
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

Call ipu_idmac_wait_busy() on each idmac channel to busy wait for the
channel to be idle before disabling. Otherwise it was found that a
conversion would stall after the completion of a tile and the start
of the next tile.

Fixes: 0537db801bb01 ("gpu: ipu-v3: image-convert: reconfigure IC per tile")
Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
---
 drivers/gpu/ipu-v3/ipu-image-convert.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/ipu-v3/ipu-image-convert.c b/drivers/gpu/ipu-v3/ipu-image-convert.c
index eeca50d9a1ee..f0938015d2fd 100644
--- a/drivers/gpu/ipu-v3/ipu-image-convert.c
+++ b/drivers/gpu/ipu-v3/ipu-image-convert.c
@@ -1251,6 +1251,19 @@ static int get_run_count(struct ipu_image_convert_ctx *ctx,
 	return count;
 }
 
+static void stop_channel(struct ipu_image_convert_chan *chan,
+			 struct ipuv3_channel *channel)
+{
+	struct ipu_image_convert_priv *priv = chan->priv;
+	int ret;
+
+	ret = ipu_idmac_wait_busy(channel, 1);
+	if (ret == -ETIMEDOUT)
+		dev_warn(priv->ipu->dev, "IDMAC timeout\n");
+
+	ipu_idmac_disable_channel(channel);
+}
+
 static void convert_stop(struct ipu_image_convert_run *run)
 {
 	struct ipu_image_convert_ctx *ctx = run->ctx;
@@ -1262,12 +1275,12 @@ static void convert_stop(struct ipu_image_convert_run *run)
 
 	/* disable IC tasks and the channels */
 	ipu_ic_task_disable(chan->ic);
-	ipu_idmac_disable_channel(chan->in_chan);
-	ipu_idmac_disable_channel(chan->out_chan);
+	stop_channel(chan, chan->in_chan);
+	stop_channel(chan, chan->out_chan);
 
 	if (ipu_rot_mode_is_irt(ctx->rot_mode)) {
-		ipu_idmac_disable_channel(chan->rotation_in_chan);
-		ipu_idmac_disable_channel(chan->rotation_out_chan);
+		stop_channel(chan, chan->rotation_in_chan);
+		stop_channel(chan, chan->rotation_out_chan);
 		ipu_idmac_unlink(chan->out_chan, chan->rotation_in_chan);
 	}
 
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
