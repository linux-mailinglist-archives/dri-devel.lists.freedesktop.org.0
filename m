Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC4E9F0E50
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2024 15:03:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C04BA10F01A;
	Fri, 13 Dec 2024 14:03:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="f5kOHp7U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91CD110E43C
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2024 14:03:17 +0000 (UTC)
Received: from [127.0.1.1] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3930D752;
 Fri, 13 Dec 2024 15:02:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1734098561;
 bh=j/k77OUtY9dmOvMhi5OhiMJXLSCWp2c3W/lcveUxkXY=;
 h=From:Subject:Date:To:Cc:From;
 b=f5kOHp7U4Ht4foUvtVdet4HfC50rWf0sdmjvNt68ffQdI51MkdS1qR2uZKKzdQ7zm
 fRqsokYD+qUFbjTPhLMq5ZSeIBbqPEmZfie2byD7WNQU8IvgYW+/BhuaWTxs1Cr0qm
 FvmfLn6iCfOy+Prf89z3FH0A6eIXyWHIAqKHxkMc=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v4 0/7] drm: Add DSI/DP support for Renesas r8a779h0 V4M
 and grey-hawk board
Date: Fri, 13 Dec 2024 16:02:56 +0200
Message-Id: <20241213-rcar-gh-dsi-v4-0-f8e41425207b@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJE+XGcC/3XMQQ6CMBCF4auQrq3plBaKK+9hXIztAF1ITWuIh
 nB3C24g0eX/kvdNLFH0lNipmFik0ScfhhzqUDDb49AR9y43k0IqEMLwaDHyrucued5YAa12RGg
 Ny49HpNa/Vu1yzd379AzxveIjLOvXkaLcOSNwwevSIAE22kk8e0eYwnALGN3RhjtbuFFuCb0nZ
 CaUVDUYDa411R+i3BLVnigz4WplJVRVi6B/EPM8fwAN2KtWMwEAAA==
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
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 stable@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2562;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=j/k77OUtY9dmOvMhi5OhiMJXLSCWp2c3W/lcveUxkXY=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnXD6ck8SEP/xxyX2AvNoR/xyT6pkJqOS+vcc+w
 6BiWaD57F+JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ1w+nAAKCRD6PaqMvJYe
 9RMFEACan9Y3fKvr+iPAgDvmXPF75P7RZoPR8NlLbEmat89KC+kbbqM5IEURvfrqKUZjwvK/NPG
 ANlqRNuDEK0uMEi1mz4ajWVjxEYb2o21hdfezjxmpVMCbYPokpfR6hojsb7thuW8c1oUJuaVXwY
 1OvJr3y42hznHuss8MvrwuF6dieocnRLMhvJaAqs5Zl12Pe14C+/AcIQwApUTfjtnl8f0GISjbc
 KgcXP3WXzxT9Xj1DeSqSnQ7A62+rQa/URmJOmAxOSHoUgg0+wyXHnwx5BbHnjM/Y9RBIM0zdmFq
 G85m97TV4/aw3Cw01Jrcgh/kupgCJ/sEjGJ/GEYc+p9+nk8y73o9pUm5j8Q4ANqV2k77Gc/ninf
 y4w5tlGZ6dVklABJMR2rwmG6aWSWnT/lgPUVxX0QtZ8Ht9dmuEfE/nJAhM9afihrdnCNsICEPU2
 b1hQ5v3dydJsMgHJNm+V+Cj4hql28tszKi9w0q8vsrI4hdC3unuf2gDFb5F1wGTiYlHUTO6jf9N
 CmIaoyDqyzjB62iKrwvxLTuX63tVufqEJwYzh45qyqKLi7ZJTQd6gxHM3GPh8Ts03OOaj5S5eE1
 anBpezACSm9+F1QO+LU7vNeD77xsVxh1G0hcuA0WXjXjViQ1AdEgj5iil2vwC4GdTDZQxZ7DmMw
 NwRyhJEQvgzPyGg==
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

Note: the v4 no longer has the dts and the clk patches, as those have
been merged to renesas-devel.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
Changes in v4:
- Dropped patches merged to renesas-devel
- Added new patch "dt-bindings: display: renesas,du: Add missing
  maxItems" to fix the bindings
- Add the missing maxItems to "dt-bindings: display: renesas,du: Add
  r8a779h0"
- Link to v3: https://lore.kernel.org/r/20241206-rcar-gh-dsi-v3-0-d74c2166fa15@ideasonboard.com

Changes in v3:
- Update "Write DPTSR only if there are more than one crtc" patch to
  "Write DPTSR only if the second source exists"
- Add Laurent's Rb
- Link to v2: https://lore.kernel.org/r/20241205-rcar-gh-dsi-v2-0-42471851df86@ideasonboard.com

Changes in v2:
- Add the DT binding with a new conditional block, so that we can set
  only the port@0 as required
- Drop port@1 from r8a779h0.dtsi (there's no port@1)
- Add a new patch to write DPTSR only if num_crtcs > 1
- Drop RCAR_DU_FEATURE_NO_DPTSR (not needed anymore)
- Add Cc: stable to the fix, and move it as first patch
- Added the tags from reviews
- Link to v1: https://lore.kernel.org/r/20241203-rcar-gh-dsi-v1-0-738ae1a95d2a@ideasonboard.com

---
Tomi Valkeinen (7):
      drm/rcar-du: dsi: Fix PHY lock bit check
      drm/rcar-du: Write DPTSR only if the second source exists
      dt-bindings: display: renesas,du: Add missing maxItems
      dt-bindings: display: renesas,du: Add r8a779h0
      dt-bindings: display: bridge: renesas,dsi-csi2-tx: Add r8a779h0
      drm/rcar-du: dsi: Add r8a779h0 support
      drm/rcar-du: Add support for r8a779h0

 .../display/bridge/renesas,dsi-csi2-tx.yaml        |  1 +
 .../devicetree/bindings/display/renesas,du.yaml    | 63 ++++++++++++++++++++--
 drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c      | 18 +++++++
 drivers/gpu/drm/renesas/rcar-du/rcar_du_group.c    | 24 ++++++---
 drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c    |  4 +-
 .../gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h   |  1 -
 6 files changed, 99 insertions(+), 12 deletions(-)
---
base-commit: adc218676eef25575469234709c2d87185ca223a
change-id: 20241008-rcar-gh-dsi-9c01f5deeac8

Best regards,
-- 
Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

