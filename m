Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C6B83B9D25
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jul 2021 09:54:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CA5189F31;
	Fri,  2 Jul 2021 07:54:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C84689F41
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jul 2021 07:54:39 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D009120534;
 Fri,  2 Jul 2021 07:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1625212477; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vLefWh98Faz/DjrT8iuiSLMba9T64X85DQiy0gfTTC0=;
 b=BQcAbdEkT6/RZ3o7WEpoOcVDDlB2jF4CBbqXQCYJHuaTpqcjmJu8CDy/syuj+ZAFx+VV5S
 rOcNYFWIw7I1Cel0qqcvnzTh5VvNeZTwbBt624Qbh/zsgohF4SFNJg+3DmDVqRB00gCjkp
 MmPDNcPWMWQGVvTT32Ea8hbaXiI5VHo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1625212477;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vLefWh98Faz/DjrT8iuiSLMba9T64X85DQiy0gfTTC0=;
 b=5vbN2kzLEX7BfQ4Fs2N8mD5GAVKSLf4GhXpR3coAwTkbEhNTMJ9GhPtkEnemw+2uy9geEv
 0jXFGtsFCo/ZxKBA==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 99FD211CD6;
 Fri,  2 Jul 2021 07:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1625212477; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vLefWh98Faz/DjrT8iuiSLMba9T64X85DQiy0gfTTC0=;
 b=BQcAbdEkT6/RZ3o7WEpoOcVDDlB2jF4CBbqXQCYJHuaTpqcjmJu8CDy/syuj+ZAFx+VV5S
 rOcNYFWIw7I1Cel0qqcvnzTh5VvNeZTwbBt624Qbh/zsgohF4SFNJg+3DmDVqRB00gCjkp
 MmPDNcPWMWQGVvTT32Ea8hbaXiI5VHo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1625212477;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vLefWh98Faz/DjrT8iuiSLMba9T64X85DQiy0gfTTC0=;
 b=5vbN2kzLEX7BfQ4Fs2N8mD5GAVKSLf4GhXpR3coAwTkbEhNTMJ9GhPtkEnemw+2uy9geEv
 0jXFGtsFCo/ZxKBA==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id sAu7JD3G3mALDgAALh3uQQ
 (envelope-from <tzimmermann@suse.de>); Fri, 02 Jul 2021 07:54:37 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: kraxel@redhat.com, daniel@ffwll.ch, airlied@linux.ie, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
Subject: [PATCH v2 3/3] drm/vram-helper: Unexport drm_vram_helper_{alloc,
 release}_mm()
Date: Fri,  2 Jul 2021 09:54:34 +0200
Message-Id: <20210702075434.27677-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210702075434.27677-1-tzimmermann@suse.de>
References: <20210702075434.27677-1-tzimmermann@suse.de>
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

All GEM-VRAM-based drivers use auto-cleanup via drmm_vram_helper_init().
Unexport the manual APIs and make them internal implementation.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/drm_gem_vram_helper.c | 9 +++------
 include/drm/drm_gem_vram_helper.h     | 4 ----
 2 files changed, 3 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
index 2a1229b8364e..1e9b82e51a07 100644
--- a/drivers/gpu/drm/drm_gem_vram_helper.c
+++ b/drivers/gpu/drm/drm_gem_vram_helper.c
@@ -1012,9 +1012,8 @@ static void drm_vram_mm_cleanup(struct drm_vram_mm *vmm)
  * Helpers for integration with struct drm_device
  */
 
-/* deprecated; use drmm_vram_mm_init() */
-struct drm_vram_mm *drm_vram_helper_alloc_mm(
-	struct drm_device *dev, uint64_t vram_base, size_t vram_size)
+static struct drm_vram_mm *drm_vram_helper_alloc_mm(struct drm_device *dev, uint64_t vram_base,
+						    size_t vram_size)
 {
 	int ret;
 
@@ -1036,9 +1035,8 @@ struct drm_vram_mm *drm_vram_helper_alloc_mm(
 	dev->vram_mm = NULL;
 	return ERR_PTR(ret);
 }
-EXPORT_SYMBOL(drm_vram_helper_alloc_mm);
 
-void drm_vram_helper_release_mm(struct drm_device *dev)
+static void drm_vram_helper_release_mm(struct drm_device *dev)
 {
 	if (!dev->vram_mm)
 		return;
@@ -1047,7 +1045,6 @@ void drm_vram_helper_release_mm(struct drm_device *dev)
 	kfree(dev->vram_mm);
 	dev->vram_mm = NULL;
 }
-EXPORT_SYMBOL(drm_vram_helper_release_mm);
 
 static void drm_vram_mm_release(struct drm_device *dev, void *ptr)
 {
diff --git a/include/drm/drm_gem_vram_helper.h b/include/drm/drm_gem_vram_helper.h
index f48d181c824b..d3cf06c9af65 100644
--- a/include/drm/drm_gem_vram_helper.h
+++ b/include/drm/drm_gem_vram_helper.h
@@ -204,10 +204,6 @@ void drm_vram_mm_debugfs_init(struct drm_minor *minor);
  * Helpers for integration with struct drm_device
  */
 
-struct drm_vram_mm *drm_vram_helper_alloc_mm(
-	struct drm_device *dev, uint64_t vram_base, size_t vram_size);
-void drm_vram_helper_release_mm(struct drm_device *dev);
-
 int drmm_vram_helper_init(struct drm_device *dev, uint64_t vram_base,
 			  size_t vram_size);
 
-- 
2.32.0

