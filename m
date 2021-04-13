Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C493B35DBA1
	for <lists+dri-devel@lfdr.de>; Tue, 13 Apr 2021 11:49:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43C9A6E2D7;
	Tue, 13 Apr 2021 09:49:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E66989C3F
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Apr 2021 09:49:13 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id y204so6973587wmg.2
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Apr 2021 02:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sKnMGdydD5VEI/3ScWh7YccdRp5+79GpsyoCcHVvPso=;
 b=Eyfyf4WshcsgJkQdPXBY9ti7ylJWX7Sk6dR7sdNRN5pkI8INb22SYQZrIgOMYf5JCm
 jNLHnN+7X8x6jEzvvDwSCmjDxnpYgVws43xT6fX8qQa58NgzjQ5s3rUtfYaGLve9OCCe
 whEAQdW2j8M+s7h43+LSaWFRFh/jAMMBBAE+g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sKnMGdydD5VEI/3ScWh7YccdRp5+79GpsyoCcHVvPso=;
 b=dpTDUHY/Sk4ocy/LHE2PfWPlNGLEJETzC58Y8M0ZyS8dO0EQbhWz9H8ZIItkLYshdd
 EmcID0PllG6u59paI0aXkDZzyXFsqsxO1qmDBYKiLCuPxDXSLHlbmAjyA1TRCujBtjwc
 oP6xf0FFC7E4G9sUIoauTsyOzGuAKEzHx95tChgEZL+PBUSzpE27nSMka50wS2j640Ou
 D6v/anGchylyI0elCu/VY5qcFPCZr9t200Hf1IoI5A3cs2gfPRAJSPap7dHYMYOPV/qq
 J1VuuVRyfxeGAUCxzAO2yUu6UfMh8hqKin3fMBYsiSfHxXSX376MfNiLCRi9Kq1oADjy
 7Hvw==
X-Gm-Message-State: AOAM533RdH1D8J9RJUIFrDeQMGbvb0TJucim+3a3J5nOdDdAPKEbjf7q
 9+9lclk+zsPKzmGbAnoyc/Mf2t36fM2zRw==
X-Google-Smtp-Source: ABdhPJyozmtYCr5fQuYQk3xh8oRysWRoKgt+zOj2WPFRCcwMWqB8klX4kzPMoSUp1bby3DGm803+ZA==
X-Received: by 2002:a05:600c:3546:: with SMTP id
 i6mr3218307wmq.104.1618307352372; 
 Tue, 13 Apr 2021 02:49:12 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id 64sm1956458wmz.7.2021.04.13.02.49.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Apr 2021 02:49:11 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 03/12] drm/exynos: Don't set allow_fb_modifiers explicitly
Date: Tue, 13 Apr 2021 11:48:54 +0200
Message-Id: <20210413094904.3736372-3-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210413094904.3736372-1-daniel.vetter@ffwll.ch>
References: <20210413094904.3736372-1-daniel.vetter@ffwll.ch>
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
Cc: linux-samsung-soc@vger.kernel.org, Joonyoung Shim <jy0922.shim@samsung.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Daniel Vetter <daniel.vetter@intel.com>, linux-arm-kernel@lists.infradead.org
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
Cc: Inki Dae <inki.dae@samsung.com>
Cc: Joonyoung Shim <jy0922.shim@samsung.com>
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>
Cc: Kyungmin Park <kyungmin.park@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org
---
 drivers/gpu/drm/exynos/exynos_drm_fb.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_fb.c b/drivers/gpu/drm/exynos/exynos_drm_fb.c
index 64370b634cca..79fa3649185c 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fb.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fb.c
@@ -177,7 +177,5 @@ void exynos_drm_mode_config_init(struct drm_device *dev)
 	dev->mode_config.funcs = &exynos_drm_mode_config_funcs;
 	dev->mode_config.helper_private = &exynos_drm_mode_config_helpers;
 
-	dev->mode_config.allow_fb_modifiers = true;
-
 	dev->mode_config.normalize_zpos = true;
 }
-- 
2.31.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
