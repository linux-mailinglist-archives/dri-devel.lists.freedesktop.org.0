Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC1562C389
	for <lists+dri-devel@lfdr.de>; Wed, 16 Nov 2022 17:09:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FD2E10E4CC;
	Wed, 16 Nov 2022 16:09:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B953F10E4C9
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Nov 2022 16:09:21 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4D6062203F;
 Wed, 16 Nov 2022 16:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1668614960; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QpFg57uaO3k6oQDrIfrjJW24gsDaItE1JZavsRjFAWo=;
 b=bOq9fa7TFYsUxjFrOuGCk43TyxMQ6PedIc9aF/6ayY8dwK5Ywrv1HfYlnqktTlqD4rY3YN
 mqc5/xgu0vnTg0urPS1p+G9Xj0y3pNE6k8EsPakoReJCTQlTpWZkcFRU/l0E9OnZ9bWSWr
 DQ3i3psKcx2OzywghnDenckk6yYN2a0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1668614960;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QpFg57uaO3k6oQDrIfrjJW24gsDaItE1JZavsRjFAWo=;
 b=Rruls1MuKnXgwFOqW9vCKrUTTkMHa9bYfBInBFuIWem96B2mTaedhX0sW9HuPm9dvfn0O2
 KP40Rah4fjgUW8AA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 044EB134CE;
 Wed, 16 Nov 2022 16:09:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id gO42ADALdWP/fwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 16 Nov 2022 16:09:20 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@gmail.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, xinliang.liu@linaro.org,
 tiantao6@hisilicon.com, jstultz@google.com, kong.kongxinwei@hisilicon.com,
 puck.chen@hisilicon.com, paul.kocialkowski@bootlin.com, javierm@redhat.com,
 airlied@redhat.com, kraxel@redhat.com
Subject: [PATCH 4/7] drm/ofdrm: Set preferred depth from format of scanout
 buffer
Date: Wed, 16 Nov 2022 17:09:14 +0100
Message-Id: <20221116160917.26342-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221116160917.26342-1-tzimmermann@suse.de>
References: <20221116160917.26342-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Set the preferred depth from the format of the scanout buffer. The
value cannot be hardcoded, as the scanout buffer's is only known at
runtime. Keeping the existing switch statement just duplicates the
driver's existing logic for format detection.

Also remove the FIXME comment from the call to drm_fbdev_generic_setup()
as the driver now handles color depth and bpp values correctly.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/tiny/ofdrm.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/tiny/ofdrm.c b/drivers/gpu/drm/tiny/ofdrm.c
index dc9e4d71b12ae..33eefeba437c5 100644
--- a/drivers/gpu/drm/tiny/ofdrm.c
+++ b/drivers/gpu/drm/tiny/ofdrm.c
@@ -1284,14 +1284,7 @@ static struct ofdrm_device *ofdrm_device_create(struct drm_driver *drv,
 	dev->mode_config.min_height = height;
 	dev->mode_config.max_height = max_height;
 	dev->mode_config.funcs = &ofdrm_mode_config_funcs;
-	switch (depth) {
-	case 32:
-		dev->mode_config.preferred_depth = 24;
-		break;
-	default:
-		dev->mode_config.preferred_depth = depth;
-		break;
-	}
+	dev->mode_config.preferred_depth = format->depth;
 	dev->mode_config.quirk_addfb_prefer_host_byte_order = true;
 
 	/* Primary plane */
@@ -1390,10 +1383,6 @@ static int ofdrm_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	/*
-	 * FIXME: 24-bit color depth does not work reliably with a 32-bpp
-	 * value. Force the bpp value of the scanout buffer's format.
-	 */
 	drm_fbdev_generic_setup(dev, drm_format_info_bpp(odev->format, 0));
 
 	return 0;
-- 
2.38.1

