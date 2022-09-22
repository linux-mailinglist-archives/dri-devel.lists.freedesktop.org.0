Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5242E5E67F4
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 18:00:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89BC110EC57;
	Thu, 22 Sep 2022 16:00:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 568 seconds by postgrey-1.36 at gabe;
 Thu, 22 Sep 2022 12:52:46 UTC
Received: from smtp-8fac.mail.infomaniak.ch (smtp-8fac.mail.infomaniak.ch
 [IPv6:2001:1600:4:17::8fac])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A97410EB04
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Sep 2022 12:52:46 +0000 (UTC)
Received: from smtp-3-0000.mail.infomaniak.ch (unknown [10.4.36.107])
 by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4MYFLs2jySzMqJ30;
 Thu, 22 Sep 2022 14:43:17 +0200 (CEST)
Received: from philippe-pc.toradex.int (unknown [31.10.206.125])
 by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4MYFLs0bwZzx4;
 Thu, 22 Sep 2022 14:43:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=pschenker.ch;
 s=20220412; t=1663850597;
 bh=+OIz10N0TA8uuQex2ybW9n6SGAbwcDokvY4GhIEiPro=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=av5JMroOBKiey1Rx1ox6FjGZK+pgv1N0kM2fJGIJQoRKGafLPwBJVCoDSFa6SUGqI
 g8ADwi3jh/0D6nX3yIlEH1zclnikto68pCqs73JC6BBfYefSo8s2zfn9iOqaowkshn
 S/dK2UHJ0GuyVRFlJjqXjav6u9iF4sZRgbKJVCPo=
From: Philippe Schenker <dev@pschenker.ch>
To: dri-devel@lists.freedesktop.org,
 Adrien Grassein <adrien.grassein@gmail.com>
Subject: [PATCH 3/4] drm/bridge: lt8912b: fix corrupted image output
Date: Thu, 22 Sep 2022 14:43:05 +0200
Message-Id: <20220922124306.34729-4-dev@pschenker.ch>
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
 Francesco Dolcini <francesco.dolcini@toradex.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Francesco Dolcini <francesco.dolcini@toradex.com>

Correct I2C address for the register list in lt8912_write_lvds_config(),
these registers are on the first I2C address (0x48), the current
function is just writing garbage to the wrong registers and this creates
multiple issues (artifacts and output completely corrupted) on some HDMI
displays.

Correct I2C address comes from Lontium documentation and it is the one
used on other out-of-tree LT8912B drivers [1].

[1] https://github.com/boundarydevices/linux/blob/boundary-imx_5.10.x_2.0.0/drivers/video/lt8912.c#L296

Fixes: 30e2ae943c26 ("drm/bridge: Introduce LT8912B DSI to HDMI bridge")
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
Signed-off-by: Philippe Schenker <philippe.schenker@toradex.com>
---

 drivers/gpu/drm/bridge/lontium-lt8912b.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt8912b.c b/drivers/gpu/drm/bridge/lontium-lt8912b.c
index 6a4bb7422176..5968f4af190b 100644
--- a/drivers/gpu/drm/bridge/lontium-lt8912b.c
+++ b/drivers/gpu/drm/bridge/lontium-lt8912b.c
@@ -188,7 +188,7 @@ static int lt8912_write_lvds_config(struct lt8912 *lt)
 		{0x03, 0xff},
 	};
 
-	return regmap_multi_reg_write(lt->regmap[I2C_CEC_DSI], seq, ARRAY_SIZE(seq));
+	return regmap_multi_reg_write(lt->regmap[I2C_MAIN], seq, ARRAY_SIZE(seq));
 };
 
 static inline struct lt8912 *bridge_to_lt8912(struct drm_bridge *b)
-- 
2.37.3

