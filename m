Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 07D2E362B57
	for <lists+dri-devel@lfdr.de>; Sat, 17 Apr 2021 00:41:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62C416ECFD;
	Fri, 16 Apr 2021 22:41:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA30C6ECFE
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 22:41:22 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id v13so1139501ple.9
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 15:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YO52CfN8ObAfgZLp7u0yIiEJEMcw9jv84B9RSSd91cE=;
 b=hA6/ZsuHqB3kmRjFkH5Jkmzrdy85gSWuR/4vaAHDMIE48BeNPayj8tRWKkTNZOoCUA
 gRRUhNxWn4Q+CAFmmSoYepPODVh1Dg8VZqqI+TAzcrKuUTSCCor5HJ/2yiH3K07JuKWA
 7Gbo7zdtWsX4PGODSqc8sfSuTvIpo5Wbl6XZE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YO52CfN8ObAfgZLp7u0yIiEJEMcw9jv84B9RSSd91cE=;
 b=i3F9O9zrUD/LkBdUvU4tOP+NLrib8IDuvVNIanPPscH4LS9K4Nj5ohK7pMNon5zJGT
 Ek2v+duv1GiNf756sQ79lHpKuC2l3NzaJb1UQTLH+90pt8+tNM+ynKtxkY3D/0VQ52A1
 sLr61LbHwUmxuBp/aaaFN74dK0x3xQlR9ZCSfCPz9QYb7cPjdhd1F5q2FCCi5cNASiB4
 V+je0x61UJTcalWg/X6SO02cbikgVRditIxPfKmsEO7J+jPwL2kgsMkWyJNt89MpL59t
 e0vEuRU+RAdlZzdEYWKU5GNuUdNtRoMUY4M6NGEOMOn1HwezwLJWKyI4IyKKI0J1mvKE
 3Xgg==
X-Gm-Message-State: AOAM5330MbDAwZypS9EmWtFFAyrzaK9M7ka62k9JHt/o118joB4bjNIk
 3kGA5L/xQFEECV19Nu3joxszYA==
X-Google-Smtp-Source: ABdhPJzVfbNwbQjph550fbIuOfgbviSQ03VrlkRSJ2bniftc4dglobcQ38N6Az75kI85FCVdC+w4lQ==
X-Received: by 2002:a17:902:a406:b029:e6:78c4:71c8 with SMTP id
 p6-20020a170902a406b02900e678c471c8mr11524014plq.17.1618612882638; 
 Fri, 16 Apr 2021 15:41:22 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:dc8a:c9d0:aa5b:5386])
 by smtp.gmail.com with ESMTPSA id r6sm5633659pgp.64.2021.04.16.15.41.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 15:41:22 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Sam Ravnborg <sam@ravnborg.org>, Wolfram Sang <wsa@kernel.org>
Subject: [PATCH v4 27/27] drm/panel: panel-simple: Prepare/unprepare are
 refcounted, not forced
Date: Fri, 16 Apr 2021 15:39:50 -0700
Message-Id: <20210416153909.v4.27.I502f2a92ddd36c3d28d014dd75e170c2d405a0a5@changeid>
X-Mailer: git-send-email 2.31.1.368.gbe11c130af-goog
In-Reply-To: <20210416223950.3586967-1-dianders@chromium.org>
References: <20210416223950.3586967-1-dianders@chromium.org>
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
Cc: robdclark@chromium.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Douglas Anderson <dianders@chromium.org>, Steev Klimaszewski <steev@kali.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Stephen Boyd <swboyd@chromium.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Historically simple-panel had code to make sure that if prepare() was
called on an already-prepared panel that it was a no-op. Similarly if
unprepare() was called on an already-unprepared panel it was also a
no-op. Essentially it means that these functions always "forced" the
value to be whatever the caller wanted it to be. You can see that the
forcing behavior dates back at least as far as 2014 by looking at
commit 613a633e7a56 ("drm/panel: simple: Add proper definition for
prepare and unprepare").

Apparently the code supporting the historical behavior may not be
needed [1] and prepare() / unprepare() are supposed to be
balanced. Let's try removing it and see if anyone breaks! If they do
then we can have a debate about whether we should change that code or
revert this patch. :-) If nobody breaks then we've nicely saved a few
lines of code and some complexity.

[1] https://lore.kernel.org/r/YHePsQgqOau1V5lD@pendragon.ideasonboard.com

Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

(no changes since v1)

 drivers/gpu/drm/panel/panel-simple.c | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 5a2953c4ca44..a2c3008af7e5 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -176,8 +176,6 @@ struct panel_simple {
 	bool enabled;
 	bool no_hpd;
 
-	bool prepared;
-
 	ktime_t prepared_time;
 	ktime_t unprepared_time;
 
@@ -355,18 +353,12 @@ static int panel_simple_suspend(struct device *dev)
 
 static int panel_simple_unprepare(struct drm_panel *panel)
 {
-	struct panel_simple *p = to_panel_simple(panel);
 	int ret;
 
-	/* Unpreparing when already unprepared is a no-op */
-	if (!p->prepared)
-		return 0;
-
 	pm_runtime_mark_last_busy(panel->dev);
 	ret = pm_runtime_put_autosuspend(panel->dev);
 	if (ret < 0)
 		return ret;
-	p->prepared = false;
 
 	return 0;
 }
@@ -475,18 +467,12 @@ static int panel_simple_prepare(struct drm_panel *panel)
 	struct panel_simple *p = to_panel_simple(panel);
 	int ret;
 
-	/* Preparing when already prepared is a no-op */
-	if (p->prepared)
-		return 0;
-
 	ret = pm_runtime_get_sync(panel->dev);
 	if (ret < 0) {
 		pm_runtime_put_autosuspend(panel->dev);
 		return ret;
 	}
 
-	p->prepared = true;
-
 	return 0;
 }
 
-- 
2.31.1.368.gbe11c130af-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
