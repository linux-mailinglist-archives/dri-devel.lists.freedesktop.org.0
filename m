Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C907688B348
	for <lists+dri-devel@lfdr.de>; Mon, 25 Mar 2024 22:57:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 345F710EB1E;
	Mon, 25 Mar 2024 21:57:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="gXRUO4xh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D801710EB25
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 21:57:02 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-1de0f92e649so33940285ad.0
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 14:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1711403821; x=1712008621;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QYCN6skM6Cit5WksDlDniZ8/1IrFMtsoAd0yueuyJuk=;
 b=gXRUO4xhpL6PwfErK7n5xEe5pdYMYoNg0HI46SmCERl2yBsFgo2FsEiCtVUkmVGUCH
 VSE3qm3z7EF2KZ0kE23VDCd8irgVy6X8IUOd7leJONg5ZtfkhRM7L87Mr0s7WDMTzp/+
 WT/JuGSdlxPG4l4kwDfTf6q9FK89r3JPqG7eA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711403821; x=1712008621;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QYCN6skM6Cit5WksDlDniZ8/1IrFMtsoAd0yueuyJuk=;
 b=SdXlPox5G+j1zawPRRWMgTemtW5LxvJV2N3TFpSlaKC9VZCOncu/y1G3wCna9agAk7
 11E4sXWlf4mak95ZY2thwzQsq5++YPbRal4Den4EFC5m9b3n+0iCiMDbcOHJh60P1fGC
 DFzsD4z40kmmisJJijbOkW1bvBT66Ok1rEgzMeCBJrArPCDRhHyzYWmlOJJKY503xV+6
 mkfZvqaH4YxCr/an1zNFTZ+XCZNF4Lt1KnPTzKFscoMezM5/93F+e71Zr2F/Y+//MYKQ
 VuBjcif3zaYjiAP7jS43nP/UXIao1AMSxbP+NlHr/PbfWzlt6EhWRTAAaFJIsrlRV+MW
 ihLg==
X-Gm-Message-State: AOJu0YyxZk/OV21/oHJnGaae0Bw5cY6NmatAfWOn+CuxQeMHj+MqnCUw
 vrBoA2KAgu31Lg6f4j2G2wF7RY6q9uoZdcV3u1xExWykmpt1WFLoSw9940ycpz5jRgVp0x16aNo
 =
X-Google-Smtp-Source: AGHT+IEh+en9BRxmGIP3JNI1cG6+0j/qIqp4F0gaYXJA4luV0U4Ir1VjAwt2ENf87iBuWCJ8iqhbqQ==
X-Received: by 2002:a17:903:987:b0:1e0:cd8a:58c with SMTP id
 mb7-20020a170903098700b001e0cd8a058cmr1285329plb.1.1711403821345; 
 Mon, 25 Mar 2024 14:57:01 -0700 (PDT)
Received: from dianders.sjc.corp.google.com
 ([2620:15c:9d:2:f21b:7dde:93cc:b987])
 by smtp.gmail.com with ESMTPSA id
 n6-20020a170902e54600b001def0897284sm5207866plf.76.2024.03.25.14.56.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Mar 2024 14:57:00 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org
Cc: Pin-yen Lin <treapking@chromium.org>,
 Prahlad Kilambi <prahladk@google.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Douglas Anderson <dianders@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] drm/panel-edp: If we fail to powerup/get EDID,
 use conservative timings
Date: Mon, 25 Mar 2024 14:56:26 -0700
Message-ID: <20240325145626.2.Ia7a55a9657b0b6aa4644fd497a0bc595a771258c@changeid>
X-Mailer: git-send-email 2.44.0.396.g6e790dbe36-goog
In-Reply-To: <20240325215631.3804796-1-dianders@chromium.org>
References: <20240325215631.3804796-1-dianders@chromium.org>
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

If at boot we fail to power up the eDP panel (most often happens if
the eDP panel never asserts HPD to us) or if we are unable to read the
EDID at bootup to figure out the panel's ID then let's use the
conservative eDP panel powerup/powerdown timings but _not_ fail the
probe.

It might seem strange to _not_ fail the probe in this case since we
were unable to powerup the panel and confirm it's there. However,
there is a reason to do this. Specifically, if we fail to probe the
panel then it really throws the whole display pipeline for loop. Most
DRM subsystems are written so that they wait until all components
(including the panel) have probed before they set everything up. When
the panel doesn't come up then this never happens. As a side effect of
not setting everything up then other display adapters don't get
initialized. As a practical example, I can see that if I open up a
sc7180-trogdor based Chromebook that's using the generic "edp-panel"
and unplug the eDP panel that it causes the _external_ DP monitor not
to function. This is obviously bad because it means that a device with
a dead eDP panel becomes e-waste when it could instead still be given
useful life with an external display.

NOTES:
- When we fail to probe like this, boot is a bit slow because we try
  several times to power the panel up. This doesn't feel horrible
  because it'll eventually work and the retries are known to help
  bring some panels up.
- In the case where we hit the condition of failing to power up, the
  display will likely _never_ have a chance to work again until
  reboot. Once the panel-edp pm_runtime resume function fails it
  doesn't ever seem to retry. This is probably for the best given that
  we don't have any real timing/modes. eDP isn't expected to be
  "hotplugged" so this makes some sense.
- It turns out that this makes panel-edp behave more similarly for
  users of the generic "edp-panel" compatible string and the old fixed
  panel compatible string. With the old fixed panel compatible string
  we don't talk to the panel during probe so we'd actually behave much
  the same way that we'll now behave for the generic "edp-panel".

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/gpu/drm/panel/panel-edp.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 8a19fea90ddf..607cdd6feda9 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -808,7 +808,10 @@ static int generic_edp_panel_probe(struct device *dev, struct panel_edp *panel)
 	/* Power the panel on so we can read the EDID */
 	ret = pm_runtime_get_sync(dev);
 	if (ret < 0) {
-		dev_err(dev, "Couldn't power on panel to read EDID: %d\n", ret);
+		dev_err(dev,
+			"Couldn't power on panel to ID it; using conservative timings: %d\n",
+			ret);
+		panel_edp_set_conservative_timings(panel, desc);
 		goto exit;
 	}
 
@@ -816,8 +819,8 @@ static int generic_edp_panel_probe(struct device *dev, struct panel_edp *panel)
 	if (base_block) {
 		panel_id = drm_edid_get_panel_id(base_block);
 	} else {
-		dev_err(dev, "Couldn't identify panel via EDID\n");
-		ret = -EIO;
+		dev_err(dev, "Couldn't read EDID for ID; using conservative timings\n");
+		panel_edp_set_conservative_timings(panel, desc);
 		goto exit;
 	}
 	drm_edid_decode_panel_id(panel_id, vend, &product_id);
@@ -844,12 +847,11 @@ static int generic_edp_panel_probe(struct device *dev, struct panel_edp *panel)
 		desc->delay = *panel->detected_panel->delay;
 	}
 
-	ret = 0;
 exit:
 	pm_runtime_mark_last_busy(dev);
 	pm_runtime_put_autosuspend(dev);
 
-	return ret;
+	return 0;
 }
 
 static int panel_edp_probe(struct device *dev, const struct panel_desc *desc,
-- 
2.44.0.396.g6e790dbe36-goog

