Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A90177432AF
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jun 2023 04:20:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A32A910E434;
	Fri, 30 Jun 2023 02:20:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EED2410E434
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jun 2023 02:20:24 +0000 (UTC)
Received: by mail-oi1-x232.google.com with SMTP id
 5614622812f47-3a1a0e5c2bcso992229b6e.2
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jun 2023 19:20:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688091623; x=1690683623;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ta4EJbZZ0uV3MxaQXraN6HqKk8GzjbnpNw8IbX9ky+g=;
 b=TPV5PImZsHzOznLksdHPnIn+FCKyQmrTmJtjsgRrJQQr/WiyaQMA0Lq58dokiR0rKN
 uJH3mNfiuKKAK6fF1kCpYdoQ7G1Ma+oP2O+3YD+lUXwSdzitKiKrc+3vYPwOtH5tiAfm
 25/hXKSfUD7kDWtFc3Nt6Ocx6S2q9nq2IHEZuWezVBUTmJWj65DbdOOIVnujI9Zdbnqm
 opLSeLa3iSMK3r1AgkjFDY565wz3iYJ6KN8MplPXB+cU122BpSvl0DWPbFstcszqnfKx
 jGIOQVUvC41C/n9Hbcdibn30pEDRuVjk3Dnolg3ZruHYoTtMF+fU1wl+q6Jz1HlelJjo
 x6jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688091623; x=1690683623;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ta4EJbZZ0uV3MxaQXraN6HqKk8GzjbnpNw8IbX9ky+g=;
 b=jjyGPnWyxonTBNueGIewZJ53f7WATBGUoOmkZf1N4W9KZIsnrV8HmAUpfNWkjt9tg3
 628zwhNEnkGo3FQuore29R2P4ju3587sZNDiWmVprIxIKSheW0OCmzQ5LWe6xtMlbciq
 unNKVXtspW0xf0zCJeuujtMb6bxypEzRGRNOxkFX+Wvru/Yk0gIQegfLBp6gsLNkF8kC
 RBFSukDJYWOYf8N7Dy4OJOCGkWcDqHBn1QIkSfKkH2XN2SDywsxfg84qrsSObEnhhPwd
 Hm9KLtZs0JfXwdetsl+a5twGEdE8Rx8o5ez+o0uETuiyC0OyiBPDEJ8T2rYLkoMMlD9a
 hjIw==
X-Gm-Message-State: AC+VfDyYIYL4UyHbSHxst0XCU6hjxaRgIOLuN4AHGkCZcvNnQ7Vs+fjG
 m2NeeUfBXjtXWAdqq3cWgSI=
X-Google-Smtp-Source: ACHHUZ44vTUV957qp9+DnLN4eNNEpL6MTmRnTy+8ptocJfF63+XpjMn4jsXa4h2C+NbR++rf1zLuxw==
X-Received: by 2002:a05:6808:6295:b0:3a3:76d4:b506 with SMTP id
 du21-20020a056808629500b003a376d4b506mr1091901oib.20.1688091623504; 
 Thu, 29 Jun 2023 19:20:23 -0700 (PDT)
Received: from oslab-pc.tsinghua.edu.cn ([166.111.139.122])
 by smtp.gmail.com with ESMTPSA id
 t18-20020aa79392000000b0063d24fcc2b7sm3055384pfe.1.2023.06.29.19.20.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jun 2023 19:20:23 -0700 (PDT)
From: Tuo Li <islituo@gmail.com>
To: inki.dae@samsung.com, sw0312.kim@samsung.com, kyungmin.park@samsung.com,
 airlied@gmail.com, daniel@ffwll.ch, krzysztof.kozlowski@linaro.org,
 alim.akhtar@samsung.com
Subject: [PATCH] drm/exynos: fix a possible null-pointer dereference due to
 data race in exynos_drm_crtc_atomic_disable()
Date: Fri, 30 Jun 2023 10:19:06 +0800
Message-Id: <20230630021906.1035115-1-islituo@gmail.com>
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
Cc: linux-samsung-soc@vger.kernel.org, BassCheck <bass@buaa.edu.cn>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 baijiaju1990@outlook.com, Tuo Li <islituo@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The variable crtc->state->event is often protected by the lock 
crtc->dev->event_lock when is accessed. However, it is accessed as a 
condition of an if statement in exynos_drm_crtc_atomic_disable() without
holding the lock:

  if (crtc->state->event && !crtc->state->active)

However, if crtc->state->event is changed to NULL by another thread right
after the conditions of the if statement is checked to be true, a
null-pointer dereference can occur in drm_crtc_send_vblank_event():

  e->pipe = pipe;

To fix this possible null-pointer dereference caused by data race, the 
spin lock coverage is extended to protect the if statement as well as the 
function call to drm_crtc_send_vblank_event().

Reported-by: BassCheck <bass@buaa.edu.cn>
Signed-off-by: Tuo Li <islituo@gmail.com>
---
 drivers/gpu/drm/exynos/exynos_drm_crtc.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_crtc.c b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
index 4153f302de7c..d19e796c2061 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_crtc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
@@ -39,13 +39,12 @@ static void exynos_drm_crtc_atomic_disable(struct drm_crtc *crtc,
 	if (exynos_crtc->ops->atomic_disable)
 		exynos_crtc->ops->atomic_disable(exynos_crtc);
 
+	spin_lock_irq(&crtc->dev->event_lock);
 	if (crtc->state->event && !crtc->state->active) {
-		spin_lock_irq(&crtc->dev->event_lock);
 		drm_crtc_send_vblank_event(crtc, crtc->state->event);
-		spin_unlock_irq(&crtc->dev->event_lock);
-
 		crtc->state->event = NULL;
 	}
+	spin_unlock_irq(&crtc->dev->event_lock);
 }
 
 static int exynos_crtc_atomic_check(struct drm_crtc *crtc,
-- 
2.34.1

