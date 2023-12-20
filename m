Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7324081A8E4
	for <lists+dri-devel@lfdr.de>; Wed, 20 Dec 2023 23:14:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6F7F10E619;
	Wed, 20 Dec 2023 22:14:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D8CF10E619
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Dec 2023 22:14:31 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-1d3ac87553bso1683395ad.3
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Dec 2023 14:14:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1703110471; x=1703715271;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZD3VpyHhC0C+pwwNEc0NgWoPlzlh6lpsOAPY3FHREss=;
 b=lN6jpfgVZ/A2TVWczAyzL+zsXVVF8OHoLnoXqqGFN1d09P7MQVbxfPWQsAP06DyAq8
 YNKNs/YgvCwR6mXfhHq2EeUeftI3bHWHvfpkUT6rFguk7wyDLij2a/LwrkztZmPeDiNd
 4BjEcGf7Iy5onzYiv6y0cgiVqaqYuWy9Qeu0Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703110471; x=1703715271;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZD3VpyHhC0C+pwwNEc0NgWoPlzlh6lpsOAPY3FHREss=;
 b=DgdCtBjunPUrx0nvEdWmZF7AjQMtxuXP1tegnnRXbPpkpgjDFZdZzQ6mntfbKhFhZz
 f2oJ7FNtaN+r4HiEaHSabXfzEwtx5FyiqKgLIvoBC4vFvH4zoi8GwOjreUlNsjiZaPMR
 ZJ5zau17eWecjeLCS+qu49Kop6qh8DYiYIocaSw3WuPFaly7LKN6+f8iCftzCBN0tvXX
 YWI4cvKPhRSQAdbFtThY+/XOcvy/iXO56RpUPJ+5SDOl/S8AmfX30emA/L6mDcS+Znqy
 22b0wjtd5QNZFjNyGCs//HIu5M0/NH9nJDUzcQJBDk0yNF948nKvbcEHsPudkrnp5L5P
 SegA==
X-Gm-Message-State: AOJu0Yyq7zwA5dVsJ9C6DOxQTBUnhvEpUOuVXGHHeCEBore6B0Zh5m8a
 pMg+5pnS8PCuzWehwGlrGlofEA==
X-Google-Smtp-Source: AGHT+IE49xQhoPUy1M+E8LWgCI2XEpW3zeBU1Pxn4Yw80hEdINh2bomR+e06vtYbgIK0Lmg8RUeSPA==
X-Received: by 2002:a17:903:1cc:b0:1d3:5f99:17df with SMTP id
 e12-20020a17090301cc00b001d35f9917dfmr8812369plh.38.1703110471046; 
 Wed, 20 Dec 2023 14:14:31 -0800 (PST)
Received: from hsinyi.sjc.corp.google.com ([2620:15c:9d:2:8e1f:dd12:809:b2c8])
 by smtp.gmail.com with ESMTPSA id
 d14-20020a170902aa8e00b001bf52834696sm203086plr.207.2023.12.20.14.14.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Dec 2023 14:14:30 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Douglas Anderson <dianders@chromium.org>
Subject: [PATCH] drm/panel-edp: use put_sync in unprepare
Date: Wed, 20 Dec 2023 14:13:11 -0800
Message-ID: <20231220221418.2610185-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 David Airlie <airlied@gmail.com>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some edp panel requires T10 (Delay from end of valid video data transmitted
by the Source device to power-off) less than 500ms. Using autosuspend with
delay set as 1000 violates this requirement.

Use put_sync_suspend in unprepare to meet the spec. For other cases (such
as getting EDID), it still uses autosuspend.

Suggested-by: Douglas Anderson <dianders@chromium.org>
Fixes: 5f04e7ce392d ("drm/panel-edp: Split eDP panels out of panel-simple")
Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 drivers/gpu/drm/panel/panel-edp.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index cd05c76868e3..7d556b1bfa82 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -429,8 +429,7 @@ static int panel_edp_unprepare(struct drm_panel *panel)
 	if (!p->prepared)
 		return 0;
 
-	pm_runtime_mark_last_busy(panel->dev);
-	ret = pm_runtime_put_autosuspend(panel->dev);
+	ret = pm_runtime_put_sync_suspend(panel->dev);
 	if (ret < 0)
 		return ret;
 	p->prepared = false;
-- 
2.43.0.472.g3155946c3a-goog

