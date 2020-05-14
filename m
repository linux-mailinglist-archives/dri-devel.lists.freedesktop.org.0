Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B71B1D24AF
	for <lists+dri-devel@lfdr.de>; Thu, 14 May 2020 03:28:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C3B56E2CC;
	Thu, 14 May 2020 01:28:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9040E6E2CC
 for <dri-devel@lists.freedesktop.org>; Thu, 14 May 2020 01:28:52 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id C8D1651F;
 Thu, 14 May 2020 03:28:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1589419731;
 bh=jfys03yWEwLJJ3P/OjJZKGDo6dy0x4RffsqmE7n6klY=;
 h=Date:From:To:Cc:Subject:From;
 b=FRfZe/+p/nBX+FjA4b+4wb0nxwU/yiqBm3Y5zS+kIhwOtNwm912SszSm9EmDB8BA7
 t3FbmX+M00J9f/8JgEyqZxdbDYggtCVZRQQbNXFlVw/y0/vhQ18a0/H46niQQ2ub6k
 qLDKsWsQddnW0HDIefecZ8zFRQ0nuJ7qj8SBJ0/0=
Date: Thu, 14 May 2020 04:28:44 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [GIT PULL FOR v5.8] Misc Renesas-related changes
Message-ID: <20200514012844.GA7196@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

Just a few misc changes related to Renesas R-Car DU and associated
bridges.

The following changes since commit 3fd911b69b3117e03181262fc19ae6c3ef6962ce:

  Merge tag 'drm-misc-next-2020-05-07' of git://anongit.freedesktop.org/drm/drm-misc into drm-next (2020-05-08 15:17:08 +1000)

are available in the Git repository at:

  git://linuxtv.org/pinchartl/media.git tags/du-next-20200514

for you to fetch changes up to 7982471d01aac33994276bf567c8f1f3a137648a:

  drm: rcar-du: Set primary plane zpos immutably at initializing (2020-05-14 02:10:52 +0300)

----------------------------------------------------------------
R-Car Display Unit & related changes:

- DT bindings conversion to YAML
- Planes zpos sanity check and fix
- MAINTAINERS entry for LVDS panel driver

----------------------------------------------------------------
Geert Uytterhoeven (1):
      dt-bindings: display: renesas: du: Document optional reset properties

Laurent Pinchart (5):
      dt-bindings: display: bridge: Reject additional properties in ports node
      dt-bindings: display: bridge: Convert simple-bridge bindings to YAML
      dt-bindings: display: bridge: thc63lvd1024: Convert binding to YAML
      drm: panels: Add MAINTAINERS entry for LVDS panel driver
      drm: plane: Verify that no or all planes have a zpos property

Tomohito Esaki (1):
      drm: rcar-du: Set primary plane zpos immutably at initializing

 .../bindings/display/bridge/adi,adv7123.txt     |  50 --------
 .../bindings/display/bridge/anx6345.yaml        |   8 ++
 .../bindings/display/bridge/dumb-vga-dac.txt    |  50 --------
 .../bindings/display/bridge/lvds-codec.yaml     |   8 ++
 .../bindings/display/bridge/ps8640.yaml         |   8 ++
 .../bindings/display/bridge/simple-bridge.yaml  |  99 ++++++++++++++
 .../display/bridge/thine,thc63lvd1024.txt       |  66 ----------
 .../display/bridge/thine,thc63lvd1024.yaml      | 121 ++++++++++++++++++
 .../bindings/display/bridge/ti,ths813x.txt      |  51 --------
 .../devicetree/bindings/display/renesas,du.txt  |  10 ++
 MAINTAINERS                                     |   8 ++
 drivers/gpu/drm/drm_blend.c                     |  10 +-
 drivers/gpu/drm/drm_plane.c                     |   9 ++
 drivers/gpu/drm/rcar-du/rcar_du_plane.c         |  16 ++-
 drivers/gpu/drm/rcar-du/rcar_du_vsp.c           |  14 +-
 15 files changed, 294 insertions(+), 234 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/bridge/adi,adv7123.txt
 delete mode 100644 Documentation/devicetree/bindings/display/bridge/dumb-vga-dac.txt
 create mode 100644 Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/bridge/thine,thc63lvd1024.txt
 create mode 100644 Documentation/devicetree/bindings/display/bridge/thine,thc63lvd1024.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/bridge/ti,ths813x.txt

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
