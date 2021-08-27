Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E2263F95FF
	for <lists+dri-devel@lfdr.de>; Fri, 27 Aug 2021 10:24:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4791E6E084;
	Fri, 27 Aug 2021 08:24:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62FA66E06B
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Aug 2021 08:24:21 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id q3so3477612plx.4
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Aug 2021 01:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SUMawJHmaVN55KeOYmXXMpF4IBtsM0ibJxP9InePT3U=;
 b=Fxz3N2mtWJOZp20H0H62tCm4G/B9tJRiU8nyFNZfIi03dLktL6JeLV2ddV8aeHW1XL
 rcTUerdmA+4w7InZ2c4LDfKKVXup97tUe1oyRvTdSpezfuA9IL6AALY0kkJfYHj4GkHC
 EK2gCHg/OgOTlOL/BxSwrORqv/CDstWDgqQi1ritbdlseNn/OXk0l8eZMjfEVnE3rnQM
 BldzUtyfqgYIwZeWJsTFGa+pKaBf4fJpGQ87mU+pNctj6pcBJUmPKQQ6/wQz990KGYYV
 QM+T3NnjCT3sOzbHkJQ6zTRKbxakaxgSYY0KnxKQDBtW1WOvHULBFzsGh9cC95CY0ef1
 oTCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SUMawJHmaVN55KeOYmXXMpF4IBtsM0ibJxP9InePT3U=;
 b=lJHgyrJNlpoDLVxpEJSZjiksqys+y8JjeB2QYqDa2T1FvXlLnpStplggUkJMIZXc6B
 Jfns2ncAIEr9R9hYGcdVjDAKF6oaroWM/UsFcWD0RYfJKX87uG1ZGmp51eQOIWxHP/X1
 ZjPWVrZRBAl17HVHKEcuRNfPUwUct5szzls7YP9IeAORdQ+ZYoCAuZpKreoCBlyi73BW
 wWw/36Jdy2s0gxoElsQYRRDfm2dmp4ks2EzIeO66TFDapV/m7wIN8JhXi5LiS5SroDS/
 N020V71tzv7I+6Tq4Wuy69I3coxoynikcSkFaCnZhwY71hAYiXf2NnFwUF5Jq2zbfS7K
 NlhA==
X-Gm-Message-State: AOAM531l4bvE6SC6enxg2MLNG2X4YLbLAFLCSda/e6zs9UzNASQCTLw5
 ijFqhimH7s0qP28puOoYeyXMhQ==
X-Google-Smtp-Source: ABdhPJyzCDsAtLBRyrr7IK7R5ii+ILlKFQQetonZ4oNTJIEEdsAFGzET5At0VHFtXpVBYWGvRR/itg==
X-Received: by 2002:a17:90a:7642:: with SMTP id
 s2mr21771104pjl.128.1630052660932; 
 Fri, 27 Aug 2021 01:24:20 -0700 (PDT)
Received: from yc.huaqin.com ([101.78.151.213])
 by smtp.gmail.com with ESMTPSA id m18sm5391371pjq.32.2021.08.27.01.24.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Aug 2021 01:24:20 -0700 (PDT)
From: yangcong <yangcong5@huaqin.corp-partner.google.com>
To: thierry.reding@gmail.com, sam@ravnborg.org, airlied@linux.ie,
 daniel@ffwll.ch, dianders@google.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 yangcong <yangcong5@huaqin.corp-partner.google.com>
Subject: [v3 1/4] drm/panel: boe-tv101wum-nl6: Support enabling a 3.3V rail
Date: Fri, 27 Aug 2021 16:24:04 +0800
Message-Id: <20210827082407.101053-2-yangcong5@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210827082407.101053-1-yangcong5@huaqin.corp-partner.google.com>
References: <20210827082407.101053-1-yangcong5@huaqin.corp-partner.google.com>
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

