Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C51F919EBA
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2024 07:35:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6974710E145;
	Thu, 27 Jun 2024 05:35:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="Hubg0wT9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com
 [209.85.128.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBDD710E028
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2024 05:34:58 +0000 (UTC)
Received: by mail-yw1-f176.google.com with SMTP id
 00721157ae682-6325b04c275so75748097b3.3
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 22:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1719466497; x=1720071297;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3Kd+Tsbe/h4EsYKbNd9LHfkVfmB+nKN5hyLqUYos+0Q=;
 b=Hubg0wT95QMkEUpIQ45T26EQWluQX0vD0030O2DM9D4ipKDOKTcBxbVr2vi77fezna
 sYIMHUD0TqQO8kwx3R+kuodwju+hMS1X592HatcaAGI8P7V7F9T2ERypL7fIUJpOTOy0
 6IMo08ard5MbP/FvbqCW4EjwiOlz8hZl08Dvg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719466497; x=1720071297;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3Kd+Tsbe/h4EsYKbNd9LHfkVfmB+nKN5hyLqUYos+0Q=;
 b=fBMWZbu7wInwNdACHDhITsT9dgfSepbdZmngnqN/jaGAZIPx6TYsaDqaT4JJuwWpQ/
 4XzTtS6BCQQ5nr+X+KxNjAVzXpVl1Cv1O2f/t8kcGiID3wy/vWhXtgkYHV2e7wLqCa7z
 726knwoiQevWarMSx/926pX9akv6y0J723wIZT2wmKNyPL+HzSmp3+bCL3bqLu3lefFJ
 pftcvg5e3mQJaQLDRHZMrYm5xItYCMmGX9IEzLwPz3tD/Y9HLU3I+X15u5EkEiWxThQn
 3g/uIkZ0fMgUcxrua6uF4+RMSlJnEwwUlmTTQ4e2HFuSykLF+ZkeOnWtpJBzAq7iQn/j
 lqcw==
X-Gm-Message-State: AOJu0Yzf9JoF/eYwZLQpwcjZVP33HETKChRyh8XYyEuSaxWNzJX4J7Dh
 2uDISXwwlN5QMPWZ8kvE7mgF86R1q3jbjJPc8x8ZQ/QSUDie9pFzu2DY0d6e9KLIOzm484xxF5J
 lJpq0wfn2ar6hKVNj1qmiy/9MTXT2XcxJk67a3lFr2m95X19rFNY8m82SVvQ+fYigMZdwqs51RH
 sREXqnMn/jJQ8ug8K7agJz8/2c3cyTPuP8OeNduLbguENJsNxMNNqs
X-Google-Smtp-Source: AGHT+IGIAatVhJaoj1NkDVa/3dwuyE/H+KtvMOaZjHqsbCL5ZpXuTudsbrOVnYu/MtPfnUkI5bxgRw==
X-Received: by 2002:a81:fe0c:0:b0:647:88ba:f91b with SMTP id
 00721157ae682-64788bafa5cmr43504187b3.11.1719466497346; 
 Wed, 26 Jun 2024 22:34:57 -0700 (PDT)
Received: from vertex.vmware.com (pool-173-49-113-140.phlapa.fios.verizon.net.
 [173.49.113.140]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-44641eebfa0sm2716971cf.48.2024.06.26.22.34.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jun 2024 22:34:57 -0700 (PDT)
From: Zack Rusin <zack.rusin@broadcom.com>
To: dri-devel@lists.freedesktop.org
Cc: Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, ian.forbes@broadcom.com,
 martin.krastev@broadcom.com, maaz.mombasawala@broadcom.com,
 Zack Rusin <zack.rusin@broadcom.com>
Subject: [PATCH 2/4] drm/vmwgfx: Make sure the screen surface is ref counted
Date: Thu, 27 Jun 2024 01:34:50 -0400
Message-Id: <20240627053452.2908605-3-zack.rusin@broadcom.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240627053452.2908605-1-zack.rusin@broadcom.com>
References: <20240627053452.2908605-1-zack.rusin@broadcom.com>
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
 drivers/gpu/drm/vmwgfx/vmwgfx_vkms.c | 37 +++++++++++++++++-----------
 1 file changed, 23 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_vkms.c b/drivers/gpu/drm/vmwgfx/vmwgfx_vkms.c
index 3bfcf671fcd5..c35f7df99977 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_vkms.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_vkms.c
@@ -130,22 +130,26 @@ crc_generate_worker(struct work_struct *work)
 		return;
 
 	spin_lock_irq(&du->vkms.crc_state_lock);
-	surf = du->vkms.surface;
+	surf = vmw_surface_reference(du->vkms.surface);
 	spin_unlock_irq(&du->vkms.crc_state_lock);
 
-	if (vmw_surface_sync(vmw, surf)) {
-		drm_warn(crtc->dev, "CRC worker wasn't able to sync the crc surface!\n");
-		return;
+	if (surf) {
+		if (vmw_surface_sync(vmw, surf)) {
+			drm_warn(
+				crtc->dev,
+				"CRC worker wasn't able to sync the crc surface!\n");
+			return;
+		}
+
+		ret = compute_crc(crtc, surf, &crc32);
+		if (ret)
+			return;
+		vmw_surface_unreference(&surf);
 	}
 
-	ret = compute_crc(crtc, surf, &crc32);
-	if (ret)
-		return;
-
 	spin_lock_irq(&du->vkms.crc_state_lock);
 	frame_start = du->vkms.frame_start;
 	frame_end = du->vkms.frame_end;
-	crc_pending = du->vkms.crc_pending;
 	du->vkms.frame_start = 0;
 	du->vkms.frame_end = 0;
 	du->vkms.crc_pending = false;
@@ -164,7 +168,7 @@ vmw_vkms_vblank_simulate(struct hrtimer *timer)
 	struct vmw_display_unit *du = container_of(timer, struct vmw_display_unit, vkms.timer);
 	struct drm_crtc *crtc = &du->crtc;
 	struct vmw_private *vmw = vmw_priv(crtc->dev);
-	struct vmw_surface *surf = NULL;
+	bool has_surface = false;
 	u64 ret_overrun;
 	bool locked, ret;
 
@@ -179,10 +183,10 @@ vmw_vkms_vblank_simulate(struct hrtimer *timer)
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
@@ -336,6 +340,8 @@ vmw_vkms_crtc_cleanup(struct drm_crtc *crtc)
 {
 	struct vmw_display_unit *du = vmw_crtc_to_du(crtc);
 
+	if (du->vkms.surface)
+		vmw_surface_unreference(&du->vkms.surface);
 	WARN_ON(work_pending(&du->vkms.crc_generator_work));
 	hrtimer_cancel(&du->vkms.timer);
 }
@@ -497,9 +503,12 @@ vmw_vkms_set_crc_surface(struct drm_crtc *crtc,
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

