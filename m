Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 083EF40B91B
	for <lists+dri-devel@lfdr.de>; Tue, 14 Sep 2021 22:23:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 294726E817;
	Tue, 14 Sep 2021 20:22:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BB976E7FA
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Sep 2021 20:22:42 +0000 (UTC)
Received: by mail-pf1-x42a.google.com with SMTP id 18so444649pfh.9
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Sep 2021 13:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dJXTwqS7PuPIT9CX0XVjRt+gK42F+FHMqbBg2Uj5BR4=;
 b=TqWvXeuyHuOSheemL0zyn3JHr5nZAS/bX+S2paShRs7l85FXpUjcDkt+1hQOqYJpwi
 Y5Pc8CsKF9F/Z3fUcl0iqJM4OIkeo1KmeN5dAWId8xYA37vSflKYmLAll37niHOfXqGS
 PN/VU9P8n26x9bxoXaxT8PyNNp5eteYT3LZqo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dJXTwqS7PuPIT9CX0XVjRt+gK42F+FHMqbBg2Uj5BR4=;
 b=OTXuFAbQCezmiyw6ocef16/rQtTOe9PWB0Pmx+otCgSw+S/1Dwr3OJhGHY43izDPT6
 NtWZgdMEoiKRshznvf70oKel7MnAr6RmdOG9bRR/uQdWC3gHWOpvlYkRbLd4q2P2c26V
 Nv5MQ+y6tRkHf/Km0Upm+h6GL/kFVyS97D+8mv8Q7B23nsinDQwO47kEhZ0Lj6Du9k2s
 6wmp5GmE8DJNWOvtq89H+O2sKE3FcaOsSJfhoG+9og4+aKp8tht7IkI7RZIFPWuq95CH
 0nKyEp0X8+QMF+jd0m7N3YUbFqcoPbp1Rk5bCt8Vs4F9pn7vKSwgqFtteAMTdaG/XDHH
 018A==
X-Gm-Message-State: AOAM530HNU8Jauz2Pc8FnKs4/1+t2+4/3WVoV2XjYQ7YwQu/zYkUc5Y3
 ooUMKQOxvVCTzHZGOjY6nVDw6A==
X-Google-Smtp-Source: ABdhPJyDGeNjSKE64qgG3//L1RREy4RmX89o+nEgvz2C87yHljnSuXQt+fd9GBedSnhIztUqyUoGfA==
X-Received: by 2002:a63:6d89:: with SMTP id
 i131mr16955280pgc.235.1631650961596; 
 Tue, 14 Sep 2021 13:22:41 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:f38f:9d0f:3eba:f8c4])
 by smtp.gmail.com with ESMTPSA id 141sm12185393pgg.16.2021.09.14.13.22.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Sep 2021 13:22:41 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Thierry Reding <thierry.reding@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Sam Ravnborg <sam@ravnborg.org>
Cc: devicetree@vger.kernel.org, Steev Klimaszewski <steev@kali.org>,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Linus W <linus.walleij@linaro.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, Maxime Ripard <mripard@kernel.org>,
 Douglas Anderson <dianders@chromium.org>, linux-kernel@vger.kernel.org
Subject: [PATCH v5 14/15] drm/panel-edp: Don't re-read the EDID every time we
 power off the panel
Date: Tue, 14 Sep 2021 13:22:01 -0700
Message-Id: <20210914132020.v5.14.Ib810fb3bebd0bd6763e4609e1a6764d06064081e@changeid>
X-Mailer: git-send-email 2.33.0.309.g3052b89438-goog
In-Reply-To: <20210914202202.1702601-1-dianders@chromium.org>
References: <20210914202202.1702601-1-dianders@chromium.org>
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
Acked-by: Sam Ravnborg <sam@ravnborg.org>
---

(no changes since v4)

Changes in v4:
- panel-simple-edp => panel-edp

Changes in v3:
- ("Don't re-read the EDID every time") moved to eDP only patch.

 drivers/gpu/drm/panel/panel-edp.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index a83ef9905ea7..817c60858ef8 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -362,9 +362,6 @@ static int panel_edp_suspend(struct device *dev)
 	regulator_disable(p->supply);
 	p->unprepared_time = ktime_get();
 
-	kfree(p->edid);
-	p->edid = NULL;
-
 	return 0;
 }
 
@@ -758,6 +755,9 @@ static int panel_edp_remove(struct device *dev)
 	if (panel->ddc && (!panel->aux || panel->ddc != &panel->aux->ddc))
 		put_device(&panel->ddc->dev);
 
+	kfree(panel->edid);
+	panel->edid = NULL;
+
 	return 0;
 }
 
-- 
2.33.0.309.g3052b89438-goog

