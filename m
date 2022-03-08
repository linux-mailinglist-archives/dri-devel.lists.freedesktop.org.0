Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BCFC4D21FE
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 20:52:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0883F10E4CE;
	Tue,  8 Mar 2022 19:52:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02F4610E4B3
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Mar 2022 19:52:27 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9A778210F9;
 Tue,  8 Mar 2022 19:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1646769145; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J0FQSEOGVmPuqaOyRx1MGAGZ3mGPys+SINDP7LB/mrA=;
 b=Dh50lE8GjlW14vDYduBqmdoM7ZSp6XP1Q5eVWjNsb666A921MWrJ0qa4PT4Cg6bLcitzWB
 7Cja4c9POFq1iQM2o54ZFEF/T+uOzSIbmxZtG/n0IH/lpCJyifDlcV3bA3S5uXhCKaTE37
 PrpK88cnUc0gY553p1ieyhZHP/+rjsk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1646769145;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J0FQSEOGVmPuqaOyRx1MGAGZ3mGPys+SINDP7LB/mrA=;
 b=iuB58PQo30FlYJRjN6mFymPKVtWr1iSFcmM89ezMODDsOS8SQQ5SVSvl9cZZ07M+E0nzkg
 UXLiYNwvk2fNMRCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7975A13D4F;
 Tue,  8 Mar 2022 19:52:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 4NyyHPmzJ2KKEwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 08 Mar 2022 19:52:25 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: patrik.r.jakobsson@gmail.com,
	airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH v2 09/12] drm/gma500: Inline psb_gtt_restore()
Date: Tue,  8 Mar 2022 20:52:19 +0100
Message-Id: <20220308195222.13471-10-tzimmermann@suse.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220308195222.13471-1-tzimmermann@suse.de>
References: <20220308195222.13471-1-tzimmermann@suse.de>
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
Acked-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
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

