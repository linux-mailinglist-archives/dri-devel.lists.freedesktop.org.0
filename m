Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 265489E6A2D
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2024 10:33:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B11610F058;
	Fri,  6 Dec 2024 09:33:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="WpFWiIeB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E07610F052
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2024 09:33:30 +0000 (UTC)
Received: from [127.0.1.1] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 67F5B1980;
 Fri,  6 Dec 2024 10:32:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1733477579;
 bh=47sDiubgqaQkaDbcosAByaG1Ni6cOzGOKnQlTVO76og=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=WpFWiIeB3tZn+ZuvWqYv5O5tFXIdUh6ijhPsF2L6i2u3MMQMrzLiUJNKt3uvnWYEf
 bG+El030u/l/LD6rHE9I5tzwnvCseJL2Fq/Kp0bj2ERRARsa990ohKGjAHiKX7mZSy
 qYHjyEzOJLzt0w4DmUr0P7Nl6Ldz/7SflNSHXvYM=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 06 Dec 2024 11:32:39 +0200
Subject: [PATCH v3 06/10] drm/rcar-du: dsi: Add r8a779h0 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241206-rcar-gh-dsi-v3-6-d74c2166fa15@ideasonboard.com>
References: <20241206-rcar-gh-dsi-v3-0-d74c2166fa15@ideasonboard.com>
In-Reply-To: <20241206-rcar-gh-dsi-v3-0-d74c2166fa15@ideasonboard.com>
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
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnUsTb3nQBI6XHEpBoRQlNxxmfH9d84KUIaWyi4
 raoOkDEK8+JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ1LE2wAKCRD6PaqMvJYe
 9fPBD/0dIvi+Y4LWuiRvh0683PRMLH12xNAS9IDo4X86JAdn0aHDirUMj7mnJAinMAGCrgb7X1K
 Ql0H1aiN+/z0clWrRRWf1evurFGRRJr/h6LBOxcx4ptUp4N1v2/Vd8H9CNV4uhlEc/LQNzmyAO5
 8GBr9A6DmS1E4s+geFZ5pLOrFr4cgVlVMnxK1GIwx+f4BwTgtbI/v7XaZwZzq6JRKGhK2tXAfYX
 NvZIacf8DFv+oVB6iyM7R8Tlzaju3u6pg6r1iZ4ZvdazVPGcefi/QyIJbpGfWLq42Cwh/3fY33B
 wq5PREl5XfM12mD7VPBrYObZR/V8EwvhM5tLFyOgGpfTpvCQAnx6Gy3KF711SHmEmVm7HKcAAJ5
 m2ytYpRjnhBQ7ldeDEQEJ+IL3vg9GRaN8rREDz3mXXxPpqQPXr+Gt5yjVuFNwpUYsYblkaNRIpT
 AdR8e2lm6FpOhrSGtxTarExw+WEvaM3Ohrvb36nLoHihAmaUVaQL829BtoiwncbjxerO0JbdVmc
 XPrBeBoCIgDFt3MtI23hIuR5LdiEikZQfvb2eJnW3SimXqkH6Duk/osYT61fmiafl6yzMCEEUyh
 bosL7CAqQIfUebtP0w2Dv12KI2+5Inu6PZWzaW1Xuzn5Wtgaxk2VPlKV5NRy7AyekqC7DtIm4Y9
 Y8xsOfIvm5kU1bg==
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

