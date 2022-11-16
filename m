Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B02062C395
	for <lists+dri-devel@lfdr.de>; Wed, 16 Nov 2022 17:09:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C45A10E4D0;
	Wed, 16 Nov 2022 16:09:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EA3510E4CD
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Nov 2022 16:09:21 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A0ECE22007;
 Wed, 16 Nov 2022 16:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1668614959; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JvpkM/izKLg/21KkJFaBuVIiv7yNiLWLCJaB7tUbxI0=;
 b=xbTx6S29otT1wtF2RG9cfNoIzfujQI6ujaxR/9+/Njcjf+yoU2kRZHIMR0EUdcnWqgZPZV
 gT8MPo5Bsr6ll+53UmMqOxWFyVVtEWZpB7JyBfx9Mz4g07Lpv2/KW2xys67icn7ytk46Hw
 Amvyad/1evaS0bYphGRBnYbhPp2Njd4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1668614959;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JvpkM/izKLg/21KkJFaBuVIiv7yNiLWLCJaB7tUbxI0=;
 b=YyAmPt1ZTKalg7VqwIV/Trb17TsX9k3iCqlxIO0LJLaf/bx2KUStm2PgDeRerQga+c5IjG
 vcYNwfnnkTh0A5Bw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5815D134CE;
 Wed, 16 Nov 2022 16:09:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id yE6nFC8LdWP/fwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 16 Nov 2022 16:09:19 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@gmail.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, xinliang.liu@linaro.org,
 tiantao6@hisilicon.com, jstultz@google.com, kong.kongxinwei@hisilicon.com,
 puck.chen@hisilicon.com, paul.kocialkowski@bootlin.com, javierm@redhat.com,
 airlied@redhat.com, kraxel@redhat.com
Subject: [PATCH 2/7] drm/logicvc: Fix preferred fbdev cpp
Date: Wed, 16 Nov 2022 17:09:12 +0100
Message-Id: <20221116160917.26342-3-tzimmermann@suse.de>
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

Logicvc can have different values for the preferred color depth. Set
the fbdev bpp value depending on the runtime value.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/logicvc/logicvc_drm.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/logicvc/logicvc_drm.c b/drivers/gpu/drm/logicvc/logicvc_drm.c
index 9de24d9f0c963..d9cd5d967e31f 100644
--- a/drivers/gpu/drm/logicvc/logicvc_drm.c
+++ b/drivers/gpu/drm/logicvc/logicvc_drm.c
@@ -301,6 +301,7 @@ static int logicvc_drm_probe(struct platform_device *pdev)
 	struct regmap *regmap = NULL;
 	struct resource res;
 	void __iomem *base;
+	unsigned int preferred_bpp;
 	int irq;
 	int ret;
 
@@ -438,7 +439,18 @@ static int logicvc_drm_probe(struct platform_device *pdev)
 		goto error_mode;
 	}
 
-	drm_fbdev_generic_setup(drm_dev, drm_dev->mode_config.preferred_depth);
+	switch (drm_dev->mode_config.preferred_depth) {
+	case 15:
+	case 16:
+		preferred_bpp = 16;
+		break;
+	case 24:
+	case 32:
+	default:
+		preferred_bpp = 32;
+		break;
+	}
+	drm_fbdev_generic_setup(drm_dev, preferred_bpp);
 
 	return 0;
 
-- 
2.38.1

