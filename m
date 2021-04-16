Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D9E00362B4E
	for <lists+dri-devel@lfdr.de>; Sat, 17 Apr 2021 00:41:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F5FE6ECED;
	Fri, 16 Apr 2021 22:41:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCA726ECED
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 22:41:07 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id 20so10780333pll.7
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 15:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DFM8liF/M0xdOJLWarwocCWEWNZPfb1MoRCxfTIdoG4=;
 b=R1ZV6OrerC1010l29PrywmSUIvHfXf06HH7yhI1yG+h5k4X7/yLM+e9GkaeGj1Qz+H
 a2A7fiV/+deWlVIRXkHUtUY7+p45jCy/DFVOTwfEG1ltxcpHdGMp+skwlySthUD0wojh
 tRpIYmITlzuwj/MMBzpORlgsB3ccG6UXCHXw0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DFM8liF/M0xdOJLWarwocCWEWNZPfb1MoRCxfTIdoG4=;
 b=m7eWUPSBHIbD1X5A45iAXnLqiT+LBfXLezQEPiqA70C3ZbN6vPbRJWUUIdkdwRM4EW
 RfV5JvOk5qd/6x/0sboN5ksjC8dCzNVnqshFhMSdjIQg7N/adS+1I+n1UB0h1134twQX
 VJQwZ78ECLyJfi+5Fdy5646TQeccWSxRM4KTvcAEPka+YHSv7VFPBk2MuyMYf17WekOG
 +q/Pu0BDo9rU1a4CJDB8c31SKbIHt9BTDHJ7PQ1ZM1MFUu6N/IeG58cnO1rnCi+MeH0R
 stWFX8SlbovssLeIv/Eg06rHbPc8wPpi6n/AMke+GpyAUxjP4zzamGjt8peExMdQhqbZ
 Y8XQ==
X-Gm-Message-State: AOAM5329f00pfUjHguFfiOiREH3Oo3aKlG862qcShET3BHIk0ONiUYV3
 0lS6ae1ZqoCO8EYQNt+aF+eUpw==
X-Google-Smtp-Source: ABdhPJyvWWjd+DHCZICjcW8hN5oKKncQlVhyFnMlkZ6SzJVXeRjAeJrO14HIwCTmtT73LHzsKF8HAA==
X-Received: by 2002:a17:902:c94f:b029:ec:85bd:1f24 with SMTP id
 i15-20020a170902c94fb02900ec85bd1f24mr2964510pla.4.1618612867526; 
 Fri, 16 Apr 2021 15:41:07 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:dc8a:c9d0:aa5b:5386])
 by smtp.gmail.com with ESMTPSA id r6sm5633659pgp.64.2021.04.16.15.41.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 15:41:07 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Sam Ravnborg <sam@ravnborg.org>, Wolfram Sang <wsa@kernel.org>
Subject: [PATCH v4 13/27] drm/bridge: ti-sn65dsi86: Use devm to do our
 runtime_disable
Date: Fri, 16 Apr 2021 15:39:36 -0700
Message-Id: <20210416153909.v4.13.I1e627eb5f316c0cf6595b120e6e262f5bf890300@changeid>
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
 Robert Foss <robert.foss@linaro.org>, Stephen Boyd <swboyd@chromium.org>,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There's no devm_runtime_enable(), but it's easy to use
devm_add_action_or_reset() and means we don't need to worry about the
disable in our remove() routine or in error paths.

No functional changes intended by this change.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

(no changes since v1)

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index a200e88fd006..53f1f7b3022f 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -1223,6 +1223,11 @@ static void ti_sn_bridge_parse_lanes(struct ti_sn65dsi86 *pdata,
 	pdata->ln_polrs = ln_polrs;
 }
 
+static void ti_sn65dsi86_runtime_disable(void *data)
+{
+	pm_runtime_disable(data);
+}
+
 static int ti_sn65dsi86_probe(struct i2c_client *client,
 			      const struct i2c_device_id *id)
 {
@@ -1278,12 +1283,13 @@ static int ti_sn65dsi86_probe(struct i2c_client *client,
 		return ret;
 
 	pm_runtime_enable(dev);
+	ret = devm_add_action_or_reset(dev, ti_sn65dsi86_runtime_disable, dev);
+	if (ret)
+		return ret;
 
 	ret = ti_sn_setup_gpio_controller(pdata);
-	if (ret) {
-		pm_runtime_disable(dev);
+	if (ret)
 		return ret;
-	}
 
 	pdata->aux.name = "ti-sn65dsi86-aux";
 	pdata->aux.dev = dev;
@@ -1316,8 +1322,6 @@ static int ti_sn65dsi86_remove(struct i2c_client *client)
 
 	drm_bridge_remove(&pdata->bridge);
 
-	pm_runtime_disable(pdata->dev);
-
 	of_node_put(pdata->host_node);
 
 	return 0;
-- 
2.31.1.368.gbe11c130af-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
