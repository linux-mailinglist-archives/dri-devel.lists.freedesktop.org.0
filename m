Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CA255444C5
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jun 2022 09:27:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0695810F94C;
	Thu,  9 Jun 2022 07:27:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EA6B10FA97
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jun 2022 07:27:51 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id j7so20639320pjn.4
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Jun 2022 00:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=979njmg3lDINGZi/hjk1WmVdoXok3WEPuAqEU9cZJ2k=;
 b=j9KpAI/b9qRseLDWsOBweqGi86kh7wYZQ3ofyFDfkDqIfZ+/HB8ErM8G4QPMbx/1K/
 wrn500+3sYP2OfOeyGIlRevPsuSzxegJU4bDZ01Hl0kdJZqsMwrQoTkyshushfeQtZor
 gqU3O6bM87DjmVq4Kln8bX86DBr+n1dbNzoV4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=979njmg3lDINGZi/hjk1WmVdoXok3WEPuAqEU9cZJ2k=;
 b=sE9VpZ//1sRDqNqKiGzEI6sLJS/k2Ifyl1exKVo4U/MNtwM1h0bXifawf74I+fL0DH
 i3WXOuMAV8PY2e3KBhrjipkOtdR7dvW6vI5qGA7pxvU2kcz6oY3OE0zOdlbrEWpo22Z/
 prGSPRysc+hjtFOO7tDq4XRyQQM8h2Bu5O3bgqvfAUtXoHqyWsWWcdHauZEAaqOn6Igx
 FUZ9szLfJjrNGmlzcpsyRYEvKQlpjYgDq19NKkqgwsTapdfjLdkU0/MgPqFjVw8fT4x2
 BG9ALdj7EJuvZVbn8ywu5kBniBlkC3+7NJhQyIKZP37VMZdeY9DVpHiSPWp+XUBixUwq
 sOhw==
X-Gm-Message-State: AOAM53335VRUALN+s4hyKlzFEpkm0u5KNU5OFpH1qZoZdYJ2bHKYZHw2
 H0JB47oFlbRm2GqgwjYxp7lmoA==
X-Google-Smtp-Source: ABdhPJzUtYiKc+YHbz9WSYk2PsW/dDB6EjjkY/X/5kiQ0m6h6L5dfv1hbOR67mOKxuCqT6BPA0oK+g==
X-Received: by 2002:a17:90a:4e82:b0:1ea:3f61:51b with SMTP id
 o2-20020a17090a4e8200b001ea3f61051bmr2127811pjh.16.1654759671059; 
 Thu, 09 Jun 2022 00:27:51 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:5119:d95b:c6cd:77fb])
 by smtp.gmail.com with ESMTPSA id
 p16-20020a1709027ed000b0016403cae7desm15312221plb.276.2022.06.09.00.27.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 00:27:50 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Hans de Goede <hdegoede@redhat.com>, Sam Ravnborg <sam@ravnborg.org>,
 Stephen Boyd <swboyd@chromium.org>,
 Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v7 4/8] drm/panel: lvds: Implement .get_orientation callback
Date: Thu,  9 Jun 2022 15:27:18 +0800
Message-Id: <20220609072722.3488207-5-hsinyi@chromium.org>
X-Mailer: git-send-email 2.36.1.255.ge46751e96f-goog
In-Reply-To: <20220609072722.3488207-1-hsinyi@chromium.org>
References: <20220609072722.3488207-1-hsinyi@chromium.org>
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
Cc: Rob Clark <robdclark@chromium.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

To return the orientation property to drm/kms driver.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/panel/panel-lvds.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-lvds.c b/drivers/gpu/drm/panel/panel-lvds.c
index f11252fb00fea..7a4fedc63e8ec 100644
--- a/drivers/gpu/drm/panel/panel-lvds.c
+++ b/drivers/gpu/drm/panel/panel-lvds.c
@@ -99,15 +99,28 @@ static int panel_lvds_get_modes(struct drm_panel *panel,
 	drm_display_info_set_bus_formats(&connector->display_info,
 					 &lvds->bus_format, 1);
 	connector->display_info.bus_flags = lvds->bus_flags;
+
+	/*
+	 * TODO: Remove once all drm drivers call
+	 * drm_connector_set_orientation_from_panel()
+	 */
 	drm_connector_set_panel_orientation(connector, lvds->orientation);
 
 	return 1;
 }
 
+static enum drm_panel_orientation panel_lvds_get_orientation(struct drm_panel *panel)
+{
+       struct panel_lvds *lvds = to_panel_lvds(panel);
+
+       return lvds->orientation;
+}
+
 static const struct drm_panel_funcs panel_lvds_funcs = {
 	.unprepare = panel_lvds_unprepare,
 	.prepare = panel_lvds_prepare,
 	.get_modes = panel_lvds_get_modes,
+	.get_orientation = panel_lvds_get_orientation,
 };
 
 static int panel_lvds_parse_dt(struct panel_lvds *lvds)
-- 
2.36.1.255.ge46751e96f-goog

