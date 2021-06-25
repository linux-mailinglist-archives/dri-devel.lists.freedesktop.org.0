Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AFB333B3EBD
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jun 2021 10:22:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEEEC6ED04;
	Fri, 25 Jun 2021 08:22:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 077D96ECF3;
 Fri, 25 Jun 2021 08:22:31 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 64E261FE5C;
 Fri, 25 Jun 2021 08:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1624609349; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6HUCUuf+BAHl7AqHp+Ft2lxNllp/xAoIbNrwPrmEHOI=;
 b=X5IUeNhYSm4x8iei8XJdXqzqeFxHkKMNa/Spyuts3vP0ruXiFK+3G6vUkOYVzwQh84VFfb
 GKiorY7onG9oCJFXFXufkSin/bfZMSI7utiWqudI1cDulmNleBhPB9eDv4sLwC3JN5HC9C
 U0sVF4uXUU3B+bcyy9jTcakE5l6DE5w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1624609349;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6HUCUuf+BAHl7AqHp+Ft2lxNllp/xAoIbNrwPrmEHOI=;
 b=Yt8DHF+ZwOI8VaaT1T40cUEiDktU+k3gbob1As7aaasUwdI9XCSJgmUJ5I9t2E+6CuE4jb
 TySj3nxuAYZwJNAg==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 49A9011A97;
 Fri, 25 Jun 2021 08:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1624609349; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6HUCUuf+BAHl7AqHp+Ft2lxNllp/xAoIbNrwPrmEHOI=;
 b=X5IUeNhYSm4x8iei8XJdXqzqeFxHkKMNa/Spyuts3vP0ruXiFK+3G6vUkOYVzwQh84VFfb
 GKiorY7onG9oCJFXFXufkSin/bfZMSI7utiWqudI1cDulmNleBhPB9eDv4sLwC3JN5HC9C
 U0sVF4uXUU3B+bcyy9jTcakE5l6DE5w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1624609349;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6HUCUuf+BAHl7AqHp+Ft2lxNllp/xAoIbNrwPrmEHOI=;
 b=Yt8DHF+ZwOI8VaaT1T40cUEiDktU+k3gbob1As7aaasUwdI9XCSJgmUJ5I9t2E+6CuE4jb
 TySj3nxuAYZwJNAg==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id kCMiEUSS1WAISwAALh3uQQ
 (envelope-from <tzimmermann@suse.de>); Fri, 25 Jun 2021 08:22:28 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, james.qian.wang@arm.com,
 liviu.dudau@arm.com, mihail.atanassov@arm.com, brian.starkey@arm.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 inki.dae@samsung.com, jy0922.shim@samsung.com, sw0312.kim@samsung.com,
 kyungmin.park@samsung.com, krzysztof.kozlowski@canonical.com,
 xinliang.liu@linaro.org, tiantao6@hisilicon.com, john.stultz@linaro.org,
 kong.kongxinwei@hisilicon.com, puck.chen@hisilicon.com,
 laurentiu.palcu@oss.nxp.com, l.stach@pengutronix.de,
 p.zabel@pengutronix.de, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
 chunkuang.hu@kernel.org, matthias.bgg@gmail.com, bskeggs@redhat.com,
 tomba@kernel.org, hjc@rock-chips.com, heiko@sntech.de,
 yannick.fertre@foss.st.com, philippe.cornu@foss.st.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, wens@csie.org,
 jernej.skrabec@gmail.com, thierry.reding@gmail.com, jonathanh@nvidia.com,
 jyri.sarha@iki.fi, emma@anholt.net, linux-graphics-maintainer@vmware.com,
 zackr@vmware.com, hyun.kwon@xilinx.com, laurent.pinchart@ideasonboard.com,
 michal.simek@xilinx.com, jani.nikula@linux.intel.com,
 rodrigo.vivi@intel.com, linux@armlinux.org.uk,
 kieran.bingham+renesas@ideasonboard.com, rodrigosiqueiramelo@gmail.com,
 melissa.srw@gmail.com, hamohammed.sa@gmail.com
Subject: [PATCH v4 04/27] drm: Don't test for IRQ support in VBLANK ioctls
Date: Fri, 25 Jun 2021 10:21:59 +0200
Message-Id: <20210625082222.3845-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210625082222.3845-1-tzimmermann@suse.de>
References: <20210625082222.3845-1-tzimmermann@suse.de>
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
Cc: linux-samsung-soc@vger.kernel.org, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-sunxi@lists.linux.dev, linux-rockchip@lists.infradead.org,
 linux-mediatek@lists.infradead.org, amd-gfx@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-tegra@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For KMS drivers, replace the IRQ check in VBLANK ioctls with a check for
vblank support. IRQs might be enabled wthout vblanking being supported.

This change also removes the DRM framework's only dependency on IRQ state
for non-legacy drivers. For legacy drivers with userspace modesetting,
the original test remains in drm_wait_vblank_ioctl().

v4:
	* avoid preprocessor ifdef in drm_wait_vblank_ioctl()
	  (Jani, Thierry)
v3:
	* optimize test in drm_wait_vblank_ioctl() for KMS case (Liviu)
	* update docs for drm_irq_uninstall()
v2:
	* keep the old test for legacy drivers in
	  drm_wait_vblank_ioctl() (Daniel)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/drm_irq.c    | 13 ++++---------
 drivers/gpu/drm/drm_vblank.c | 15 ++++++++++++---
 2 files changed, 16 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/drm_irq.c b/drivers/gpu/drm/drm_irq.c
index c3bd664ea733..945dd82e2ea3 100644
--- a/drivers/gpu/drm/drm_irq.c
+++ b/drivers/gpu/drm/drm_irq.c
@@ -74,10 +74,8 @@
  * only supports devices with a single interrupt on the main device stored in
  * &drm_device.dev and set as the device paramter in drm_dev_alloc().
  *
- * These IRQ helpers are strictly optional. Drivers which roll their own only
- * need to set &drm_device.irq_enabled to signal the DRM core that vblank
- * interrupts are working. Since these helpers don't automatically clean up the
- * requested interrupt like e.g. devm_request_irq() they're not really
+ * These IRQ helpers are strictly optional. Since these helpers don't automatically
+ * clean up the requested interrupt like e.g. devm_request_irq() they're not really
  * recommended.
  */
 
@@ -91,9 +89,7 @@
  * and after the installation.
  *
  * This is the simplified helper interface provided for drivers with no special
- * needs. Drivers which need to install interrupt handlers for multiple
- * interrupts must instead set &drm_device.irq_enabled to signal the DRM core
- * that vblank interrupts are available.
+ * needs.
  *
  * @irq must match the interrupt number that would be passed to request_irq(),
  * if called directly instead of using this helper function.
@@ -156,8 +152,7 @@ EXPORT_SYMBOL(drm_irq_install);
  *
  * Calls the driver's &drm_driver.irq_uninstall function and unregisters the IRQ
  * handler.  This should only be called by drivers which used drm_irq_install()
- * to set up their interrupt handler. Other drivers must only reset
- * &drm_device.irq_enabled to false.
+ * to set up their interrupt handler.
  *
  * Note that for kernel modesetting drivers it is a bug if this function fails.
  * The sanity checks are only to catch buggy user modesetting drivers which call
diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
index 3417e1ac7918..bba6781cc48f 100644
--- a/drivers/gpu/drm/drm_vblank.c
+++ b/drivers/gpu/drm/drm_vblank.c
@@ -1737,6 +1737,15 @@ static void drm_wait_vblank_reply(struct drm_device *dev, unsigned int pipe,
 	reply->tval_usec = ts.tv_nsec / 1000;
 }
 
+static bool drm_wait_vblank_supported(struct drm_device *dev)
+{
+	if  (IS_ENABLED(CONFIG_DRM_LEGACY)) {
+		if (unlikely(drm_core_check_feature(dev, DRIVER_LEGACY)))
+			return dev->irq_enabled;
+	}
+	return drm_dev_has_vblank(dev);
+}
+
 int drm_wait_vblank_ioctl(struct drm_device *dev, void *data,
 			  struct drm_file *file_priv)
 {
@@ -1748,7 +1757,7 @@ int drm_wait_vblank_ioctl(struct drm_device *dev, void *data,
 	unsigned int pipe_index;
 	unsigned int flags, pipe, high_pipe;
 
-	if (!dev->irq_enabled)
+	if (!drm_wait_vblank_supported(dev))
 		return -EOPNOTSUPP;
 
 	if (vblwait->request.type & _DRM_VBLANK_SIGNAL)
@@ -2023,7 +2032,7 @@ int drm_crtc_get_sequence_ioctl(struct drm_device *dev, void *data,
 	if (!drm_core_check_feature(dev, DRIVER_MODESET))
 		return -EOPNOTSUPP;
 
-	if (!dev->irq_enabled)
+	if (!drm_dev_has_vblank(dev))
 		return -EOPNOTSUPP;
 
 	crtc = drm_crtc_find(dev, file_priv, get_seq->crtc_id);
@@ -2082,7 +2091,7 @@ int drm_crtc_queue_sequence_ioctl(struct drm_device *dev, void *data,
 	if (!drm_core_check_feature(dev, DRIVER_MODESET))
 		return -EOPNOTSUPP;
 
-	if (!dev->irq_enabled)
+	if (!drm_dev_has_vblank(dev))
 		return -EOPNOTSUPP;
 
 	crtc = drm_crtc_find(dev, file_priv, queue_seq->crtc_id);
-- 
2.32.0

