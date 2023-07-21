Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD7F375CAC5
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jul 2023 16:56:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2889710E690;
	Fri, 21 Jul 2023 14:56:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ADC410E690
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jul 2023 14:56:40 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-307d58b3efbso1571132f8f.0
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jul 2023 07:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689951399; x=1690556199;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=In8T5OsGtRpxMtj85EqpIN0ZR1mnlPUN+P5ckad+btA=;
 b=eKyfGFRUlNMWchE9XXYzqjbwM5uVsWWNUMm828Tvyd1V1mYv+1G2emJePZZDvMgrUD
 y8K8S0XaXLLXCGJ5M49Za8Q876uTyDivqR5ZTeXs3il3jc2pZw0CfpbW/idiP5crMkzB
 lajAelAx67AhHM0wqTgv1lcIngYlg5qHgpjhv98QyzUEICGp9fR+Tijst08Rpmhdgys6
 xpXrsuVtsp9wNH8iTSqXDorcciPLoXW3UVSv9qNYtcAMUzWz++U/yvpyfhsErni8zP7S
 /sj0deswOJp4zr91Pd3EOfzrIHQwgLp7qlmpa158ALT3nJTMkWiHIac1s3EtXc0qJHIn
 i3TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689951399; x=1690556199;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=In8T5OsGtRpxMtj85EqpIN0ZR1mnlPUN+P5ckad+btA=;
 b=CsXL0bRruDhirffiyqCVIN6NZFW81Cpi/SGZHkHuQiFyGz76qAOW8B0bO1wWIPx9p0
 Gcsa1lVhdZcsY1AzAnI5vKyvsd5bYjnfjF2gN7FBKcojEUzzRirT7nqu87lyIj/SmFYD
 jcj5UWGO4SuyZ/eKne3E+i1+O7eOkPkTUdPhAwPG2aDWpBcE1mGnrOsQn5hhs0xCqbaK
 HTz74nq8ettn92wSkBEssjTAGtTsYYs91EKDhiTOh/2vFrRZ5rPJtVf0Y0uu9G9C+l8Q
 5afBycGlxsOQw4FzmdIBSu1o7WZq2wPc5ufouwGimxc6ahU7bAxeHS3gUa6IWaMc4ioV
 3rcg==
X-Gm-Message-State: ABy/qLbahZ8KF42bpdZefOF7pqVVCSItX7zoIBMlHNxfANH+56ZzxE5f
 Vjh1ya/XoAYdzj4UofA8/cueGQ==
X-Google-Smtp-Source: APBJJlHEfwVc5QNwet+IfWzXMoxUEDrd837ZTLEG4fHbusmtYBoz0tijlh8MpDp7LrFCWhYG7LN21A==
X-Received: by 2002:a05:6000:10d1:b0:314:38e4:259f with SMTP id
 b17-20020a05600010d100b0031438e4259fmr1666827wrx.37.1689951398706; 
 Fri, 21 Jul 2023 07:56:38 -0700 (PDT)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 m9-20020a5d56c9000000b00313e2abfb8dsm4428241wrw.92.2023.07.21.07.56.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jul 2023 07:56:36 -0700 (PDT)
Date: Fri, 21 Jul 2023 17:56:17 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Inki Dae <inki.dae@samsung.com>
Subject: [PATCH] drm: bridge: samsung-dsim: Clean up a call to request_irq()
Message-ID: <1c921fe0-2758-44dd-85f3-2ef8eb6583bb@moroto.mountain>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org,
 kernel-janitors@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is calling request_threaded_irq() but the thread parameter is NULL
so it's actually not a threaded irq.  Which is a bit misleading.  Call
request_irq() instead.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index 9b7a00bafeaa..9d81dbbc6680 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -1637,8 +1637,8 @@ static int samsung_dsim_register_te_irq(struct samsung_dsim *dsi, struct device
 
 	te_gpio_irq = gpiod_to_irq(dsi->te_gpio);
 
-	ret = request_threaded_irq(te_gpio_irq, samsung_dsim_te_irq_handler, NULL,
-				   IRQF_TRIGGER_RISING | IRQF_NO_AUTOEN, "TE", dsi);
+	ret = request_irq(te_gpio_irq, samsung_dsim_te_irq_handler,
+			  IRQF_TRIGGER_RISING | IRQF_NO_AUTOEN, "TE", dsi);
 	if (ret) {
 		dev_err(dsi->dev, "request interrupt failed with %d\n", ret);
 		gpiod_put(dsi->te_gpio);
-- 
2.39.2

