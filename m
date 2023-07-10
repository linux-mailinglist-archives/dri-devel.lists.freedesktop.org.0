Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B60274D114
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jul 2023 11:10:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F00FC10E206;
	Mon, 10 Jul 2023 09:10:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9163310E1A4;
 Mon, 10 Jul 2023 09:10:33 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id DFECC1F747;
 Mon, 10 Jul 2023 09:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1688980231; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=l+p4EX1FVzBOQoGOcOf386rIUw6gZjfldInPfSHEuhU=;
 b=UMKbcCVa8pp9s0yYj4q8apZvI7ylWmCoLh0IThmzNRKXQi7SiSsBr7bN7jOJHtZEvy0BUg
 uUZej/nY1hx6BETxDiC8aX+IJWSwWpKVefJsOxILJTfLMKtxlY6M6ggZSC5EredHBk9i9w
 whqHI8xcChQH8XtITKAyqnPM04/SHFw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1688980231;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=l+p4EX1FVzBOQoGOcOf386rIUw6gZjfldInPfSHEuhU=;
 b=KT0j+kZdbc+QU6qi5+FrO5UOv4k28KucU74/0t/x9ml5MLj0RLQDowMbs2qB4t92R88HYj
 vrZpWorkcTJ7IxAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 47F4F1361C;
 Mon, 10 Jul 2023 09:10:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ROV0EAfLq2Q1IAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 10 Jul 2023 09:10:31 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com,
	noralf@tronnes.org
Subject: [PATCH] drm/client: Send hotplug event after registering a client
Date: Mon, 10 Jul 2023 11:10:17 +0200
Message-ID: <20230710091029.27503-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>, amd-gfx@lists.freedesktop.org,
 linux-samsung-soc@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Paul Schyska <pschyska@gmail.com>,
 Torsten Krah <krah.tm@gmail.com>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Maxime Ripard <mripard@kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>, linux-tegra@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, freedreno@lists.freedesktop.org, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Moritz Duge <MoritzDuge@kolahilft.de>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Generate a hotplug event after registering a client to allow the
client to configure its display. Remove the hotplug calls from the
existing clients for fbdev emulation. This change fixes a concurrency
bug between registering a client and receiving events from the DRM
core. The bug is present in the fbdev emulation of all drivers.

The fbdev emulation currently generates a hotplug event before
registering the client to the device. For each new output, the DRM
core sends an additional hotplug event to each registered client.

If the DRM core detects first output between sending the artificial
hotplug and registering the device, the output's hotplug event gets
lost. If this is the first output, the fbdev console display remains
dark. This has been observed with amdgpu and fbdev-generic.

Fix this by adding hotplug generation directly to the client's
register helper drm_client_register(). Registering the client and
receiving events are serialized by struct drm_device.clientlist_mutex.
So an output is either configured by the initial hotplug event, or
the client has already been registered.

The bug was originally added in commit 6e3f17ee73f7 ("drm/fb-helper:
generic: Call drm_client_add() after setup is done"), in which adding
a client and receiving a hotplug event switched order. It was hidden,
as most hardware and drivers have at least on static output configured.
Other drivers didn't use the internal DRM client or still had struct
drm_mode_config_funcs.output_poll_changed set. That callback handled
hotplug events as well. After not setting the callback in amdgpu in
commit 0e3172bac3f4 ("drm/amdgpu: Don't set struct
drm_driver.output_poll_changed"), amdgpu did not show a framebuffer
console if output events got lost. The bug got copy-pasted from
fbdev-generic into the other fbdev emulation.

Reported-by: Moritz Duge <MoritzDuge@kolahilft.de>
Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/2649
Fixes: 6e3f17ee73f7 ("drm/fb-helper: generic: Call drm_client_add() after setup is done")
Fixes: 8ab59da26bc0 ("drm/fb-helper: Move generic fbdev emulation into separate source file")
Fixes: b79fe9abd58b ("drm/fbdev-dma: Implement fbdev emulation for GEM DMA helpers")
Fixes: 63c381552f69 ("drm/armada: Implement fbdev emulation as in-kernel client")
Fixes: 49953b70e7d3 ("drm/exynos: Implement fbdev emulation as in-kernel client")
Fixes: 8f1aaccb04b7 ("drm/gma500: Implement client-based fbdev emulation")
Fixes: 940b869c2f2f ("drm/msm: Implement fbdev emulation as in-kernel client")
Fixes: 9e69bcd88e45 ("drm/omapdrm: Implement fbdev emulation as in-kernel client")
Fixes: e317a69fe891 ("drm/radeon: Implement client-based fbdev emulation")
Fixes: 71ec16f45ef8 ("drm/tegra: Implement fbdev emulation as in-kernel client")
Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Tested-by: Moritz Duge <MoritzDuge@kolahilft.de>
Tested-by: Torsten Krah <krah.tm@gmail.com>
Tested-by: Paul Schyska <pschyska@gmail.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: David Airlie <airlied@gmail.com>
Cc: Noralf Trønnes <noralf@tronnes.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Javier Martinez Canillas <javierm@redhat.com>
Cc: Russell King <linux@armlinux.org.uk>
Cc: Inki Dae <inki.dae@samsung.com>
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>
Cc: Kyungmin Park <kyungmin.park@samsung.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Mikko Perttunen <mperttunen@nvidia.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org
Cc: freedreno@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org
Cc: linux-tegra@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: <stable@vger.kernel.org> # v5.2+
---
 drivers/gpu/drm/armada/armada_fbdev.c     |  4 ----
 drivers/gpu/drm/drm_client.c              | 21 +++++++++++++++++++++
 drivers/gpu/drm/drm_fbdev_dma.c           |  4 ----
 drivers/gpu/drm/drm_fbdev_generic.c       |  4 ----
 drivers/gpu/drm/exynos/exynos_drm_fbdev.c |  4 ----
 drivers/gpu/drm/gma500/fbdev.c            |  4 ----
 drivers/gpu/drm/msm/msm_fbdev.c           |  4 ----
 drivers/gpu/drm/omapdrm/omap_fbdev.c      |  4 ----
 drivers/gpu/drm/radeon/radeon_fbdev.c     |  4 ----
 drivers/gpu/drm/tegra/fbdev.c             |  4 ----
 10 files changed, 21 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/armada/armada_fbdev.c b/drivers/gpu/drm/armada/armada_fbdev.c
index 3943e89cc06c..e40a95e51785 100644
--- a/drivers/gpu/drm/armada/armada_fbdev.c
+++ b/drivers/gpu/drm/armada/armada_fbdev.c
@@ -209,10 +209,6 @@ void armada_fbdev_setup(struct drm_device *dev)
 		goto err_drm_client_init;
 	}
 
-	ret = armada_fbdev_client_hotplug(&fbh->client);
-	if (ret)
-		drm_dbg_kms(dev, "client hotplug ret=%d\n", ret);
-
 	drm_client_register(&fbh->client);
 
 	return;
diff --git a/drivers/gpu/drm/drm_client.c b/drivers/gpu/drm/drm_client.c
index f6292ba0e6fc..037e36f2049c 100644
--- a/drivers/gpu/drm/drm_client.c
+++ b/drivers/gpu/drm/drm_client.c
@@ -122,13 +122,34 @@ EXPORT_SYMBOL(drm_client_init);
  * drm_client_register() it is no longer permissible to call drm_client_release()
  * directly (outside the unregister callback), instead cleanup will happen
  * automatically on driver unload.
+ *
+ * Registering a client generates a hotplug event that allows the client
+ * to set up its display from pre-existing outputs. The client must have
+ * initialized its state to able to handle the hotplug event successfully.
  */
 void drm_client_register(struct drm_client_dev *client)
 {
 	struct drm_device *dev = client->dev;
+	int ret;
 
 	mutex_lock(&dev->clientlist_mutex);
 	list_add(&client->list, &dev->clientlist);
+
+	if (client->funcs && client->funcs->hotplug) {
+		/*
+		 * Perform an initial hotplug event to pick up the
+		 * display configuration for the client. This step
+		 * has to be performed *after* registering the client
+		 * in the list of clients, or a concurrent hotplug
+		 * event might be lost; leaving the display off.
+		 *
+		 * Hold the clientlist_mutex as for a regular hotplug
+		 * event.
+		 */
+		ret = client->funcs->hotplug(client);
+		if (ret)
+			drm_dbg_kms(dev, "client hotplug ret=%d\n", ret);
+	}
 	mutex_unlock(&dev->clientlist_mutex);
 }
 EXPORT_SYMBOL(drm_client_register);
diff --git a/drivers/gpu/drm/drm_fbdev_dma.c b/drivers/gpu/drm/drm_fbdev_dma.c
index 8217f1ddc007..f9b1f7cd31b7 100644
--- a/drivers/gpu/drm/drm_fbdev_dma.c
+++ b/drivers/gpu/drm/drm_fbdev_dma.c
@@ -248,10 +248,6 @@ void drm_fbdev_dma_setup(struct drm_device *dev, unsigned int preferred_bpp)
 		goto err_drm_client_init;
 	}
 
-	ret = drm_fbdev_dma_client_hotplug(&fb_helper->client);
-	if (ret)
-		drm_dbg_kms(dev, "client hotplug ret=%d\n", ret);
-
 	drm_client_register(&fb_helper->client);
 
 	return;
diff --git a/drivers/gpu/drm/drm_fbdev_generic.c b/drivers/gpu/drm/drm_fbdev_generic.c
index 98ae703848a0..b9343fb6cf13 100644
--- a/drivers/gpu/drm/drm_fbdev_generic.c
+++ b/drivers/gpu/drm/drm_fbdev_generic.c
@@ -339,10 +339,6 @@ void drm_fbdev_generic_setup(struct drm_device *dev, unsigned int preferred_bpp)
 		goto err_drm_client_init;
 	}
 
-	ret = drm_fbdev_generic_client_hotplug(&fb_helper->client);
-	if (ret)
-		drm_dbg_kms(dev, "client hotplug ret=%d\n", ret);
-
 	drm_client_register(&fb_helper->client);
 
 	return;
diff --git a/drivers/gpu/drm/exynos/exynos_drm_fbdev.c b/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
index fdf65587f1fe..226310c765d8 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
@@ -215,10 +215,6 @@ void exynos_drm_fbdev_setup(struct drm_device *dev)
 	if (ret)
 		goto err_drm_client_init;
 
-	ret = exynos_drm_fbdev_client_hotplug(&fb_helper->client);
-	if (ret)
-		drm_dbg_kms(dev, "client hotplug ret=%d\n", ret);
-
 	drm_client_register(&fb_helper->client);
 
 	return;
diff --git a/drivers/gpu/drm/gma500/fbdev.c b/drivers/gpu/drm/gma500/fbdev.c
index 955cbe9f05a7..054426549fc6 100644
--- a/drivers/gpu/drm/gma500/fbdev.c
+++ b/drivers/gpu/drm/gma500/fbdev.c
@@ -328,10 +328,6 @@ void psb_fbdev_setup(struct drm_psb_private *dev_priv)
 		goto err_drm_fb_helper_unprepare;
 	}
 
-	ret = psb_fbdev_client_hotplug(&fb_helper->client);
-	if (ret)
-		drm_dbg_kms(dev, "client hotplug ret=%d\n", ret);
-
 	drm_client_register(&fb_helper->client);
 
 	return;
diff --git a/drivers/gpu/drm/msm/msm_fbdev.c b/drivers/gpu/drm/msm/msm_fbdev.c
index b933a85420f6..bf1e17dc4550 100644
--- a/drivers/gpu/drm/msm/msm_fbdev.c
+++ b/drivers/gpu/drm/msm/msm_fbdev.c
@@ -246,10 +246,6 @@ void msm_fbdev_setup(struct drm_device *dev)
 		goto err_drm_fb_helper_unprepare;
 	}
 
-	ret = msm_fbdev_client_hotplug(&helper->client);
-	if (ret)
-		drm_dbg_kms(dev, "client hotplug ret=%d\n", ret);
-
 	drm_client_register(&helper->client);
 
 	return;
diff --git a/drivers/gpu/drm/omapdrm/omap_fbdev.c b/drivers/gpu/drm/omapdrm/omap_fbdev.c
index b7ccce0704a3..fe6639c1cdf3 100644
--- a/drivers/gpu/drm/omapdrm/omap_fbdev.c
+++ b/drivers/gpu/drm/omapdrm/omap_fbdev.c
@@ -318,10 +318,6 @@ void omap_fbdev_setup(struct drm_device *dev)
 
 	INIT_WORK(&fbdev->work, pan_worker);
 
-	ret = omap_fbdev_client_hotplug(&helper->client);
-	if (ret)
-		drm_dbg_kms(dev, "client hotplug ret=%d\n", ret);
-
 	drm_client_register(&helper->client);
 
 	return;
diff --git a/drivers/gpu/drm/radeon/radeon_fbdev.c b/drivers/gpu/drm/radeon/radeon_fbdev.c
index ab9c1abbac97..f941e2e7cae6 100644
--- a/drivers/gpu/drm/radeon/radeon_fbdev.c
+++ b/drivers/gpu/drm/radeon/radeon_fbdev.c
@@ -383,10 +383,6 @@ void radeon_fbdev_setup(struct radeon_device *rdev)
 		goto err_drm_client_init;
 	}
 
-	ret = radeon_fbdev_client_hotplug(&fb_helper->client);
-	if (ret)
-		drm_dbg_kms(rdev->ddev, "client hotplug ret=%d\n", ret);
-
 	drm_client_register(&fb_helper->client);
 
 	return;
diff --git a/drivers/gpu/drm/tegra/fbdev.c b/drivers/gpu/drm/tegra/fbdev.c
index e74d9be981c7..d042234e1807 100644
--- a/drivers/gpu/drm/tegra/fbdev.c
+++ b/drivers/gpu/drm/tegra/fbdev.c
@@ -225,10 +225,6 @@ void tegra_fbdev_setup(struct drm_device *dev)
 	if (ret)
 		goto err_drm_client_init;
 
-	ret = tegra_fbdev_client_hotplug(&helper->client);
-	if (ret)
-		drm_dbg_kms(dev, "client hotplug ret=%d\n", ret);
-
 	drm_client_register(&helper->client);
 
 	return;
-- 
2.41.0

