Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B5FF9E14EC
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2024 09:02:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5F5810E935;
	Tue,  3 Dec 2024 08:02:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ltH9PsDj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FBE310E92D
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2024 08:02:43 +0000 (UTC)
Received: from [127.0.1.1] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 233F58DB;
 Tue,  3 Dec 2024 09:02:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1733212934;
 bh=2TFDLtiJ4hb6STWGz3swnMyQWEhR/dMEt/9LcY5CwGg=;
 h=From:Subject:Date:To:Cc:From;
 b=ltH9PsDjxi/U3Z9FuCbpPicUA4UnFEIR9tKi/IostMWm7GaC9GUd8NCo3Xdalz63z
 rsg4Cxf5HecWV+B1lJGaP2rMlu4+EXgzjyLWumQcgRy+CFLjh8lOxDgoN93hVlilWh
 gg+Shkpi4A0mnc1PC1it4Ukb2j6v3q3TsS9IRCl0=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH 0/9] drm: Add DSI/DP support for Renesas r8a779h0 V4M and
 grey-hawk board
Date: Tue, 03 Dec 2024 10:01:34 +0200
Message-Id: <20241203-rcar-gh-dsi-v1-0-738ae1a95d2a@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAN+6TmcC/x3MQQqAIBBA0avErBtQKbCuEi1ER52NxQgRiHdPW
 r7F/w0qCVOFfWog9HDlqwzoeQKfXUmEHIbBKLNopSyKd4IpY6iMm1c6roHIeQujuIUiv//tOHv
 /AI68YgpdAAAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1756;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=2TFDLtiJ4hb6STWGz3swnMyQWEhR/dMEt/9LcY5CwGg=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnTrsZsJFsSZ2bMQz3u7xv61IffeVxcmu+570Uu
 L0vlHfSVoiJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ067GQAKCRD6PaqMvJYe
 9YjZD/0er445JS4GlFu3tZ77ccTjHZddPJ4N9MKYx0zSoK+a3GQPJnbPcF0fU54R2jOah5UY1su
 T0NNXVkoRwHgXcuEetU5f03pPSX78wfXspJEgbBFvmuVGdt9NAtM4vYUJHbamZdHoJtdzD0gPJv
 H+muHkdmF4bUQYd7C1dUsJjJomZ+t9AFIVIzG59hdS32yJ57aeVdo0m9LxDz4rLnUj2KHhSEje4
 ZoOt4x57rZTN3FmVjyFBN7jc1HVUc3tpsFvQM1iJLhBKEoqandNrI7NnpC+DwBpVKOKkIfu4s1D
 ho6SNhcOzrDAOydQSloaOLIP/kYorpRX64fzo8Keplg1ZBXIRse3j9R6qFPJsgk4Hq4uhP2atKQ
 ec6s0AN+9ICJ7/5Ke4ZBUbo1Wb4DdMxZ5KQTJ9nYZeFfIhCjEYFN/JJTH/Fmi+JcCb5VvNqemEp
 37dY3S/IIk2eAdXrfgvc3+HC+SDcS7mYMbXvTgoU/PK43e86Pb5MzGr+COCIY9Fvcdsmpow6+Jp
 rHRAlbFofmJjbbgUP7xsKVX9uPSVDwKl8c12fyWGdHwECDyPumYq5Pu8VRHo+bvY3n7WTL0rqr7
 BJpRu4MmErhX73H/hwqhU34n5fGDfgpbWSSN2RhmdMpP/2FqciPrJJEnKQj8mS58laK8Q4rYMs+
 5KVWq033AHp6GEQ==
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

Add everything needed to support the DSI output on Renesas r8a779h0
(V4M) SoC, and the DP output (via sn65dsi86 DSI to DP bridge) on the
Renesas grey-hawk board.

Overall the DSI and the board design is almost identical to Renesas
r8a779g0 and white-hawk board.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
Tomi Valkeinen (9):
      dt-bindings: display: bridge: renesas,dsi-csi2-tx: Add r8a779h0
      dt-bindings: display: renesas,du: Add r8a779h0
      clk: renesas: r8a779h0: Add display clocks
      drm/rcar-du: dsi: Fix PHY lock bit check
      drm/rcar-du: dsi: Add r8a779h0 support
      drm/rcar-du: Add support for r8a779h0
      arm64: dts: renesas: gray-hawk-single: Fix indentation
      arm64: dts: renesas: r8a779h0: Add display support
      arm64: dts: renesas: gray-hawk-single: Add DisplayPort support

 .../display/bridge/renesas,dsi-csi2-tx.yaml        |   1 +
 .../devicetree/bindings/display/renesas,du.yaml    |   1 +
 .../boot/dts/renesas/r8a779h0-gray-hawk-single.dts | 119 ++++++++++++++++++---
 arch/arm64/boot/dts/renesas/r8a779h0.dtsi          |  77 +++++++++++++
 drivers/clk/renesas/r8a779h0-cpg-mssr.c            |   4 +
 drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c      |  19 ++++
 drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.h      |   1 +
 drivers/gpu/drm/renesas/rcar-du/rcar_du_group.c    |  16 +--
 drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c    |   4 +-
 .../gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h   |   1 -
 10 files changed, 223 insertions(+), 20 deletions(-)
---
base-commit: adc218676eef25575469234709c2d87185ca223a
change-id: 20241008-rcar-gh-dsi-9c01f5deeac8

Best regards,
-- 
Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

