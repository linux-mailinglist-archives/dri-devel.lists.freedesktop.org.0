Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A936A635C3E
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 12:54:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC8FB10E544;
	Wed, 23 Nov 2022 11:54:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78BB810E2D3
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 11:53:53 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 24A1A1F8C9;
 Wed, 23 Nov 2022 11:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1669204432; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Rd629cJKpTWnShessI5CnK7kLhqYmet7OX4ME+FxVCc=;
 b=b6dj5AAHzO6dzHqLsMv1GzEQ/wUpcG1Dge4EQx3rs7+xq7CNDI/GRMJer2BZZj+lfRKK9l
 3mJHJh5riQeLZAFFtnLv8iFYyAy8+Niwluhbv/h8NEn+Vpiz7s1c701PYblVKZCl7M8zR5
 MhYEz9QF5w208kIs86aajh+esUS03E8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1669204432;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Rd629cJKpTWnShessI5CnK7kLhqYmet7OX4ME+FxVCc=;
 b=zaKuG3HU3hzT5+CDUmXJFH/VntoBQOUjfeXt/TA10oc/Z64b0v2fRQU7yVnY20GC+MnBlR
 2AX3HyxT4JSkdXAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C2E1813AE7;
 Wed, 23 Nov 2022 11:53:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id YN/NLs8JfmMwVwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 23 Nov 2022 11:53:51 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@gmail.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, xinliang.liu@linaro.org,
 tiantao6@hisilicon.com, jstultz@google.com, kong.kongxinwei@hisilicon.com,
 puck.chen@hisilicon.com, paul.kocialkowski@bootlin.com, javierm@redhat.com,
 airlied@redhat.com, kraxel@redhat.com
Subject: [PATCH v2 4/7] drm/ofdrm: Set preferred depth from format of scanout
 buffer
Date: Wed, 23 Nov 2022 12:53:45 +0100
Message-Id: <20221123115348.2521-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221123115348.2521-1-tzimmermann@suse.de>
References: <20221123115348.2521-1-tzimmermann@suse.de>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Set the preferred depth from the format of the scanout buffer. The
value cannot be hardcoded, as the scanout buffer is only known at
runtime. Keeping the existing switch statement just duplicates the
driver's existing logic for format detection.

Also remove the FIXME comment from the call to drm_fbdev_generic_setup()
as the driver now handles color depth and bpp values correctly.

v2:
	* fix commit-message typo

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
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

