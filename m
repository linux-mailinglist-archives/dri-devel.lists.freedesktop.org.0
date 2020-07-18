Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0847B22588F
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jul 2020 09:31:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 030266E180;
	Mon, 20 Jul 2020 07:30:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 020C66E297
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Jul 2020 20:04:05 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id o8so18766216wmh.4
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Jul 2020 13:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=n3wmalXMf5RKdLRLN2Edh3BeBHa7ZnwIzM8k1DA3s8I=;
 b=ne7cdRDd09qgXdnFVUb/lT9/BuqLGPItDxnLgkv7cX0/mvBii4cFfQbmUZLzduYq/6
 7s1F2WyE0DfQdHL9LRQ3w+SXHJZHudNgSrNlzDzP6rNJVSjGmKzqkI0Okiuh1Y+MpAwj
 NOo2VKijv3w4EBiZs6GIergq/76K2S6aj4xlGGQB9eggoNxVZO+Y2caT2sDVd+7wGMiF
 jcqsOSGE9J4OynScE+4OO7H5XAMbqzrYH9KsFHsTBBu2zV4zWyV+kB3KnmwwKwGStaWL
 GGLgHQ3Cd92TSwOhiXTxdAPm3D9TlxnMdwux/3IzID6gVlKnkJ/GZIq5+HvTUbjxpHGm
 cUaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=n3wmalXMf5RKdLRLN2Edh3BeBHa7ZnwIzM8k1DA3s8I=;
 b=JlD77qSNSz5PgdkHUQZiWoTpUSgSzkijt7ECS2Wn7qZyqV1V1aZ3P5tF1Bfh9z7eCg
 FYT8zDZunF2CGJTjkxj0QYdQG51Du5cpZTZlTtRLYoWVnq7HformVwvFbOlidb31hfPO
 1TUvjFQp1hGHQLnOGyGHEUAzgHd/VJPfLeL/jL4KzuQYDxJ8tahMuUgk0A4AChqZ+R33
 o5+j/VoBn3RAWdquigAv1DzZU8rnf1k0auWXfUYSG/dSzCRvY9+GIPl+Coh5hsqIXUv4
 kZBJd27OzJhhaAwajEqRJueaaqB+d5dNghDVF9XoQU84uC0Jg6ckIlQ+JUT44JPCX/X6
 zxbQ==
X-Gm-Message-State: AOAM5338N1emA9+qPuitMiNaEpThd/V6vD9IwduSHc0YGjkJMcNb0gJR
 r4NzBIFGg1hatsCJ4ucWuw==
X-Google-Smtp-Source: ABdhPJwdcwx43GlqCWVegzP07sgYkGwTpgWjf7cAPhoMDjs2HHlSuCYvAXYz9Ut+qF6WP+Sx7f3KlQ==
X-Received: by 2002:a1c:6a13:: with SMTP id f19mr15709913wmc.106.1595102643612; 
 Sat, 18 Jul 2020 13:04:03 -0700 (PDT)
Received: from localhost.localdomain ([2a02:810b:f40:e00:922b:34ff:fe38:6455])
 by smtp.googlemail.com with ESMTPSA id
 l15sm21073826wro.33.2020.07.18.13.04.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Jul 2020 13:04:03 -0700 (PDT)
From: Alex Bee <knaerzche@gmail.com>
To: Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner=20?= <heiko@sntech.de>
Subject: [PATCH 5/5] drm: rockchip: use overlay windows as such
Date: Sat, 18 Jul 2020 22:03:23 +0200
Message-Id: <20200718200323.3559-6-knaerzche@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200718200323.3559-1-knaerzche@gmail.com>
References: <20200718200323.3559-1-knaerzche@gmail.com>
X-Mailman-Approved-At: Mon, 20 Jul 2020 07:30:37 +0000
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
Cc: David Airlie <airlied@linux.ie>, Alex Bee <knaerzche@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As stated in the comment for rk3288_vop_win_data windows
that are supposed to be an overlay window are missused as HWC windows
due to the missing implementation of that window type in VOP driver.

This is also true for RK3036, RK3126, RK3188 and RK3228 VOPs which
all have at least one dedicated HWC window (which are currently not
definded in the driver).
Since all of the mentioned VOPs have only one overlay window and all
of them support alpha blending now it should be used as such, since
this gives a much wider usage-perspective for them.

Signed-off-by: Alex Bee <knaerzche@gmail.com>
---
 drivers/gpu/drm/rockchip/rockchip_vop_reg.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_vop_reg.c b/drivers/gpu/drm/rockchip/rockchip_vop_reg.c
index f2f9a9af39e3..756c580f206a 100644
--- a/drivers/gpu/drm/rockchip/rockchip_vop_reg.c
+++ b/drivers/gpu/drm/rockchip/rockchip_vop_reg.c
@@ -131,7 +131,7 @@ static const struct vop_win_data rk3036_vop_win_data[] = {
 	{ .base = 0x00, .phy = &rk3036_win0_data,
 	  .type = DRM_PLANE_TYPE_PRIMARY },
 	{ .base = 0x00, .phy = &rk3036_win1_data,
-	  .type = DRM_PLANE_TYPE_CURSOR },
+	  .type = DRM_PLANE_TYPE_OVERLAY },
 };
 
 static const int rk3036_vop_intrs[] = {
@@ -200,7 +200,7 @@ static const struct vop_win_data rk3126_vop_win_data[] = {
 	{ .base = 0x00, .phy = &rk3036_win0_data,
 	  .type = DRM_PLANE_TYPE_PRIMARY },
 	{ .base = 0x00, .phy = &rk3126_win1_data,
-	  .type = DRM_PLANE_TYPE_CURSOR },
+	  .type = DRM_PLANE_TYPE_OVERLAY },
 };
 
 static const struct vop_data rk3126_vop = {
@@ -543,7 +543,7 @@ static const struct vop_win_data rk3188_vop_win_data[] = {
 	{ .base = 0x00, .phy = &rk3188_win0_data,
 	  .type = DRM_PLANE_TYPE_PRIMARY },
 	{ .base = 0x00, .phy = &rk3188_win1_data,
-	  .type = DRM_PLANE_TYPE_CURSOR },
+	  .type = DRM_PLANE_TYPE_OVERLAY },
 };
 
 static const int rk3188_vop_intrs[] = {
@@ -980,7 +980,7 @@ static const struct vop_win_data rk3228_vop_win_data[] = {
 	{ .base = 0x00, .phy = &rk3288_win01_data,
 	  .type = DRM_PLANE_TYPE_PRIMARY },
 	{ .base = 0x40, .phy = &rk3288_win01_data,
-	  .type = DRM_PLANE_TYPE_CURSOR },
+	  .type = DRM_PLANE_TYPE_OVERLAY },
 };
 
 static const struct vop_data rk3228_vop = {
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
