Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF3421E9C8
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jul 2020 09:13:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 564AA6E8FD;
	Tue, 14 Jul 2020 07:13:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B0366E918
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jul 2020 07:13:20 +0000 (UTC)
Received: from wens.tw (mirror2.csie.ntu.edu.tw [140.112.194.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A236422227;
 Tue, 14 Jul 2020 07:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594710799;
 bh=YiVWckYXZobeNaSRkUj8azBJxqyMKc8YEr8QUsXFDdg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pPUI4kqRSARdAvLmGOuFhpE0+TwvUrgdGV5zoluw7dB4jMnbpdwOyWHl6ni2MDtIU
 zibtyLk+sEY8qdNgniqRgz0jDnhq1F8gEZ5FU8cZ/255xX8zfgMyAeAwl2Mpfp/py3
 mIgoeOwFEXDJijHL+pJwF8QkP8OK82SFgkfFbUMc=
Received: by wens.tw (Postfix, from userid 1000)
 id F23B05FCE5; Tue, 14 Jul 2020 15:13:13 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Maxime Ripard <mripard@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>, Thierry Reding <thierry.reding@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 2/5] drm/panel: simple: Set bpc from bits-per-color DT
 property for panel-dpi
Date: Tue, 14 Jul 2020 15:13:02 +0800
Message-Id: <20200714071305.18492-3-wens@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200714071305.18492-1-wens@kernel.org>
References: <20200714071305.18492-1-wens@kernel.org>
MIME-Version: 1.0
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
Cc: devicetree@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 Siarhei Siamashka <siarhei.siamashka@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chen-Yu Tsai <wens@csie.org>

Now that the device tree binding for panel-dpi has the "bits-per-color"
property, parse its value and set bpc in the panel description to the
given value. This would allow encoders to detect less-than-8-bits color
depth and employ color dithering if possible.

Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 drivers/gpu/drm/panel/panel-simple.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 13a9df44f781..0765bfa54b7a 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -433,6 +433,7 @@ static int panel_dpi_probe(struct device *dev,
 
 	of_property_read_u32(np, "width-mm", &desc->size.width);
 	of_property_read_u32(np, "height-mm", &desc->size.height);
+	of_property_read_u32(np, "bits-per-color", &desc->bpc);
 
 	/* Extract bus_flags from display_timing */
 	bus_flags = 0;
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
