Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF557654DB1
	for <lists+dri-devel@lfdr.de>; Fri, 23 Dec 2022 09:45:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7529A10E5F2;
	Fri, 23 Dec 2022 08:44:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 535C810E443
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Dec 2022 09:25:12 +0000 (UTC)
Received: from desky.lan (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id BCA0EFB;
 Wed, 21 Dec 2022 10:25:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1671614707;
 bh=mkDJ6wzQr0V0kQPZuFwuUndLXoJtOm1F+MlvhCynM4c=;
 h=From:To:Cc:Subject:Date:From;
 b=k9Jxi0JyOlrWFw7qjvdLUVyuHWOXSAvgIS66j2w5zmCvdnkGPOqB+ddjkGuI7NyR2
 2lWSjP9scxpmIkj4d5g2sbggfHknc/WcdhYyxm53rdbR92PJqESc2PeUhhKXuWeCjS
 h60r+dGmG2hSLHvrKQZ+CkC4J4hBPduwysxO0wbw=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Nicolas Dufresne <nicolas@ndufresne.ca>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH v3 0/7] media/drm: renesas: Add new pixel formats
Date: Wed, 21 Dec 2022 11:24:41 +0200
Message-Id: <20221221092448.741294-1-tomi.valkeinen+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 23 Dec 2022 08:44:26 +0000
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
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Hi,

These add new pixel formats for Renesas V3U and V4H SoCs.

As the display pipeline is split between DRM and V4L2 components, this
series touches both subsystems. I'm sending all these together to
simplify review. If needed, I can later split this to V4L2 and DRM
parts, of which the V4L2 part needs to be merged first.

Changes in v3:
- Addressed all the review comments
- Added Y212
- Updated the kernel docs for the new formats
- Changed the RGB format names to match the DRM's format names
- Updated RPF register field macros according to the comments

 Tomi

Tomi Valkeinen (7):
  media: Add 2-10-10-10 RGB formats
  media: Add Y210, Y212 and Y216 formats
  media: renesas: vsp1: Change V3U to be gen4
  media: renesas: vsp1: Add V4H SoC version
  media: renesas: vsp1: Add new formats (2-10-10-10 ARGB, Y210, Y212)
  drm: rcar-du: Bump V3U to gen 4
  drm: rcar-du: Add new formats (2-10-10-10 ARGB, Y210)

 .../media/v4l/pixfmt-packed-yuv.rst           |  49 ++++-
 .../userspace-api/media/v4l/pixfmt-rgb.rst    | 194 ++++++++++++++++++
 drivers/gpu/drm/rcar-du/rcar_du_drv.c         |   2 +-
 drivers/gpu/drm/rcar-du/rcar_du_kms.c         |  30 +++
 drivers/gpu/drm/rcar-du/rcar_du_vsp.c         |  50 ++++-
 .../media/platform/renesas/vsp1/vsp1_drv.c    |   4 +-
 .../media/platform/renesas/vsp1/vsp1_hgo.c    |   4 +-
 .../media/platform/renesas/vsp1/vsp1_lif.c    |   1 +
 .../media/platform/renesas/vsp1/vsp1_pipe.c   |  18 ++
 .../media/platform/renesas/vsp1/vsp1_regs.h   |  26 ++-
 .../media/platform/renesas/vsp1/vsp1_rpf.c    |  64 +++++-
 .../media/platform/renesas/vsp1/vsp1_video.c  |   4 +-
 .../media/platform/renesas/vsp1/vsp1_wpf.c    |   4 +-
 drivers/media/v4l2-core/v4l2-ioctl.c          |   6 +
 include/uapi/linux/videodev2.h                |  11 +
 15 files changed, 447 insertions(+), 20 deletions(-)

-- 
2.34.1

