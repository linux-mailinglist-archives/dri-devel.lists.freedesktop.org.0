Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BECB4EF818
	for <lists+dri-devel@lfdr.de>; Fri,  1 Apr 2022 18:38:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F2E210E152;
	Fri,  1 Apr 2022 16:38:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AB2A10E152
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Apr 2022 16:38:20 +0000 (UTC)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 989C88414B;
 Fri,  1 Apr 2022 18:38:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1648831098;
 bh=MqxLzsbMhRw9VjH2aYnLwjjRt41X1WJA5IIkQnIaeKc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MRTAu0ehn49Ah/srAbqEGWF0V52tcURfrzeRil1k5jXJokxNHQY8lUbIdcNJ52LOO
 ue3HStxqHJQKE9uy+DBd6msi0njZt21mpeVlTSwTUSv8ei7VRr6oz51sfDAkcedSIl
 kskXcdrA9gHhh4cxugzeHfbdPom49G9XISOwTYJPdch8LcUY3DEsbgKqU0UtVY4nWd
 0+FPDx1KZmIV9MrCv3nPnD+XKFJacIT8P26B1v8nhyoH/wnEovem9GQqixbSP2Hh6G
 npVC1KCXsG/kj/u1I7Qtz3tCzVnadVZMcz90HFED9/K6RH+8GFhn35SfGMe/arEyUQ
 hsif/MbF5wvog==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [RFC][PATCH 2/3] drm/modes: Make width-mm/height-mm mandatory in
 of_get_drm_panel_display_mode()
Date: Fri,  1 Apr 2022 18:37:54 +0200
Message-Id: <20220401163755.302548-2-marex@denx.de>
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

Make the width-mm/height-mm panel properties mandatory in
of_get_drm_panel_display_mode(), print error message and
return -ve in case these DT properties are not present.
This is needed to correctly report panel dimensions.

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
 drivers/gpu/drm/drm_modes.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
index 3f819c7a021b..45dc2d5c3ea6 100644
--- a/drivers/gpu/drm/drm_modes.c
+++ b/drivers/gpu/drm/drm_modes.c
@@ -761,12 +761,16 @@ int of_get_drm_panel_display_mode(struct device_node *np,
 		drm_bus_flags_from_videomode(&vm, bus_flags);
 
 	ret = of_property_read_u32(np, "width-mm", &width_mm);
-	if (ret && ret != -EINVAL)
+	if (ret < 0) {
+		pr_err("%pOF: invalid or missing width-mm DT property\n", np);
 		return ret;
+	}
 
 	ret = of_property_read_u32(np, "height-mm", &height_mm);
-	if (ret && ret != -EINVAL)
+	if (ret < 0) {
+		pr_err("%pOF: invalid or missing height-mm DT property\n", np);
 		return ret;
+	}
 
 	dmode->width_mm = width_mm;
 	dmode->height_mm = height_mm;
-- 
2.35.1

