Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F24C54BD12
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jun 2022 23:54:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D67BE1122CF;
	Tue, 14 Jun 2022 21:54:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B2971122CF
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jun 2022 21:54:42 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id
 hv24-20020a17090ae41800b001e33eebdb5dso2294074pjb.0
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jun 2022 14:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AwX0A/0Dxcjuy9zRSFxAY+0IKc5Dbas55VbNobVwPJc=;
 b=CSv9NkEHHzkwLhmuXSgOOHqRPc31dwtBa3/7oUsRLH0ubS19jeVHMW6b5KZcE6XzBA
 FeCH7ES5/xJCaRRVyr9usmVB1jKYuKfsYiZLWsWFLGRNR/Mot8qZEIm4Z6uvbIqvfk6+
 15XBa1ozkpPIxqYJJUSfgJX449FeHmFTesIS4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AwX0A/0Dxcjuy9zRSFxAY+0IKc5Dbas55VbNobVwPJc=;
 b=WBsne7zUQxGueSu0YHobU3HG4NV0gdej8GPadILv1ADvway9H9cqv+kFX/+b94DI9b
 r/m3Y2aA6wyI8VILqOGH87Kn4MXgMuth5ikekcoxbWpJKByBCCmkETAFcHkWYCIe/koS
 Mv5GsmD//skh/dFdMVVpFdKGAFX2syQgrhhr0jD0nPtjfI8b4a3fge6Jy2UQZtwMl749
 XbjynzYLQgzf3G4H3tdQB/0np4SObEaBIHPh34Tvb/fr1nj/ozjluVwAT4RTybXf4t8z
 VoOEWbcdMwMQWWiwrHJNaXveHl7JsOKzX/iUOuybCpgWDOkQrQxuDYUmMbpq4YvAUd8f
 eiYw==
X-Gm-Message-State: AJIora/lprIO05A0Bzs/J7H5utPJTUkawVDj6YWBFiRZenruAqW2urZF
 q8o1ymM8XNdv3HVWoqTv7OAKiM75waQC46GK
X-Google-Smtp-Source: AGRyM1tHNbZg3tUer/X0adYqmmmBkipXJYdJHb+DnbzGyZ3+LncrF6Fbyslgnj8PvfBaB3VMuzImyQ==
X-Received: by 2002:a17:90a:4503:b0:1ea:4718:829f with SMTP id
 u3-20020a17090a450300b001ea4718829fmr6431527pjg.103.1655243681464; 
 Tue, 14 Jun 2022 14:54:41 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:f355:be2d:74b7:3c7c])
 by smtp.gmail.com with ESMTPSA id
 y2-20020a17090264c200b0016641a646cbsm7668968pli.218.2022.06.14.14.54.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jun 2022 14:54:41 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 2/4] drm/panel-edp: Take advantage of wait_hpd_asserted()
 in struct drm_dp_aux
Date: Tue, 14 Jun 2022 14:54:16 -0700
Message-Id: <20220614145327.v4.2.Icea616f57331fbaa3d48c529f300c9a8ebd37fb5@changeid>
X-Mailer: git-send-email 2.36.1.476.g0c4daa206d-goog
In-Reply-To: <20220614215418.910948-1-dianders@chromium.org>
References: <20220614215418.910948-1-dianders@chromium.org>
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
Cc: Douglas Anderson <dianders@chromium.org>,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 Philip Chen <philipchen@chromium.org>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Robert Foss <robert.foss@linaro.org>, Stephen Boyd <swboyd@chromium.org>,
 Thierry Reding <thierry.reding@gmail.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Let's add support for being able to read the HPD pin even if it's
hooked directly to the controller. This will allow us to get more
accurate delays also lets us take away the waiting in the AUX transfer
functions of the eDP controller drivers.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---

(no changes since v2)

Changes in v2:
- Change is_hpd_asserted() to wait_hpd_asserted()

 drivers/gpu/drm/panel/panel-edp.c | 33 +++++++++++++++++++++----------
 1 file changed, 23 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index c96014464355..ce5821132151 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -417,6 +417,11 @@ static int panel_edp_get_hpd_gpio(struct device *dev, struct panel_edp *p)
 	return 0;
 }
 
+static bool panel_edp_can_read_hpd(struct panel_edp *p)
+{
+	return !p->no_hpd && (p->hpd_gpio || (p->aux && p->aux->wait_hpd_asserted));
+}
+
 static int panel_edp_prepare_once(struct panel_edp *p)
 {
 	struct device *dev = p->base.dev;
@@ -441,17 +446,21 @@ static int panel_edp_prepare_once(struct panel_edp *p)
 	if (delay)
 		msleep(delay);
 
-	if (p->hpd_gpio) {
+	if (panel_edp_can_read_hpd(p)) {
 		if (p->desc->delay.hpd_absent)
 			hpd_wait_us = p->desc->delay.hpd_absent * 1000UL;
 		else
 			hpd_wait_us = 2000000;
 
-		err = readx_poll_timeout(gpiod_get_value_cansleep, p->hpd_gpio,
-					 hpd_asserted, hpd_asserted,
-					 1000, hpd_wait_us);
-		if (hpd_asserted < 0)
-			err = hpd_asserted;
+		if (p->hpd_gpio) {
+			err = readx_poll_timeout(gpiod_get_value_cansleep,
+						 p->hpd_gpio, hpd_asserted,
+						 hpd_asserted, 1000, hpd_wait_us);
+			if (hpd_asserted < 0)
+				err = hpd_asserted;
+		} else {
+			err = p->aux->wait_hpd_asserted(p->aux, hpd_wait_us);
+		}
 
 		if (err) {
 			if (err != -ETIMEDOUT)
@@ -532,18 +541,22 @@ static int panel_edp_enable(struct drm_panel *panel)
 	/*
 	 * If there is a "prepare_to_enable" delay then that's supposed to be
 	 * the delay from HPD going high until we can turn the backlight on.
-	 * However, we can only count this if HPD is handled by the panel
-	 * driver, not if it goes to a dedicated pin on the controller.
+	 * However, we can only count this if HPD is readable by the panel
+	 * driver.
+	 *
 	 * If we aren't handling the HPD pin ourselves then the best we
 	 * can do is assume that HPD went high immediately before we were
-	 * called (and link training took zero time).
+	 * called (and link training took zero time). Note that "no-hpd"
+	 * actually counts as handling HPD ourselves since we're doing the
+	 * worst case delay (in prepare) ourselves.
 	 *
 	 * NOTE: if we ever end up in this "if" statement then we're
 	 * guaranteed that the panel_edp_wait() call below will do no delay.
 	 * It already handles that case, though, so we don't need any special
 	 * code for it.
 	 */
-	if (p->desc->delay.prepare_to_enable && !p->hpd_gpio && !p->no_hpd)
+	if (p->desc->delay.prepare_to_enable &&
+	    !panel_edp_can_read_hpd(p) && !p->no_hpd)
 		delay = max(delay, p->desc->delay.prepare_to_enable);
 
 	if (delay)
-- 
2.36.1.476.g0c4daa206d-goog

