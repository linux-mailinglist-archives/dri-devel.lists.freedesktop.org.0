Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 306AE56A727
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jul 2022 17:40:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D681E112B46;
	Thu,  7 Jul 2022 15:40:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F0A8112020
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Jul 2022 15:40:02 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 94D6A1FF5E;
 Thu,  7 Jul 2022 15:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1657208400; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=maoI6QoYjMRAWl9rx1IxBtiv9tS6pyedkoAqsEdLpSs=;
 b=IoJGptd4HquIdbCOoIESidlhMYrMDlNsjGPf0dZD58Y5BCSTwA+62ZMZ7+Bxk8OoAfzJPG
 +Uj6QKNic8ybrTinOn5aTqJ6L+iPjuC5pUfjgF7kAlf8Db9yn8iiUlTX8r8wwSVkGKhlwF
 Hy1POmxzVQrM6iCSKTd1hcfcZ7G2M5U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1657208400;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=maoI6QoYjMRAWl9rx1IxBtiv9tS6pyedkoAqsEdLpSs=;
 b=qg+MloWynP9QxuiNdXey4ydTcm5z7puRr0O902lvHrQps0epiIbpbGbXz72vrLcflm0nvF
 b96QfYRaCaWFT4BA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6352E13B4E;
 Thu,  7 Jul 2022 15:40:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id IBNlF1D+xmI9UQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 07 Jul 2022 15:40:00 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, deller@gmx.de, daniel@ffwll.ch, sam@ravnborg.org,
 maxime@cerno.tech
Subject: [PATCH 10/11] fbdev: Acquire framebuffer apertures for firmware
 devices
Date: Thu,  7 Jul 2022 17:39:51 +0200
Message-Id: <20220707153952.32264-11-tzimmermann@suse.de>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220707153952.32264-1-tzimmermann@suse.de>
References: <20220707153952.32264-1-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When registering a generic framebuffer, automatically acquire ownership
of the framebuffer's I/O range. The device will now be handled by the
aperture helpers. Fbdev-based conflict handling is no longer required.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/core/fbmem.c | 33 ++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
index 2237049327db..e556ad69f48f 100644
--- a/drivers/video/fbdev/core/fbmem.c
+++ b/drivers/video/fbdev/core/fbmem.c
@@ -13,6 +13,7 @@
 
 #include <linux/module.h>
 
+#include <linux/aperture.h>
 #include <linux/compat.h>
 #include <linux/types.h>
 #include <linux/errno.h>
@@ -1739,6 +1740,32 @@ static void do_unregister_framebuffer(struct fb_info *fb_info)
 	put_fb_info(fb_info);
 }
 
+static int fbm_aperture_acquire_for_platform_device(struct fb_info *fb_info)
+{
+	struct apertures_struct *ap = fb_info->apertures;
+	struct device *dev = fb_info->device;
+	struct platform_device *pdev;
+	unsigned int i;
+	int ret;
+
+	if (!ap)
+		return 0;
+
+	if (!dev_is_platform(dev))
+		return 0;
+
+	pdev = to_platform_device(dev);
+
+	for (ret = 0, i = 0; i < ap->count; ++i) {
+		ret = devm_aperture_acquire_for_platform_device(pdev, ap->ranges[i].base,
+								ap->ranges[i].size);
+		if (ret)
+			break;
+	}
+
+	return ret;
+}
+
 /**
  * remove_conflicting_framebuffers - remove firmware-configured framebuffers
  * @a: memory range, users of which are to be removed
@@ -1789,6 +1816,12 @@ register_framebuffer(struct fb_info *fb_info)
 {
 	int ret;
 
+	if (fb_info->flags & FBINFO_MISC_FIRMWARE) {
+		ret = fbm_aperture_acquire_for_platform_device(fb_info);
+		if (ret)
+			return ret;
+	}
+
 	mutex_lock(&registration_lock);
 	ret = do_register_framebuffer(fb_info);
 	mutex_unlock(&registration_lock);
-- 
2.36.1

