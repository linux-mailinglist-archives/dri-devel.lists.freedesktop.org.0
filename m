Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FAC74D2203
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 20:52:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BD4510E50C;
	Tue,  8 Mar 2022 19:52:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11CC610E2FF
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Mar 2022 19:52:26 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 9032A1F388;
 Tue,  8 Mar 2022 19:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1646769144; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wpaUCs3v28LmxHUnJNDzvy5+D9xGBn+dK+DGwjg88Hc=;
 b=nNQQnlvWpDErnFQoh2Bt49QNu8PDHoJm58lIoY1FrWFa7gy6q4X4jtxgGrePtta5Yl9Iq4
 ODn7vnorm5DXILxqpGsxD/OKZvVvRgcYYtVBjTF21bKomkU79D0ZWXMeB1E98yd2lT5l+q
 4ht342AkwPyoC7NS7nkq3NQtPUGL5Kk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1646769144;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wpaUCs3v28LmxHUnJNDzvy5+D9xGBn+dK+DGwjg88Hc=;
 b=KT3rdZP7RE1PXjnTPIS1jThv+NCytbm3JBsWKcTno9kfCrA4LdVWTAq/k0+ygNxguAB6ov
 7YWmK2DdINxOUMBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6DCC713CFB;
 Tue,  8 Mar 2022 19:52:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id yFDcGfizJ2KKEwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 08 Mar 2022 19:52:24 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: patrik.r.jakobsson@gmail.com,
	airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH v2 02/12] drm/gma500: Acquire reservation lock for GEM objects
Date: Tue,  8 Mar 2022 20:52:12 +0100
Message-Id: <20220308195222.13471-3-tzimmermann@suse.de>
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

Protect concurrent access to struct psb_gem_object by acquiring
the GEM object's reservation lock; as it's supposed to be. The
use of the GTT mutex can now be moved into GTT code.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
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

