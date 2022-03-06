Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C129E4CEDC6
	for <lists+dri-devel@lfdr.de>; Sun,  6 Mar 2022 21:36:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D22A110E668;
	Sun,  6 Mar 2022 20:36:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5861410E658
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Mar 2022 20:36:23 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1BB6C21107;
 Sun,  6 Mar 2022 20:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1646598981; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r6cOwfsUcm/4qadn0Pbhcl34VUmxCK8E05MRG1lDAt0=;
 b=BV+kuIGfY7bGgVxIu82Sm3J0f/b8qw02aoZ7TOxV5Q+jU/0UEulkkdISBO6WzHdufulOsT
 MPvPdqYq825GqQ8yRDJWT1KtOdQIFc7etL20gOuFcpLmhvSEyUBpH1yVKfMWAFocXoWabr
 g0/GA1OHfxcF9ys7Lzbs3DhgjEgAf4c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1646598981;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r6cOwfsUcm/4qadn0Pbhcl34VUmxCK8E05MRG1lDAt0=;
 b=cs2P4+BQ4pvC+AEYtpIaLb4p5Y4xLWBo+rwygYu1ZMBzMbZvlX/fXix5qcEr6vFGLbZLDf
 2wUsbpiFuBk/hRCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id EEE6A134CD;
 Sun,  6 Mar 2022 20:36:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id sHRqOUQbJWJ3KAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Sun, 06 Mar 2022 20:36:20 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: patrik.r.jakobsson@gmail.com,
	airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH 02/10] drm/gma500: Acquire reservation lock for GEM objects
Date: Sun,  6 Mar 2022 21:36:11 +0100
Message-Id: <20220306203619.22624-3-tzimmermann@suse.de>
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

Protect concurrent access to struct psb_gem_object by acquiring
the GEM object's reservation lock; as it's supposed to be. The
use of the GTT mutex can now be moved into GTT code.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/gma500/gem.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/gma500/gem.c b/drivers/gpu/drm/gma500/gem.c
index fe7d242567c0..026ce11f7460 100644
--- a/drivers/gpu/drm/gma500/gem.c
+++ b/drivers/gpu/drm/gma500/gem.c
@@ -31,6 +31,10 @@ int psb_gem_pin(struct psb_gem_object *pobj)
 	unsigned int npages;
 	int ret;
 
+	ret = dma_resv_lock(obj->resv, NULL);
+	if (drm_WARN_ONCE(dev, ret, "dma_resv_lock() failed, ret=%d\n", ret))
+		return ret;
+
 	mutex_lock(&dev_priv->gtt_mutex);
 
 	if (pobj->in_gart || pobj->stolen)
@@ -56,11 +60,13 @@ int psb_gem_pin(struct psb_gem_object *pobj)
 out:
 	++pobj->in_gart;
 	mutex_unlock(&dev_priv->gtt_mutex);
+	dma_resv_unlock(obj->resv);
 
 	return 0;
 
 err_mutex_unlock:
 	mutex_unlock(&dev_priv->gtt_mutex);
+	dma_resv_unlock(obj->resv);
 	return ret;
 }
 
@@ -71,6 +77,11 @@ void psb_gem_unpin(struct psb_gem_object *pobj)
 	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
 	u32 gpu_base = dev_priv->gtt.gatt_start;
 	unsigned long npages;
+	int ret;
+
+	ret = dma_resv_lock(obj->resv, NULL);
+	if (drm_WARN_ONCE(dev, ret, "dma_resv_lock() failed, ret=%d\n", ret))
+		return;
 
 	mutex_lock(&dev_priv->gtt_mutex);
 
@@ -95,6 +106,7 @@ void psb_gem_unpin(struct psb_gem_object *pobj)
 
 out:
 	mutex_unlock(&dev_priv->gtt_mutex);
+	dma_resv_unlock(obj->resv);
 }
 
 static vm_fault_t psb_gem_fault(struct vm_fault *vmf);
-- 
2.35.1

