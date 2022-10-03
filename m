Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE3B5F2814
	for <lists+dri-devel@lfdr.de>; Mon,  3 Oct 2022 07:04:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1A4010E205;
	Mon,  3 Oct 2022 05:04:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D93410E0D5
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Oct 2022 05:03:57 +0000 (UTC)
Received: by mail-pg1-x52c.google.com with SMTP id a23so1089811pgi.10
 for <dri-devel@lists.freedesktop.org>; Sun, 02 Oct 2022 22:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=ztuWh3+lm3Xgyvy8ErwnYqF7ln3RGH0S/A4OyK3wmIE=;
 b=Hz8TZprhU9xLfxIJDPiq1ixTjaUkHrGur4fPPa52CFjvLABRT995xyhJWJ8w1pt/HX
 HySMjpKk8DIwly7hIZgDp/G/m5E0OlvM9cErN3xt2UTEUFfpeAkJVSqgtG64B52weKIn
 3sJUdQFTYCDzyfRzvyj+a7heHPSPmwzHDY4Zo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=ztuWh3+lm3Xgyvy8ErwnYqF7ln3RGH0S/A4OyK3wmIE=;
 b=HDI06a01y0TWKHyGBzdOKksvZa9pMh3e8YCuDEdCH2M/9GIBK90BDf5onAaBgzK1+O
 OGADXQbEFtdvkTXox8ZO4XUP4dJs1jwXwAeOATygRrIRucrx9bwx+wI25E0kfKW/cP49
 eARL+PdK5Ao581ImcEZyIHV0gkUrGzrfsK4b+A8za7QldA/LkKO5nFsSAaUYSyM2rJWk
 4Rm/qj/cey3h5U4dMul+xGCAO3z9ApPNyaO4l9HSb+hRB6DbeRMfClm6Lqd3EXig06UU
 MvXcVcc6g4tKjTPhFuy6OOxEuJ5AfzJdQgeAKWZR4nzDuMegdIpZwBeHuVF8612k6N6w
 mr6g==
X-Gm-Message-State: ACrzQf2jSzuljG02u+BZKrt0VL5hv6kxxzgIXZQPLfLeWSeeEU591n4y
 qhZ3K3aMTkoYVBA+TkasXVhxKw==
X-Google-Smtp-Source: AMsMyM7w6djAOyImUB/oWDtW7Wxj/dH2t2EMQ4LGPYCFTqC3FDUnNEPHJfsbQCiA4dt1fFO01grIFg==
X-Received: by 2002:a05:6a00:14c4:b0:542:cd3a:591e with SMTP id
 w4-20020a056a0014c400b00542cd3a591emr20437876pfu.27.1664773436673; 
 Sun, 02 Oct 2022 22:03:56 -0700 (PDT)
Received: from treapking.tpe.corp.google.com
 ([2401:fa00:1:10:dfa6:5a1a:b35a:db69])
 by smtp.gmail.com with ESMTPSA id
 y8-20020a170902b48800b0017680faa1a8sm6174628plr.112.2022.10.02.22.03.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Oct 2022 22:03:55 -0700 (PDT)
From: Pin-yen Lin <treapking@chromium.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 2/2] drm/bridge: it6505: Add pre_enable/post_disable
 callback
Date: Mon,  3 Oct 2022 13:03:35 +0800
Message-Id: <20221003050335.1007931-3-treapking@chromium.org>
X-Mailer: git-send-email 2.38.0.rc1.362.ged0d419d3c-goog
In-Reply-To: <20221003050335.1007931-1-treapking@chromium.org>
References: <20221003050335.1007931-1-treapking@chromium.org>
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
Cc: Allen Chen <allen.chen@ite.com.tw>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Pin-yen Lin <treapking@chromium.org>,
 Hermes Wu <hermes.wu@ite.com.tw>, Hsin-Yi Wang <hsinyi@chromium.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add atomic_pre_enable and atomic_post_disable callback to make sure the
bridge is not powered off until atomic_post_disable is called. This
prevents a power leakage when it6505 is powered off, but the upstream
DRM bridge is still sending display signals.

Fixes: b5c84a9edcd4 ("drm/bridge: add it6505 driver")
Signed-off-by: Pin-yen Lin <treapking@chromium.org>

---

(no changes since v1)

 drivers/gpu/drm/bridge/ite-it6505.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index 685d8e750b12..27de6652f842 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -2992,6 +2992,28 @@ static void it6505_bridge_atomic_disable(struct drm_bridge *bridge,
 	}
 }
 
+static void it6505_bridge_atomic_pre_enable(struct drm_bridge *bridge,
+					    struct drm_bridge_state *old_state)
+{
+	struct it6505 *it6505 = bridge_to_it6505(bridge);
+	struct device *dev = &it6505->client->dev;
+
+	DRM_DEV_DEBUG_DRIVER(dev, "start");
+
+	pm_runtime_get_sync(dev);
+}
+
+static void it6505_bridge_atomic_post_disable(struct drm_bridge *bridge,
+					      struct drm_bridge_state *old_state)
+{
+	struct it6505 *it6505 = bridge_to_it6505(bridge);
+	struct device *dev = &it6505->client->dev;
+
+	DRM_DEV_DEBUG_DRIVER(dev, "start");
+
+	pm_runtime_put_sync(dev);
+}
+
 static enum drm_connector_status
 it6505_bridge_detect(struct drm_bridge *bridge)
 {
@@ -3026,6 +3048,8 @@ static const struct drm_bridge_funcs it6505_bridge_funcs = {
 	.mode_valid = it6505_bridge_mode_valid,
 	.atomic_enable = it6505_bridge_atomic_enable,
 	.atomic_disable = it6505_bridge_atomic_disable,
+	.atomic_pre_enable = it6505_bridge_atomic_pre_enable,
+	.atomic_post_disable = it6505_bridge_atomic_post_disable,
 	.detect = it6505_bridge_detect,
 	.get_edid = it6505_bridge_get_edid,
 };
-- 
2.38.0.rc1.362.ged0d419d3c-goog

