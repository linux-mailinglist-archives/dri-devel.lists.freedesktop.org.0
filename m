Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 446F62D2EAB
	for <lists+dri-devel@lfdr.de>; Tue,  8 Dec 2020 16:55:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45CBB6E962;
	Tue,  8 Dec 2020 15:55:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA3E96E953
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Dec 2020 15:55:15 +0000 (UTC)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28]
 helo=dude02.pengutronix.de.)
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1kmfKc-0007AN-5m; Tue, 08 Dec 2020 16:55:14 +0100
From: Philipp Zabel <p.zabel@pengutronix.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 00/19] drm: managed encoder/plane/crtc allocation
Date: Tue,  8 Dec 2020 16:54:32 +0100
Message-Id: <20201208155451.8421-1-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
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
Cc: kernel@pengutronix.de, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

this is an update of the drmm_(simple_)encoder_alloc(),
drmm_universal_plane_alloc(), and drmm_crtc_alloc_with_plane()
functions in v3 [1] together with the imx-drm managed allocation
conversion from [2] as an example usage.
a bit.

Changes since v3:
 - Allow encoder_funcs to be NULL and let drmm_encoder_alloc() accept a
   NULL value for the funcs parameter. This allows to
 - drop the now useless drmm_simple_encoder_funcs_empty structure.
 - Reorder and squash the imx-drm managed allocation conversion patches
   to use the new functions directly.
 - Fold functions into bind callbacks where they are the only remaining
   call.

[1] https://lore.kernel.org/dri-devel/20200911135724.25833-1-p.zabel@pengutronix.de/
[2] https://lore.kernel.org/dri-devel/20200911133855.29801-1-p.zabel@pengutronix.de/

regards
Philipp

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

 drivers/gpu/drm/drm_crtc.c              | 116 ++++++++++++++++-----
 drivers/gpu/drm/drm_encoder.c           | 105 ++++++++++++++-----
 drivers/gpu/drm/drm_mode_config.c       |   5 +-
 drivers/gpu/drm/drm_plane.c             | 126 +++++++++++++++++------
 drivers/gpu/drm/drm_simple_kms_helper.c |   9 ++
 drivers/gpu/drm/imx/dw_hdmi-imx.c       |  95 ++++++++---------
 drivers/gpu/drm/imx/imx-ldb.c           | 109 +++++++++++---------
 drivers/gpu/drm/imx/imx-tve.c           | 109 ++++++++++----------
 drivers/gpu/drm/imx/ipuv3-crtc.c        | 131 ++++++++----------------
 drivers/gpu/drm/imx/ipuv3-plane.c       |  69 ++++++-------
 drivers/gpu/drm/imx/ipuv3-plane.h       |   3 -
 drivers/gpu/drm/imx/parallel-display.c  |  91 ++++++++--------
 include/drm/drm_crtc.h                  |  33 ++++++
 include/drm/drm_encoder.h               |  32 +++++-
 include/drm/drm_plane.h                 |  42 ++++++++
 include/drm/drm_simple_kms_helper.h     |  24 +++++
 16 files changed, 684 insertions(+), 415 deletions(-)

-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
