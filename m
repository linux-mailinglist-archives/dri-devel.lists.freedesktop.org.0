Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70EC436979C
	for <lists+dri-devel@lfdr.de>; Fri, 23 Apr 2021 18:59:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 021126EC0D;
	Fri, 23 Apr 2021 16:59:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBB0E6EC07
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Apr 2021 16:59:44 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id
 m6-20020a17090a8586b02901507e1acf0fso1596903pjn.3
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Apr 2021 09:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xP5DIs1FkSE0BDkM2KIzYkHfQ0hdD3i5eW0X+nUNW+Y=;
 b=Nui0pXvr5mJQMbnlzuYsHB8sZuXeWkPY3IJOWfaIzTzDi/nK7GX+qeRokQsNKy2fYL
 j1y6mX12y+CQx8BOw57VkZYhCBu6XhRlhhbJYAlTfbuYaUlcixbob351UBwviRX9wNcv
 xKZ6ARbbjmm25KQR9dd0/UTv4z2clW3SG0Ocs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xP5DIs1FkSE0BDkM2KIzYkHfQ0hdD3i5eW0X+nUNW+Y=;
 b=RdlWD2jqeyTKNz4U7d3adEmwWY7II9i5h2unkAMk1LXTvTHWuMIbqJ3zGPmeUxqUEO
 CcQWTEr95fq7epVKuIVX4W8FLikFWYbYg0gFXwcFNnZ6H+ygT3O84twTtvVuRfwlcv8S
 G57rMbjFYp1egUxvTdYRq/na74vIcBqvb2sMCd/1o7ScQVFYjfAdWo7LTrCu/6tN2ZlQ
 0Qhis4N24zGmuQoi67ptYKHQElDoqluRWLBgVx4RWBkWWyght5bLv+BDJAaBRlu6ErIg
 DXOXdZjLJFJnZagwx6q+Bru8BL5bzTfFiZaLcW4FFEcWS8iOKrYDp9B5FZqwr8Vu29EF
 Dy+A==
X-Gm-Message-State: AOAM532Dj2x/nqukWZDWOQ4rO4rPrZz0WF4vxUy0Lu0Psp6KcN6hYZLb
 VylH6zDGCFOwjxb8JvqsBYHFaQ==
X-Google-Smtp-Source: ABdhPJxb8n3U3zZOiWMrXechOGFa6o/j6TcVWcBF+GRLB7Z3nK12l4CAlGd+Lw7zqpaW3ocWIOL1DQ==
X-Received: by 2002:a17:90a:a395:: with SMTP id
 x21mr5425317pjp.95.1619197184632; 
 Fri, 23 Apr 2021 09:59:44 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:6d86:663d:71f8:6a11])
 by smtp.gmail.com with ESMTPSA id v8sm5123607pfm.128.2021.04.23.09.59.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Apr 2021 09:59:44 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Sam Ravnborg <sam@ravnborg.org>, Wolfram Sang <wsa@kernel.org>
Subject: [PATCH v5 04/20] drm/bridge: ti-sn65dsi86: Use devm to do our
 runtime_disable
Date: Fri, 23 Apr 2021 09:58:50 -0700
Message-Id: <20210423095743.v5.4.I1e627eb5f316c0cf6595b120e6e262f5bf890300@changeid>
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

There's no devm_runtime_enable(), but it's easy to use
devm_add_action_or_reset() and means we don't need to worry about the
disable in our remove() routine or in error paths.

No functional changes intended by this change.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes in v5:
- Reordered to debugfs change to avoid transient issue

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 57574132e200..44d8395505f0 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -1213,6 +1213,11 @@ static void ti_sn_bridge_parse_lanes(struct ti_sn65dsi86 *pdata,
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
@@ -1272,12 +1277,13 @@ static int ti_sn65dsi86_probe(struct i2c_client *client,
 		return ret;
 
 	pm_runtime_enable(pdata->dev);
+	ret = devm_add_action_or_reset(pdata->dev, ti_sn65dsi86_runtime_disable, pdata->dev);
+	if (ret)
+		return ret;
 
 	ret = ti_sn_setup_gpio_controller(pdata);
-	if (ret) {
-		pm_runtime_disable(pdata->dev);
+	if (ret)
 		return ret;
-	}
 
 	i2c_set_clientdata(client, pdata);
 
@@ -1314,8 +1320,6 @@ static int ti_sn65dsi86_remove(struct i2c_client *client)
 
 	drm_bridge_remove(&pdata->bridge);
 
-	pm_runtime_disable(pdata->dev);
-
 	of_node_put(pdata->host_node);
 
 	return 0;
-- 
2.31.1.498.g6c1eba8ee3d-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
