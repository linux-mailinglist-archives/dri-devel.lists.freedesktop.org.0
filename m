Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A07E8D6AC3
	for <lists+dri-devel@lfdr.de>; Fri, 31 May 2024 22:34:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A04210E24D;
	Fri, 31 May 2024 20:34:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="gXeNHToc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com
 [209.85.219.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A688E10E24D
 for <dri-devel@lists.freedesktop.org>; Fri, 31 May 2024 20:34:06 +0000 (UTC)
Received: by mail-qv1-f53.google.com with SMTP id
 6a1803df08f44-6ad86f3cc34so13365566d6.1
 for <dri-devel@lists.freedesktop.org>; Fri, 31 May 2024 13:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1717187645; x=1717792445;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=VG4fKDoR0MZdZL89UBnHdjsmPOpDCoGlITEWplFbIHQ=;
 b=gXeNHTocA7OoohPaCJam+ryUyinZOGqcC0ARwQt4PcSaiAg5LF0O4U8k8mkWrtiWLl
 awMtzQZJLmLYU6RJG0SMzpZO/UVO4aMbBVj2GOgAhLdoic4jH7pw0we2FMG4On7RhCet
 syVHBd0IhiuuuAFtwwvXTMwvkGkUg0kAFjKFc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717187645; x=1717792445;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VG4fKDoR0MZdZL89UBnHdjsmPOpDCoGlITEWplFbIHQ=;
 b=HVVQezwY7YxpPcZsX5FVxpUcTeGD22wN6VTkIfdttejLdZttQIfUuaAabo41cRkzZR
 aoVSyy/M2oIiydMi0et1tp4lzsicPHTTxPSp9wby9EkDVYzKNqrqNYtH5sjG9Y/KjD2X
 EwF17MYuvMcIqx5o4sSCX//OADTwCsfcypsSGtLt5FG9FS6UTAnBAYeqQj/12IiCSBOC
 oK60wrQY4T2ereoHLH33qevrB93WEmHsm7LqJjfUDcBGtHNAhL7aPvufNPC/N42cnU2B
 QhWjoCsTpFl/nvr0oaUA3wCWGuxPWUmzKzM4/G3P3BUPYzbfhRchvbFfWyWKtjz4rmC5
 VbwA==
X-Gm-Message-State: AOJu0Yy/DJPFQ3l6Pn8SxA3I2lurvmuQynAy+YlgX095swoxbxZ9oyLQ
 E/PUN4l/VYtGWsiURUjU1lxnffFd41Tw0vEC4G/26LLc0onNjswdOAef+kRGZPB3j8ZQSGE4qno
 atCMFjLOCoNRWPDjEugDDfUNGQF0oD/lu7OWmntLd3WLam5Xnve+DfW4baL/v+XaRgE90lesEdT
 TEdPmEMxm/Y4BWgNfaZiSsIBzzNXpfJ7hlu/HpI3joC0oNiu3UzQ==
X-Google-Smtp-Source: AGHT+IEwo9njq3Wn0REGaU1eARkyktkXWJzv9zK20+VIZie6485BVSZl9C6y0z3phhaNVNDRZ1s/PQ==
X-Received: by 2002:a05:6214:4b0e:b0:6ab:92b7:58f6 with SMTP id
 6a1803df08f44-6aecd6fc38fmr26522286d6.54.1717187645102; 
 Fri, 31 May 2024 13:34:05 -0700 (PDT)
Received: from localhost ([192.19.144.250]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6ae4b42b90csm9367436d6.139.2024.05.31.13.34.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 May 2024 13:34:04 -0700 (PDT)
From: Ian Forbes <ian.forbes@broadcom.com>
To: dri-devel@lists.freedesktop.org
Cc: bcm-kernel-feedback-list@broadcom.com, zack.rusin@broadcom.com,
 martin.krastev@broadcom.com, maaz.mombasawala@broadcom.com,
 Ian Forbes <ian.forbes@broadcom.com>
Subject: [PATCH] drm/vmwgfx: Don't destroy Screen Target when CRTC is enabled
 but inactive
Date: Fri, 31 May 2024 15:33:58 -0500
Message-Id: <20240531203358.26677-1-ian.forbes@broadcom.com>
X-Mailer: git-send-email 2.34.1
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

drm_crtc_helper_funcs::atomic_disable can be called even when the CRTC is
still enabled. This can occur when the mode changes or the CRTC is set as
inactive.

In the case where the CRTC is being set as inactive we only want to
blank the screen. The Screen Target should remain intact as long as the
mode has not changed and CRTC is enabled.

This fixes a bug with GDM where locking the screen results in a permanent
black screen because the Screen Target is no longer defined.

Fixes: 7b0062036c3b ("drm/vmwgfx: Implement virtual crc generation")
Signed-off-by: Ian Forbes <ian.forbes@broadcom.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c b/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
index 2041c4d48daa..d2f523191314 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
@@ -414,6 +414,7 @@ static void vmw_stdu_crtc_atomic_disable(struct drm_crtc *crtc,
 {
 	struct vmw_private *dev_priv;
 	struct vmw_screen_target_display_unit *stdu;
+	struct drm_crtc_state *new_crtc_state;
 	int ret;
 
 	if (!crtc) {
@@ -423,6 +424,7 @@ static void vmw_stdu_crtc_atomic_disable(struct drm_crtc *crtc,
 
 	stdu     = vmw_crtc_to_stdu(crtc);
 	dev_priv = vmw_priv(crtc->dev);
+	new_crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
 
 	if (dev_priv->vkms_enabled)
 		drm_crtc_vblank_off(crtc);
@@ -434,6 +436,14 @@ static void vmw_stdu_crtc_atomic_disable(struct drm_crtc *crtc,
 
 		(void) vmw_stdu_update_st(dev_priv, stdu);
 
+		/* Don't destroy the Screen Target if we are only setting the
+		 * display as inactive
+		 */
+		if (new_crtc_state->enable &&
+		    !new_crtc_state->active &&
+		    !new_crtc_state->mode_changed)
+			return;
+
 		ret = vmw_stdu_destroy_st(dev_priv, stdu);
 		if (ret)
 			DRM_ERROR("Failed to destroy Screen Target\n");
-- 
2.34.1

