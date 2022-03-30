Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 171E84ECCF6
	for <lists+dri-devel@lfdr.de>; Wed, 30 Mar 2022 21:09:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2055710EE8A;
	Wed, 30 Mar 2022 19:09:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02D5510EE8D
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Mar 2022 19:09:08 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3C478B81E2A;
 Wed, 30 Mar 2022 19:09:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2419DC34115;
 Wed, 30 Mar 2022 19:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648667345;
 bh=aBj7vr8bHTtNxb7+1bJTixHNBVug0LavLYi8m0fmKZg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=IXO513sxXiSOPY3Ln6Kuo2udw34ocaGJuKoiFX6Voh61t/6oF9UpY+7GB/7wNOApT
 x8ElOEeHmQ4jJSJ8b/Oy2Thxnx3lNN8sk/gOo3UVdSsUgnbNnmPffv+bzkIR0lMUs7
 ILjcq6cHYwB0GmYTorb+YIqOq+FBNXVVFOm4uTeL/cauWffMJCKX5UhI3tOb5rdLNC
 /dzpzt7CWMgrYCrD/h+qS7WgdmPlk8qForPL1XC8OzZnkkoGqKsMGBlzn5Lsmjxyt/
 5jM8HEp14miHZi0M+utd/Tw7FBMFdatRoFpkUUGHriifeLQNg7aXxo057s9iwUrY8F
 HXzhcyGjFaizg==
Received: by wens.tw (Postfix, from userid 1000)
 id 62BD75FD20; Thu, 31 Mar 2022 03:09:02 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Javier Martinez Canillas <javierm@redhat.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 4/4] drm: ssd130x: Add support for SINO WEALTH SH1106
Date: Thu, 31 Mar 2022 03:08:46 +0800
Message-Id: <20220330190846.13997-5-wens@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220330190846.13997-1-wens@kernel.org>
References: <20220330190846.13997-1-wens@kernel.org>
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
Cc: devicetree@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chen-Yu Tsai <wens@csie.org>

The SINO WEALTH SH1106 is an OLED display driver that is somewhat
compatible with the SSD1306. It supports a slightly wider display,
at 132 instead of 128 pixels. The basic commands are the same, but
the SH1106 doesn't support the horizontal or vertical address modes.

Add support for this display driver. The default values for some of
the hardware settings are taken from the datasheet.

Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 drivers/gpu/drm/solomon/ssd130x-i2c.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/solomon/ssd130x-i2c.c b/drivers/gpu/drm/solomon/ssd130x-i2c.c
index 3126aeda4ced..d099b241dd3f 100644
--- a/drivers/gpu/drm/solomon/ssd130x-i2c.c
+++ b/drivers/gpu/drm/solomon/ssd130x-i2c.c
@@ -53,6 +53,13 @@ static void ssd130x_i2c_shutdown(struct i2c_client *client)
 	ssd130x_shutdown(ssd130x);
 }
 
+static struct ssd130x_deviceinfo ssd130x_sh1106_deviceinfo = {
+	.default_vcomh = 0x40,
+	.default_dclk_div = 1,
+	.default_dclk_frq = 5,
+	.page_mode_only = 1,
+};
+
 static struct ssd130x_deviceinfo ssd130x_ssd1305_deviceinfo = {
 	.default_vcomh = 0x34,
 	.default_dclk_div = 1,
@@ -80,6 +87,10 @@ static struct ssd130x_deviceinfo ssd130x_ssd1309_deviceinfo = {
 };
 
 static const struct of_device_id ssd130x_of_match[] = {
+	{
+		.compatible = "sinowealth,sh1106-i2c",
+		.data = &ssd130x_sh1106_deviceinfo,
+	},
 	{
 		.compatible = "solomon,ssd1305fb-i2c",
 		.data = &ssd130x_ssd1305_deviceinfo,
-- 
2.34.1

