Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F3F9A87E94
	for <lists+dri-devel@lfdr.de>; Mon, 14 Apr 2025 13:12:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A565410E576;
	Mon, 14 Apr 2025 11:12:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="sx360+99";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33C6310E53D
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 11:12:07 +0000 (UTC)
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id B3E47669;
 Mon, 14 Apr 2025 13:10:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1744629002;
 bh=gHMU5QksJ/Xc7+zTNZNZ7MAnbRqKlzLlWprq8zYh1eg=;
 h=From:Subject:Date:To:Cc:From;
 b=sx360+99lfndPgFRQ3wLHmef8VVuwIMuMenVIsuJ2i9GaO0FU20OhgDDpXPtVJezp
 PFujWSGcP/35s0NISc/PM2DODkfh6fQVs3H1BWp+KYaMG3MrK4r7FHTkxVMpRKcHy0
 Di1LbmzbAm2TezKxk3Zpt8yKfakn999Uza4wPDDk=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v3 00/17] drm/bridge: cdns-dsi: Make it work a bit better
Date: Mon, 14 Apr 2025 14:11:09 +0300
Message-Id: <20250414-cdns-dsi-impro-v3-0-4e52551d4f07@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAE/t/GcC/4XQwW7DIAwG4FeJOI8IDCTQU99j2sGAsyAtSQdp1
 Krqu4+mhx22acff0v9Z9o0VyokKOzQ3lmlLJS1zDeqlYWHE+Z14ijUzEGCEAsFDnAuPJfE0nfL
 CVbSDj73VNkpWS6dMQ7rs4OvbM2f6PFd3fQ7ZRKXg7h6aXQXopDEAtjWdBuu45Jgxjlds/Yhrw
 uNHms+XNtL22PCjr6WQSne6a11npfyn7rEQD8s0pfXQSFFrMWIAJ3uvZHDWBBoGQdpZCBrQBQf
 as8cpYyrrkq/7qza53/LXVzbJBe/BQN8HM2jljykSlmX2C+bY1vW7uMG3ogX8UKAqGoVThGgI+
 l+U+/3+BfC2A1TEAQAA
X-Change-ID: 20250320-cdns-dsi-impro-3d8fbd7848d1
To: Jyri Sarha <jyri.sarha@iki.fi>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Jayesh Choudhary <j-choudhary@ti.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org, Francesco Dolcini <francesco@dolcini.it>, 
 Aradhya Bhatia <aradhya.bhatia@linux.dev>, 
 Devarsh Thakkar <devarsht@ti.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=5088;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=gHMU5QksJ/Xc7+zTNZNZ7MAnbRqKlzLlWprq8zYh1eg=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBn/O14VKnXVrLCOYUadcoG0OBS9egt7c3zYLhD0
 EuGvOvNCrKJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ/zteAAKCRD6PaqMvJYe
 9foDD/9nw9+2A0AYs+7Sm4UsJUu7mjUsm6MWgClDjW2uJ8nTNlMlLD720boueovv+0lNN+/sowd
 giSt7pdGRcMIK+aMh5p+IwpTsVf0h9xGj5SY5Ki8Y2Ln9Mqm6Z9KEh7voN9logN/dNc4s4E1KLA
 oqa8AfWy4x09/tZPlRSVBtn9Xp2TFazGET7hP+4eaI01wqGTHwEHlEa3hXbZ6cZrMIxJm1U5G9H
 JyyCuO2kehRq1+XmWMkyMrtRqY6dXSDakeQkI07Fnty18rCS6P3Ycpf9zAlC0Gel1gI/JeENDbZ
 A6gEzEJ2jyXN/4SgQK8PGwf3cWrbAEPQ3QyHyOzyjlisgJz9VCM7HjIyg2Esc8lm0G9bEB7kNa9
 2ImLZEh5tyiSxFnWrhqDBHRlFMmqp6BCRrhmsnhQkTW/klmkTn70ARt5Qod+OrPmyez7cshV+Pg
 1pTkHxHZOzxFEWBZxQlL4KNSVKKMmcQQNqRejymiszOdze5Zw+h1WOCTJFrB2RtIYVRmKCrXdKI
 kdCFOtT3j3PwSMyFyctqkEZPbgIYk+S4d2MxljKLXAwmaWZr2C7m4vpGNo+Y1Ihsc7Q8LmPkFUb
 H6/pA15w2TfWQEwSrb6QTjgdIgADlcgPYA9XoNCAlKtIbDDCYrsEWmUJmiRdCgxTBdiZhh053gc
 bIahoyNknCqpZqg==
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

This has been tested on Toradex AM69 Aquila (upstream) and AM62P Verdin
(Toradex's BSP), with:
- HDMI output using lontium lt8912b
- LVDS panel (sn65dsi84 + panel-lvds)

 Tomi

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
Changes in v3:
- Add Aradhya's "drm/bridge: cdns-dsi: Fix the _atomic_check()" to the
  dependencies
- The above patch from Aradhya allowed adding "drm/bridge: cdns-dsi:
  Drop crtc_* code", which resulted in quite large changes in the
  commits, even if the end result doesn't really differ.
- Reordered commits to decrease back-and-forth (e.g. fixing something in
  a a code that will be removed in the next commits)
- The reordering caused quite big changes in the commits (even if the
  final end result is more or less the same), so I chose not to add
  tested-by tags.
- Rename 'cdns_get_dphy_pll_cfg' to 'cdns_dphy_get_pll_cfg'
- Use div_u64() instead of div64_u64()
- Drop "Fail if HS rate changed when validating PHY config". This was
  too strict, as clock rounding (especially with DRM's 1kHz
  resolution...) leads to clock rates that do not match exactly.
  However, the rate mismatch should be fine as the commits adjust the
  pixel clock, and the resulting differences should be so small that we
  can't even improve the timings match by adjusting the DSI HFP, as the
  adjustment rounds to 0.
- Link to v2: https://lore.kernel.org/r/20250402-cdns-dsi-impro-v2-0-4a093eaa5e27@ideasonboard.com

Changes in v2:
- Change the tidss clock adjustment from mode_fixup() to atomic_check()
- Link to v1: https://lore.kernel.org/r/20250320-cdns-dsi-impro-v1-0-725277c5f43b@ideasonboard.com

---
Tomi Valkeinen (17):
      drm/tidss: Fix missing includes and struct decls
      drm/tidss: Use the crtc_* timings when programming the HW
      drm/tidss: Adjust the pclk based on the HW capabilities
      phy: cdns-dphy: Store hs_clk_rate and return it
      phy: cdns-dphy: Remove leftover code
      drm/bridge: cdns-dsi: Remove extra line at the end of the file
      drm/bridge: cdns-dsi: Drop crtc_* code
      drm/bridge: cdns-dsi: Remove broken fifo emptying check
      drm/bridge: cdns-dsi: Drop checks that shouldn't be in .mode_valid()
      drm/bridge: cdns-dsi: Update htotal in cdns_dsi_mode2cfg()
      drm/bridge: cdns-dsi: Drop cdns_dsi_adjust_phy_config()
      drm/bridge: cdns-dsi: Adjust mode to negative syncs
      drm/bridge: cdns-dsi: Fix REG_WAKEUP_TIME value
      drm/bridge: cdns-dsi: Use video mode and clean up cdns_dsi_mode2cfg()
      drm/bridge: cdns-dsi: Fix event mode
      drm/bridge: cdns-dsi: Tune adjusted_mode->clock according to dsi needs
      drm/bridge: cdns-dsi: Don't fail on MIPI_DSI_MODE_VIDEO_BURST

 drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c | 211 +++++++++++--------------
 drivers/gpu/drm/tidss/tidss_crtc.c             |  25 ++-
 drivers/gpu/drm/tidss/tidss_dispc.c            |  22 ++-
 drivers/gpu/drm/tidss/tidss_dispc.h            |   5 +
 drivers/gpu/drm/tidss/tidss_drv.h              |   2 +
 drivers/gpu/drm/tidss/tidss_plane.h            |   2 +
 drivers/gpu/drm/tidss/tidss_scale_coefs.h      |   2 +
 drivers/phy/cadence/cdns-dphy.c                |  24 ++-
 8 files changed, 142 insertions(+), 151 deletions(-)
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
prerequisite-message-id: 20250410134646.96811-1-aradhya.bhatia@linux.dev
prerequisite-patch-id: 04f9a2440cebc87891b51d3f77996c88f7525d1c

Best regards,
-- 
Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

