Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48E4C3697B8
	for <lists+dri-devel@lfdr.de>; Fri, 23 Apr 2021 19:00:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0DA96EC14;
	Fri, 23 Apr 2021 16:59:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4D146EC0E
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Apr 2021 16:59:52 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id n10so14365644plc.0
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Apr 2021 09:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gV3qYwahIARQiQrXn6qcnB2XNtIx8vMB6/KiYYZ2Nu0=;
 b=ODW8f2PHl6os3mSPPZkE6MzhNedNFfpKM5Cll2rpPJj/CieenT2TJvOrCFLAddwT7H
 h34InzeviKqXtD5UwhSUPmp7/7PwMZumIXib+w6JAqGZrl+xK93wv3tzjpFrL0kZZIXN
 DVRIqdDSLKIzD/YTMGLJCvaciUqvedx6Ary0M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gV3qYwahIARQiQrXn6qcnB2XNtIx8vMB6/KiYYZ2Nu0=;
 b=dJhhmCUhxR6lJaHE4qPUPAI0TL1PLz/BHQT01F10sae8SkPISZCVzVdQDIKO5ZNiyA
 nI6gpGhh3qvXACKik2BPHg7YXAeNXE4PT8x0uwT/DxYu1GEq8zwp1Kupb3if1ucZeIYY
 KUaDZ7Qyfn/kJa/wUBK6fHqqlH2hoDIogSMt+E+LmIVivFj70MGI0QDmXo7zZT74maKq
 vhtZMab8QePQ3BRmjBzoE6mViD37izoFbEy6sqAvUgYYpQxpMgAVgfD8xKgl/tSN8vQr
 FsUenZaaG31counH14AIgjAJAfKckET77LGEihHhp075msnhus69A9voNumR1JrZ9Ckg
 MV2g==
X-Gm-Message-State: AOAM532E/ZTKYDTx3e3HDxNoynnPrzU8fZJB9apqopvQu/SPEo+afRv4
 yKFR1revpKqw0UdqxS056dQybg==
X-Google-Smtp-Source: ABdhPJxlBL9L1zQOEo1208W4LdTrk3u3cxg+rADQcsddskPPxY8toqxStFbKWD53qfQjCXP5FGOXDQ==
X-Received: by 2002:a17:90a:88e:: with SMTP id
 v14mr5347003pjc.107.1619197192542; 
 Fri, 23 Apr 2021 09:59:52 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:6d86:663d:71f8:6a11])
 by smtp.gmail.com with ESMTPSA id v8sm5123607pfm.128.2021.04.23.09.59.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Apr 2021 09:59:52 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Sam Ravnborg <sam@ravnborg.org>, Wolfram Sang <wsa@kernel.org>
Subject: [PATCH v5 11/20] drm/bridge: ti-sn65dsi86: Use pm_runtime autosuspend
Date: Fri, 23 Apr 2021 09:58:57 -0700
Message-Id: <20210423095743.v5.11.I4c0b4a87e4dc19e5023b4d0a21bbfa6d9c09ebd8@changeid>
X-Mailer: git-send-email 2.31.1.498.g6c1eba8ee3d-goog
In-Reply-To: <20210423165906.2504169-1-dianders@chromium.org>
References: <20210423165906.2504169-1-dianders@chromium.org>
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
Cc: robdclark@chromium.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Douglas Anderson <dianders@chromium.org>,
 Steev Klimaszewski <steev@kali.org>, Stephen Boyd <swboyd@chromium.org>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>, linux-i2c@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Robert Foss <robert.foss@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Let's make the bridge use autosuspend with a 500ms delay. This is in
preparation for promoting DP AUX transfers to their own sub-driver so
that we're not constantly powering up and down the device as we
transfer all the chunks.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

(no changes since v1)

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 0bd1a1d1453e..49b76b2ffe25 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -243,7 +243,7 @@ static int status_show(struct seq_file *s, void *data)
 		seq_printf(s, "[0x%02x] = 0x%08x\n", reg, val);
 	}
 
-	pm_runtime_put(pdata->dev);
+	pm_runtime_put_autosuspend(pdata->dev);
 
 	return 0;
 }
@@ -293,7 +293,7 @@ static int ti_sn_bridge_connector_get_modes(struct drm_connector *connector)
 	if (!edid) {
 		pm_runtime_get_sync(pdata->dev);
 		edid = pdata->edid = drm_get_edid(connector, &pdata->aux.ddc);
-		pm_runtime_put(pdata->dev);
+		pm_runtime_put_autosuspend(pdata->dev);
 	}
 
 	if (edid && drm_edid_is_valid(edid)) {
@@ -419,7 +419,7 @@ static int ti_sn_bridge_attach(struct drm_bridge *bridge,
 	/* check if continuous dsi clock is required or not */
 	pm_runtime_get_sync(pdata->dev);
 	regmap_read(pdata->regmap, SN_DPPLL_SRC_REG, &val);
-	pm_runtime_put(pdata->dev);
+	pm_runtime_put_autosuspend(pdata->dev);
 	if (!(val & DPPLL_CLK_SRC_DSICLK))
 		dsi->mode_flags |= MIPI_DSI_CLOCK_NON_CONTINUOUS;
 
@@ -1050,7 +1050,7 @@ static int ti_sn_bridge_gpio_get(struct gpio_chip *chip, unsigned int offset)
 	 */
 	pm_runtime_get_sync(pdata->dev);
 	ret = regmap_read(pdata->regmap, SN_GPIO_IO_REG, &val);
-	pm_runtime_put(pdata->dev);
+	pm_runtime_put_autosuspend(pdata->dev);
 
 	if (ret)
 		return ret;
@@ -1101,7 +1101,7 @@ static int ti_sn_bridge_gpio_direction_input(struct gpio_chip *chip,
 	 * it off and when it comes back it will have lost all state, but
 	 * that's OK because the default is input and we're now an input.
 	 */
-	pm_runtime_put(pdata->dev);
+	pm_runtime_put_autosuspend(pdata->dev);
 
 	return 0;
 }
@@ -1127,7 +1127,7 @@ static int ti_sn_bridge_gpio_direction_output(struct gpio_chip *chip,
 				 SN_GPIO_MUX_OUTPUT << shift);
 	if (ret) {
 		clear_bit(offset, pdata->gchip_output);
-		pm_runtime_put(pdata->dev);
+		pm_runtime_put_autosuspend(pdata->dev);
 	}
 
 	return ret;
@@ -1418,6 +1418,8 @@ static int ti_sn65dsi86_probe(struct i2c_client *client,
 	ret = devm_add_action_or_reset(dev, ti_sn65dsi86_runtime_disable, dev);
 	if (ret)
 		return ret;
+	pm_runtime_set_autosuspend_delay(pdata->dev, 500);
+	pm_runtime_use_autosuspend(pdata->dev);
 
 	ti_sn65dsi86_debugfs_init(pdata);
 
-- 
2.31.1.498.g6c1eba8ee3d-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
