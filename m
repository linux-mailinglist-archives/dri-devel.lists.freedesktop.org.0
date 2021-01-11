Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E7172F0BE5
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jan 2021 05:47:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACAA989B69;
	Mon, 11 Jan 2021 04:46:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6666189B69
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 04:46:56 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id n3so7669411pjm.1
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Jan 2021 20:46:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MTf0t/g0yj3eP5J//Lhcit/5I+gGR9P17fx+loKYd/M=;
 b=dw5F35awsAORBgdcbHHhKYguLZM0wNpcAaLrWiMxPHQ4tVm1cEZ3v74VLibe/czHdO
 pwQ99HhRgX0FOyRYJqxbtB/L1y1De2JhaK4naHS4s5akLQbPjXTSfN1i0DUgeb5Kqx7H
 FzQcDvVn71rvwYON67M6KQ/mqbMTWBdV7dOXg+Wxllpp9qpOs7sln5VPaFRhvyPZlQtD
 M++05rDMjs2LTTBELMhAsq6J7QkN3V8myu3QrIDmNvd9d5wTfuLCPPoElPo/izspnJk/
 jcY5XjteZxRrgdhmGmnTmQPqsPlEsXcSqoED50FZPgqVdlBcI7d/DQE1zXgl8+rA2HOO
 yNvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=MTf0t/g0yj3eP5J//Lhcit/5I+gGR9P17fx+loKYd/M=;
 b=IcG/7VDzb5jtoYkXkKNub2i0Nzl2K6pGGTXafkLyTMsjhGS57zYGvC8wKVVOt+iQAb
 gEX2ng4Y5VknMO/mx+0jqnzejSWToo0LwTZabpeun3fQ/nGirvcueh4HIvVn9I6wnWkk
 AwKfMMtivpnU/KDY9nj+8SSVbWH8gCQVgYll+tbFg/Abe0A5AThnweUisWVa4b/XO7G5
 k7JeWwNRHibsP0EoGGXqajMV1bSEvf5a6MNH6n1Ten6tlmqgrl37FgerkPuxRvWlqWv9
 NrHNx6Ao2EF7kYxJEH+BxQ17IMJm4xkiJw8Az9T0WwKQSWYk4uI49DtREC7hOlIMxR0q
 uhRQ==
X-Gm-Message-State: AOAM532o/K03f/+1XePuvOvVxaJGB+133hgdmPZHMQ8ggBkCAcOi1BEP
 uXfvNlgYr66l3jdSNV96qbU=
X-Google-Smtp-Source: ABdhPJxBCkl3x3enJELsSBqm0G69v1s8CkiXkSccBZx3mbk8e2hUMZjKOIW2OVFq2LoTLGhJe3UxIQ==
X-Received: by 2002:a17:90a:2e84:: with SMTP id
 r4mr15948077pjd.147.1610340415961; 
 Sun, 10 Jan 2021 20:46:55 -0800 (PST)
Received: from localhost.localdomain ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id z6sm17442303pfj.22.2021.01.10.20.46.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Jan 2021 20:46:54 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH 1/2] drm/aspeed: Look up syscon by phandle
Date: Mon, 11 Jan 2021 15:16:37 +1030
Message-Id: <20210111044638.290909-2-joel@jms.id.au>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210111044638.290909-1-joel@jms.id.au>
References: <20210111044638.290909-1-joel@jms.id.au>
MIME-Version: 1.0
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
Cc: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-aspeed@lists.ozlabs.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This scales better to multiple families of SoC. The lookup by compatible
can be removed in a future change.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
index 457ec04950f7..8ada7e944147 100644
--- a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
+++ b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
@@ -103,6 +103,7 @@ static int aspeed_gfx_load(struct drm_device *drm)
 {
 	struct platform_device *pdev = to_platform_device(drm->dev);
 	struct aspeed_gfx *priv = to_aspeed_gfx(drm);
+	struct device_node *np = pdev->dev.of_node;
 	struct resource *res;
 	int ret;
 
@@ -111,10 +112,13 @@ static int aspeed_gfx_load(struct drm_device *drm)
 	if (IS_ERR(priv->base))
 		return PTR_ERR(priv->base);
 
-	priv->scu = syscon_regmap_lookup_by_compatible("aspeed,ast2500-scu");
+	priv->scu = syscon_regmap_lookup_by_phandle(np, "syscon");
 	if (IS_ERR(priv->scu)) {
-		dev_err(&pdev->dev, "failed to find SCU regmap\n");
-		return PTR_ERR(priv->scu);
+		priv->scu = syscon_regmap_lookup_by_compatible("aspeed,aspeed-scu");
+		if (IS_ERR(priv->scu)) {
+			dev_err(&pdev->dev, "failed to find SCU regmap\n");
+			return PTR_ERR(priv->scu);
+		}
 	}
 
 	ret = of_reserved_mem_device_init(drm->dev);
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
