Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD517A6AABD
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 17:12:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F76410E65D;
	Thu, 20 Mar 2025 16:00:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="AI38E/Cj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80D5A10E65D
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Mar 2025 16:00:35 +0000 (UTC)
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0B916743;
 Thu, 20 Mar 2025 16:58:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1742486327;
 bh=lSyopKruZvmWIQmZ7p24moYnW97sugfhmwKElLeEU/Q=;
 h=From:Subject:Date:To:Cc:From;
 b=AI38E/CjQ6vKKm0uRFJnelHpS++zAm9FBjwkLQm067nMlBN8BbbohkFj1JdzU8kw8
 d+KvTK1Std1ZcOj2rqw73Z6YQuu796YNCm+qaFiPZPLV+RP2GAFXXV+Ka9rS3SvDoe
 Sr1SW2zqTsXr+1PLFmd3VE2a0iu7UFWVzYnWjfM8=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH 00/18] drm/bridge: cdns-dsi: Make it work a bit better
Date: Thu, 20 Mar 2025 17:59:55 +0200
Message-Id: <20250320-cdns-dsi-impro-v1-0-725277c5f43b@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAH073GcC/yWOwW7CMBBEfyXyuY7ijR1sTv2PisPau2lWahKwA
 wIh/h03HN9I82aeqnAWLurYPFXmmxRZlwrmq1FpwuWXtVBlBR24rodOJ1qKpiJa5nNedU9+jHT
 w1pNRtXTOPMp9F/6cPpz5cq3e7ROqmUvB3XtsdivAYJwD8K0bLPigjcaMND2wjRNugt9/slzvL
 fHtfyFiYZ3WeZat/uwGOxBhgmAOsTcpeJd4HDu2wUOygCEFsFGdXq83VsiLNewAAAA=
X-Change-ID: 20250320-cdns-dsi-impro-3d8fbd7848d1
To: Jyri Sarha <jyri.sarha@iki.fi>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org, Francesco Dolcini <francesco@dolcini.it>, 
 Aradhya Bhatia <aradhya.bhatia@linux.dev>, 
 Devarsh Thakkar <devarsht@ti.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3532;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=lSyopKruZvmWIQmZ7p24moYnW97sugfhmwKElLeEU/Q=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBn3DuQitCmeAn1z5CKfMvn9KlKyHrqUimYENrj9
 FzRaAvEFdGJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ9w7kAAKCRD6PaqMvJYe
 9Y56D/0Z+Q6zQ7cSoyEqQcuuqAgQ308kt5ZtP2h0r9qur2lkI9ipQMvoyYMbIsIFYvWGS9ZQGUA
 7O0zLFBoJLmMa14GF9xLR6FFQdgRsXTqRLUNJQ30O9NUyk0EmujbQtsB1EvfaJvrLwNUaQ1bIgY
 d6u5hlf7HdSAIxx8EHyyRFCYo8bDto92xtwD0xw6keeJ71nZdPnUjxdI9SVk6U6LVZGo71fgp5e
 lexn1GbPu7uqYiV+YzG+for7LCxi9nmZAbSQ+OjRoJa88Xc9ovIqEpiM8O6YUjavDRCl0sCDgMu
 fugFiTuB3Xdx8LeHhXza1wmzMr6ltDXjHyXeJ5xyG1+dctXk5/O6t8PkUE3W+iCEtSwSgdPGWrj
 AnzR5FL6O3jLtqjl0gxh6s4ME+APRzi3r8/Ko1TejoWgLJbs/I3zJWCD+DlxV1ExNW2wqmKd0K6
 07ivamlcP3D74qc+4MCHmxX2jaSTUx9Q1+77bhkJnvZiBnXhKLRCrKV7AmSZ7u4En1mkLi4Tem/
 rfI/KO1z3u31iOBQDC+ch/LRbfMGTtoJ+raTNLr62FZnDwAPhY9tLlnmQB/U3UsugW16/UX2cL8
 yS/iSw22o9WXwarlPxeQtbW4JjuVxEZw4sx6+rUL71MklZxXYVF8Xko9n/rHBlXpib234DMDPlS
 ovszSeior+ZZiHw==
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

While trying to get the cdns-dsi to work on Toradex's AM69 Aquila
platform, I hit multiple issues in the driver. Basicaly nothing worked
for with the board.

This series fixes those issues. While I itch to make much larger changes
to the cdns-dsi driver, I opted to keep this series relatively simple to
make the fixes more clear and possibly help with backporting.

The series also touches tidss, but those changes are not strictly
needed, and can be merged separately. And the series also touches
cdns-dphy, and those changes are needed.

This has been tested on Toradex AM69 Aquila, with:
- HDMI output using lontium lt8912b
- LVDS panel (sn65dsi84 + panel-lvds)

 Tomi

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
Tomi Valkeinen (18):
      drm/tidss: Fix missing includes and struct decls
      drm/tidss: Use the crtc_* timings when programming the HW
      drm/tidss: Add mode_fixup to adjust the clock based on HW
      phy: cdns-dphy: Store hs_clk_rate and return it
      phy: cdns-dphy: Remove leftover code
      drm/bridge: cdns-dsi: Adjust mode to negative syncs
      drm/bridge: cdns-dsi: Fail if HS rate changed when validating PHY config
      drm/bridge: cdns-dsi: Clean up cdns_dsi_mode2cfg()
      drm/bridge: cdns-dsi: Fix REG_WAKEUP_TIME value
      drm/bridge: cdns-dsi: Fix event mode
      drm/bridge: cdns-dsi: Remove broken fifo emptying check
      drm/bridge: cdns-dsi: Drop checks that shouldn't be in .mode_valid()
      drm/bridge: cdns-dsi: Do not use crtc_* values
      drm/bridge: cdns-dsi: Use videomode internally
      drm/bridge: cdns-dsi: Tune adjusted_mode->clock according to dsi needs
      drm/bridge: cdns-dsi: Update htotal in cdns_dsi_mode2cfg()
      drm/bridge: cdns-dsi: Drop cdns_dsi_adjust_phy_config()
      drm/bridge: cdns-dsi: Don't fail on MIPI_DSI_MODE_VIDEO_BURST

 drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c | 224 +++++++++++--------------
 drivers/gpu/drm/tidss/tidss_crtc.c             |  24 ++-
 drivers/gpu/drm/tidss/tidss_dispc.c            |  22 ++-
 drivers/gpu/drm/tidss/tidss_dispc.h            |   5 +
 drivers/gpu/drm/tidss/tidss_drv.h              |   2 +
 drivers/gpu/drm/tidss/tidss_plane.h            |   2 +
 drivers/gpu/drm/tidss/tidss_scale_coefs.h      |   2 +
 drivers/phy/cadence/cdns-dphy.c                |  24 +--
 8 files changed, 158 insertions(+), 147 deletions(-)
---
base-commit: 10646ddac2917b31c985ceff0e4982c42a9c924b
change-id: 20250320-cdns-dsi-impro-3d8fbd7848d1
prerequisite-message-id: 20250226155228.564289-1-aradhya.bhatia@linux.dev
prerequisite-patch-id: 46845a8d15042dd343a29a17fc0b9d0eec2605f5
prerequisite-patch-id: 7ce82c26cb9e18884492d2282a72ff2a760aefda
prerequisite-patch-id: ec2071425cab81da72e0805ad92fc52731d7a24d
prerequisite-patch-id: 32cde02288e0c36ed687f67778937a61f78b2d90
prerequisite-patch-id: 5f302e2bead8994763699a909ad0b5501f09ed9f
prerequisite-patch-id: 30611df6ef38c7872107d6bf6dde4504d46ab224
prerequisite-patch-id: 99831bcaa13e25b957d83a6320f34bcec223b939
prerequisite-patch-id: b0ad38bc6b323ceea7a1d2266b0fab8deaa6b05e
prerequisite-patch-id: 38dbce2b9302a764be9dbdc551578f02d797dfcc
prerequisite-patch-id: 133f8b1dab4f47d429b1924df981564ce3736233
prerequisite-patch-id: 879c546693a53e4b72c1ee25954c894ae57a441f
prerequisite-patch-id: 3e7edc818ac078a138f0e42e3f47fd685fffb84f
prerequisite-patch-id: 673b9f0b1936b5a49973b71cab5d13774583de38

Best regards,
-- 
Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

