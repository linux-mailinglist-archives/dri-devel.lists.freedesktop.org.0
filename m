Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 72A295FB699
	for <lists+dri-devel@lfdr.de>; Tue, 11 Oct 2022 17:07:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D930C10E83E;
	Tue, 11 Oct 2022 15:07:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84C1F10E831
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Oct 2022 15:07:18 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0A20320123;
 Tue, 11 Oct 2022 15:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1665500837; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yV0+I3qPqQz4zObE1It162Rbzz/bRUWnIf/5KtHaSrk=;
 b=NblE2sAl96EqPy8iszt4n8hLZbgNESGCEgtzwFP3zxcRa/CT0BG3eiurv3xf5wYyYA028S
 sqnD+WBT9gM7tBOvworK9yqwc2EKOlSU3Kvh0kou0yBI7BEdtfFe/tNeCH0itVyLipMCQb
 1q5qz4/kwV3WWrX8Xdw5arW4tCZIzmA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1665500837;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yV0+I3qPqQz4zObE1It162Rbzz/bRUWnIf/5KtHaSrk=;
 b=n+Ss6kZ1mmkWbDvHqMB9vsaB2RivxMl1Pg4HAVbbC9a1ep+jbKpLTD4A/8ZD7P/+sQrVqE
 QxcJuFUCpzUUfTBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5B93213ACA;
 Tue, 11 Oct 2022 15:07:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id +KTHE6SGRWPUTAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 11 Oct 2022 15:07:16 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, airlied@linux.ie, daniel@ffwll.ch, deller@gmx.de,
 maxime@cerno.tech, sam@ravnborg.org, msuchanek@suse.de,
 benh@kernel.crashing.org, paulus@samba.org, geert@linux-m68k.org,
 mark.cave-ayland@ilande.co.uk
Subject: [PATCH v5 3/5] drm/ofdrm: Add per-model device function
Date: Tue, 11 Oct 2022 17:07:10 +0200
Message-Id: <20221011150712.3928-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221011150712.3928-1-tzimmermann@suse.de>
References: <20221011150712.3928-1-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a per-model device-function structure in preparation of adding
color-management support. Detection of the individual models has been
taken from fbdev's offb.

v3:
	* define constants for PCI ids (Javier)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/gpu/drm/tiny/ofdrm.c | 125 +++++++++++++++++++++++++++++++++++
 1 file changed, 125 insertions(+)

diff --git a/drivers/gpu/drm/tiny/ofdrm.c b/drivers/gpu/drm/tiny/ofdrm.c
index 6782589ff9fa..a0282a077238 100644
--- a/drivers/gpu/drm/tiny/ofdrm.c
+++ b/drivers/gpu/drm/tiny/ofdrm.c
@@ -28,6 +28,21 @@
 #define DRIVER_MAJOR	1
 #define DRIVER_MINOR	0
 
+#define PCI_VENDOR_ID_ATI_R520	0x7100
+#define PCI_VENDOR_ID_ATI_R600	0x9400
+
+enum ofdrm_model {
+	OFDRM_MODEL_UNKNOWN,
+	OFDRM_MODEL_MACH64, /* ATI Mach64 */
+	OFDRM_MODEL_RAGE128, /* ATI Rage128 */
+	OFDRM_MODEL_RAGE_M3A, /* ATI Rage Mobility M3 Head A */
+	OFDRM_MODEL_RAGE_M3B, /* ATI Rage Mobility M3 Head B */
+	OFDRM_MODEL_RADEON, /* ATI Radeon */
+	OFDRM_MODEL_GXT2000, /* IBM GXT2000 */
+	OFDRM_MODEL_AVIVO, /* ATI R5xx */
+	OFDRM_MODEL_QEMU, /* QEMU VGA */
+};
+
 /*
  * Helpers for display nodes
  */
@@ -148,14 +163,63 @@ static u64 display_get_address_of(struct drm_device *dev, struct device_node *of
 	return address;
 }
 
+static bool is_avivo(__be32 vendor, __be32 device)
+{
+	/* This will match most R5xx */
+	return (vendor == PCI_VENDOR_ID_ATI) &&
+	       ((device >= PCI_VENDOR_ID_ATI_R520 && device < 0x7800) ||
+		(PCI_VENDOR_ID_ATI_R600 >= 0x9400));
+}
+
+static enum ofdrm_model display_get_model_of(struct drm_device *dev, struct device_node *of_node)
+{
+	enum ofdrm_model model = OFDRM_MODEL_UNKNOWN;
+
+	if (of_node_name_prefix(of_node, "ATY,Rage128")) {
+		model = OFDRM_MODEL_RAGE128;
+	} else if (of_node_name_prefix(of_node, "ATY,RageM3pA") ||
+		   of_node_name_prefix(of_node, "ATY,RageM3p12A")) {
+		model = OFDRM_MODEL_RAGE_M3A;
+	} else if (of_node_name_prefix(of_node, "ATY,RageM3pB")) {
+		model = OFDRM_MODEL_RAGE_M3B;
+	} else if (of_node_name_prefix(of_node, "ATY,Rage6")) {
+		model = OFDRM_MODEL_RADEON;
+	} else if (of_node_name_prefix(of_node, "ATY,")) {
+		return OFDRM_MODEL_MACH64;
+	} else if (of_device_is_compatible(of_node, "pci1014,b7") ||
+		   of_device_is_compatible(of_node, "pci1014,21c")) {
+		model = OFDRM_MODEL_GXT2000;
+	} else if (of_node_name_prefix(of_node, "vga,Display-")) {
+		struct device_node *of_parent;
+		const __be32 *vendor_p, *device_p;
+
+		/* Look for AVIVO initialized by SLOF */
+		of_parent = of_get_parent(of_node);
+		vendor_p = of_get_property(of_parent, "vendor-id", NULL);
+		device_p = of_get_property(of_parent, "device-id", NULL);
+		if (vendor_p && device_p && is_avivo(*vendor_p, *device_p))
+			model = OFDRM_MODEL_AVIVO;
+		of_node_put(of_parent);
+	} else if (of_device_is_compatible(of_node, "qemu,std-vga")) {
+		model = OFDRM_MODEL_QEMU;
+	}
+
+	return model;
+}
+
 /*
  * Open Firmware display device
  */
 
+struct ofdrm_device_funcs {
+};
+
 struct ofdrm_device {
 	struct drm_device dev;
 	struct platform_device *pdev;
 
+	const struct ofdrm_device_funcs *funcs;
+
 	/* firmware-buffer settings */
 	struct iosys_map screen_base;
 	struct drm_display_mode mode;
@@ -522,6 +586,33 @@ static const struct drm_mode_config_funcs ofdrm_mode_config_funcs = {
  * Init / Cleanup
  */
 
+static const struct ofdrm_device_funcs ofdrm_unknown_device_funcs = {
+};
+
+static const struct ofdrm_device_funcs ofdrm_mach64_device_funcs = {
+};
+
+static const struct ofdrm_device_funcs ofdrm_rage128_device_funcs = {
+};
+
+static const struct ofdrm_device_funcs ofdrm_rage_m3a_device_funcs = {
+};
+
+static const struct ofdrm_device_funcs ofdrm_rage_m3b_device_funcs = {
+};
+
+static const struct ofdrm_device_funcs ofdrm_radeon_device_funcs = {
+};
+
+static const struct ofdrm_device_funcs ofdrm_gxt2000_device_funcs = {
+};
+
+static const struct ofdrm_device_funcs ofdrm_avivo_device_funcs = {
+};
+
+static const struct ofdrm_device_funcs ofdrm_qemu_device_funcs = {
+};
+
 static struct drm_display_mode ofdrm_mode(unsigned int width, unsigned int height)
 {
 	/*
@@ -543,6 +634,7 @@ static struct ofdrm_device *ofdrm_device_create(struct drm_driver *drv,
 	struct device_node *of_node = pdev->dev.of_node;
 	struct ofdrm_device *odev;
 	struct drm_device *dev;
+	enum ofdrm_model model;
 	int width, height, depth, linebytes;
 	const struct drm_format_info *format;
 	u64 address;
@@ -571,6 +663,39 @@ static struct ofdrm_device *ofdrm_device_create(struct drm_driver *drv,
 	 * OF display-node settings
 	 */
 
+	model = display_get_model_of(dev, of_node);
+	drm_dbg(dev, "detected model %d\n", model);
+
+	switch (model) {
+	case OFDRM_MODEL_UNKNOWN:
+		odev->funcs = &ofdrm_unknown_device_funcs;
+		break;
+	case OFDRM_MODEL_MACH64:
+		odev->funcs = &ofdrm_mach64_device_funcs;
+		break;
+	case OFDRM_MODEL_RAGE128:
+		odev->funcs = &ofdrm_rage128_device_funcs;
+		break;
+	case OFDRM_MODEL_RAGE_M3A:
+		odev->funcs = &ofdrm_rage_m3a_device_funcs;
+		break;
+	case OFDRM_MODEL_RAGE_M3B:
+		odev->funcs = &ofdrm_rage_m3b_device_funcs;
+		break;
+	case OFDRM_MODEL_RADEON:
+		odev->funcs = &ofdrm_radeon_device_funcs;
+		break;
+	case OFDRM_MODEL_GXT2000:
+		odev->funcs = &ofdrm_gxt2000_device_funcs;
+		break;
+	case OFDRM_MODEL_AVIVO:
+		odev->funcs = &ofdrm_avivo_device_funcs;
+		break;
+	case OFDRM_MODEL_QEMU:
+		odev->funcs = &ofdrm_qemu_device_funcs;
+		break;
+	}
+
 	width = display_get_width_of(dev, of_node);
 	if (width < 0)
 		return ERR_PTR(width);
-- 
2.37.3

