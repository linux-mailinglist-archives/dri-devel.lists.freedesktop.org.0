Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6670F60AF49
	for <lists+dri-devel@lfdr.de>; Mon, 24 Oct 2022 17:41:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F29F110E86F;
	Mon, 24 Oct 2022 15:41:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61F1310E886
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 15:41:01 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 8C1B01FA95;
 Mon, 24 Oct 2022 15:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1666626058; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=D1WQ/DuYllfDxdlq0UnvLA6w0csqxNxmfZVGmG6EkuU=;
 b=Jg75W9uLxtuFaMCUbFNh0LNcyfAPONvG+3a8S8eRf4uPYSmz6lEaonBses31n6awVTSRaE
 mJCE3qWc4vRilk9qAI4RBOTbvVIOryy1QBEocrK691udel1cG+gsd4Pi+Ub812mZR2S3bG
 aX9UlAFxEri6ylVpSLec5Ic+oeVt82A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1666626058;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=D1WQ/DuYllfDxdlq0UnvLA6w0csqxNxmfZVGmG6EkuU=;
 b=MYDYDFrIgfjZHwT1V3cTPVm24MobRm3QSL3uYzCmzif78NBbjkV3WeVaemlNAjFkAVxNhI
 RXzjCKye514jjKAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5142C13357;
 Mon, 24 Oct 2022 15:40:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id DazVEQqyVmPYTAAAMHmgww
 (envelope-from <tiwai@suse.de>); Mon, 24 Oct 2022 15:40:58 +0000
From: Takashi Iwai <tiwai@suse.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/radeon: Add HD-audio component notifier support (v4)
Date: Mon, 24 Oct 2022 17:40:54 +0200
Message-Id: <20221024154055.21473-1-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
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
Cc: linux-kernel@vger.kernel.org, Jim Qu <Jim.Qu@amd.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch adds the support for the notification of HD-audio hotplug
via the already existing drm_audio_component framework to radeon
driver.  This allows us more reliable hotplug notification and ELD
transfer without accessing HD-audio bus; it's more efficient, and more
importantly, it works without waking up the runtime PM.

The implementation is rather simplistic: radeon driver provides the
get_eld ops for HD-audio, and it notifies the audio hotplug via
pin_eld_notify callback upon each radeon_audio_enable() call.
The pin->id is referred as the port number passed to the notifier
callback, and the corresponding connector is looked through the
encoder list in the get_eld callback in turn.

The bind and unbind callbacks handle the device-link so that it
assures the PM call order.

Also, as a gratis bonus, this patch "fixes" the regression by the
recent change in HD-audio to be more strict for the HDMI/DP
connection, too.  Since the HD-audio HDMI/DP codec requires both the
connection bit and the valid ELD to be provided, it started failing on
some RADEON gfx boards where the ELD update performed instably.  As
this change switches the communication to a direct way between the
audio and the graphics drivers, now the system receives the proper
ELD, and the HDMI/DP hotplug starts working again.

[ v2: fix the logic in radeon_audio_component_get_eld to walk the
  connector list since that is where the EDID lives and we can
  derive the encoder from the connector because the encoder has
  not been assigned at this point (i.e., during monitor probe).

  v3: the component binding is moved outside radeon_audio_init() and
  _fini(), as those are called from suspend/resume, too.
  Drop modeset lock calls that caused Oops.
  Moved Kconfig change so that it can be applied on older kernels.

  v4: revive drm_modeset_lock*() again, add the missing
  device_link_remove() call at unbinding ]

Link: https://gitlab.freedesktop.org/drm/amd/-/issues/1569
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 drivers/gpu/drm/Kconfig                |   1 +
 drivers/gpu/drm/radeon/radeon.h        |   7 ++
 drivers/gpu/drm/radeon/radeon_audio.c  | 113 +++++++++++++++++++++++++
 drivers/gpu/drm/radeon/radeon_device.c |   3 +
 4 files changed, 124 insertions(+)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 34f5a092c99e..fa986075e8fb 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -243,6 +243,7 @@ config DRM_RADEON
         select DRM_KMS_HELPER
         select DRM_TTM
 	select DRM_TTM_HELPER
+	select SND_HDA_COMPONENT if SND_HDA_CORE
 	select POWER_SUPPLY
 	select HWMON
 	select BACKLIGHT_CLASS_DEVICE
diff --git a/drivers/gpu/drm/radeon/radeon.h b/drivers/gpu/drm/radeon/radeon.h
index 166c18d62f6d..d82424525f5a 100644
--- a/drivers/gpu/drm/radeon/radeon.h
+++ b/drivers/gpu/drm/radeon/radeon.h
@@ -79,6 +79,7 @@
 #include <drm/ttm/ttm_execbuf_util.h>
 
 #include <drm/drm_gem.h>
+#include <drm/drm_audio_component.h>
 
 #include "radeon_family.h"
 #include "radeon_mode.h"
@@ -1796,6 +1797,8 @@ struct r600_audio {
 	struct radeon_audio_funcs *hdmi_funcs;
 	struct radeon_audio_funcs *dp_funcs;
 	struct radeon_audio_basic_funcs *funcs;
+	struct drm_audio_component *component;
+	bool component_registered;
 };
 
 /*
@@ -2994,6 +2997,10 @@ void radeon_irq_kms_set_irq_n_enabled(struct radeon_device *rdev,
 				      bool enable, const char *name,
 				      unsigned n);
 
+/* Audio component binding */
+void radeon_audio_component_init(struct radeon_device *rdev);
+void radeon_audio_component_fini(struct radeon_device *rdev);
+
 #include "radeon_object.h"
 
 #endif
diff --git a/drivers/gpu/drm/radeon/radeon_audio.c b/drivers/gpu/drm/radeon/radeon_audio.c
index 7c5e80d03fc9..4ceb90556127 100644
--- a/drivers/gpu/drm/radeon/radeon_audio.c
+++ b/drivers/gpu/drm/radeon/radeon_audio.c
@@ -23,6 +23,7 @@
  */
 
 #include <linux/gcd.h>
+#include <linux/component.h>
 
 #include <drm/drm_crtc.h>
 #include "dce6_afmt.h"
@@ -180,6 +181,9 @@ static struct radeon_audio_funcs dce6_dp_funcs = {
 	.dpms = evergreen_dp_enable,
 };
 
+static void radeon_audio_component_notify(struct drm_audio_component *acomp,
+					  int port);
+
 static void radeon_audio_enable(struct radeon_device *rdev,
 				struct r600_audio_pin *pin, u8 enable_mask)
 {
@@ -207,6 +211,8 @@ static void radeon_audio_enable(struct radeon_device *rdev,
 
 	if (rdev->audio.funcs->enable)
 		rdev->audio.funcs->enable(rdev, pin, enable_mask);
+
+	radeon_audio_component_notify(rdev->audio.component, pin->id);
 }
 
 static void radeon_audio_interface_init(struct radeon_device *rdev)
@@ -721,3 +727,110 @@ unsigned int radeon_audio_decode_dfs_div(unsigned int div)
 	else
 		return 0;
 }
+
+/*
+ * Audio component support
+ */
+static void radeon_audio_component_notify(struct drm_audio_component *acomp,
+					  int port)
+{
+	if (acomp && acomp->audio_ops && acomp->audio_ops->pin_eld_notify)
+		acomp->audio_ops->pin_eld_notify(acomp->audio_ops->audio_ptr,
+						 port, -1);
+}
+
+static int radeon_audio_component_get_eld(struct device *kdev, int port,
+					  int pipe, bool *enabled,
+					  unsigned char *buf, int max_bytes)
+{
+	struct drm_device *dev = dev_get_drvdata(kdev);
+	struct drm_encoder *encoder;
+	struct radeon_encoder *radeon_encoder;
+	struct radeon_encoder_atom_dig *dig;
+	struct drm_connector *connector;
+	int ret = 0;
+
+	*enabled = false;
+	list_for_each_entry(connector, &dev->mode_config.connector_list, head) {
+		const struct drm_connector_helper_funcs *connector_funcs =
+			connector->helper_private;
+		encoder = connector_funcs->best_encoder(connector);
+
+		if (!encoder)
+			continue;
+		if (!radeon_encoder_is_digital(encoder))
+			continue;
+		radeon_encoder = to_radeon_encoder(encoder);
+		dig = radeon_encoder->enc_priv;
+		if (!dig->pin || dig->pin->id != port)
+			continue;
+		*enabled = true;
+		ret = drm_eld_size(connector->eld);
+		memcpy(buf, connector->eld, min(max_bytes, ret));
+		break;
+	}
+
+	return ret;
+}
+
+static const struct drm_audio_component_ops radeon_audio_component_ops = {
+	.get_eld = radeon_audio_component_get_eld,
+};
+
+static int radeon_audio_component_bind(struct device *kdev,
+				       struct device *hda_kdev, void *data)
+{
+	struct drm_device *dev = dev_get_drvdata(kdev);
+	struct radeon_device *rdev = dev->dev_private;
+	struct drm_audio_component *acomp = data;
+
+	if (WARN_ON(!device_link_add(hda_kdev, kdev, DL_FLAG_STATELESS)))
+		return -ENOMEM;
+
+	drm_modeset_lock_all(dev);
+	acomp->ops = &radeon_audio_component_ops;
+	acomp->dev = kdev;
+	rdev->audio.component = acomp;
+	drm_modeset_unlock_all(dev);
+
+	return 0;
+}
+
+static void radeon_audio_component_unbind(struct device *kdev,
+					  struct device *hda_kdev, void *data)
+{
+	struct drm_device *dev = dev_get_drvdata(kdev);
+	struct radeon_device *rdev = dev->dev_private;
+	struct drm_audio_component *acomp = data;
+
+	device_link_remove(hda_kdev, kdev);
+
+	drm_modeset_lock_all(dev);
+	rdev->audio.component = NULL;
+	acomp->ops = NULL;
+	acomp->dev = NULL;
+	drm_modeset_unlock_all(dev);
+}
+
+static const struct component_ops radeon_audio_component_bind_ops = {
+	.bind	= radeon_audio_component_bind,
+	.unbind	= radeon_audio_component_unbind,
+};
+
+void radeon_audio_component_init(struct radeon_device *rdev)
+{
+	if (rdev->audio.component_registered ||
+	    !radeon_audio || !radeon_audio_chipset_supported(rdev))
+		return;
+
+	if (!component_add(rdev->dev, &radeon_audio_component_bind_ops))
+		rdev->audio.component_registered = true;
+}
+
+void radeon_audio_component_fini(struct radeon_device *rdev)
+{
+	if (rdev->audio.component_registered) {
+		component_del(rdev->dev, &radeon_audio_component_bind_ops);
+		rdev->audio.component_registered = false;
+	}
+}
diff --git a/drivers/gpu/drm/radeon/radeon_device.c b/drivers/gpu/drm/radeon/radeon_device.c
index a556b6be1137..17bfbbe906c8 100644
--- a/drivers/gpu/drm/radeon/radeon_device.c
+++ b/drivers/gpu/drm/radeon/radeon_device.c
@@ -1451,6 +1451,8 @@ int radeon_device_init(struct radeon_device *rdev,
 			goto failed;
 	}
 
+	radeon_audio_component_init(rdev);
+
 	r = radeon_ib_ring_tests(rdev);
 	if (r)
 		DRM_ERROR("ib ring test failed (%d).\n", r);
@@ -1513,6 +1515,7 @@ void radeon_device_fini(struct radeon_device *rdev)
 	rdev->shutdown = true;
 	/* evict vram memory */
 	radeon_bo_evict_vram(rdev);
+	radeon_audio_component_fini(rdev);
 	radeon_fini(rdev);
 	if (!pci_is_thunderbolt_attached(rdev->pdev))
 		vga_switcheroo_unregister_client(rdev->pdev);
-- 
2.35.3

