Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A22D1EF229
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jun 2020 09:34:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E1176E89D;
	Fri,  5 Jun 2020 07:33:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 759AD6E891
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jun 2020 07:33:20 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 22AB4B2B1;
 Fri,  5 Jun 2020 07:33:21 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: abrodkin@synopsys.com, airlied@linux.ie, daniel@ffwll.ch,
 james.qian.wang@arm.com, liviu.dudau@arm.com, mihail.atanassov@arm.com,
 brian.starkey@arm.com, joel@jms.id.au, andrew@aj.id.au, sam@ravnborg.org,
 bbrezillon@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, ludovic.desroches@microchip.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, stefan@agner.ch,
 alison.wang@nxp.com, xinliang.liu@linaro.org, zourongrong@gmail.com,
 john.stultz@linaro.org, kong.kongxinwei@hisilicon.com,
 puck.chen@hisilicon.com, p.zabel@pengutronix.de, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 linux-imx@nxp.com, paul@crapouillou.net, linus.walleij@linaro.org,
 narmstrong@baylibre.com, khilman@baylibre.com, marex@denx.de,
 laurent.pinchart@ideasonboard.com, kieran.bingham+renesas@ideasonboard.com,
 benjamin.gaignard@linaro.org, vincent.abriou@st.com, yannick.fertre@st.com,
 philippe.cornu@st.com, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com,
 wens@csie.org, jsarha@ti.com, tomi.valkeinen@ti.com, noralf@tronnes.org
Subject: [PATCH v3 43/43] drm: Remove struct drm_driver.gem_print_info
Date: Fri,  5 Jun 2020 09:32:47 +0200
Message-Id: <20200605073247.4057-44-tzimmermann@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200605073247.4057-1-tzimmermann@suse.de>
References: <20200605073247.4057-1-tzimmermann@suse.de>
MIME-Version: 1.0
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
Cc: linux-arm-kernel@lists.infradead.org,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-aspeed@lists.ozlabs.org,
 dri-devel@lists.freedesktop.org, Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The .gem_print_info callback in struct drm_driver is obsolete and has
no users left. Remove it.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Suggested-by: Emil Velikov <emil.velikov@collabora.com>
---
 drivers/gpu/drm/drm_gem.c |  2 --
 include/drm/drm_drv.h     | 17 -----------------
 2 files changed, 19 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index efc0367841e2b..08b3fa27ec406 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -1191,8 +1191,6 @@ void drm_gem_print_info(struct drm_printer *p, unsigned int indent,
 
 	if (obj->funcs && obj->funcs->print_info)
 		obj->funcs->print_info(p, indent, obj);
-	else if (obj->dev->driver->gem_print_info)
-		obj->dev->driver->gem_print_info(p, indent, obj);
 }
 
 int drm_gem_pin(struct drm_gem_object *obj)
diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
index bb924cddc09c1..8f110a28b6a23 100644
--- a/include/drm/drm_drv.h
+++ b/include/drm/drm_drv.h
@@ -353,23 +353,6 @@ struct drm_driver {
 	 */
 	void (*gem_close_object) (struct drm_gem_object *, struct drm_file *);
 
-	/**
-	 * @gem_print_info:
-	 *
-	 * This callback is deprecated in favour of
-	 * &drm_gem_object_funcs.print_info.
-	 *
-	 * If driver subclasses struct &drm_gem_object, it can implement this
-	 * optional hook for printing additional driver specific info.
-	 *
-	 * drm_printf_indent() should be used in the callback passing it the
-	 * indent argument.
-	 *
-	 * This callback is called from drm_gem_print_info().
-	 */
-	void (*gem_print_info)(struct drm_printer *p, unsigned int indent,
-			       const struct drm_gem_object *obj);
-
 	/**
 	 * @gem_create_object: constructor for gem objects
 	 *
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
