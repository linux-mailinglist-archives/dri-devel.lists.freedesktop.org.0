Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3083E11F23A
	for <lists+dri-devel@lfdr.de>; Sat, 14 Dec 2019 15:44:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 658616E3EF;
	Sat, 14 Dec 2019 14:43:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa1.microchip.iphmx.com (esa1.microchip.iphmx.com
 [68.232.147.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C5EF6E8E4
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 15:05:32 +0000 (UTC)
Received-SPF: Pass (esa1.microchip.iphmx.com: domain of
 Claudiu.Beznea@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa1.microchip.iphmx.com;
 envelope-from="Claudiu.Beznea@microchip.com";
 x-sender="Claudiu.Beznea@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com -exists:%{i}.spf.microchip.iphmx.com
 include:servers.mcsv.net include:mktomail.com
 include:spf.protection.outlook.com ~all"
Received-SPF: None (esa1.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa1.microchip.iphmx.com;
 envelope-from="Claudiu.Beznea@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
Authentication-Results: esa1.microchip.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=Pass smtp.mailfrom=Claudiu.Beznea@microchip.com;
 spf=None smtp.helo=postmaster@email.microchip.com;
 dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: uVgVIoFgv+zyn1mJy1jOhCKRps55X6Y6NgJE8SfUWl3kBhO6VnIuWvpsYtL13bwGZNVImA46RC
 ZMaK5iC9085AHVu8/PRhZ9zkjSKe6SB6vzZfrFLbiVijEJM+0w/3N54uclq0VODX/ZKWrNSvJa
 6XZX8c9WT0MGwh3zaLi8Sew7XwbGmzX4nTFxMbNuiEdUbl0XaiieAMrn/MhWUyiVihAy9rNMxU
 4Jzn+4niayQ6QncYPkViuqy4gVpYQy9GZ5WjuDZ0HEW12aPHzlZ/jGCVfOD4tNYB1EuSv3rrr/
 Pb8=
X-IronPort-AV: E=Sophos;i="5.69,309,1571727600"; d="scan'208";a="61647016"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 13 Dec 2019 08:05:30 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 13 Dec 2019 08:05:30 -0700
Received: from m18063-ThinkPad-T460p.microchip.com (10.10.85.251) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.1713.5 via Frontend Transport; Fri, 13 Dec 2019 08:05:25 -0700
From: Claudiu Beznea <claudiu.beznea@microchip.com>
To: <sam@ravnborg.org>, <bbrezillon@kernel.org>, <airlied@linux.ie>,
 <daniel@ffwll.ch>, <nicolas.ferre@microchip.com>,
 <alexandre.belloni@bootlin.com>, <ludovic.desroches@microchip.com>,
 <lee.jones@linaro.org>
Subject: [PATCH v2 5/6] drm: atmel-hlcdc: prefer a lower pixel-clock than
 requested
Date: Fri, 13 Dec 2019 17:04:55 +0200
Message-ID: <1576249496-4849-6-git-send-email-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1576249496-4849-1-git-send-email-claudiu.beznea@microchip.com>
References: <1576249496-4849-1-git-send-email-claudiu.beznea@microchip.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 14 Dec 2019 14:42:54 +0000
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
Cc: Peter Rosin <peda@axentia.se>, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Peter Rosin <peda@axentia.se>

The intention was to only select a higher pixel-clock rate than the
requested, if a slight overclocking would result in a rate significantly
closer to the requested rate than if the conservative lower pixel-clock
rate is selected. The fixed patch has the logic the other way around and
actually prefers the higher frequency. Fix that.

Fixes: f6f7ad323461 ("drm/atmel-hlcdc: allow selecting a higher pixel-clock than requested")
Reported-by: Claudiu Beznea <claudiu.beznea@microchip.com>
Tested-by: Claudiu Beznea <claudiu.beznea@microchip.com>
Signed-off-by: Peter Rosin <peda@axentia.se>
---
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
index 721fa88bf71d..10985134ce0b 100644
--- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
+++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
@@ -121,8 +121,8 @@ static void atmel_hlcdc_crtc_mode_set_nofb(struct drm_crtc *c)
 		int div_low = prate / mode_rate;
 
 		if (div_low >= 2 &&
-		    ((prate / div_low - mode_rate) <
-		     10 * (mode_rate - prate / div)))
+		    (10 * (prate / div_low - mode_rate) <
+		     (mode_rate - prate / div)))
 			/*
 			 * At least 10 times better when using a higher
 			 * frequency than requested, instead of a lower.
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
