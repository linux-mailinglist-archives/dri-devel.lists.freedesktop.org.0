Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 321142E9BBC
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jan 2021 18:10:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F1C86E029;
	Mon,  4 Jan 2021 17:10:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5927F6E029
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Jan 2021 17:10:34 +0000 (UTC)
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1kwTNI-0003R0-Je; Mon, 04 Jan 2021 18:10:32 +0100
Received: from pza by lupine with local (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1kwTNH-0008Qq-Ve; Mon, 04 Jan 2021 18:10:31 +0100
Message-ID: <c745fc1596898932c9454fd2979297b4242566a2.camel@pengutronix.de>
Subject: [GIT PULL] drm/imx: fixes and drm managed resources
From: Philipp Zabel <p.zabel@pengutronix.de>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Date: Mon, 04 Jan 2021 18:10:31 +0100
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

this PR includes the drmm encoder/plane/crtc allocation functions and
converts the imx-drm driver to use them.

The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  git://git.pengutronix.de/git/pza/linux.git tags/imx-drm-next-2021-01-04

for you to fetch changes up to 16da8e9a7767ac77720f49bfa870def61a250cda:

  drm/imx: ipuv3-crtc: use drm managed resources (2021-01-04 12:59:34 +0100)

----------------------------------------------------------------
drm/imx: fixes and drm managed resources

- Reduce stack usage in ipu-di.
- Fix imx-ldb for compile tests.
- Make drm encoder control functions optional.
- Add drm managed variants drmm_encoder_alloc(),
  drmm_simple_encoder_alloc(), drmm_universal_plane_alloc(), and
  drmm_crtc_alloc_with_planes() for drm_encoder_init(),
  drm_simple_encoder_init(), drm_universal_plane_init(), and
  drm_crtc_init_with_planes(), respectively.
- Update imx-drm to use the new functions for drm managed resource
  allocation, moving initialization from bind to probe where possible.
- Fix imx-tve clock provider leak.

----------------------------------------------------------------
Krzysztof Kozlowski (1):
      drm/imx: depend on COMMON_CLK to fix compile tests

Lee Jones (1):
      gpu/ipu-v3/ipu-di: Strip out 2 unused 'di_sync_config' entries

Philipp Zabel (19):
      drm/encoder: make encoder control functions optional
      drm: add drmm_encoder_alloc()
      drm/simple_kms_helper: add drmm_simple_encoder_alloc()
      drm/plane: add drmm_universal_plane_alloc()
      drm/crtc: add drmm_crtc_alloc_with_planes()
      drm/imx: dw_hdmi-imx: move initialization into probe
      drm/imx: imx-ldb: use local connector variable
      drm/imx: imx-ldb: move initialization into probe
      drm/imx: imx-tve: use local encoder and connector variables
      drm/imx: imx-tve: move initialization into probe
      drm/imx: imx-tve: use devm_clk_register
      drm/imx: parallel-display: use local bridge and connector variables
      drm/imx: parallel-display: move initialization into probe
      drm/imx: dw_hdmi-imx: use drm managed resources
      drm/imx: imx-ldb: use drm managed resources
      drm/imx: imx-tve: use drm managed resources
      drm/imx: parallel-display: use drm managed resources
      drm/imx: ipuv3-plane: use drm managed resources
      drm/imx: ipuv3-crtc: use drm managed resources

Zheng Yongjun (1):
      gpu: drm: imx: convert comma to semicolon

 drivers/gpu/drm/drm_crtc.c              | 125 ++++++++++++++++++++++-------
 drivers/gpu/drm/drm_encoder.c           | 113 +++++++++++++++++++++------
 drivers/gpu/drm/drm_mode_config.c       |   2 +-
 drivers/gpu/drm/drm_plane.c             | 134 +++++++++++++++++++++++++-------
 drivers/gpu/drm/drm_simple_kms_helper.c |  14 +++-
 drivers/gpu/drm/imx/Kconfig             |   1 +
 drivers/gpu/drm/imx/dw_hdmi-imx.c       |  95 ++++++++++------------
 drivers/gpu/drm/imx/imx-ldb.c           | 109 +++++++++++++++-----------
 drivers/gpu/drm/imx/imx-tve.c           | 109 +++++++++++++-------------
 drivers/gpu/drm/imx/ipuv3-crtc.c        | 131 ++++++++++---------------------
 drivers/gpu/drm/imx/ipuv3-plane.c       |  69 ++++++++--------
 drivers/gpu/drm/imx/ipuv3-plane.h       |   3 -
 drivers/gpu/drm/imx/parallel-display.c  |  93 +++++++++++-----------
 drivers/gpu/ipu-v3/ipu-di.c             |   4 -
 include/drm/drm_crtc.h                  |  33 ++++++++
 include/drm/drm_encoder.h               |  32 +++++++-
 include/drm/drm_plane.h                 |  42 ++++++++++
 include/drm/drm_simple_kms_helper.h     |  24 ++++++
 18 files changed, 712 insertions(+), 421 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
