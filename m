Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBDC98C8DC7
	for <lists+dri-devel@lfdr.de>; Fri, 17 May 2024 23:38:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10D8A10E19C;
	Fri, 17 May 2024 21:38:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="AcBGNuIy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8C5D10E0CD
 for <dri-devel@lists.freedesktop.org>; Fri, 17 May 2024 21:37:47 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id
 d2e1a72fcca58-6f457853950so426359b3a.0
 for <dri-devel@lists.freedesktop.org>; Fri, 17 May 2024 14:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1715981867; x=1716586667;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wMrmoliKPswHzuEojIBGChDP268r8lDTpqZYT1tgrB0=;
 b=AcBGNuIyswLkJq9adE7wFbgK2cgEKLpMFDoQy8eKwEsLHXgRWYP6vaLi4z/C4lgFxx
 uvBfeW2SxXGVlBmZbR4UGa3CIn6mmWTMBlGJnF560fhR/sEF0ieax5uQn7Ly1S6iETvm
 fzxwvA5rRdov80UeGOnj9UGvyWydD4gkiwIA8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715981867; x=1716586667;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wMrmoliKPswHzuEojIBGChDP268r8lDTpqZYT1tgrB0=;
 b=sD/y3XDBOu9jByekYEcO2LCK8Pvth7VT9VyJwe/EWpQP2PKvXav/L0GZsQW37Pw2HI
 xuDplqdQrCWl98XmP7t4eMS1w3spIzw2layGcz2Rilh93/5+a1LgH9zhLUCMKYW2nYDy
 k3p4YGUXDx9549nS4pgMcBikQhA+HYWrpkRUCGk8UjPZIQqZGcIcH9xFgy5WXGf5Fn1k
 iymw4vD1WFFbAfOer4gYmEuwHgvd11YeLq3p4yAjrgGOqNhhMkoIoRUn77bJdaWesH3n
 SKhUAlfht9x98OC7WuR3EKk6mBtFp0Q3b7tVUPkaLXbeo+R8HK/InCZjVSLC6o8sstve
 x1oQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWbTy0N1+XOY9KmB89waDj9eyfjFoSCE/DP09pdlHNtOF4h5VH5jBtbdVS0Jb9sKIkMmbVixqaafvNxbvIkb2JA+7xjiTMku/SYowIjcE2C
X-Gm-Message-State: AOJu0YwfC5678ufafhJS2X8K6JQuGXcI5BvG7SAVtghDk+b3a49QFjsf
 HwyQyEJ2TBYzQRGAzURtKY3vGHKs4yO7pg5Ann3oG8GiH5vcetZNT2UZVA4TZz/yKveVW7EEWes
 =
X-Google-Smtp-Source: AGHT+IG0DV+RQTrF64BGZMxIPU0+NC5JzIe/lzMpLQ15ksBfa6Z15kVlWjTAgXqC398NIEA3infXfw==
X-Received: by 2002:a05:6a21:9988:b0:1ad:886e:ef5a with SMTP id
 adf61e73a8af0-1b1ca42879dmr436290637.19.1715981867162; 
 Fri, 17 May 2024 14:37:47 -0700 (PDT)
Received: from dianders.sjc.corp.google.com ([2620:15c:9d:2:26de:b1dd:5:771c])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-6f4d2b2f8b3sm15168736b3a.211.2024.05.17.14.37.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 May 2024 14:37:46 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Douglas Anderson <dianders@chromium.org>,
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 6/8] drm/panel: himax-hx83102: If prepare fails,
 disable GPIO before regulators
Date: Fri, 17 May 2024 14:36:41 -0700
Message-ID: <20240517143643.6.Id0659a80147cf51e0ebb8fe7fee18db86851960d@changeid>
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

Fixes: 0ef94554dc40 ("drm/panel: himax-hx83102: Break out as separate driver")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/gpu/drm/panel/panel-himax-hx83102.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-himax-hx83102.c b/drivers/gpu/drm/panel/panel-himax-hx83102.c
index 1a6975937f30..4ac7f9d8b232 100644
--- a/drivers/gpu/drm/panel/panel-himax-hx83102.c
+++ b/drivers/gpu/drm/panel/panel-himax-hx83102.c
@@ -578,13 +578,13 @@ static int hx83102_prepare(struct drm_panel *panel)
 	return 0;
 
 poweroff:
+	gpiod_set_value(ctx->enable_gpio, 0);
 	regulator_disable(ctx->avee);
 poweroffavdd:
 	regulator_disable(ctx->avdd);
 poweroff1v8:
 	usleep_range(5000, 7000);
 	regulator_disable(ctx->pp1800);
-	gpiod_set_value(ctx->enable_gpio, 0);
 
 	return ret;
 }
-- 
2.45.0.rc1.225.g2a3ae87e7f-goog

