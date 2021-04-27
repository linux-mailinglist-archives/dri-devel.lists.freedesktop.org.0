Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D59D36C1A1
	for <lists+dri-devel@lfdr.de>; Tue, 27 Apr 2021 11:20:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35F7A6E939;
	Tue, 27 Apr 2021 09:20:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 042966E933
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Apr 2021 09:20:30 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id h4so49653726wrt.12
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Apr 2021 02:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5/VCtoETMmUzL0vMPqbtcoUDD2y2ltfbzTlgLqC6ZdU=;
 b=j70/j4Q6iKYIxCEI65Y0bUzPGkZaKggFmUgvWzLANdx/wAlWVz5KESFnUo/9nujbKh
 VLP5WnQX348e0Gey0yAOo51JoWFEbWPfgaXyi9p9J6I5/voq6u34z4Oxv3HsLIDFdL7g
 0nWF5RWbWoYPwCh6yJUMjw/QcUh+2F/NVjfgY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5/VCtoETMmUzL0vMPqbtcoUDD2y2ltfbzTlgLqC6ZdU=;
 b=DeFd5LGwb3X8pLeK/UKL8hGAUy8sWCFf2kHy/CLVodyLoGLEhiKGjo77ZAtP4/po1S
 bnYf0Vpna6ufPhIM+fQYEezsjwVP1YaMlRhbLwIe5FO1Zxax4/1WeD6TtQRkSVF2PUwE
 +IuJlFB9KvX4hIaLzVyxds3cAsvs1TRL96FP5hjLI+lcOLbAlLAvY3QdvZ9Pj2tn2v39
 39lvrgi+WoqxtoGSeXboYzob0KoMII2eVCDg8kUEfUBSJmvM9wePkrCmVOGV/iB2A4QL
 d5CSileW+WlxLotr+bhF6MKpj65DDG7CTOvw8UfYFD6dmzx+iy5rOGEHFwW9AoTdEyO4
 NTAg==
X-Gm-Message-State: AOAM530sC6JOs0bDkXacSrGA8cDTS5pNhicVBtZXoP4+rdnOC5T4VcfI
 qRb31V6jtsAFm4cFjRkO8JJV95WHCDk3nA==
X-Google-Smtp-Source: ABdhPJwJ9rr2VWEzV2GSpk5dJ+S0Jiuw0XEyEGp+d22nZbMqEXF/DE1cG/lDbVU7T/v0ew7G7SdRhw==
X-Received: by 2002:a5d:4b12:: with SMTP id v18mr28184586wrq.45.1619515229738; 
 Tue, 27 Apr 2021 02:20:29 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id r24sm1939816wmh.8.2021.04.27.02.20.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Apr 2021 02:20:29 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 7/8] drm/stm: Don't set allow_fb_modifiers explicitly
Date: Tue, 27 Apr 2021 11:20:17 +0200
Message-Id: <20210427092018.832258-7-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210427092018.832258-1-daniel.vetter@ffwll.ch>
References: <20210427092018.832258-1-daniel.vetter@ffwll.ch>
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
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Philippe Cornu <philippe.cornu@foss.st.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since

commit 890880ddfdbe256083170866e49c87618b706ac7
Author: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Date:   Fri Jan 4 09:56:10 2019 +0100

    drm: Auto-set allow_fb_modifiers when given modifiers at plane init

this is done automatically as part of plane init, if drivers set the
modifier list correctly. Which is the case here.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Yannick Fertre <yannick.fertre@foss.st.com>
Cc: Philippe Cornu <philippe.cornu@foss.st.com>
Cc: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/gpu/drm/stm/ltdc.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
index 65c3c79ad1d5..e99771b947b6 100644
--- a/drivers/gpu/drm/stm/ltdc.c
+++ b/drivers/gpu/drm/stm/ltdc.c
@@ -1326,8 +1326,6 @@ int ltdc_load(struct drm_device *ddev)
 		goto err;
 	}
 
-	ddev->mode_config.allow_fb_modifiers = true;
-
 	ret = ltdc_crtc_init(ddev, crtc);
 	if (ret) {
 		DRM_ERROR("Failed to init crtc\n");
-- 
2.31.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
