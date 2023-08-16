Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C2E177E50E
	for <lists+dri-devel@lfdr.de>; Wed, 16 Aug 2023 17:24:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCD5710E37E;
	Wed, 16 Aug 2023 15:24:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9DC210E37C
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Aug 2023 15:24:16 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1qWINa-0005Eh-9j; Wed, 16 Aug 2023 17:24:14 +0200
Message-ID: <f40c65f7ecfde2e61f1a6d7fd463f6f739bc0dd1.camel@pengutronix.de>
Subject: [GIT PULL] etnaviv-next for 6.6
From: Lucas Stach <l.stach@pengutronix.de>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Wed, 16 Aug 2023 17:24:13 +0200
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
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

Hi Dave, Daniel,

please pull the following etnaviv changes for the next merge window.=C2=A0

This time mostly cleanups around the runtime power management handling
and slightly improved GPU hang handling. Also some additions to the
HWDB to get the driver working properly on more NXP i.MX8MP IP cores.

Sorry for being late, vacation got in the way, all changes have been
soaking in linux-next for more than 3 weeks.

Regards,
Lucas

The following changes since commit ac9a78681b921877518763ba0e89202254349d1b=
:

  Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)

are available in the Git repository at:

  https://git.pengutronix.de/git/lst/linux etnaviv/next

for you to fetch changes up to 88c31d2dd191ab78e9ba9ff967845018aa7ee214:

  drm/etnaviv: fix error code in event_alloc() (2023-07-19 12:36:25 +0200)

----------------------------------------------------------------
Dan Carpenter (1):
      drm/etnaviv: fix error code in event_alloc()

Lucas Stach (12):
      drm/etnaviv: slow down FE idle polling
      drm/etnaviv: fix dumping of active MMU context
      drm/etnaviv: add HWDB entry for VIP8000 Nano r8002
      drm/etnaviv: add HWDB entry for GC520 r5341 c204
      drm/etnaviv: move down etnaviv_gpu_recover_hang() in file
      drm/etnaviv: free events the usual way in recover worker
      drm/etnaviv: move runtime PM handling to events
      drm/etnaviv: make clock handling symetric between runtime resume and =
suspend
      drm/etnaviv: avoid runtime PM usage in etnaviv_gpu_bind
      drm/etnaviv: better track GPU state
      drm/etnaviv: drop GPU initialized property
      drm/etnaviv: expedited MMU fault handling

Rob Herring (1):
      drm: etnaviv: Replace of_platform.h with explicit includes

 drivers/gpu/drm/etnaviv/etnaviv_buffer.c     |  11 +--
 drivers/gpu/drm/etnaviv/etnaviv_cmdbuf.c     |   3 +
 drivers/gpu/drm/etnaviv/etnaviv_drv.c        |   4 +-
 drivers/gpu/drm/etnaviv/etnaviv_dump.c       |  14 ++--
 drivers/gpu/drm/etnaviv/etnaviv_gem.h        |   1 -
 drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c |   3 -
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c        | 188 +++++++++++++++++++++++=
+---------------------
 drivers/gpu/drm/etnaviv/etnaviv_gpu.h        |  13 +++-
 drivers/gpu/drm/etnaviv/etnaviv_hwdb.c       |  63 +++++++++++++++
 drivers/gpu/drm/etnaviv/etnaviv_mmu.c        |   3 +
 drivers/gpu/drm/etnaviv/etnaviv_sched.c      |   5 +-
 11 files changed, 201 insertions(+), 107 deletions(-)
