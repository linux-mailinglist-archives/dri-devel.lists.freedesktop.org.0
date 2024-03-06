Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11FA48736B6
	for <lists+dri-devel@lfdr.de>; Wed,  6 Mar 2024 13:39:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3066410E0FA;
	Wed,  6 Mar 2024 12:39:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="WcGASoc1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77A0410E0FA
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Mar 2024 12:39:26 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4E34940008;
 Wed,  6 Mar 2024 12:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1709728764;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=elkd8DsFZS5LmKpv07wv9/YlAnCVft4QUXCwGUZen9k=;
 b=WcGASoc1KG0VbPwmMfiT95+0rpCtDVoXHW6AJ82VN7BMBrhC0n0M0ft/A5ZE91It8UhKsr
 4PEuag7MjK0qJjoCnqoUEcGAL8eF0axOME4/bJe2SaiTDeM/tnPn+jlow/uN37ta/sNlkz
 MsCKorGBGR/SrP8+FZm5Y386BgqIQn9G44GIPw6O9OxPMjBcPHashdFxBOJWN/ohM06hrl
 4iwT+Q//4XCfbzPAvkGllT6wcFxkiB1d7dxy2MlXIuER/KnArACdYph/Ac787FvLyqRy9Y
 YZ9Rg5C5piEiVvjvIsoit5FmWw7TsvEasEvOHVmmd4OOHoNVQyUhROBxEiqE4g==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 06 Mar 2024 13:39:20 +0100
Subject: [PATCH] Revert "drm/bridge: ti-sn65dsi83: Fix enable error path"
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240306-ti-sn65dsi83-regulator-imbalance-v1-1-a3cea5f3e5b3@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAPdj6GUC/x3NwQqDMAyA4VeRnBdI202HrzI8dG3UgKuSuDEQ3
 31lx+/y/wcYq7BB3xyg/BGTtVS4SwNpjmVilFwNnvyVArW4C1ppb9nkHlB5ei9xXxXl9YxLLIn
 REXvXjTmQT1Azm/Io3//iMZznDzvwTRRyAAAA
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.13.0
X-GND-Sasl: luca.ceresoli@bootlin.com
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This reverts commit 8a91b29f1f50ce7742cdbe5cf11d17f128511f3f.

The regulator_disable() added by the original commit solves one kind of
regulator imbalance but adds another one as it allows the regulator to be
disabled one more time than it is enabled in the following scenario:

 1. Start video pipeline -> sn65dsi83_atomic_pre_enable -> regulator_enable
 2. PLL lock fails -> regulator_disable
 3. Stop video pipeline -> sn65dsi83_atomic_disable -> regulator_disable

The reason is clear from the code flow, which looks like this (after
removing unrelated code):

  static void sn65dsi83_atomic_pre_enable()
  {
      regulator_enable(ctx->vcc);

      if (PLL failed locking) {
          regulator_disable(ctx->vcc);  <---- added by patch being reverted
          return;
      }
  }

  static void sn65dsi83_atomic_disable()
  {
      regulator_disable(ctx->vcc);
  }

The use case for introducing the additional regulator_disable() was
removing the module for debugging (see link below for the discussion). If
the module is removed after a .atomic_pre_enable, i.e. with an active
pipeline from the DRM point of view, .atomic_disable is not called and thus
the regulator would not be disabled.

According to the discussion however there is no actual use case for
removing the module with an active pipeline, except for
debugging/development.

On the other hand, the occurrence of a PLL lock failure is possible due to
any physical reason (e.g. a temporary hardware failure for electrical
reasons) so handling it gracefully should be supported. As there is no way
for .atomic[_pre]_enable to report an error to the core, the only clean way
to support it is calling regulator_disabled() only in .atomic_disable,
unconditionally, as it was before.

Link: https://lore.kernel.org/all/15244220.uLZWGnKmhe@steina-w/
Fixes: 8a91b29f1f50 ("drm/bridge: ti-sn65dsi83: Fix enable error path")
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
Many thanks to Alexander for the discussion.
---
 drivers/gpu/drm/bridge/ti-sn65dsi83.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
index e3501608aef9..12fb22d4cd23 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
@@ -499,7 +499,6 @@ printk(KERN_ERR "%s: LVDS in fallback (24/SPWG)\n", __func__);
 		dev_err(ctx->dev, "failed to lock PLL, ret=%i\n", ret);
 		/* On failure, disable PLL again and exit. */
 		regmap_write(ctx->regmap, REG_RC_PLL_EN, 0x00);
-		regulator_disable(ctx->vcc);
 		return;
 	}
 

---
base-commit: a71e4adac20bfe852d269addfef340923ce23a4c
change-id: 20240306-ti-sn65dsi83-regulator-imbalance-10e217fd302c

Best regards,
-- 
Luca Ceresoli <luca.ceresoli@bootlin.com>

