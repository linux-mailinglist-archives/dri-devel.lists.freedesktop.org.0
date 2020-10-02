Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E33B5281D4F
	for <lists+dri-devel@lfdr.de>; Fri,  2 Oct 2020 23:04:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE1246E9D5;
	Fri,  2 Oct 2020 21:04:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 174386E9D5
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Oct 2020 21:04:05 +0000 (UTC)
Received: by mail-pj1-x1044.google.com with SMTP id kk9so1613419pjb.2
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Oct 2020 14:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=y3PElMZRJMkaRghiMVOPt6nMvqoDpeTvNCgddImW4u4=;
 b=Gndo/cfCnVRe8jOcL5DbHyNpit3JpPROYpaWvMO5JRaw1EtOc2BZUXJ7Cns9JG32jl
 1sRBtpvwYbgEttJovOYiEe08h+JCafwNEnCiefjkoAsgMgnNIp/jyf5p10nURMU3oaG3
 5Ilv4mcBomrcceFsuMPwYcWc5PincGmVeEtQ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=y3PElMZRJMkaRghiMVOPt6nMvqoDpeTvNCgddImW4u4=;
 b=D0wv3f6HMd2KJht1fgb0ej73jzRgvsk09ss24MJxdhPOjNVuOG6+dJLbikbsv14JR8
 RR1p1SbfOONG0wbsLBXTyGWVU2nenntjCTa3gH/VQpZvxox1KUxfxQJHbIPfHlDJlawx
 cnWtVuc6EZc5sF2+ByYNLKZ73ovykKtL0wE+gSaXPgAYagP3O/4gYgC2HlOQj0c2mBbM
 oct06s/UTqX30cKC6T27f7GLsxEcNMCQzHrZ82NY9iDUTjZJcsQzzs18zgKIOu/VR2Ds
 JlHfzbrxxOpeGPYhuKrCaQoHY/qNOnCSXlSBO4OrXNOC0isFHg5pEqeDzKCfBoKOyoJg
 hbQw==
X-Gm-Message-State: AOAM530A8429HQxcBPE2/RFTQRrh1kT9+jhHw5aDDdHiX1c47+I7pZg2
 qkixqB6nyFgzJJPLFIvYAFZiHw==
X-Google-Smtp-Source: ABdhPJwObc2CVXkLyE6TfPgD87Aace5eedqFrpqoq5s1/H5ktmlXavfRjlQUeNQTJJkgUm0U5Tghvg==
X-Received: by 2002:a17:90b:1b50:: with SMTP id
 nv16mr4637212pjb.153.1601672644608; 
 Fri, 02 Oct 2020 14:04:04 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:42b0:34ff:fe3d:58e6])
 by smtp.gmail.com with ESMTPSA id s4sm2935057pfu.107.2020.10.02.14.04.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2020 14:04:04 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH] drm/bridge: ti-sn65dsi86: Add retries for link training
Date: Fri,  2 Oct 2020 14:03:51 -0700
Message-Id: <20201002135920.1.I2adbc90b2db127763e2444bd5a4e5bf30e1db8e5@changeid>
X-Mailer: git-send-email 2.28.0.806.g8561365e88-goog
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
Cc: Rob Clark <robdclark@chromium.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>,
 Steev Klimaszewski <steev@kali.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On some panels hooked up to the ti-sn65dsi86 bridge chip we found that
link training was failing.  Specifically, we'd see:

  ti_sn65dsi86 2-002d: [drm:ti_sn_bridge_enable] *ERROR* Link training failed, link is off (-5)

The panel was hooked up to a logic analyzer and it was found that, as
part of link training, the bridge chip was writing a 0x1 to DPCD
address 00600h and the panel responded NACK.  As can be seen in header
files, the write of 0x1 to DPCD address 0x600h means we were trying to
write the value DP_SET_POWER_D0 to the register DP_SET_POWER.  The
panel vendor says that a NACK in this case is not unexpected and means
"not ready, try again".

In testing, we found that this panel would respond with a NACK in
about 1/25 times.  Adding the retry logic worked fine and the most
number of tries needed was 3.  Just to be safe, we'll add 10 tries
here and we'll add a little blurb to the logs if we ever need more
than 5.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 40 +++++++++++++++++++--------
 1 file changed, 29 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index ecdf9b01340f..6e12cda69b54 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -106,6 +106,8 @@
 #define SN_NUM_GPIOS			4
 #define SN_GPIO_PHYSICAL_OFFSET		1
 
+#define SN_LINK_TRAINING_TRIES		10
+
 /**
  * struct ti_sn_bridge - Platform data for ti-sn65dsi86 driver.
  * @dev:          Pointer to our device.
@@ -673,6 +675,7 @@ static int ti_sn_link_training(struct ti_sn_bridge *pdata, int dp_rate_idx,
 {
 	unsigned int val;
 	int ret;
+	int i;
 
 	/* set dp clk frequency value */
 	regmap_update_bits(pdata->regmap, SN_DATARATE_CONFIG_REG,
@@ -689,19 +692,34 @@ static int ti_sn_link_training(struct ti_sn_bridge *pdata, int dp_rate_idx,
 		goto exit;
 	}
 
-	/* Semi auto link training mode */
-	regmap_write(pdata->regmap, SN_ML_TX_MODE_REG, 0x0A);
-	ret = regmap_read_poll_timeout(pdata->regmap, SN_ML_TX_MODE_REG, val,
-				       val == ML_TX_MAIN_LINK_OFF ||
-				       val == ML_TX_NORMAL_MODE, 1000,
-				       500 * 1000);
-	if (ret) {
-		*last_err_str = "Training complete polling failed";
-	} else if (val == ML_TX_MAIN_LINK_OFF) {
-		*last_err_str = "Link training failed, link is off";
-		ret = -EIO;
+	/*
+	 * We'll try to link train several times.  As part of link training
+	 * the bridge chip will write DP_SET_POWER_D0 to DP_SET_POWER.  If
+	 * the panel isn't ready quite it might respond NAK here which means
+	 * we need to try again.
+	 */
+	for (i = 0; i < SN_LINK_TRAINING_TRIES; i++) {
+		/* Semi auto link training mode */
+		regmap_write(pdata->regmap, SN_ML_TX_MODE_REG, 0x0A);
+		ret = regmap_read_poll_timeout(pdata->regmap, SN_ML_TX_MODE_REG, val,
+					val == ML_TX_MAIN_LINK_OFF ||
+					val == ML_TX_NORMAL_MODE, 1000,
+					500 * 1000);
+		if (ret) {
+			*last_err_str = "Training complete polling failed";
+		} else if (val == ML_TX_MAIN_LINK_OFF) {
+			*last_err_str = "Link training failed, link is off";
+			ret = -EIO;
+			continue;
+		}
+
+		break;
 	}
 
+	/* If we saw quite a few retries, add a note about it */
+	if (!ret && i > SN_LINK_TRAINING_TRIES / 2)
+		DRM_DEV_INFO(pdata->dev, "Link training needed %d retries\n", i);
+
 exit:
 	/* Disable the PLL if we failed */
 	if (ret)
-- 
2.28.0.806.g8561365e88-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
