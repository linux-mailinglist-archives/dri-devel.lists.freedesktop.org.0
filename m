Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 81EA868F708
	for <lists+dri-devel@lfdr.de>; Wed,  8 Feb 2023 19:36:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 192C410E816;
	Wed,  8 Feb 2023 18:36:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57DFE10E816
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Feb 2023 18:36:36 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1pPpJ4-0000rv-2H; Wed, 08 Feb 2023 19:36:34 +0100
Message-ID: <80ceb4eedf7d88e434deeb69607d5ce0a0759581.camel@pengutronix.de>
Subject: [GIT PULL] etnaviv-next for 6.3
From: Lucas Stach <l.stach@pengutronix.de>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Wed, 08 Feb 2023 19:36:33 +0100
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: l.stach@pengutronix.de
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
Cc: dri-devel@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
 kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave, hi Daniel,

please pull the following etnaviv changes for the next merge window.

This time we've added support for reporting of GPU load via the common
fdinfo format, as already supported by multiple other drivers. Improved
diagnostic messages for MMU faults. And finally added experimental
support for driving the VeriSilicon NPU cores, which are very close
relatives to the GPU designs, so close in fact that they can run the
same compute instruction set, but with a big NN-fabric/matrix/tensor
execution array glued to the side.

Regards,
Lucas

The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2=
:

  Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)

are available in the Git repository at:

  https://git.pengutronix.de/git/lst/linux etnaviv/next

for you to fetch changes up to 4c22c61e429f004d84eba72d7195bccef33ea0ec:

  drm/etnaviv: show number of NN cores in GPU debugfs info (2023-02-07 20:4=
9:55 +0100)

----------------------------------------------------------------
Christian Gmeiner (1):
      drm/etnaviv: print MMU exception cause

Lucas Stach (7):
      drm/etnaviv: update hardware headers from rnndb
      drm/etnaviv: split fence lock
      drm/etnaviv: convert user fence tracking to XArray
      drm/scheduler: track GPU active time per entity
      drm/etnaviv: allocate unique ID per drm_file
      drm/etnaviv: export client GPU usage statistics via fdinfo
      drm/etnaviv: show number of NN cores in GPU debugfs info

Paul Cercueil (1):
      drm/etnaviv: Remove #ifdef guards for PM related functions

Tomeu Vizoso (3):
      drm/etnaviv: Add nn_core_count to chip feature struct
      drm/etnaviv: Warn when probing on NPUs
      drm/etnaviv: add HWDB entry for VIPNano-QI.7120.0055

 drivers/gpu/drm/etnaviv/etnaviv_drv.c        | 54 ++++++++++++++++++++++++=
++++-
 drivers/gpu/drm/etnaviv/etnaviv_drv.h        |  5 +++
 drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c |  9 ++---
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c        | 66 +++++++++++++++++++++---=
-----------
 drivers/gpu/drm/etnaviv/etnaviv_gpu.h        |  8 +++--
 drivers/gpu/drm/etnaviv/etnaviv_hwdb.c       | 36 +++++++++++++++++++
 drivers/gpu/drm/etnaviv/etnaviv_sched.c      | 18 +++++-----
 drivers/gpu/drm/etnaviv/state_hi.xml.h       | 86 ++++++++++++++++++++++++=
+++++++++++++---------
 drivers/gpu/drm/scheduler/sched_main.c       |  6 ++++
 include/drm/gpu_scheduler.h                  |  7 ++++
 10 files changed, 238 insertions(+), 57 deletions(-)

