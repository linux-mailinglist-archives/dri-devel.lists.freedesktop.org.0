Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2B619E14F1
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2024 09:02:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 021F810E93D;
	Tue,  3 Dec 2024 08:02:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="G7WBO42w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 280C910E93D
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2024 08:02:51 +0000 (UTC)
Received: from [127.0.1.1] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9AF5A1112;
 Tue,  3 Dec 2024 09:02:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1733212943;
 bh=RWVLj+6YB43d8rRQnYdm2xl4F3BtKMrSAQX0cjQhFFk=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=G7WBO42wEdWIbOqv0iwkjx0J3sKovzFymhcRUhlfPhnclX+tlbi8yac/434Fh4mRK
 EVpGQlNkXTyDDXWihvTuqQAmLXcGgZ8dI8Dfgz43j9s6p5VBbB/3gNq3XPcoqWvUwS
 3Ho8fZUIZV+Mvj7+3RRjyOfkKm5y7xixYj0bidsw=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Tue, 03 Dec 2024 10:01:39 +0200
Subject: [PATCH 5/9] drm/rcar-du: dsi: Add r8a779h0 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241203-rcar-gh-dsi-v1-5-738ae1a95d2a@ideasonboard.com>
References: <20241203-rcar-gh-dsi-v1-0-738ae1a95d2a@ideasonboard.com>
In-Reply-To: <20241203-rcar-gh-dsi-v1-0-738ae1a95d2a@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, LUU HOAI <hoai.luu.ub@renesas.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Biju Das <biju.das.jz@bp.renesas.com>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 linux-clk@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1000;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=9Inz7swUGZNMUmq1FqPlDEY1Ugw09knlzM2EIBoVHxc=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnTrseA0J63hsolJ/x+UHz5TC6KxKE6YB7eaGM6
 qennVJ6dsyJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ067HgAKCRD6PaqMvJYe
 9TvlD/90F0+7VrosPqLrT/spYfDECGUjtDMMvPtCEXLXl9rUwgvcIbCAj+Vo2Giaaupx/h5mYn1
 o2c7oc9pJfqifUfOxXqfGTrhzogF2HL8c0m0+eKYGzc6PaZRxx9guRsgBegYTwVgTzvTrvkyMNL
 xgi1vlPT7zlTxZAs9IuG3dx6F1+h6j4MpFgweNJIcP3iKCusoqN+OVzkGkVccDr+hs4JikprNA7
 ZR8E8sy5QHIAlJh23Hnzhz/43WXHGm5Er1hoCkGTdjVqQdqrw3ceb+D0PZ9FE/G46KEDDuNaKjY
 7WoiKNFIKwak7Q2bmkoSL6ei6Y5xWKVub11kX9d/oq17T0XB/R7sDlVKn199AYvd4SgKTJPbYDa
 uV0yVjZm05hc6ReqD3UniJxaAFgOLwOyQ3sOgYTC2taLLE8KheCMbugNWL4Xpqu0NWDaGCVCdaW
 yN6lCFky0Sw6hcWokL2rkKgJ8Ug3tKutTg9h6O36H6Dmy7QdWXUZJ9+kAJVpTpOQ8ALnsWffJmt
 rqX/UheaVZGMKiHj2uIVKTbDUaH9aEP9ZXfFeyX99wIIXTjpHC3OPvcKrh+RbQlxWebxcR1eLdn
 oxEwziVX1RfdIqINgN2PMqpDFhnIuZ9/D0ZgRr8NJmHIhOVi/A1fCcP3ku/4a3ddJYfE2IB7DIJ
 3vZ6I22ljYuUyKw==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
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

From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

Add support for DSI on r8a779h0. As it is identical to DSI on r8a779g0,
all we need is to handle the compatible string.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
index 92f4261305bd..36e902601f84 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
@@ -1081,6 +1081,8 @@ static const struct rcar_mipi_dsi_device_info v4h_data = {
 static const struct of_device_id rcar_mipi_dsi_of_table[] = {
 	{ .compatible = "renesas,r8a779a0-dsi-csi2-tx", .data = &v3u_data },
 	{ .compatible = "renesas,r8a779g0-dsi-csi2-tx", .data = &v4h_data },
+	/* DSI in r8a779h0 is identical to r8a779g0 */
+	{ .compatible = "renesas,r8a779h0-dsi-csi2-tx", .data = &v4h_data },
 	{ }
 };
 

-- 
2.43.0

