Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D01F7C0240
	for <lists+dri-devel@lfdr.de>; Tue, 10 Oct 2023 19:07:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73B1110E045;
	Tue, 10 Oct 2023 17:07:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D002810E045
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Oct 2023 17:07:52 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4053e6e8ca7so17585965e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Oct 2023 10:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1696957670; x=1697562470; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=eXyBJhJWHS+iqfNckARTquP/STu9jXTiX6+VXFVHkSk=;
 b=Yb0+STfYLIq0Aw/wIXmZe0v3T5cLSKzP6Lu/WBEM1t+XD2AbLRNDDpciuGEhXOOzcl
 c6BQJ9eDIg/X4wIgxp8uo+3MNi4eJI+el27+/ijQKb5N6yJ834jlNDJJbrupNuutTNpI
 GmM7thPao4J+4/xrrOc2b7z3lne2QsgrQ+Vj8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696957670; x=1697562470;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eXyBJhJWHS+iqfNckARTquP/STu9jXTiX6+VXFVHkSk=;
 b=pAT/h/LgeBj9Q9g8yJ2DCT6yDzDFmAwcWUyRwM052pVBWwYJxDOqOuIC495HOYW9R1
 IHd/TthTnrON9DRgHl1/D3yHOB0nzGvvYFIrKtQ4nRNUrGdclr2yxdzhFnsZhdCvTD9C
 5jTmEkuNrBJqGKaFwL8fYoPus0X1D55dJEB3qZ/EObcRur8pPp2VuvMeylRTUoUq+LYI
 yPHkL8oEb5GYmdp/H3DPLNmS9WnNX84sYM0Sqj6oG0ubTq00W5+voPrwmIrwWcXNkUT3
 gV8Q5MBigSnQk5KUDQWD6AoPN4Gzt/t2kzzGl5gerEr31/dE5MIF8i+pPKZN4LgvHNom
 SNYw==
X-Gm-Message-State: AOJu0YxVhVP2p+vgj+TxbbYONSx0BL5xubnP7iHnvHf2mCFui3ZwuMkQ
 17ZYPYThFCKnQZQKeSdRNz0ulK3LjGxD+GS2d2c=
X-Google-Smtp-Source: AGHT+IF6UGFFu5jycA/7PjaYr4CGZ7EznY+1+t/+2KtPpsz9ZLT45z9QiWjJTOZikQcJX0aTb1eXLg==
X-Received: by 2002:a05:600c:214f:b0:406:513d:738f with SMTP id
 v15-20020a05600c214f00b00406513d738fmr17032509wml.2.1696957669909; 
 Tue, 10 Oct 2023 10:07:49 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 x11-20020adff0cb000000b00323293bd023sm13294584wro.6.2023.10.10.10.07.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Oct 2023 10:07:49 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/atomic: clarify the rules around
 drm_atomic_state->allow_modeset
Date: Tue, 10 Oct 2023 19:07:46 +0200
Message-Id: <20231010170746.617366-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.40.1
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
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

msm is automagically upgrading normal commits to full modesets, and
that's a big no-no:

- for one this results in full on->off->on transitions on all these
  crtc, at least if you're using the usual helpers. Which seems to be
  the case, and is breaking uapi

- further even if the ctm change itself would not result in flicker,
  this can hide modesets for other reasons. Which again breaks the
  uapi

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Simon Ser <contact@emersion.fr>
Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 include/drm/drm_atomic.h | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
index cf8e1220a4ac..09bef1b6c170 100644
--- a/include/drm/drm_atomic.h
+++ b/include/drm/drm_atomic.h
@@ -372,8 +372,22 @@ struct drm_atomic_state {
 	 *
 	 * Allow full modeset. This is used by the ATOMIC IOCTL handler to
 	 * implement the DRM_MODE_ATOMIC_ALLOW_MODESET flag. Drivers should
-	 * never consult this flag, instead looking at the output of
-	 * drm_atomic_crtc_needs_modeset().
+	 * not consult this flag, instead looking at the output of
+	 * drm_atomic_crtc_needs_modeset(). The detailed rules are:
+	 *
+	 * - Drivers must not consult @allow_modeset in the atomic commit path,
+	 *   and instead use drm_atomic_crtc_needs_modeset().
+	 *
+	 * - Drivers may consult @allow_modeset in the atomic check path, if
+	 *   they have the choice between an optimal hardware configuration
+	 *   which requires a modeset, and a less optimal configuration which
+	 *   can be committed without a modeset. An example would be suboptimal
+	 *   scanout FIFO allocation resulting in increased idle power
+	 *   consumption. This allows userspace to avoid flickering and delays
+	 *   for the normal composition loop at reasonable cost.
+	 *
+	 * - Drivers must never change this flag, it is only under the control
+	 *   of userspace.
 	 */
 	bool allow_modeset : 1;
 	/**
-- 
2.40.1

