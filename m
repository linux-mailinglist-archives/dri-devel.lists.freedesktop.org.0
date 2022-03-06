Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87E474CEDC3
	for <lists+dri-devel@lfdr.de>; Sun,  6 Mar 2022 21:36:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8769A10E659;
	Sun,  6 Mar 2022 20:36:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2EC910E668
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Mar 2022 20:36:23 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 365751F399;
 Sun,  6 Mar 2022 20:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1646598982; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LM4kNmPCGjM88JfHocNECEZYIaoosIp+2MKWIcST9CY=;
 b=GwR5iJmBjENR+9f9G0s8q37e14OV2PNv/3F9GwkPOa1IrrXMTBUmKDLRSmIfNMTQHj4jFs
 7vr089FMaRjDN002TaRz+TtfjDmbW3q72oJ8RNnAA15YR5PeM5QrPrq29/stqMcTAgyInG
 qAMbKDIlR63XVva/YV4EmenYLpLxR9k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1646598982;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LM4kNmPCGjM88JfHocNECEZYIaoosIp+2MKWIcST9CY=;
 b=8PxiNOKUPuQiTLyWqmEqDeHT0MroiyG5YilwvvMEz87ReepaG9LzDQltRCmPcE9IIT4Mc4
 t7GYHtbytbWT/ZDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 11A9E134CD;
 Sun,  6 Mar 2022 20:36:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id oOZcA0YbJWJ3KAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Sun, 06 Mar 2022 20:36:22 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: patrik.r.jakobsson@gmail.com,
	airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH 09/10] drm/gma500: Inline psb_gtt_restore()
Date: Sun,  6 Mar 2022 21:36:18 +0100
Message-Id: <20220306203619.22624-10-tzimmermann@suse.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220306203619.22624-1-tzimmermann@suse.de>
References: <20220306203619.22624-1-tzimmermann@suse.de>
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

Inline psb_gtt_restore() into its only caller in power.c.

Perform the GTT restoration in psb_gem_mm_resume(). The restoration
step is part of GEM anyway and will be moved over at some point.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/gma500/gtt.c   | 15 ++-------------
 drivers/gpu/drm/gma500/gtt.h   |  3 ++-
 drivers/gpu/drm/gma500/power.c |  4 +++-
 3 files changed, 7 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/gma500/gtt.c b/drivers/gpu/drm/gma500/gtt.c
index 0e99774c7e59..9e1b19fcea28 100644
--- a/drivers/gpu/drm/gma500/gtt.c
+++ b/drivers/gpu/drm/gma500/gtt.c
@@ -339,7 +339,7 @@ int psb_gem_mm_init(struct drm_device *dev)
 	return ret;
 }
 
-static int psb_gtt_resume(struct drm_device *dev)
+int psb_gtt_resume(struct drm_device *dev)
 {
 	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
 	struct pci_dev *pdev = to_pci_dev(dev->dev);
@@ -422,7 +422,7 @@ static int psb_gtt_resume(struct drm_device *dev)
 	return ret;
 }
 
-static int psb_gem_mm_resume(struct drm_device *dev)
+int psb_gem_mm_resume(struct drm_device *dev)
 {
 	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
 	struct pci_dev *pdev = to_pci_dev(dev->dev);
@@ -445,17 +445,6 @@ static int psb_gem_mm_resume(struct drm_device *dev)
 	}
 
 	psb_gtt_populate_stolen(dev_priv);
-
-	return 0;
-}
-
-int psb_gtt_restore(struct drm_device *dev)
-{
-	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
-
-	psb_gtt_resume(dev);
-	psb_gem_mm_resume(dev);
-
 	psb_gtt_populate_resources(dev_priv);
 
 	return 0;
diff --git a/drivers/gpu/drm/gma500/gtt.h b/drivers/gpu/drm/gma500/gtt.h
index 45e1926dfce1..9a6d79200dce 100644
--- a/drivers/gpu/drm/gma500/gtt.h
+++ b/drivers/gpu/drm/gma500/gtt.h
@@ -27,7 +27,7 @@ struct psb_gtt {
 /* Exported functions */
 int psb_gtt_init(struct drm_device *dev);
 void psb_gtt_fini(struct drm_device *dev);
-extern int psb_gtt_restore(struct drm_device *dev);
+int psb_gtt_resume(struct drm_device *dev);
 
 int psb_gtt_allocate_resource(struct drm_psb_private *pdev, struct resource *res,
 			      const char *name, resource_size_t size, resource_size_t align,
@@ -39,5 +39,6 @@ void psb_gtt_remove_pages(struct drm_psb_private *pdev, const struct resource *r
 
 int psb_gem_mm_init(struct drm_device *dev);
 void psb_gem_mm_fini(struct drm_device *dev);
+int psb_gem_mm_resume(struct drm_device *dev);
 
 #endif
diff --git a/drivers/gpu/drm/gma500/power.c b/drivers/gpu/drm/gma500/power.c
index d2a46d96e746..28e472b31698 100644
--- a/drivers/gpu/drm/gma500/power.c
+++ b/drivers/gpu/drm/gma500/power.c
@@ -112,7 +112,9 @@ static void gma_resume_display(struct pci_dev *pdev)
 	pci_write_config_word(pdev, PSB_GMCH_CTRL,
 			dev_priv->gmch_ctrl | _PSB_GMCH_ENABLED);
 
-	psb_gtt_restore(dev); /* Rebuild our GTT mappings */
+	/* Rebuild our GTT mappings */
+	psb_gtt_resume(dev);
+	psb_gem_mm_resume(dev);
 	dev_priv->ops->restore_regs(dev);
 }
 
-- 
2.35.1

