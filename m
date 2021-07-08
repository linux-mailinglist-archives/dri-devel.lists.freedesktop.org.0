Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF2E3C18A8
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jul 2021 19:51:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E62F76E937;
	Thu,  8 Jul 2021 17:51:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01A326E937
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jul 2021 17:51:49 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A87812236F;
 Thu,  8 Jul 2021 17:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1625766708; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=MxNplk44KKmtMOWNWY2bVmLuEfHkWGCHL8f705lfQIQ=;
 b=tEsDKC1eTOFeOBkzudqiTi8QeBaR5exoik/Y08U0brRTL1rzhhb/YCV/BX7f4G1FIfeOzZ
 qgKpRnWfHAPwdewZ41m1D4k7cyWw9m6RJR6RDiKd5ONeidBShD3eU3/YskBHcOP3EUTi2S
 aUZKdrTFFRSYgdyUhrnpMVeuXtoLy/g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1625766708;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=MxNplk44KKmtMOWNWY2bVmLuEfHkWGCHL8f705lfQIQ=;
 b=tbxPy4RUfVbTQTLP8kNJ/c7ZWJi7oyIFaaCskMu0DT/8K9iNQZ8rtQA+vta/s9V1W5J0La
 /2o5X9X8kTUlGoDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7C27E13B10;
 Thu,  8 Jul 2021 17:51:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id chBNHTQ752AGNgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 08 Jul 2021 17:51:48 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: paul@crapouillou.net, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, daniel@ffwll.ch, airlied@linux.ie
Subject: [PATCH] drm/cma-helper: Release non-coherent memory with
 dma_free_noncoherent()
Date: Thu,  8 Jul 2021 19:51:46 +0200
Message-Id: <20210708175146.10618-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.32.0
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

The GEM CMA helpers allocate non-coherent (i.e., cached) backing storage
with dma_alloc_noncoherent(), but release it with dma_free_wc(). Fix this
with a call to dma_free_noncoherent(). Writecombining storage is still
released with dma_free_wc().

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Fixes: cf8ccbc72d61 ("drm: Add support for GEM buffers backed by non-coherent memory")
Cc: Paul Cercueil <paul@crapouillou.net>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/drm_gem_cma_helper.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_cma_helper.c b/drivers/gpu/drm/drm_gem_cma_helper.c
index d53388199f34..9d05674550a4 100644
--- a/drivers/gpu/drm/drm_gem_cma_helper.c
+++ b/drivers/gpu/drm/drm_gem_cma_helper.c
@@ -210,8 +210,13 @@ void drm_gem_cma_free_object(struct drm_gem_object *gem_obj)
 			dma_buf_vunmap(gem_obj->import_attach->dmabuf, &map);
 		drm_prime_gem_destroy(gem_obj, cma_obj->sgt);
 	} else if (cma_obj->vaddr) {
-		dma_free_wc(gem_obj->dev->dev, cma_obj->base.size,
-			    cma_obj->vaddr, cma_obj->paddr);
+		if (cma_obj->map_noncoherent)
+			dma_free_noncoherent(gem_obj->dev->dev, cma_obj->base.size,
+					     cma_obj->vaddr, cma_obj->paddr,
+					     DMA_TO_DEVICE);
+		else
+			dma_free_wc(gem_obj->dev->dev, cma_obj->base.size,
+				    cma_obj->vaddr, cma_obj->paddr);
 	}
 
 	drm_gem_object_release(gem_obj);
-- 
2.32.0

