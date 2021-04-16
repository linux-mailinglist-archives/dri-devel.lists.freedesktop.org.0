Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F9A0362B5A
	for <lists+dri-devel@lfdr.de>; Sat, 17 Apr 2021 00:41:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A02BF6ED05;
	Fri, 16 Apr 2021 22:41:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFC156ECFA
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 22:41:12 +0000 (UTC)
Received: by mail-pf1-x436.google.com with SMTP id m11so19272520pfc.11
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 15:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZLGZrRnlIJ+Q6fNp9u8b5zkhbGTSlu2wrvXeH+N18lk=;
 b=f7A6N+LBwds96DKcnAxCPhVICp3mFzK/2lCSKhq57FJpyvvP+/tnaGpnjy8Jsl+6fs
 /8DsrdQHOQ6RiR18G01pJulcx5iYNQgg9tPDxSTqlVj3DV4Y2oEOvHVRlpfXddQDTrmz
 bXcobJYDnTXegQGsC4iEh1GIaMUD4h5QRE3Zw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZLGZrRnlIJ+Q6fNp9u8b5zkhbGTSlu2wrvXeH+N18lk=;
 b=aRS4qVxjadlFZix8ckEeHqX+tjqodbcFtLfYrHCw6Bsd7GZfpvAfskV0MYxP5rlg1X
 HuccYVn7OofXJrMdzGen1HNucYWHzRPC08qibQo7+FqkWzqYWf+42aBk7jEGMG4N3oc6
 JWTSdjf2V5+gUdfDr9jKvDpzCChnJPT6KTIXuHTstLoU9Rgf1B0bQyvLHrvzWmr1BV/n
 mXD8CPeVZrXJ9QKf7S+7GYPdoFK26XMHPvbjtDvS5tj9YhdzAkE4pfjddcY6GRDNLmQS
 PgmUxruCYwWaIjhheXK2o2GZUwQWFUg6j9a6U/0L74l5VzKifjwcWEA61lJDoJVNlXxj
 2kuw==
X-Gm-Message-State: AOAM533p6AN4KfT568sfv5+8RpFO/9jPk5TSqqUQ92ThMPT3rrI1X5Kg
 Jd4ctPGIkslcyP9nvqOh2vq7Cg==
X-Google-Smtp-Source: ABdhPJxMQNoobDLQCYHD6t2q4gFM11mEhbzq4z+G4WrDwfLOvv7+xmFuWyzBzj7KoSAVU50GfE4qFw==
X-Received: by 2002:a63:5a50:: with SMTP id k16mr1079872pgm.185.1618612871938; 
 Fri, 16 Apr 2021 15:41:11 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:dc8a:c9d0:aa5b:5386])
 by smtp.gmail.com with ESMTPSA id r6sm5633659pgp.64.2021.04.16.15.41.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 15:41:11 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Sam Ravnborg <sam@ravnborg.org>, Wolfram Sang <wsa@kernel.org>
Subject: [PATCH v4 17/27] drm/bridge: ti-sn65dsi86: Use pm_runtime autosuspend
Date: Fri, 16 Apr 2021 15:39:40 -0700
Message-Id: <20210416153909.v4.17.I4c0b4a87e4dc19e5023b4d0a21bbfa6d9c09ebd8@changeid>
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

Let's make the bridge use autosuspend with a 500ms delay. This is in
preparation for promoting DP AUX transfers to their own sub-driver so
that we're not constantly powering up and down the device as we
transfer all the chunks.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

(no changes since v1)

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 44edcf6f5744..a98abf496190 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -243,7 +243,7 @@ static int status_show(struct seq_file *s, void *data)
 		seq_printf(s, "[0x%02x] = 0x%08x\n", reg, val);
 	}
 
-	pm_runtime_put(pdata->dev);
+	pm_runtime_put_autosuspend(pdata->dev);
 
 	return 0;
 }
@@ -292,7 +292,7 @@ static int ti_sn_bridge_connector_get_modes(struct drm_connector *connector)
 	if (!edid) {
 		pm_runtime_get_sync(pdata->dev);
 		edid = pdata->edid = drm_get_edid(connector, &pdata->aux.ddc);
-		pm_runtime_put(pdata->dev);
+		pm_runtime_put_autosuspend(pdata->dev);
 	}
 
 	if (edid && drm_edid_is_valid(edid)) {
@@ -418,7 +418,7 @@ static int ti_sn_bridge_attach(struct drm_bridge *bridge,
 	/* check if continuous dsi clock is required or not */
 	pm_runtime_get_sync(pdata->dev);
 	regmap_read(pdata->regmap, SN_DPPLL_SRC_REG, &val);
-	pm_runtime_put(pdata->dev);
+	pm_runtime_put_autosuspend(pdata->dev);
 	if (!(val & DPPLL_CLK_SRC_DSICLK))
 		dsi->mode_flags |= MIPI_DSI_CLOCK_NON_CONTINUOUS;
 
@@ -1049,7 +1049,7 @@ static int ti_sn_bridge_gpio_get(struct gpio_chip *chip, unsigned int offset)
 	 */
 	pm_runtime_get_sync(pdata->dev);
 	ret = regmap_read(pdata->regmap, SN_GPIO_IO_REG, &val);
-	pm_runtime_put(pdata->dev);
+	pm_runtime_put_autosuspend(pdata->dev);
 
 	if (ret)
 		return ret;
@@ -1100,7 +1100,7 @@ static int ti_sn_bridge_gpio_direction_input(struct gpio_chip *chip,
 	 * it off and when it comes back it will have lost all state, but
 	 * that's OK because the default is input and we're now an input.
 	 */
-	pm_runtime_put(pdata->dev);
+	pm_runtime_put_autosuspend(pdata->dev);
 
 	return 0;
 }
@@ -1126,7 +1126,7 @@ static int ti_sn_bridge_gpio_direction_output(struct gpio_chip *chip,
 				 SN_GPIO_MUX_OUTPUT << shift);
 	if (ret) {
 		clear_bit(offset, pdata->gchip_output);
-		pm_runtime_put(pdata->dev);
+		pm_runtime_put_autosuspend(pdata->dev);
 	}
 
 	return ret;
@@ -1408,6 +1408,8 @@ static int ti_sn65dsi86_probe(struct i2c_client *client,
 	ret = devm_add_action_or_reset(dev, ti_sn65dsi86_runtime_disable, dev);
 	if (ret)
 		return ret;
+	pm_runtime_set_autosuspend_delay(pdata->dev, 500);
+	pm_runtime_use_autosuspend(pdata->dev);
 
 	ti_sn65dsi86_debugfs_init(pdata);
 
-- 
2.31.1.368.gbe11c130af-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
