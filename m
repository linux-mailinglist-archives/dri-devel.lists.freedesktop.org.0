Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD18D4A6CE0
	for <lists+dri-devel@lfdr.de>; Wed,  2 Feb 2022 09:25:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC49410F945;
	Wed,  2 Feb 2022 08:25:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 435 seconds by postgrey-1.36 at gabe;
 Tue, 01 Feb 2022 11:16:55 UTC
Received: from mx3.securetransport.de (mx3.securetransport.de
 [IPv6:2a01:4f8:c0c:92be::1])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3F4CA10E5ED
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Feb 2022 11:16:55 +0000 (UTC)
Received: from mail.dh-electronics.com
 (business-24-134-97-169.pool2.vodafone-ip.de [24.134.97.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mx3.securetransport.de (Postfix) with ESMTPSA id 21E995DE19;
 Tue,  1 Feb 2022 12:08:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dh-electronics.com;
 s=dhelectronicscom; t=1643713739;
 bh=T1pR5YOrHJEnGTpa4D2Pe9uGNpEOqar+i3lRd9LJQdc=;
 h=From:To:CC:Subject:Date:From;
 b=OoFKOc/xAK7w+wCz5tosKRin6Myqgn6y6n29ufQDDPWixBg4E16Ek39DUA0YHQK2s
 Fs4XoF4N9nXsajkJz7AyXMk+D9sVQOYmPCKMRe7eLKsN3XFYNOdQ5UV+iN+h4dlYnX
 +Zv3es4C7MP8xlLxewWtrWXSRyrwqV80V/i50Y+26rfSwcF4fOm35bmDHn+WIZ63Jh
 TpVX58gW5oIKC/Umz7WHeCQOCXKq6fg+c8HYcSrouCfrzWSGW32zZauWZZlGZirIxQ
 w9H6KBoKscRgh9uwcefMX3FiQTgSdSXGZgc4P0LveD9qL1IXyePZmzb/mYCU0x+78p
 OKG4kE3hh8bRg==
Received: from DHPWEX01.DH-ELECTRONICS.ORG (10.64.2.30) by
 DHPWEX01.DH-ELECTRONICS.ORG (10.64.2.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Tue, 1 Feb 2022 12:08:33 +0100
Received: from localhost.localdomain (172.16.51.18) by
 DHPWEX01.DH-ELECTRONICS.ORG (10.64.2.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.15
 via Frontend Transport; Tue, 1 Feb 2022 12:08:32 +0100
From: Christoph Niedermaier <cniedermaier@dh-electronics.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [RFC][PATCH] Revert "drm/panel-simple: drop use of data-mapping
 property"
Date: Tue, 1 Feb 2022 12:07:17 +0100
Message-ID: <20220201110717.3585-1-cniedermaier@dh-electronics.com>
X-Mailer: git-send-email 2.11.0
X-klartext: yes
MIME-Version: 1.0
Content-Type: text/plain
X-Mailman-Approved-At: Wed, 02 Feb 2022 08:24:59 +0000
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
Cc: Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 Marek Vasut <marex@denx.de>, David Airlie <airlied@linux.ie>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, NXP Linux Team <linux-imx@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Without the data-mapping devicetree property my display won't
work properly. It is flickering, because the bus flags won't
be assigned without a defined bus format by the imx parallel
display driver. There was a discussion about the removal [1]
and an agreement that a better solution is needed, but it is
missing so far. So what would be the better approach?

[1] https://patchwork.freedesktop.org/patch/357659/?series=74705&rev=1

This reverts commit d021d751c14752a0266865700f6f212fab40a18c.

Signed-off-by: Christoph Niedermaier <cniedermaier@dh-electronics.com>
Cc: Marek Vasut <marex@denx.de>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: NXP Linux Team <linux-imx@nxp.com>
Cc: linux-arm-kernel@lists.infradead.org
To: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/panel/panel-simple.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 3c08f9827acf..2c683d94a3f3 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -453,6 +453,7 @@ static int panel_dpi_probe(struct device *dev,
 	struct panel_desc *desc;
 	unsigned int bus_flags;
 	struct videomode vm;
+	const char *mapping;
 	int ret;
 
 	np = dev->of_node;
@@ -477,6 +478,16 @@ static int panel_dpi_probe(struct device *dev,
 	of_property_read_u32(np, "width-mm", &desc->size.width);
 	of_property_read_u32(np, "height-mm", &desc->size.height);
 
+	of_property_read_string(np, "data-mapping", &mapping);
+	if (!strcmp(mapping, "rgb24"))
+		desc->bus_format = MEDIA_BUS_FMT_RGB888_1X24;
+	else if (!strcmp(mapping, "rgb565"))
+		desc->bus_format = MEDIA_BUS_FMT_RGB565_1X16;
+	else if (!strcmp(mapping, "bgr666"))
+		desc->bus_format = MEDIA_BUS_FMT_RGB666_1X18;
+	else if (!strcmp(mapping, "lvds666"))
+		desc->bus_format = MEDIA_BUS_FMT_RGB666_1X24_CPADHI;
+
 	/* Extract bus_flags from display_timing */
 	bus_flags = 0;
 	vm.flags = timing->flags;
-- 
2.11.0

