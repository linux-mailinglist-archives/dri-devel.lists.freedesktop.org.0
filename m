Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BA8236979F
	for <lists+dri-devel@lfdr.de>; Fri, 23 Apr 2021 19:00:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAD366EC13;
	Fri, 23 Apr 2021 16:59:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A890F6EC0E
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Apr 2021 16:59:51 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id
 f2-20020a17090a4a82b02900c67bf8dc69so1531366pjh.1
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Apr 2021 09:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iBUj5kQ7X9fmMOQ4CZ8JChILd2WBNcvTtcV/hSGMVvg=;
 b=FdxPxbY7ijX71QBS18OIzi0n9sM2odFgKMp717noKgZ2ye6GMt0SW1OvPd/Rehb+6h
 +GXiaiJfaAVKyM6/PiiioDTEQZ4BDLR2qq0n2pk5tk2gj07eirFILT0zYteJxyt8L1kS
 wiaJkmwfDd19bvqFN19QAtqryqglfaM4jRHOE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iBUj5kQ7X9fmMOQ4CZ8JChILd2WBNcvTtcV/hSGMVvg=;
 b=nTCCRfmfmLOKGvDPGX6pgM4p5ICGM7VQ4jL5+pX4uxprfmDSb5QCpIHuoMgXuSSXtW
 anWEZsTDk/1djWJ859ZRpJ+niIfnFJurSMHRoOL1cc+6zGImbqfJDAYDTM4d3WuAF/yy
 2rtymXgqBZFF0nziLaFlRWKc4hFBspOSz4Bda8IiOZwEByaOWtkm4dhUkfqybdhwF0ho
 QwZGaE2Dh/fwzDTosQaXvRXvaWtz4tI9u0GbpmaGGKRbkdV/U6onENb+XDEkdk+ZTFxR
 UD8Q9SJ7/aasKd+TeYacN7DCumDSMI1Y+iaLXgHkBKuI6iiEBUBbdh2LOVgttZSaNFs+
 qOyw==
X-Gm-Message-State: AOAM5320iAN/Dy4LG2Lb3+o0MyBpmtLAolbUaaVRT323qRUXbzo83WSa
 P/JcnajPUyGefEtt9LB7xJOHVw==
X-Google-Smtp-Source: ABdhPJxyF0nN/4vsiL7lk43a0I/qpwpmwLXPqQ05NyVO9W3gD4zw+0dRDftgTSkOcNerASpW3ts8Aw==
X-Received: by 2002:a17:90b:2306:: with SMTP id
 mt6mr5416893pjb.119.1619197191335; 
 Fri, 23 Apr 2021 09:59:51 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:6d86:663d:71f8:6a11])
 by smtp.gmail.com with ESMTPSA id v8sm5123607pfm.128.2021.04.23.09.59.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Apr 2021 09:59:50 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Sam Ravnborg <sam@ravnborg.org>, Wolfram Sang <wsa@kernel.org>
Subject: [PATCH v5 10/20] drm/panel: panel-simple: Get rid of hacky HPD
 chicken-and-egg code
Date: Fri, 23 Apr 2021 09:58:56 -0700
Message-Id: <20210423095743.v5.10.I40eeedc23459d1e3fc96fa6cdad775d88c6e706c@changeid>
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
Cc: robdclark@chromium.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Douglas Anderson <dianders@chromium.org>, Steev Klimaszewski <steev@kali.org>,
 Stephen Boyd <swboyd@chromium.org>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-i2c@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When I added support for the hpd-gpio to simple-panel in commit
48834e6084f1 ("drm/panel-simple: Support hpd-gpios for delaying
prepare()"), I added a special case to handle a circular dependency I
was running into on the ti-sn65dsi86 bridge chip. On my board the
hpd-gpio is actually provided by the bridge chip. That was causing
some circular dependency problems that I had to work around by getting
the hpd-gpio late.

I've now reorganized the ti-sn65dsi86 bridge chip driver to be a
collection of sub-drivers. Now the GPIO part can probe separately and
that breaks the chain. Let's get rid of the old code to clean things
up.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

(no changes since v1)

 drivers/gpu/drm/panel/panel-simple.c | 24 +++++-------------------
 1 file changed, 5 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 9746eda6f675..bd208abcbf07 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -366,8 +366,7 @@ static int panel_simple_unprepare(struct drm_panel *panel)
 	return 0;
 }
 
-static int panel_simple_get_hpd_gpio(struct device *dev,
-				     struct panel_simple *p, bool from_probe)
+static int panel_simple_get_hpd_gpio(struct device *dev, struct panel_simple *p)
 {
 	int err;
 
@@ -375,17 +374,10 @@ static int panel_simple_get_hpd_gpio(struct device *dev,
 	if (IS_ERR(p->hpd_gpio)) {
 		err = PTR_ERR(p->hpd_gpio);
 
-		/*
-		 * If we're called from probe we won't consider '-EPROBE_DEFER'
-		 * to be an error--we'll leave the error code in "hpd_gpio".
-		 * When we try to use it we'll try again.  This allows for
-		 * circular dependencies where the component providing the
-		 * hpd gpio needs the panel to init before probing.
-		 */
-		if (err != -EPROBE_DEFER || !from_probe) {
+		if (err != -EPROBE_DEFER)
 			dev_err(dev, "failed to get 'hpd' GPIO: %d\n", err);
-			return err;
-		}
+
+		return err;
 	}
 
 	return 0;
@@ -416,12 +408,6 @@ static int panel_simple_prepare_once(struct panel_simple *p)
 		msleep(delay);
 
 	if (p->hpd_gpio) {
-		if (IS_ERR(p->hpd_gpio)) {
-			err = panel_simple_get_hpd_gpio(dev, p, false);
-			if (err)
-				goto error;
-		}
-
 		if (p->desc->delay.hpd_absent_delay)
 			hpd_wait_us = p->desc->delay.hpd_absent_delay * 1000UL;
 		else
@@ -682,7 +668,7 @@ static int panel_simple_probe(struct device *dev, const struct panel_desc *desc)
 
 	panel->no_hpd = of_property_read_bool(dev->of_node, "no-hpd");
 	if (!panel->no_hpd) {
-		err = panel_simple_get_hpd_gpio(dev, panel, true);
+		err = panel_simple_get_hpd_gpio(dev, panel);
 		if (err)
 			return err;
 	}
-- 
2.31.1.498.g6c1eba8ee3d-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
