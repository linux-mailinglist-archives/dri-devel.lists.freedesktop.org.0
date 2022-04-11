Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 249D14FB121
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 02:47:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FFC910E410;
	Mon, 11 Apr 2022 00:47:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D5D810E410
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Apr 2022 00:47:44 +0000 (UTC)
Received: from tr.lan (ip-86-49-12-201.net.upcbroadband.cz [86.49.12.201])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 45F0583C90;
 Mon, 11 Apr 2022 02:47:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1649638062;
 bh=8UE3sCZ5ItLTXlIK2WJ/xtxkdmO/CEjKvLZ+7Rb660U=;
 h=From:To:Cc:Subject:Date:From;
 b=adrlOqIOc2FtVVk5mjnIwKcQ9z5SQLftYP68JPSudmSPuJHhCZ5lUeuneEepRql6V
 gq5VYtmBu52NMUptmNLpACiVtfl0Tf72J3ZBt26dI73Uf7Xm9INorXIraJcYjVxjoH
 RU0qc3fieKnYqG5q8F5d3xrjLQGONBQF+mhLF6jdQNn11+DjT6HbchhTD+A4jk5YZO
 OV9RicR1nejdzJfdVYZ3fbbO3L7ZvrO5cKg1wP+OG0VgCvcsALEbDar+wXusyFnxVs
 U+m0Gw3YMQris1IFiwE4ccJ7SrVS9fwlQuJBwrG9FUNnvdjsDRqQmYzc4QXPcGhg3O
 VSDtEkSAoweoQ==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] drm/modes: Make width-mm/height-mm check in
 of_get_drm_panel_display_mode() mandatory
Date: Mon, 11 Apr 2022 02:47:27 +0200
Message-Id: <20220411004728.68203-1-marex@denx.de>
X-Mailer: git-send-email 2.35.1
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
 Daniel Vetter <daniel.vetter@ffwll.ch>, robert.foss@linaro.org,
 Rob Herring <robh+dt@kernel.org>,
 =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Dmitry Osipenko <digetx@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

All users of this function require width-mm/height-mm DT property to be
present per their DT bindings, make width-mm/height-mm check mandatory.
It is generally a good idea to specify panel dimensions, so userspace
can configure e.g. scaling accordingly.

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
To: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/drm_modes.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
index 6e7e10f16ec03..f0b000ddaddb5 100644
--- a/drivers/gpu/drm/drm_modes.c
+++ b/drivers/gpu/drm/drm_modes.c
@@ -735,8 +735,8 @@ EXPORT_SYMBOL_GPL(of_get_drm_display_mode);
  * @dmode: will be set to the return value
  * @bus_flags: information about pixelclk, sync and DE polarity
  *
- * The Device Tree properties width-mm and height-mm will be read and set on
- * the display mode if they are present.
+ * The mandatory Device Tree properties width-mm and height-mm
+ * are read and set on the display mode.
  *
  * Returns:
  * Zero on success, negative error code on failure.
@@ -761,11 +761,11 @@ int of_get_drm_panel_display_mode(struct device_node *np,
 		drm_bus_flags_from_videomode(&vm, bus_flags);
 
 	ret = of_property_read_u32(np, "width-mm", &width_mm);
-	if (ret && ret != -EINVAL)
+	if (ret)
 		return ret;
 
 	ret = of_property_read_u32(np, "height-mm", &height_mm);
-	if (ret && ret != -EINVAL)
+	if (ret)
 		return ret;
 
 	dmode->width_mm = width_mm;
-- 
2.35.1

