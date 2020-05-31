Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D8951EB66A
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jun 2020 09:17:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA87B6E348;
	Tue,  2 Jun 2020 07:16:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from muru.com (muru.com [72.249.23.125])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2E939897DC
 for <dri-devel@lists.freedesktop.org>; Sun, 31 May 2020 19:40:09 +0000 (UTC)
Received: from hillo.muru.com (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTP id B2143810A;
 Sun, 31 May 2020 19:40:55 +0000 (UTC)
From: Tony Lindgren <tony@atomide.com>
To: linux-omap@vger.kernel.org
Subject: [PATCH 0/5] Suspend and resume fixes for omapdrm pdata removal
Date: Sun, 31 May 2020 12:39:36 -0700
Message-Id: <20200531193941.13179-1-tony@atomide.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 02 Jun 2020 07:16:26 +0000
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
Cc: Nishanth Menon <nm@ti.com>, Tero Kristo <t-kristo@ti.com>,
 Grygorii Strashko <grygorii.strashko@ti.com>, Dave Gerlach <d-gerlach@ti.com>,
 Keerthy <j-keerthy@ti.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 "Andrew F . Davis" <afd@ti.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Faiz Abbas <faiz_abbas@ti.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Suman Anna <s-anna@ti.com>,
 linux-arm-kernel@lists.infradead.org, Roger Quadros <rogerq@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,

Recent omapdrm related changes to drop legacy platform data caused
a suspend and resume regression. I must have only tested suspend
and resume only with the changes preparing to drop the platform data,
but looks like I forgot to test suspend after dropping the platform
data.

There seem to be other longer term DSS regressions remaining too.
Looks like at least panel-simple currently does not probe. It fails
with "panel-simple display: Reject override mode: panel has a fixed
mode". I think the solution there is to drop the board specific
panel-timing related dts lines, but that still seems to be pending.
Anyways, no luck getting the LCD enabled on am437x-sk-evm with v5.6
or v5.7-rc kernels.

Regards,

Tony


Tony Lindgren (5):
  drm/omap: Fix suspend resume regression after platform data removal
  bus: ti-sysc: Use optional clocks on for enable and wait for softreset
    bit
  bus: ti-sysc: Ignore clockactivity unless specified as a quirk
  bus: ti-sysc: Fix uninitialized framedonetv_irq
  ARM: OMAP2+: Fix legacy mode dss_reset

 arch/arm/mach-omap2/omap_hwmod.c         |  2 +-
 drivers/bus/ti-sysc.c                    | 93 ++++++++++++++++++------
 drivers/gpu/drm/omapdrm/dss/dispc.c      |  6 +-
 drivers/gpu/drm/omapdrm/dss/dsi.c        |  6 +-
 drivers/gpu/drm/omapdrm/dss/dss.c        |  6 +-
 drivers/gpu/drm/omapdrm/dss/venc.c       |  6 +-
 drivers/gpu/drm/omapdrm/omap_dmm_tiler.c |  4 +-
 7 files changed, 79 insertions(+), 44 deletions(-)

-- 
2.26.2
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
