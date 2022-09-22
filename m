Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A9115E67ED
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 18:00:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0146A10EC59;
	Thu, 22 Sep 2022 16:00:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-42a8.mail.infomaniak.ch (smtp-42a8.mail.infomaniak.ch
 [IPv6:2001:1600:4:17::42a8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBD9E10EB06
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Sep 2022 12:52:46 +0000 (UTC)
Received: from smtp-3-0000.mail.infomaniak.ch (unknown [10.4.36.107])
 by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4MYFLr4H9vzMpvbT;
 Thu, 22 Sep 2022 14:43:16 +0200 (CEST)
Received: from philippe-pc.toradex.int (unknown [31.10.206.125])
 by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4MYFLr1mgZzx4;
 Thu, 22 Sep 2022 14:43:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=pschenker.ch;
 s=20220412; t=1663850596;
 bh=E4CXD4d3Xn+bPdqQlu5YfOTpM5v82SNMUk19vcUlzSA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UigWODTfq0hnHtkrn8jCupkr83Ls8C7bR4EE9i16Us3KHcqRTYNIqaTw05VxST2RP
 kwRTrtRtnStmHNfU9Sr8kCo8Gz7V2zvBqZ4AVgF5e/XC7xFxRcf94B2czKkbMtSoPV
 9fBxlD+/KdPjsJ42zTGbq0QNwDxkNNSPRDp75Xqg=
From: Philippe Schenker <dev@pschenker.ch>
To: dri-devel@lists.freedesktop.org,
 Adrien Grassein <adrien.grassein@gmail.com>
Subject: [PATCH 1/4] drm/bridge: lt8912b: add vsync hsync
Date: Thu, 22 Sep 2022 14:43:03 +0200
Message-Id: <20220922124306.34729-2-dev@pschenker.ch>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220922124306.34729-1-dev@pschenker.ch>
References: <20220922124306.34729-1-dev@pschenker.ch>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 22 Sep 2022 16:00:00 +0000
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Robert Foss <robert.foss@linaro.org>,
 Philippe Schenker <philippe.schenker@toradex.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Philippe Schenker <philippe.schenker@toradex.com>

Currently the bridge driver does not take care whether or not the display
needs positive/negative vertical/horizontal syncs. Pass these two flags
to the bridge from the EDID that was read out from the display.

Fixes: 30e2ae943c26 ("drm/bridge: Introduce LT8912B DSI to HDMI bridge")
Signed-off-by: Philippe Schenker <philippe.schenker@toradex.com>

---

 drivers/gpu/drm/bridge/lontium-lt8912b.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt8912b.c b/drivers/gpu/drm/bridge/lontium-lt8912b.c
index 28bad30dc4e5..0fd3472e767c 100644
--- a/drivers/gpu/drm/bridge/lontium-lt8912b.c
+++ b/drivers/gpu/drm/bridge/lontium-lt8912b.c
@@ -268,7 +268,7 @@ static int lt8912_video_setup(struct lt8912 *lt)
 	u32 hactive, h_total, hpw, hfp, hbp;
 	u32 vactive, v_total, vpw, vfp, vbp;
 	u8 settle = 0x08;
-	int ret;
+	int ret, hsync_activehigh, vsync_activehigh;
 
 	if (!lt)
 		return -EINVAL;
@@ -278,12 +278,14 @@ static int lt8912_video_setup(struct lt8912 *lt)
 	hpw = lt->mode.hsync_len;
 	hbp = lt->mode.hback_porch;
 	h_total = hactive + hfp + hpw + hbp;
+	hsync_activehigh = lt->mode.flags & DISPLAY_FLAGS_HSYNC_HIGH;
 
 	vactive = lt->mode.vactive;
 	vfp = lt->mode.vfront_porch;
 	vpw = lt->mode.vsync_len;
 	vbp = lt->mode.vback_porch;
 	v_total = vactive + vfp + vpw + vbp;
+	vsync_activehigh = lt->mode.flags & DISPLAY_FLAGS_VSYNC_HIGH;
 
 	if (vactive <= 600)
 		settle = 0x04;
@@ -317,6 +319,11 @@ static int lt8912_video_setup(struct lt8912 *lt)
 	ret |= regmap_write(lt->regmap[I2C_CEC_DSI], 0x3e, hfp & 0xff);
 	ret |= regmap_write(lt->regmap[I2C_CEC_DSI], 0x3f, hfp >> 8);
 
+	ret |= regmap_update_bits(lt->regmap[I2C_MAIN], 0xab, BIT(0),
+				  vsync_activehigh ? BIT(0) : 0);
+	ret |= regmap_update_bits(lt->regmap[I2C_MAIN], 0xab, BIT(1),
+				  hsync_activehigh ? BIT(1) : 0);
+
 	return ret;
 }
 
-- 
2.37.3

