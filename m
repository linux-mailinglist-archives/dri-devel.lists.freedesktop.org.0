Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6BC091ECE9
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 04:13:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E109710E114;
	Tue,  2 Jul 2024 02:12:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="L/sSaOj3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com
 [209.85.222.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AC9D10E090
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jul 2024 02:12:59 +0000 (UTC)
Received: by mail-qk1-f175.google.com with SMTP id
 af79cd13be357-79c2c05638cso294688185a.3
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Jul 2024 19:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1719886378; x=1720491178;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UZLnna864fO1U8SaXbyrMCH0/gFFUgl6unm5yKIa7tU=;
 b=L/sSaOj3jBjmrcqkwWlQgSuZGZJN6HW/5T9ifMajT+WbBn7m7L0OweBRP5yV+56Qqi
 rqC4ruahhLAsMEq10gdnJOziWOaeHcVrItCsAIlN5AWd/RRYxGv/rRgfYBpkK3OvsUuS
 OdtScM7Xat7SmCNMiojwj3kfn48J/2+bRIEdM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719886378; x=1720491178;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UZLnna864fO1U8SaXbyrMCH0/gFFUgl6unm5yKIa7tU=;
 b=aewIvGKe9jMw3fG94HC4pki7csO+WuuUXH+71yj0Lm3A0e/xMJ+WxKJUg4GnE0VhV/
 NzNaZF6YrMh0XdYa5fgt2ROYMY2epsmBSULCJw0fSTVwjvwsZJpyuKyfr3UFZnMBCt0P
 pABlTjgAIwIwzBPgTgbuwZiX8r+x/CtzRoWLRil5pNoK5HZyG9oPpDFEVLCZAGc5/oFA
 QRh7QHQsA2UL0Je0o7sSGxiNxiq7iAQAI3VHsLjaoxoVEFMvkkprxuHihY0wMNRvw8K5
 RBSPmQEWFdda3bKz8/k4UMWeZ1al5yvbNwVZTl8zQrNQtPYcYvvx73BlNO5deOfwIy+w
 8vEQ==
X-Gm-Message-State: AOJu0YxQ0X0D4KrIzqLDB3ONHPVnqkjbOPR2H5HjkKLgoOOEz+fB/f2F
 MjhC23MV36jFhJfU7bm49VVSyk9i58YDuvXW1HA0CrBvrIRp0VuutvZ7vg7m8x0t1IeOP31q/iw
 5AxovyaXdZL5s4ZUFkIC/pmcvYXci3H+Tk+Yvhe0riPGIjiB8gQSFKErv90SvDFmsAPRorGMNvA
 IvM5aOFBnPG+8pxbXJ4o/HIXpM5+UkQTSvTUWme9T3HnaoqRH+778b
X-Google-Smtp-Source: AGHT+IFZ1hbJe52Nbre/uuzas6CJX9DB+usT437pl6/tQ/4+8RppR5sk4ju2az9goMkTYa0KF5cYHw==
X-Received: by 2002:ad4:5746:0:b0:6b5:4865:948e with SMTP id
 6a1803df08f44-6b5b70ce94fmr87005596d6.32.1719886377989; 
 Mon, 01 Jul 2024 19:12:57 -0700 (PDT)
Received: from vertex.vmware.com (pool-173-49-113-140.phlapa.fios.verizon.net.
 [173.49.113.140]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6b5bcf1acc0sm21799366d6.44.2024.07.01.19.12.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jul 2024 19:12:57 -0700 (PDT)
From: Zack Rusin <zack.rusin@broadcom.com>
To: dri-devel@lists.freedesktop.org
Cc: Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, ian.forbes@broadcom.com,
 martin.krastev@broadcom.com, maaz.mombasawala@broadcom.com,
 Zack Rusin <zack.rusin@broadcom.com>
Subject: [PATCH v3 2/4] drm/vmwgfx: Make sure the screen surface is ref counted
Date: Mon,  1 Jul 2024 22:11:29 -0400
Message-ID: <20240702021254.1610188-3-zack.rusin@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240702021254.1610188-1-zack.rusin@broadcom.com>
References: <20240702021254.1610188-1-zack.rusin@broadcom.com>
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

