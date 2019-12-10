Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CBFB119749
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 22:32:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 493246E987;
	Tue, 10 Dec 2019 21:32:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 526CE6E984
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 21:32:25 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8F16F2073B;
 Tue, 10 Dec 2019 21:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1576013545;
 bh=kk3/+6go7qsIY4UkBEPYHWNWVbXKrCIUUdRKgsr68gE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RpgpHsWHXOHdKXLbZklQ/tfMhQzM1g1Piufgi3f9ppNxT9J7CKqzWttw377lR7OeX
 UAyVMAlnsZWcumRtKy0stdaWBQXVTjWacXpE2ABfd6rLJbcaNA6vKqFLMXZq8Nv22T
 GHiHLzTNo7FL/OPiqFbaku2tJyAra8oouIXdnBzM=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 002/177] drm/panel: Add missing drm_panel_init()
 in panel drivers
Date: Tue, 10 Dec 2019 16:29:26 -0500
Message-Id: <20191210213221.11921-2-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191210213221.11921-1-sashal@kernel.org>
References: <20191210213221.11921-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

[ Upstream commit 65abbda8ed7ca48c8807d6b04a77431b438fa659 ]

Panels must be initialised with drm_panel_init(). Add the missing
function call in the panel-raspberrypi-touchscreen.c and
panel-sitronix-st7789v.c drivers.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Link: https://patchwork.freedesktop.org/patch/msgid/20190823193245.23876-2-laurent.pinchart@ideasonboard.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c | 1 +
 drivers/gpu/drm/panel/panel-sitronix-st7789v.c        | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c b/drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c
index 9a2cb8aeab3a4..aab6a70ece7f0 100644
--- a/drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c
+++ b/drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c
@@ -427,6 +427,7 @@ static int rpi_touchscreen_probe(struct i2c_client *i2c,
 		return PTR_ERR(ts->dsi);
 	}
 
+	drm_panel_init(&ts->base);
 	ts->base.dev = dev;
 	ts->base.funcs = &rpi_touchscreen_funcs;
 
diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
index 74284e5afc5d9..89fa17877b336 100644
--- a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
+++ b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
@@ -380,6 +380,7 @@ static int st7789v_probe(struct spi_device *spi)
 	spi_set_drvdata(spi, ctx);
 	ctx->spi = spi;
 
+	drm_panel_init(&ctx->panel);
 	ctx->panel.dev = &spi->dev;
 	ctx->panel.funcs = &st7789v_drm_funcs;
 
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
