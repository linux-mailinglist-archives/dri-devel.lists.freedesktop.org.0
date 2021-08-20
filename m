Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 415043F26D7
	for <lists+dri-devel@lfdr.de>; Fri, 20 Aug 2021 08:33:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96C156EA03;
	Fri, 20 Aug 2021 06:33:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0A046EA02
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Aug 2021 06:33:49 +0000 (UTC)
Received: by mail-pg1-x535.google.com with SMTP id o2so8186689pgr.9
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Aug 2021 23:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SUMawJHmaVN55KeOYmXXMpF4IBtsM0ibJxP9InePT3U=;
 b=1WBfuWrREdM+7g0ve2l8J0IuXQeTVkexBXa+xLhtvT+qAzaxS29O0QUHT/We0rw0cY
 5rqQ3zIi0kN0hhCEref7SyxTvgAKnQcmzXSWpOa2Wf1FvIUYLlHKqT0snHeoJK+pvU6/
 j2M33NOl5108cFocFXpBH90NAl95yCe/wdsdtf9A9tZo2vBT+jQO5qfuVSMcRCWjcnxl
 jnFUvQfnApsQYpaG0uAri+QvQPerWbNcWEvRPqezDNm+lA44MLvKPVmLPY93fIyU+OOo
 d9gk7rB6NldYD+UscJWK3YxL0ycOFVNKigCuMBqrAmtCDM0C34KLWl6mQ2LiOHbWqOYH
 5q1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SUMawJHmaVN55KeOYmXXMpF4IBtsM0ibJxP9InePT3U=;
 b=r3f3gNcTtia4Z6NH8sobEumyJ5/koe8GdFhAo3HT77et0Lu1NsOBPGbwMRd6Oo6GGG
 ILtR9V5G+K+4R2u7zI7QKDuyBIWjv7hATst8zc0e/KDuB/+zJvnCHZfD/Ms287R99qBc
 S70ZRI1m1YkiELtVXYL1mXqYz/j00FIege6TSHpmm/IFMJau79zlRtv28DOyLCeqbYJ3
 lAqClW56qDgDaqGg5po6P+tgFNavrm3aRzyexkXegY/HLaqqQJurKfawgSDmb8P7XAOp
 vwM3dnQs6PekNCSfb1AauAremo0qANNWeur3qQrL5UNbIMsCWrFKX2BaFCezbev1bBqr
 CP0g==
X-Gm-Message-State: AOAM532PJnv8eG9phoOj9uKK0/cnEda6HmCN536deAVjQmDHZxl4P21u
 a8OEfFd85AHxs2UWfHhk+1T8DA==
X-Google-Smtp-Source: ABdhPJyeplS1JQrqCd+BTgzDBT/T3Dw66q6PAfn9z2Sfo3+zoCwlUQDIFzlO/a3WJubkCwjZv+HV6Q==
X-Received: by 2002:a63:556:: with SMTP id 83mr17053535pgf.1.1629441229622;
 Thu, 19 Aug 2021 23:33:49 -0700 (PDT)
Received: from yc.huaqin.com ([101.78.151.213])
 by smtp.gmail.com with ESMTPSA id a10sm5612160pfn.48.2021.08.19.23.33.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 23:33:49 -0700 (PDT)
From: yangcong <yangcong5@huaqin.corp-partner.google.com>
To: thierry.reding@gmail.com, sam@ravnborg.org, airlied@linux.ie,
 daniel@ffwll.ch, dianders@google.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 yangcong <yangcong5@huaqin.corp-partner.google.com>
Subject: [v2 1/2] drm/panel: boe-tv101wum-nl6: Support enabling a 3.3V rail
Date: Fri, 20 Aug 2021 14:33:36 +0800
Message-Id: <20210820063337.44580-2-yangcong5@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210820063337.44580-1-yangcong5@huaqin.corp-partner.google.com>
References: <20210819124844.12424-1-yangcong5@huaqin.corp-partner.google.com>
 <20210820063337.44580-1-yangcong5@huaqin.corp-partner.google.com>
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

