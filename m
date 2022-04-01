Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C993E4EF81B
	for <lists+dri-devel@lfdr.de>; Fri,  1 Apr 2022 18:38:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C02B010E1E2;
	Fri,  1 Apr 2022 16:38:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C07BB10E152
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Apr 2022 16:38:20 +0000 (UTC)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 03F6884198;
 Fri,  1 Apr 2022 18:38:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1648831099;
 bh=ryF4sSVCN4xDNmiRgk+WutxWax/YEB5T15DxI47nwGE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=auJ9GjOXNWyM7OFfoXoByaVt3XKjCAG2ErK0xvIOPkKtpUenMh6ANTlJagu1decMf
 Hkp5yl3nr4ZsF2TTTUbbYE+9UFrc82Y6qbnfWw7qcOVJ5QmbY6Tuw+ndOXp9pWjF2A
 VMnFx8DI3DOmDtVRK5aj4DxCEsYDlKYHytA3I3cbN9JoL4ZxuQh9W2jbL2SSBhjlUu
 3SVm5gGgWXtscTvnCnthI7sRKi2KSu4kPJIvheXK9hcjjgXihdg9NJTNP4VFU7TB7r
 R3AHyZyXnPMLx+lxie4JnLjAaAZbju4vg+yy+wYILJ7VIaF5pFE8UUXoLn8dkXs6Pb
 bnLJrKaWPb7NQ==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [RFC][PATCH 3/3] drm/panel: lvds: Drop duplicate width-mm/height-mm
 check
Date: Fri,  1 Apr 2022 18:37:55 +0200
Message-Id: <20220401163755.302548-3-marex@denx.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220401163755.302548-1-marex@denx.de>
References: <20220401163755.302548-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: Marek Vasut <marex@denx.de>,
 Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 devicetree@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 robert.foss@linaro.org, Rob Herring <robh+dt@kernel.org>,
 =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Dmitry Osipenko <digetx@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The of_get_drm_panel_display_mode() now does check for
presence of width-mm/height-mm DT properties, drop the
duplicate check here.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Christoph Niedermaier <cniedermaier@dh-electronics.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Dmitry Osipenko <digetx@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Noralf Trønnes <noralf@tronnes.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Robert Foss <robert.foss@linaro.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: devicetree@vger.kernel.org
To: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/panel/panel-lvds.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-lvds.c b/drivers/gpu/drm/panel/panel-lvds.c
index eca067e78579..f11252fb00fe 100644
--- a/drivers/gpu/drm/panel/panel-lvds.c
+++ b/drivers/gpu/drm/panel/panel-lvds.c
@@ -128,18 +128,6 @@ static int panel_lvds_parse_dt(struct panel_lvds *lvds)
 		return ret;
 	}
 
-	if (lvds->dmode.width_mm == 0) {
-		dev_err(lvds->dev, "%pOF: invalid or missing %s DT property\n",
-			np, "width-mm");
-		return -ENODEV;
-	}
-
-	if (lvds->dmode.height_mm == 0) {
-		dev_err(lvds->dev, "%pOF: invalid or missing %s DT property\n",
-			np, "height-mm");
-		return -ENODEV;
-	}
-
 	of_property_read_string(np, "label", &lvds->label);
 
 	ret = drm_of_lvds_get_data_mapping(np);
-- 
2.35.1

