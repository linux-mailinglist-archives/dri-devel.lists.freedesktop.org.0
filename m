Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AD1841AADB
	for <lists+dri-devel@lfdr.de>; Tue, 28 Sep 2021 10:44:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33A0889DC2;
	Tue, 28 Sep 2021 08:44:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17B1F89F4F
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Sep 2021 08:44:50 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 9017E201DF;
 Tue, 28 Sep 2021 08:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1632818688; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Vj50/7kg91ESSX7OEn62o6MMkefpBzFSfe+2oCz11pA=;
 b=Zs0w1Ul8s45Xsfs0OVjSrYvuAHFxO9A4AwFGujR2rEl3GF3SWRn2ta1FA69M2H5wQYCpYH
 /ywZjO3XOh0EkB+9t1M+JrHevWDcZZdkPobscr+HME/5IW80NCOgtFBPGkM+SBIc+kJClO
 3Y/yI6w9CmngSwfmj3MEe7d9TS+NtCg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1632818688;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Vj50/7kg91ESSX7OEn62o6MMkefpBzFSfe+2oCz11pA=;
 b=XN89H8uJXDQAk4j7pGezUsTWoXOB0rPx5K+KMIhhCeR4wGSueRgV9C2VXIyCwQOskBdiw2
 U9civz0dHrKduRDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6CCA613B94;
 Tue, 28 Sep 2021 08:44:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id aJOVGQDWUmEIDQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 28 Sep 2021 08:44:48 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: patrik.r.jakobsson@gmail.com,
	airlied@linux.ie,
	daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 02/10] drm/gma500: Use to_gtt_range() everywhere
Date: Tue, 28 Sep 2021 10:44:38 +0200
Message-Id: <20210928084446.22580-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210928084446.22580-1-tzimmermann@suse.de>
References: <20210928084446.22580-1-tzimmermann@suse.de>
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

Convert upcasts from struct drm_gem_object to struct gtt_range to
to_gtt_range(). Some places used container_of() directly.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/gma500/gem.c         | 4 ++--
 drivers/gpu/drm/gma500/gma_display.c | 7 +++----
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/gma500/gem.c b/drivers/gpu/drm/gma500/gem.c
index 734bcb7a80c8..ff2c1d64689e 100644
--- a/drivers/gpu/drm/gma500/gem.c
+++ b/drivers/gpu/drm/gma500/gem.c
@@ -106,7 +106,7 @@ static vm_fault_t psb_gem_fault(struct vm_fault *vmf);
 
 static void psb_gem_free_object(struct drm_gem_object *obj)
 {
-	struct gtt_range *gtt = container_of(obj, struct gtt_range, gem);
+	struct gtt_range *gtt = to_gtt_range(obj);
 
 	/* Remove the list map if one is present */
 	drm_gem_free_mmap_offset(obj);
@@ -256,7 +256,7 @@ static vm_fault_t psb_gem_fault(struct vm_fault *vmf)
 	dev = obj->dev;
 	dev_priv = to_drm_psb_private(dev);
 
-	r = container_of(obj, struct gtt_range, gem);	/* Get the gtt range */
+	r = to_gtt_range(obj);
 
 	/* Make sure we don't parallel update on a fault, nor move or remove
 	   something from beneath our feet */
diff --git a/drivers/gpu/drm/gma500/gma_display.c b/drivers/gpu/drm/gma500/gma_display.c
index ecf8153416ac..8285358fac01 100644
--- a/drivers/gpu/drm/gma500/gma_display.c
+++ b/drivers/gpu/drm/gma500/gma_display.c
@@ -349,8 +349,7 @@ int gma_crtc_cursor_set(struct drm_crtc *crtc,
 
 		/* Unpin the old GEM object */
 		if (gma_crtc->cursor_obj) {
-			gt = container_of(gma_crtc->cursor_obj,
-					  struct gtt_range, gem);
+			gt = to_gtt_range(gma_crtc->cursor_obj);
 			psb_gtt_unpin(gt);
 			drm_gem_object_put(gma_crtc->cursor_obj);
 			gma_crtc->cursor_obj = NULL;
@@ -376,7 +375,7 @@ int gma_crtc_cursor_set(struct drm_crtc *crtc,
 		goto unref_cursor;
 	}
 
-	gt = container_of(obj, struct gtt_range, gem);
+	gt = to_gtt_range(obj);
 
 	/* Pin the memory into the GTT */
 	ret = psb_gtt_pin(gt);
@@ -426,7 +425,7 @@ int gma_crtc_cursor_set(struct drm_crtc *crtc,
 
 	/* unpin the old bo */
 	if (gma_crtc->cursor_obj) {
-		gt = container_of(gma_crtc->cursor_obj, struct gtt_range, gem);
+		gt = to_gtt_range(gma_crtc->cursor_obj);
 		psb_gtt_unpin(gt);
 		drm_gem_object_put(gma_crtc->cursor_obj);
 	}
-- 
2.33.0

