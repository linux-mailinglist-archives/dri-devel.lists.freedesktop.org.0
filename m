Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A84657B883
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jul 2022 16:28:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6526F8BF0A;
	Wed, 20 Jul 2022 14:28:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBA2F8B03A
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jul 2022 14:27:41 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2974533B4B;
 Wed, 20 Jul 2022 14:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1658327257; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QYYN3Ovi5RWR1IrEvWTkZ8r4xqCUz9Gl6//yUK5ESrQ=;
 b=PL64OI9MOx+Ug1dYO36x8kBB5KbsdvpYjacrpVBz76wME7UXhQl5PyY4fvOeQtxqkaFkxq
 6QP+ciQj22q0EyMAYl+PWFP+xlxH2e4CIprj/7e9nIeQ2C+jllX+Mgv+3bftjVKkUxAkve
 rekP0SnfUuPJkkd+4ons/VcwosDWXGY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1658327257;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QYYN3Ovi5RWR1IrEvWTkZ8r4xqCUz9Gl6//yUK5ESrQ=;
 b=ccim5dWbukDSTwM/hzLMdJoddzuK22KUBjjQuyIkOAl3UdjeOtOnOFhlfNo3j1mA6AKeBU
 1agv7KyYVBjjOkDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C7C3C13AAD;
 Wed, 20 Jul 2022 14:27:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id aDvwL9gQ2GLfHgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 20 Jul 2022 14:27:36 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, airlied@linux.ie, daniel@ffwll.ch, deller@gmx.de,
 maxime@cerno.tech, sam@ravnborg.org, msuchanek@suse.de, mpe@ellerman.id.au,
 benh@kernel.crashing.org, paulus@samba.org, geert@linux-m68k.org,
 mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 09/10] drm/ofdrm: Add per-model device function
Date: Wed, 20 Jul 2022 16:27:31 +0200
Message-Id: <20220720142732.32041-10-tzimmermann@suse.de>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220720142732.32041-1-tzimmermann@suse.de>
References: <20220720142732.32041-1-tzimmermann@suse.de>
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

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/tiny/ofdrm.c | 121 +++++++++++++++++++++++++++++++++++
 1 file changed, 121 insertions(+)

diff --git a/drivers/gpu/drm/tiny/ofdrm.c b/drivers/gpu/drm/tiny/ofdrm.c
index ad673c9b5502..62136b8ab975 100644
--- a/drivers/gpu/drm/tiny/ofdrm.c
+++ b/drivers/gpu/drm/tiny/ofdrm.c
@@ -29,6 +29,18 @@
 #define DRIVER_MAJOR	1
 #define DRIVER_MINOR	0
 
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
@@ -150,14 +162,62 @@ static u64 display_get_address_of(struct drm_device *dev, struct device_node *of
 	return address;
 }
 
+static bool is_avivo(__be32 vendor, __be32 device)
+{
+	/* This will match most R5xx */
+	return (vendor == 0x1002) &&
+	       ((device >= 0x7100 && device < 0x7800) || (device >= 0x9400));
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
 	/* firmware framebuffer */
 	struct drm_fwfb fwfb;
 
@@ -489,12 +549,40 @@ static const struct drm_mode_config_funcs ofdrm_mode_config_funcs = {
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
 static struct ofdrm_device *ofdrm_device_create(struct drm_driver *drv,
 						struct platform_device *pdev)
 {
 	struct device_node *of_node = pdev->dev.of_node;
 	struct ofdrm_device *odev;
 	struct drm_device *dev;
+	enum ofdrm_model model;
 	int width, height, linebytes;
 	const struct drm_format_info *format;
 	u64 address;
@@ -525,6 +613,39 @@ static struct ofdrm_device *ofdrm_device_create(struct drm_driver *drv,
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
2.36.1

