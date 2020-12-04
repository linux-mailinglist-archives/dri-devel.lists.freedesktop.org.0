Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A9A02CF67C
	for <lists+dri-devel@lfdr.de>; Fri,  4 Dec 2020 23:01:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C4A56E040;
	Fri,  4 Dec 2020 22:01:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 680046E040
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Dec 2020 22:01:47 +0000 (UTC)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 13E4399A;
 Fri,  4 Dec 2020 23:01:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1607119305;
 bh=P6ebxqaRV9bCymyha5aYaBu0nIi1Oan3Apmv3xvyjts=;
 h=From:To:Cc:Subject:Date:From;
 b=HqqADjrSRmndwfpJyz+UHISwR8j5YD5cBZT5VAnEZjD/2ovCRK3IOYOYTaFP5YxPX
 m2U96Q8DJkf5o49jgqNmnN7nDk53ejK3Ll+9GBy2baWpXT3Tsx0H52NvwFYKiPgWlS
 tvA1NDfBp9pBL0fM1GxJyMpgM67jcHkzJ7mVkMRk=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/9] drm: rcar-du: Fix LVDS-related crash
Date: Sat,  5 Dec 2020 00:01:30 +0200
Message-Id: <20201204220139.15272-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
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
Cc: linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

This patch series fixes a crash in the LVDS encoder on D3 and E3 SoCs.
See patch 1/9 for details. The next patches are additional cleanups.

Patches 4/9 to 6/9 fix incorrect usage of the devm_* API. They could be
made simpler by using the proposed drmm_* allocators for encoders and
planes ([1]), but those haven't landed yet. Not depending on them also
helps backporting those fixes to stable kernels. I will switch to the
new helpers when they will be available.

[1] https://lore.kernel.org/dri-devel/20200911135724.25833-1-p.zabel@pengutronix.de/

Laurent Pinchart (9):
  drm: rcar-du: Fix crash when using LVDS1 clock for CRTC
  drm: rcar-du: Release vsp device reference in all error paths
  drm: rcar-du: Drop unneeded encoder cleanup in error path
  drm: rcar-du: Use DRM-managed allocation for VSP planes
  drm: rcar-du: Use DRM-managed allocation for encoders
  drm: rcar-du: Embed drm_device in rcar_du_device
  drm: rcar-du: Replace dev_private with container_of
  drm: rcar-du: Skip encoder allocation for LVDS1 in dual-link mode
  drm: rcar-du: Drop local encoder variable

 drivers/gpu/drm/rcar-du/rcar_du_crtc.c      | 12 +--
 drivers/gpu/drm/rcar-du/rcar_du_drv.c       | 33 +++----
 drivers/gpu/drm/rcar-du/rcar_du_drv.h       | 13 ++-
 drivers/gpu/drm/rcar-du/rcar_du_encoder.c   | 95 +++++++++++----------
 drivers/gpu/drm/rcar-du/rcar_du_encoder.h   |  2 -
 drivers/gpu/drm/rcar-du/rcar_du_kms.c       | 12 +--
 drivers/gpu/drm/rcar-du/rcar_du_plane.c     |  8 +-
 drivers/gpu/drm/rcar-du/rcar_du_vsp.c       | 28 ++++--
 drivers/gpu/drm/rcar-du/rcar_du_writeback.c |  2 +-
 9 files changed, 107 insertions(+), 98 deletions(-)

-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
