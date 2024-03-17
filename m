Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 619EC87DF26
	for <lists+dri-devel@lfdr.de>; Sun, 17 Mar 2024 19:02:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 364E710F118;
	Sun, 17 Mar 2024 18:02:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="OtptxIjL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E32B10E625;
 Sun, 17 Mar 2024 18:02:29 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-2d27184197cso48395611fa.1; 
 Sun, 17 Mar 2024 11:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710698547; x=1711303347; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eUbeueA1ROk6a8DiyLDqdiiGKg+OYyEnSiWbLatHNh0=;
 b=OtptxIjLnd6nh5/bLymH3H6K2zd29pZKcTjNGKKzqrr3GKI/YjGytNrn0uN8zFxU4k
 rsUi3cb4SLXRKFzI76YOAzIatHY1pOncpanutwHjY49CVa8v+soCKUoNiSjxfM1psRNe
 0rEP4qfzIxsp9cWyUfnZRrNt33BFX8G7T66m1yua5oOBJs/MvsofGOunLYPfirRBiqhm
 yz4q2qvhKDCdsxg2GjOOUICmqFUOFJg3LGW2yLhAg0p47U6vXOWDZdRDEPEwTGl4o4b/
 sJ52LPyT2Ce2pk5rtj6QmNngM6bo+TtJI0DiEP8/i94Rrr1O18WMHTkTpFJuUGZ6jufD
 r5RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710698547; x=1711303347;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eUbeueA1ROk6a8DiyLDqdiiGKg+OYyEnSiWbLatHNh0=;
 b=XSfBohYHq7OUhfPG283vLuiF552DmVzOrk1H0GC/PB645Ic35cJqZGK5UfyKX+uVsZ
 BL6jQc0Bu1eTNONzEsAYNACmg97LKqklJ2nhejXyKKvJugacJteHr7tFEag1njejxjzo
 jRgwkKPuLfHYiSJhFWHihmrXLCnGe0D1vI/C8YS7iyvskAEbwVEAKRUUciby99SZ/6xK
 RX2SjRVDY1hT7P7x5YB35nzL4bHQNcpXnTPt4AxYgPQTglgvv6K+8TUlkBYikf8noVBT
 dI6gCqYfunKSDJrugZtCRJI0y6rQfAk9m99sMBWCR8zaqCfU2M6l0eanA94z8B+58hZn
 BAaA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+JpcJuNiCGVmxZpoH//U+GtKcAQSMQ1m2oGDhDP5cUG/nQnkuWhOuauoLY4ST5cRUYw6nBtrDwPgC9rcs+bws1r8KPMMA217mrzteiGzK
X-Gm-Message-State: AOJu0YypxE0p+LjHNq1KWhq/bfNtB7Kaxw9VP48pRVcYxSm9RlUNm7SF
 RULncEt30p6HNtF7+bK+U9fCTQYa+Q/RtsjCactc6gu2dHQB1ZVXr5QEhdo+NyY=
X-Google-Smtp-Source: AGHT+IHYndevLgkLj2qn2VG5Ekz45J5RTZHx/x5titxqY0o/yJQDg+GTMq5OAZ75QcYiLH1jriFPAw==
X-Received: by 2002:a2e:3613:0:b0:2d4:57c5:8862 with SMTP id
 d19-20020a2e3613000000b002d457c58862mr6915147lja.4.1710698547509; 
 Sun, 17 Mar 2024 11:02:27 -0700 (PDT)
Received: from betty.fdsoft.se (213-67-237-183-no99.tbcn.telia.com.
 [213.67.237.183]) by smtp.gmail.com with ESMTPSA id
 w6-20020a2e9bc6000000b002d2d384519dsm1173483ljj.102.2024.03.17.11.02.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Mar 2024 11:02:27 -0700 (PDT)
Received: from ester.fdsoft.se ([192.168.1.2])
 by betty.fdsoft.se with esmtp (Exim 4.97.1)
 (envelope-from <frej.drejhammar@gmail.com>)
 id 1rluq2-000000005e0-2eHg; Sun, 17 Mar 2024 19:02:26 +0100
From: Frej Drejhammar <frej.drejhammar@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: Frej Drejhammar <frej.drejhammar@gmail.com>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: [PATCH 07/11] drm/msm: Use drm_driver_legacy_fb_format() for fbdev
Date: Sun, 17 Mar 2024 19:01:32 +0100
Message-ID: <b0b9563ed12a403883e7f2239eeb8bd2a007ad40.1710698387.git.frej.drejhammar@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1710698386.git.frej.drejhammar@gmail.com>
References: <cover.1710698386.git.frej.drejhammar@gmail.com>
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

Switch to using drm_driver_legacy_fb_format() instead of
drm_mode_legacy_fb_format() to use the same logic as for the
DRM_IOCTL_MODE_ADDFB ioctl when selecting a framebuffer format.

Signed-off-by: Frej Drejhammar <frej.drejhammar@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Sean Paul <sean@poorly.run>
Cc: Marijn Suijten <marijn.suijten@somainline.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org
Cc: freedreno@lists.freedesktop.org

---

This is an evolved version of the changes proposed in "drm: Don't
return unsupported formats in drm_mode_legacy_fb_format" [1] following
the suggestions of Thomas Zimmermann.

[1] https://lore.kernel.org/all/20240310152803.3315-1-frej.drejhammar@gmail.com/
---
 drivers/gpu/drm/msm/msm_fbdev.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_fbdev.c b/drivers/gpu/drm/msm/msm_fbdev.c
index 030bedac632d..05bedf210572 100644
--- a/drivers/gpu/drm/msm/msm_fbdev.c
+++ b/drivers/gpu/drm/msm/msm_fbdev.c
@@ -77,7 +77,9 @@ static int msm_fbdev_create(struct drm_fb_helper *helper,
 	uint32_t format;
 	int ret, pitch;
 
-	format = drm_mode_legacy_fb_format(sizes->surface_bpp, sizes->surface_depth);
+	format = drm_driver_legacy_fb_format(dev,
+					     sizes->surface_bpp,
+					     sizes->surface_depth);
 
 	DBG("create fbdev: %dx%d@%d (%dx%d)", sizes->surface_width,
 			sizes->surface_height, sizes->surface_bpp,
-- 
2.44.0

