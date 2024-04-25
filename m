Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E358B2696
	for <lists+dri-devel@lfdr.de>; Thu, 25 Apr 2024 18:35:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7877711A60B;
	Thu, 25 Apr 2024 16:35:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EEB711A60C
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Apr 2024 16:35:00 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1s023m-00063Z-4T; Thu, 25 Apr 2024 18:34:58 +0200
Message-ID: <c24457dc18ba9eab3ff919b398a25b1af9f1124e.camel@pengutronix.de>
Subject: [GIT PULL] etnaviv-fixes for 6.9
From: Lucas Stach <l.stach@pengutronix.de>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: kernel@pengutronix.de, etnaviv@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
Date: Thu, 25 Apr 2024 18:34:57 +0200
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

please pull the following fixes for the upcoming -rc.

One small fix to properly disable TX clock gating on cores where it is
known to be broken.

The other patch is a bit more controversial, as it reverts a UAPI
change that was introduced in the last merge window to better support
NPUs. However, userspace decided to deduce the relevant properties from
the chip ID itself [1], so there is no need for this UAPI anymore. So
in hopes to keep this a blip in the 6.9-rc series, we are removing the
exported properties again.

Regards,
Lucas

[1] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/28574

The following changes since commit 4cece764965020c22cff7665b18a012006359095=
:

  Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)

are available in the Git repository at:

  https://git.pengutronix.de/git/lst/linux tags/drm-etnaviv-fixes-2024-04-2=
5

for you to fetch changes up to e877d705704d7c8fe17b6b5ebdfdb14b84c207a7:

  Revert "drm/etnaviv: Expose a few more chipspecs to userspace" (2024-04-2=
5 16:56:20 +0200)

----------------------------------------------------------------
- fix GC7000 TX clock gating
- revert NPU UAPI changes

----------------------------------------------------------------
Christian Gmeiner (1):
      Revert "drm/etnaviv: Expose a few more chipspecs to userspace"

Derek Foreman (1):
      drm/etnaviv: fix tx clock gating on some GC7000 variants

 drivers/gpu/drm/etnaviv/etnaviv_gpu.c  | 24 ++----------------------
 drivers/gpu/drm/etnaviv/etnaviv_gpu.h  | 12 ------------
 drivers/gpu/drm/etnaviv/etnaviv_hwdb.c | 34 ------------------------------=
----
 include/uapi/drm/etnaviv_drm.h         |  5 -----
 4 files changed, 2 insertions(+), 73 deletions(-)

