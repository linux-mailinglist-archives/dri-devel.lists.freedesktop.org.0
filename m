Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 73AC33DC034
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jul 2021 23:26:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F36C6F463;
	Fri, 30 Jul 2021 21:26:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88DD76F463
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jul 2021 21:26:51 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id
 pj14-20020a17090b4f4eb029017786cf98f9so5606907pjb.2
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jul 2021 14:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=37Nacw64+KOiMZmL+vH2rc7D0NFwBJZ1GX41lOzA7sI=;
 b=k3dRWkT1xUJQUM1V3eFMcOCXVOa7G3HDa077JfJ6+aehexe59cOrNfpB0XemFMroc7
 9fP1fXGIEoJ8JUIUXS0nvYt0g7InyqCzjz5uw5aaB6YNXKRPz3KVs6jgRqfLRflWaoNM
 EtrOjelZ44Et6gdFGNEK/YWJ3uD9WIzm5XkIY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=37Nacw64+KOiMZmL+vH2rc7D0NFwBJZ1GX41lOzA7sI=;
 b=E7WpqzdMCTXO8uvfweKFud26T1qvST07XJlXx+dibXaKoIIWYYEVaPd4f5POvb3B8X
 lG0uQ2IqFtrJZf6bOtl1IwvbCF0fY5gpauLdzVrihkiuUul8dw4rydgvWe/ZYfuDMpAV
 zbGtI39MS6gPJMIEN2Oza2vDJZGjs2xj5gD1ThcRJazZ3EnOzuNCivhS5+OOi3IUvcen
 sGnsjz8NIyrX1vtYqS2tffPEptfD2qwBBwpCl2KTew/mgjFOli34w+gjEp6woL4ss3qk
 VnbMYCisS8I+74jhT+CwcL/HIK2vkQAWAKqYil1+mZZa1XwX/zZa+s08EQIbcbjcREQ3
 tR8A==
X-Gm-Message-State: AOAM533dS8JnqkNeSFi6aWJkCSgSnWHraw2Q/z8LScLDoID1kDQdq7cp
 2t1S16e0dKaSbZ9hxlwJ08lxnQ==
X-Google-Smtp-Source: ABdhPJyd5vlwWOM/HeeHAZX/FPiTwLb2eJnUBso0gVxPSxpB1owLbAxI8YeEzKhk0K0yQ86ZtY/f3Q==
X-Received: by 2002:a63:2308:: with SMTP id j8mr4059101pgj.166.1627680411233; 
 Fri, 30 Jul 2021 14:26:51 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:3424:e0ac:5a92:d061])
 by smtp.gmail.com with ESMTPSA id u21sm3484625pfh.163.2021.07.30.14.26.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jul 2021 14:26:50 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Thierry Reding <thierry.reding@gmail.com>, Rob Herring <robh+dt@kernel.org>
Cc: Sam Ravnborg <sam@ravnborg.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Maxime Ripard <mripard@kernel.org>, Steev Klimaszewski <steev@kali.org>,
 Linus W <linus.walleij@linaro.org>,
 Douglas Anderson <dianders@chromium.org>, linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/6] drm/panel-simple: Don't re-read the EDID every time we
 power off the panel
Date: Fri, 30 Jul 2021 14:26:23 -0700
Message-Id: <20210730142537.v2.4.Ib810fb3bebd0bd6763e4609e1a6764d06064081e@changeid>
X-Mailer: git-send-email 2.32.0.554.ge1b32706d8-goog
In-Reply-To: <20210730212625.3071831-1-dianders@chromium.org>
References: <20210730212625.3071831-1-dianders@chromium.org>
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

The simple-panel driver is for panels that are not hot-pluggable at
runtime. Let's keep our cached EDID around until driver unload.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

(no changes since v1)

 drivers/gpu/drm/panel/panel-simple.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index ff8b59471c71..b06bf30c65d0 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -350,9 +350,6 @@ static int panel_simple_suspend(struct device *dev)
 	regulator_disable(p->supply);
 	p->unprepared_time = ktime_get();
 
-	kfree(p->edid);
-	p->edid = NULL;
-
 	return 0;
 }
 
@@ -834,6 +831,9 @@ static int panel_simple_remove(struct device *dev)
 	if (panel->ddc && (!panel->aux || panel->ddc != &panel->aux->ddc))
 		put_device(&panel->ddc->dev);
 
+	kfree(panel->edid);
+	panel->edid = NULL;
+
 	return 0;
 }
 
-- 
2.32.0.554.ge1b32706d8-goog

