Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99A503F2774
	for <lists+dri-devel@lfdr.de>; Fri, 20 Aug 2021 09:17:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E90186EA1F;
	Fri, 20 Aug 2021 07:17:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CF4C6E910
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Aug 2021 08:29:02 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id a21so4801264pfh.5
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Aug 2021 01:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SUMawJHmaVN55KeOYmXXMpF4IBtsM0ibJxP9InePT3U=;
 b=QWFOhtwMzuF7438Vz1BNsWXlxPzmpjz1r6/3JOjc/zv9NhlUfdPglonytyatnNG7IL
 vMC6DlMvJA7qkWpy9Yi7P0NLXji5n/K3bxJKUSj98jkbFB1d0DXbSKCyevq4QoNqspjL
 V3m3hFinoxXIfL6gzZbzjhWkUcYksSUolSGGPH8QNQDTk0pvDbFYv+EphVN28SEHBSVu
 PM8Lu8BUxhFNcfa6GZJRQjoxTcPLos49nhNoDdgqycvuMrrHk6IkpCMVK0tAkQlFaMxf
 rLA5VqYxLrxmQeOq1NNkIqEuUgFpki1jJ4gMNk+pSA8x/Y9pSNwOqSL8B1bpwuVcJMIU
 neRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SUMawJHmaVN55KeOYmXXMpF4IBtsM0ibJxP9InePT3U=;
 b=Dra8O1LzZOEpwaDDGVRgU+lBUACvpeovyriiR9HG6i0kgEZ+HH74rGGUokQXFfVfTQ
 fxqb39OoNvZBT4jKAUu+5xXimY4fVPxH/VrE3HqbhG8obhSvRqBcR/tb2Mox5zIrqlDI
 u4riZff1CYU1utt3YJ7qFq7Qf7dMrU2y8D6md9ae74KSygP8epT4ABC/wgcQMg/O7VsO
 2FLH1n4jgFNd4bJPFkP9ndTnTe0fcWXU5d6p1MyGy8Y/5QxjqafwADjssTYrlKhoB9Sm
 YC4DZsRorz5BdHdU//zP3vS5TIYXYUG/VQVNpjkl/u/Lh0p/OnMszniF2ofZDTH9cO2O
 vS5g==
X-Gm-Message-State: AOAM532ayPI0+T9/9hXh37gdh6dpXBrpkPW48aAyD/MtlUAIsk7pGHfz
 ETXspXeVjUflKXavVNks2AESs3r4mOavX9aA
X-Google-Smtp-Source: ABdhPJwL3No6X6V3kG0udGVqfpgqmycMdBsXxBaj4a+K926Dhs2m61+g8QsSTJBhoYXtf4696zLHnQ==
X-Received: by 2002:a63:4e5a:: with SMTP id o26mr13070494pgl.19.1629361741868; 
 Thu, 19 Aug 2021 01:29:01 -0700 (PDT)
Received: from yc.huaqin.com ([101.78.151.214])
 by smtp.gmail.com with ESMTPSA id i11sm2347220pfo.29.2021.08.19.01.28.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 01:29:01 -0700 (PDT)
From: yangcong <yangcong5@huaqin.corp-partner.google.com>
To: thierry.reding@gmail.com, sam@ravnborg.org, airlied@linux.ie,
 daniel@ffwll.ch, robh+dt@kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dianders@google.com
Cc: yangcong <yangcong5@huaqin.corp-partner.google.com>
Subject: [v1 1/2] drm/panel: boe-tv101wum-nl6: Support enabling a 3.3V rail
Date: Thu, 19 Aug 2021 16:28:42 +0800
Message-Id: <20210819082843.716986-2-yangcong5@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210819082843.716986-1-yangcong5@huaqin.corp-partner.google.com>
References: <20210819082843.716986-1-yangcong5@huaqin.corp-partner.google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 20 Aug 2021 07:16:30 +0000
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

