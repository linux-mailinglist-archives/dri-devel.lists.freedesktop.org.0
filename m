Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 45EF17BBB48
	for <lists+dri-devel@lfdr.de>; Fri,  6 Oct 2023 17:07:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5DDF10E51C;
	Fri,  6 Oct 2023 15:07:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 921E610E518
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Oct 2023 15:07:22 +0000 (UTC)
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
 by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <m.tretter@pengutronix.de>)
 id 1qomPx-00051v-RY; Fri, 06 Oct 2023 17:07:05 +0200
From: Michael Tretter <m.tretter@pengutronix.de>
Subject: [PATCH v2 0/5] drm/bridge: samsung-dsim: fix various modes with
 ADV7535 bridge
Date: Fri, 06 Oct 2023 17:07:02 +0200
Message-Id: <20230818-samsung-dsim-v2-0-846603df0e0a@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJYiIGUC/3WOOw6DMBBEr4Jcx4CNMSRV7hFR+LOBLbCRDYgIc
 fcYuhQp32ieZnYSISBE8sh2EmDFiN4l4LeMmEG5HijaxISXvCpb1tKoxri4ntqIIxW8ElIIoQ3
 UJClaRaA6KGeGU1plXhezn9AUNow/6tmeArxxu8ZfXeIB4+zD5/qysjP9M7syWlJd3RsmrZa6U
 c8JXL/MwTvccgukO47jC+QlD4bbAAAA
To: Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::54
X-SA-Exim-Mail-From: m.tretter@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: Marco Felsch <m.felsch@pengutronix.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Frieder Schrempf <frieder.schrempf@kontron.de>,
 kernel@pengutronix.de, Adam Ford <aford173@gmail.com>,
 Michael Tretter <m.tretter@pengutronix.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I tested the i.MX8M Nano EVK with the NXP supplied MIPI-DSI adapter,
which uses an ADV7535 MIPI-DSI to HDMI converter. I found that a few
modes were working, but in many modes my monitor stayed dark.

This series fixes the Samsung DSIM bridge driver to bring up a few more
modes:

The driver read the rate of the PLL ref clock only during probe.
However, if the clock is re-parented to the VIDEO_PLL, changes to the
pixel clock have an effect on the PLL ref clock. Therefore, the driver
must read and potentially update the PLL ref clock on every modeset.

I also found that the rounding mode of the porches and active area has
an effect on the working modes. If the driver rounds up instead of
rounding down and be calculates them in Hz instead of kHz, more modes
start to work.

The following table shows the modes that were working in my test without
this patch set and the modes that are working now:

|            Mode | Before | Now |
| 1920x1080-60.00 | X      | X   |
| 1920x1080-59.94 |        | X   |
| 1920x1080-50.00 |        | X   |
| 1920x1080-30.00 |        | X   |
| 1920x1080-29.97 |        | X   |
| 1920x1080-25.00 |        | X   |
| 1920x1080-24.00 |        |     |
| 1920x1080-23.98 |        |     |
| 1680x1050-59.88 |        | X   |
| 1280x1024-75.03 | X      | X   |
| 1280x1024-60.02 | X      | X   |
|  1200x960-59.99 |        | X   |
|  1152x864-75.00 | X      | X   |
|  1280x720-60.00 |        |     |
|  1280x720-59.94 |        |     |
|  1280x720-50.00 |        | X   |
|  1024x768-75.03 |        | X   |
|  1024x768-60.00 |        | X   |
|   800x600-75.00 | X      | X   |
|   800x600-60.32 | X      | X   |
|   720x576-50.00 | X      | X   |
|   720x480-60.00 |        |     |
|   720x480-59.94 | X      |     |
|   640x480-75.00 | X      | X   |
|   640x480-60.00 |        | X   |
|   640x480-59.94 |        | X   |
|   720x400-70.08 |        |     |

Interestingly, the 720x480-59.94 mode stopped working. However, I am
able to bring up the 720x480 modes by manually hacking the active area
(hsa) to 40 and carefully adjusting the clocks, but something still
seems to be off.

Unfortunately, a few more modes are still not working at all. The NXP
downstream kernel has some quirks to handle some of the modes especially
wrt. to the porches, but I cannot figure out, what the driver should
actually do in these cases. Maybe there is still an error in the
calculation of the porches and someone at NXP can chime in.

Michael

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
Changes in v2:
- Specify limits for the PLL input clock in samsung_dsim_driver_data
- Rephrase/clarify commit messages
- Link to v1: https://lore.kernel.org/r/20230818-samsung-dsim-v1-0-b39716db6b7a@pengutronix.de

---
Marco Felsch (1):
      drm/bridge: samsung-dsim: add more mipi-dsi device debug information

Michael Tretter (4):
      drm/bridge: samsung-dsim: reread ref clock before configuring PLL
      drm/bridge: samsung-dsim: update PLL reference clock
      drm/bridge: samsung-dsim: adjust porches by rounding up
      drm/bridge: samsung-dsim: calculate porches in Hz

 drivers/gpu/drm/bridge/samsung-dsim.c | 54 +++++++++++++++++++++++++++--------
 include/drm/bridge/samsung-dsim.h     |  3 ++
 2 files changed, 45 insertions(+), 12 deletions(-)
---
base-commit: b78b18fb8ee19f7a05f20c3abc865b3bfe182884
change-id: 20230818-samsung-dsim-42346444bce5

Best regards,
-- 
Michael Tretter <m.tretter@pengutronix.de>

