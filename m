Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D103FAFD4
	for <lists+dri-devel@lfdr.de>; Mon, 30 Aug 2021 04:39:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4999289D4F;
	Mon, 30 Aug 2021 02:39:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5DC289D4F
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Aug 2021 02:39:02 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id
 z24-20020a17090acb1800b0018e87a24300so8988138pjt.0
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Aug 2021 19:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zVxaxVLkHd1OjVLGEtEzeZhPd4oQXGRtOBcdwaIOQoo=;
 b=imvcqNYmCLGVlCEjlbxiQ+Wkr4mmvwsu4AOWQiYZzRlzUIwaCaZweBEvgJDCSSBWqO
 e2qu/yzRIGsbJy7UC3eaVSvx74Xh34sMFJsveb1wav80h/u5K5dNGOIJnVHjIJfqvkgc
 xFBLVl4c8uuodWKhlUYi4zLsVIE6K405ceEaz0rBjt7/khq1Axz0I6xbI2nWzxP9IHUL
 vzF8a6/j39SpA+v5sxzrDvYdMrCMV0azPKkc9J+IBiuJVHkMF4DzCpRPcMEUYMWgAB4p
 TlMG8C38J4Fc/3xMe73wPGH2DNtM0+mfvH+Hy00gOQjusHsh/3PRLscFl/1YRECyX7Y4
 DkWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zVxaxVLkHd1OjVLGEtEzeZhPd4oQXGRtOBcdwaIOQoo=;
 b=Y0+o5PuLCYG+WkW8ofaWS83U0mRA+ds2T0ZMLkOtxp8ZFpGAXvlEL2NWxuVnL9i8s6
 x7pTJi2dDW/uQf/E1eJUEiEgiQ2cNq5S2t6zN3AQ12TVfv828dzOF4i85DQ2r0IqHKC5
 ulk32J3Z+BwmQ8f8XjezaMdmPWJqoy9X09jdPXhHYpZVVgD57/qH/CKTFiLvub60AL+v
 /8HY6KlijZmKgmFlDqsy324F+T3AVUvBWKP+vGaz3gGAgJxFwSSWehTDW/6JU7/06HPt
 gzcmYaQ1i0j+fqbkCeSXi0H4dQd+R6kD9k2ksC7m3LAin3o1kFMDAhBHsy9hdzzHspM3
 SVaA==
X-Gm-Message-State: AOAM531T284/HgIUjEwQW4V+Tw2VzXT6y2MTZGjU5KbixFyZz0yvIyjJ
 vaV9tZhv3M44D+tzqb+ZFwA3Zg==
X-Google-Smtp-Source: ABdhPJw3Nqwng0ECCd2lIzkvP/08EVDGHxdPye2GDNmSRH5KIBwkBeuFFGsX3XVVY6fq/y8iwnx5Fw==
X-Received: by 2002:a17:902:8a96:b0:138:c162:ff62 with SMTP id
 p22-20020a1709028a9600b00138c162ff62mr6354503plo.43.1630291142438; 
 Sun, 29 Aug 2021 19:39:02 -0700 (PDT)
Received: from yc.huaqin.com ([101.78.151.213])
 by smtp.gmail.com with ESMTPSA id g13sm906839pfi.176.2021.08.29.19.38.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Aug 2021 19:39:02 -0700 (PDT)
From: yangcong <yangcong5@huaqin.corp-partner.google.com>
To: thierry.reding@gmail.com, sam@ravnborg.org, airlied@linux.ie,
 daniel@ffwll.ch, dianders@google.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 yangcong <yangcong5@huaqin.corp-partner.google.com>,
 Douglas Anderson <dianders@chromium.org>
Subject: [v4 1/4] drm/panel: boe-tv101wum-nl6: Support enabling a 3.3V rail
Date: Mon, 30 Aug 2021 10:38:46 +0800
Message-Id: <20210830023849.258839-2-yangcong5@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210830023849.258839-1-yangcong5@huaqin.corp-partner.google.com>
References: <20210830023849.258839-1-yangcong5@huaqin.corp-partner.google.com>
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

