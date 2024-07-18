Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58B4A9351D8
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jul 2024 20:44:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3139310EAB3;
	Thu, 18 Jul 2024 18:44:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="OY0eKPQY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38F1110EAB3
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2024 18:44:48 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id
 41be03b00d2f7-7928d2abe0aso1628784a12.0
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2024 11:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721328288; x=1721933088; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B6bckds3F2bTrLC4vJCbEBeAAMBfQ5LDIiRkb+52rEU=;
 b=OY0eKPQYBRlEUQy6+Imv7y3fsJ+BbUc9e0mb+6gzy49y1kIWDgjXOppnuL3xlTcTU9
 h06RCixJAfL2yxMcT4ZUEhSKBI5E0X9uK5t82PLVikxerXxYVHd2CaK6d+yzEXH3Wmwi
 fYlev6waB/qyGhoDT7b1nKGmo3pfdX0u2/RxvIvLAQ+pZG4VD7bUKzS7SxkxuCkAp1bv
 WKJjFFE8dy9M2ea89LYiii60Sv6VeTK7pHAeVd8o8+M862UDqNeaeAqN7tSXFOm4/GL6
 HBkvYVYMJz1pIyfDG/Zf0jYlQ5MjX8G2Z3yr+gn+1VjSckPW05eo7WSFE5UmVh8thC1h
 cx9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721328288; x=1721933088;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=B6bckds3F2bTrLC4vJCbEBeAAMBfQ5LDIiRkb+52rEU=;
 b=LIirN74jiEdffwRvtjaXHpusi5HvPXtZsbcNGuP4i2s8udrHWCofcF+GvNn1qGGTky
 hnRpK9F+ba96UWbLZojwOzd1DDrBZcT71mNYFybARoowrm1CHJx5W62jTPQWXrrL6uNr
 3QDz+mVSDkMeHJtdMnyM9NzlIFo8zCmQ2g18PE0KwCwnGIVSa9r86UuFwBSoSNzClfVW
 o3eC/nK4hTH5kgB10axoARXgd6uvmeMjAHAbg2TLfYx5yD1Ne9TOWQ7UpnoYq8DPTWlr
 jYkEE21ohF7MLJq96FvoSIHv4XW7kxWNN7OBPc8Dwf3tyCq1heAKbV9r8A1ooEJRtN3V
 1N+g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVtyi7ojBnpkc0bkNUcNWv89dN0krcYk83ETLNe50nQHn2hITdcdUgOWUIa55ZbSKIZLQHypxj/KMy+Nk2NtACaMMZY/Kk3HFvXlSs7ndkU
X-Gm-Message-State: AOJu0YxTTT7l+pIwIanJA8NAbgF4TUjvtc/U0IJ66L8dOrGLlrPKkTmL
 hmfQfHPf5HZRolDycyGomKiepIilJSv3b3mv6BxQrf4mdzsR8l6c
X-Google-Smtp-Source: AGHT+IE4srpDhz6qeMZ/GToHzgbSTlSbJsIqtGRkDmpfTIKTti5W19ftJm39UIGQk16XYiTODIu1+w==
X-Received: by 2002:a17:90b:a05:b0:2c9:90fa:b9f8 with SMTP id
 98e67ed59e1d1-2cb7789016fmr2646138a91.10.1721328287612; 
 Thu, 18 Jul 2024 11:44:47 -0700 (PDT)
Received: from localhost ([2a00:79e1:2e00:1301:3279:d3cd:5dde:c799])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2cb772c1cb4sm1090023a91.5.2024.07.18.11.44.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Jul 2024 11:44:46 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: linux-arm-msm@vger.kernel.org
Cc: Doug Anderson <dianders@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Abel Vesa <abel.vesa@linaro.org>, Rob Clark <robdclark@chromium.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org (open list:DRM PANEL DRIVERS),
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 2/3] drm/panel: samsung,
 atna33xc20: Add compatible for ATNA45DC02
Date: Thu, 18 Jul 2024 11:44:33 -0700
Message-ID: <20240718184434.6307-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240718184434.6307-1-robdclark@gmail.com>
References: <20240718184434.6307-1-robdclark@gmail.com>
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

From: Rob Clark <robdclark@chromium.org>

The Samsung ATNA45DC02 panel needs the same power sequencing as the
ATNA45AF01 and ATNA33XC20.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/panel/panel-samsung-atna33xc20.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-samsung-atna33xc20.c b/drivers/gpu/drm/panel/panel-samsung-atna33xc20.c
index fd56fd02df87..748ce8752f85 100644
--- a/drivers/gpu/drm/panel/panel-samsung-atna33xc20.c
+++ b/drivers/gpu/drm/panel/panel-samsung-atna33xc20.c
@@ -334,6 +334,7 @@ static void atana33xc20_remove(struct dp_aux_ep_device *aux_ep)
 static const struct of_device_id atana33xc20_dt_match[] = {
 	{ .compatible = "samsung,atna33xc20", },
 	{ .compatible = "samsung,atna45af01", },
+	{ .compatible = "samsung,atna45dc02", },
 	{ /* sentinal */ }
 };
 MODULE_DEVICE_TABLE(of, atana33xc20_dt_match);
-- 
2.45.2

