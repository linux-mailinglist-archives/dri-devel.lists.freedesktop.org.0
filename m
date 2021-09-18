Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 11D394106FA
	for <lists+dri-devel@lfdr.de>; Sat, 18 Sep 2021 16:04:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 299D06E0A6;
	Sat, 18 Sep 2021 14:04:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61AF66E0A6
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Sep 2021 14:04:29 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id 140so9501018wma.0
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Sep 2021 07:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DpjBJY1Cq+qltZ9DGxMp7uTj8fnDmJWHBXHXLgVRsKM=;
 b=MzEmML0mVi4/gcsHx77eWSdixfhaarBPpCLf54PiSlHKdzLhiPu/D4hrvEViMczsIM
 roHH4SkoHHvpI2476uD+TCS1h32/naCa5ZOmmaxHjBuFiHn7blck4IlYdnXW1iTUJHvb
 kV0wcfliPMdpEaYt1OSQEPK7VAGS8RiNg4njbsVmVgSMLvzOeJ2DSs/s//PMV6PvKZwf
 191hRhCLLNLwp5TSNkGzNhywPH+DOp2OG6FxgCaE8Nk3W26XmDjHhdKH9YT9h6l3vwJg
 mPN87/rDY+mXnXisWvtYvIC9VJJ5auitMDdInxvSEeAtJsmZFvZPMyfKHxI/gXaVgNZ+
 2peA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DpjBJY1Cq+qltZ9DGxMp7uTj8fnDmJWHBXHXLgVRsKM=;
 b=yu/v/8Q9yuUw9UdJKv3nkVngPABCxbAvlqgi8FRBomzsnc5EB6rZBu/5DxgKMBdNBi
 CZsHwe98c4HsiAZrzRiqsTS/8UNzmwJZ2gYpCMFlOd5sbULW23AJt3XbP5EnWAfs0+g2
 2hVJlceTrshJZFZq3Wx+H5JyJmbyUesfFM7SOzI/MpQaIlNcHH1tU/p0IwdgHf2U9lRa
 7m6RvWBnZO52lp/jRSvbcTQXaT3XS0oPcoZxvhBopwY98FK3hA2PjvA4lPLW+tGqvc++
 UDYOxeQbrhicRLD9mOEyoeiMC2KWqb/jK6+2RdIKUwiyWosb7arMpDwqroY6oHmy68Ug
 oiRw==
X-Gm-Message-State: AOAM532SvbL5VLZhc1ArwmeZWxDlpgBwD79rxFGcs5og800tlTRUmNCR
 PF4tcwN01d4sQAcs8SvmuA==
X-Google-Smtp-Source: ABdhPJzKFMpBEx1H5UuJ71s4zcPrWpC8AQ1cTfNrTu4hwch0/BFCFMtPRqMdq86Y3t9dmHls7ipAsg==
X-Received: by 2002:a7b:cb0c:: with SMTP id u12mr15404422wmj.70.1631973867807; 
 Sat, 18 Sep 2021 07:04:27 -0700 (PDT)
Received: from alex-ThinkPad-E480.. (ip5b434083.dynamic.kabel-deutschland.de.
 [91.67.64.131])
 by smtp.googlemail.com with ESMTPSA id x5sm11764429wmk.32.2021.09.18.07.04.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Sep 2021 07:04:27 -0700 (PDT)
From: Alex Bee <knaerzche@gmail.com>
To: Phong LE <ple@baylibre.com>,
	Neil Armstrong <narmstrong@baylibre.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>, Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Alex Bee <knaerzche@gmail.com>
Subject: [PATCH] drm: bridge: it66121: Fix return value it66121_probe
Date: Sat, 18 Sep 2021 16:04:20 +0200
Message-Id: <20210918140420.231346-1-knaerzche@gmail.com>
X-Mailer: git-send-email 2.30.2
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

Currently it66121_probe returns -EPROBE_DEFER if the there is no remote
endpoint found in the device tree which doesn't seem helpful, since this
is not going to change later and it is never checked if the next bridge
has been initialized yet. It will fail in that case later while doing
drm_bridge_attach for the next bridge in it66121_bridge_attach.

Since the bindings documentation for it66121 bridge driver states
there has to be a remote endpoint defined, its safe to return -EINVAL
in that case.
This additonally adds a check, if the remote endpoint is enabled and
returns -EPROBE_DEFER, if the remote bridge hasn't been initialized
(yet).

Fixes: 988156dc2fc9 ("drm: bridge: add it66121 driver")
Signed-off-by: Alex Bee <knaerzche@gmail.com>
---
 drivers/gpu/drm/bridge/ite-it66121.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it66121.c b/drivers/gpu/drm/bridge/ite-it66121.c
index 2f2a09adb4bc..4e945efc8eb9 100644
--- a/drivers/gpu/drm/bridge/ite-it66121.c
+++ b/drivers/gpu/drm/bridge/ite-it66121.c
@@ -918,11 +918,23 @@ static int it66121_probe(struct i2c_client *client,
 		return -EINVAL;
 
 	ep = of_graph_get_remote_node(dev->of_node, 1, -1);
-	if (!ep)
-		return -EPROBE_DEFER;
+	if (!ep) {
+		dev_err(ctx->dev, "The endpoint is unconnected\n");
+		return -EINVAL;
+	}
+
+	if (!of_device_is_available(ep)) {
+		of_node_put(ep);
+		dev_err(ctx->dev, "The remote device is disabled\n");
+		return -ENODEV;
+	}
 
 	ctx->next_bridge = of_drm_find_bridge(ep);
 	of_node_put(ep);
+	if (!ctx->next_bridge) {
+		dev_dbg(ctx->dev, "Next bridge not found, deferring probe\n");
+		return -EPROBE_DEFER;
+	}
 
 	i2c_set_clientdata(client, ctx);
 	mutex_init(&ctx->lock);
-- 
2.30.2

