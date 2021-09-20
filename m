Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 116A6411675
	for <lists+dri-devel@lfdr.de>; Mon, 20 Sep 2021 16:11:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29D366E509;
	Mon, 20 Sep 2021 14:10:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C10B6E50B
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Sep 2021 14:10:55 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B882C200DD;
 Mon, 20 Sep 2021 14:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1632147053; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TqfJe6tC7Kl8Za+0Cr/21CLGdZhA6wWv3nW/5hYf+/I=;
 b=CEw7O38akbZ4Auu5OWZVHXR9DNzjFJdS5RPOey14SFAywromrH8jC0ebZHTvDne/XvAERW
 8BH46NjgOXM5MxUZLKDJ2JzPtgD5s4JklNhpIzhsNuBAAnuDmVAgpaEfVmJS13I1c+G6AW
 1I2HQa6h0mcJz/8ZXkyRuRTftUORCqU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1632147053;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TqfJe6tC7Kl8Za+0Cr/21CLGdZhA6wWv3nW/5hYf+/I=;
 b=WzePvy8Nd5DPLuOE5N1k4PdJ3tqsojWBA0DmgG+nG/t6nvmph6qUfh/3EtsUX9DzIKHctT
 D0NlJ55j8krEuTBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9946913A71;
 Mon, 20 Sep 2021 14:10:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 0AA4JG2WSGG0cgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 20 Sep 2021 14:10:53 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: patrik.r.jakobsson@gmail.com,
	airlied@linux.ie,
	daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 5/5] drm/gma500: Managed device release
Date: Mon, 20 Sep 2021 16:10:51 +0200
Message-Id: <20210920141051.30988-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210920141051.30988-1-tzimmermann@suse.de>
References: <20210920141051.30988-1-tzimmermann@suse.de>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Set up a clean-up action to automatically release device resources
during driver shutdown. Remove manual release code.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/gma500/psb_drv.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/gma500/psb_drv.c b/drivers/gpu/drm/gma500/psb_drv.c
index cef9fb6a06d2..3d036d2a3b29 100644
--- a/drivers/gpu/drm/gma500/psb_drv.c
+++ b/drivers/gpu/drm/gma500/psb_drv.c
@@ -220,6 +220,13 @@ static void psb_driver_unload(struct drm_device *dev)
 	gma_power_uninit(dev);
 }
 
+static void psb_device_release(void *data)
+{
+	struct drm_device *dev = data;
+
+	psb_driver_unload(dev);
+}
+
 static int psb_driver_load(struct drm_device *dev, unsigned long flags)
 {
 	struct pci_dev *pdev = to_pci_dev(dev->dev);
@@ -400,8 +407,9 @@ static int psb_driver_load(struct drm_device *dev, unsigned long flags)
 	pm_runtime_enable(dev->dev);
 	pm_runtime_set_active(dev->dev);
 #endif
-	/* Intel drm driver load is done, continue doing pvr load */
-	return 0;
+
+	return devm_add_action_or_reset(dev->dev, psb_device_release, dev);
+
 out_err:
 	psb_driver_unload(dev);
 	return ret;
@@ -457,13 +465,9 @@ static int psb_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 
 	ret = drm_dev_register(dev, ent->driver_data);
 	if (ret)
-		goto err_psb_driver_unload;
+		return ret;
 
 	return 0;
-
-err_psb_driver_unload:
-	psb_driver_unload(dev);
-	return ret;
 }
 
 static void psb_pci_remove(struct pci_dev *pdev)
@@ -471,7 +475,6 @@ static void psb_pci_remove(struct pci_dev *pdev)
 	struct drm_device *dev = pci_get_drvdata(pdev);
 
 	drm_dev_unregister(dev);
-	psb_driver_unload(dev);
 }
 
 static const struct dev_pm_ops psb_pm_ops = {
-- 
2.33.0

