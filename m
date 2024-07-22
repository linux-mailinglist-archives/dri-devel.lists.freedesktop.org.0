Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1399A9393C8
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2024 20:43:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 530D610E287;
	Mon, 22 Jul 2024 18:43:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="HPLyUTWf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com
 [209.85.219.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32A6E10E081
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2024 18:43:26 +0000 (UTC)
Received: by mail-qv1-f53.google.com with SMTP id
 6a1803df08f44-6b7a4668f1fso31682986d6.3
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2024 11:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1721673805; x=1722278605;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UZLnna864fO1U8SaXbyrMCH0/gFFUgl6unm5yKIa7tU=;
 b=HPLyUTWfQtTZIPSVQmkNCbg6GMqWlFOt2EGpGhV8nfPFREpyskfNJAmrfZw2G1eKN4
 nVCVblfaxocNZxJIAsF5shxQT2CAGvfhyX5M2U2he9Hov1/2YHQo7Hhxfd1qIM/jfzrX
 XAdKERzJ/6a7T5lVeZYJVvB6Tk3/x5UKfiuCw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721673805; x=1722278605;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UZLnna864fO1U8SaXbyrMCH0/gFFUgl6unm5yKIa7tU=;
 b=X1F/yP5+ZLfs+ZHu0PLzw26IgJJbfiXxzEBCUiILbvz1VtBWgiSoJGlzhiDJubISID
 +216cd/gu4eUoR/LYkcoPFIHRsrUhYKoXBtg7eS7HlEdEbeZwtYbDHj+m9W1XGW/eEmE
 jgoekE0AvGaSaKBvguDNeEM3bnoG8m/TZ7Jb2nmyL3xvlt/vsuQ0kmP/ayHrcIhMTp3k
 jLPkNZwH5KwiBBLmXXKy95UkhhFuIbXlScJqq/aSylD7JDK8tlQ5U05j/R9DXM4Fw+r0
 SnFshfV2PNLdP3BvmLNAnTRArb1up1CIJMojZo6f0xOcLFzcwq63yaO/Abn+q2cmIOoJ
 xdFQ==
X-Gm-Message-State: AOJu0Yx9fP3BKy6mIk1PYNRRJWfMWnfKRFXyZHXiHC8OiRLBgPlacC+k
 +4euwFgOCwiIldIhsh0vq1A6L5+simgUgVCZ4jopLMRL8mEWYztv9EneujRr+3It9zxk0fVsiBn
 /ae4l03McxIHM83OhwIkGiWWW8rZVrpq/JFu1abX25lz9N2ul9+A8nLjWhO4FR+/gS5JpDOq9Si
 2R7LQ81aeoFhER8ZD8mVtdZUg7TEM8wGCnFeD2m3WChgHcCLJ/6Q==
X-Google-Smtp-Source: AGHT+IGHynLE1TjPe1/82yOepywlFDk3rN1FsSGg8SmzP3aT+zqKv2rSdqLpOK96ZZoFQGynSytVxA==
X-Received: by 2002:a05:6214:ac2:b0:6b5:7fb9:747 with SMTP id
 6a1803df08f44-6b9610d43e2mr116960266d6.2.1721673804735; 
 Mon, 22 Jul 2024 11:43:24 -0700 (PDT)
Received: from vertex.vmware.com (pool-173-49-113-140.phlapa.fios.verizon.net.
 [173.49.113.140]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6b7acafdb01sm38261466d6.129.2024.07.22.11.43.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jul 2024 11:43:24 -0700 (PDT)
From: Zack Rusin <zack.rusin@broadcom.com>
To: dri-devel@lists.freedesktop.org
Cc: Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, ian.forbes@broadcom.com,
 martin.krastev@broadcom.com, maaz.mombasawala@broadcom.com,
 Zack Rusin <zack.rusin@broadcom.com>
Subject: [PATCH v5 2/4] drm/vmwgfx: Make sure the screen surface is ref counted
Date: Mon, 22 Jul 2024 14:41:14 -0400
Message-ID: <20240722184313.181318-3-zack.rusin@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240722184313.181318-1-zack.rusin@broadcom.com>
References: <20240722184313.181318-1-zack.rusin@broadcom.com>
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

Fix races issues in virtual crc generation by making sure the surface
the code uses for crc computation is properly ref counted.

Crc generation was trying to be too clever by allowing the surfaces
to go in and out of scope, with the hope of always having some kind
of screen present. That's not always the code, in particular during
atomic disable, so to make sure the surface, when present, is not
being actively destroyed at the same time, hold a reference to it.

Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
Fixes: 7b0062036c3b ("drm/vmwgfx: Implement virtual crc generation")
Cc: Zack Rusin <zack.rusin@broadcom.com>
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: dri-devel@lists.freedesktop.org
Reviewed-by: Maaz Mombasawala <maaz.mombasawala@broadcom.com>
Reviewed-by: Martin Krastev <martin.krastev@broadcom.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_vkms.c | 40 +++++++++++++++-------------
 1 file changed, 22 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_vkms.c b/drivers/gpu/drm/vmwgfx/vmwgfx_vkms.c
index 3bfcf671fcd5..8651b788e98b 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_vkms.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_vkms.c
@@ -75,7 +75,7 @@ vmw_surface_sync(struct vmw_private *vmw,
 	return ret;
 }
 
-static int
+static void
 compute_crc(struct drm_crtc *crtc,
 	    struct vmw_surface *surf,
 	    u32 *crc)
@@ -101,8 +101,6 @@ compute_crc(struct drm_crtc *crtc,
 	}
 
 	vmw_bo_unmap(bo);
-
-	return 0;
 }
 
 static void
@@ -116,7 +114,6 @@ crc_generate_worker(struct work_struct *work)
 	u64 frame_start, frame_end;
 	u32 crc32 = 0;
 	struct vmw_surface *surf = 0;
-	int ret;
 
 	spin_lock_irq(&du->vkms.crc_state_lock);
 	crc_pending = du->vkms.crc_pending;
@@ -130,22 +127,24 @@ crc_generate_worker(struct work_struct *work)
 		return;
 
 	spin_lock_irq(&du->vkms.crc_state_lock);
-	surf = du->vkms.surface;
+	surf = vmw_surface_reference(du->vkms.surface);
 	spin_unlock_irq(&du->vkms.crc_state_lock);
 
-	if (vmw_surface_sync(vmw, surf)) {
-		drm_warn(crtc->dev, "CRC worker wasn't able to sync the crc surface!\n");
-		return;
-	}
+	if (surf) {
+		if (vmw_surface_sync(vmw, surf)) {
+			drm_warn(
+				crtc->dev,
+				"CRC worker wasn't able to sync the crc surface!\n");
+			return;
+		}
 
-	ret = compute_crc(crtc, surf, &crc32);
-	if (ret)
-		return;
+		compute_crc(crtc, surf, &crc32);
+		vmw_surface_unreference(&surf);
+	}
 
 	spin_lock_irq(&du->vkms.crc_state_lock);
 	frame_start = du->vkms.frame_start;
 	frame_end = du->vkms.frame_end;
-	crc_pending = du->vkms.crc_pending;
 	du->vkms.frame_start = 0;
 	du->vkms.frame_end = 0;
 	du->vkms.crc_pending = false;
@@ -164,7 +163,7 @@ vmw_vkms_vblank_simulate(struct hrtimer *timer)
 	struct vmw_display_unit *du = container_of(timer, struct vmw_display_unit, vkms.timer);
 	struct drm_crtc *crtc = &du->crtc;
 	struct vmw_private *vmw = vmw_priv(crtc->dev);
-	struct vmw_surface *surf = NULL;
+	bool has_surface = false;
 	u64 ret_overrun;
 	bool locked, ret;
 
@@ -179,10 +178,10 @@ vmw_vkms_vblank_simulate(struct hrtimer *timer)
 	WARN_ON(!ret);
 	if (!locked)
 		return HRTIMER_RESTART;
-	surf = du->vkms.surface;
+	has_surface = du->vkms.surface != NULL;
 	vmw_vkms_unlock(crtc);
 
-	if (du->vkms.crc_enabled && surf) {
+	if (du->vkms.crc_enabled && has_surface) {
 		u64 frame = drm_crtc_accurate_vblank_count(crtc);
 
 		spin_lock(&du->vkms.crc_state_lock);
@@ -336,6 +335,8 @@ vmw_vkms_crtc_cleanup(struct drm_crtc *crtc)
 {
 	struct vmw_display_unit *du = vmw_crtc_to_du(crtc);
 
+	if (du->vkms.surface)
+		vmw_surface_unreference(&du->vkms.surface);
 	WARN_ON(work_pending(&du->vkms.crc_generator_work));
 	hrtimer_cancel(&du->vkms.timer);
 }
@@ -497,9 +498,12 @@ vmw_vkms_set_crc_surface(struct drm_crtc *crtc,
 	struct vmw_display_unit *du = vmw_crtc_to_du(crtc);
 	struct vmw_private *vmw = vmw_priv(crtc->dev);
 
-	if (vmw->vkms_enabled) {
+	if (vmw->vkms_enabled && du->vkms.surface != surf) {
 		WARN_ON(atomic_read(&du->vkms.atomic_lock) != VMW_VKMS_LOCK_MODESET);
-		du->vkms.surface = surf;
+		if (du->vkms.surface)
+			vmw_surface_unreference(&du->vkms.surface);
+		if (surf)
+			du->vkms.surface = vmw_surface_reference(surf);
 	}
 }
 
-- 
2.43.0

