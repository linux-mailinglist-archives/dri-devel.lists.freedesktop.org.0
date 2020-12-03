Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 990CD2CE9E4
	for <lists+dri-devel@lfdr.de>; Fri,  4 Dec 2020 09:35:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2412F6EC86;
	Fri,  4 Dec 2020 08:34:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2F3D6EB4B
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Dec 2020 14:42:57 +0000 (UTC)
Received: by mail-pj1-x1042.google.com with SMTP id f14so1211431pju.4
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Dec 2020 06:42:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=p3JIu6lw98cKabBdZ9zOZ/djlPH0Wt6XPKXzLtwvrLs=;
 b=PSkcaAW7awwXjQ0CMrmvkVTWs7N/4OnJHeT9sYTN9e1WvNx+09qSEMPbeuPmL57o7R
 UOvK23e+G/b7phpON10QIgqnbYnz587oMB6/dY8JUr7yrwCv9evVJ/QeXdADL1hpQ5gX
 VUEevggIzgaS5iXtj1we6EwsGJPQLuBtB7xKVLUUcUHEVuuHjRbND0kdv6hNAWYaDbW1
 Hgq/wRr/B2KPuHWdBiEpvIuWYvrH0TX6LK9lk6xrOqnT1E3Kn6sbq1qluCZ2VKQoLBfh
 D/gm79cj9tPqG3doLFwsNBLAdczsEVW+RG/oefqHHqQjl/WH0IDiae1Fk/dmZk7r5gL4
 SFuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=p3JIu6lw98cKabBdZ9zOZ/djlPH0Wt6XPKXzLtwvrLs=;
 b=IuQQ/bvfZ0hoQ0NlAbNd++KdwgptAyoktSt53ojAxZ0HBJ/AUcxnqUIgXuOovWV/o3
 vALjXUdRKSpNz1Ft1uEgb6hbUheuNMOcmb6tD6xFpyuzHXKoEHTZ0raCPNbDlcQw2oxf
 vB+PM46eXPSkdVNDtTUBB50WGnqNVoz8p+cNSdPsVpBuoK3LlkvNvvtT7sdVTG8T01R4
 9uVy3MOQTNtUhpPVuYzVh4CAgSY7S8yQ1KPOZnFkjHl+MX/dKgdgg21vFmyDhGNNPqJz
 sU3JnHhbPv6tEcH9Vf32kElohRXyFaEUC2u2+1ooTg6yPOsZt/C4PwN+lPWLGUaLAa7R
 4bcg==
X-Gm-Message-State: AOAM532VkTMKOQ5/rmdcrhB6bwSnrhakRbGAvWHTwK5313uHvBrYSj+Q
 Nb9i9YXWXS5P0QGnJc3IaLI=
X-Google-Smtp-Source: ABdhPJyP9BvP14g/wb4ZgOx3ktIQlO3Mldowi4PHo+Ye/qwyje5QG2/rjuo91G1zuj1dkvX6Gp0tYw==
X-Received: by 2002:a17:90a:6b0d:: with SMTP id
 v13mr3307192pjj.206.1607006577360; 
 Thu, 03 Dec 2020 06:42:57 -0800 (PST)
Received: from suzukaze.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
 by smtp.gmail.com with ESMTPSA id k9sm2232081pfp.68.2020.12.03.06.42.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Dec 2020 06:42:56 -0800 (PST)
From: Chuhong Yuan <hslester96@gmail.com>
To: 
Subject: [PATCH] drm/fb-helper: Add missed unlocks in setcmap_legacy()
Date: Thu,  3 Dec 2020 22:42:48 +0800
Message-Id: <20201203144248.418281-1-hslester96@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 04 Dec 2020 08:33:34 +0000
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Chuhong Yuan <hslester96@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Peter Rosin <peda@axentia.se>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

setcmap_legacy() does not call drm_modeset_unlock_all() in some exits,
add the missed unlocks with goto to fix it.

Fixes: 964c60063bff ("drm/fb-helper: separate the fb_setcmap helper into atomic and legacy paths")
Signed-off-by: Chuhong Yuan <hslester96@gmail.com>
---
 drivers/gpu/drm/drm_fb_helper.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index 1543d9d10970..8033467db4be 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -923,11 +923,15 @@ static int setcmap_legacy(struct fb_cmap *cmap, struct fb_info *info)
 	drm_modeset_lock_all(fb_helper->dev);
 	drm_client_for_each_modeset(modeset, &fb_helper->client) {
 		crtc = modeset->crtc;
-		if (!crtc->funcs->gamma_set || !crtc->gamma_size)
-			return -EINVAL;
+		if (!crtc->funcs->gamma_set || !crtc->gamma_size) {
+			ret = -EINVAL;
+			goto out;
+		}
 
-		if (cmap->start + cmap->len > crtc->gamma_size)
-			return -EINVAL;
+		if (cmap->start + cmap->len > crtc->gamma_size) {
+			ret = -EINVAL;
+			goto out;
+		}
 
 		r = crtc->gamma_store;
 		g = r + crtc->gamma_size;
@@ -940,8 +944,9 @@ static int setcmap_legacy(struct fb_cmap *cmap, struct fb_info *info)
 		ret = crtc->funcs->gamma_set(crtc, r, g, b,
 					     crtc->gamma_size, NULL);
 		if (ret)
-			return ret;
+			goto out;
 	}
+out:
 	drm_modeset_unlock_all(fb_helper->dev);
 
 	return ret;
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
