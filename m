Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD05B11E923
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2019 18:26:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 121346EB64;
	Fri, 13 Dec 2019 17:26:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE1526EB64
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 17:26:24 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id q6so242012wro.9
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 09:26:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+cbrIbSvVp0LclU+aOKqTmPIt3fby91EuMSME26/d5Y=;
 b=OKaJHrVAoaZtUEU3D85ZFLCR77H4fX6v6CsgmAjDRP9z9ftuNCnp76zTWWUm7HPKiN
 FTTSSUgJNQOmvoLndwEMxA/UsGm+L98LxGIzL43X7OUEB28m6PNUKY/007+20qZ70j5p
 9F/y1NUVDwbvHhqktxm5Q/NhFLQrhd0/evKGg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+cbrIbSvVp0LclU+aOKqTmPIt3fby91EuMSME26/d5Y=;
 b=Ir6tb1hg2dpcZj2TVItJRmNut8W+OUzEaB+TH7pdFNV1DEO8i/+pRj8EdAAi8p9Gyl
 GGiPTYople2XySLvJrMlMYD0uXJRVn50asg2b2O0YDAnkOnqzas4FCPWNbWeNyLooc+0
 cVshNsxKzCYPME58BQJ7RAFqQb097wcKvocTBPTJNh1QUcSdF7/QWeEGmT+xPBdN88/d
 iUtervwZmHBtkZSkRnNB+ABgL1IQris44GtmcduV67IHTlmb7JbghzsK0RiHLbC0zvQF
 YMLui2vG9OmGKvhWWfee42LkrVP9xCUc6hlF17z/dvN1qz9VuHoC2yMvjeR1xcnclv5w
 qFDw==
X-Gm-Message-State: APjAAAXcbxyIW8+WHXyh/YIiKwEcTZA9spX71RlmcBZNYAMn6cH5I2Yk
 QBwvqre07JOT1FyvImogNi2FxgZSXaQ=
X-Google-Smtp-Source: APXvYqyJt4nToJrw+6t6T/NTYV4dX0RRCO+tqGBGWSgh7apaWrrcILwebqQdGpcwUnJdOImfOsV15w==
X-Received: by 2002:a5d:690e:: with SMTP id t14mr13815008wru.65.1576257982999; 
 Fri, 13 Dec 2019 09:26:22 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:564b:0:7567:bb67:3d7f:f863])
 by smtp.gmail.com with ESMTPSA id q15sm10689669wrr.11.2019.12.13.09.26.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Dec 2019 09:26:22 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 05/10] drm/mediatek: plane_state->fb iff plane_state->crtc
Date: Fri, 13 Dec 2019 18:26:07 +0100
Message-Id: <20191213172612.1514842-5-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191213172612.1514842-1-daniel.vetter@ffwll.ch>
References: <20191213172612.1514842-1-daniel.vetter@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 Daniel Vetter <daniel.vetter@intel.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Checking both is one too much, so wrap a WARN_ON around it to stope
the copypasta.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: CK Hu <ck.hu@mediatek.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mediatek@lists.infradead.org
---
 drivers/gpu/drm/mediatek/mtk_drm_plane.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.c b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
index 540ef2faa40a..f0b0325381e0 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_plane.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
@@ -94,7 +94,7 @@ static int mtk_plane_atomic_check(struct drm_plane *plane,
 	if (!fb)
 		return 0;
 
-	if (!state->crtc)
+	if (WARN_ON(!state->crtc))
 		return 0;
 
 	ret = mtk_drm_crtc_plane_check(state->crtc, plane,
-- 
2.24.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
