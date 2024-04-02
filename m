Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0805896022
	for <lists+dri-devel@lfdr.de>; Wed,  3 Apr 2024 01:28:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0065311217C;
	Tue,  2 Apr 2024 23:28:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="OeCSinN8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 584D611217A
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Apr 2024 23:28:25 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id
 d2e1a72fcca58-6ea8ee55812so5748287b3a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Apr 2024 16:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1712100504; x=1712705304;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Uom5XV5QmkXR9aOb9X9fb+taSwN23XFnrrLT5o0XDnE=;
 b=OeCSinN8a9+C9Lt13iV8xpTboeZp1dPKrFtulwMRslKsI7Syj3zNjfkdt0jYT3ZAUP
 cpZsplhgHPZZZ7gaHeEHMNiJBo25Vmiq3Y6cfOqjR/0R3PDYq2YY3nYe8ecNQsAxzcLf
 MXwK+Z2r7uqjNmhR9pLsxa1OAgbefe+hr7VBg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712100504; x=1712705304;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Uom5XV5QmkXR9aOb9X9fb+taSwN23XFnrrLT5o0XDnE=;
 b=WEt7yU8tKiVHjKl1T/ILyuxQbCU9S4Vc4hE5fS/UxbWsS5sUoDvMb3EOhazlYWzlMn
 nH6dr2KOS4C02g0UlZtDO5Hz/1lGLJisstb3brM+H27Rz6+zWd7eft3rgJWg2Ic+S8ND
 Cch3Qmk6VSuFSU9gKnDp8BwM43R2wLjjp/PVgQ1n2bHyH2nvzZVCKnnpGqZnatDMHYPD
 dmcSFOB7W0DRlBQK8pz7eVqjV50kQID9FBTKKA9kkvF3PXY/So4YzawWVevkktOmze3s
 gD2jUs1FhVAEZc0s/3uGQNABpN2tLXqLikRqLxIqvyyDqOqgd77CV0j7i1JWoujISHDK
 w/JA==
X-Gm-Message-State: AOJu0YwembIqPTJUS+XIZTlxgH4c4t2XIdaeCdQJCnWF7bW8ZL0x5y4B
 l08CjCLBYdG7JwvCL2ahuCI/eErU+GqsOjnhPVMIvIfiRTATXMOvTowtNoAIcipUdnxX8wtSLri
 kQWg43MDcRMvgcAI6+cPWPgYfZVwbi+LPP2nl9S84PufJOGliKQ1Ktt+YN9QGZpn7rF11nN4oxl
 3gpgRukWe/gsQwMx2JE5rY686cwIB0SwJ0n5MBr1TxTQItz1evCQ==
X-Google-Smtp-Source: AGHT+IHB6Be3b7W1U4HByTSESH06WY7FXOUNJlc+l0jWf/r1B74Q5/1wv7eEeEmtCwQ0gxXCyyXGXw==
X-Received: by 2002:a05:6a00:179a:b0:6ea:b818:f499 with SMTP id
 s26-20020a056a00179a00b006eab818f499mr16689794pfg.19.1712100504510; 
 Tue, 02 Apr 2024 16:28:24 -0700 (PDT)
Received: from vertex.vmware.com (pool-173-49-113-140.phlapa.fios.verizon.net.
 [173.49.113.140]) by smtp.gmail.com with ESMTPSA id
 i21-20020aa787d5000000b006eaada3860dsm10385121pfo.200.2024.04.02.16.28.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Apr 2024 16:28:24 -0700 (PDT)
From: Zack Rusin <zack.rusin@broadcom.com>
To: dri-devel@lists.freedesktop.org
Cc: Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, ian.forbes@broadcom.com,
 martin.krastev@broadcom.com, maaz.mombasawala@broadcom.com,
 Zack Rusin <zack.rusin@broadcom.com>, stable@vger.kernel.org
Subject: [PATCH 4/5] drm/vmwgfx: Fix crtc's atomic check conditional
Date: Tue,  2 Apr 2024 19:28:12 -0400
Message-Id: <20240402232813.2670131-5-zack.rusin@broadcom.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240402232813.2670131-1-zack.rusin@broadcom.com>
References: <20240402232813.2670131-1-zack.rusin@broadcom.com>
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

The conditional was supposed to prevent enabling of a crtc state
without a set primary plane. Accidently it also prevented disabling
crtc state with a set primary plane. Neither is correct.

Fix the conditional and just driver-warn when a crtc state has been
enabled without a primary plane which will help debug broken userspace.

Fixes IGT's kms_atomic_interruptible and kms_atomic_transition tests.

Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
Fixes: 06ec41909e31 ("drm/vmwgfx: Add and connect CRTC helper functions")
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: dri-devel@lists.freedesktop.org
Cc: <stable@vger.kernel.org> # v4.12+
---
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
index e33e5993d8fc..13b2820cae51 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
@@ -931,6 +931,7 @@ int vmw_du_cursor_plane_atomic_check(struct drm_plane *plane,
 int vmw_du_crtc_atomic_check(struct drm_crtc *crtc,
 			     struct drm_atomic_state *state)
 {
+	struct vmw_private *vmw = vmw_priv(crtc->dev);
 	struct drm_crtc_state *new_state = drm_atomic_get_new_crtc_state(state,
 									 crtc);
 	struct vmw_display_unit *du = vmw_crtc_to_du(new_state->crtc);
@@ -938,9 +939,13 @@ int vmw_du_crtc_atomic_check(struct drm_crtc *crtc,
 	bool has_primary = new_state->plane_mask &
 			   drm_plane_mask(crtc->primary);
 
-	/* We always want to have an active plane with an active CRTC */
-	if (has_primary != new_state->enable)
-		return -EINVAL;
+	/*
+	 * This is fine in general, but broken userspace might expect
+	 * some actual rendering so give a clue as why it's blank.
+	 */
+	if (new_state->enable && !has_primary)
+		drm_dbg_driver(&vmw->drm,
+			       "CRTC without a primary plane will be blank.\n");
 
 
 	if (new_state->connector_mask != connector_mask &&
-- 
2.40.1

