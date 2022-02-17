Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 829F94BACD2
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 23:42:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35F9610E8B5;
	Thu, 17 Feb 2022 22:42:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A394110E8B5
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 22:42:08 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id
 n19-20020a17090ade9300b001b9892a7bf9so10678387pjv.5
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 14:42:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5mmtHfGvX3QTdzLz6j/Nu6tjim8GE4bCKl/5zpm/NAQ=;
 b=BzfZpeq3rZdStoI1Wr0xcS8Cf55hQJ/D+7O5l60/MUPozDdqMR3PzVwSfYraa+nLNT
 NyD7gmG5bjFJAZvQjb+UrhHZ97vZIwQxC6do5y2+9SD9RrVdz/VEfZyfLpsRW5Svhs3y
 0aDXxqIAti6kqYHFQ6CBjV1g6soYBlxXwNrSQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5mmtHfGvX3QTdzLz6j/Nu6tjim8GE4bCKl/5zpm/NAQ=;
 b=s8r7w/Ftyx8VMXEnYijYvdDj4PCN77UFWn1HDE4CQneu9ATTCHsqlhwRFYLORSvoRe
 BVpt8uTfIWVCfW9DqzKIs4PUMj1qxfpoH1qJoeVFK5gN18pS0NhVZZwb6M7X2Q9GKy/Y
 u3ZvX0QXEPZFliC3qjc90YV6hqtifd4waNLS2AQpkVn6CORx4Q1ldluDsT0bDxW3YppY
 2bkHfZ6ogiMTOMkRVn/8lco66Au/BkoRwWVG7mH1PJM5MfPb0lFiHziEyVauFit3HQ4m
 yklv27E/EL0uvYNN+0z4+4bRodY0l3x1P/HY/1MPvxMx82C+++VpXdhPHMLkdotFNjPO
 7vHQ==
X-Gm-Message-State: AOAM531fOYbKT2LlwYc4icoONvjDmpt7KLZsTuht/oyEqYM6oYqKHYw6
 rn6/1QSMP6eq6FA13I+KParyISnOe7Y9cg==
X-Google-Smtp-Source: ABdhPJz3bf7M0OSxfziRldKe7HpMouFMO9Ur2/1DPJi+T1EoIE3EpMv4yzP/J7CTVuwGmI1BEieWyg==
X-Received: by 2002:a17:902:bd85:b0:14d:c29b:d534 with SMTP id
 q5-20020a170902bd8500b0014dc29bd534mr4651443pls.99.1645137728224; 
 Thu, 17 Feb 2022 14:42:08 -0800 (PST)
Received: from localhost ([2620:15c:202:201:677e:1914:4c14:1662])
 by smtp.gmail.com with UTF8SMTPSA id 4sm574985pfh.125.2022.02.17.14.42.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Feb 2022 14:42:07 -0800 (PST)
From: Brian Norris <briannorris@chromium.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v3 2/2] drm/bridge: analogix_dp: Enable autosuspend
Date: Thu, 17 Feb 2022 14:41:46 -0800
Message-Id: <20220217144136.v3.2.I48b18ab197c9b649d376cf8cfd934e59d338f86d@changeid>
X-Mailer: git-send-email 2.35.1.265.g69c8d7142f-goog
In-Reply-To: <20220217144136.v3.1.I773a08785666ebb236917b0c8e6c05e3de471e75@changeid>
References: <20220217144136.v3.1.I773a08785666ebb236917b0c8e6c05e3de471e75@changeid>
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
Cc: Jonas Karlman <jonas@kwiboo.se>, Brian Norris <briannorris@chromium.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Doug Anderson <dianders@chromium.org>, linux-rockchip@lists.infradead.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Sean Paul <sean@poorly.run>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DP AUX transactions can consist of many short operations. There's no
need to power things up/down in short intervals.

I pick an arbitrary 100ms; for the systems I'm testing (Rockchip
RK3399), runtime-PM transitions only take a few microseconds.

Signed-off-by: Brian Norris <briannorris@chromium.org>
---

Changes in v3:
 - New in v3

 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index 16be279aed2c..d82a4ddf44e7 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -1121,7 +1121,7 @@ static int analogix_dp_get_modes(struct drm_connector *connector)
 
 		pm_runtime_get_sync(dp->dev);
 		edid = drm_get_edid(connector, &dp->aux.ddc);
-		pm_runtime_put(dp->dev);
+		pm_runtime_put_autosuspend(dp->dev);
 		if (edid) {
 			drm_connector_update_edid_property(&dp->connector,
 							   edid);
@@ -1642,7 +1642,7 @@ static ssize_t analogix_dpaux_transfer(struct drm_dp_aux *aux,
 
 	ret = analogix_dp_transfer(dp, msg);
 out:
-	pm_runtime_put(dp->dev);
+	pm_runtime_put_autosuspend(dp->dev);
 
 	return ret;
 }
@@ -1775,6 +1775,8 @@ int analogix_dp_bind(struct analogix_dp_device *dp, struct drm_device *drm_dev)
 	if (ret)
 		return ret;
 
+	pm_runtime_use_autosuspend(dp->dev);
+	pm_runtime_set_autosuspend_delay(dp->dev, 100);
 	pm_runtime_enable(dp->dev);
 
 	ret = analogix_dp_create_bridge(drm_dev, dp);
-- 
2.35.1.265.g69c8d7142f-goog

