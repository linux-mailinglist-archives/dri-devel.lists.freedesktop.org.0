Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DB8C428E57
	for <lists+dri-devel@lfdr.de>; Mon, 11 Oct 2021 15:41:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A4246E4CD;
	Mon, 11 Oct 2021 13:41:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB6666E4C1
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Oct 2021 13:41:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id 42FABFB08;
 Mon, 11 Oct 2021 15:41:40 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rZBPoI3T_tgq; Mon, 11 Oct 2021 15:41:38 +0200 (CEST)
From: =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Ondrej Jirman <megous@megous.com>, Lucas Stach <l.stach@pengutronix.de>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 0/5] mxsfb/nwl/panels: media bus format fixes
Date: Mon, 11 Oct 2021 15:41:22 +0200
Message-Id: <cover.1633959458.git.agx@sigxcpu.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

commit b776b0f00f24 ("drm: mxsfb: Use bus_format from the nearest bridge if
present") added bus format probing to mxsfb this exposed several issues in the
display stack as used on the Librem 5:

The nwl bridge and the panels didn't bother to set any media bus formats and in
that case mxsfb would not pick a reasonable default. This series aims to fix
this.

This series includes the patch from
https://lore.kernel.org/dri-devel/YVLYh%2FSgBritG%2FRJ@qwark.sigxcpu.org/
with a `dev_warn` added.

The patches are against 5.15-rc3. I've marked a single patch with a 'fixes'
which is enough to unbreak the display stack in 5.15.

All patches of this series can be applied independently.

Changes from v1:
- Review comment by Marek Vasut
  https://lore.kernel.org/dri-devel/67e6056a-6157-795d-908d-d65cc803c03d@denx.de/
  Improve warning message
- Move mxsfb patches to the end of the queue and the actual nwl fix to the
  front.

Changes from v2:
- Review comments by Lucas Stach
  https://lore.kernel.org/dri-devel/cover.1633332399.git.agx@sigxcpu.org/T/#m961c22bf2a437a16b29214913d6f0d523fbe88e2
  Drop fixes tag from mxsfb driver and tweak commit message
- Add Reviewed-by from Lucas
  https://lore.kernel.org/dri-devel/cover.1633332399.git.agx@sigxcpu.org/T/#m9f3337a673ae1adbb1f0152a48270b0e1104b0c1
  https://lore.kernel.org/dri-devel/cover.1633332399.git.agx@sigxcpu.org/T/#m5706d5b93cb6879b6bb4a1810b88800fe4180f74
  https://lore.kernel.org/dri-devel/cover.1633332399.git.agx@sigxcpu.org/T/#m961c22bf2a437a16b29214913d6f0d523fbe88e2
- Add Reviewd-by from Rober Foss
  https://lore.kernel.org/dri-devel/CAG3jFyteqcPNZqrFsggCrnpDfsGGQvibfHBezW+1Hcf3-z91QQ@mail.gmail.com/



Guido Günther (5):
  drm/bridge: nwl-dsi: Add atomic_get_input_bus_fmts
  drm/panel: mantix: Add media bus format
  drm/panel: st7703: Add media bus format
  drm: mxsfb: Print failed bus format in hex
  drm: mxsfb: Set fallback bus format when the bridge doesn't provide
    one

 drivers/gpu/drm/bridge/nwl-dsi.c              | 35 +++++++++++++++++++
 drivers/gpu/drm/mxsfb/mxsfb_kms.c             |  8 ++++-
 .../gpu/drm/panel/panel-mantix-mlaf057we51.c  |  9 +++++
 drivers/gpu/drm/panel/panel-sitronix-st7703.c |  8 +++++
 4 files changed, 59 insertions(+), 1 deletion(-)

-- 
2.33.0

