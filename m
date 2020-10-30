Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F5462A0BCD
	for <lists+dri-devel@lfdr.de>; Fri, 30 Oct 2020 17:53:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4DD96EDF9;
	Fri, 30 Oct 2020 16:53:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D23546EDFA
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Oct 2020 16:53:41 +0000 (UTC)
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1kYXel-00044u-VD; Fri, 30 Oct 2020 17:53:39 +0100
Received: from pza by lupine with local (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1kYXej-0001ir-Ph; Fri, 30 Oct 2020 17:53:37 +0100
Message-ID: <7e4af582027bbec269364b95f6978d061b48271a.camel@pengutronix.de>
Subject: [GIT PULL] drm/imx: fixes and cleanups
From: Philipp Zabel <p.zabel@pengutronix.de>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 30 Oct 2020 17:53:37 +0100
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

The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

  Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the Git repository at:

  git://git.pengutronix.de/git/pza/linux.git tags/imx-drm-next-2020-10-30

for you to fetch changes up to 36fba366cf9fa386e5905976e68380061feabd2e:

  drm/imx: tve remove extraneous type qualifier (2020-10-27 10:30:09 +0100)

----------------------------------------------------------------
drm/imx: fixes and cleanups

Remove unused functions and empty callbacks, let the dw_hdmi-imx driver
reuse imx_drm_encoder_parse_of() instead of reimplementing it, replace
the custom register spinlock with the regmap default spinlock and remove
redundant tracking of enabled state in imx-tve, drop the explicit
drm_mode_config_cleanup() call in imx-drm-core, reduce the scope of edid
length variables that are not otherwise used in imx-ldb and
parallel-display, fix a memory leak in the parallel-display bind error
path, and drop an extraneous type qualifier from of_get_tve_mode().

----------------------------------------------------------------
Arnd Bergmann (1):
      drm/imx: tve remove extraneous type qualifier

Marco Felsch (1):
      drm/imx: parallel-display: fix edid memory leak

Philipp Zabel (9):
      gpu: ipu-v3: remove unused functions
      drm/imx: dw_hdmi-imx: use imx_drm_encoder_parse_of
      drm/imx: imx-tve: use regmap fast_io spinlock
      drm/imx: imx-tve: remove redundant enable tracking
      drm/imx: drop explicit drm_mode_config_cleanup
      drm/imx: dw_hdmi-imx: remove empty encoder_disable callback
      drm/imx: imx-ldb: reduce scope of edid_len
      drm/imx: parallel-display: remove unused function enc_to_imxpd()
      drm/imx: parallel-display: reduce scope of edid_len

 drivers/gpu/drm/imx/dw_hdmi-imx.c      | 17 ++-------
 drivers/gpu/drm/imx/imx-drm-core.c     | 10 ++---
 drivers/gpu/drm/imx/imx-ldb.c          | 10 ++---
 drivers/gpu/drm/imx/imx-tve.c          | 40 +++-----------------
 drivers/gpu/drm/imx/parallel-display.c | 20 ++--------
 drivers/gpu/ipu-v3/ipu-common.c        | 67 ----------------------------------
 include/video/imx-ipu-v3.h             |  3 --
 7 files changed, 21 insertions(+), 146 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
