Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF0471F8F9A
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jun 2020 09:27:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A65A6E1C4;
	Mon, 15 Jun 2020 07:27:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B12C89F9F
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Jun 2020 19:04:08 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id z206so8237692lfc.6
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Jun 2020 12:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ofH5y+DsAUKO47Nkj6CHgyEmv07V+x06WqiTKtmxkz8=;
 b=tDyw/Z0NbyseYNFw0tmkDEmK0+rdlxT3B6Rx0ogIl0xtyfgXfz6h1CglbOficaxF7j
 opyTD6xXyzEhidGf0dAsVGJxGEJLW+5tIFSWwFwYrEUtVp4RkJQwNVuVPpfTsfi/xGRg
 lUvTrWWu5SISnnOknRogcrt75rMJBefk8sfOvpjnv1LtW5WIFo4NOx7jmgZESMgNxw0m
 NRa2NWMragB95iD4zcf3Z2hYf4HA+Tph53CfFfyTJPB0ELrZ8dR4ekL6nrFaB6DJ0fd1
 0HwkduwlYNPJdXHLlJHsa+VPG52wtU8H9fgC4wvWWAQQKdVLbiS8fWkw//BeawlVZBdF
 OZUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ofH5y+DsAUKO47Nkj6CHgyEmv07V+x06WqiTKtmxkz8=;
 b=YSe+8KI+YBzUk5QeJ8lpTZj1zghcINPhak4COALGs8QsA1FZaw22LETMo1zjQCHM/1
 f8931k1qOljqXlZE41CatDZXUf9ByCDarB1zhXrOSVF7Qs7yJrQ+APDdOFjjsiUilJoB
 GSubWhGNHbqnNlSLvCFNbZ3GKCEeD1qc8xkk24ELakb5x0opuBGBbccHreGV1MfJkRuE
 GBWbAnJ6usf2IGDWdUXVy+WpXWlQaoXhUwhk35uPuGzconnNZjm0yhnCZSS+mFipaeV1
 7rQHBTxDI8hJteB3rUohAFef10CJX49UECqlJjUlLokP7fWaEoO/AlbWmwEZOVM1hjoC
 1SEA==
X-Gm-Message-State: AOAM533qM+hAxjMr8q9cnutqZDwRlTC4YlZNE3j+RVv0eu6hqjdUAB1B
 R1DQxFuSO087EWiAqq2AIJ4=
X-Google-Smtp-Source: ABdhPJwnG7yAfF3RYIYSWw/kDrX3Tt8hscqrxTuGTxm3j3w/fphxrbebeuo7y9inPvrpN1G6fHc9Ew==
X-Received: by 2002:a19:7612:: with SMTP id c18mr11900032lff.7.1592161446900; 
 Sun, 14 Jun 2020 12:04:06 -0700 (PDT)
Received: from localhost.localdomain (79-139-237-54.dynamic.spd-mgts.ru.
 [79.139.237.54])
 by smtp.gmail.com with ESMTPSA id p15sm3410856ljn.53.2020.06.14.12.04.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Jun 2020 12:04:06 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Derek Basehore <dbasehore@chromium.org>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sean Paul <sean@poorly.run>
Subject: [PATCH v1 3/6] drm/panel: lvds: Set up panel orientation
Date: Sun, 14 Jun 2020 22:03:45 +0300
Message-Id: <20200614190348.12193-4-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200614190348.12193-1-digetx@gmail.com>
References: <20200614190348.12193-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 15 Jun 2020 07:27:17 +0000
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
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The panel orientation needs to parsed from a device-tree and assigned to
the panel's connector in order to make orientation property available to
userspace. That's what this patch does for the generic LVDS panel.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/panel/panel-lvds.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-lvds.c b/drivers/gpu/drm/panel/panel-lvds.c
index 5ce3f4a2b7a1..9421246ac80f 100644
--- a/drivers/gpu/drm/panel/panel-lvds.c
+++ b/drivers/gpu/drm/panel/panel-lvds.c
@@ -99,6 +99,7 @@ static int panel_lvds_get_modes(struct drm_panel *panel,
 	connector->display_info.bus_flags = lvds->data_mirror
 					  ? DRM_BUS_FLAG_DATA_LSB_TO_MSB
 					  : DRM_BUS_FLAG_DATA_MSB_TO_LSB;
+	drm_connector_set_panel_orientation(connector, lvds->panel.orientation);
 
 	return 1;
 }
@@ -223,6 +224,11 @@ static int panel_lvds_probe(struct platform_device *pdev)
 	drm_panel_init(&lvds->panel, lvds->dev, &panel_lvds_funcs,
 		       DRM_MODE_CONNECTOR_LVDS);
 
+	ret = of_drm_get_panel_orientation(lvds->dev->of_node,
+					   &lvds->panel.orientation);
+	if (ret)
+		return ret;
+
 	ret = drm_panel_of_backlight(&lvds->panel);
 	if (ret)
 		return ret;
-- 
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
