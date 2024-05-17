Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F39B58C8DC0
	for <lists+dri-devel@lfdr.de>; Fri, 17 May 2024 23:37:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F9C810E0B0;
	Fri, 17 May 2024 21:37:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="Thp8/NTm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2830210E036
 for <dri-devel@lists.freedesktop.org>; Fri, 17 May 2024 21:37:39 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id
 d9443c01a7336-1edfc57ac0cso21852965ad.3
 for <dri-devel@lists.freedesktop.org>; Fri, 17 May 2024 14:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1715981858; x=1716586658;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=otBGDKVA9IXvnt4HBmF8aixiY7lsB5c27hifCvrdcgw=;
 b=Thp8/NTmYWMSbwT++JX3ka2e+R0gRCbkKQCTyPT5PlJ1uBgeFdHrFVfBiGEI136K3K
 57bRcrTgrf7615aYByN9qNLw9DLAcuaDxczwcd9/Ulk314W7nkPCXqKIC04qV+2l/7f9
 2VFKLv5AeRHkZ4MP967LFkrPysGH2K3kA61Sw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715981858; x=1716586658;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=otBGDKVA9IXvnt4HBmF8aixiY7lsB5c27hifCvrdcgw=;
 b=Ol0yTcaJ4sEfMtHPWlwjOCCSZJHjrA8MvWjM95O9ikXKlZfNBtkJPTaumQyZC4fVAJ
 AQG0cKCywhDLTBIlgnVGWI8By+ENjFmBIUKaQmVw5fLpLNQ7zD31EuHiyUxDw7mMJhgn
 HZeq+r26KF4zrgYKYdMbufTYg9mDv3qqGXghVC+kf+7ViCvZ5BZFF+dtS4wUpTAW4cp5
 MhbiW/sCtVfNzewhSjr11jkJshyj57UVSeNTQRbN+lE50sp6avhtnluiID1TnRqNcAvb
 PHwe3f7NcFuVsgPtC5vXDOyUIV2Q6c4behS8u6UCELtAwId7M6sJS6b/KLaAqjFvKe1j
 4Vmw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW2EbDiZh1qgMjFVSE7UfBXcrNrG/FxXrS/lEPpBNlAmI/OoWR9zD4t+1S//kUBkO6fc8eqrNKAiTqm8AGuDApoEO4v24KG64tljS3+uqLg
X-Gm-Message-State: AOJu0YwOfy95LmGqh6pzaYq9iRZrEh6URKiUS20I69sQpexzlfYK1pJ8
 QMwadppEWw4A6fLhkq9PaZvNAcKP4HVFtLz9UlrkVaxs2ltVMJ1TCHR2z58xWg==
X-Google-Smtp-Source: AGHT+IG9oTcMCg7rkDReYhIwGehOkT+PViM2X4yuDk+pejmeAywc0nLdIrwyw2PSTgQN8mmuXIRQ6g==
X-Received: by 2002:a05:6a00:1953:b0:6e7:32a0:806a with SMTP id
 d2e1a72fcca58-6f4e039bc12mr23778076b3a.28.1715981858605; 
 Fri, 17 May 2024 14:37:38 -0700 (PDT)
Received: from dianders.sjc.corp.google.com ([2620:15c:9d:2:26de:b1dd:5:771c])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-6f4d2b2f8b3sm15168736b3a.211.2024.05.17.14.37.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 May 2024 14:37:38 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Douglas Anderson <dianders@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, Jitao Shi <jitao.shi@mediatek.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 2/8] drm/panel: boe-tv101wum-nl6: If prepare fails,
 disable GPIO before regulators
Date: Fri, 17 May 2024 14:36:37 -0700
Message-ID: <20240517143643.2.Ieac346cd0f1606948ba39ceea06b55359fe972b6@changeid>
X-Mailer: git-send-email 2.45.0.rc1.225.g2a3ae87e7f-goog
In-Reply-To: <20240517213712.3135166-1-dianders@chromium.org>
References: <20240517213712.3135166-1-dianders@chromium.org>
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

The enable GPIO should clearly be set low before turning off
regulators. That matches both the inverse order that things were
enabled and also the order in unprepare().

Fixes: a869b9db7adf ("drm/panel: support for boe tv101wum-nl6 wuxga dsi video mode panel")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
index 8e839a1749e4..028625d2d37d 100644
--- a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
+++ b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
@@ -1475,13 +1475,13 @@ static int boe_panel_prepare(struct drm_panel *panel)
 	return 0;
 
 poweroff:
+	gpiod_set_value(boe->enable_gpio, 0);
 	regulator_disable(boe->avee);
 poweroffavdd:
 	regulator_disable(boe->avdd);
 poweroff1v8:
 	usleep_range(5000, 7000);
 	regulator_disable(boe->pp1800);
-	gpiod_set_value(boe->enable_gpio, 0);
 
 	return ret;
 }
-- 
2.45.0.rc1.225.g2a3ae87e7f-goog

