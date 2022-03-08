Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85E7C4D1CC9
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 17:08:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 176DD10E25C;
	Tue,  8 Mar 2022 16:08:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C064810E2D3
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Mar 2022 16:08:11 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3CA226170B;
 Tue,  8 Mar 2022 16:08:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8484AC340EF;
 Tue,  8 Mar 2022 16:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646755690;
 bh=xRcUbaosez9eu3DFVA2FXMe6aBdN7Vix+MKm/XQd+FI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Ogol2p7vJMvLPc+WiHqrwoWVCAa6G3PXJpADWQPrycGCZOdS8nWNULGU9v9Dqb8ol
 D1VmJJYhCbe9QYBDZY88WtXwCjSxF9B7SFLCsqBsmqxZFPvop5OLuyiIkUK95SG8m+
 Txm2QC7lbG64ZywsNlr6lCI84p2Tqck1uoJKXq3auR0lR3ejXrxKFyUvLt4sMR47oI
 qRxsz9C4pLfaMreloqbsV4g8DgaCC/wFTXeK9/HiQQCxVfjIvT1h3qEeclXgET5s9M
 2BfBhxuswFBbdQSvX17HP1JnDhR9nBe26ab9piTqMPN7gPqLws5P5pO2M7VQvXCZux
 yFZvXnhYkd9VQ==
Received: by wens.tw (Postfix, from userid 1000)
 id 49B865FA0C; Wed,  9 Mar 2022 00:08:08 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Javier Martinez Canillas <javierm@redhat.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 2/2] drm: ssd130x: Always apply segment remap setting
Date: Wed,  9 Mar 2022 00:07:58 +0800
Message-Id: <20220308160758.26060-2-wens@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220308160758.26060-1-wens@kernel.org>
References: <20220308160758.26060-1-wens@kernel.org>
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
Cc: Chen-Yu Tsai <wens@csie.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chen-Yu Tsai <wens@csie.org>

Currently the ssd130x driver only sets the segment remap setting when
the device tree requests it; it however does not clear the setting if
it is not requested. This leads to the setting incorrectly persisting
if the hardware is always on and has no reset GPIO wired. This might
happen when a developer is trying to find the correct settings for an
unknown module, and cause the developer to get confused because the
settings from the device tree are not consistently applied.

Make the driver apply the segment remap setting consistently, setting
the value correctly based on the device tree setting. This also makes
this setting's behavior consistent with the other settings, which are
always applied.

Fixes: a61732e80867 ("drm: Add driver for Solomon SSD130x OLED displays")
Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 drivers/gpu/drm/solomon/ssd130x.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/ssd130x.c
index ccd378135589..d08d86ef07bc 100644
--- a/drivers/gpu/drm/solomon/ssd130x.c
+++ b/drivers/gpu/drm/solomon/ssd130x.c
@@ -48,7 +48,7 @@
 #define SSD130X_CONTRAST			0x81
 #define SSD130X_SET_LOOKUP_TABLE		0x91
 #define SSD130X_CHARGE_PUMP			0x8d
-#define SSD130X_SEG_REMAP_ON			0xa1
+#define SSD130X_SET_SEG_REMAP			0xa0
 #define SSD130X_DISPLAY_OFF			0xae
 #define SSD130X_SET_MULTIPLEX_RATIO		0xa8
 #define SSD130X_DISPLAY_ON			0xaf
@@ -61,6 +61,8 @@
 #define SSD130X_SET_COM_PINS_CONFIG		0xda
 #define SSD130X_SET_VCOMH			0xdb
 
+#define SSD130X_SET_SEG_REMAP_MASK		GENMASK(0, 0)
+#define SSD130X_SET_SEG_REMAP_SET(val)		FIELD_PREP(SSD130X_SET_SEG_REMAP_MASK, (val))
 #define SSD130X_SET_COM_SCAN_DIR_MASK		GENMASK(3, 3)
 #define SSD130X_SET_COM_SCAN_DIR_SET(val)	FIELD_PREP(SSD130X_SET_COM_SCAN_DIR_MASK, (val))
 #define SSD130X_SET_CLOCK_DIV_MASK		GENMASK(3, 0)
@@ -235,7 +237,7 @@ static void ssd130x_power_off(struct ssd130x_device *ssd130x)
 
 static int ssd130x_init(struct ssd130x_device *ssd130x)
 {
-	u32 precharge, dclk, com_invdir, compins, chargepump;
+	u32 precharge, dclk, com_invdir, compins, chargepump, seg_remap;
 	int ret;
 
 	/* Set initial contrast */
@@ -244,11 +246,11 @@ static int ssd130x_init(struct ssd130x_device *ssd130x)
 		return ret;
 
 	/* Set segment re-map */
-	if (ssd130x->seg_remap) {
-		ret = ssd130x_write_cmd(ssd130x, 1, SSD130X_SEG_REMAP_ON);
-		if (ret < 0)
-			return ret;
-	}
+	seg_remap = (SSD130X_SET_SEG_REMAP |
+		     SSD130X_SET_SEG_REMAP_SET(ssd130x->seg_remap));
+	ret = ssd130x_write_cmd(ssd130x, 1, seg_remap);
+	if (ret < 0)
+		return ret;
 
 	/* Set COM direction */
 	com_invdir = (SSD130X_SET_COM_SCAN_DIR |
-- 
2.34.1

