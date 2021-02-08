Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B2FE313208
	for <lists+dri-devel@lfdr.de>; Mon,  8 Feb 2021 13:18:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B8DF6E8A2;
	Mon,  8 Feb 2021 12:18:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.siol.net (mailoutvs5.siol.net [185.57.226.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 951716E8A2
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Feb 2021 12:18:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.siol.net (Zimbra) with ESMTP id AA79552249D;
 Mon,  8 Feb 2021 13:18:00 +0100 (CET)
X-Virus-Scanned: amavisd-new at psrvmta12.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
 by localhost (psrvmta12.zcs-production.pri [127.0.0.1]) (amavisd-new,
 port 10032)
 with ESMTP id qXiWpf59z7ur; Mon,  8 Feb 2021 13:18:00 +0100 (CET)
Received: from mail.siol.net (localhost [127.0.0.1])
 by mail.siol.net (Zimbra) with ESMTPS id 541CA522360;
 Mon,  8 Feb 2021 13:18:00 +0100 (CET)
Received: from kista.localdomain (cpe-86-58-58-53.static.triera.net
 [86.58.58.53]) (Authenticated sender: 031275009)
 by mail.siol.net (Zimbra) with ESMTPSA id 95FAF52234E;
 Mon,  8 Feb 2021 13:17:59 +0100 (CET)
From: Jernej Skrabec <jernej.skrabec@siol.net>
To: mripard@kernel.org,
	wens@csie.org
Subject: [PATCH v2 0/5] sunxi: fix H6 HDMI related issues
Date: Mon,  8 Feb 2021 13:17:47 +0100
Message-Id: <20210208121752.2255465-1-jernej.skrabec@siol.net>
X-Mailer: git-send-email 2.30.0
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
Cc: sboyd@kernel.org, mturquette@baylibre.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, airlied@linux.ie,
 linux-sunxi@googlegroups.com, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Over the year I got plenty of reports of troubles with H6 HDMI signal.
Sometimes monitor flickers, sometimes there was no image at all and
sometimes it didn't play well with AVR.

It turns out there are multiple issues. Patch 1 fixes clock issue,
which didn't adjust parent rate, even if it is allowed to do so. Patch 2
adds polarity config in tcon1. This is seemingly not needed for pre-HDMI2
controllers, although BSP drivers set it accordingly every time. It
turns out that HDMI2 controllers often don't work with monitors if
polarity is not set correctly. Patch 3 always set clock rate for HDMI
controller. Patch 4 fixes H6 HDMI PHY setting. Patch 5 fixes comment and
clock rate limit (wrong reasoning).

Please take a look.

Best regards,
Jernej

Changes from v1:
- collected Chen-Yu tags (except on replaced patch 4)
- Added some comments in patch 2
- Replaced patch 4 (see commit log for explanation)

Jernej Skrabec (5):
  clk: sunxi-ng: mp: fix parent rate change flag check
  drm/sun4i: tcon: set sync polarity for tcon1 channel
  drm/sun4i: dw-hdmi: always set clock rate
  drm/sun4i: Fix H6 HDMI PHY configuration
  drm/sun4i: dw-hdmi: Fix max. frequency for H6

 drivers/clk/sunxi-ng/ccu_mp.c          |  2 +-
 drivers/gpu/drm/sun4i/sun4i_tcon.c     | 25 +++++++++++++++++++++++++
 drivers/gpu/drm/sun4i/sun4i_tcon.h     |  6 ++++++
 drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c  | 10 +++-------
 drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h  |  1 -
 drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c | 26 +++++++++-----------------
 6 files changed, 44 insertions(+), 26 deletions(-)

--
2.30.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
