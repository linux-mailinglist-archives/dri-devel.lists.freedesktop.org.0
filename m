Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E6579E5788
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2024 14:45:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F041910EE75;
	Thu,  5 Dec 2024 13:45:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="f7edg0Mr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4506110EE75
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2024 13:45:38 +0000 (UTC)
Received: from [127.0.1.1] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 20C5E13E2;
 Thu,  5 Dec 2024 14:45:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1733406308;
 bh=47sDiubgqaQkaDbcosAByaG1Ni6cOzGOKnQlTVO76og=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=f7edg0Mr2dGV14GEbW61/hKjQ8Y1a+XSY0AAu/0tUt+FUOBLJ/9ckaLvFDy0ZFdDr
 tpTIKd1dv1suACdeTzrdbt6mrWJKmKgrFSjEJ3IbA4lfFFDPSti2A2UyYg4mUSUdSZ
 CO/jThSImQTVaJqSJtYvc6DUELk1PdqxDy2jkFQM=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Thu, 05 Dec 2024 15:45:01 +0200
Subject: [PATCH v2 06/10] drm/rcar-du: dsi: Add r8a779h0 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241205-rcar-gh-dsi-v2-6-42471851df86@ideasonboard.com>
References: <20241205-rcar-gh-dsi-v2-0-42471851df86@ideasonboard.com>
In-Reply-To: <20241205-rcar-gh-dsi-v2-0-42471851df86@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1132;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=dOcoxtMfzjVQWbNdCVgHPfsgULtxlauUf/dbpEGcHa8=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnUa5zV45rDLvRyb34O/dDmHMHw7U3OtdaY/l3j
 lX3APjrF5aJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ1GucwAKCRD6PaqMvJYe
 9S65EACJ/bjtVh8VKV0eYrZ0sKlBkK9dXC1tGkWQDP/tVUGUwTUMm21QezJgFS2Kq6sK255uJjc
 uMRUmiGh6pJ4k38DAe0khGv4V0g9CB/P+opuJckrDbeSeBGgnrUXeiZtqV8fy9akui9ujwB3bIT
 aZvXQu5+A7S1KuBrbj/k1WqmN3rjC1PNirnkm3Lwo6crjCHC0lAZ0BfB3pIZTQXuS30AOXc7KM6
 I7X/YWVWD07bmwQ5hQtN2dI/HQ+QSTgRj9c2uo+0ilniXq9Ql6sL/qp4krN/OBxDvyTIUmg5JrP
 tQWIhdwN8TyudIPX41ufMizfGVu7pbCSf/S4IvL2cbJP/o8VjX0UC18TrRUyEt29u11/bleiLCN
 YX2d0sO8hu5Wnhg2dw9FCd7y4hA0CaBeMFPCr23JGhxgxcjdo3JSPzSQAE03SJW9zd6c9RTz6jF
 0DF9EBZeSM8yw8yO9I4AB4TyobJqjAJlLSFUtTgKHlyQZWS88MJ/f5R4JCWnf6O9s8UjBGicpbR
 mcXu053nyM1qmlwrzScG00w+r4pBijjLcb6ptCRh6c47aBua77YwYrRelrkn5VhzROmD7At45Lq
 2Z8DslROgQprN5v0B34bRKVJ3OJMXyCApm5udPOxlINAcB0L5kWWy+QDHiiz1VQdLj4Tc3dUneI
 cKmKPuPGcdZrKng==
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
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
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

