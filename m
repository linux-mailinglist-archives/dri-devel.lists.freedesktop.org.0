Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 561EF226321
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jul 2020 17:21:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7E9289A57;
	Mon, 20 Jul 2020 15:21:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1488D89DA4
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jul 2020 15:21:14 +0000 (UTC)
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1jxXbM-0002FN-B2; Mon, 20 Jul 2020 17:21:12 +0200
Received: from pza by lupine with local (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1jxXbL-0007pf-TT; Mon, 20 Jul 2020 17:21:11 +0200
Message-ID: <ac4452eb3a989bf5d85b65fd30840a21f15ec301.camel@pengutronix.de>
Subject: [GIT PULL] drm/imx: error path fixes and cleanups
From: Philipp Zabel <p.zabel@pengutronix.de>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Date: Mon, 20 Jul 2020 17:21:11 +0200
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
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
Cc: kernel@pengutronix.de, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave, Daniel,

The following changes since commit b3a9e3b9622ae10064826dccb4f7a52bd88c7407:

  Linux 5.8-rc1 (2020-06-14 12:45:04 -0700)

are available in the Git repository at:

  git://git.pengutronix.de/pza/linux tags/imx-drm-next-2020-07-20

for you to fetch changes up to 408a85e31e3e5127c91e082c3544082ef1ba48d3:

  drm/imx: imx-tve: Delete an error message in imx_tve_bind() (2020-07-20 15:16:06 +0200)

----------------------------------------------------------------
drm/imx: error path fixes and cleanups

- Fix use after free issue in component bind error path by keeping
  memory allocated as long as the driver is bound. This will be replaced
  with drm managed memory in the next round.
- Fix bus_flags overriding logic in parallel-display.
- Disable regulator in imx-tve bind error path.
- Drop unnecessary best_encoder callback.
- Remove an unused enum in imx-ldb.
- Bail out early on missing panel or bridge in parallel-display to speed
  up -EPROBE_DEFER path.
- Disable both LDB channels in split mode.
- Restore RGB32, BGR32 format support.
- Fix tiled image conversion in case of out of order interrupts.
- Remove a superfluous error message in imx-tve.

----------------------------------------------------------------
Liu Ying (1):
      drm/imx: imx-ldb: Disable both channels for split mode in enc->disable()

Marco Felsch (4):
      drm/imx: tve: fix regulator_disable error path
      drm/imx: drop useless best_encoder callback
      drm/imx: imx-ldb: remove useless enum
      drm/imx: parallel-display: move panel/bridge detection to fail early

Marek Vasut (1):
      drm/imx: parallel-display: Adjust bus_flags handling

Markus Elfring (1):
      drm/imx: imx-tve: Delete an error message in imx_tve_bind()

Philipp Zabel (1):
      drm/imx: fix use after free

Steve Longerbeam (3):
      gpu: ipu-v3: Restore RGB32, BGR32
      gpu: ipu-v3: image-convert: Combine rotate/no-rotate irq handlers
      gpu: ipu-v3: image-convert: Wait for all EOFs before completing a tile

 drivers/gpu/drm/imx/dw_hdmi-imx.c      |  15 ++--
 drivers/gpu/drm/imx/imx-drm-core.c     |   3 +-
 drivers/gpu/drm/imx/imx-ldb.c          |  36 ++++----
 drivers/gpu/drm/imx/imx-tve.c          |  48 +++++------
 drivers/gpu/drm/imx/ipuv3-crtc.c       |  21 +++--
 drivers/gpu/drm/imx/parallel-display.c |  38 ++++-----
 drivers/gpu/ipu-v3/ipu-common.c        |   2 +
 drivers/gpu/ipu-v3/ipu-image-convert.c | 145 +++++++++++++++++++++------------
 8 files changed, 167 insertions(+), 141 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
