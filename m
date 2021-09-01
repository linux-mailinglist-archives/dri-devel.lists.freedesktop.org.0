Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EEED3FE3BE
	for <lists+dri-devel@lfdr.de>; Wed,  1 Sep 2021 22:20:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E220C6E2ED;
	Wed,  1 Sep 2021 20:20:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 316D26E2E1
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Sep 2021 20:20:51 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id
 mw10-20020a17090b4d0a00b0017b59213831so582435pjb.0
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Sep 2021 13:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dXkXwd4vEP4bwY9rQawnEqC6kwS+NIIDi4QUwZ6cGtQ=;
 b=EjRpUS2pwumz9y0I78cbBHrql1evvQsWCNm51l0dM73D/8WNx855hwhFYSzlErwRHk
 YcS15dy5jZkeq0WUu21+obBJn5yMCRcK32TO3GSQKrmQRdNaYUdDMSuuyR8WI30GWU4g
 JqjwHgBivWnaa1uyreX+etFVlEzjH/1onRP3Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dXkXwd4vEP4bwY9rQawnEqC6kwS+NIIDi4QUwZ6cGtQ=;
 b=kP+SF07JLmcW85W+UW9S2sc0H8YFzA+TF2pOFfDOaT3r1s7Hb2vI0aRJyqoTa+frSK
 krLTQCR6RSihyBjh9Srvi2dJkyIAu8eS+7kyoS4gRteXTuKk00eJvHkif+ZYsPcr/Tyd
 dmGofSteThJgrRfWKyLEn3Thi1fiSisIOgju18QNgrSwzhQZ09Yq0fIIiDxTSXMlTql0
 5Wa0Yty/2gr+6TsVAKgNN7LNptOesGIaemrRTvCoS+U+aAGSeRzVoOapMhtRFgFobGpr
 p0o2mXyuH+lXbiq1hWWyCuUpCUCeENc9y8C7yYE3Ei/WyFzQp5zfO71YAYpGoMQiGzde
 T7cQ==
X-Gm-Message-State: AOAM5304nlXWoqJcHcPL4AcXWLlYKPhm/HcF8YfcmozQv4TE5n1Qo0La
 zWKplD1aphW0OaVrR9iyzGeR4A==
X-Google-Smtp-Source: ABdhPJwL4AOuiR68h4fnDH1vn8eNeonNevqm7uEBhMAzmdJMIoUAPeb/6W9tokMMB5TvMjAgjvxvgQ==
X-Received: by 2002:a17:902:c406:b0:138:c28f:a779 with SMTP id
 k6-20020a170902c40600b00138c28fa779mr833921plk.1.1630527650785; 
 Wed, 01 Sep 2021 13:20:50 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:958b:b561:a735:e774])
 by smtp.gmail.com with ESMTPSA id x15sm321178pfq.31.2021.09.01.13.20.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Sep 2021 13:20:50 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Thierry Reding <thierry.reding@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Sam Ravnborg <sam@ravnborg.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Linus W <linus.walleij@linaro.org>, Daniel Vetter <daniel@ffwll.ch>,
 devicetree@vger.kernel.org, Steev Klimaszewski <steev@kali.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 13/16] drm/panel-simple-edp: hpd_reliable shouldn't be
 subtraced from hpd_absent
Date: Wed,  1 Sep 2021 13:19:31 -0700
Message-Id: <20210901131531.v3.13.I2522235fca3aa6790ede0bf22a93d79a1f694e6b@changeid>
X-Mailer: git-send-email 2.33.0.259.gc128427fd7-goog
In-Reply-To: <20210901201934.1084250-1-dianders@chromium.org>
References: <20210901201934.1084250-1-dianders@chromium.org>
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

Now that the delays are named / described with eDP-centric names, it
becomes clear that we should really specify the "hpd_reliable" and
"hpd_absent" separately without taking the other into account. Let's
fix it.

This should be a no-op change and just adjust how we specify
things. The actual delays should be the same before and after for the
one panel that currently species both "hpd_reliable" and "hpd_absent".

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

(no changes since v1)

 drivers/gpu/drm/panel/panel-simple-edp.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-simple-edp.c b/drivers/gpu/drm/panel/panel-simple-edp.c
index ede5e3e4920b..762589ef66c3 100644
--- a/drivers/gpu/drm/panel/panel-simple-edp.c
+++ b/drivers/gpu/drm/panel/panel-simple-edp.c
@@ -423,7 +423,7 @@ static int panel_edp_prepare_once(struct panel_edp *p)
 
 	delay = p->desc->delay.hpd_reliable;
 	if (p->no_hpd)
-		delay += p->desc->delay.hpd_absent;
+		delay = max(delay, p->desc->delay.hpd_absent);
 	if (delay)
 		msleep(delay);
 
@@ -1039,15 +1039,13 @@ static const struct panel_desc boe_nv133fhm_n61 = {
 		 * spike on the HPD line.  It was explained that this spike
 		 * was until the TCON data download was complete.  On
 		 * one system this was measured at 8 ms.  We'll put 15 ms
-		 * in the prepare delay just to be safe and take it away
-		 * from the hpd_absent (which would otherwise be 200 ms)
-		 * to handle this.  That means:
+		 * in the prepare delay just to be safe.  That means:
 		 * - If HPD isn't hooked up you still have 200 ms delay.
 		 * - If HPD is hooked up we won't try to look at it for the
 		 *   first 15 ms.
 		 */
 		.hpd_reliable = 15,
-		.hpd_absent = 185,
+		.hpd_absent = 200,
 
 		.unprepare = 500,
 	},
-- 
2.33.0.259.gc128427fd7-goog

