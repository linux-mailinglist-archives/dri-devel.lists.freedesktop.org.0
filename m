Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 011CC8BE19C
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2024 14:04:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14FFC112C65;
	Tue,  7 May 2024 12:04:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="T9lhYBta";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="gi1hywR1";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="dXJ+kAez";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="PvQ9sCgS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24F6710EC4A;
 Tue,  7 May 2024 12:04:30 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 3AEB620950;
 Tue,  7 May 2024 12:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1715083468; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CzI+5Y0i9BhDTUp5FPIiltbdaLvzV4yVhAKvLU0LUr0=;
 b=T9lhYBtafW4dGOvjH0IBb/KwxZRHXFAnXQGgiK/zmcvLnP1lSa2KkYYKPmqIjwirUUIw5j
 i09MPEaAIpYpIU/MpiitsXI8/l4BDUGxvdnhxI6KQzqlzSYtpB9jOQQuu3HO0qts+9xgbx
 l9euMsKj1ZH2Z6XrIOvLnqHJtB3exD0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1715083468;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CzI+5Y0i9BhDTUp5FPIiltbdaLvzV4yVhAKvLU0LUr0=;
 b=gi1hywR1LtNVOv75/I5kHyPbMw78O/GA73c3AG6D5D7MUr+XtlS7z4ml/Xma3R50rv20rI
 k0uza7CtjXRTBIDQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1715083467; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CzI+5Y0i9BhDTUp5FPIiltbdaLvzV4yVhAKvLU0LUr0=;
 b=dXJ+kAezui0YD6TGKh67buibe+vGtMr5rngeJERY9jZfTpgl1eGX2Xdf5NazmrLpx599Dd
 4JZzFu+vd0zHSVA4m33W9xFZZ6AWGsMpXgGlP94CY5Q4Z/lTP+/3SZWb3FQk8hEq94wx/a
 /Kkm+Pd8RVc8ChBIDPHc7ONTy3IZDmo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1715083467;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CzI+5Y0i9BhDTUp5FPIiltbdaLvzV4yVhAKvLU0LUr0=;
 b=PvQ9sCgSjItUtp2cszaYNy+y/O4j95Ul82U5yGRrqke9B0iSbuIDjvmOfegI8wXbtlzYBi
 9RYkVGjMmyoOzADg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 72AE913A3A;
 Tue,  7 May 2024 12:04:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 8HTBGsoYOmZDCgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 07 May 2024 12:04:26 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, inki.dae@samsung.com, sw0312.kim@samsung.com,
 kyungmin.park@samsung.com, linux@armlinux.org.uk, krzk@kernel.org,
 alim.akhtar@samsung.com, patrik.r.jakobsson@gmail.com,
 jani.nikula@linux.intel.com, rodrigo.vivi@intel.com,
 joonas.lahtinen@linux.intel.com, tursulin@ursulin.net, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, dmitry.baryshkov@linaro.org, sean@poorly.run,
 marijn.suijten@somainline.org, tomi.valkeinen@ideasonboard.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 thierry.reding@gmail.com, mperttunen@nvidia.com, jonathanh@nvidia.com
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 01/11] drm/fb-helper: Add helpers for struct drm_client_funcs
Date: Tue,  7 May 2024 13:58:22 +0200
Message-ID: <20240507120422.25492-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240507120422.25492-1-tzimmermann@suse.de>
References: <20240507120422.25492-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-1.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 ARC_NA(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 TAGGED_RCPT(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,drm_fb_helper.info:url,suse.de:email];
 RCPT_COUNT_TWELVE(0.00)[31]; MIME_TRACE(0.00)[0:+];
 TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[]; FROM_HAS_DN(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 FREEMAIL_TO(0.00)[redhat.com,ffwll.ch,linux.intel.com,kernel.org,samsung.com,armlinux.org.uk,gmail.com,intel.com,ursulin.net,quicinc.com,linaro.org,poorly.run,somainline.org,ideasonboard.com,amd.com,nvidia.com];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 R_RATELIMIT(0.00)[to_ip_from(RLsz1b6kfjnxepzm54dz9rbnku)];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Score: -1.30
X-Spam-Flag: NO
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

Add default implementations for unregister, restore and hotplug of
struct drm_client_funcs. The provided helpers are compatible with the
requirements of most DRM drivers.

The helpers handle support for VGA switcheroo automatically. With
DRM drivers that don't implement VGA switcheroo, this does nothing.

The helpers also support DRM drivers with non-atomic mode setting,
which require additional steps to disable their modesetting pipeline.

Compared to its current implementations in various drivers, there
is one difference in drm_fbdev_helper_client_hotplug(). The custom
functions perform hotpluging if struct drm_device.fb_helper has been
set, while the custom helper tests for struct drm_fb_helper.info.
Both fields signal the presence of an active fbdev emulation, but
the former field is deprecated.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_fb_helper.c | 103 ++++++++++++++++++++++++++++++++
 include/drm/drm_fb_helper.h     |  19 ++++++
 2 files changed, 122 insertions(+)

diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index e2e19f49342e1..005debf61a571 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -35,6 +35,7 @@
 #include <linux/vga_switcheroo.h>
 
 #include <drm/drm_atomic.h>
+#include <drm/drm_crtc_helper.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_fourcc.h>
@@ -2013,3 +2014,105 @@ void drm_fb_helper_output_poll_changed(struct drm_device *dev)
 	drm_fb_helper_hotplug_event(dev->fb_helper);
 }
 EXPORT_SYMBOL(drm_fb_helper_output_poll_changed);
+
+/*
+ * struct drm_client_funcs
+ */
+
+/**
+ * drm_fbdev_helper_client_unregister - Unregister callback for fbdev emulation
+ * @client: The fbdev client
+ *
+ * Implements struct drm_client_funcs.unregister for fbdev emulation. The
+ * helper destroys the framebuffer device and releases all resources. It
+ * further disables all outputs and clears the VGA switcheroo framebuffer
+ * info for PCI devices.
+ */
+void drm_fbdev_helper_client_unregister(struct drm_client_dev *client)
+{
+	struct drm_fb_helper *fb_helper = drm_fb_helper_from_client(client);
+	struct drm_device *dev = fb_helper->dev;
+
+	if (fb_helper->info) {
+		if (dev_is_pci(dev->dev))
+			vga_switcheroo_client_fb_set(to_pci_dev(dev->dev), NULL);
+		drm_fb_helper_unregister_info(fb_helper);
+		if (!drm_drv_uses_atomic_modeset(dev))
+			drm_helper_force_disable_all(dev);
+	} else {
+		drm_client_release(client);
+		drm_fb_helper_unprepare(fb_helper);
+		kfree(fb_helper);
+	}
+}
+EXPORT_SYMBOL(drm_fbdev_helper_client_unregister);
+
+/**
+ * drm_fbdev_helper_client_restore - Restore callback for fbdev emulation
+ * @client: The fbdev client
+ *
+ * Implements struct drm_client_funcs.restore for fbdev emulation. The
+ * helper restores the console output after the fbdev emulation's current
+ * configuration. It also informs VGA switcheroo about the change.
+ *
+ * Returns:
+ * 0 on success, or a negative errno code otherwise.
+ */
+int drm_fbdev_helper_client_restore(struct drm_client_dev *client)
+{
+	struct drm_device *dev = client->dev;
+
+	drm_fb_helper_lastclose(dev);
+
+	if (dev_is_pci(dev->dev))
+		vga_switcheroo_process_delayed_switch();
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_fbdev_helper_client_restore);
+
+/**
+ * drm_fbdev_helper_client_hotplug - Hotplug callback for fbdev emulation
+ * @client: The fbdev client
+ *
+ * Implements struct drm_client_funcs.hotplug for fbdev emulation. The
+ * helper handles the hotplugging event by restoring the display output.
+ * If no output has been established yet, it instead performs an initial
+ * display configuration. On successful configuration, it installs the
+ * framebuffer info VGA switcheroo for PCI devices.
+ *
+ * Returns:
+ * 0 on success, or a negative errno code otherwise.
+ */
+int drm_fbdev_helper_client_hotplug(struct drm_client_dev *client)
+{
+	struct drm_fb_helper *fb_helper = drm_fb_helper_from_client(client);
+	struct drm_device *dev = client->dev;
+	int ret;
+
+	if (fb_helper->info)
+		return drm_fb_helper_hotplug_event(fb_helper);
+
+	ret = drm_fb_helper_init(dev, fb_helper);
+	if (ret)
+		goto err_drm_err;
+
+	if (!drm_drv_uses_atomic_modeset(dev))
+		drm_helper_disable_unused_functions(dev);
+
+	ret = drm_fb_helper_initial_config(fb_helper);
+	if (ret)
+		goto err_drm_fb_helper_fini;
+
+	if (dev_is_pci(dev->dev))
+		vga_switcheroo_client_fb_set(to_pci_dev(dev->dev), fb_helper->info);
+
+	return 0;
+
+err_drm_fb_helper_fini:
+	drm_fb_helper_fini(fb_helper);
+err_drm_err:
+	drm_err(dev, "Failed to setup fbdev emulation (ret=%d)\n", ret);
+	return ret;
+}
+EXPORT_SYMBOL(drm_fbdev_helper_client_hotplug);
diff --git a/include/drm/drm_fb_helper.h b/include/drm/drm_fb_helper.h
index 375737fd6c36e..c3e8156e5f963 100644
--- a/include/drm/drm_fb_helper.h
+++ b/include/drm/drm_fb_helper.h
@@ -407,4 +407,23 @@ static inline void drm_fb_helper_output_poll_changed(struct drm_device *dev)
 }
 #endif
 
+/*
+ * struct drm_client_funcs
+ */
+
+void drm_fbdev_helper_client_unregister(struct drm_client_dev *client);
+int drm_fbdev_helper_client_restore(struct drm_client_dev *client);
+int drm_fbdev_helper_client_hotplug(struct drm_client_dev *client);
+
+/**
+ * DRM_FBDEV_HELPER_CLIENT_FUNCS - Initializer macro for struct drm_client_funcs
+ *
+ * Initializes an instance of struct drm_client_funcs to default values
+ * for framebuffer emulation.
+ */
+#define DRM_FBDEV_HELPER_CLIENT_FUNCS \
+	.unregister	= drm_fbdev_helper_client_unregister, \
+	.restore	= drm_fbdev_helper_client_restore, \
+	.hotplug	= drm_fbdev_helper_client_hotplug
+
 #endif
-- 
2.44.0

