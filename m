Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47647119603
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 22:25:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBE606E96C;
	Tue, 10 Dec 2019 21:25:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D1026E962
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 21:25:17 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 94DDD20836;
 Tue, 10 Dec 2019 21:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1576013117;
 bh=LHlXup6UK4obdIwh8GDiEqMZRzr9DxRSOQoyLqXkURQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=d+EsjnCEBSg784M4z5NhMBIFrQkdJz/31J2uFo5gMGa81adDuO9OcfszEZcy/jHS8
 qNGNRE7rcx/io1FR52CmrqOh7aG/zJeKff8utbU2h4Y19Kvyp87FjDLvAVTQ7gtklt
 TiFbMwlUUjQxfvbWVU56iZ59k/RB/SLySqhcSAnA=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.3 004/292] drm/panel: Add missing drm_panel_init()
 in panel drivers
Date: Tue, 10 Dec 2019 16:20:23 -0500
Message-Id: <20191210212511.11392-4-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191210212511.11392-1-sashal@kernel.org>
References: <20191210212511.11392-1-sashal@kernel.org>
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
index b5b14aa059ea7..2aa89eaecf6ff 100644
--- a/drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c
+++ b/drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c
@@ -426,6 +426,7 @@ static int rpi_touchscreen_probe(struct i2c_client *i2c,
 		return PTR_ERR(ts->dsi);
 	}
 
+	drm_panel_init(&ts->base);
 	ts->base.dev = dev;
 	ts->base.funcs = &rpi_touchscreen_funcs;
 
diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
index 5e3e92ea9ea69..3b2612ae931e8 100644
--- a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
+++ b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
@@ -381,6 +381,7 @@ static int st7789v_probe(struct spi_device *spi)
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
