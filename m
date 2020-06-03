Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA58C1ECB8A
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jun 2020 10:32:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7913689CB8;
	Wed,  3 Jun 2020 08:31:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFB4D89AB6
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jun 2020 08:31:46 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 32E5FAE64;
 Wed,  3 Jun 2020 08:31:47 +0000 (UTC)
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
Subject: [PATCH v2 08/23] drm/hisilicon/kirin: Use GEM CMA object functions
Date: Wed,  3 Jun 2020 10:31:17 +0200
Message-Id: <20200603083132.4610-9-tzimmermann@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200603083132.4610-1-tzimmermann@suse.de>
References: <20200603083132.4610-1-tzimmermann@suse.de>
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
Cc: Xu YiPing <xuyiping@hisilicon.com>, linux-aspeed@lists.ozlabs.org,
 dri-devel@lists.freedesktop.org, Xinliang Liu <z.liuxinliang@hisilicon.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-kernel@lists.infradead.org,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The kirin driver uses the default implementation for CMA functions. The
DRM_GEM_CMA_DRIVER_OPS macro now sets these defaults in struct drm_driver.

Using DRM_GEM_CMA_DRIVER_OPS introduces several changes: the driver now
sets .gem_create_object to drm_cma_gem_create_object_default_funcs(),
which sets CMA GEM object functions. GEM object functions implement the
rsp operations where possible. Corresponding interfaces in struct drm_driver
are cleared. Prime import now uses drm_gem_cma_prime_import_sg_table_vmap(),
which maps the imported buffer upon import. Mmap operations are performed
by drm_gem_prime_mmap(), which goes through GEM file operations. These
changes have been part of the aspeed driver for some time.

v2:
	* use DRM_GEM_CMA_DRIVER_OPS

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Emil Velikov <emil.velikov@collabora.com>
Cc: Xu YiPing <xuyiping@hisilicon.com>
Cc: Rongrong Zou <zourongrong@gmail.com>
Cc: Xinliang Liu <z.liuxinliang@hisilicon.com>
---
 drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c
index 18e57e571e054..e1108c1735ad0 100644
--- a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c
+++ b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c
@@ -921,17 +921,7 @@ DEFINE_DRM_GEM_CMA_FOPS(ade_fops);
 static struct drm_driver ade_driver = {
 	.driver_features = DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
 	.fops = &ade_fops,
-	.gem_free_object_unlocked = drm_gem_cma_free_object,
-	.gem_vm_ops = &drm_gem_cma_vm_ops,
-	.dumb_create = drm_gem_cma_dumb_create,
-	.prime_handle_to_fd	= drm_gem_prime_handle_to_fd,
-	.prime_fd_to_handle	= drm_gem_prime_fd_to_handle,
-	.gem_prime_get_sg_table = drm_gem_cma_prime_get_sg_table,
-	.gem_prime_import_sg_table = drm_gem_cma_prime_import_sg_table,
-	.gem_prime_vmap = drm_gem_cma_prime_vmap,
-	.gem_prime_vunmap = drm_gem_cma_prime_vunmap,
-	.gem_prime_mmap = drm_gem_cma_prime_mmap,
-
+	DRM_GEM_CMA_DRIVER_OPS,
 	.name = "kirin",
 	.desc = "Hisilicon Kirin620 SoC DRM Driver",
 	.date = "20150718",
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
