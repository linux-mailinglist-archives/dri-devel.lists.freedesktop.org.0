Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DD8E6C45A5
	for <lists+dri-devel@lfdr.de>; Wed, 22 Mar 2023 10:07:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94CA210E8C1;
	Wed, 22 Mar 2023 09:07:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED56310E8C1
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Mar 2023 09:07:00 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id l27so7884538wrb.2
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Mar 2023 02:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679476019;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PHk+VaDQI0rTpTXkNcesDIxJIN8W2c9dqQAphpW43vY=;
 b=SMP1g2q2pIyCWahv36Bw48YL7tBMXOtnWMZS2ugqHshM9QS+MqZKFVQvOAXWMllQOj
 NBxcOm+sSFVF5vBQRLg12au7Ps9C/qVFOSl30tdulTDNRXvf6qS2XvtAwu4aSbnRYeJu
 /5HyGKEqRJhmX/553gd59CgUIO0f+vFaCyViNXE4FnwpMoCt1CL9Hvixu2+3evoWTHee
 j7D13vQcbfeHAqjDNucuzx1JZREVozWvpIXadoWp2cPvcYPMy5kpbpk/pwE412tX7Azc
 3/w1CzKV0WB6egOToxTMKP3HT2BzamTuwxe9vAL4B8LwGJ6JqBIyAfhNFwsWf06RaSrV
 Sfuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679476019;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PHk+VaDQI0rTpTXkNcesDIxJIN8W2c9dqQAphpW43vY=;
 b=keSK9ScXXMtXusfwbwWH+OZ9+34R4fmEWktyOwPCgqRSNQd2ehP6vlUPgwp26JfSKr
 1zXONwLDVJTtsvb3XbUDWFmFNTPbYax43/gUN9H+onE/Su5LotFRMRfA6p24vAziZ2cj
 HvgcdQa1ymwsorIcIPO9kw+7SuEZdZ50xVdjjFrnos6U2jDdqsWdhI1+fu/1nNaL5yB3
 tS9lqPIhY1XcGMxZk87UUgzrIP/CuCM+G+myBlbkUti1B3c7joZ0VKpfFCF/S7c9FIV8
 eqsZPPPqAHwMvnOsh2DlaNYCOXWTCs3nPgynXUpPMhctD1nx/iwM0tP5g06t1WGBu0qx
 GuhA==
X-Gm-Message-State: AO0yUKV7GR22oXQPvqOAtVWrv5GQkq6de3Hg3qfc5ItVtAtK58458Onc
 HJs0olvkLQvmoU7ei0q2JqM=
X-Google-Smtp-Source: AK7set9RFIuVDmgZ+l/wooxIdhLoXYmUMIW7OZDZGXrEvCM7uhpoZiSQdSPuLYfC5ZqxoCbug1HdeQ==
X-Received: by 2002:a5d:63c7:0:b0:2d1:6b10:f33c with SMTP id
 c7-20020a5d63c7000000b002d16b10f33cmr4513060wrw.14.1679476019423; 
 Wed, 22 Mar 2023 02:06:59 -0700 (PDT)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 o6-20020adfeac6000000b002c71a32394dsm13386534wrn.64.2023.03.22.02.06.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Mar 2023 02:06:58 -0700 (PDT)
Date: Wed, 22 Mar 2023 12:06:55 +0300
From: Dan Carpenter <error27@gmail.com>
To: Marian Cichy <m.cichy@pengutronix.de>
Subject: [PATCH] drm/imx/lcdc: fix a NULL vs IS_ERR() bug in probe
Message-ID: <d0a1fc55-3ef6-444e-b3ef-fdc937d8d57a@kili.mountain>
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
Cc: Marian Cichy <m.cichy@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, kernel-janitors@vger.kernel.org,
 dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The devm_drm_dev_alloc() function returns error pointers.  It never
returns NULL.  Fix the check.

Fixes: c87e859cdeb5 ("drm/imx/lcdc: Implement DRM driver for imx25")
Signed-off-by: Dan Carpenter <error27@gmail.com>
---
 drivers/gpu/drm/imx/lcdc/imx-lcdc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/imx/lcdc/imx-lcdc.c b/drivers/gpu/drm/imx/lcdc/imx-lcdc.c
index 24bc7b310367..fc1a4f6657c5 100644
--- a/drivers/gpu/drm/imx/lcdc/imx-lcdc.c
+++ b/drivers/gpu/drm/imx/lcdc/imx-lcdc.c
@@ -399,8 +399,8 @@ static int imx_lcdc_probe(struct platform_device *pdev)
 
 	lcdc = devm_drm_dev_alloc(dev, &imx_lcdc_drm_driver,
 				  struct imx_lcdc, drm);
-	if (!lcdc)
-		return -ENOMEM;
+	if (IS_ERR(lcdc))
+		return PTR_ERR(lcdc);
 
 	drm = &lcdc->drm;
 
-- 
2.39.1

