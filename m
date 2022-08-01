Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0EEA586C83
	for <lists+dri-devel@lfdr.de>; Mon,  1 Aug 2022 16:03:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD548C4329;
	Mon,  1 Aug 2022 13:57:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FB0DC2AAA
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Aug 2022 13:50:33 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C87DB66F62;
 Mon,  1 Aug 2022 13:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1659361831; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=i+Ukcq0L/VDgL6LldtANlmqa+RYUdHWOf9CIBxm5wH4=;
 b=eSPyOSRfN2dZKBqQSzr/fRfPV294LcJRWKpSwiv1bgxi7DZnNxOLy07K4GAzMIrBwVbEFR
 7sO00dwhF3ZWxbpRuTu71pK3+rnYa9Q8KvDRzi3jLlnoclcqRW3f+fZA7yaxkOIQETQJmK
 iVeC3z4gIqJbO1hYZE9EShUz292d8U0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1659361831;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=i+Ukcq0L/VDgL6LldtANlmqa+RYUdHWOf9CIBxm5wH4=;
 b=psBnotvplcdrEe6dUs50/feWmmWySMqqHn9aUiKpr8esN15M/okoSNDxp1UpedzTR3czz5
 MiVJ3W66xETuI4Cw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A3A2413ADF;
 Mon,  1 Aug 2022 13:50:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id AKAfJyfa52IDRwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 01 Aug 2022 13:50:31 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, geert@linux-m68k.org, airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH v3 3/5] drm/simpledrm: Remove pdev field from device structure
Date: Mon,  1 Aug 2022 15:50:26 +0200
Message-Id: <20220801135028.30647-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220801135028.30647-1-tzimmermann@suse.de>
References: <20220801135028.30647-1-tzimmermann@suse.de>
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

Replace the remaining uses of the field pdev by upcasts from the Linux
device and remove the field.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/gpu/drm/tiny/simpledrm.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tiny/simpledrm.c
index f458e8bec63e..9d27608d7369 100644
--- a/drivers/gpu/drm/tiny/simpledrm.c
+++ b/drivers/gpu/drm/tiny/simpledrm.c
@@ -198,7 +198,6 @@ simplefb_get_format_of(struct drm_device *dev, struct device_node *of_node)
 
 struct simpledrm_device {
 	struct drm_device dev;
-	struct platform_device *pdev;
 
 	/* clocks */
 #if defined CONFIG_OF && defined CONFIG_COMMON_CLK
@@ -271,7 +270,7 @@ static void simpledrm_device_release_clocks(void *res)
 static int simpledrm_device_init_clocks(struct simpledrm_device *sdev)
 {
 	struct drm_device *dev = &sdev->dev;
-	struct platform_device *pdev = sdev->pdev;
+	struct platform_device *pdev = to_platform_device(dev->dev);
 	struct device_node *of_node = pdev->dev.of_node;
 	struct clk *clock;
 	unsigned int i;
@@ -369,7 +368,7 @@ static void simpledrm_device_release_regulators(void *res)
 static int simpledrm_device_init_regulators(struct simpledrm_device *sdev)
 {
 	struct drm_device *dev = &sdev->dev;
-	struct platform_device *pdev = sdev->pdev;
+	struct platform_device *pdev = to_platform_device(dev->dev);
 	struct device_node *of_node = pdev->dev.of_node;
 	struct property *prop;
 	struct regulator *regulator;
@@ -701,7 +700,6 @@ static struct simpledrm_device *simpledrm_device_create(struct drm_driver *drv,
 	if (IS_ERR(sdev))
 		return ERR_CAST(sdev);
 	dev = &sdev->dev;
-	sdev->pdev = pdev;
 	platform_set_drvdata(pdev, sdev);
 
 	/*
-- 
2.37.1

