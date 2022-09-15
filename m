Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B1A5B9DF4
	for <lists+dri-devel@lfdr.de>; Thu, 15 Sep 2022 17:04:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90DD810E1E4;
	Thu, 15 Sep 2022 15:03:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C835810E1E4
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Sep 2022 15:03:51 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 75A2F1F8FC;
 Thu, 15 Sep 2022 15:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1663254230; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=e3mGLuFa2qAO7sDPNfT5Ihf9SE2wyHzFWoDDucUXk7M=;
 b=Pj6WpeSjf6WVLjHpXhjHesN/Zrre6pV083szdVu3YQU3O1TibMkrWT0r/O5kJrkO59wyp4
 Z/e/qxyRkgQrZGUn5CzEb6cuRCmttI0xbr/9SqM9mEgHenzjZBvAQlP7qYlzuxFz6Hlx+J
 Mnyv7TsCdgNSFIArK3XvbkKE2rteO1Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1663254230;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=e3mGLuFa2qAO7sDPNfT5Ihf9SE2wyHzFWoDDucUXk7M=;
 b=UVwZpYOsfwbKYDdXl51qaKN80eD2A56nk9icIWmkizH77jnp+p8j8/7DS6YkAv6HNpNdmX
 SZKM0qVCpSEjX0Cw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 503EE133B6;
 Thu, 15 Sep 2022 15:03:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id EU+bEtY+I2MsCQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 15 Sep 2022 15:03:50 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, jfalempe@redhat.com,
 wangyugui@e16-tech.com
Subject: [PATCH] drm/mgag200: Force 32 bpp on the console
Date: Thu, 15 Sep 2022 17:03:48 +0200
Message-Id: <20220915150348.31504-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.37.3
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

G200ER does not seem to support 24 bpp, so force the console to
use 32 bpp. The problem was introduced, when commit 73f54d5d9682
("drm/mgag200: Remove special case for G200SE with <2 MiB") changed
the preferred color depth from 32 bit to 24 bit.

A setting of 24 is the correct color depth, but G200ER doesn't seem
to be able to use the respective RGB888 color format. Using 24-bit
color with forced 32 bpp works around the problem.

Reported-by: Wang Yugui <wangyugui@e16-tech.com>
Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Tested-by: Wang Yugui <wangyugui@e16-tech.com>
Fixes: 73f54d5d9682 ("drm/mgag200: Remove special case for G200SE with <2 MiB")
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Cc: Dave Airlie <airlied@redhat.com>
Cc: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/mgag200/mgag200_drv.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.c b/drivers/gpu/drm/mgag200/mgag200_drv.c
index 251a1bb648cc..a222bf76804f 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.c
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.c
@@ -262,7 +262,11 @@ mgag200_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	if (ret)
 		return ret;
 
-	drm_fbdev_generic_setup(dev, 0);
+	/*
+	 * FIXME: A 24-bit color depth does not work with 24 bpp on
+	 * G200ER. Force 32 bpp.
+	 */
+	drm_fbdev_generic_setup(dev, 32);
 
 	return 0;
 }
-- 
2.37.3

