Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C600D75D446
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jul 2023 21:19:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C32610E6F8;
	Fri, 21 Jul 2023 19:19:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6934610E6F7;
 Fri, 21 Jul 2023 19:19:34 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A87F361D7B;
 Fri, 21 Jul 2023 19:19:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F65FC433C7;
 Fri, 21 Jul 2023 19:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1689967173;
 bh=VknH39d+fypFBtbpKy9Ks9499orhFKGibNkjywSPOo8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=TwfHAh4dqdvIDSnWyOrbWr4scVHbxbgthT5ieOlaqy9DMKSJDh/azXW9+8q7icfQb
 wvRcfGgYIhspri592yY+F/y5s6+jXjcl2RfEEwIIjIoC9fx8IpiP6x9A/DEmqpzAWA
 aLcNZXU3sch42MqttSnd6swrBUacSkcUR6j6I6js=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: stable@vger.kernel.org
Subject: [PATCH 6.1 069/223] drm/client: Send hotplug event after registering
 a client
Date: Fri, 21 Jul 2023 18:05:22 +0200
Message-ID: <20230721160523.804204932@linuxfoundation.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230721160520.865493356@linuxfoundation.org>
References: <20230721160520.865493356@linuxfoundation.org>
User-Agent: quilt/0.67
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
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, Russell King <linux@armlinux.org.uk>,
 Thierry Reding <thierry.reding@gmail.com>, amd-gfx@lists.freedesktop.org,
 alexandru.gagniuc@hp.com, linux-samsung-soc@vger.kernel.org,
 Javier Martinez Canillas <javierm@redhat.com>, freedreno@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Kyungmin Park <kyungmin.park@samsung.com>, Paul Schyska <pschyska@gmail.com>,
 Torsten Krah <krah.tm@gmail.com>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Maxime Ripard <mripard@kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>, linux-tegra@vger.kernel.org,
 Mikko Perttunen <mperttunen@nvidia.com>, linux-arm-kernel@lists.infradead.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Moritz Duge <MoritzDuge@kolahilft.de>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thomas Zimmermann <tzimmermann@suse.de>

commit 27655b9bb9f0d9c32b8de8bec649b676898c52d5 upstream.

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
Fixes: 0e3172bac3f4 ("drm/amdgpu: Don't set struct drm_driver.output_poll_changed")
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
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> # msm
Link: https://patchwork.freedesktop.org/patch/msgid/20230710091029.27503-1-tzimmermann@suse.de
(cherry picked from commit 27655b9bb9f0d9c32b8de8bec649b676898c52d5)
[ Dropped changes to drivers/gpu/drm/armada/armada_fbdev.c as
  174c3c38e3a2 drm/armada: Initialize fbdev DRM client
  was introduced in 6.5-rc1.

  Dropped changes to exynos, msm, omapdrm, radeon, tegra drivers
  as missing code these commits introduced:

  99286486d674 drm/exynos: Initialize fbdev DRM client
  841ef552b141 drm/msm: Initialize fbdev DRM client
  9e69bcd88e45 drm/omapdrm: Implement fbdev emulation as in-kernel client
  e317a69fe891 drm/radeon: Implement client-based fbdev emulation
  9b926bcf2636 drm/radeon: Only build fbdev if DRM_FBDEV_EMULATION is set
  25dda38e0b07 drm/tegra: Initialize fbdev DRM client
  8f1aaccb04b7 drm/gma500: Implement client-based fbdev emulation
  b79fe9abd58b drm/fbdev-dma: Implement fbdev emulation for GEM DMA helpers

  Move code for drm-fbdev-generic.c to matching file in 6.1.y because
  these commits haven't happened in 6.1.y.
  8ab59da26bc0 drm/fb-helper: Move generic fbdev emulation into separate source file
  b9c93f4ec737 drm/fbdev-generic: Rename symbols ]
Cc: alexandru.gagniuc@hp.com
Link: https://lore.kernel.org/stable/SJ0PR84MB20882EEA1ABB36F60E845E378F5AA@SJ0PR84MB2088.NAMPRD84.PROD.OUTLOOK.COM/
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/gpu/drm/drm_client.c    |   21 +++++++++++++++++++++
 drivers/gpu/drm/drm_fb_helper.c |    4 ----
 2 files changed, 21 insertions(+), 4 deletions(-)

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
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -2634,10 +2634,6 @@ void drm_fbdev_generic_setup(struct drm_
 		preferred_bpp = 32;
 	fb_helper->preferred_bpp = preferred_bpp;
 
-	ret = drm_fbdev_client_hotplug(&fb_helper->client);
-	if (ret)
-		drm_dbg_kms(dev, "client hotplug ret=%d\n", ret);
-
 	drm_client_register(&fb_helper->client);
 }
 EXPORT_SYMBOL(drm_fbdev_generic_setup);


