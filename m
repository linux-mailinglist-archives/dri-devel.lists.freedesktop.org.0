Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADB154089A9
	for <lists+dri-devel@lfdr.de>; Mon, 13 Sep 2021 12:59:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3339E6E15F;
	Mon, 13 Sep 2021 10:59:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E5A66E160
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Sep 2021 10:59:33 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id 18so8417823pfh.9
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Sep 2021 03:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zVxaxVLkHd1OjVLGEtEzeZhPd4oQXGRtOBcdwaIOQoo=;
 b=nkGrONgO+9jvojA+DdRyyt8wT6S8EQkToGs0Zh0JbY07F0VY3sc3I6BTxg4R3qW2nb
 cawzAA4SouMkriXE8zj7D80n0rUrGkrJZHWYx3gH3J1X7ZMO3+yHFSW5TKgsRvzJz72J
 6aI5W1FSt418C3cH1nIpy7zXiue6cjEZkXzzWYxI6vq7fFGYSfEEjN1rtZnteUelWKf4
 yIuG+AsKcD4hQma2xgdp83vTLBc65z8RrV4CZS/HCm3QyODEvtFF9mQLmu5tZiE4V85z
 o9gyKTK9RkFRg3skn2GpBT4KzxajszfT8dlgfZz9jDhMI+2pW/IpYE43RQYzbMivkIF7
 JxoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zVxaxVLkHd1OjVLGEtEzeZhPd4oQXGRtOBcdwaIOQoo=;
 b=stOJ/gbH6bd363ckhqdtY3gI0RQBA+JLP0t1uE6GH50sAHsbKYwgogJgwmnmiBp0Gk
 yVFr+YHRYeHBZD9yYQ1qnysGPs66OyrTTw2wV6L3qXTMsnOTvb05iQAq3VdGARARNTVY
 n9jKBjUIPygzuv6SlaXcluBqfYkRPHo0s2W9h3UyCiXhdjEzfW48Gpn52le9M0IrCG7E
 OB2BB9Wk1WSolGAXEkEZnfY6Rt1W2+PitL5cTkPo+i87P5BqciAokSfeDqdyAMCyxzdq
 STrY9JyIjVgwVgaWNPNYIe4v0ARisRRCTAM0Xdl/9X4O8aiMvZKlOYx3MRdccT0jlRKn
 LfkA==
X-Gm-Message-State: AOAM531ia+uCZvrTy7iZBjNUcRq40BD3iwfaAG+qtHPSd83PVt0ukECu
 fBY+PDp9h09ym6XEWkAWb+1nZg==
X-Google-Smtp-Source: ABdhPJxe+BoPBZeknKbQgemdH/QK/Ir5E6BakKMtH74ZWPv/P3x2S4vAn3ypNLpbeJdW7s3qybhUhg==
X-Received: by 2002:a05:6a00:1a4b:b0:43d:3d45:37cb with SMTP id
 h11-20020a056a001a4b00b0043d3d4537cbmr5519147pfv.77.1631530772970; 
 Mon, 13 Sep 2021 03:59:32 -0700 (PDT)
Received: from yc.huaqin.com ([101.78.151.214])
 by smtp.gmail.com with ESMTPSA id l22sm8279641pgo.45.2021.09.13.03.59.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 03:59:32 -0700 (PDT)
From: yangcong <yangcong5@huaqin.corp-partner.google.com>
To: thierry.reding@gmail.com, sam@ravnborg.org, airlied@linux.ie,
 daniel@ffwll.ch, dianders@google.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 yangcong <yangcong5@huaqin.corp-partner.google.com>,
 Douglas Anderson <dianders@chromium.org>
Subject: [v5 1/5] drm/panel: boe-tv101wum-nl6: Support enabling a 3.3V rail
Date: Mon, 13 Sep 2021 18:59:16 +0800
Message-Id: <20210913105920.3719525-2-yangcong5@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210913105920.3719525-1-yangcong5@huaqin.corp-partner.google.com>
References: <20210913105920.3719525-1-yangcong5@huaqin.corp-partner.google.com>
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

The auo,b101uan08.3 panel (already supported by this driver) has
a 3.3V rail that needs to be turned on. For previous users of
this panel this voltage was directly output by pmic. On a new
user (the not-yet-upstream sc7180-trogdor-mrbland board) we need
to turn the 3.3V rail on. Add support in the driver for this.

Signed-off-by: yangcong <yangcong5@huaqin.corp-partner.google.com>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
---
 drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
index db9d0b86d542..9a644433629e 100644
--- a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
+++ b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
@@ -45,6 +45,7 @@ struct boe_panel {
 	const struct panel_desc *desc;
 
 	enum drm_panel_orientation orientation;
+	struct regulator *pp3300;
 	struct regulator *pp1800;
 	struct regulator *avee;
 	struct regulator *avdd;
@@ -511,6 +512,7 @@ static int boe_panel_unprepare(struct drm_panel *panel)
 		gpiod_set_value(boe->enable_gpio, 0);
 		usleep_range(5000, 7000);
 		regulator_disable(boe->pp1800);
+		regulator_disable(boe->pp3300);
 	} else {
 		gpiod_set_value(boe->enable_gpio, 0);
 		usleep_range(500, 1000);
@@ -518,6 +520,7 @@ static int boe_panel_unprepare(struct drm_panel *panel)
 		regulator_disable(boe->avdd);
 		usleep_range(5000, 7000);
 		regulator_disable(boe->pp1800);
+		regulator_disable(boe->pp3300);
 	}
 
 	boe->prepared = false;
@@ -536,6 +539,10 @@ static int boe_panel_prepare(struct drm_panel *panel)
 	gpiod_set_value(boe->enable_gpio, 0);
 	usleep_range(1000, 1500);
 
+	ret = regulator_enable(boe->pp3300);
+	if (ret < 0)
+		return ret;
+
 	ret = regulator_enable(boe->pp1800);
 	if (ret < 0)
 		return ret;
@@ -767,6 +774,10 @@ static int boe_panel_add(struct boe_panel *boe)
 	if (IS_ERR(boe->avee))
 		return PTR_ERR(boe->avee);
 
+	boe->pp3300 = devm_regulator_get(dev, "pp3300");
+	if (IS_ERR(boe->pp3300))
+		return PTR_ERR(boe->pp3300);
+
 	boe->pp1800 = devm_regulator_get(dev, "pp1800");
 	if (IS_ERR(boe->pp1800))
 		return PTR_ERR(boe->pp1800);
-- 
2.25.1

