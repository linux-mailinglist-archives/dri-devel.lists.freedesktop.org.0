Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A2D1F36979D
	for <lists+dri-devel@lfdr.de>; Fri, 23 Apr 2021 18:59:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BADDB6EC0E;
	Fri, 23 Apr 2021 16:59:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A92B86E150
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Apr 2021 16:59:41 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id u11so19771163pjr.0
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Apr 2021 09:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=v3L6h1BjunVrmn6xM+A7e9Coz57kAQq9sEX0cijBf6I=;
 b=P2YIm80Y/ICCG+y+HzolfGLNXCmFgI3A3HuBx6AvFj28507tePNztOilZzFEIvP4EJ
 AKDvdgT44aEEbjBXK8iZkmiLI1hjnxIYqs7lKUgAOlXm0VgiiteLz94/xpSsRj0OLa+2
 C7ojRlXfaNQK3HnacnO27Njjj+GpLy/0HlSQ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=v3L6h1BjunVrmn6xM+A7e9Coz57kAQq9sEX0cijBf6I=;
 b=lZSHqbE75Sha4N4pRnLMUV0WBORmscMsiZb8I66BLttVO/p0TCbHBNLpqvxDVa2INb
 zfFgahnUOFpg6ITy5bNYomRziPy34JnBt5WDpLLLWgzlb5B00fdcQKwp1vf19q06p3uO
 IvmM9JxxL5F2NjDazKKTm+YmqDhxL/RaX7NH2RS5DRZ5LOb1aKVrW3ZZipHsRjn2La3e
 ixyNl4GT0Y2JTZeEcpBoIVH661jorqfto3fhVAZHqCmUA7ftfGcgOO8eHdLu0FyrCTMw
 COcZbn9roZc2t4glpCHSGoB2uJRNrYonE/fPXRsg4ycmRORLNtPwQ+nQpmm/9EuuHNWm
 +eqQ==
X-Gm-Message-State: AOAM532pehVeT4+n9udJIqomzwERNtn6yN68g6+qDruY4OfpadrX6fEd
 +AcOXjNPMt6JhziuKaGngidqOQ==
X-Google-Smtp-Source: ABdhPJwUVUVBiZpl2STs9t26EmL1yjzkkyP/mrfd3qlMXQIPV2Y6D3kRrmJUXon9H1XxH3F5d1fPZg==
X-Received: by 2002:a17:90a:9f02:: with SMTP id
 n2mr5439030pjp.151.1619197181372; 
 Fri, 23 Apr 2021 09:59:41 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:6d86:663d:71f8:6a11])
 by smtp.gmail.com with ESMTPSA id v8sm5123607pfm.128.2021.04.23.09.59.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Apr 2021 09:59:41 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Sam Ravnborg <sam@ravnborg.org>, Wolfram Sang <wsa@kernel.org>
Subject: [PATCH v5 01/20] drm/panel: panel-simple: Add missing
 pm_runtime_disable() calls
Date: Fri, 23 Apr 2021 09:58:47 -0700
Message-Id: <20210423095743.v5.1.I9e6af2529d6c61e5daf86a15a1211121c5223b9a@changeid>
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
 Bjorn Andersson <bjorn.andersson@linaro.org>, linux-kernel@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In commit 3235b0f20a0a ("drm/panel: panel-simple: Use runtime pm to
avoid excessive unprepare / prepare") we started using pm_runtime, but
my patch neglected to add the proper pm_runtime_disable(). Doh! Add
them now.

Fixes: 3235b0f20a0a ("drm/panel: panel-simple: Use runtime pm to avoid excessive unprepare / prepare")
Reported-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v5:
- Missing pm_runtime_disable() patch new for v5.

 drivers/gpu/drm/panel/panel-simple.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 6b22872b3281..9746eda6f675 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -797,12 +797,14 @@ static int panel_simple_probe(struct device *dev, const struct panel_desc *desc)
 
 	err = drm_panel_of_backlight(&panel->base);
 	if (err)
-		goto free_ddc;
+		goto disable_pm_runtime;
 
 	drm_panel_add(&panel->base);
 
 	return 0;
 
+disable_pm_runtime:
+	pm_runtime_disable(dev);
 free_ddc:
 	if (panel->ddc)
 		put_device(&panel->ddc->dev);
@@ -818,6 +820,7 @@ static int panel_simple_remove(struct device *dev)
 	drm_panel_disable(&panel->base);
 	drm_panel_unprepare(&panel->base);
 
+	pm_runtime_disable(dev);
 	if (panel->ddc)
 		put_device(&panel->ddc->dev);
 
-- 
2.31.1.498.g6c1eba8ee3d-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
