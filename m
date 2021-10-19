Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE86433E2D
	for <lists+dri-devel@lfdr.de>; Tue, 19 Oct 2021 20:10:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E56196E1BE;
	Tue, 19 Oct 2021 18:10:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 116A96E1BE
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Oct 2021 18:10:45 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 63-20020a1c0042000000b0030d60716239so4465918wma.4
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Oct 2021 11:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XkQbOoP/+0N5j4wytKxJfGYLSAuO1fbKKTQCyzqNEpc=;
 b=ZAwL72nMvl8TZfTQepywrkwV7ioeJAUrEnyM2HrUBojS+OCkLHwmYwpHNbRIsSe5gI
 P8UOh0ne0mxguVVlK/pF6AY8Jhjy+U8YpRBmmrYf6tAWPVEIJq8l4PWd4UH8dJg6IRWx
 pM6B+9pfH8L7vnmRcoTgb7BoIu++BXvUPy1zlbbztIJgNtQD8X0FEd8j8iAylUV8zwUK
 JTBQhMEmDw6X4D7N1NApqDNpCgNcHI/QWBwbYkdvYMHMB4gkxxXK984GMK1clGmk3ZdH
 OoC7XJgno9aBIQdLpFV3ZB0NL09dAm8dFH7+CWd8ZNvS2eWKZDTUGK/0EDYu84UCdJvr
 n3kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XkQbOoP/+0N5j4wytKxJfGYLSAuO1fbKKTQCyzqNEpc=;
 b=gJyQFspskXbFD+YkClvMIQVPYjMINk3uoqBuuw/CUmIaXi0dZhiGxx2VOBUUkClp4q
 XrkJILDcWM8KYI2XjFlaHNHsJGpj3WeJTy6uoklNu/qBW/oWKGIj9SGOIs0K1OPSJSQf
 V+4vFbkLOy5bY/R89AbKppk1ij8q8yy50YMYk+UNuVoAy5Vy6Lol1JtPzsZL5hrSKMq1
 lVv49YBB6YUcHaZvfSoO1+3ZCAL0FzUeuomAk6CfLnjWDAePDNdZVsrsDlgg0jlrb4dK
 V/X//ukbzk9NspCxBTpiaizynSOwe0gPxpNc1HZnLPeM4C6Je9MUZ+FLBDuiclOWmQ4K
 naEQ==
X-Gm-Message-State: AOAM531tu6uGJL397RaFjp15of7K8tlwv13j7PV6S0WDi/MMcYR4TkQL
 T9GyvWptQFcuWMzfDZpiQZs=
X-Google-Smtp-Source: ABdhPJwDTK6c1LsA20fuK4Ogpi1SXUC1fvQIs3S0dKO9MfZhXz+PO+ZSWdQI8kQ/4/asgaInGjujKA==
X-Received: by 2002:adf:bb81:: with SMTP id q1mr46649180wrg.119.1634667043622; 
 Tue, 19 Oct 2021 11:10:43 -0700 (PDT)
Received: from kista.localdomain (cpe-86-58-29-253.static.triera.net.
 [86.58.29.253])
 by smtp.gmail.com with ESMTPSA id 73sm2871763wmb.40.2021.10.19.11.10.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 11:10:43 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: mripard@kernel.org,
	wens@csie.org
Cc: airlied@linux.ie, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH] drm/sun4i: virtual CMA addresses are not needed
Date: Tue, 19 Oct 2021 20:10:28 +0200
Message-Id: <20211019181028.4190737-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.33.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Driver never uses virtual address of DRM CMA buffers. Switch to CMA
helpers which don't deal with virtual mapping.

This was actually already the case before commit ad408c766cef
("drm/sun4i: Use DRM_GEM_CMA_VMAP_DRIVER_OPS for GEM operations"),
but only convenient macro at the time used helpers with virtual
mapping.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun4i_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_drv.c b/drivers/gpu/drm/sun4i/sun4i_drv.c
index 54dd562e294c..b630614b3d72 100644
--- a/drivers/gpu/drm/sun4i/sun4i_drv.c
+++ b/drivers/gpu/drm/sun4i/sun4i_drv.c
@@ -53,7 +53,7 @@ static const struct drm_driver sun4i_drv_driver = {
 	.minor			= 0,
 
 	/* GEM Operations */
-	DRM_GEM_CMA_DRIVER_OPS_VMAP_WITH_DUMB_CREATE(drm_sun4i_gem_dumb_create),
+	DRM_GEM_CMA_DRIVER_OPS_WITH_DUMB_CREATE(drm_sun4i_gem_dumb_create),
 };
 
 static int sun4i_drv_bind(struct device *dev)
-- 
2.33.1

