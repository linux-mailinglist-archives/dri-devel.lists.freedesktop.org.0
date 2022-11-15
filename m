Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C68F66299DB
	for <lists+dri-devel@lfdr.de>; Tue, 15 Nov 2022 14:16:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67F2F10E3D5;
	Tue, 15 Nov 2022 13:16:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E70310E3D6;
 Tue, 15 Nov 2022 13:16:32 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 h186-20020a1c21c3000000b003cfe48519a6so86492wmh.0; 
 Tue, 15 Nov 2022 05:16:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vauApsbc4UItGo8j86KlPEM6J2rbnw+bhzYXpI7YoWM=;
 b=isLPesBDOxojosEmqtH37oSLsnYQ+jBvATAQRBQCEEE7sNeleCbC0h30hD94qv2TC8
 oiNkbHcykai/3l5VZvnw3WKaReQwa3PSZ5U0oqfyKYBTMcBSkFTDfKxTXoyzwGGGNTf5
 DSp9iZ4p1iRFcas/U1VyWFjwym52luX8ZlyM2LieSuwWGDKVd4pz6cgeq6s9ojuWqJGJ
 1+7dfq0sPaMt27W1d3AGiBGAp1SfylFopjH3/cJoYUdRsbSn42EJ9/lVP+L62EMq7TVu
 d6H/H+587hDQTR+PKhUTl2o6k4qFlaf6Bl0NLt3r8MekefsZFpHo0JNdsO8y8fao7zA3
 lYKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vauApsbc4UItGo8j86KlPEM6J2rbnw+bhzYXpI7YoWM=;
 b=1dqP6UYdyX3oEvJWVQjHXddG86shDsQIDh9lhYoOlGR8rIRvL1DFO/tBvLfdDonY6E
 ok+VW1ZzrEja8yCf/yrTR4Ku3XTIqRkDWwimiSlST+m19J5YI4blKeSXMR66hvgHPDVM
 lXNZc4CDbu/zxikvKfw7La+xuV94uLSC4MOqw8+qk8qspaxHxW+xAfryhJ96keQVJX/b
 ts1xWnmCjuTN1lPNledxBNWOOAIr7PFwTuWqN6o0dJueqeoGmADwBqIc7Is6lmcXiq3P
 2eRNxIpR4aV3m1G/1+tFQNkbQvc80nvK4J8RIOT3bWnpun3pk9k/U6Yfyr3WpCer3Fnb
 Gytg==
X-Gm-Message-State: ANoB5pmZRsI/vp0iTNuoLklI1HYDsux9VZ88hoX+4wfOs+eoctcdRCWY
 p4gE8A7OOFSlSPuNkL4xw6o=
X-Google-Smtp-Source: AA0mqf7caGDVbLS846G0EB5PU7FYFbjEvGpWyiaMSjJd8HX8o7LSMxw/oKEE2kXNf9icY5Gm3sWPQQ==
X-Received: by 2002:a05:600c:212:b0:3cf:cfea:904c with SMTP id
 18-20020a05600c021200b003cfcfea904cmr456990wmi.33.1668518190808; 
 Tue, 15 Nov 2022 05:16:30 -0800 (PST)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 a11-20020a5d570b000000b0022ca921dc67sm12422379wrv.88.2022.11.15.05.16.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Nov 2022 05:16:30 -0800 (PST)
Date: Tue, 15 Nov 2022 16:16:27 +0300
From: Dan Carpenter <error27@gmail.com>
To: Ben Skeggs <bskeggs@redhat.com>
Subject: [PATCH] drm/nouveau/gr/gv100-: unlock on error in gf100_gr_chan_new()
Message-ID: <Y3Jd0JYhjPe4wTXh@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
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
Cc: Karol Herbst <kherbst@redhat.com>, nouveau@lists.freedesktop.org,
 kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Drop the "gr->fecs.mutex" lock before returning on this error path.

Fixes: ca081fff6ecc ("drm/nouveau/gr/gf100-: generate golden context during first object alloc")
Signed-off-by: Dan Carpenter <error27@gmail.com>
---
 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c b/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c
index 5f20079c3660..24bec8f8f83e 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c
@@ -442,6 +442,7 @@ gf100_gr_chan_new(struct nvkm_gr *base, struct nvkm_fifo_chan *fifoch,
 	if (gr->data == NULL) {
 		ret = gf100_grctx_generate(gr, chan, fifoch->inst);
 		if (ret) {
+			mutex_unlock(&gr->fecs.mutex);
 			nvkm_error(&base->engine.subdev, "failed to construct context\n");
 			return ret;
 		}
-- 
2.35.1

