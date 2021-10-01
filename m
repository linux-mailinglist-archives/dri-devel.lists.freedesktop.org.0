Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73B1241F71F
	for <lists+dri-devel@lfdr.de>; Fri,  1 Oct 2021 23:50:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 480536E560;
	Fri,  1 Oct 2021 21:50:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26AF56E560
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Oct 2021 21:50:18 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id
 oj15-20020a17090b4d8f00b0019f8860d6e2so1147121pjb.5
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Oct 2021 14:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NL7Ui4pDzKD6Cqfc/rSld3tguEIwYPG7fUSYDal4DEY=;
 b=m5z3+8aUGB1/aVqhdvcvLjWaweeugGKaJ2xm3YgW2o29YhTbamwXAXZg7cLIQD1tCZ
 fvN2Q8ZX5iSk4zKhCdWb49sctlPcBg+q1vWgc1vYwKqU9r/8vkuzpBrHdzDf921Ezfiv
 q5Lh1OIAONXX9dSbdT7CpFkVidsPqatUSsulg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NL7Ui4pDzKD6Cqfc/rSld3tguEIwYPG7fUSYDal4DEY=;
 b=2aQn+9mlxeDOJXL9MDPHC1m7LIe1u4aZ0wTK+Ghq8diRE88yifFKpaWBTqXoD+RjBC
 42Blv5r/dlbyAQ9hVuCvBP1l5zDptU4ZtXeo0YgUJYIMtaNv2pej3zdqMj/J5NY0ZjmR
 v9G80n2qOqEW09sgPWV6ZaceaY1LSMtEYbZedInvJ9RZCJWodn4uF1DqcLcYV606+bn7
 m689JcRXqTW3IvmbxP+eF2lHBFGC7BcfeA9Av1B/ltqUXjZMD3I8lF2JTbPYaAvdSL0H
 bYIWrnDpA4GFTiUg8baKxnakOXHUsqaqNTreL5E3f/9NRB1MnuxfTLmw/kHwyMGTxNDj
 1UYQ==
X-Gm-Message-State: AOAM533E4OVXtq4uNu/agORuujmY9mOQzQH6J/h8TkK7Ek0V5HvUFV8x
 tddeuODqWN6nFOh+vG5HALYIOg==
X-Google-Smtp-Source: ABdhPJxAa+ytqGV91qQywYgHfFgfudFxi7R0Gdv7bI8eSjvNvxkJPbbYbO5+jovj0Lp9k88a23k6hA==
X-Received: by 2002:a17:90a:16:: with SMTP id 22mr22720079pja.25.1633125017619; 
 Fri, 01 Oct 2021 14:50:17 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:1e7d:5e91:4390:d04b])
 by smtp.gmail.com with UTF8SMTPSA id d5sm6405749pjs.53.2021.10.01.14.50.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Oct 2021 14:50:17 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Cc: Sean Paul <sean@poorly.run>, Jonas Karlman <jonas@kwiboo.se>,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 Brian Norris <briannorris@chromium.org>, stable@vger.kernel.org,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>
Subject: [PATCH v2] drm/bridge: analogix_dp: Grab runtime PM reference for
 DP-AUX
Date: Fri,  1 Oct 2021 14:42:55 -0700
Message-Id: <20211001144212.v2.1.I773a08785666ebb236917b0c8e6c05e3de471e75@changeid>
X-Mailer: git-send-email 2.33.0.800.g4c38ced690-goog
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

If the display is not enable()d, then we aren't holding a runtime PM
reference here. Thus, it's easy to accidentally cause a hang, if user
space is poking around at /dev/drm_dp_aux0 at the "wrong" time.

Let's get the panel and PM state right before trying to talk AUX.

Fixes: 0d97ad03f422 ("drm/bridge: analogix_dp: Remove duplicated code")
Cc: <stable@vger.kernel.org>
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Signed-off-by: Brian Norris <briannorris@chromium.org>
---

Changes in v2:
- Fix spelling in Subject
- DRM_DEV_ERROR() -> drm_err()
- Propagate errors from un-analogix_dp_prepare_panel()

 .../drm/bridge/analogix/analogix_dp_core.c    | 21 ++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index b7d2e4449cfa..6fc46ac93ef8 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -1632,8 +1632,27 @@ static ssize_t analogix_dpaux_transfer(struct drm_dp_aux *aux,
 				       struct drm_dp_aux_msg *msg)
 {
 	struct analogix_dp_device *dp = to_dp(aux);
+	int ret, ret2;
 
-	return analogix_dp_transfer(dp, msg);
+	ret = analogix_dp_prepare_panel(dp, true, false);
+	if (ret) {
+		drm_err(dp->drm_dev, "Failed to prepare panel (%d)\n", ret);
+		return ret;
+	}
+
+	pm_runtime_get_sync(dp->dev);
+	ret = analogix_dp_transfer(dp, msg);
+	pm_runtime_put(dp->dev);
+
+	ret2 = analogix_dp_prepare_panel(dp, false, false);
+	if (ret2) {
+		drm_err(dp->drm_dev, "Failed to unprepare panel (%d)\n", ret2);
+		/* Prefer the analogix_dp_transfer() error, if it exists. */
+		if (!ret)
+			ret = ret2;
+	}
+
+	return ret;
 }
 
 struct analogix_dp_device *
-- 
2.33.0.800.g4c38ced690-goog

