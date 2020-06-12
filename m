Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC4781F7B44
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jun 2020 18:01:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D5626E9DA;
	Fri, 12 Jun 2020 16:01:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C96A86E9F7
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jun 2020 16:01:08 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id u26so9465477wmn.1
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jun 2020 09:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9edpO/0nDjw8MbHtkOLQlTMXtNF/bFvFcs1wCzvqaNE=;
 b=RmdKYYVAB0MwG5SuaGWDL0n378xqj0UKR2ugbyV34AEb89kM51e9b9HRJZ0ikKdBuc
 B9C0JTVT88c3OToaO0mWw/TXYqK9UBckZWDC7aOkCwPdotyoZMBd4oZwoZrBkUuGnZOS
 JYbrXB49RsrMh7/PlWYkJBxYIQzV0K9XbCg+4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9edpO/0nDjw8MbHtkOLQlTMXtNF/bFvFcs1wCzvqaNE=;
 b=iSFrScUeFNVToFqjHgNztFxEuHoDtVhyNT2eD+cpDiik+1n+IKjBD19H7FC/WLF4HT
 a92OxclvnL6jIw3vVQhHhfQfAkC5hKnIuyPqmyPNlL7zQwVHWClFL5/cocxV1Tm373Da
 BaHxrMh4AVnXM/AR0wvM6dZ8JWvnJ1vhKnyRFdyEmxMuSu5Y/XGQ1TBIwj+QQ1XnT5F8
 RrP4rb7lENT907jhQWgQxsAORure2n+rudBqRyi3KQ1Rbk2M0ggwwPoFdMyTqYa6xInX
 tLMX98uqHZONqs1ja5jdACg47G0QYTKIMwvnTw8G3BvHaPXfuj3WGBIvSJroZf3QyS5J
 XTRA==
X-Gm-Message-State: AOAM532lBgy/BfrjMVnVUjCNlxNwgwaHCzEt7Ypr6hjpJMELXeHA6bNS
 BT0mqNxLHuzfxeSPMeCBaPC1UOGnv1k=
X-Google-Smtp-Source: ABdhPJyRA5JCt10uM462WYchlysJDh14QJpSPAUPgz+E7dH/E3C15TB4JYTTvqcYM2l4Duif233pBw==
X-Received: by 2002:a1c:1f85:: with SMTP id
 f127mr13454795wmf.163.1591977667256; 
 Fri, 12 Jun 2020 09:01:07 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id j5sm10801566wrq.39.2020.06.12.09.01.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jun 2020 09:01:06 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 4/8] drm/mtk: Use __drm_atomic_helper_crtc_reset
Date: Fri, 12 Jun 2020 18:00:52 +0200
Message-Id: <20200612160056.2082681-4-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200612160056.2082681-1-daniel.vetter@ffwll.ch>
References: <20200612160056.2082681-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Daniel Vetter <daniel.vetter@intel.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Now also comes with the added benefit of doing a drm_crtc_vblank_off(),
which means vblank state isn't ill-defined and fail-y at driver load
before the first modeset on each crtc.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mediatek@lists.infradead.org
---
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index a7dba4ced902..d654c7d514bd 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -112,19 +112,15 @@ static void mtk_drm_crtc_reset(struct drm_crtc *crtc)
 {
 	struct mtk_crtc_state *state;
 
-	if (crtc->state) {
+	if (crtc->state)
 		__drm_atomic_helper_crtc_destroy_state(crtc->state);
 
-		state = to_mtk_crtc_state(crtc->state);
-		memset(state, 0, sizeof(*state));
-	} else {
-		state = kzalloc(sizeof(*state), GFP_KERNEL);
-		if (!state)
-			return;
-		crtc->state = &state->base;
-	}
+	kfree(to_mtk_crtc_state(crtc->state));
+	crtc->state = NULL;
 
-	state->base.crtc = crtc;
+	state = kzalloc(sizeof(*state), GFP_KERNEL);
+	if (state)
+		__drm_atomic_helper_crtc_reset(crtc, &state->base);
 }
 
 static struct drm_crtc_state *mtk_drm_crtc_duplicate_state(struct drm_crtc *crtc)
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
