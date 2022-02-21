Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 60EAB4BDB1E
	for <lists+dri-devel@lfdr.de>; Mon, 21 Feb 2022 18:14:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0587610E718;
	Mon, 21 Feb 2022 17:13:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FFC810E718
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Feb 2022 17:13:55 +0000 (UTC)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3A454482;
 Mon, 21 Feb 2022 18:13:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1645463633;
 bh=E0OKuErSDL1WNEJCzwYNIQlTzecUYcbH1CPyRCYIpT8=;
 h=From:To:Cc:Subject:Date:From;
 b=CefefJs3LrohP7qQmJxmeVCstcxqU7EDFGoDk0UrPmq0s4Ve1GP/s1VubTYIYQzS9
 tW+u/gN8YJJkAYXuKhCbX0Yyrl5hDyu36j+Z6u4fNs45gD0Tda100lpO7ftZZDrzg8
 8dBu12uhNcsNApGCXrAn6uVLZgIkrtyK0iia4T78=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/2] drm: rcar-du: Avoid flicker when enabling a VSP plane
Date: Mon, 21 Feb 2022 19:13:38 +0200
Message-Id: <20220221171340.11113-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
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
Cc: efriedrich@de.adit-jv.com, michael@rodin.online,
 Michael Rodin <mrodin@de.adit-jv.com>, linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 erosca@de.adit-jv.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

This patch series avoids flicker in some scenarios related to dual
output configuration.

The issue was originally reported by Michael Rodin in [1]. The problem
is described in details there, and copied here to facilitate discussion:

--------
Restarting a display unit group can cause a visible flicker on the display.
Particularly when a LVDS display is connected to a Salvator board and an
HDMI display is (re)connected, then there will be 2 visible flickers on the
LVDS display:

 1. during atomic_flush (The need_restart flag is set in this case by
    rcar_du_vsp_enable.):
  rcar_du_crtc_atomic_flush
    rcar_du_crtc_update_planes
      ...
      ...
      /* Restart the group if plane sources have changed. */
      if (rcrtc->group->need_restart)
              rcar_du_group_restart(rcrtc->group);
 2. during atomic_enable:
  rcar_du_crtc_atomic_enable
    rcar_du_crtc_start
      rcar_du_group_start_stop(rcrtc->group, true);

To avoid flickers in all use cases, do not restart DU groups on the Gen3
SoCs at all, since it is not required any more.
--------

The proposed patch unfortunately introduced a regression. This series
fixes the issue in the first scenario described above. The second
scenario still leads to flicker, and I don't think that can be fixed as
the hardware requires the whole group of outputs to be stopped for some
register changes to take effect.

[1] https://lore.kernel.org/dri-devel/1637680811-90510-1-git-send-email-mrodin@de.adit-jv.com

Laurent Pinchart (2):
  drm: rcar-du: Don't select VSP1 sink on Gen3
  drm: rcar-du: Don't restart group when enabling plane on Gen3

 drivers/gpu/drm/rcar-du/rcar_du_plane.c | 12 ++++++++++--
 drivers/gpu/drm/rcar-du/rcar_du_vsp.c   |  9 ---------
 2 files changed, 10 insertions(+), 11 deletions(-)

-- 
Regards,

Laurent Pinchart

