Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF8B66D4D36
	for <lists+dri-devel@lfdr.de>; Mon,  3 Apr 2023 18:08:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9474710E507;
	Mon,  3 Apr 2023 16:07:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41C4310E507
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Apr 2023 16:07:55 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id
 r7-20020a17090b050700b002404be7920aso29045762pjz.5
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Apr 2023 09:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680538069;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=BKnixP5n5+Zn1kJb+6YOX01TVCjG+8+3f8j/QO7AJFw=;
 b=V3H8+AJ3GOgAjkJY76fFg82MzOHHzyoqvXzhkD0EA7jIuN/54d114thC7Lp5rUh3df
 wuqbdE7S3EoWtBXIJzbwKuURS9rtPuCUII8rYExUQARSLuAmoH5c9tZwWQqVml44/Jcv
 bVrswAJ5dvfrmfWGEZFcpxH2epzsk4bNBPv/L9o8r/BbowC4B2QNg44Z37DMWGCinVor
 Y6dtHL6P7q79JM+rTw0uFo3kdfK59xFw1xCY5if0r6F2Jehvoxpl6G7OmCahTYDE63WH
 sPiacw/SeSrMJjXgy34t1+UEe0TAWb822+2bpwWSvnonrgJzOfIdjlaot5um10ycTwVx
 AhOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680538069;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BKnixP5n5+Zn1kJb+6YOX01TVCjG+8+3f8j/QO7AJFw=;
 b=EHmWPaGqJ6mtpgy8JSrcLHeb75kWsIoYo9m0dyTkl/ZO8pqqr6mM57MO5bTR3+4kBY
 1mfzf7cD2dPNbCIfL5GFfpP3Szh6OBp9fCOVGv0hlWV61rL7snmPdU5UL4nknxpJM7aR
 DX7+e3DMo1Qwc7R0BB7UwyEJYSluOMm+qqYwG5GOE3ULNFUKl4Sr2HDj6cPH/xBGMYyP
 ulUfjwjvkezozXK+1USpkMXzcxiySv1glbTjwADtG2hel22UM6/yinZ1nKiYcNlPpqwD
 L+kAKndAYfCovUc5SWFPwfKs99b2JuUtSGjyceE1Lr/tZBpi3yFBkBog4iskTj0vI1QK
 GLCw==
X-Gm-Message-State: AO0yUKUe2ANEOxTqgtIV9fBia2Ucsbmkoln9wrHH49nI9f1xnSWGgMM2
 zb4NkjRcojuwyYtLXe4iABHQN9ubEFo=
X-Google-Smtp-Source: AK7set/GZdIC5QOn9o/FcyqqFSgG9/q68k+OzsO743dI9WPlbAYjMWr8JeyWGWCnZBheZsYC1QwmSg==
X-Received: by 2002:a05:6a20:c129:b0:cd:1808:87c7 with SMTP id
 bh41-20020a056a20c12900b000cd180887c7mr30076046pzb.15.1680538069342; 
 Mon, 03 Apr 2023 09:07:49 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:61b:48ed:72ab:435b])
 by smtp.gmail.com with ESMTPSA id
 w15-20020aa7858f000000b0062d8c855ee9sm3423190pfn.149.2023.04.03.09.07.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Apr 2023 09:07:40 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/vblank: Simplify drm_dev_has_vblank()
Date: Mon,  3 Apr 2023 09:07:35 -0700
Message-Id: <20230403160735.1211468-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.39.2
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
Cc: Rob Clark <robdclark@chromium.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

What does vblank have to do with num_crtcs?  Well, this was technically
correct, but you'd have to go look at where num_crtcs is initialized to
understand why.  Lets just replace it with the simpler and more obvious
check.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/drm_vblank.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
index 877e2067534f..ad34c235d853 100644
--- a/drivers/gpu/drm/drm_vblank.c
+++ b/drivers/gpu/drm/drm_vblank.c
@@ -575,7 +575,7 @@ EXPORT_SYMBOL(drm_vblank_init);
  */
 bool drm_dev_has_vblank(const struct drm_device *dev)
 {
-	return dev->num_crtcs != 0;
+	return !!dev->vblank;
 }
 EXPORT_SYMBOL(drm_dev_has_vblank);
 
-- 
2.39.2

