Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA7FC651F08
	for <lists+dri-devel@lfdr.de>; Tue, 20 Dec 2022 11:41:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D325410E383;
	Tue, 20 Dec 2022 10:39:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B49610E2AA
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Dec 2022 14:02:18 +0000 (UTC)
Received: from desky.lan (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3BA59825;
 Mon, 19 Dec 2022 15:02:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1671458536;
 bh=EASsHaB3HCt+38NB6UH2V86UEUK/u8pXW1k8aQiyOyk=;
 h=From:To:Cc:Subject:Date:From;
 b=R8JT/EgqRDImmbySzlFUEmjccM+MdMxH8raOBUEZ97wTOsLaLWIWX12jn9czkmkZG
 5OctVotlMb0vbaXnFty1qf8dAVtHh/+A42//AYm1U0C/dRXPiAnnwA8AQunAVQYFgk
 Xpup4CsiAKGS+Hj7yM+h3Qnpt9irg1lxfA5N8G2E=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Nicolas Dufresne <nicolas@ndufresne.ca>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH v2 0/7] media/drm: renesas: Add new pixel formats
Date: Mon, 19 Dec 2022 16:01:32 +0200
Message-Id: <20221219140139.294245-1-tomi.valkeinen+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 20 Dec 2022 10:39:50 +0000
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

Changes in v2:

- Add kernel documentation for the new formats
- Add PACK_CPOS & PACK_CLEN macros for writing to ext_infmt registers
- Fix wrong alpha component values in ext_infmt registers

 Tomi

Tomi Valkeinen (7):
  media: Add 2-10-10-10 RGB formats
  media: Add Y210, Y212 and Y216 formats
  media: renesas: vsp1: Change V3U to be gen4
  media: renesas: vsp1: Add V4H SoC version
  media: renesas: vsp1: Add new formats (2-10-10-10 ARGB, Y210)
  drm: rcar-du: Bump V3U to gen 4
  drm: rcar-du: Add new formats (2-10-10-10 ARGB, Y210)

 .../media/v4l/pixfmt-packed-yuv.rst           |  44 ++++
 .../userspace-api/media/v4l/pixfmt-rgb.rst    | 194 ++++++++++++++++++
 drivers/gpu/drm/rcar-du/rcar_du_drv.c         |   2 +-
 drivers/gpu/drm/rcar-du/rcar_du_kms.c         |  24 +++
 drivers/gpu/drm/rcar-du/rcar_du_vsp.c         |  49 ++++-
 .../media/platform/renesas/vsp1/vsp1_drv.c    |   4 +-
 .../media/platform/renesas/vsp1/vsp1_hgo.c    |   4 +-
 .../media/platform/renesas/vsp1/vsp1_lif.c    |   1 +
 .../media/platform/renesas/vsp1/vsp1_pipe.c   |  15 ++
 .../media/platform/renesas/vsp1/vsp1_regs.h   |  25 ++-
 .../media/platform/renesas/vsp1/vsp1_rpf.c    |  61 +++++-
 .../media/platform/renesas/vsp1/vsp1_video.c  |   4 +-
 .../media/platform/renesas/vsp1/vsp1_wpf.c    |   4 +-
 drivers/media/v4l2-core/v4l2-ioctl.c          |   6 +
 include/uapi/linux/videodev2.h                |  11 +
 15 files changed, 430 insertions(+), 18 deletions(-)

-- 
2.34.1

