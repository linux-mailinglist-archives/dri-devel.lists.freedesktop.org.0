Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4449B6D7E15
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 15:51:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3827610E12E;
	Wed,  5 Apr 2023 13:51:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4549010E12E
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Apr 2023 13:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1680702691; x=1712238691;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9g+20hEdWS7HCG+Awvql610ZC783UwEEnSLXUlQpqVY=;
 b=nsrLNK9xY6BSo7KECk+08n/etMN3OAM34/QC0WvRTzDKxmP5NQoma9a3
 bNAIsxXfsSWX7e+NItApGHxuRznVhzrp53k4beEi4IA2Rix9NUnfPHSFM
 e6yz8evGzN7FnUcF21GY/MammixYM1t8mw4jbW2yqM9uIpnVE+wRqaw/x
 AQk9cxzcT0RonIOr5p/xepeWiLyf+jy0pdMGYjCDh/+mxuF88O+oT41D5
 w1cc8A39XAXnyvulIn6PP5IUMDsrxkZihB+dG5tnkkmDpljvn1peJpbFy
 Elz8+23UNVgfz3SyIJzCLYH1+jRY46+3ce62FZY2NWnBt1id4rPIGeYR5 Q==;
X-IronPort-AV: E=Sophos;i="5.98,319,1673910000"; d="scan'208";a="30168296"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 05 Apr 2023 15:51:28 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Wed, 05 Apr 2023 15:51:28 +0200
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Wed, 05 Apr 2023 15:51:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1680702688; x=1712238688;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9g+20hEdWS7HCG+Awvql610ZC783UwEEnSLXUlQpqVY=;
 b=Jv4ZopJ4dw86o96wwYwJOMBIGar01+gLbSAOiQIFDczXwAS15M2sMG1r
 GJtejPSqWWovfo01rNAHpxLdq+HVuAvy1hUwWik3BANxpbmKWxIBx033h
 e1kCm78aWZKR0Jn6atqcljlgtuUZEn5bTKR7Fr+1pFec4hsLJeVqiimg8
 7y/8x4ZrI5iSYDtHAluaOKf6R1QUF6ZixUT6tkThXbXe9upkXDRRkWk/M
 ScArDCiTp9PVwZGEU4XNIrxmykuW/3BhOoehJ+kdGij6t7ACQPWwemHOD
 lnqr925Ux1KaZubc02KueHkHr83kM3gZ0gLtQuPmAc2wMWSC183XDD3NJ A==;
X-IronPort-AV: E=Sophos;i="5.98,319,1673910000"; d="scan'208";a="30168295"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 05 Apr 2023 15:51:28 +0200
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 47092280056;
 Wed,  5 Apr 2023 15:51:28 +0200 (CEST)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Douglas Anderson <dianders@chromium.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 1/1] drm/bridge: ti-sn65dsi86: Allow GPIO operations to sleep
Date: Wed,  5 Apr 2023 15:51:27 +0200
Message-Id: <20230405135127.769665-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
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
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There is no need to require non-sleeping GPIO access. Silence the
WARN_ON() if GPIO is using e.g. I2C expanders.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
This is the TI SN65DSI86 equivalent to 805245071240 ("drm/bridge: 
ti-sn65dsi83: Allow GPIO operations to sleep")

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 1e26fa63845a..7a748785c545 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -363,7 +363,7 @@ static int __maybe_unused ti_sn65dsi86_resume(struct device *dev)
 	/* td2: min 100 us after regulators before enabling the GPIO */
 	usleep_range(100, 110);
 
-	gpiod_set_value(pdata->enable_gpio, 1);
+	gpiod_set_value_cansleep(pdata->enable_gpio, 1);
 
 	/*
 	 * If we have a reference clock we can enable communication w/ the
@@ -386,7 +386,7 @@ static int __maybe_unused ti_sn65dsi86_suspend(struct device *dev)
 	if (pdata->refclk)
 		ti_sn65dsi86_disable_comms(pdata);
 
-	gpiod_set_value(pdata->enable_gpio, 0);
+	gpiod_set_value_cansleep(pdata->enable_gpio, 0);
 
 	ret = regulator_bulk_disable(SN_REGULATOR_SUPPLY_NUM, pdata->supplies);
 	if (ret)
-- 
2.34.1

