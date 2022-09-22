Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF0E55E67E6
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 18:00:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BFB510EBC1;
	Thu, 22 Sep 2022 16:00:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 567 seconds by postgrey-1.36 at gabe;
 Thu, 22 Sep 2022 12:52:45 UTC
Received: from smtp-42aa.mail.infomaniak.ch (smtp-42aa.mail.infomaniak.ch
 [84.16.66.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CD3110E343
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Sep 2022 12:52:45 +0000 (UTC)
Received: from smtp-3-0000.mail.infomaniak.ch (unknown [10.4.36.107])
 by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4MYFLs0F6WzMpvFw;
 Thu, 22 Sep 2022 14:43:17 +0200 (CEST)
Received: from philippe-pc.toradex.int (unknown [31.10.206.125])
 by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4MYFLr4bfzzx4;
 Thu, 22 Sep 2022 14:43:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=pschenker.ch;
 s=20220412; t=1663850596;
 bh=rPRq0sZw9ssZ1DOgDKQ+DheMaamSeVNAcj9Urfa5r+Y=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=di9Svk+N3G3GlNs89fp8R6/eavGQmIAwGU378ycae64rVgx19NkobiulRhs0LEygH
 saQe07et07Zon9c9xQjot48c90LT/vUeeyUt3YmEWJUrT9mM1Md7cVDf+1DZ9bjwkw
 vJ/MqjiihulFIcSCR/sVY1f6wGNvMA1faz7NJ4lA=
From: Philippe Schenker <dev@pschenker.ch>
To: dri-devel@lists.freedesktop.org,
 Adrien Grassein <adrien.grassein@gmail.com>
Subject: [PATCH 2/4] drm/bridge: lt8912b: set hdmi or dvi mode
Date: Thu, 22 Sep 2022 14:43:04 +0200
Message-Id: <20220922124306.34729-3-dev@pschenker.ch>
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

The Lontium LT8912 does have a setting for DVI or HDMI. This patch reads
from EDID what the display needs and sets it accordingly.

Fixes: 30e2ae943c26 ("drm/bridge: Introduce LT8912B DSI to HDMI bridge")
Signed-off-by: Philippe Schenker <philippe.schenker@toradex.com>
---

 drivers/gpu/drm/bridge/lontium-lt8912b.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/bridge/lontium-lt8912b.c b/drivers/gpu/drm/bridge/lontium-lt8912b.c
index 0fd3472e767c..6a4bb7422176 100644
--- a/drivers/gpu/drm/bridge/lontium-lt8912b.c
+++ b/drivers/gpu/drm/bridge/lontium-lt8912b.c
@@ -323,6 +323,8 @@ static int lt8912_video_setup(struct lt8912 *lt)
 				  vsync_activehigh ? BIT(0) : 0);
 	ret |= regmap_update_bits(lt->regmap[I2C_MAIN], 0xab, BIT(1),
 				  hsync_activehigh ? BIT(1) : 0);
+	ret |= regmap_update_bits(lt->regmap[I2C_MAIN], 0xb2, BIT(0),
+				  lt->connector.display_info.is_hdmi ? BIT(0) : 0);
 
 	return ret;
 }
-- 
2.37.3

