Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 837063F276F
	for <lists+dri-devel@lfdr.de>; Fri, 20 Aug 2021 09:16:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AB936EA1D;
	Fri, 20 Aug 2021 07:16:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D71F46E99D
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Aug 2021 08:41:25 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id j1so4442717pjv.3
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Aug 2021 01:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SUMawJHmaVN55KeOYmXXMpF4IBtsM0ibJxP9InePT3U=;
 b=D68yWeR28FbyAxGuoQ5+xKO6xj/WVrCMQwNmqiHB7pKVvN0uCulByZRmnBkaRmhBe5
 tSgjnkoeLnAtPBhOcFnEnrlgwv2CBiTrpxz7jtILly7JpZbAZ7mbyXEesQJDuHplnYg1
 l4dtwEfObM1ef4y5N3ZrytirFjPgn60U309Y44aGpFFH42MIr6u4/IBHWjathL6ABfM7
 pSTjTrbh+2ymqfqa788HzzpdfPvDnUFliM18Yhs9z5WDIuQdThqY+jm8Om/0xS27js0s
 xC216FhqMIbVTp7TQbn+ghWK4bTjdFB5gRLGtGMVGdlpaIcMjBkhjiULXDfxGR5pfQDy
 yuXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SUMawJHmaVN55KeOYmXXMpF4IBtsM0ibJxP9InePT3U=;
 b=hnOXRWelZFc1NVzEDVcNDGacnRn8gwZMdSoXGMtQrUuhVwxWPC+k3HqC7AntKFnzw4
 hD6USDHV5RT0tS7MrIAfOWg/Fm53yCvzm28pof3Pgow0IkzLADvd2e0HsDgjco+gSI3H
 VLGrxtOQ3h1ORZAbswAk3Zbqa59bO1DwD49KXNUYm/mcURGpWGe6k99bU3cIYVvTkb2k
 y+HiOHWxWFGxKBamoXkCzEoaJlYpRTV5wDLdI1DQM1WM5V7ZNoIK7y2cqIqjE62HALWM
 VafdU3grLX1XWUN7dn00NakSnMsY+iq/tlw/9KgeSZQe9xmtsTCbFrQfpfCkmFi7ppem
 C6fA==
X-Gm-Message-State: AOAM531/SV2mKJ8x/4DcmiFdleCHpCEM7XAFl7+qjHEef8uOUBiB9qDV
 1wvSNqXkyg/Vm4XgExaxYtw4Lw==
X-Google-Smtp-Source: ABdhPJwn2y/oFow2ot011iJQ5XTfG6YCWdNgqOkYUVZg6dnxmYQEPpx6hCBaos6q8vP19t1MjhhoPQ==
X-Received: by 2002:a17:902:ee55:b029:12d:5cde:62ab with SMTP id
 21-20020a170902ee55b029012d5cde62abmr10855862plo.83.1629362485538; 
 Thu, 19 Aug 2021 01:41:25 -0700 (PDT)
Received: from yc.huaqin.com ([101.78.151.214])
 by smtp.gmail.com with ESMTPSA id c26sm3027492pgl.10.2021.08.19.01.41.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 01:41:25 -0700 (PDT)
From: yangcong <yangcong5@huaqin.corp-partner.google.com>
To: thierry.reding@gmail.com, sam@ravnborg.org, airlied@linux.ie,
 daniel@ffwll.ch, robh+dt@kernel.org, dianders@google.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 yangcong <yangcong5@huaqin.corp-partner.google.com>
Subject: [v1 1/2] drm/panel: boe-tv101wum-nl6: Support enabling a 3.3V rail
Date: Thu, 19 Aug 2021 16:41:10 +0800
Message-Id: <20210819084111.717459-2-yangcong5@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210819084111.717459-1-yangcong5@huaqin.corp-partner.google.com>
References: <20210819084111.717459-1-yangcong5@huaqin.corp-partner.google.com>
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

