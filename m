Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE3DE91C70E
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2024 22:07:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CFFD10ED43;
	Fri, 28 Jun 2024 20:07:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="QldMQQTj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
 [209.85.160.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9415910ED3C
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 20:07:35 +0000 (UTC)
Received: by mail-qt1-f169.google.com with SMTP id
 d75a77b69052e-446340c6608so8002501cf.1
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 13:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1719605254; x=1720210054;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zp8orkZwIjkO6+SF4HBN4w4cqWNAvvI4FjDyB3S0RXY=;
 b=QldMQQTjv8yQ5uzAi3pEHYmsQothvRqA9M2eS7oEyiOglnTvVUUODn0wJCyfRAEcfy
 +W4NUdW2zpfKHdKaWMS/3xp2Erb5DgodgkyDKwNJPZN/G18fCxvKze9ggaGwD7tFwqax
 7u6B4U1RPsoFRcNOzBNQdq8fyZK6k5Ee4udmM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719605254; x=1720210054;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zp8orkZwIjkO6+SF4HBN4w4cqWNAvvI4FjDyB3S0RXY=;
 b=J8BWXpSJfBMpXIMt2RsR7jf14amwqKk9OpFtmtlaVrzYmbbWD0NJ91KXjQWkKWMBG3
 DckIv0ImNdMyWmgGj8Y6Hk5RdJ/yqF6U+jFo+XnR46El+4Qgb1w5RJfNhtTInaUg76kY
 MIYGrKTKsiuftY4/qOdJ5vLH3U+3CN8S+AXgTgcVbPL4dHGiPHH4up12xR/2NbvAbUhg
 ftO8giRAl8iA1IdY7PO0HI2/eVrbYviWZkfQUAU8ut2Vif7FwDnB1Bkcw0yQ4k8aavA7
 Tnv15jHtYMsJmDeJoAhopwj3MIEb6E3JkW30Tko/M1j5uez0e9HHSg6z3X3XEikptamY
 H3WA==
X-Gm-Message-State: AOJu0YwlTpdU+Ja1kLV5uVJdkJyFETFfu+gr5MMvJN272YP1rMkWgg8w
 51K9+xTxM8ekUzgZHVK9Z72wYKcs1E3h0k1ho/jbI1wF3Z5NNcKcSg5mzOJJ2E3Nuk33/5zQTV3
 A+Gt0Bx+3E5Bl9WrAzsL1ZfGomQcXUTfWxrZpJScw/YTvGTgvkcBYgHW9BvrVhnIYTEPkcOcTlj
 NaXsY7CTc7J4v88hSzwPgMnVpu2kqWhCNA/Y5UZ3mlWFWHp2FNsqcE
X-Google-Smtp-Source: AGHT+IHVK9HLCx9oPKarKUBKQaBUkQ5ixAw4yMcDTciIVYOiaKy/Mk1EiUz1VcRMfStABfhmdHsYqA==
X-Received: by 2002:ac8:7e87:0:b0:444:ce2f:8b01 with SMTP id
 d75a77b69052e-444d3c41644mr219149141cf.60.1719605254269; 
 Fri, 28 Jun 2024 13:07:34 -0700 (PDT)
Received: from vertex.vmware.com (pool-173-49-113-140.phlapa.fios.verizon.net.
 [173.49.113.140]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4465140bf35sm9972351cf.37.2024.06.28.13.07.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jun 2024 13:07:34 -0700 (PDT)
From: Zack Rusin <zack.rusin@broadcom.com>
To: dri-devel@lists.freedesktop.org
Cc: Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, ian.forbes@broadcom.com,
 martin.krastev@broadcom.com, maaz.mombasawala@broadcom.com,
 Zack Rusin <zack.rusin@broadcom.com>
Subject: [PATCH v2 2/4] drm/vmwgfx: Make sure the screen surface is ref counted
Date: Fri, 28 Jun 2024 16:07:27 -0400
Message-Id: <20240628200729.754669-3-zack.rusin@broadcom.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240628200729.754669-1-zack.rusin@broadcom.com>
References: <20240628200729.754669-1-zack.rusin@broadcom.com>
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
Cc: Martin Krastev <martin.krastev@broadcom.com>
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: dri-devel@lists.freedesktop.org
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
2.40.1

