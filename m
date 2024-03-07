Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAF36874C4D
	for <lists+dri-devel@lfdr.de>; Thu,  7 Mar 2024 11:23:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE07C113750;
	Thu,  7 Mar 2024 10:23:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACAA011374D
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Mar 2024 10:23:20 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1riAuE-0005j5-04; Thu, 07 Mar 2024 11:23:18 +0100
Message-ID: <72a783cd98d60f6ebb43b90a6b453eea87224409.camel@pengutronix.de>
Subject: [GIT PULL] etnaviv-next for 6.9
From: Lucas Stach <l.stach@pengutronix.de>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, etnaviv@lists.freedesktop.org, 
 kernel@pengutronix.de
Date: Thu, 07 Mar 2024 11:23:17 +0100
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave, Sima,

please pull the following etnaviv changes for the next merge window.

This time mostly code cleanups in preparation for PCI device support,
but also some changes required to get NPU support working with the
teflon userspace implementation. Christian also fixed the exposed chip
ID, which could get corrupted by HWDB matches in preparation of moving
most of the HWDB into userspace.

Except the chip id fix everything has been sitting in -next for quite a
while.

Regards,
Lucas

The following changes since commit 0bb80ecc33a8fb5a682236443c1e740d5c917d1d=
:

  Linux 6.6-rc1 (2023-09-10 16:28:41 -0700)

are available in the Git repository at:

  https://git.pengutronix.de/git/lst/linux tags/drm-etnaviv-next-2024-03-07

for you to fetch changes up to b735ee173f84d5d0d0733c53946a83c12d770d05:

  drm/etnaviv: Restore some id values (2024-03-07 10:57:54 +0100)

----------------------------------------------------------------
- various code cleanups
- enhancements for NPU and MRT support

----------------------------------------------------------------
Christian Gmeiner (2):
      drm/etnaviv: add sensitive state for PE_RT_ADDR_4_PIPE(3, 0|1) addres=
s
      drm/etnaviv: Restore some id values

Justin Stitt (1):
      drm/etnaviv: Replace strncpy with strscpy_pad

Lucas Stach (1):
      drm/etnaviv: disable MLCG and pulse eater on GPU reset

Sui Jingfeng (6):
      drm/etnaviv: Drop the second argument of the etnaviv_gem_new_impl()
      drm/etnaviv: Fix coding style
      drm/etnaviv: Add helper functions to create and destroy platform devi=
ce
      drm/etnaviv: Add a helper to get the first available GPU device node
      drm/etnaviv: Clean up etnaviv_gem_get_pages
      drm/etnaviv: Drop the 'len' parameter of etnaviv_iommu_map() function

Tomeu Vizoso (1):
      drm/etnaviv: Expose a few more chipspecs to userspace

 drivers/gpu/drm/etnaviv/etnaviv_cmd_parser.c |  1 +
 drivers/gpu/drm/etnaviv/etnaviv_drv.c        | 93 ++++++++++++++++++++++++=
++++++----------------
 drivers/gpu/drm/etnaviv/etnaviv_gem.c        | 12 +++---
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c        | 33 +++++++++++++++-
 drivers/gpu/drm/etnaviv/etnaviv_gpu.h        | 12 ++++++
 drivers/gpu/drm/etnaviv/etnaviv_hwdb.c       | 43 +++++++++++++++++++++
 drivers/gpu/drm/etnaviv/etnaviv_mmu.c        |  4 +-
 drivers/gpu/drm/etnaviv/etnaviv_perfmon.c    |  4 +-
 include/uapi/drm/etnaviv_drm.h               |  5 +++
 9 files changed, 163 insertions(+), 44 deletions(-)

