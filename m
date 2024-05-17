Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6B7A8C8DC1
	for <lists+dri-devel@lfdr.de>; Fri, 17 May 2024 23:37:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BE7410E0AD;
	Fri, 17 May 2024 21:37:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="HW+vCt/E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8626C10E0A0
 for <dri-devel@lists.freedesktop.org>; Fri, 17 May 2024 21:37:42 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id
 d2e1a72fcca58-6f4603237e0so480281b3a.0
 for <dri-devel@lists.freedesktop.org>; Fri, 17 May 2024 14:37:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1715981862; x=1716586662;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qdxmCQIjRAvO8BCfViIMJHCflXvR2bqDUxHByEsJNv0=;
 b=HW+vCt/ELzJDp0lH4raD86sG23Gyvs3a4ibU3np83eqbvNVjh1Y88W7CkDDQa0Z3ZE
 R9gSRS0+xg3E3KihC9kcqvvIu70au4v94PDU9QxdyYMtX0BIYLMo7lubKsMxnyK/m1Vt
 D/cESDuUrR3KdOlQnVvxNTKV895k/YSxfsxxQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715981862; x=1716586662;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qdxmCQIjRAvO8BCfViIMJHCflXvR2bqDUxHByEsJNv0=;
 b=VNX8dEFrhuojG7w1uI1UpZWVqJDRw2bKElAH8EDN3UwV+WYKtVRPzEWOhmzt0R/9u3
 3mHuRyZR/qO4nkyhcgunFgAlfkIqYCkn42qdsqP8BAA/ksGp+p0Ul+zBpttEqQEeGiNf
 oGCxOkeA6f9AULnhmdqKiYZwtgVb2ciTDAxyPVW+IbA/UPBKI4sk1vL3o6V3rc8O48y5
 6XQqD6cCClll848Lt6YFHkF9dv7yRtqh+YfMnheQfRqr1rSFExRqKWSt0t5n8xFfbo6P
 jZ4IkjsvcBjucCN0/mkaF0kjD8w/RY771CPgQ+xHisTf8avdsfKhv2lpCBGtOzrYlVew
 nS9w==
X-Forwarded-Encrypted: i=1;
 AJvYcCU2IPOk561i+Kf5YMS6v0hPpOavI3tkNjKhHsBwHaiposCt4U9cceUnkMLSZ7AnoBsGO60jNyfX4MZ4ucCyUxi1oQEquW75ohHhfuF7lgR1
X-Gm-Message-State: AOJu0YwtMnNrAxzgin1QeVIBLvDuwrj8Fnq6RL6PazgM3E3vO+vlKG8B
 zkYp3A6qlAUGP6K35ltljoj8sWvXkhr7iR6+A20cZYpfXr8RF2nXiml8ZchcEQ==
X-Google-Smtp-Source: AGHT+IHX2L9EVLQc886otDLXwIh9pr9UtYuwXLoQCTn5ubCeZ2plNpUi+ivhbdW42Vwp09Y6f6yc9w==
X-Received: by 2002:a05:6a20:d80b:b0:1af:37bf:d7de with SMTP id
 adf61e73a8af0-1b1ca3bca44mr433294637.7.1715981862038; 
 Fri, 17 May 2024 14:37:42 -0700 (PDT)
Received: from dianders.sjc.corp.google.com ([2620:15c:9d:2:26de:b1dd:5:771c])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-6f4d2b2f8b3sm15168736b3a.211.2024.05.17.14.37.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 May 2024 14:37:41 -0700 (PDT)
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
Subject: [PATCH 4/8] drm/panel: ilitek-ili9882t: If prepare fails,
 disable GPIO before regulators
Date: Fri, 17 May 2024 14:36:39 -0700
Message-ID: <20240517143643.4.Ieb0179065847972a0f13e9a8574a80a5f65f3338@changeid>
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

Fixes: e2450d32e5fb ("drm/panel: ili9882t: Break out as separate driver")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/gpu/drm/panel/panel-ilitek-ili9882t.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9882t.c b/drivers/gpu/drm/panel/panel-ilitek-ili9882t.c
index 830d7cfbe857..a2ea25bb6624 100644
--- a/drivers/gpu/drm/panel/panel-ilitek-ili9882t.c
+++ b/drivers/gpu/drm/panel/panel-ilitek-ili9882t.c
@@ -495,13 +495,13 @@ static int ili9882t_prepare(struct drm_panel *panel)
 	return 0;
 
 poweroff:
+	gpiod_set_value(ili->enable_gpio, 0);
 	regulator_disable(ili->avee);
 poweroffavdd:
 	regulator_disable(ili->avdd);
 poweroff1v8:
 	usleep_range(5000, 7000);
 	regulator_disable(ili->pp1800);
-	gpiod_set_value(ili->enable_gpio, 0);
 
 	return ret;
 }
-- 
2.45.0.rc1.225.g2a3ae87e7f-goog

