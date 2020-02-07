Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DB75155C69
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2020 18:02:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC7D96FD2B;
	Fri,  7 Feb 2020 17:01:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB9FD6E85A
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Feb 2020 04:23:58 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id b22so453705pls.12
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Feb 2020 20:23:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=t4CLMTIbjn78HyIw3MbTj9fsK/Q9HVmk1YRH08HvFW4=;
 b=eiiOqXCQpKTTs3qcK0ClTRSeD0ED+jYP1J9vmKsXeIxVqH7nb3dGN8TXf1xmZgDlwZ
 y2cRaE8wwKl+xqQwb9n1WEutzhlXPKh+ksiz8uU4xYzGVv9hHFpOq1Zh4lOqB+UysOVM
 nlPGDQkicWj7hfppZ1DzZB4KXiZedkDnLILEc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=t4CLMTIbjn78HyIw3MbTj9fsK/Q9HVmk1YRH08HvFW4=;
 b=lgG+aHVC9kl1CFnhVfczj7fGISv0LsUn09HJHO+RA+NGZnX31pJM6M7WBky/9PSgu+
 ORApb2gBbGdhf4MBPcDZib4AKEDNcP1ddG99b/lB6evAOdW0PmDZqGa/4y+PmFZmi3BM
 K8AwYDkJMcFVN57rd05/uCp4nBDz148e+DjJpouAE2XZrqqrAYvpH/vOhlDdZ9EUG5dN
 lCgrY+BkO1MWRJHjDl/L+3KyIkRYKP4xOAszXxv/Is7Xms8lDg8bAlTa9x6Y8jrSGCDp
 s8/PMxDO2f8e9+rH4WIDMD2uFyEdv/rPvzZO4bN20ee3wZMIWIOLnWthzdh3IPrWKXxf
 Vp6w==
X-Gm-Message-State: APjAAAXWe1B9TuJHZdixIc+WbOkspwT1OBL16+G/Z8j5dVbyuLlVC3z/
 fHuDkyPWfRpWETurk4xFjSwH+SpNOaPzxw==
X-Google-Smtp-Source: APXvYqxiM3mqXCuN//rbnMylmv3QEfgT2tAo0lrKJQKSE7Su2Tg5GR9a9AXOc66j0jtTmDYhbnQnRw==
X-Received: by 2002:a17:90a:3ae5:: with SMTP id
 b92mr1540962pjc.26.1581049438091; 
 Thu, 06 Feb 2020 20:23:58 -0800 (PST)
Received: from localhost ([2401:fa00:9:14:1105:3e8a:838d:e326])
 by smtp.gmail.com with ESMTPSA id v7sm950245pfn.61.2020.02.06.20.23.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Feb 2020 20:23:57 -0800 (PST)
From: Evan Benn <evanbenn@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/mediatek: Find the cursor plane instead of hard coding it
Date: Fri,  7 Feb 2020 15:23:51 +1100
Message-Id: <20200207152348.1.Ie0633018fc787dda6e869cae23df76ae30f2a686@changeid>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
In-Reply-To: <20200206140140.GA18465@art_vandelay>
References: <20200206140140.GA18465@art_vandelay>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 07 Feb 2020 17:01:42 +0000
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 Evan Benn <evanbenn@chromium.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The cursor and primary planes were hard coded.
Now search for them for passing to drm_crtc_init_with_planes

Signed-off-by: Evan Benn <evanbenn@chromium.org>
---

 drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index 7b392d6c71cc..935652990afa 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -658,10 +658,18 @@ static const struct drm_crtc_helper_funcs mtk_crtc_helper_funcs = {
 
 static int mtk_drm_crtc_init(struct drm_device *drm,
 			     struct mtk_drm_crtc *mtk_crtc,
-			     struct drm_plane *primary,
-			     struct drm_plane *cursor, unsigned int pipe)
+			     unsigned int pipe)
 {
-	int ret;
+	struct drm_plane *primary = NULL;
+	struct drm_plane *cursor = NULL;
+	int i, ret;
+
+	for (i = 0; i < mtk_crtc->layer_nr; i++) {
+		if (mtk_crtc->planes[i].type == DRM_PLANE_TYPE_PRIMARY)
+			primary = &mtk_crtc->planes[i];
+		else if (mtk_crtc->planes[i].type == DRM_PLANE_TYPE_CURSOR)
+			cursor = &mtk_crtc->planes[i];
+	}
 
 	ret = drm_crtc_init_with_planes(drm, &mtk_crtc->base, primary, cursor,
 					&mtk_crtc_funcs, NULL);
@@ -830,9 +838,7 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
 			return ret;
 	}
 
-	ret = mtk_drm_crtc_init(drm_dev, mtk_crtc, &mtk_crtc->planes[0],
-				mtk_crtc->layer_nr > 1 ? &mtk_crtc->planes[1] :
-				NULL, pipe);
+	ret = mtk_drm_crtc_init(drm_dev, mtk_crtc, pipe);
 	if (ret < 0)
 		return ret;
 
-- 
2.25.0.341.g760bfbb309-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
